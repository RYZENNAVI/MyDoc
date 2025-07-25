## 任务整理（硕士论文相关）

### 1. 前后端任务文件夹咨询

- **目标**：创建用于前端（JavaScript, TypeScript, React, Angular）和后端（SQL, Django, Flask, FastAPI）开发的任务文件夹。
- **操作建议**：
  - 明确每一类任务的结构，例如：`frontend/js-basic/`, `frontend/react/`, `backend/sql/`, `backend/django/` 等。
  - 每个任务文件夹内应包含：
    - 任务说明文档（Markdown 格式）
    - 示例代码（如有）
    - 命令输出记录（用于后续测试）
    - 测试脚本（可选）

- **协作建议**：
  - 与 Yunus Emre Ertekin 协调 JavaScript / TypeScript 相关任务，保持风格统一。
  - 与 Christian Hofmann 讨论无需框架的现代 JavaScript 部分。
  - 任务开发阶段请在 Discord 中汇报进展。
- **来源**：


@Yixiang Li @Yunus Bitte sichten Sie Web/Web-Grundlagen/*. Brauchen wir diese Taskgroup? (Eher nein.) Gibt es in den Aufgaben einzelne bewahrenswerte Gedanken? (Dann bitte als Notiz festhalten).
Danach bitte die ganze Aufgabengruppe in einem einzigen Commit löschen, sedrila.yaml anpassen nicht vergessen.
---
@Yunus Desgleichen bitte für Web/JavaScript/*: Bitte saugen Sie den verwertbaren Restgehalt der existierenden (unfertigen) Aufgaben auf und löschen Sie sie dann nach und nach. 
@Yixiang Li Analog bitte für Web/Django/django-Einführung.
---
Die idee der Taskgroup ist gut, aber aus meiner sicht nicht nötig. Da ich innerhalb meines JS Themengebiet auch eine Client-Server-Kommunikation simulieren möchte, würde ich die Taskgroup entfernen und wichtige themen übernehmen und aufbereiten

Was sagst du dazu @Yixiang Li?
---
@Yixiang Li @Yunus Bitte sichten Sie analog auch Web/HTTP/*, machen Sie POST, State, Status fertig und werfen Sie den Rest weg. 
Das gehört bearbeitet, bevor wir irgendwo anders mit Web-Requests anfangen, damit die Aufgaben ordentlich modular bleiben. (Diese Aufgabengruppe ist auch für andere Zweige des ProPra als Web relevant.)
---
Ich habe mir die Aufgaben dieser Taskgroup durchgelesen. Die darin behandelten grundlegenden Konzepte zu Frontend und Backend können wir in die JavaScript-Aufgaben sowie in die von mir betreuten Django-Aufgaben integrieren. Daher bin ich ebenfalls dafür, die Taskgroup zu löschen. Wir können sie bei einem der nächsten Commits direkt entfernen, einschließlich des entsprechenden Eintrags in der sedrila.yaml.
---
Gern. Löschungen bitte stets in separaten Commits, die keine Zufügungen enthalten.
以下是完整中文翻译：

---

@Yixiang Li @Yunus
请查看 `Web/Web-Grundlagen/*` 目录。我们是否还需要这个任务组？（倾向于不需要。）这些任务中是否包含一些值得保留的想法？（如果有，请以备注的形式记录下来。）
之后请在一个单独的提交中删除整个任务组，并别忘了调整 `sedrila.yaml`。

---

@Yunus
同样请查看 `Web/JavaScript/*`：请吸收现有（未完成）任务中仍有价值的内容，然后逐步删除它们。
@Yixiang Li
请同样处理 `Web/Django/django-Einführung` 目录。

---

这个任务组的思路是不错的，但在我看来并非必需。由于我在 JavaScript 主题中也计划模拟客户端-服务器通信，因此我倾向于删除这个任务组，同时保留并整理其中的重要主题。

你怎么看，@Yixiang Li？

---

@Yixiang Li @Yunus
请也查看 `Web/HTTP/*`，请完成有关 `POST`、`State`、`Status` 的任务，其余的删除。
在我们从其他地方开始涉及 Web 请求之前，必须先处理这些内容，以确保任务保持良好的模块化。（这个任务组对 ProPra 的其他分支也具有重要意义，而不仅限于 Web。）

---

我已经阅读了这个任务组中的所有任务。其中涉及的关于前端与后端的基础概念，我们可以整合进 JavaScript 任务和我负责的 Django 任务中。因此，我也支持删除这个任务组。我们可以在接下来的某次提交中将其直接移除，并同时删除 `sedrila.yaml` 中的相关条目。

---

当然可以。**请务必将删除操作始终放在单独的提交中，不要和新增内容混在一起。**

### 2. 教学理念（Didaktisches Konzept）

- **目的**：为编程练习提供结构化、循序渐进的学习体验。
- **基本原则**：
  - 引导性任务设计：从基础语法到应用场景逐步展开。
  - 任务分层结构：
    - Task-Driven（独立任务）：适合短时练习与技能点训练。
    - Project-Oriented（项目式任务）：多个子任务构成完整项目。
  - 技术对比分析纳入教学目标（例如：React vs. Angular、Django vs. Flask）。
- **建议内容结构**：
  - 每个任务说明中标明学习目标、预期输出、关键知识点。
  - 提供任务依赖关系（assumes/requires）以供测试和组织。
  - 可以参考查看别人的论文来研究

---

### 3. 自动化测试实现

- **目标**：为 sedrila 和 propra-inf 提供自动化测试，确保练习题在长期运行中的稳定性。
- **测试建议方案**：
  - 使用命令协议（Kommandoprotokoll）作为输入输出测试基准。
  - 添加注释用于测试识别：
    - `#= exact`：输出必须精确匹配。
    - `#= regex`：使用正则表达式匹配输出。
    - `#= skip`：此命令不参与输出验证。
  - 示例：
    ```sh
    # 安装依赖
    sudo apt install sqlite3  #= skip

    # 查询数据库
    sqlite3 test.db "SELECT COUNT(*) FROM users;"  #= exact: 5
    ```
- **执行顺序**：
  - 遵循任务的 `requires` 和 `assumes` 属性执行依赖测试。
- **扩展方向**：
  - sedrila 的测试套件可适当扩展，但保持轻量。
  - propra-inf 目前无自动测试，建议从基础任务开始添加。

---

> 如需进一步说明某一部分或需要模板示例，请告知。
