import BaseModel from "./BaseModel"
import Destino from "./Destino"
import Fornecedor from "./Fornecedor"
import Maquina from "./Maquina"
import Produto from "./Produto"
import MaterialItem from "./MaterialItem"
import Veiculo from "./Veiculo"
import Motorista from './Motorista'
import { v5 as uuidv5, v4 as uuidv4 }  from 'uuid';

export class Saida extends BaseModel {
  public fornecedor?: Fornecedor
  public maquina?: Maquina
  public produto?: Produto
  public destino?: Destino
  public observacao?: string = ""
  public material_items: MaterialItem[] = []
  public tipo_saida: string = "SAIDA_PADRAO"
  public quantidade_produto?: number
  public code?: String
  public veiculo?: Veiculo
  public motorista?: Motorista

  constructor(public id?: number) {
    super(id)
  }

  addItemSaida(item: MaterialItem) {
    this.material_items.push(item)
  }

  public getAttributes() {
    const { id, ...attributes } = this;
    return attributes
  }

  generateCode(){
    this.code = uuidv5((this.fornecedor?.id+(new Date().getTime().toString())), uuidv4())
  }
}

export default Saida
