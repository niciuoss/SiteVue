import Produto from '@/models/Produto';
import HttpClient from '../infra/HttpClient';
import Destino from '../models/Destino';
import NotificacaoService from './NotificacaoService';


export default class DestinoService {

	private notificacao: NotificacaoService

	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

	setNotificacao(notificacao: NotificacaoService) {
		this.notificacao = notificacao
	}

	async find(): Promise<Destino[]> {
		const destinoData = await this.httpClient.get(`${this.baseUrl}/destinos`);
		const destinos: Destino[] = [];
		for (const destinoItem of destinoData.data) {
      const destino = Object.assign(new Destino(destinoItem.id), destinoItem)
			destinos.push(destino);
		}
		return destinos;
	}

  async findAll(): Promise<Destino[]> {
    const countDestinos = await this.count()

    const { data: destinosData } = await this.httpClient.get(`${this.baseUrl}/destinos?pagination[pageSize]=${countDestinos}`);

    const destinos: Destino[] = [];
    for (const destinoItemData of destinosData) {
      const destino = Object.assign(new Destino(), destinoItemData);
      destinos.push(destino)
		}

    return destinos;
	}

  async create(destinoParams: Destino): Promise<Destino> {
		const destinoData = await this.httpClient.post(`${this.baseUrl}/destinos`, {data: destinoParams.getAttributes()}).then(data => {
			this.notificacao.add('Destino cadastrado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao cadastrar') });
    const destino = Object.assign(new Destino(destinoData.id), destinoData)
    return destino
	}

	async update(destinoParams: Destino): Promise<Destino> {
		const destinoData = await this.httpClient.put(`${this.baseUrl}/destinos/${destinoParams.id}`, {data: destinoParams.getAttributes()}).then(data => {
			this.notificacao.add('Destino atualizado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao atualizar') });
    const destino = Object.assign(new Destino(destinoData.id), destinoData)
    return destino
	}

	async delete(destinoParams: Destino): Promise<Destino> {
		const destinoData = await this.httpClient.delete(`${this.baseUrl}/destinos/${destinoParams.id}`).then(data => {
			this.notificacao.add('Destino deletado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao deletar') });
    const destino = Object.assign(new Destino(destinoData.id), destinoData)
    return destino
	}



  private async count() {
		const { meta } = await this.httpClient.get(`${this.baseUrl}/destinos?pagination[pageSize]=1`);

    return meta.pagination.total
  }



}
