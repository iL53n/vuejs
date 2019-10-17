<template lang="pug">
  div
    q-dialog(v-model="show")
      q-card(style="width: 300px")
        | {{ obj }}
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

              q-card-actions
            q-btn(flat color="white" text-color="secondary" label="Сохранить" @click="editClient" type="submit")
</template>

<script>
  import { backendPatch } from "../../api";

  export default {
    props: {
      obj: Object,
      show: Boolean
    },
    data() {
      return {
        client: Object,
        // errors: {},
        dense: false,
      }
    },
    // methods: {
    //   editClient() {
    //     backendPatch('/staff/clients', obj.id)
    //         .then((response) => {
    //           this.$emit('edit-client');
    //           Notify.create({
    //             message: "Клиент '" + this.obj.fullname + "' отредактирован!",
    //             color: 'positive'
    //           });
    //         })
    //         .catch((error) => {
    //           this.disabled = true;
    //           this.errors = error.response.data.errors;
    //         });
    //   },
    // },
    // components: {
    // }
  }
</script>