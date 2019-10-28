<template lang="pug">
  div
    q-card(style="width: 300px")
      q-form
        q-card-section(class="q-gutter-y-md column")
          q-input(
            filled
            ref="title"
            label="Название *"
            placeholder="Оффициальное наименование"
            v-model="organization.title"
            type="text"
            lazy-rules
            :rules="[val => val !== null && val !== '' || 'Название не может быть пустым']"
            :dense="dense"
          )
          q-input(
            filled
            ref="form_of_owership"
            label="Форма собственности *"
            placeholder="ЗАО, ОАО, ..."
            v-model="organization.form_of_owership"
            type="text"
            lazy-rules
            :rules="[val => val !== null && val !== '' || 'Форма собственности не может быть пустым']"
            :dense="dense"
          )
          q-input(
            filled
            ref="tax_number"
            label="ИНН"
            placeholder="Номер налогоплательщика *"
            v-model="organization.tax_number"
            mask="##########"
            lazy-rules
            :rules="[val => val && val.length == 9 || 'Должен состоять из 9 цифр']"
            counter
            maxlength="9"
            :dense="dense"
          )

          q-input(
            filled
            ref="reg_number"
            label="ОГРН"
            placeholder="Регистрационный номер *"
            v-model="organization.reg_number"
            mask="##############"
            lazy-rules
            :rules="[val => val && val.length == 13 || 'Должен состоять из 13 цифр']"
            counter
            maxlength="13"
            :dense="dense"
          )
          q-select(
            filled
            multiple
            label="Клиенты"
            placeholder="Выберите сотрудников организации"
            v-model="organization.clients"
            :options="clients"
            use-chips
            stack-label
            option-value="id"
            option-label="fullname"
            :dense="dense"
          )
          q-btn(
            color="primary"
            label="СОХРАНИТЬ"
            @click="saveOrganization"
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
      organization: {}
    },
    data() {
      return {
        clients: this.getClients(),
        errors: {},
        dense: false,
        hide: true
      }
    },
    methods: {
      saveOrganization() {
        this.$refs.title.validate();
        this.$refs.form_of_owership.validate();
        this.$refs.tax_number.validate();
        this.$refs.reg_number.validate();

        if (this.$refs.title.hasError || this.$refs.form_of_owership.hasError || this.$refs.tax_number.hasError || this.$refs.reg_number.hasError) {
          this.hide = false;
          Notify.create({
            message: "Не сохранено! В форме есть ошибки!",
            color: 'negative',
            position: 'center'
          })
        } else {
          this.hide = true;
          this.organization.client_ids = this.organization.clients.map(client => client.id);

          if (this.$route.params.id) {
            this.updateOrganization();
          } else {
            this.addOrganization();
          }
        }
      },
      getClients() {
        backendGet('/staff/clients')
          .then((response) => {
            this.clients = response.data.clients
          })
          .catch((error) => {
            console.log(error);
            this.errors = true
          })
          .finally(() => {
            this.loading = false
          });
      },
      updateOrganization() {
        backendPatch(`/staff/organizations/${this.organization.id}`, this.organization)
          .then((response) => {
            Notify.create({
              message: "Организация '" + this.organization.title + "' отредактирована!",
              color: 'positive',
              position: 'right'
            });
            this.$emit('edit-organization');
            this.organization = {};
            this.errors = {};

            this.$refs.title.resetValidation();
            this.$refs.form_of_owership.resetValidation();
            this.$refs.tax_number.resetValidation();
            this.$refs.reg_number.resetValidation();
          })
          .catch((error) => {
            console.log(error);
            this.errors = error.response.data.errors;
          })
          .finally(() => {
            this.loading = false
          });
      },
      addOrganization() {
        backendPost('/staff/organizations', this.organization)
          .then((response) => {
            Notify.create({
              message: "Организация '" + this.organization.title + "' создана!",
              color: 'positive',
              position: 'left'
            });
            this.$emit('add-organization');
            this.organization = { title: '' };
            this.errors = {};

            this.$refs.title.resetValidation();
            this.$refs.form_of_owership.resetValidation();
            this.$refs.tax_number.resetValidation();
            this.$refs.reg_number.resetValidation();
          })
          .catch((error) => {
            this.errors = error.response.data.errors;
          });
      },
      afterShow() {
        this.$router.push("/organizations");
      },
    },
    components: {
      Notify
    }
  }
</script>

<style lang="stylus" scoped>
</style>