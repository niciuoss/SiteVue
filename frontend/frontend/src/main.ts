import { createApp } from 'vue'
import { Quasar } from 'quasar'
import quasarLang from 'quasar/lang/pt-BR'
import { Notify } from 'quasar'


import '@quasar/extras/roboto-font/roboto-font.css'
import iconSet from 'quasar/icon-set/material-icons-outlined'
import '@quasar/extras/material-icons-outlined/material-icons-outlined.css'
import 'quasar/src/css/index.sass'

import './style.css'

import AxiosAdapter from './infra/AxiosAdapter'
import ServiceFactory from './factory/ServiceFactory'
import { useAuthStore } from './stores/AuthStore'

import router from './router'
import pinia from './stores'

import App from './App.vue'

import VueAnnouncer from '@vue-a11y/announcer'

const httpClient = new AxiosAdapter();
httpClient.setRouter(router)
const serviceFactory = new ServiceFactory(httpClient, "http://localhost:1337/api");

const app = createApp(App)

app.use(Quasar, {
  extras: ['material-icons-outlined'],
  iconSet: iconSet,
  plugins: {Notify}, VueAnnouncer,
  lang: quasarLang,
})

app.use(router);

app.use(pinia);

const authStore = useAuthStore();
authStore.init(serviceFactory.createAuthService());

app.provide("serviceFactory", serviceFactory);

app.mount('#app')
