<template lang="pug">
  div(v-if="loading")
    q-spinner(color="primary" size="3em" :thickness="10")
  div(v-else)
    div(v-if="error")
      p Error!
    div(v-else)
      navmenu(:user="user" userClass="staff" :key="user.id")
      dashboard
      p {{ message }}
</template>

<script>
  import Navmenu from './components/navbar'
  // import Dashboard from './components/dashboard'
  import { backendGet } from './api/index'

  export default {
    data () {
      return {
        loading: true,
        error: false,
        user: {},
        message: ''
      }
    },
    created() {
      this.fetchUser();
    },
    methods: {
      fetchUser() {
        let vm = this;
        backendGet('/staff/welcome/user')
            .then((response) => {
              vm.user = response.data.user
            })
            .catch((error) => {
              console.log(error);
              this.error = true
            })
            .finally(() => {
              vm.loading = false
            });
      },
    },
    components: {
      Navmenu
      // Dashboard
    }
  }
</script>

<style lang="scss">
</style>