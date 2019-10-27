<template lang="pug">
  q-input(
    label="Поиск",
    v-model="filter",
    debounce="500"
    filled
  )
</template>

<script>
  export default {
    computed: {
      filter: {
        get() {
          return this.$store.state.orgMod.filter
        },
        set(value) {
          this.$store.commit('updateFilter', value)
        }
      }
    }
  }
</script>