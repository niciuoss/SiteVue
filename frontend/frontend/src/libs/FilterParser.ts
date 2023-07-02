export default class FilterParser {
  private itemArrayToFilterString = (filterName: any, item: any, index: any) => {
    return `${filterName}[${index}]=${item}`;
  }

  public queryFilterString(filterName: any, array: any) {
    if (filterName && !Array.isArray(array)) {
      throw new Error('Por favor, verifique seus paramentros');
    }
    return array.map(((item: any, index: any) => this.itemArrayToFilterString(filterName, item, index))).join('&')
  }
}
