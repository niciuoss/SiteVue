import BaseModel from "./BaseModel"
import Entrada from "./Entrada"
import Saida from "./Saida"
import CategoriaMaterial from "./CategoriaMaterial"
import TipoMaterial from "./TipoMaterial"

export default class MaterialItem extends BaseModel {
  public categoriaMaterial?: CategoriaMaterial
  public tipoMaterial?: TipoMaterial
  public quantidade?: number
  public isDisponivelEstoque?: boolean
  public dataSaida?: string
  public entrada?: Entrada
  public saida?: Saida

  constructor(public id?: number) {
    super(id)
  }

}
