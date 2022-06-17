export default {
  namespaced: true,
  state: {
    token: null, 
    client: null,
    id: null,
    name: null,
    uid: null,
    email: null,
    nickname: null,
    image: null
  }, 
  getters: {
    token: state => state.token,
    client: state => state.client,
    id: state => state.id,
    name: state => state.name,
    uid: state => state.uid,
    email: state => state.email,
    nickname: state => state.nickname,
    image: state => state.image
  },
  mutations: {
    loginUser(state,{ token, id, name, uid, client, email, nickname, image}) { 
      state.token = token;
      state.client = client;
      state.id = id;
      state.name = name;
      state.uid = uid;
      state.email = email;
      state.nickname = nickname; 
      state.image = image;

    },
    logoutUser(state){
      state.token = null;
      state.client = null;
      state.id = null;
      state.name = null;
      state.uid = null;
      state.email = null;
      state.nickname = null;
      state.image = null;
    },
  }
}