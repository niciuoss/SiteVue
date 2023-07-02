import Papel from './Papel'

export default class Usuario {
  public password?: string = ''
  public papel?: Papel
  public role?: number

  constructor(
    public id?: number,
    public username?: string,
    public cpf?: string,
    public email?: string,
    public telefone?: string,
    public provider?: string,
    public confirmed?: string,
    public blocked?: boolean,
    public createdAt?: boolean,
    public updatedAt?: string) {
    }


    setPapel(papel: Papel) {
      this.papel = papel;
    }

    public getAttributes() {
      const { id, ...attributes } = this;
      attributes['role'] = this.papel?.id
      attributes['password'] = this.password?.length ? this.password : this.email
      return attributes
    }

    public getUpdateAttributes() {
      const { id, password, ...attributes } = this;
      attributes['role'] = this.papel?.id
      return attributes
    }
  }
