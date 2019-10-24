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
          q-table(name="clients", :title="title", :data="data", :columns="columns", row-key="id", no-data-label="Нет информации о клиентах!")
            template(v-slot:body-cell-organizations="props")
              q-td
                | {{ props.row.organizations.map(org => org.form_of_owership + "\"" + org.title + "\"").join(", ") }}
            template(v-slot:body-cell-action="props")
              q-td(align="right")
                q-btn(push color="white" text-color="secondary" label="Сбросить пароль" @click="resetPassClient(props.row)")
                q-btn(push color="white" text-color="primary" label="Редактировать" @click="editClient(props.row)")
                q-btn(push color="white" text-color="negative" label="Удалить"  @click="deleteClient(props.row)" method="delete")
          q-page-sticky(expand position="bottom-left")
            q-btn(push round color="primary" size="20px" @click="createClient()") +

          router-view(@edit-client="fetchClients" @create-client="fetchClients")
</template>

<script>
  import { backendGet } from '../../api'
  import { backendPost } from '../../api'
  import { backendDelete } from '../../api'
  import CreateClient from '../forms/create_client'
  import EditClient from '../forms/edit_client'
  import { Notify } from 'quasar'

  export default {
    data () {
      return {
        columns: [
          { name: 'id', align: 'left', label: 'ID', field: 'id', sortable: true },
          { name: 'fullname', align: 'left', label: 'Полное имя', field: 'fullname', sortable: true },
          { name: 'organizations', align: 'center', label: 'Организация(-ии)', field: '', sortable: true },
          { name: 'phone', align: 'center', label: 'Телефон', field: 'phone', sortable: true },
          { name: 'email', align: 'center', label: 'Email', field: 'email', sortable: true },
          { name: 'action', align: 'center', field: ['reset_pass', 'edit', 'delete'] }
        ],
        data: [],
        title: '',
        loading: true,
        errors: {}
      }
    },
    computed: {
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
            this.errors = true
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
            this.errors = true
          });
      },
      createClient() {
        this.$router.push({ name: 'createClient'})
      },
      editClient(row) {
        this.$router.push({ name: 'editClient', params: { id: row.id }})
      },
      resetPassClient(obj) {
        backendPost(`/staff/clients/${obj.id}/reset_pass`)
          .then((response) => {
            Notify.create({
              message: "Инструкция отправлена на почту:" + obj.email,
              color: 'positive'
            })
          })
          .catch((error) => {
            console.log(error);
            this.errors = true
          });
      }
    },
    components: {
      CreateClient,
      EditClient,
      Notify
    }
  }
</script>