<template lang="pug">
  div
    fieldset
      legend
        b Create new client

      label="Full name"
        span.error(v-for="error in errors.fullname") ( {{ error }} )
        input(v-model="client.fullname", type="text" placeholder="Minimum 5 characters")

      label="Phone"
        span.error(v-for="error in errors.phone") ( {{ error }} )
        input(v-model="client.phone", type="text" placeholder="Minimum 10 characters, only numbers")

      label="Email"
        span.error(v-for="error in errors.email") ( {{ error }} )
        input(v-model="client.email", type="text" placeholder="friend@tut.com")

      button(@click="addClient", class="button", :disabled='disabled') Create new client
</template>

<script>
  const regexFullname = /^[A-z А-яЁё]{5,}$/;
  const regexPhone = /^[0-9]{10,}$/;
  const regexEmail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

  import { backendPost } from '../api/index'

  export default {
    data() {
      return {
        client: {
          fullname: '',
          phone: '',
          email: ''
        },
        errors: {},
        message: '',
        disabled: true
      }
    },
    watch: {
      client: {
        handler() {
          this.errors = {};
          this.disabled = !(this.isValidFullname && this.isValidPhone && this.isValidEmail);
        },
        deep: true
      },
    },
    computed: {
      isValidFullname() {
        return regexFullname.test(this.client.fullname);
      },
      isValidPhone() {
        return regexPhone.test(this.client.phone);
      },
      isValidEmail() {
        return regexEmail.test(this.client.email);
      },
    },
    methods: {
      addClient() {
        backendPost('/staff/clients', this.client)
					.then((response) => {
            this.$emit('add-client');
            this.client = { fullname: '' };
            this.errors = {};
					})
					.catch((error) => {
					  this.disabled = true;
            this.errors = error.response.data.errors;
					});
      }
    }
  }
</script>

<style lang="scss">
	fieldset {
		list-style-type: none;
		margin: 20px;
		font-family: "Helvetica Neue", Arial, sans-serif;
		border-spacing: 2px;
		border: 1px solid #c6c7cc;
		border-radius: 5px;
		overflow: hidden;
		width: 300px;
	}

	input[type=text] {
		width: 300px;
		padding: 10px;
		margin: 5px 0 12px 0;
		display: inline-block;
		border: none;
		background: #f1f1f1;
	}

	input[type=text]:focus {
		background-color: #ddd;
		outline: none;
	}

  .error {
    color: #dd0c0c;
    font-size: small;
  }

  /*button:disabled {*/
  /*  cursor: not-allowed;*/
  /*  pointer-events: all !important;*/
  /*  background-color: lightgrey;*/
  /*  color: white;*/
  /*  border: 1px lightgrey;*/
  /*}*/
</style>