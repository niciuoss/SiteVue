import HttpClient from '../infra/HttpClient';
import Usuario from '../models/Usuario';
import Papel from '@/models/Papel';
import NotificacaoService from './NotificacaoService';


export default class UsuarioService {

  private notificacao: NotificacaoService

	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {}

  setNotificacao(notificacao: NotificacaoService) {
		this.notificacao = notificacao
	}


  async me(): Promise<Usuario> {
    const usuarioData = await this.httpClient.get(`${this.baseUrl}/users/me?populate=role`);
    const usuario = new Usuario(
      usuarioData.id,
      usuarioData.username,
      usuarioData.cpf,
      usuarioData.email,
      usuarioData.telefone,
      usuarioData.provider,
      usuarioData.confirmed,
      usuarioData.blocked,
      usuarioData.createdAt,
      usuarioData.updatedAt)


      usuario.setPapel(new Papel(usuarioData.role.id, usuarioData.role.name, usuarioData.role.description));

      return usuario
  }

	async find(): Promise<{usuarios: Usuario[] }> {
		const usuarioData = await this.httpClient.get(`${this.baseUrl}/users?populate=role`);
		const usuarios: Usuario[] = usuarioData;

    return {usuarios};
	}

	async findOne(usuarioId: Number): Promise<Usuario> {
		const usuarioData = await this.httpClient.get(`${this.baseUrl}/users/${usuarioId}?populate=role`);
    const usuario = new Usuario(
      usuarioData.id,
      usuarioData.username,
      usuarioData.cpf,
      usuarioData.email,
      usuarioData.telefone,
      usuarioData.provider,
      usuarioData.confirmed,
      usuarioData.blocked,
      usuarioData.createdAt,
      usuarioData.updatedAt)


      usuario.setPapel(new Papel(usuarioData.role.id, usuarioData.role.name, usuarioData.role.description));

      return usuario
    }

    async create(usuarioParams: Usuario): Promise<Usuario> {
      const usuarioData = await this.httpClient.post(`${this.baseUrl}/users?populate=role`, usuarioParams.getAttributes()).then(data => {
        this.notificacao.add('Usuário cadastrado com successo')
        return data;
      }).catch(() => { this.notificacao.add('Erro ao cadastrar') });
      const usuario = usuarioData as Usuario
      return usuario
	}

	async update(usuarioParams: Usuario): Promise<Usuario> {
		const usuarioData = await this.httpClient.put(`${this.baseUrl}/users/${usuarioParams.id}`, usuarioParams.getUpdateAttributes());
    const usuario = new Usuario(
      usuarioData.id,
      usuarioData.username,
      usuarioData.email,
      usuarioData.provider,
      usuarioData.confirmed,
      usuarioData.blocked,
      usuarioData.createdAt,
      usuarioData.updatedAt)

    usuario.setPapel(new Papel(usuarioData.role.id, usuarioData.role.name, usuarioData.role.description));

		return usuario;
	}

}
