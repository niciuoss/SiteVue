import BaseModel from "./BaseModel"

export default class Media extends BaseModel {
    public small_url?: String
    public medium_url?: String
    public large_url?: String
    public thumbnail_url?: String
    public url?: String
  
    constructor(public id?: number){
      super(id)
    }
}