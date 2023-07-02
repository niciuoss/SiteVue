import Arquivo from './Arquivo'
import BaseModel from './BaseModel'

export default class Fornecedor extends BaseModel {
  public nome?: string
  public tipo: string = "FORNECEDOR"
  public isDestinatario: boolean = false
  public isAtivo: boolean = true
  public cnpjcpf?: string
  public email?: string
  public telefone?: string
  public cep?: string
  public rua?: string
  public numero?: string
  public bairro?: string
  public cidade?: string
  public estado?: string
  public horarioColeta?: string
  public arquivos?: Arquivo[] = []

  constructor(public id?: number) {
    super(id)
  }

  getEndereco() {
    return `${this.rua ? this.rua + ', ' : ''}
        ${this.numero ? this.numero + ', ' : ''}
        ${this.bairro ? this.bairro + ', ' : ''}
        ${this.cidade ? this.cidade + ', ' : ''}
        ${this.estado ? this.estado + (this.cep ? ',': '') : ''}
        ${this.cep ? this.cep : ''}`
  }

  addArquivo(item: Arquivo){
    this.arquivos?.push(item)
  }
}


