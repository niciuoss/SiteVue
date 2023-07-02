import HttpClient from '../infra/HttpClient';
import Produto from '../models/Produto';
import NotificacaoService from './NotificacaoService';

export default class ProdutoService {

	private notificacao: NotificacaoService

	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

	setNotificacao(notificacao: NotificacaoService) {
		this.notificacao = notificacao
	}

	async find(): Promise<Produto[]> {
		const produtoData = await this.httpClient.get(`${this.baseUrl}/produtos`);
		const produtos: Produto[] = [];
		for (const produtoItem of produtoData.data) {
      const produto = Object.assign(new Produto(produtoItem.id), produtoItem)
			produtos.push(produto);
		}
		return produtos;
	}

  async create(produtoParams: Produto): Promise<Produto> {
		const produtoData = await this.httpClient.post(`${this.baseUrl}/produtos`, {data: produtoParams.getAttributes()}).then(data => {
			this.notificacao.add('Produto cadastrado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao cadastrar') });
    const produto = Object.assign(new Produto(produtoData.id), produtoData)
    return produto
	}

	async update(produtoParams: Produto): Promise<Produto> {
		const produtoData = await this.httpClient.put(`${this.baseUrl}/produtos/${produtoParams.id}`, {data: produtoParams.getAttributes()}).then(data => {
			this.notificacao.add('Produto atualizado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao atualizar') });
    const produto = Object.assign(new Produto(produtoData.id), produtoData)
    return produto
	}

	async delete(produtoParams: Produto): Promise<Produto> {
		const produtoData = await this.httpClient.delete(`${this.baseUrl}/produtos/${produtoParams.id}`).then(data => {
			this.notificacao.add('Produto deletado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao deletar') });
    const produto = Object.assign(new Produto(produtoData.id), produtoData)
    return produto
	}

}
