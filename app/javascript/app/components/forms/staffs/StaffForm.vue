<template lang="pug">
  div
    q-card(style="width: 300px")
      q-form
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
          q-btn(
            color="primary"
            label="СОХРАНИТЬ"
            @click="saveStaff"
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
      staff: Object
    },
    data() {
      return {
        errors: {},
        dense: false,
        hide: true
      }
    },
    methods: {
      saveStaff() {
        this.$refs.email.validate();

        if (this.$refs.email.hasError) {
          this.hide = false;
          Notify.create({
            message: "Не сохранено! В форме есть ошибки!",
            color: 'negative',
            position: 'center'
          })
        } else {
          this.hide = true;

          if (this.$route.params.id) {
            this.updateStaff();
          } else {
            this.addStaff();
          }
        }
      },
      updateStaff() {
        backendPatch(`/staff/staffs/${this.staff.id}`, this.staff)
            .then((response) => {
              this.$emit('edit-staff');
              Notify.create({
                message: "Сотрудник '" + this.staff.fullname + "' отредактирован!",
                color: 'positive',
                position: 'right'
              });
              this.errors = {};
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
      addStaff() {
        backendPost('/staff/staffs', this.staff)
            .then((response) => {
              this.$emit('add-staff');
              Notify.create({
                message: "Сотрудник '" + this.staff.email + "' создан!",
                color: 'positive',
                position: 'left'
              });
              this.errors = {};
              this.$refs.email.resetValidation()
            })
            .catch((error) => {
              this.disabled = true;
              this.errors = error.response.data.errors;
            });
      },
      afterShow() {
        this.$router.push("/staffs");
      },
    },
    components: {
      Notify
    }
  }
</script>

<style lang="stylus" scoped>
</style>