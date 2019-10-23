<template lang="pug">
  div(class="q-pa-md")
    q-page-sticky(expand position="bottom-left")
      q-btn(push round color="primary" size="20px" @click="visible = !visible") +
      q-slide-transition
        div(v-show="visible")
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
                  label="Организация *"
                  placeholder="Выберите организацию клиента"
                  v-model="client.organizations"
                  :options="options"
                  option-value="id"
                  option-label="title"
                  option-disable="inactive"
                  emit-value
                  map-options
                  lazy-rules
                  :rules="[val => val !== null && val !== '' || 'Организация должна быть указана']"
                  :dense="dense"
                  )

                q-btn(label="СОЗДАТЬ" @click="addClient" type="submit" color="primary")
</template>

<script>
  import { backendPost } from '../../api'
  import { backendGet } from '../../api'
  import { Notify } from 'quasar'

  export default {
    data() {
      return {
        client: {
          fullname: '',
          phone: '',
          email: ''
        },
        options: this.getOrganizations(),
        errors: {},
        visible: false,
        dense: false,
        // disabled: true
      }
    },
    watch: {
    },
    computed: {
    },
    methods: {
      addClient() {
        backendPost('/staff/clients', this.client)
					.then((response) => {
            this.$emit('add-client');
            Notify.create({
              message: "Клиент '" + this.client.fullname + "' создан!",
              color: 'positive'
            });
            this.client = { fullname: '' };
            this.errors = {};
            this.visible = false;

            this.$refs.fullname.resetValidation()
            this.$refs.phone.resetValidation()
            this.$refs.email.resetValidation()
					})
					.catch((error) => {
					  this.disabled = true;
            this.errors = error.response.data.errors;
					});
      },
      getOrganizations() {
        backendGet('/staff/organizations')
          .then((response) => {
            this.options = response.data.organizations
          })
          .catch((error) => {
            console.log(error);
            this.error = true
          })
          .finally(() => {
            this.loading = false
          });
      },
      onSubmit() {
        this.$refs.fullname.validate()
        this.$refs.phone.validate()
        this.$refs.email.validate()
      }
    },
    components: {
      Notify
    }
  }
</script>

<style lang="stylus" scoped>
</style>