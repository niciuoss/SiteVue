import { reactive } from "vue";

export default class NotificacaoService {

	public notificacoes = reactive(new Array())

	public add(notificacao: any){
		this.notificacoes.push(notificacao);
	}

	public remove(notificacao: any){
		this.notificacoes.splice(notificacao, 1);''
	}

}
