import Fornecedor from '@/models/Fornecedor';
import HttpClient from '../infra/HttpClient';
import Entrada from '../models/Entrada';
import MaterialItem from '@/models/MaterialItem';
import Pagination from '../models/Pagination';
import Destino from '../models/Destino';
import Arquivo from '../models/Arquivo';
import NotificacaoService from './NotificacaoService';

export default class EntradaService {
  private notificacao: NotificacaoService

	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {
    this.notificacao = new NotificacaoService()
  }

  async create(entradaParams: Entrada): Promise<Entrada> {

    this.getDTOEntrada(entradaParams)

    debugger
    const entradaData = await this.httpClient.post(`${this.baseUrl}/entradas/create-all`, {data: this.getDTOEntrada(entradaParams)})
      .then(data => {
        this.notificacao.add('Entrada cadastrado com successo')

        return data;
      })
      .catch(() => { this.notificacao.add('Erro ao cadastrar') });

      return entradaData
  }

	async find(paginationParams: Pagination, filter: string): Promise<{entradas: Entrada[], pagination: Pagination }> {
		const entradaData = await this.httpClient.get(`${this.baseUrl}/entradas?populate=deep,4&pagination[page]=${paginationParams.page}&pagination[pageSize]=${paginationParams.pageSize}&${filter}`);

    const entradas: Entrada[] = [];

    for (const entradaDataElement of entradaData.data) {
      const entrada = Object.assign(new Entrada(entradaDataElement.id), entradaDataElement);
      entrada.fornecedor = Object.assign(new Fornecedor(entrada.fornecedor.id), entrada.fornecedor);
      entrada.destino = Object.assign(new Destino(entrada.destino.id), entrada.destino);
      entradas.push(entrada);
    }

    const pagination = new Pagination(entradaData.meta.pagination.page, entradaData.meta.pagination.pageSize,
      entradaData.meta.pagination.pageCount, entradaData.meta.pagination.total)

    return {entradas, pagination};
	}

  async findOne(idEntrada: number){

		const entradaData = (await this.httpClient.get(`${this.baseUrl}/entradas/${idEntrada}?populate=deep`)).data;

    const entrada = Object.assign(new Entrada(entradaData.id), entradaData);
    entrada.fornecedor = Object.assign(new Fornecedor(entrada.destino.id), entrada.fornecedor);
    entrada.destino = Object.assign(new Destino(entrada.destino.id), entrada.destino);
    entrada.arquivos = []

    try{
        for(const itemMediaDataElement of entradaData.arquivos){
          const itemMedia = {
            id: itemMediaDataElement.id,
            nome: itemMediaDataElement.nome,
            extensao: itemMediaDataElement.extensao,
            tamanho: itemMediaDataElement.tamanho,
            url: itemMediaDataElement.url,
            id_media: itemMediaDataElement.id_media
          }
          entrada.addArquivo(itemMedia as unknown as MaterialItem)
        }
      }catch(e){
        entrada.arquivos = {}
      }


    return entrada;
	}

  async insertFile(arquivos: Arquivo[], entradaId: number){
    let idsAnexos = []
    try{
      const anexos = (await this.findOne(entradaId)).arquivos
      for(const anexo of anexos){
        idsAnexos.push(anexo.id)
      }
    }catch(e){}
    arquivos.forEach(arquivo => {
      idsAnexos.push(arquivo.id)
    });
    await this.httpClient.put(`${this.baseUrl}/entradas/${entradaId}`, {data: {arquivos: idsAnexos}}).then(data => {
        //return data
    }).catch(() => {  });
    //return fileData
  }

  private getDTOEntrada(entrada: Entrada) {
    return {
      "observacao": entrada.observacao ? entrada.observacao : "",
      "fornecedor": {
          "id": entrada.fornecedor?.id,
      },
      "destino": {
          "id": entrada.destino?.id
      },
      "material_items": entrada.material_items.map(item => {
        return {
          quantidade: item.quantidade,
          categoria_material: {id: item.categoriaMaterial?.id},
          tipo_material: {id: item.tipoMaterial?.id},
        };
    })}
  }
}
