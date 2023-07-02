import HttpClient from '../infra/HttpClient';
import AuthService from '../services/AuthService';
import FornecedorService from '../services/FornecedorService';
import UsuarioService from '../services/UsuarioService';
import PapelService from '../services/PapelService';
import MaterialService from '../services/MaterialService';
import MaquinaService from '../services/MaquinaService';
import ProdutoService from '../services/ProdutoService';
import DestinoService from '../services/DestinoService';
import MotoristaService from '../services/MotoristaService';
import VeiculoService from '../services/VeiculoService';
import EntradaService from '../services/EntradaService';
import NotificacaoService from '../services/NotificacaoService';
import SaidaService from '../services/SaidaService';
import UploadService from '../services/UploadService';
import ArquivoService from '@/services/ArquivoService';
import MaterialItemService from '@/services/MaterialItemService';

export default class ServiceFactory {
	public notificacao: NotificacaoService

	constructor(readonly httpClient: HttpClient, readonly baseUrl: string) {
		this.notificacao = new NotificacaoService();
	}

	createAuthService() {
		return new AuthService(this.httpClient, this.baseUrl);
	}
	
	createUploadService() {
		const service = new UploadService(this.httpClient, this.baseUrl);

		return service;
	}
	
	createArquivoService() {
		const service = new ArquivoService(this.httpClient, this.baseUrl);

		return service;
	}
	createAnexoService() {
		const service = new AnexoService(this.httpClient, this.baseUrl);

		return service;
	}

	createFornecedorService() {
		const service = new FornecedorService(this.httpClient, this.baseUrl);
		service.setNotificacao(this.notificacao);
		
		return service
	}

	createUsuarioService() {
		const service = new UsuarioService(this.httpClient, this.baseUrl);
		service.setNotificacao(this.notificacao);
		
		return service
	}

	createPapelService() {
		return new PapelService(this.httpClient, this.baseUrl);
	}

	createMaterialService() {
		const service = new MaterialService(this.httpClient, this.baseUrl);
		service.setNotificacao(this.notificacao);

		return service;
	}

	createMaquinaService() {
		const service = new MaquinaService(this.httpClient, this.baseUrl);
		service.setNotificacao(this.notificacao);

		return service;
	}

  createProdutoService() {
    const service = new ProdutoService(this.httpClient, this.baseUrl);
		service.setNotificacao(this.notificacao);

		return service;
  }

  createDestinoService() {
    const service = new DestinoService(this.httpClient, this.baseUrl);
		service.setNotificacao(this.notificacao);

		return service;
  }

  createMotoristaService() {
    const service = new MotoristaService(this.httpClient, this.baseUrl);
		service.setNotificacao(this.notificacao);

		return service;
  }

  createVeiculoService() {
    const service = new VeiculoService(this.httpClient, this.baseUrl);
		service.setNotificacao(this.notificacao);

		return service;
  }

  createEntradaService() {
    return new EntradaService(this.httpClient, this.baseUrl);
  }

  createSaidaService() {
    return new SaidaService(this.httpClient, this.baseUrl);
  }
  
	createMaterialItemService() {
		return new MaterialItemService(this.httpClient, this.baseUrl);
	}

  getNotificacaoService() {
    return this.notificacao;
  }

}
