import Arquivo from '@/models/Arquivo';
import { Meta } from 'quasar';
import HttpClient from '../infra/HttpClient';
import Fornecedor from '../models/Fornecedor';
import Pagination from '../models/Pagination';
import NotificacaoService from './NotificacaoService';

export default class AuthService {
	private notificacao: NotificacaoService

	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

	setNotificacao(notificacao: NotificacaoService) {
		this.notificacao = notificacao
	}

	async find(paginationParams: Pagination, filter: string): Promise<{fornecedores: Fornecedor[], pagination: Pagination }> {
		const fornecedorDataFilter = await this.httpClient.get(`${this.baseUrl}/fornecedores?pagination[page]=${paginationParams.page}&pagination[pageSize]=${paginationParams.pageSize}&${filter}`);

    const pagination = new Pagination(fornecedorDataFilter.meta.pagination.page, fornecedorDataFilter.meta.pagination.pageSize,
      fornecedorDataFilter.meta.pagination.pageCount, fornecedorDataFilter.meta.pagination.total)

      const fornecedores: Fornecedor[] = [];
		for (const fornecedorItem of fornecedorDataFilter.data) {
      		const modelFornecedor = Object.assign(new Fornecedor(fornecedorItem.id), fornecedorItem);

      		fornecedores.push(modelFornecedor)
		}

    return { fornecedores, pagination };
	}

  async findOne(fornecedorId: number): Promise<Fornecedor> {
    const {data: fornecedorData} = await this.httpClient.get(`${this.baseUrl}/fornecedores/${fornecedorId}?populate=deep`);

    console.log({fornecedorData})

    const fornecedor = Object.assign(new Fornecedor(fornecedorData.id), fornecedorData);

		for(const itemMediaDataElement of fornecedorData.arquivos){
			const itemMedia = {
				id: itemMediaDataElement.id,
				nome: itemMediaDataElement.nome,
				extensao: itemMediaDataElement.extensao,
				tamanho: itemMediaDataElement.tamanho,
				url: itemMediaDataElement.url,
				id_media: itemMediaDataElement.id_media
			}
			fornecedor.addArquivo(itemMedia as unknown as Arquivo)
			console.log(itemMedia)
		}

    return fornecedor
	}

	async findAll(): Promise<Fornecedor[]> {
    const countFornecedores = await this.count()

    const { data: fornecedoresData } = await this.httpClient.get(`${this.baseUrl}/fornecedores?pagination[pageSize]=${countFornecedores}`);

    const fornecedores: Fornecedor[] = [];
    for (const fornecedorItemData of fornecedoresData) {
      const fornecedor = Object.assign(new Fornecedor(), fornecedorItemData);
      fornecedores.push(fornecedor)
		}

    return fornecedores;
	}

  async create(fornecedorParams: Fornecedor): Promise<Fornecedor> {
		const fornecedorData = await this.httpClient.post(`${this.baseUrl}/fornecedores`, {data: fornecedorParams.getAttributes()}).then(data => {
			this.notificacao.add('Fornecedor cadastrado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao cadastrar') });
    const fornecedor = Object.assign(new Fornecedor(fornecedorData.id), fornecedorData);
		return fornecedor;
	}

	async update(fornecedorParams: Fornecedor): Promise<Fornecedor> {
    const fornecedorData = await this.httpClient.put(`${this.baseUrl}/fornecedores/${fornecedorParams.id}`, {data: fornecedorParams.getAttributes()});
    const fornecedor = Object.assign(new Fornecedor(fornecedorData.id), fornecedorData);
		return fornecedor;
	}

	async insertFile(arquivos: Arquivo[], fornecedorId: number){
		let idsAnexos = []
		try{
		  const anexos = (await this.findOne(fornecedorId)).arquivos
		  for(const anexo of anexos){
			idsAnexos.push(anexo.id)
		  }
		}catch(e){}
		arquivos.forEach(arquivo => {
			idsAnexos.push(arquivo.id)
		});
		await this.httpClient.put(`${this.baseUrl}/fornecedores/${fornecedorId}`, {data: {arquivos: idsAnexos}}).then(data => {
			console.log("Anexo adicionado com sucesso!")
			//return data
		}).catch(() => {  });
		//return fileData
	}

  private async count() {
		const { meta } = await this.httpClient.get(`${this.baseUrl}/fornecedores?pagination[pageSize]=1`);

    return meta.pagination.total
  }
}
