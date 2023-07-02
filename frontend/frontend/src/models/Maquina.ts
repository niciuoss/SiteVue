import BaseModel from './BaseModel'

export default class Maquina extends BaseModel {
  public nome?: string

  constructor(public id?: number) {
    super(id);
  }
}
