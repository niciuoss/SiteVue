import { RouteRecordRaw } from 'vue-router';
import Login from '../pages/Login/Login.vue';
import VisaoGeral from '../pages/VisaoGeral/VisaoGeral.vue';
import Rastreabilidade from '../pages/Publico/Rastreabilidade/Rastreabilidade.vue';

const routes: RouteRecordRaw[] = [
  {
    path: '/',
    name: 'Home',
    component: () => import('../components/Layouts/Layout.vue'),
    beforeEnter: () => {
    },
    children: [
      {
        path: 'perfil',
        name: 'Perfil',
        component: () => import('../pages/Perfil/PerfilEditar.vue'),
      },
      {
        path: 'visao-geral',
        name: 'Visao.geral',
        component: VisaoGeral,
      },
      {
        path: 'entradas',
        name: 'Entrada',
        children: [
          {
            path: 'cadastro',
            name: 'Entrada.cadastro',
            component: () => import('../pages/Entrada/EntradaCadastrar.vue'),
          },
          {
            path: 'gerenciamento',
            name: 'Entrada.gerenciamento',
            component: () => import('../pages/Entrada/EntradaGerenciamento.vue'),
          },
          {
            path: 'anexos/:entradaId',
            name: 'Entrada.anexos',
            component: () => import('../pages/Entrada/EntradaAnexos.vue'),

            props: route=> ({...route.params, entradaId: parseInt(String(route.params.entradaId))})
          },
        ]
      },
      {
        path: 'saidas',
        name: 'Saida',
        children: [
          {
            path: 'gerenciamento',
            name: 'Saida.gerenciamento',
            component: () => import('../pages/Saida/SaidaGerenciamento.vue'),
          },
          {
            path: 'anexos/:saidaId',
            name: 'Saida.anexos',
            component: () => import('../pages/Saida/SaidaAnexos.vue'),

            props: route=> ({...route.params, saidaId: parseInt(String(route.params.saidaId))})
          },
          {
            path: 'cadastro',
            name: 'Saida.cadastro',
            component: () => import('../pages/Saida/SaidaCadastro.vue'),
          },
        ]
      },
      {
        path: 'fornecedores',
        name: 'Fornecedor',
        children: [
          {
            path: 'gerenciamento',
            name: 'Fornecedor.gerenciamento',
            component: () => import('../pages/Fornecedor/FornecedorGerenciamento.vue'),
          },
          {
            path: 'editar/:fornecedorId',
            name: 'Fornecedor.editar',
            component: () => import('../pages/Fornecedor/FornecedorEditar.vue'),

            props: route=> ({...route.params, fornecedorId: parseInt(String(route.params.fornecedorId))})
          },
          {
            path: 'anexos/:fornecedorId',
            name: 'Fornecedor.anexos',
            component: () => import('../pages/Fornecedor/FornecedorAnexos.vue'),

            props: route=> ({...route.params, fornecedorId: parseInt(String(route.params.fornecedorId))})
          },
          {
            path: 'cadastro',
            name: 'Fornecedor.cadastro',
            component: () => import('../pages/Fornecedor/FornecedorCadastrar.vue'),
          },
        ]
      },
      {
        path: 'transportes',
        name: 'Transporte',
        children: [
          {
            path: 'gerenciamento',
            name: 'Transporte.gerenciamento',
            component: () => import('../pages/Transporte/TransporteGerenciamento.vue'),
          },
        ]
      },
      {
        path: 'parametrizacao',
        name: 'Parametrizacao',
        children: [
          {
            path: 'gerenciamento',
            name: 'Parametrizacao.gerenciamento',
            component: () => import('../pages/Parametrizacao/ParametrizacaoGerenciamento.vue'),
          },
        ]
      },
      {
        path: 'usuarios',
        name: 'Usuario',
        children: [
          {
            path: 'gerenciamento',
            name: 'Usuario.gerenciamento',
            component: () => import('../pages/Usuario/UsuarioGerenciamento.vue'),
          },
          {
            path: 'editar/:usuarioId',
            name: 'Usuario.editar',
            component: () => import('../pages/Usuario/UsuarioEditar.vue'),
            props: route=> ({...route.params, usuarioId: parseInt(String(route.params.usuarioId))})
          },
          {
            path: 'cadastro',
            name: 'Usuario.cadastro',
            component: () => import('../pages/Usuario/UsuarioCadastrar.vue'),
          },
        ]
      },
    ]
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/qrcode/:code',
    name: 'qrcode',
    component: Rastreabilidade,
    props: route=> ({...route.params, code: String(route.params.code)})
  },
	{
		path: '/:catchAll(.*)*',
		component: () => import('../pages/ErrorNotFound.vue'),
	},
];

export default routes;

