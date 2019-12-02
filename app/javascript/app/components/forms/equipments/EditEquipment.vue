<template lang="pug">
  div
    q-dialog(
      :value="true"
      @hide="afterShow()"
      :position="position"
      transition-show="rotate"
    )
      form-equipment(:equipment="equipment")
</template>

<script>
  import FormEquipment from './EquipmentForm'
  import { backendGet } from "../../../api";

  export default {
    data() {
      return {
        equipment: this.getEquipment(),
        position: 'right'
      }
    },
    methods: {
      getEquipment() {
        backendGet(`/staff/equipments/${this.$route.params.id}`)
          .then((response) => {
            this.equipment = response.data.equipment
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
        this.$router.push("/equipments");
        this.$emit('edit-equipment');
      },
    },
    components: {
      FormEquipment
    }
  }
</script>

<style lang="stylus" scoped>
</style>