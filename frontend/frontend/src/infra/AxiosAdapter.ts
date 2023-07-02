import axios from 'axios';
import HttpClient from './HttpClient';

export default class AxiosAdapter implements HttpClient {
	router: any;

	constructor() {
		axios.interceptors.request.use((config: any) => {
			const token = localStorage.getItem('token');
      config.headers['Authorization'] = `Bearer ${ token? token : '' }`;
      return config;
		});

    axios.interceptors.response.use((response) => {
      return response;
    }, (error) => {
      if (error.code === 'ERR_NETWORK'
        || localStorage.getItem('token') == null
        || error.response.status === 401
        || error.response.status === 403) {
        localStorage.removeItem("token");
        this.router.push("/login");
      }

      return Promise.reject(error);
    })
  }

  async get(url: string): Promise<any> {
		const response = await axios({ url, method: 'get' });
		return response.data;
	}

	async post(url: string, data: any): Promise<any> {
		const response = await axios({ url, method: 'post', data });
		return response.data;
	}

  async put(url: string, data: any): Promise<any> {
    const response = await axios({ url, method: 'put', data });
    return response.data
  }

  async delete(url: string): Promise<any> {
		const response = await axios({ url, method: 'delete' });
		return response.data;
  }

  setRouter(router: any) {
    this.router = router
  }
}
