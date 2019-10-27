import axios from 'axios'

export function backendGet (url) {
  return axios.get(url);
}

export function backendGetWithFilter (url,filter) {
  return axios.get(url + '?filter=' + filter);
}

export function backendPost (url, params) {
  return axios.post(url, params);
}

export function backendPatch (url, params) {
  return axios.patch(url, params);
}

export function backendDelete (url, id) {
  return axios.delete(url + id);
}