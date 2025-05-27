<script setup lang="ts">
import { h } from "vue";
import { ElEmpty } from "element-plus";
import { deviceDetection } from "@pureadmin/utils";
import {
  ChatGPT,
  Bard,
  Bing,
  iMessage,
  Blue,
  LoFi,
  Red,
  Dark,
  FullInput,
  Group,
  MessageCode,
  Speech,
  IntroPanel
} from "./components";
import IMessage from "./components/iMessage.vue";

defineOptions({
  name: "ChatAi"
});

const swiper = [
  { id: 0, label: "AI 健康问答 讯飞星火", component: IMessage }
  // { id: 0, label: "AI 健康问答 ChatGPT", component: ChatGPT }
];

const swiperExample: any[] = [
  { id: 0, label: "ChatGPT 风格", component: ChatGPT },
  {
    id: 1,
    label: "Gemini 风格",
    component: Bard
  },
  {
    id: 2,
    label: "BingChat 风格",
    component: Bing
  },
  {
    id: 3,
    label: "iMessage 风格",
    component: iMessage
  },
  {
    id: 4,
    label: "蓝色主题且可设置背景图像",
    component: Blue
  },
  {
    id: 5,
    label: "渐变主题且可设置背景图像",
    component: LoFi
  },
  {
    id: 6,
    label: "红色风格",
    component: Red
  },
  {
    id: 7,
    label: "深色模式",
    component: Dark
  },
  {
    id: 8,
    label: "全宽输入框",
    component: FullInput
  },
  {
    id: 9,
    label: "分组消息",
    component: Group
  },
  {
    id: 10,
    label: "代码消息",
    component: MessageCode
  },
  {
    id: 11,
    label: "语音输入",
    component: Speech
  },
  {
    id: 12,
    label: "简介面板",
    component: IntroPanel
  },
  {
    id: 13,
    label: "更多示例",
    component: h(ElEmpty, {
      description: "敬请期待",
      style: { minWidth: "320px", height: "350px" }
    })
  }
];
</script>

<template>
  <el-space wrap class="w-full">
    <el-card v-for="item in swiper" :key="item.id" class="w-[80%]">
      <template #header>
        {{ item.label }}
      </template>
      <component
        :is="item.component"
        class="w-full"
        style="width: 100%; margin-right: 10px"
      />
    </el-card>
  </el-space>
</template>

<style lang="scss" scoped>
:deep(.el-card__body) {
  overflow: auto;
}

@media screen and (width <= 750px) {
  :deep(.el-card__body) {
    padding: 12px;
  }

  .main-content {
    margin: 0 !important;
  }
}
</style>
