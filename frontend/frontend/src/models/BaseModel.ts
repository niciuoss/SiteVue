export default abstract class BaseModel {
  public createdAt?: string = ""
  public updatedAt?: string
  public publishedAt?: string

  private readonly locale: string = 'pt-br'
  private readonly optionDate: any = { year: 'numeric', month: 'long', day: 'numeric' }

  constructor(public id?: number) {
  }

  getAttributes(): any {
    const { id, createdAt, updatedAt, publishedAt, locale, optionDate, ...attributes } = this;
    return attributes
  }

  getAttributesWithId(): any {
    const { createdAt, updatedAt, publishedAt, locale, optionDate, ...attributes } = this;
    return attributes
  }

  criadoEm(): any {
    return new Date(this.createdAt!).toLocaleDateString(this.locale, this.optionDate)
  }

}
