import Fornecedor from '@/models/Fornecedor';
import HttpClient from '../infra/HttpClient';
import Saida from '../models/Saida';
import Pagination from '../models/Pagination';
import Maquina from '@/models/Maquina';
import Produto from '@/models/Produto';
import NotificacaoService from './NotificacaoService';
//import MaterialItem from '@/models/MaterialItem';

export default class SaidaService {

	// private notificacao: NotificacaoService

	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

  async rastreio(code: String){
    const saidaData = await this.httpClient.post(`${this.baseUrl}/saidas/rastreio`, { params: {
      code: code
    }}).then(data => {
      return data.data;
    }).catch(() => { });
    return saidaData
  }

  async create(data: Saida){
    data.produto = data.produto?.id
    data.maquina = data.maquina?.id
		const saidaData = await this.httpClient.post(`${this.baseUrl}/saidas`, { data	}).then(data => {
			return data
		}).catch((err) => { });
		
		return saidaData
	}

	async find(paginationParams: Pagination, filter: string): Promise<{saidas: Saida[], pagination: Pagination }> {
		const saidaData = await this.httpClient.get(`${this.baseUrl}/saidas?populate=deep,4&pagination[page]=${paginationParams.page}&pagination[pageSize]=${paginationParams.pageSize}&${filter}`);
    const saidas: Saida[] = [];

		for (const saidaDataElement of saidaData.data) {
      const saida = Object.assign(new Saida(saidaDataElement.id), saidaDataElement);
      saida.fornecedor = Object.assign(new Fornecedor(saida.fornecedor?.id), saida.fornecedor)
      saida.maquina = Object.assign(new Maquina(saida.maquina?.id), saida.maquina);
      saida.produto = Object.assign(new Produto(saida.produto?.id), saida.produto);
      saidas.push(saida);
    }

    const pagination = new Pagination(saidaData.meta.pagination.page, saidaData.meta.pagination.pageSize,
      saidaData.meta.pagination.pageCount, saidaData.meta.pagination.total)
      return {saidas, pagination};
	}

  private getDTOSaida(saidaData: Saida) {
    if(saidaData.tipo_saida == 'SAIDA_PADRAO'){
      return {
        tipo_saida: saidaData.tipo_saida,
        observacao: saidaData.observacao,
        fornecedor: {
          id: saidaData.fornecedor?.id
        },
        veiculo: {
          id: saidaData.veiculo?.id
        },
        motorista: {
          id: saidaData.motorista?.id
        },
        material_items: saidaData.material_items.map(item => { return { id: item.id };})
      }
    }
    
    if(saidaData.tipo_saida == 'SAIDA_TRANSFORMACAO'){
      return {
        tipo_saida: saidaData.tipo_saida,
        observacao: saidaData.observacao,
        quantidade_produto: saidaData.quantidade_produto,
        maquina: {
          id: saidaData.maquina?.id
        },
        produto: {
          id: saidaData.produto?.id
        },
        material_items: saidaData.material_items.map(item => { return { id: item.id };})
      }
    }
  }
}
