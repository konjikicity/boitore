import axios from 'axios'

const axiosInstance = axios.create({
  baseURL: `${process.env.VUE_APP_API_ORIGIN}`+ '/api/v1/',
})

export default axiosInstance