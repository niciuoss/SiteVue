import HttpClient from '../infra/HttpClient';
import Arquivo from '../models/Arquivo';

export default class ArquivoService {

	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

  async create(arquivos: Arquivo[]): Promise<Arquivo>{
    let filesData = []

    await arquivos.forEach(arquivo => {
      this.httpClient.post(`${this.baseUrl}/arquivos`, {
        data: {
          nome: arquivo.nome,
          url: arquivo.url,
          extensao: arquivo.extensao,
          tamanho: (arquivo.tamanho)?.toString(),
          id_media: (arquivo.idMedia)?.toString()
        }
      }).then(data => {
        filesData.push(data.data)
      }).catch((err) => { });
    });

    return filesData
  }

    async delete(id: Number){
        const anexoData = await this.httpClient.delete(`${this.baseUrl}/arquivos/${id}`);
        return true
    }
  }
