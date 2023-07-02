import BaseModel from "./BaseModel"
import Destino from "./Destino"
import Fornecedor from "./Fornecedor"
import Arquivo from "./Arquivo"
import MaterialItem from './MaterialItem'
import CategoriaMaterial from "./CategoriaMaterial"
import TipoMaterial from "./TipoMaterial"

export default class Entrada extends BaseModel {
  public fornecedor?: Fornecedor
  public destino?: Destino
  public observacao?: string = ""
  public material_items: MaterialItem[] = []
  public arquivos?: Arquivo[] = []

  constructor(public id?: number) {
    super(id)
  }

  addMaterialItem(materialParams: MaterialItem) {
    const material = new MaterialItem();

    material.categoriaMaterial = new CategoriaMaterial(materialParams.categoriaMaterial?.id)
    material.categoriaMaterial.nome = materialParams.categoriaMaterial?.nome

    material.tipoMaterial = new TipoMaterial(materialParams.tipoMaterial?.id)
    material.tipoMaterial.nome = materialParams.tipoMaterial?.nome

    material.quantidade = materialParams.quantidade

    //saida: materialItemData.attributes.saida

    this.material_items.push(material)
  }

  removeMaterialItem(materialParams: MaterialItem) {
    const index = this.material_items.indexOf(materialParams);
    this.material_items.splice(index, 1)
  }

  addArquivo(item: Arquivo){
    this.arquivos?.push(item)
  }

  public getAttributes() {
    const { id, ...attributes } = this;
    return attributes
  }
}
