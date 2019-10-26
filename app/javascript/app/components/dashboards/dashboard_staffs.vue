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
              q-td(align="right")
                q-btn(push color="white" text-color="secondary" label="Сбросить пароль" @click="resetPassStaff(props.row)")
                q-btn(push color="white" text-color="primary" label="Редактировать" @click="editStaff(props.row)")
                q-btn(push color="white" text-color="negative" label="Удалить"  @click="deleteStaff(props.row)" method="delete")
          q-page-sticky(expand position="bottom-left")
            q-btn(push round color="primary" size="20px" @click="createStaff()") +

          router-view(@edit-staff="fetchStaffs" @create-staff="fetchStaffs")
</template>

<script>
  import { backendGet } from '../../api'
  import { backendPost } from '../../api'
  import { backendDelete } from '../../api'
  import CreateStaff from '../forms/staffs/create_staff'
  import EditStaff from '../forms/staffs/edit_staff'
  import { Notify } from 'quasar'

  export default {
    data () {
      return {
        columns: [
          { name: 'id', align: 'left', label: 'ID', field: 'id', sortable: true },
          { name: 'email', align: 'center', label: 'Email', field: 'email', sortable: true },
          { name: 'action', align: 'center', field: ['reset_pass', 'edit', 'delete'] }
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
      createStaff() {
        this.$router.push({ name: 'createStaff'})
      },
      editStaff(row) {
        this.$router.push({name: 'editStaff', params: {id: row.id}})
      },
      resetPassStaff(obj) {
        backendPost(`/staff/staffs/${obj.id}/reset_pass`)
          .then((response) => {
            Notify.create({
              message: "Инструкция отправлена на почту:" + obj.email,
              color: 'positive'
            })
          })
          .catch((error) => {
            console.log(error);
            this.error = true
          });
      }
    },
    components: {
      CreateStaff,
      EditStaff,
      Notify
    }
  }
</script>