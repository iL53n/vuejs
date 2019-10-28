import axios from 'axios'

export function backendGet (url) {
  return axios.get(url);
}

export function backendGetWithParams (url, params) {
  return axios.get(url, { params: params });
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