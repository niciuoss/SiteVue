import BaseModel from './BaseModel'
import Fornecedor from './Fornecedor'

export default class Motorista extends BaseModel {
  public nome?: string
  public cpf?: string
  public cnh?: string
  public telefone?: string

  public isExterno?: boolean = false
  public fornecedor?: Fornecedor | number

  constructor(public id?: number) {
    super(id)
  }

}
