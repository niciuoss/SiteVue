import BaseModel from "./BaseModel"

export default class Arquivo extends BaseModel {
    public nome?: String
    public extensao?: String
    public tamanho?: String
    public url?: String
    public idMedia?: String
    
    constructor(public id?: number){
      super(id)
    }
}