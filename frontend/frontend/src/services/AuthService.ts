import HttpClient from '../infra/HttpClient';
import Credentials from '../models/Credentials';
import Session from '../models/Session';
import Token from '../models/Token';

export default class AuthService {
	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

	async login(credentials: Credentials): Promise<Token> {
		const tokenData = await this.httpClient.post(`${this.baseUrl}/auth/local`, credentials);
		const token = new Token(tokenData.jwt);
    localStorage.setItem("token", token.jtw);
		return token;
	}

  async getSession(): Promise<Session> {
		const sessionData = await this.httpClient.get(`${this.baseUrl}/users/me?populate=role`);
    const session = new Session(sessionData.username, sessionData.role.name);
    return session;
	}

  async changePassword(changePasswordParams: any) {
		const changePasswordData = await this.httpClient.post(`${this.baseUrl}/auth/change-password`, changePasswordParams);
    localStorage.setItem("token", changePasswordData.jtw);
  }

}