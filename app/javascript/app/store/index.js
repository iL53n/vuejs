import Vue from 'vue';
import Vuex from 'vuex';
import createPersistedState from 'vuex-persistedstate';
import orgMod from './modules/organizations'

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    currentUser: null
  },
  mutations: {
    updateCurrentUser(state, value) {
      state.currentUser = value
    }
  },
  actions: {},
  modules: {
    orgMod
  },
  plugins: [createPersistedState()]
})