import { defineStore } from 'pinia';
import { Fornecedor } from 'src/domain/model/Fornecedor';

export const useFornecedorStore = defineStore('fornecedorStore', {
	state: () => ({
		fornecedores: new Map() as Map<number, Fornecedor>,
	}),
	getters: {
		todos(state) {
			return Array.from(state.fornecedores.values());
		},
		getFornecedorById: (state) => {
			return (fornecedorId: number) => state.fornecedores.get(fornecedorId)
		},
	},
	actions: {
		salvar(fornecedorParams: Fornecedor) {
			fornecedorParams.id = Math.floor(Math.random()*10000);
			this.fornecedores.set(fornecedorParams.id, fornecedorParams);
			this.router.push({ name: 'GerenciarFornecedor' });
		},
		editar(fornecedorParams: Fornecedor){
			this.fornecedores.set(fornecedorParams.id, fornecedorParams);
			this.router.push({ name: 'GerenciarFornecedor' });
		}
	},
});
