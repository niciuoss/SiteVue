import BaseModel from './BaseModel'
import Fornecedor from './Fornecedor'

export default class Destino extends BaseModel {
  public nome?: string
  public cep?: string
  public rua?: string
  public numero?: string
  public bairro?: string
  public cidade?: string
  public estado?: string

  constructor(public id?: number) {
    super(id)
  }

  getEndereco() {
    return `${this.rua ? this.rua + ', ' : ''}
        ${this.numero ? this.numero + ', ' : ''}
        ${this.bairro ? this.bairro + ', ' : ''}
        ${this.cidade ? this.cidade + ', ' : ''}
        ${this.estado ? this.estado + (this.cep ? ',': '') : ''}
        ${this.cep ? this.cep : ''}
        `
  }

}
