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
              | Сотрудники
        .q-pa-md
          q-table(name="Staffs", :title="title", :data="data", :columns="columns", row-key="id" no-data-label="Нет информации о сотрудниках!")
            template(v-slot:body-cell-action="props")
              q-td(:props="props")
                q-btn(push color="white" text-color="secondary" label="Редактировать" @click="editStaff(props.row)")
                q-btn(push color="white" text-color="negative" label="Удалить"  @click="deleteStaff(props.row)" method="delete")
          router-view(@edit-staff="fetchStaffs")
          create-staff(@add-staff="fetchStaffs")
</template>

<script>
  import { backendGet } from '../../api'
  import { backendDelete } from '../../api'
  import CreateStaff from '../forms/create_staff'
  import EditStaff from '../forms/edit_staff'
  import { Notify } from 'quasar'

  export default {
    data () {
      return {
        columns: [
          { name: 'id', align: 'center', label: 'ID', field: 'id', sortable: true },
          { name: 'email', label: 'Email', field: 'email', sortable: true },
          { name: 'action', field: ['edit', 'delete'] }
        ],
        data: [],
        title: '',
        loading: true,
        errors: {}
      }
    },
    created() {
      this.fetchStaffs();
    },
    methods: {
      fetchStaffs() {
        backendGet('/staff/staffs')
            .then((response) => {
              this.data = response.data.staffs
            })
            .catch((error) => {
              console.log(error);
              this.error = true
            })
            .finally(() => {
              this.loading = false
            });
      },
      deleteStaff(obj) {
        backendDelete('/staff/staffs/', obj.id)
          .then((response) => {
            this.fetchStaffs();
            Notify.create({
              message: "Сотрудник '" + obj.email + "' удален!",
              color: 'negative'
            })
          })
          .catch((error) => {
            console.log(error);
            this.error = true
          });
      },
      editStaff(row) {
        this.$router.push({ name: 'editStaff', params: { id: row.id }})
      }
    },
    components: {
      CreateStaff,
      EditStaff,
      Notify
    }
  }
</script>