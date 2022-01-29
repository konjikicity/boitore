<template>
  <div class="product">
    <h1>母音練習</h1>
    <h2>{{ $route.params.normal }}</h2>
    <h2>{{ $route.params.boin }}</h2>
  </div>
</template>
<script>
export default {
 props: ["id"]
}
</script>