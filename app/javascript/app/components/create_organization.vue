<template lang="pug">
  div(class="q-pa-md")
    q-card(style="max-width: 400px")
      q-card-section(class="bg-primary text-white")
        div(class="text-subtitle2") Новая организация
      q-card-section(class="q-gutter-y-md column")
        q-form(class="q-gutter-y-md column")
          q-input(filled label="Название" placeholder="Оффициальное наименование" v-model="organization.title" type="text")
          q-input(filled label="Форма собственности" placeholder="ЗАО, ОАО, ..." v-model="organization.form_of_owership" type="text")
          q-input(filled label="ИНН" placeholder="Номер налогоплательщика" v-model="organization.tax_number" type="number")
          q-input(filled label="ОГРН" placeholder="Регистрационный номер" v-model="organization.reg_number" type="number")
          q-btn(@click="addOrganization") Создать
</template>

<script>
  import { backendPost } from '../api/index'

  export default {
    data() {
      return {
        organization: {
          title: '',
          form_of_owership: '',
          tax_number: '',
          reg_number: ''
        },
        errors: {},
        message: '',
        disabled: true
      }
    },
    watch: {
      client: {
        handler() {
          this.errors = {};
          //this.disabled = !(this.isValidFullname && this.isValidPhone && this.isValidEmail);
        },
        deep: true
      },
    },
    computed: {
      isValidFullname() {
        return regexFullname.test(this.client.fullname);
      },
      isValidPhone() {
        return regexPhone.test(this.client.phone);
      },
      isValidEmail() {
        return regexEmail.test(this.client.email);
      },
    },
    methods: {
      addOrganization() {
        backendPost('/staff/organizations', this.organization)
					.then((response) => {
            this.$emit('add-organization');
            this.organization = { title: '' };
            this.errors = {};
					})
					.catch((error) => {
					  this.disabled = true;
            this.errors = error.response.data.errors;
					});
      }
    }
  }
</script>

<style lang="scss">
</style>