import { chatai } from "@/router/enums";

export default {
  path: "/chatai",
  redirect: "/chatai/index",
  meta: {
    icon: "ri/chat-search-line",
    title: "chat-ai",
    rank: chatai
  },
  children: [
    {
      path: "/chatai/index",
      name: "AI 问答",
      component: () => import("@/views/chatai/index.vue"),
      meta: {
        title: "chat-ai",
        extraIcon: "IF-pure-iconfont-new svg"
      }
    }
  ]
} satisfies RouteConfigsTable;
