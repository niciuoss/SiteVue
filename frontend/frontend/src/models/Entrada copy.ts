import BaseModel from "./BaseModel"
import Destino from "./Destino"
import Fornecedor from "./Fornecedor"
import TipoMaterial from "./TipoMaterial"

export class ItemEntrada extends BaseModel {
  public tipoMaterial?: TipoMaterial
  public quantidade?: number
  public isDisponivelEstoque?: boolean
  public dataSaida?: string

  constructor(public id?: number) { super(id) }

}

export class Entrada extends BaseModel {
  public fornecedor?: Fornecedor
  public destino?: Destino
  public observacao?: string = ""
  public itensEntradas: ItemEntrada[] = []

  constructor(public id?: number) {
    super(id)
  }

  addItemEntrada(item: ItemEntrada) {
    this.itensEntradas.push(item)
  }

  public getAttributes() {
    const { id, ...attributes } = this;
    return attributes
  }

}

export default { Entrada, ItemEntrada }
