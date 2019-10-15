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
                  ref="email"
                  label="Email *"
                  placeholder="Электронная почта"
                  v-model="staff.email"
                  type="email"
                  lazy-rules
                  :rules="[val => val !== null && val !== '' || 'Email может быть пустым']"
                  :dense="dense"
                  )

                q-btn(label="СОЗДАТЬ" @click="addStaff" type="submit" color="primary")
</template>

<script>
  import { backendPost } from '../../api'
  import { Notify } from 'quasar'

  export default {
    data() {
      return {
        staff: {
          email: ''
        },
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
      addStaff() {
        backendPost('/staff/staffs', this.staff)
					.then((response) => {
            this.$emit('add-staff');
            Notify.create({
              message: "Сотрудник '" + this.staff.email + "' создан!",
              color: 'positive'
            });
            this.staff = { email: '' };
            this.errors = {};
            this.visible = false;

            this.$refs.email.resetValidation()
					})
					.catch((error) => {
					  this.disabled = true;
            this.errors = error.response.data.errors;
					});
      },
      onSubmit() {
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