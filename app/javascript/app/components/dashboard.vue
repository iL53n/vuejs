<template lang="pug">
    div
        table
            h3 {{ message }}
            tr
                th ID
                th FullName
                th Phone
                th Email
            tr(v-for="client in clientList")
                td {{ client.id }}
                td
                td
                td {{ client.email }}
</template>

<script>
  import { backendGet } from '../api/index'

  export default {
    data () {
      return {
        clientList: [],
        message: 'All clients'
      }
    },
    created() {
      this.fetchClients()
    },
    methods: {
      fetchClients() {
        let vm = this;
        backendGet('/client/welcome/clients')
            .then(function (response) {
              vm.clientList = response.data.clients
            })
            .catch(function (error) {
              console.log(error);
            })
            .finally(function () {
            });
      }
    }
  }
</script>

<style lang="scss">
    table {
        list-style-type: none;
        margin: 20px;
        font-family: "Helvetica Neue", Arial, sans-serif;
        border-spacing: 2px;
    }

    th {
        padding: 10px;
        color: white;
        background-color: lightslategrey;
    }

    td {
        padding: 10px;
        background-color: #e3e4f5;
    }
</style>