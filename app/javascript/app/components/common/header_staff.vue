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
          q-btn(
            type="a"
            color="white"
            size="10px"
            clickable
            :href="'/' + userClass + '/sign_out'"
            data-method="delete"
            text-color="primary"
            label="Выйти"
          )

      q-tabs(align="left")
        //q-route-tab(to="/index" name="root" label="Главная")
        q-route-tab(to="/organizations" name="organizations" label="Организации")
        q-route-tab(to="/clients" name="clients" label="Клиенты")
        q-route-tab(to="/equipments" name="equipments" label="Оборудование")
        q-route-tab(to="/staffs" name="staffs" label="Сотрудники")
</template>

<script>
  import { backendGet } from '../../api/index'

  export default {
    data () {
      return {
        loading: false,
        error: false,
        user: {},
        userClass: 'staff',
        message: ''
      }
    },
    created() {
      this.fetchUser();
    },
    methods: {
      fetchUser() {
        let vm = this;
        backendGet('/staff/index/user')
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