<template lang="pug">
  div
    q-card(style="width: 300px")
      q-form
        q-card-section(class="q-gutter-y-md column")
          q-input(
            filled
            ref="title"
            label="Наименование *"
            placeholder="Введите наименование изделия"
            v-model="equipment.title"
            type="text"
            lazy-rules
            :rules="[val => val !== null && val !== '' || 'Наименование не может быть пустым']"
            :dense="dense"
          )
          q-input(
            filled
            ref="kind"
            label="Тип *"
            placeholder="Тип или вид изделия"
            v-model="equipment.kind"
            type="text"
            lazy-rules
            :rules="[val => val !== null && val !== '' || 'Тип не может быть пустым']"
            :dense="dense"
          )
          q-input(
            filled
            ref="serial_number"
            label="Серийный номер *"
            placeholder="Серийный номер изделия"
            v-model="equipment.serial_number"
            type="text"
            lazy-rules
            :rules="[val => val !== null && val !== '' || 'Серийный номер не может быть пустым']"
            :dense="dense"
          )
          q-select(
            filled
            ref="organization"
            label="Организации"
            placeholder="Выберите организацию"
            v-model="equipment.organization"
            :options="organizations"
            option-value="id"
            option-label="title"
            lazy-rules
            :rules="[val => val !== null && val !== '' || 'Выберите организацию']"
            :dense="dense"
          )
          q-btn(
            color="primary"
            label="СОХРАНИТЬ"
            @click="saveEquipment"
            type="submit"
            v-close-popup="hide"
          )
          q-btn(
            flat
            color="primary"
            label="Закрыть"
            v-close-popup
          )
</template>

<script>
  import { backendGet } from "../../../api";
  import { backendPost } from '../../../api';
  import { backendPatch } from "../../../api";
  import { Notify } from 'quasar'

  export default {
    props: {
      equipment: {}
    },
    data() {
      return {
        organizations: this.getOrganizations(),
        errors: {},
        dense: false,
        hide: true
      }
    },
    methods: {
      saveEquipment() {
        this.$refs.title.validate();
        this.$refs.kind.validate();
        this.$refs.serial_number.validate();
        this.$refs.organization.validate();

        if (this.$refs.title.hasError || this.$refs.kind.hasError || this.$refs.serial_number.hasError || this.$refs.organization.hasError) {
          this.hide = false;
          Notify.create({
            message: "Не сохранено! В форме есть ошибки!",
            color: 'negative',
            position: 'center'
          })
        } else {
          this.hide = true;
          this.equipment.organization_id = this.equipment.organization.id;

          if (this.$route.params.id) {
            this.updateEquipment();
          } else {
            this.addEquipment();
          }
        }
      },
      getOrganizations() {
        backendGet('/staff/organizations')
          .then((response) => {
            this.organizations = response.data.data.map(i => i.attributes);
          })
          .catch((error) => {
            console.log(error);
            this.errors = true
          })
          .finally(() => {
            this.loading = false
          });
      },
      updateEquipment() {
        backendPatch(`/staff/equipments/${this.equipment.id}`, this.equipment)
          .then((response) => {
            this.$emit('edit-equipment');
            Notify.create({
              message: "Оборудование '" + this.equipment.title + "' отредактировано!",
              color: 'positive',
              position: 'right'
            });
            this.equipment = { title: '' };
            this.errors = {};

            this.$refs.title.resetValidation();
            this.$refs.kind.resetValidation();
            this.$refs.serial_number.resetValidation();
            this.$refs.organization.resetValidation();
          })
          .catch((error) => {
            console.log(error);
            this.errors = error.response.data.errors;
          })
          .finally(() => {
            this.loading = false
          });
      },
      addEquipment() {
        backendPost('/staff/equipments', this.equipment)
          .then((response) => {
            this.$emit('add-equipment');
            Notify.create({
              message: "Оборудование '" + this.equipment.title + "' создано!",
              color: 'positive',
              position: 'left'
            });
            this.equipment = { title: '' };
            this.errors = {};

            this.$refs.title.resetValidation();
            this.$refs.kind.resetValidation();
            this.$refs.serial_number.resetValidation();
            this.$refs.organization.resetValidation();
          })
          .catch((error) => {
            this.errors = error.response.data.errors;
          });
      },
      afterShow() {
        this.$router.push("/equipments");
      },
    },
    components: {
      Notify
    }
  }
</script>

<style lang="stylus" scoped>
</style>