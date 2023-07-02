<script setup>
import { Notify } from 'quasar'
import { onMounted } from 'vue';

const props = defineProps({
  notificacao: { type: String, required: true }
})

onMounted(async () => {
  Notify.create(props.notificacao)
});
</script>


