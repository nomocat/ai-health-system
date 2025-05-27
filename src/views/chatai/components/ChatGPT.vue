<script setup lang="ts">
import "deep-chat";
import { ref, onMounted } from "vue";

const chatRef = ref();

onMounted(() => {
  chatRef.value.demo = {
    response: message => {
      console.log(message);
      return {
        text: "仅演示，如需AI服务，请参考 https://deepchat.dev/docs/connect"
      };
    }
  };
});
</script>

<template>
  <deep-chat
    ref="chatRef"
    style="border-radius: 10px"
    class="w-full"
    :messageStyles="{
      default: {
        shared: {
          bubble: {
            maxWidth: '100%',
            backgroundColor: 'unset',
            marginTop: '10px',
            marginBottom: '10px'
          }
        },
        user: {
          bubble: {
            marginLeft: '0px',
            color: 'black'
          }
        },
        ai: {
          outerContainer: {
            backgroundColor: 'rgba(247,247,248)',
            borderTop: '1px solid rgba(0,0,0,.1)',
            borderBottom: '1px solid rgba(0,0,0,.1)'
          }
        }
      }
    }"
    :avatars="{
      default: { styles: { position: 'left' } },
      ai: { src: 'https://xiaoxian521.github.io/hyperlink/svg/openai.svg' }
    }"
    :submitButtonStyles="{
      submit: {
        container: {
          default: {
            padding: '1px 0 0 5px',
            backgroundColor: '#19c37d'
          },
          hover: { backgroundColor: '#0bab69' },
          click: { backgroundColor: '#068e56' }
        },
        svg: {
          content:
            '<?xml version=&quot;1.0&quot; ?> <svg viewBox=&quot;0 0 28 28&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;> <g> <path d=&quot;M21.66,12a2,2,0,0,1-1.14,1.81L5.87,20.75A2.08,2.08,0,0,1,5,21a2,2,0,0,1-1.82-2.82L5.46,13H11a1,1,0,0,0,0-2H5.46L3.18,5.87A2,2,0,0,1,5.86,3.25h0l14.65,6.94A2,2,0,0,1,21.66,12Z&quot;> </path> </g> </svg>',
          styles: {
            default: {
              filter:
                'brightness(0) saturate(100%) invert(100%) sepia(28%) saturate(2%) hue-rotate(69deg) brightness(107%) contrast(100%)'
            }
          }
        }
      },
      loading: {
        container: { default: { backgroundColor: 'white' } },
        svg: {
          styles: {
            default: {
              filter:
                'brightness(0) saturate(100%) invert(72%) sepia(0%) saturate(3044%) hue-rotate(322deg) brightness(100%) contrast(96%)'
            }
          }
        }
      },
      stop: {
        container: {
          default: { backgroundColor: 'white' },
          hover: { backgroundColor: '#dadada52' }
        },
        svg: {
          content:
            '<?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?> <svg viewBox=&quot;0 0 24 24&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;> <rect width=&quot;24&quot; height=&quot;24&quot; rx=&quot;4&quot; ry=&quot;4&quot; /> </svg>',
          styles: {
            default: {
              width: '0.95em',
              marginTop: '0.32em',
              filter:
                'brightness(0) saturate(100%) invert(72%) sepia(0%) saturate(3044%) hue-rotate(322deg) brightness(100%) contrast(96%)'
            }
          }
        }
      }
    }"
    :textInput="{ placeholder: { text: '发送消息' } }"
    :history="[
      { text: '枸杞的功效是什么？', role: 'user' },
      {
        text: '滋补肝肾：用于肝肾阴虚，改善头晕耳鸣、腰膝酸软等。 明目护眼：富含叶黄素、β-胡萝卜素，缓解视力疲劳。 增强免疫力：枸杞多糖可提升免疫细胞活性。 抗氧化抗衰老：清除自由基，延缓衰老。 护肝降血糖：有助于改善脂肪肝、调节血糖（现代研究支持）。',
        role: 'ai'
      }
    ]"
    :demo="true"
    :connect="{ stream: true }"
  />
</template>
