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
              | Оборудование
        .q-pa-md
          q-table(name="equipments", :title="title", :data="data", :columns="columns", row-key="id", no-data-label="Нет информации о обордованиии!")
            template(v-slot:body-cell-organization="props")
              q-td
                | {{ props.row.organization.form_of_owership + " \"" + props.row.organization.title + "\""}}
            template(v-slot:body-cell-action="props")
              q-td(align="right")
                q-btn(push color="white" text-color="primary" label="Редактировать" @click="editEquipment(props.row)")
                q-btn(push color="white" text-color="negative" label="Удалить"  @click="deleteEquipment(props.row)" method="delete")
          q-page-sticky(expand position="bottom-left")
            q-btn(push round color="primary" size="20px" @click="createEquipment()") +

          router-view(@edit-equipment="fetchEquipments" @create-equipment="fetchEquipments")
</template>

<script>
  import { backendGet } from '../../api'
  import { backendDelete } from '../../api'
  import CreateEquipment from '../forms/equipments/create_equipment'
  import EditEquipment from '../forms/equipments/edit_equipment'
  import { Notify } from 'quasar'

  export default {
    data () {
      return {
        columns: [
          { name: 'id', align: 'left', label: 'ID', field: 'id', sortable: true },
          { name: 'title', align: 'left', label: 'Наименование', field: 'title', sortable: true },
          { name: 'kind', align: 'left', label: 'Тип', field: 'kind', sortable: true },
          { name: 'serial_number', align: 'center', label: 'Серийный номер', field: 'serial_number', sortable: true },
          { name: 'organization', align: 'center', label: 'Организация', field: '', sortable: true },
          { name: 'action', align: 'center', field: ['edit', 'delete'] }
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
      this.fetchEquipments();
    },
    methods: {
      fetchEquipments() {
        backendGet('/staff/equipments')
          .then((response) => {
            this.data = response.data.equipment
          })
          .catch((error) => {
            console.log(error);
            this.errors = true
          })
          .finally(() => {
            this.loading = false
          });
      },
      deleteEquipment(obj) {
        backendDelete('/staff/equipments/', obj.id)
          .then((response) => {
            this.fetchEquipments();
            Notify.create({
              message: "Оборудование '" + obj.title + "' удалено!",
              color: 'negative'
            })
          })
          .catch((error) => {
            console.log(error);
            this.errors = true
          });
      },
      createEquipment() {
        this.$router.push({ name: 'createEquipment'})
      },
      editEquipment(row) {
        this.$router.push({ name: 'editEquipment', params: { id: row.id }})
      },
    },
    components: {
      CreateEquipment,
      EditEquipment,
      Notify
    }
  }
</script>