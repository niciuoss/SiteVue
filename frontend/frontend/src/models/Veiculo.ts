import BaseModel from './BaseModel'
import Fornecedor from './Fornecedor'

export default class Veiculo extends BaseModel {
  public nome?: string
  public placa?: string

  public isExterno?: boolean = false
  public fornecedor?: Fornecedor | number

  constructor(public id?: number) {
    super(id)
  }

}
