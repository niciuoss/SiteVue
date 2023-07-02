import BaseModel from './BaseModel'
import TipoMaterial from './TipoMaterial'

export default class CategoriaMaterial extends BaseModel {
  public nome?: string
  public tipos: TipoMaterial[] = []

  constructor(public id?: number) {
    super(id)
  }

  addTipoMaterial(tipoMaterial: TipoMaterial) {
    this.tipos.push(tipoMaterial);
  }

}
