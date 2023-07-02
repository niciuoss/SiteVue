import HttpClient from '../infra/HttpClient';
import Arquivo from '../models/Arquivo';

export default class AnexoService {
	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

  async upload(files: File[]){
	let formData = new FormData();
	files.forEach(file => {
		formData.append('files', file)
	});
	let filesUploaded = [];
	const filesData = await this.httpClient.post(`${this.baseUrl}/upload`, formData).then(data => {
		return data;
	}).catch(() => {  });
	for(const fileData of filesData){
		const fileUploaded = new Arquivo()
		fileUploaded.id = fileData.id,
		fileUploaded.nome = fileData.name,
		fileUploaded.extensao = fileData.ext,
		fileUploaded.tamanho = fileData.size,
		fileUploaded.url = fileData.url,
		fileUploaded.createdAt = fileData.createdAt,
		fileUploaded.idMedia = fileData.id,
		fileUploaded.updatedAt = fileData.updatedAt
		filesUploaded.push(fileUploaded)
	}
	return filesUploaded
  }

  async getUrlBase(){
	return (this.baseUrl).split("/api")[0]
  }

  async delete(id: Number){
	const anexoData = await this.httpClient.delete(`${this.baseUrl}/upload/files/${id}`);
	return true
}
}
