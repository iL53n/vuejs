<template lang="pug">
  div
    q-header(elevated class="bg-primary text-white")
      q-toolbar
        a(href="/")
          img(src="../../images/logoSC.png" alt="ServiseCentr" width="40" align="middle" )
        q-toolbar-title ЕВРОПРАКТИК
          q-badge(align="top" color="orange") v1.0.0b
        | {{ user.email }}
        div(class="q-pa-md q-gutter-sm")
          q-btn(color="white" size="10px")
            a(:href="'/' + userClass + '/sign_out'" data-method="delete") Выйти

      q-tabs(align="left")
        //q-route-tab(to="/index" name="root" label="Главная")
</template>

<script>
  import { backendGet } from '../../api/index'

  export default {
    data () {
      return {
        loading: false,
        error: false,
        user: {},
        userClass: 'client',
        message: ''
      }
    },
    created() {
      this.fetchUser();
    },
    methods: {
      fetchUser() {
        let vm = this;
        backendGet('/client/index/user')
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
    }
  }
</script>