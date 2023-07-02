import { defineStore } from 'pinia';
import AuthService from '../services/AuthService';
import Credentials from '../models/Credentials';
import Session from '../models/Session';
import Token from '@/models/Token';

export const useAuthStore = defineStore('authStore', {
	state: () => ({
		session: {} as Session,
		token: {} as Token,
		authService: undefined as AuthService | undefined,
	}),
	actions: {
		async login(credentials: Credentials) {
			const token = await this.authService?.login(credentials);
			if (token) {
        await this.getSession()
				this.router.push("/visao-geral");
			}
		},
    async getSession() {
			const session = await this.authService?.getSession();
			if (session) {
				this.session = new Session(session.username, session.role);
			}
		},
		logout () {
			localStorage.clear();
			this.session = new Session();
			this.router.push("/login");
		},

		init(authService: AuthService) {
			this.authService = authService;
		},
	},
});
