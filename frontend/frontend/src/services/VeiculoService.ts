import Fornecedor from '@/models/Fornecedor';
import HttpClient from '../infra/HttpClient';
import Veiculo from '../models/Veiculo';
import NotificacaoService from './NotificacaoService';

export default class VeiculoService {

	private notificacao: NotificacaoService

	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

	setNotificacao(notificacao: NotificacaoService) {
		this.notificacao = notificacao
	}

	async find(): Promise<Veiculo[]> {
		const veiculoData = await this.httpClient.get(`${this.baseUrl}/veiculos?populate=fornecedor`);
		const veiculos: Veiculo[] = [];
		for (const veiculoItem of veiculoData.data) {
      const veiculo = Object.assign(new Veiculo(veiculoItem.id), veiculoItem);

      if(veiculo.isExterno === null) {
        veiculo.isExterno = false
      }
      veiculo.fornecedor = Object.assign(new Fornecedor(), veiculoItem.fornecedor)

      veiculos.push(veiculo);
		}
		return veiculos;
	}

  async create(veiculo: Veiculo): Promise<Veiculo> {
    if(!veiculo.isExterno) {
      veiculo.fornecedor = null
    }

		const veiculoData = await this.httpClient.post(`${this.baseUrl}/veiculos`, {data: veiculo.getAttributes()}).then(data => {
			this.notificacao.add('Veículo cadastrado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao cadastrar') });

    return Object.assign(new Veiculo(veiculoData), veiculoData);
	}

	async update(veiculo: Veiculo): Promise<Veiculo> {
    if(!veiculo.isExterno) {
      veiculo.fornecedor = null
    }

		const veiculoData = await this.httpClient.put(`${this.baseUrl}/veiculos/${veiculo.id}`, {data: veiculo.getAttributes()}).then(data => {
			this.notificacao.add('Veículo atualizado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao atualizar') });
    return Object.assign(new Veiculo(veiculoData), veiculoData);
	}

	async delete(veiculo: Veiculo): Promise<Veiculo> {
		const veiculoData = await this.httpClient.delete(`${this.baseUrl}/veiculos/${veiculo.id}`).then(data => {
			this.notificacao.add('Veículo deletado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao deletar') });
		return new Veiculo();
	}

}
