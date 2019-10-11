<!--<template lang="pug">-->
<!--  div(v-if="loading")-->
<!--    p Loading...-->
<!--  div(v-else)-->
<!--    div(v-if="error")-->
<!--      p Error!-->
<!--    div(v-else)-->
<!--      navmenu(:user="user" userClass="client" :key="user.id")-->
<!--      p {{ message }}-->
<!--</template>-->

<!--<script>-->
<!--  import { backendGet } from './api/index'-->

<!--  export default {-->
<!--    data () {-->
<!--      return {-->
<!--        loading: true,-->
<!--        error: false,-->
<!--        user: {},-->
<!--        message: '>>> Client Vue <<<'-->
<!--      }-->
<!--    },-->
<!--    created() {-->
<!--      this.fetchUser();-->
<!--    },-->
<!--    methods: {-->
<!--      fetchUser() {-->
<!--        this.loading = false;-->
<!--        let vm = this;-->
<!--        backendGet('/client/welcome/user')-->
<!--            .then((response) => {-->
<!--              vm.user = response.data.user-->
<!--            })-->
<!--            .catch((error) => {-->
<!--              console.log(error);-->
<!--              this.error = true-->
<!--            })-->
<!--            .finally(() => {-->
<!--              vm.loading = false-->
<!--            });-->
<!--      },-->
<!--    },-->
<!--    components: {-->
<!--      Navmenu-->
<!--    }-->
<!--  }-->
<!--</script>-->

<!--<style lang="scss">-->
<!--</style>-->