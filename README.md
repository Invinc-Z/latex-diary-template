# latex线圈日记本模板
## 仓库地址以及实现效果

[仓库地址](https://github.com/Invinc-Z/latex-diary-template)

<div align=center><img src="https://zzz-drawing-bed.oss-cn-nanjing.aliyuncs.com/img/image-20250520180859884.png" alt="latex线圈日记本模板-1" style="zoom: 50%;" /></div>

<div align=center><img src="https://zzz-drawing-bed.oss-cn-nanjing.aliyuncs.com/img/image-20250328225631115.png" alt="latex线圈日记本模板-2" style="zoom: 50%;" /></div>

---

## 文件和编译说明

| 文件        | 说明                    |
| ----------- | ----------------------- |
| `diary.tex` | 主文件                  |
| `diary.cls` | 库文件                  |
| `fonts/`    | 符号字体文件夹          |
| `Makefile`  | linux编译文件           |
| `clean.bat` | windows一键清理辅助文件 |
| `build.bat` | windows一键编译源文件   |

==**需将字体设置为本地已有的字体**==

```latex
\setCJKmainfont{华文行楷}  
\setmainfont{Times New Roman}
```

**编译方法：**`xelatex *.tex` 运行两次

Windows便捷批处理文件：

- `clean.bat` - 清理所有辅助文件；
-  `build.bat` - 重新编译目录中所有`.tex`并清理辅助文件。

Linux快速编译：

- `make`  - 编译目录中所有`.tex`文件，不清理中间文件；

- `make clean` - 清理所有辅助文件；

- `make build` - 编译所有文件并清理所有辅助文件。

---

## 天气符号指令翻译

| LaTeX 指令      | 中文含义           | 常见天气描述   |
| --------------- | ------------------ | -------------- |
| `\sun`          | 晴天（太阳）       | ☀️ 晴朗无云     |
| `\sunny`        | 晴朗               | 🌞 阳光充足     |
| `\hot`          | 炎热               | 🔥 高温天气     |
| `\windy`        | 大风               | 🌬️ 风力较强     |
| `\clouds`       | 多云               | ☁️ 天空多云     |
| `\snow`         | 雪                 | ❄️ 下雪         |
| `\snowy`        | 下雪的             | 🌨️ 持续降雪     |
| `\snowyRainy`   | 雨夹雪             | 🌧️❄️ 雨雪混合    |
| `\rainy`        | 雨天               | 🌧️ 降雨         |
| `\rainySunny`   | 太阳雨（晴雨交替） | 🌦️ 晴天偶阵雨   |
| `\rainyThunder` | 雷阵雨             | ⛈️ 降雨伴随雷电 |
| `\thunderLight` | 雷电               | ⚡ 闪电（无雨） |
| `\hail`         | 冰雹               | 🌨️💧 冰雹天气    |
| `\dust`         | 沙尘               | 🌫️ 沙尘或雾霾   |

---

## 表情符号指令翻译
| LaTeX 指令        | 中文含义   | 常见表情描述（参考 Emoji） |
| ----------------- | ---------- | -------------------------- |
| `\confused`       | 困惑 😕     | 表示疑惑或不解             |
| `\sad`            | 悲伤 😢     | 难过或沮丧的表情           |
| `\simpleSmile`    | 简单微笑 🙂 | 普通的微笑                 |
| `\slightlySmile`  | 淡淡微笑 😊 | 轻微的笑或友好表情         |
| `\angry`          | 生气 😠     | 愤怒或不满                 |
| `\crying`         | 哭泣 😭     | 大哭或极度悲伤             |
| `\dizzy`          | 晕眩 😵     | 头晕或困惑                 |
| `\rage`           | 暴怒 🤬     | 极度愤怒                   |
| `\winkSmile`      | 眨眼 😉     | 调皮或暗示性的微笑         |
| `\stuckOutTongue` | 吐舌 😛     | 调皮或搞怪的表情           |
| `\rollingEyes`    | 翻白眼 🙄   | 无语或不耐烦               |
| `\confounded`     | 苦恼 😖     | 困惑且烦躁                 |
| `\expressionless` | 无表情 😑   | 面无表情或冷漠             |
| `\heartEyes`      | 爱心眼 😍   | 喜爱或迷恋的表情           |
| `\laughing`       | 大笑 😆     | 开怀大笑                   |
| `\nerdSmile`      | 书呆子笑 🤓 | 呆萌或学霸式的笑           |
| `\openMouth`      | 张嘴 😮     | 惊讶或震惊                 |
| `\smirk`          | 得意 😏     | 狡猾或自满的微笑           |
| `\worried`        | 担忧 😟     | 忧虑或紧张                 |
| `\astonished`     | 震惊 😲     | 极度惊讶或目瞪口呆         |

---

## 参考模板

该模板基于以下模板修改：

- https://github.com/cs-qyzhang/LaTeX-Diary

- https://github.com/Come-on-ZMZ/LaTeX-Diary

---
