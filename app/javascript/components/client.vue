<template lang="pug">
  div
    navbar(:user="user" :key="user.id")
    p {{ message }}
</template>

<script>
  import Navbar from './navbar'
  import axios from 'axios'

  export default {
    data () {
      return {
        user: '',
        message: '>>>>>>CLIENT VUE<<<<<<'
      }
    },
    created() {
      let vm = this
      axios.get('/client/welcome/user')
        .then(function (response) {
          vm.user = response.data.user
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        })
        .finally(function () {
          // always executed
        });
    },
    methods: {
    },
    components: {
      Navbar
    }
  }
</script>

<style lang="scss">
</style>