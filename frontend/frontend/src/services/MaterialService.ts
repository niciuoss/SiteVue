import HttpClient from '../infra/HttpClient';
import CategoriaMaterial from '../models/CategoriaMaterial';
import TipoMaterial from '../models/TipoMaterial';
import NotificacaoService from './NotificacaoService';

export default class MaterialService {

	private notificacao: NotificacaoService

	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

	setNotificacao(notificacao: NotificacaoService) {
		this.notificacao = notificacao
	}

	async find(): Promise<CategoriaMaterial[]> {
		const categoriaData = await this.httpClient.get(`${this.baseUrl}/categoria-materiais?populate=tipos`);
		const categorias: CategoriaMaterial[] = [];

    for (const categoriaItem of categoriaData.data) {
      categorias.push(Object.assign(new CategoriaMaterial(categoriaItem.id), categoriaItem));
    }
    return categorias;

	}

  async findAllCategoria(): Promise<CategoriaMaterial[]> {
    const countCategorias = await this.countCategoriaMaterial()

    const { data: categoriasMaterialData } = await this.httpClient.get(`${this.baseUrl}/categoria-materiais?populate=deep,2&pagination[pageSize]=${countCategorias}`);

    const categoriasMaterial: CategoriaMaterial[] = [];

    for (const categoriaMaterialItemData of categoriasMaterialData) {
      const { tipos, ...categoria } = categoriaMaterialItemData
      const categoriaMaterial = Object.assign(new CategoriaMaterial(), categoria);

      for (const tipoMaterialItemData of categoriaMaterialItemData.tipos) {
        const tipoMaterial = Object.assign(new TipoMaterial(), tipoMaterialItemData);
        categoriaMaterial.addTipoMaterial(tipoMaterial)
      }

      categoriasMaterial.push(categoriaMaterial)
		}

    return categoriasMaterial;
	}

  async createCategoria(categoriaParams: CategoriaMaterial): Promise<CategoriaMaterial> {
    console.log('categoriaParams.getAttributes() ', categoriaParams.getAttributes())
		const categoriaData = await this.httpClient.post(`${this.baseUrl}/categoria-materiais`, {data: categoriaParams.getAttributes()}).then(data => {
			this.notificacao.add('Categoria cadastrada com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao cadastrar') });
    const categoriaMaterial = Object.assign(new CategoriaMaterial(categoriaData.id), categoriaData);
    return categoriaMaterial
	}

	async updateCategoria(categoriaParams: CategoriaMaterial): Promise<CategoriaMaterial> {
		const categoriaData = await this.httpClient.put(`${this.baseUrl}/categoria-materiais/${categoriaParams.id}`, {data: categoriaParams.getAttributes()}).then(data => {
			this.notificacao.add('Categoria atualizado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao atualizar') });
    const categoriaMaterial = Object.assign(new CategoriaMaterial(categoriaData.id), categoriaData);
    return categoriaMaterial

	}

	async deleteCategoria(categoriaParams: CategoriaMaterial): Promise<CategoriaMaterial> {
		const categoriaData = await this.httpClient.delete(`${this.baseUrl}/categoria-materiais/${categoriaParams.id}`).then(data => {
			this.notificacao.add('Categoria deletada com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao deletar') });
    const categoriaMaterial = Object.assign(new CategoriaMaterial(categoriaData.id), categoriaData);
    return categoriaMaterial

	}

  async createTipoMaterial(tipoMaterialParams: TipoMaterial): Promise<TipoMaterial> {
    console.log('verify if contains categoria: ', tipoMaterialParams)
		const tipoMaterialData = await this.httpClient.post(`${this.baseUrl}/tipos-materiais`, {data: tipoMaterialParams.getAttributes()}).then(data => {
			this.notificacao.add('Material cadastrado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao cadastrar') });
    const tipoMaterial = Object.assign(new TipoMaterial(tipoMaterialData.id), tipoMaterialData);
		console.log(tipoMaterial.id);
		return tipoMaterial
	}

  async updateTipoMaterial(tipoMaterialParams: TipoMaterial): Promise<TipoMaterial> {
		const tipoMaterialData = await this.httpClient.put(`${this.baseUrl}/tipos-materiais/${tipoMaterialParams.id}`, {data: tipoMaterialParams.getAttributes()}).then(data => {
			this.notificacao.add('Material atualizado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao atualizar') });
    const tipoMaterial = Object.assign(new TipoMaterial(tipoMaterialData.id), tipoMaterialData);
		return tipoMaterial
	}

	async deleteTipoMaterial(tipoMaterialParams: TipoMaterial): Promise<TipoMaterial> {
		const tipoMaterialData = await this.httpClient.delete(`${this.baseUrl}/tipos-materiais/${tipoMaterialParams.id}`).then(data => {
			this.notificacao.add('Material deletado com successo')
			return data;
		}).catch(() => { this.notificacao.add('Erro ao deletar') });
    const tipoMaterial = Object.assign(new TipoMaterial(tipoMaterialData.id), tipoMaterialData);
		return tipoMaterial

  }


  private async countCategoriaMaterial() {
		const { meta } = await this.httpClient.get(`${this.baseUrl}/categoria-materiais?pagination[pageSize]=1`);

    return meta.pagination.total
  }


}
