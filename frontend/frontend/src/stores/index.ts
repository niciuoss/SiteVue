import { markRaw } from 'vue'
import { createPinia } from 'pinia';
import { Router } from 'vue-router';
import router from '../router'

declare module 'pinia' {
  export interface PiniaCustomProperties {
    router: Router;
  }
}

const pinia = createPinia();

pinia.use(({ store }) => {
	store.router = markRaw(router)
});

export default pinia;



