export default {
  namespaced: true,
  state: {
    token: null, 
    client: null,
    id: null,
    name: null,
    uid: null,
  }, 
  getters: {
    token: state => state.token,
    client: state => state.client,
    id: state => state.id,
    name: state => state.name,
    uid: state => state.uid
  },
  mutations: {
    loginUser(state,{ token, id, name, uid, client }) { 
      state.token = token;
      state.client = client;
      state.id = id;
      state.name = name,
      state.uid = uid;
    },
    logoutUser(state){
      state.token = null;
      state.client = null;
      state.id = null;
      state.name = null,
      state.uid = null;
    },
  }
}