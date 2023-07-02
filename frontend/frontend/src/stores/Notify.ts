import { defineStore } from 'pinia';

export const useNotifyStore = defineStore('notifyStore', {
	state: () => ({
		notificacoes: []
	}),
	actions: {
		async add(msg: string) {
			this.notificacoes.push(msg)
		},
	},
});
