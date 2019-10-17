<template lang="pug">

  div
    div(v-if="loading")
      q-page-container(align="middle")
        q-spinner(color="primary" size="7em" :thickness="10")
    div(v-else)
      div(v-if="error")
        p Error!
      div(v-else)
        q-page-sticky(expand position="top")
          q-toolbar(class="bg-secondary text-white")
            q-toolbar-title(align="middle")
              | Клиенты
        .q-pa-md
          q-table(name="clients", :title="title", :data="data", :columns="columns", row-key="id" no-data-label="Нет информации о клиентах!")
            template(v-slot:body-cell-action="props")
              q-td(:props="props")
                q-btn(push color="white" text-color="secondary" label="Редактировать" @click="show = !show")
                  edit-client(:obj="props.row", :show="show")

                q-btn(push color="white" text-color="negative" label="Удалить"  @click="deleteClient(props.row)" method="delete")

          create-client(@add-client="fetchClients")
</template>

<script>
  import { backendGet } from '../../api'
  import { backendDelete } from '../../api'
  import CreateClient from '../forms/create_client'
  import EditClient from '../forms/edit_client'
  import { Notify } from 'quasar'

  export default {
    data () {
      return {
        columns: [
          { name: 'id', align: 'center', label: 'ID', field: 'id', sortable: true },
          { name: 'fullname', align: 'center', label: 'Полное имя', field: 'fullname', sortable: true },
          { name: 'phone', label: 'Телефон', field: 'phone', sortable: true },
          { name: 'email', label: 'Email', field: 'email', sortable: true },
          { name: 'action', field: ['edit', 'delete'] }
        ],
        data: [],
        title: '',
        loading: true,
        show: false,
        errors: {}
      }
    },
    created() {
      this.fetchClients();
    },
    methods: {
      fetchClients() {
        backendGet('/staff/clients')
            .then((response) => {
              this.data = response.data.clients
            })
            .catch((error) => {
              console.log(error);
              this.error = true
            })
            .finally(() => {
              this.loading = false
            });
      },
      deleteClient(obj) {
        backendDelete('/staff/clients/', obj.id)
          .then((response) => {
            this.fetchClients();
            Notify.create({
              message: "Клиент '" + obj.fullname + "' удален!",
              color: 'negative'
            })
          })
          .catch((error) => {
            console.log(error);
            this.error = true
          });
      },
    },
    components: {
      CreateClient,
      EditClient,
      Notify
    }
  }
</script>