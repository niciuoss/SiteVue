import BaseModel from './BaseModel'

export default class Produto extends BaseModel {
  public nome?: string

  constructor(public id?: number) {
    super(id)
  }
}

