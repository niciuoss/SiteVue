export default class Papel {
  constructor(
    public id: number,
    public name: string,
    public description: string) {
    }

    public getRelationId() {
      return {id: this.id} as Papel
    }
}
