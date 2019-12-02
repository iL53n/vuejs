<template lang="pug">
  div
    q-dialog(
      :value="true"
      @hide="afterShow()"
      :position="position"
      transition-show="rotate"
    )
      form-staff(:staff="staff")
</template>

<script>
  import FormStaff from './StaffForm'
  import { backendGet } from "../../../api";

  export default {
    data() {
      return {
        staff: this.getStaff(),
        position: 'right'
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
              this.errors = true
            })
            .finally(() => {
              this.loading = false
            });
      },
      afterShow() {
        this.$router.push("/staffs");
        this.$emit('edit-staff');
      },
    },
    components: {
      FormStaff
    }
  }
</script>

<style lang="stylus" scoped>
</style>