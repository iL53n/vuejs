<template>
  <div>
    <navbar :user=user :key=user.id @sign-out="signOut"></navbar>
  </div>
</template>

<script>
  import Navbar from './navbar'
  import axios from 'axios'

  export default {
    data () {
      return {
        user: ''
      }
    },
    created() {
      let vm = this
      axios.get('/client/user')
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
      signOut() {
        // this.user.signout
      }
    },
    components: {
      Navbar
    }
  }
</script>

<style>
</style>