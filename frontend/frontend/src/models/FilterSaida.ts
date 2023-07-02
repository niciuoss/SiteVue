import CategoriaMaterial from "./CategoriaMaterial"
import TipoMaterial from "./TipoMaterial"

export class FilterSaida {
  public dataInicial: string = ""
  public dataFinal: string = ""
  public categoriaMaterial: string = ""
  public tipoMaterial: string = ""
  public tipoFornecedor: string = ""
  public nomeFornecedor: string = ""
  private filterArray: string[] = []
  public filtroAtivo: boolean = false

  public categoria?: CategoriaMaterial = new CategoriaMaterial()
  public tipo?: TipoMaterial

  constructor() {}

  public fn() {
    this.buildFilter();
    return this.filterArray.join('&');
  }

  private buildFilter() {
    this.filterArray = []

    this.addDataFilter()
    this.addCategoriaMaterial()
    this.addTipoMaterial()
    this.addTipoFornecedor()
    this.addNomeFornecedor()
  }

  private addDataFilter() {
    const dataInicialFn = this.dataInicial.split('/').reverse().join('-')
    const dataFinalFn = this.dataFinal.split('/').reverse().join('-')

    if((dataInicialFn && dataInicialFn.length > 0) && (dataFinalFn && dataFinalFn.length > 0)) {
      this.filterArray.push(`filters[createdAt][$between][0]=${dataInicialFn}T00:00:00.000&filters[createdAt][$between][1]=${dataFinalFn}T23:59:59.999`)
    } else if(dataInicialFn) {
      this.filterArray.push(`filters[createdAt][$gte]=${dataInicialFn}T00:00:00.000`)
    } else if(dataFinalFn) {
      this.filterArray.push(`filters[createdAt][$lte]=${dataFinalFn}T23:59:59.999`)
    }
  }

  private addCategoriaMaterial() {
    if(this.categoriaMaterial && this.categoriaMaterial.length > 0) {
      this.filterArray.push(`filters[material_items][tipo_material][categoria][nome][$eq]=${this.categoriaMaterial.trim()}`)
    }
  }

  private addTipoMaterial() {
    if(this.tipoMaterial && this.tipoMaterial.length > 0) {
      this.filterArray.push(`filters[material_items][tipo_material][nome][$eq]=${this.tipoMaterial.trim()}`)
    }
  }

  private addTipoFornecedor() {
    if(this.tipoFornecedor && this.tipoFornecedor.length > 0) {
      this.filterArray.push(`filters[fornecedor][tipo][$eq]=${this.tipoFornecedor.trim()}`)
    }
  }

  private addNomeFornecedor() {
    if(this.nomeFornecedor && this.nomeFornecedor.length > 0) {
      this.filterArray.push(`filters[fornecedor][nome][$startsWith]=${this.nomeFornecedor.trim()}`)
    }
  }

}

export default { FilterSaida }
