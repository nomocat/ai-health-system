<script setup lang="ts">
import { ref, onMounted } from "vue";
import Sortable, { Swap } from "sortablejs";
import draggable from "vuedraggable/src/vuedraggable";
import { useAppStoreHook } from "@/store/modules/app";

defineOptions({
  name: "Draggable"
});

const { setSortSwap } = useAppStoreHook();



const cutLists = ref([
  { people: "cn", id: 1, name: "cut1" },
  { people: "cn", id: 2, name: "cut2" },
  { people: "cn", id: 3, name: "cut3" },
  { people: "cn", id: 4, name: "cut4" },
  { people: "cn", id: 5, name: "cut5" },
  { people: "cn", id: 6, name: "cut6" },
  { people: "cn", id: 7, name: "cut7" },
  { people: "cn", id: 8, name: "cut8" },
  { people: "cn", id: 9, name: "cut9" }
]);

const change = (evt): void => {
  console.log("evt: ", evt);
};

onMounted(() => {
  if (!useAppStoreHook().sortSwap) Sortable.mount(new Swap());
  setSortSwap(true);
  new Sortable(document.querySelector(".cut-container"), {
    swap: true,
    forceFallback: true,
    chosenClass: "chosen",
    swapClass: "highlight",
    animation: 300
  });
});
</script>

<template>
  <el-card shadow="never">
    <div class="drag-container">
      <!-- grid列表拖拽 -->
      <el-row :gutter="25">
        <el-col :xs="25" :sm="8" :md="8" :lg="8">
          <el-card shadow="never">
            <div class="cut-container">
              <div
                v-for="(item, index) in cutLists"
                :key="index"
                class="item-cut"
              >
                <p>{{ item.name }}</p>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>
    </div>
  </el-card>
</template>

<style lang="scss" scoped>
/* grid列表拖拽 */
.grid-container {
  display: grid;
  grid-template-rows: 33.3% 33.3% 33.3%;
  grid-template-columns: 33.3% 33.3% 33.3%;
}

.item-single {
  height: 77px;
  font-size: 1.5em;
  line-height: 85px;
  text-align: center;
  cursor: move;
  border: 1px solid #e5e4e9;
}

.item-cut {
  height: 77px;
  font-size: 1.5em;
  line-height: 77px;
  text-align: center;
  cursor: move;
  border: 1px solid #e5e4e9;
}

.item {
  font-size: 2em;
  line-height: 100px;
  text-align: center;
  cursor: move;
  border: 1px solid #e5e4e9;

  @media screen and (width <= 750px) {
    line-height: 90px;
  }
}

.item-1 {
  background-color: #ef342a;
}

.item-2 {
  background-color: #f68f26;
}

.item-3 {
  background-color: #4ba946;
}

.item-4 {
  background-color: #0376c2;
}

.item-5 {
  background-color: #c077af;
}

.item-6 {
  background-color: #f8d29d;
}

.item-7 {
  background-color: #b5a87f;
}

.item-8 {
  background-color: #d0e4a9;
}

.item-9 {
  background-color: #4dc7ec;
}

.chosen {
  border: solid 2px #3089dc !important;
}
</style>
