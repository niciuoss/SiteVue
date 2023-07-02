import BaseModel from './BaseModel'
import CategoriaMaterial from "./CategoriaMaterial"

export default class TipoMaterial extends BaseModel {
  public nome?: string
  public categoria?: CategoriaMaterial | number

  constructor(public id?: number) {
    super(id)
  }

}
