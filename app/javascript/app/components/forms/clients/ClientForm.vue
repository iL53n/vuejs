<template lang="pug">
  div
    q-card(style="width: 300px")
      q-form
        q-card-section(class="q-gutter-y-md column")
          q-input(
            filled
            ref="fullname"
            label="Имя *"
            placeholder="Введите полное имя"
            v-model="client.fullname"
            type="text"
            lazy-rules
            :rules="[val => val !== null && val !== '' || 'Имя не может быть пустым']"
            :dense="dense"
          )
          q-input(
            filled
            ref="phone"
            label="Телефон *"
            placeholder="Номер телефона"
            v-model="client.phone"
            mask="+375(##)###-##-##"
            hint="+375(##)###-##-##"
            lazy-rules
            :rules="[val => val && val.length == 17 || 'Слишком короткий номер']"
            :dense="dense"
          )
          q-input(
            filled
            ref="email"
            label="Email *"
            placeholder="Электронная почта"
            v-model="client.email"
            type="email"
            lazy-rules
            :rules="[val => val !== null && val !== '' || 'Email может быть пустым']"
            :dense="dense"
          )
          q-select(
            filled
            multiple
            label="Организации"
            placeholder="Выберите организацию клиента"
            v-model="client.organizations"
            :options="organizations"
            use-chips
            stack-label
            option-value="id"
            option-label="title"
            :dense="dense"
          )
          q-btn(
            color="primary"
            label="СОХРАНИТЬ"
            @click="saveClient"
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
      client: Object
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
      saveClient() {
        this.$refs.fullname.validate();
        this.$refs.phone.validate();
        this.$refs.email.validate();

        if (this.$refs.fullname.hasError || this.$refs.phone.hasError || this.$refs.email.hasError) {
          this.hide = false;
          Notify.create({
            message: "Не сохранено! В форме есть ошибки!",
            color: 'negative',
            position: 'center'
          })
        } else {
          this.hide = true;
          this.client.organization_ids = this.client.organizations.map(org => org.id);

          if (this.$route.params.id) {
            this.updateClient();
          } else {
            this.addClient();
          }
        }
      },
      getOrganizations() {
        backendGet('/staff/organizations')
          .then((response) => {
            this.organizations = response.data.organizations
          })
          .catch((error) => {
            console.log(error);
            this.errors = true
          })
          .finally(() => {
            this.loading = false
          });
      },
      updateClient() {
        backendPatch(`/staff/clients/${this.client.id}`, this.client)
          .then((response) => {
            this.$emit('edit-client');
            Notify.create({
              message: "Клиент '" + this.client.fullname + "' отредактирован!",
              color: 'positive',
              position: 'right'
            });
            this.client = { fullname: '' };
            this.errors = {};

            this.$refs.fullname.resetValidation();
            this.$refs.phone.resetValidation();
            this.$refs.email.resetValidation()
          })
          .catch((error) => {
            console.log(error);
            this.errors = error.response.data.errors;
          })
          .finally(() => {
            this.loading = false
          });
      },
      addClient() {
        backendPost('/staff/clients', this.client)
          .then((response) => {
            this.$emit('add-client');
            Notify.create({
              message: "Клиент '" + this.client.fullname + "' создан!",
              color: 'positive',
              position: 'left'
            });
            this.client = { fullname: '' };
            this.errors = {};

            this.$refs.fullname.resetValidation();
            this.$refs.phone.resetValidation();
            this.$refs.email.resetValidation()
          })
          .catch((error) => {
            this.disabled = true;
            this.errors = error.response.data.errors;
          });
      },
      afterShow() {
        this.$router.push("/clients");
      },
    },
    components: {
      Notify
    }
  }
</script>

<style lang="stylus" scoped>
</style>