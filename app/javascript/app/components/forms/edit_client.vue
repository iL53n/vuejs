<template lang="pug">
  div
    q-dialog(v-model="show" @hide="afterShow()")
      q-card(style="width: 300px")
        q-form(@submit.prevent.stop="onSubmit" )
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
              v-model="selectOrganizations"
              :options="organizations"
              use-chips
              stack-label
              option-value="id"
              option-label="title"
              :dense="dense"
            )
          q-card-actions
            q-btn(
              flat
              color="white"
              text-color="secondary"
              label="Сохранить"
              @click="updateClient"
              type="submit"
              v-close-popup
            )
</template>

<script>
  import { backendGet } from "../../api";
  import { backendPatch } from "../../api";
  import { Notify } from 'quasar'

  export default {
    data() {
      return {
        client: this.getClient(),
        organizations: this.getOrganizations(),
        selectOrganizations: [],
        // errors: {},
        dense: false,
        show: true
      }
    },
    watch: {
      client() {
        this.selectOrganizations = this.client.organizations;
      }
    },
    methods: {
      getClient() {
        backendGet(`/staff/clients/${this.$route.params.id}`)
          .then((response) => {
            this.client = response.data.client
          })
          .catch((error) => {
            console.log(error);
            //this.error = true
          })
          .finally(() => {
            this.loading = false
          });
      },
      updateClient() {
        this.client.organization_ids = this.selectOrganizations.map(org => org.id)

        backendPatch(`/staff/clients/${this.client.id}`, this.client)
          .then((response) => {
            this.$emit('edit-client');
            Notify.create({
              message: "Клиент '" + this.client.fullname + "' отредактирован!",
              color: 'positive'
            });
            this.client = { fullname: '' };
            this.errors = {};

            this.$refs.fullname.resetValidation()
            this.$refs.phone.resetValidation()
            this.$refs.email.resetValidation()
          })
          .catch((error) => {
            this.disabled = true;
            //this.errors = error.response.data.errors;
          });
      },
      getOrganizations() {
        backendGet('/staff/organizations')
          .then((response) => {
            this.organizations = response.data.organizations
          })
          .catch((error) => {
            console.log(error);
            //this.error = true
          })
          .finally(() => {
            this.loading = false
          });
      },
      afterShow() {
        this.$router.push("/clients");
      },
    },
    components: {
    }
  }
</script>