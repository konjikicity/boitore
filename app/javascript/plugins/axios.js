import axios from 'axios'

const axiosInstance = axios.create({
  baseURL: 'https://boitore.herokuapp.com/api/'
})

export default axiosInstance