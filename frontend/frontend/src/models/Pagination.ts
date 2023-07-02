export default class Pagination {
  constructor(public page: number = 1, public pageSize: number = 10, public pageCount: number = 0, public total: number = 0) {}
}
