import HttpClient from '../infra/HttpClient';
import Entrada from '../models/Entrada';
import MaterialItem from '../models/MaterialItem';

export default class MaterialItemService {

  constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

  async create(data: MaterialItem): Promise<MaterialItem> {
    const materialItemsData = await this.httpClient.post(`${this.baseUrl}/material-items`, {data}).then(data => {
      return data
    }).catch(() => {});
    const materialItem = Object.assign(new Entrada(materialItemsData.id), materialItemsData);
    return materialItemsData
  }

	async find(filter: string) {
    const materialItems: MaterialItem[] = [];

    const materialItemsData = await this.httpClient.get(`${this.baseUrl}/material-items?populate=deep&${filter}`);
    for(const materialItemDataElement of materialItemsData.data) {
      const materialItem = Object.assign(new MaterialItem(materialItemDataElement.id), materialItemDataElement)

      materialItems.push(materialItem)
    }

    return materialItems
	}

  async findDisponiveis(filter: string) {
    const materialItems: MaterialItem[] = [];

    const materialItemsData = await this.httpClient.get(`${this.baseUrl}/material-items?populate=deep,3&${filter}`);
    for(const materialItemDataElement of materialItemsData.data) {
      const materialItem = Object.assign(new MaterialItem(materialItemDataElement.id), materialItemDataElement)

      materialItems.push(materialItem)
    }

    return materialItems
	}
}
