import Fornecedor from '../models/Fornecedor';
import HttpClient from '../infra/HttpClient';
import Motorista from '../models/Motorista';
import NotificacaoService from './NotificacaoService';

export default class MotoristaService {
	private notificacao: NotificacaoService

	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

	setNotificacao(notificacao: NotificacaoService) {
		this.notificacao = notificacao
	}

	async find(): Promise<Motorista[]> {
		const motoristaData = await this.httpClient.get(`${this.baseUrl}/motoristas?populate=fornecedor`);
		const motoristas: Motorista[] = [];
		for (const motoristaItem of motoristaData.data) {
      const motorista = Object.assign(new Motorista(motoristaItem.id), motoristaItem);

      if(motorista.isExterno === null) {
        motorista.isExterno = false
      }

      motorista.fornecedor = Object.assign(new Fornecedor(), motorista.fornecedor)

			motoristas.push(motorista);
		}
		return motoristas;
	}

  async create(motoristaParams: Motorista): Promise<Motorista> {
    if(!motoristaParams.isExterno) {
      motoristaParams.fornecedor = null
    }


		const motoristaData = await this.httpClient.post(`${this.baseUrl}/motoristas`, {data: motoristaParams.getAttributes()}).then(data => {
			this.notificacao.add('Motorista cadastrado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao cadastrar') });
    const motorista = Object.assign(new Motorista(motoristaData.id), motoristaData);
		return motorista;
	}

	async update(motoristaParams: Motorista): Promise<Motorista> {
    if(!motoristaParams.isExterno) {
      motoristaParams.fornecedor = null
    }

		const motoristaData = await this.httpClient.put(`${this.baseUrl}/motoristas/${motoristaParams.id}`, {data: motoristaParams.getAttributes()}).then(data => {
			this.notificacao.add('Motorista atualizado com successo')
			return data;
		}).catch(() => {
      this.notificacao.add('Erro ao atualizar')
    });
    const motorista = Object.assign(new Motorista(motoristaData.id), motoristaData);
		return motorista;
	}

	async delete(motoristaParams: Motorista): Promise<Motorista> {
		const motoristaData = await this.httpClient.delete(`${this.baseUrl}/motoristas/${motoristaParams.id}`).then(data => {
			this.notificacao.add('Motorista deletado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao deletar') });
    const motorista = Object.assign(new Motorista(motoristaData.id), motoristaData);
		return motorista;
	}

}
