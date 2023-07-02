<script setup lang="ts">
import { useAuthStore } from '../../stores/AuthStore';
import { reactive } from 'vue';
import Credentials from '../../models/Credentials';

const credentials = reactive<Credentials>({ identifier: '', password: '' });

const authStore = useAuthStore();
</script>
<template>
  <q-layout view="lHh Lpr fff">
    <q-page-container>
      <q-page
        class="window-height window-width row justify-center items-center"
        style="background: #06404F"
      >
        <!-- <div class="column q-pa"> -->
        <div style="background-color: #9aa8a2; width: 100vw; display: flex; justify-content: end;">
          <div style="min-width: 200px; display: inline-block; align-items: center; margin: auto;">
            <q-img src="../../assets/logo.png"/>
          </div>
          <div class="row" style="border-radius: 40px 0px 0px 40px; overflow: hidden;">
            <q-card
              square
              class="shadow-24"
              style="width: 70vw; height: 100vh; display: flex; flex-direction: column; justify-content: center; padding: 50px;"
            >
              <q-card-section>
                <h4 class="text-h4 q-my-md">Olá! Seja bem-vindo(a)</h4>
                <br>
                <h4 class="text-h5 text-center q-my-md">Login</h4>
              </q-card-section>
              <q-card-section>
                <q-form class="q-px-sm q-pt-ml">
                  <q-input
                    square
                    type="email"
                    label="Email"
                    v-model="credentials.identifier"
                  >
                    <template v-slot:prepend>
                      <q-icon name="o_email" />
                    </template>
                  </q-input>

                  <q-input
                    square
                    type="password"
                    label="Senha"
                    v-model="credentials.password"
                    class="q-pt-lg"
                  >
                    <template v-slot:prepend>
                      <q-icon name="o_lock" />
                    </template>
                  </q-input>
                </q-form>
              </q-card-section>

              <q-card-actions class="q-pt-lg q-px-lg" style="justify-content: center;">
                <q-btn
                  style="width: 180px"
                  unelevated
                  size="lg"
                  color="primary"
                  class="text-white"
                  label="entrar"
                  @click="authStore.login(credentials)"
                />
                <q-btn
                  style="width: 180px"
                  unelevated
                  size="lg"
                  color="primary"
                  class="text-white"
                  label="cadastrar"
                />
              </q-card-actions>
            </q-card>
          </div>
        </div>
      </q-page>
    </q-page-container>
  </q-layout>
</template>
