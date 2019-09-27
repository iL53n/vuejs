<template lang="pug">
    div(v-if="loading")
        p Loading...
    div(v-else)
        div(v-if="error")
            p Error!
        div(v-else)
            navbar(:user="user" :key="user.id")
            p {{ message }}
            dashboard
</template>

<script>
  import Navbar from './components/navbar'
  import Dashboard from './components/dashboard'
  import { backendGet } from './api/index'

  export default {
    data () {
      return {
        loading: true,
        error: false,
        user: '',
        message: '>>>>>>CLIENT VUE<<<<<<'
      }
    },
    created() {
      this.fetchUser();
    },
    methods: {
      fetchUser() {
        this.loading = false
        let vm = this;
        backendGet('/client/welcome/user')
            .then(function (response) {
              vm.user = response.data.user
            })
            .catch(function (error) {
              console.log(error);
              this.error = true
            })
            .finally(function () {
              vm.loading = false
            });
      },
    },
    components: {
      Navbar,
      Dashboard
    }
  }
</script>

<style lang="scss">
</style>