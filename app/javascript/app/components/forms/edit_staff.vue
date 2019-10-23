<template lang="pug">
  div
    q-dialog(v-model="show" @hide="afterShow()")
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
            q-btn(
              flat color="white"
              text-color="secondary"
              label="Сохранить"
              @click="updateStaff"
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
        staff: this.getStaff(),
        // errors: {},
        dense: false,
        show: true
      }
    },
    methods: {
      getStaff() {
        backendGet(`/staff/staffs/${this.$route.params.id}`)
          .then((response) => {
            this.staff = response.data.staff
          })
          .catch((error) => {
            console.log(error);
            this.error = true
          })
          .finally(() => {
            this.loading = false
          });
      },
      updateStaff() {
        backendPatch(`/staff/staffs/${this.staff.id}`, this.staff)
            .then((response) => {
              this.$emit('edit-staff');
              Notify.create({
                message: "Сотрудник '" + this.staff.email + "' отредактирован!",
                color: 'positive'
              });
              this.staff = { email: '' };
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
    }
  }
</script>