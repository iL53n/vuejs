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
                  ref="title"
                  label="Название"
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
                  label="Форма собственности"
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
                  placeholder="Номер налогоплательщика"
                  v-model="organization.tax_number"
                  type="number"
                  lazy-rules
                  :rules="[val => val && val.length == 9 || 'Должен состоять из 9 цифр']"
                  :dense="dense"
                  )
                q-input(
                  filled
                  ref="reg_number"
                  label="ОГРН"
                  placeholder="Регистрационный номер"
                  v-model="organization.reg_number"
                  type="number"
                  lazy-rules
                  :rules="[val => val && val.length == 13 || 'Должен состоять из 13 цифр']"
                  :dense="dense"
                  )

                //q-btn(label="СОЗДАТЬ" @click="addOrganization" type="submit" color="primary", :disabled='disabled')
                q-btn(label="СОЗДАТЬ" @click="addOrganization" type="submit" color="primary")
</template>

<script>
  import { backendPost } from '../../api'
  import { Notify } from 'quasar'

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
        visible: false,
        dense: false,
        // disabled: true
      }
    },
    watch: {
      // organization: {
      //   handler() {
      //     this.disabled = !(this.$refs.title.hasError ||
      //                       this.$refs.form_of_owership.hasError ||
      //                       this.$refs.tax_number.hasError ||
      //                       this.$refs.reg_number.hasError)
      //   },
      //   deep: true
      // }
    },
    computed: {
    },
    methods: {
      addOrganization() {
        backendPost('/staff/organizations', this.organization)
					.then((response) => {
            this.$emit('add-organization');
            Notify.create({
              message: "Организация '" + this.organization.title + "' создана!",
              color: 'positive'
            });
            this.organization = {
              title: '',
              form_of_owership: '',
            };
            this.errors = {};
            this.visible = false;

            this.$refs.title.resetValidation()
            this.$refs.form_of_owership.resetValidation()
            this.$refs.tax_number.resetValidation()
            this.$refs.reg_number.resetValidation()
					})
					.catch((error) => {
					  this.disabled = true;
            this.errors = error.response.data.errors;
					});
      },
      onSubmit() {
        this.$refs.title.validate()
        this.$refs.form_of_owership.validate()
        this.$refs.tax_number.validate()
        this.$refs.reg_number.validate()
      }
    },
    components: {
      Notify
    }
  }
</script>

<style lang="stylus" scoped>
</style>