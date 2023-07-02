import HttpClient from '../infra/HttpClient';
import Maquina from '../models/Maquina';
import NotificacaoService from './NotificacaoService';

export default class MaquinaService {

	private notificacao: NotificacaoService

	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

	setNotificacao(notificacao: NotificacaoService) {
		this.notificacao = notificacao
	}

	async find(): Promise<Maquina[]> {
		const maquinaData = await this.httpClient.get(`${this.baseUrl}/maquinas`);
		const maquinas: Maquina[] = [];
		for (const maquinaItem of maquinaData.data) {
      const maquina = Object.assign(new Maquina(maquinaItem.id), maquinaItem);
			maquinas.push(maquina);
		}
		return maquinas;
	}

  async create(maquinaParams: Maquina): Promise<Maquina> {
		const maquinaData = await this.httpClient.post(`${this.baseUrl}/maquinas`, {data: maquinaParams.getAttributes()}).then(data => {
			this.notificacao.add('Máquina cadastrada com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao cadastrar') });
    const maquina = Object.assign(new Maquina(maquinaData.id), maquinaData);
    return maquina
	}

	async update(maquinaParams: Maquina): Promise<Maquina> {
		const maquinaData = await this.httpClient.put(`${this.baseUrl}/maquinas/${maquinaParams.id}`, {data: maquinaParams.getAttributes()}).then(data => {
			this.notificacao.add('Máquina atualizada com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao atualizar') });
    const maquina = Object.assign(new Maquina(maquinaData.id), maquinaData);
    return maquina
	}

	async delete(maquinaParams: Maquina): Promise<Maquina> {
		const maquinaData = await this.httpClient.delete(`${this.baseUrl}/maquinas/${maquinaParams.id}`).then(data => {
			this.notificacao.add('Máquina deletada com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao deletar') });
    const maquina = Object.assign(new Maquina(maquinaData.id), maquinaData);
    return maquina
	}

}
