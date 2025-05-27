import { $t } from "@/plugins/i18n";
import { board } from "@/router/enums";

export default {
  path: "/board",
  redirect: "/board/index",
  meta: {
    icon: "ri/artboard-line",
    title: $t("menus.pureBoard"),
    rank: board
  }
} satisfies RouteConfigsTable;
