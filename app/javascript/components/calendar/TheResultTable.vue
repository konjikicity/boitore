<template>
  <v-data-table
    :headers="headers"
    :items="play_results"
    height="70vh"
    class="elevation-1"
    :footer-props="{ 'items-per-page-text' : '行/ページ:'}"
    dark
    @click:row="showItem" 
    @page-count="pageCount = $event"
  >
    <template v-slot:item.created_at="{ item }">
      {{ formatDate(item.created_at) }}
    </template>
    <template v-slot:footer.page-text="props">
      {{ props.itemsLength }} 件中 {{ props.pageStart }} 件から
      {{ props.pageStop }} 件までを表示
    </template>
    <template v-slot:top>
      <v-dialog
        v-model="dialog"
        max-width="40vw"
      >
        <v-card
          color="grey lighten-4"
          flat
        >
          <v-toolbar
            class="red lighten-1"
            dark
          >
            <v-toolbar-title>
              {{ editedItem.practiced_sentence }}
            </v-toolbar-title>
            <div
              class="pl-15"
            >
              {{ formatDate(editedItem.created_at) }}
            </div>
            <v-spacer />
            <v-btn
              outlined
              small
              class="ma-4 white--text"
              @click="DeleteResult"
            >
              削除する
            </v-btn>
          </v-toolbar>
          <v-simple-table>
            <template v-slot:default>
              <tbody>
                <tr>
                  <th>音声認識(通常練習)</th>
                  <td>{{ editedItem.practiced_normal }}</td>
                </tr>
                <tr>
                  <th>音声認識(母音法後の練習)</th>
                  <td>{{ editedItem.practiced_boin }}</td>
                </tr>
                <tr>
                  <th>得点</th>
                  <td>{{ editedItem.score }}</td>
                </tr>
                <tr>
                  <th>評価</th>
                  <td>{{ editedItem.judge }}</td>
                </tr> 
                <tr>
                  <th>通常練習の音声</th>
                  <td>
                    <audio
                      :src="editedItem.normal_voice.url"
                      controls
                    />
                  </td>
                </tr>
                <tr>
                  <th>母音法後の音声</th>
                  <td>
                    <audio
                      :src="editedItem.normal_voice.url"
                      controls
                    />
                  </td>
                </tr>
              </tbody>
            </template>
          </v-simple-table>
        </v-card>
      </v-dialog>
    </template> 
  </v-data-table>  
</template>
<script>
import moment from 'moment'

export default {
  name: "TheResultTable",
  data() {
    return {
      page: 1,
      pageCount: 0,
      itemsPerPage: 10,
      dialog: false,
      dialogDelete: false,
      headers: [
        {
          text:'練習した文章',
          value: 'practiced_sentence',
        },
        { text: '日付', value: 'created_at' },
      ],
      play_results: [],
      uid: null,
      token: null,
      client: null,
      editedIndex: -1,
      editedItem: {
        practiced_sentence: '',
        practiced_normal: '',
        practiced_boin: '',
        normal_voice: '',
        boin_voice: '',
        judge: '',
        score: '',
        created_at: '',
        id: ''
      
      }
    }
  }, 
  created() {
    this.name = this.$store.getters['login/name']
    this.uid = this.$store.getters['login/uid']
    this.token = this.$store.getters['login/token']
    this.client = this.$store.getters['login/client']
    this.fetchPlayResults();
  },
  methods: {
    async fetchPlayResults()  {
      try {
        const res = await this.$axios.get('play_results', {
          headers: {
            uid: this.uid,
            "access-token": this.token,
            client: this.client,
          },
        })
        console.log(res.data);
        this.play_results = res.data;
      }
      catch(error) {
        console.log(error)
      }
    },
    showItem (item) {
      this.editIndex = this.play_results.indexOf(item)
      this.editedItem = Object.assign({}, item)
      this.dialog = true
    },
    formatDate(value) {
      return moment(value).format("YYYY年MM月DD日")
    },
    async DeleteResult(){
      try{
        let accept = confirm('本当に削除しますか？')
        if(accept) {
          const result = await this.$axios.delete('play_results/' + this.editedItem.id , {
            headers: {
              uid: this.uid,
              "access-token": this.token,
              client: this.client,
            },
          })
          console.log(result.data)
          this.$router.go(this.$router.currentRoute.path)
        }
        else {
          console.log(accept)
        }
      }
      catch(error) {
        console.log(error)
      }
    } 
  },
}
</script>