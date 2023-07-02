import HttpClient from '../infra/HttpClient';
import Papel from '../models/Papel';

export default class PapelService {
	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

	async find(): Promise<Papel[]> {
		const roleData = await this.httpClient.get(`${this.baseUrl}/users-permissions/roles`);
		const papeis: Papel[] = [];

    for (const roleItem of roleData.roles) {
      if(roleItem.name === 'ADMINISTRADOR' || roleItem.name === 'OPERADOR_ESTOQUE') {
        papeis.push(new Papel(roleItem.id, roleItem.name, roleItem.description));
      }
		}

		return papeis;
	}

}

