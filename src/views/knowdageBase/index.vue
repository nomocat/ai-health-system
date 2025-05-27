<template>
  <div class="knowledge-base p-4">
    <!-- 上传区域 -->
    <el-card class="mb-4">
      <el-upload
        class="upload-area"
        drag
        accept=".pdf"
        :auto-upload="false"
        :on-change="handleFileChange"
      >
        <el-icon><UploadFilled /></el-icon>
        <div class="el-upload__text">拖拽文件或点击上传</div>
        <template #tip>
          <div class="el-upload__tip">只能上传 PDF 文件，大小不限</div>
        </template>
      </el-upload>
    </el-card>

    <!-- 文件列表 -->
    <el-card>
      <template #header>
        <div class="flex justify-between items-center">
          <span>文件列表</span>
        </div>
      </template>

      <el-table :data="fileList" border style="width: 100%">
        <el-table-column prop="name" label="文件名" />
        <el-table-column prop="title" label="标题" />
        <el-table-column prop="uploadTime" label="上传时间" />
      </el-table>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { UploadFilled } from "@element-plus/icons-vue";

interface FileItem {
  name: string;
  title: string;
  uploadTime: string;
}

const fileList = ref<FileItem[]>([
  {
    name: "生产手册.pdf",
    title: "生产手册",
    uploadTime: "2025-05-25 09:00"
  },
  {
    name: "质检规范.pdf",
    title: "质检规范",
    uploadTime: "2025-05-20 14:30"
  }
]);

const handleFileChange = (file: any) => {
  const fileName = file.name;
  const title = file.name.replace(".pdf", "");
  const now = new Date();
  const uploadTime = `${now.getFullYear()}-${(now.getMonth() + 1)
    .toString()
    .padStart(2, "0")}-${now.getDate().toString().padStart(2, "0")} ${now
    .getHours()
    .toString()
    .padStart(2, "0")}:${now.getMinutes().toString().padStart(2, "0")}`;

  fileList.value.push({
    name: fileName,
    title,
    uploadTime
  });
};
</script>

<style scoped>
.knowledge-base {
  max-width: 800px;
  margin: 0 auto;
}
.upload-area {
  border: 2px dashed #dcdfe6;
  border-radius: 6px;
  background-color: #f5f7fa;
  padding: 20px;
  text-align: center;
}
</style>
