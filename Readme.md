<img width="977" height="509" alt="Untitled" src="https://github.com/user-attachments/assets/51a4e159-b16f-4a45-89cc-0424a4c96b28" />
<div align="center">


<p align="center">
  <img src="assets/WinRTP-Screenshot.png" alt="Windows Repair Tool Pro - WinRTP" width="900">
</p>

<h1 align="center">🛠️ Windows Repair Tool Pro</h1>

<p align="center">
  <strong>أداة شاملة لصيانة وإصلاح وتحسين Windows من مكان واحد</strong>
</p>

<p align="center">
  <img alt="Version" src="https://img.shields.io/badge/Version-1.6-blue?style=flat-square">
  <img alt="Windows" src="https://img.shields.io/badge/Windows-10%20%7C%2011-0078D6?style=flat-square&logo=windows11&logoColor=white">
  <img alt="Batch" src="https://img.shields.io/badge/Batch%20%2B%20PowerShell-Tool-4D4D4D?style=flat-square">
  <img alt="Administrator" src="https://img.shields.io/badge/Admin-Required-orange?style=flat-square">
  <img alt="Open Source" src="https://img.shields.io/badge/Source-Available-success?style=flat-square&logo=github">
</p>

<p align="center">
  تطوير وإعداد <strong>Hesham Taha</strong>
</p>

---

## 📌 نبذة عن الأداة

**Windows Repair Tool Pro (WinRTP)** هي أداة تجمع عددًا كبيرًا من أوامر وأدوات صيانة Windows داخل واجهة واحدة منظمة وسهلة الاستخدام.

بدلًا من البحث عن أوامر **CMD وPowerShell وDISM وSFC وCHKDSK وWinget** أو التنقل بين عشرات صفحات إعدادات Windows، توفر لك WinRTP اختصارات وأدوات جاهزة لتنفيذ الكثير من مهام الإصلاح والصيانة وإدارة النظام.

الأداة مناسبة للمستخدم العادي والمستخدم المتقدم، وتشمل أدوات لإصلاح ملفات النظام، تنظيف الملفات المؤقتة، إدارة الأقراص والتعريفات، إصلاح الشبكة، إدارة التطبيقات والحسابات، تشغيل أدوات Windows الإدارية، بالإضافة إلى مجموعة من إعدادات وتعديلات Windows الاختيارية.

> [!IMPORTANT]
> بعض وظائف WinRTP تقوم بتعديلات فعلية على النظام وتتطلب صلاحيات **Administrator**. اقرأ وصف كل خيار جيدًا، ويُنصح بإنشاء **Restore Point** قبل تنفيذ التعديلات المتقدمة.

---

## ✨ أهم المميزات

| القسم | الوظائف الرئيسية |
|---|---|
| ⚡ **Optimize OS** | إصلاح ملفات Windows، التنظيف، الكاش، السجلات وبعض مهام تحسين النظام |
| 💽 **Disk Tools** | CHKDSK، TRIM/Defrag، معلومات الأقراص، اختبار السرعة وأدوات USB |
| 🛠️ **Advanced Tools** | Safe Mode، BIOS/UEFI، DNS، Power Plans، Debloat وأدوات متقدمة |
| 🩺 **Repair OS** | إصلاح Windows Update وStore والصوت والطباعة وExplorer وخدمات Windows |
| 🛡️ **Security & Privacy** | Microsoft Defender، Firewall، Hosts وبعض إعدادات الخصوصية |
| 🧩 **Drivers Manager** | تحديث ونسخ احتياطي واستعادة وإزالة التعريفات |
| 📦 **Apps Manager** | تثبيت وتحديث وحذف ونسخ قائمة البرامج باستخدام Winget |
| 🔧 **Maintenance Tools** | تشغيل مجموعة كبيرة من أدوات Windows الإدارية والتشخيصية |
| 👤 **User Accounts** | إنشاء وإدارة وتعديل حسابات Windows المحلية |
| 🎮 **Windows Tweaks** | إعدادات اختيارية للأداء والألعاب والواجهة وبعض مكونات Windows |

---

# 🚀 أقسام الأداة بالتفصيل

<details open>
<summary><strong>⚡ 1️⃣ Optimize OS — صيانة وتحسين Windows</strong></summary>

<br>

يحتوي هذا القسم على مجموعة من أدوات الإصلاح والتنظيف الأساسية، ومنها:

- فحص وإصلاح صورة Windows باستخدام **DISM**.
- فحص وإصلاح ملفات النظام باستخدام **SFC**.
- تنظيف Component Store وملفات تحديثات Windows القديمة.
- حذف مجلد **Windows.old** عند توفره.
- تنظيف الملفات المؤقتة ومخلفات النظام.
- تنظيف ملفات وتقارير الأعطال وCrash Dumps.
- تنظيف **Delivery Optimization Cache**.
- تنظيف بعض كاشات تعريفات **NVIDIA وAMD**.
- تنظيف Event Viewer Logs.
- أدوات لإعادة ضبط DNS وبعض مكونات الشبكة.
- تنظيف الذاكرة باستخدام **Microsoft Sysinternals RAMMap** عند اختيار المستخدم.
- وضع صيانة سريع يجمع مجموعة من المهام الشائعة في عملية واحدة.

</details>

<details>
<summary><strong>💽 2️⃣ Disk Tools — أدوات الأقراص والتخزين</strong></summary>

<br>

مجموعة أدوات لإدارة وفحص وحدات التخزين:

- تشغيل وجدولة فحص **CHKDSK**.
- إدارة فحوصات الأقراص المجدولة عند الإقلاع.
- تحسين وحدات التخزين حسب نوعها.
  - **HDD → Defrag**
  - **SSD → TRIM / Optimize**
- عرض حالة الأقراص ومعلومات التخزين.
- عرض معلومات تفصيلية عن وحدات التخزين المتصلة بالجهاز.
- اختبار سرعة القرص **Disk Benchmark**.
- الكتابة على المساحة الحرة لتقليل إمكانية استرجاع الملفات المحذوفة.
- أدوات إصلاح مشاكل الفلاشات وUSB.
- إظهار الملفات التي تم إخفاؤها بواسطة بعض فيروسات الفلاشات.
- استعادة خصائص الملفات والمجلدات المخفية.
- أدوات لمعالجة بعض حالات **USB Write Protection**.

> [!CAUTION]
> عمليات الأقراص وCHKDSK والمسح المتقدم قد تستغرق وقتًا طويلًا. تأكد من اختيار الدرايف الصحيح واحتفظ بنسخة احتياطية من الملفات المهمة قبل تنفيذ العمليات الحساسة.

</details>

<details>
<summary><strong>🛠️ 3️⃣ Advanced Tools — الأدوات المتقدمة</strong></summary>

<br>

يوفر هذا القسم اختصارات ووظائف متقدمة لإدارة Windows، ومنها:

- تفعيل خطة الطاقة **Ultimate Performance**.
- استعادة خطة الطاقة **Balanced**.
- جدولة إيقاف تشغيل الكمبيوتر.
- إلغاء عملية Shutdown مجدولة.
- إعادة التشغيل مباشرة إلى **BIOS / UEFI** على الأجهزة المدعومة.
- الدخول إلى **Safe Mode**.
- العودة من Safe Mode إلى التشغيل الطبيعي.
- أدوات **Windows Debloat**.
- عرض كلمات مرور شبكات Wi‑Fi المحفوظة على الجهاز.
- تعطيل أو إعادة تفعيل Windows Update عند الحاجة.
- تغيير DNS بسهولة.
- تنظيف كاش بعض منصات وأدوات الألعاب.
- قراءة مفتاح Windows OEM المخزن في Firmware عند توفره.
- أدوات إدارة **Context Menu**.
- تحليل سجلات **BSOD / Blue Screen**.
- أدوات النسخ الاحتياطي للنظام.
- التحكم في وصول التطبيقات للإنترنت باستخدام Windows Firewall.

### 🌐 DNS Presets

- Cloudflare DNS
- Google DNS
- Quad9
- AdGuard DNS
- استعادة DNS التلقائي

</details>

<details>
<summary><strong>🩺 4️⃣ Repair OS — إصلاح مشاكل Windows</strong></summary>

<br>

قسم مخصص لمعالجة مجموعة من المشاكل الشائعة في النظام:

- إصلاح مكونات **Windows Update**.
- إصلاح **Microsoft Store** وتطبيقات Windows.
- إعادة بناء **Icon Cache** وThumbnail Cache.
- إصلاح بعض مشاكل **Taskbar وWindows Search وExplorer**.
- إصلاح وإعادة تشغيل خدمات الصوت.
- إصلاح بعض خدمات Bluetooth.
- إصلاح **Print Spooler** ومشاكل الطباعة الشائعة.
- إعادة تشغيل مجموعة من خدمات Windows الأساسية.

</details>

<details>
<summary><strong>🛡️ 5️⃣ Security & Privacy — الحماية والخصوصية</strong></summary>

<br>

يتضمن القسم مجموعة من الأدوات المبنية على مكونات Windows نفسها:

- تشغيل **Microsoft Defender Quick Scan**.
- تشغيل **Microsoft Defender Full Scan**.
- تشغيل **Microsoft Defender Offline Scan** على الأنظمة المدعومة.
- تنظيف سجل حماية Defender عند الحاجة.
- أدوات إصلاح مكونات Windows Defender.
- إعادة ضبط إعدادات **Windows Firewall**.
- إعادة ضبط ملف **Hosts**.
- التحكم في مجموعة من إعدادات Telemetry والخصوصية.
- استعادة بعض إعدادات الخصوصية التي تم تعديلها من خلال الأداة.

</details>

<details>
<summary><strong>🧩 6️⃣ Drivers Manager — إدارة التعريفات</strong></summary>

<br>

إدارة تعريفات Windows بدون الحاجة إلى برامج تعريفات خارجية:

- البحث عن تحديثات التعريفات المتاحة.
- تثبيت تحديثات التعريفات المدعومة.
- إنشاء **Backup** للتعريفات المثبتة.
- استعادة التعريفات من Backup سابق.
- عرض Driver Packages المثبتة على الجهاز.
- إزالة تعريف محدد عند الحاجة.

الميزة مفيدة خصوصًا قبل عمل فورمات أو إعادة تثبيت Windows، أو أثناء تشخيص مشكلة ناتجة عن تعريف معين.

</details>

<details>
<summary><strong>📦 7️⃣ Silent Apps Installer & Apps Manager</strong></summary>

<br>

يعتمد هذا القسم على **Windows Package Manager (Winget)** لتسهيل إدارة التطبيقات.

### إدارة التطبيقات

- البحث عن تحديثات البرامج المثبتة.
- تحديث جميع البرامج المدعومة.
- تحديث برنامج محدد.
- حذف البرامج المدعومة بواسطة Winget.
- البحث عن أي برنامج داخل مستودعات Winget.
- تثبيت التطبيقات مباشرة من داخل WinRTP.
- تصدير قائمة التطبيقات المثبتة.
- استعادة التطبيقات من ملف Winget Export.

### تطبيقات جاهزة للتثبيت السريع

من بين البرامج المتوفرة داخل القائمة:

- Google Chrome
- Mozilla Firefox
- Brave Browser
- Internet Download Manager
- Discord
- Zoom
- WhatsApp Desktop
- WinRAR
- 7-Zip
- Steam
- Epic Games Launcher
- OBS Studio
- VLC Media Player

### حزم Runtime مهمة

يتوفر أيضًا خيار لتثبيت مجموعة من المكونات التي تحتاجها العديد من الألعاب والبرامج، مثل:

- Microsoft Visual C++ Redistributables
- DirectX
- .NET Desktop Runtime
- Microsoft Edge WebView2 Runtime
- Microsoft XNA Framework
- Java Runtime Environment

</details>

<details>
<summary><strong>🔧 8️⃣ Windows Maintenance Tools — أدوات Windows المدمجة</strong></summary>

<br>

بدلًا من البحث عن كل أداة يدويًا، تستطيع WinRTP تشغيل مجموعة كبيرة من أدوات الإدارة والتشخيص مباشرة، ومنها:

1. Task Manager
2. Services Manager
3. Device Manager
4. Disk Cleanup
5. System Configuration — MSCONFIG
6. Registry Editor
7. Startup Folder
8. Resource Monitor
9. Event Viewer
10. Reliability Monitor
11. Windows Tools
12. Programs and Features
13. Network Reset
14. DirectX Diagnostic Tool
15. System Information
16. Temp Folder
17. Advanced System Settings
18. Windows Memory Diagnostic
19. Disk Management
20. Computer Management
21. Group Policy Editor
22. Power Options
23. Sound Control Panel
24. Network Connections
25. Task Scheduler
26. Advanced Windows Firewall
27. Local Users and Groups
28. User Accounts / Netplwiz
29. Performance Monitor
30. Windows Update Settings

> [!NOTE]
> بعض أدوات Windows مثل Group Policy Editor أو Local Users and Groups قد لا تكون متوفرة في جميع إصدارات Windows.

</details>

<details>
<summary><strong>👤 9️⃣ User Accounts Manager — إدارة المستخدمين</strong></summary>

<br>

يوفر مجموعة من أدوات إدارة حسابات Windows المحلية:

- إنشاء حساب مستخدم جديد.
- حذف حساب مستخدم.
- إعادة تسمية حساب محلي.
- تغيير كلمة مرور حساب.
- منح صلاحيات Administrator.
- إزالة صلاحيات Administrator.
- إخفاء مستخدم من شاشة تسجيل الدخول.
- إظهار الحساب مرة أخرى.
- تعطيل حساب محلي مؤقتًا.
- إعادة تفعيل الحساب.
- التحكم في حساب Administrator المدمج في Windows.
- عرض معلومات الحسابات المحلية.

</details>

<details>
<summary><strong>🎮 🔟 Windows Tweaks — الأداء والألعاب والواجهة</strong></summary>

<br>

يوفر WinRTP مجموعة **اختيارية** من تعديلات Windows للمستخدم الذي يريد تحكمًا أكبر في النظام، ومنها:

- تقليل Menu Show Delay.
- استعادة قائمة Right Click الكلاسيكية في Windows 11.
- تعطيل Lock Screen.
- تقليل بعض Visual Effects.
- تعطيل Sticky Keys Popups.
- تعديل بعض إعدادات Network Throttling.
- تعطيل Bing Search داخل Start Menu.
- تعطيل **SysMain / Superfetch** عند الحاجة.
- تعطيل بعض مكونات **Game DVR / Xbox Game Bar**.
- تعطيل Mouse Acceleration.
- تعطيل Hibernation وحذف `hiberfil.sys`.
- التحكم في بعض إعدادات **VBS / Memory Integrity**.
- تفعيل Ultimate Performance.
- التحكم في Windows Update Peer-to-Peer Delivery.
- تطبيق مجموعة من التعديلات دفعة واحدة.
- استعادة مجموعة من إعدادات Windows الافتراضية.

> [!NOTE]
> تعديلات الأداء لا تضمن زيادة FPS أو تقليل Latency على كل الأجهزة. النتيجة تختلف حسب الهاردوير والتعريفات والبرامج وإعدادات Windows المستخدمة.

</details>

---

## 🛟 Backup & Recovery

توفر الأداة عدة خيارات للمساعدة قبل عمليات الصيانة أو إعادة تثبيت النظام:

- إنشاء **System Restore Point** من القائمة الرئيسية.
- Backup لتعريفات Windows.
- استعادة التعريفات من Backup سابق.
- تصدير قائمة البرامج المثبتة باستخدام Winget.
- إعادة تثبيت البرامج من Winget Export.
- الوصول إلى أدوات Backup إضافية للنظام.

---

## 📥 طريقة التحميل والتشغيل

### الطريقة الأولى — تحميل الملف مباشرة

1. افتح صفحة المشروع على GitHub.
2. قم بتحميل ملف الأداة بصيغة `.bat`.
3. اضغط بزر الفأرة الأيمن على الملف.
4. اختر **Run as administrator**.
5. ستفتح القائمة الرئيسية للأداة.

### الطريقة الثانية — Clone للمشروع

```bash
git clone https://github.com/newmatrix/WinRTP.git
```

بعد ذلك شغّل ملف الأداة بصلاحيات Administrator.

> [!TIP]
> يفضل تحميل WinRTP دائمًا من **المستودع الرسمي** للتأكد من أنك تستخدم النسخة المنشورة بواسطة المطور.

---

## ⚙️ متطلبات التشغيل

- Windows 10 أو Windows 11.
- صلاحيات Administrator لمعظم وظائف الإصلاح والصيانة.
- PowerShell.
- اتصال بالإنترنت للوظائف التي تعتمد على التحميل أو الخدمات Online.
- Winget لوظائف تثبيت وتحديث التطبيقات.

قد تحتاج بعض الوظائف الاختيارية إلى تنزيل أدوات أو مكونات إضافية من مصادرها الرسمية.

---

## 🟢 خطوة أنصح بها قبل التعديلات المتقدمة

من القائمة الرئيسية تستطيع استخدام:

```text
[0] Create Restore Point
```

إنشاء Restore Point قبل تغييرات النظام الكبيرة يوفر لك خيارًا إضافيًا للرجوع في حالة حدوث مشكلة أو إذا أردت التراجع عن بعض التعديلات.

---

## ⚠️ ملاحظات مهمة قبل الاستخدام

> [!WARNING]
> WinRTP ليست مجرد واجهة عرض؛ بعض الخيارات تنفذ أوامر إدارية وتعديلات مباشرة على Windows.

- اقرأ اسم ووصف الخيار قبل تشغيله.
- لا تقاطع عمليات **DISM أو SFC أو CHKDSK أو Defender Scan** أثناء التنفيذ.
- بعض الإصلاحات قد تحتاج إلى Restart بعد الانتهاء.
- تعطيل خدمات أو ميزات Windows قد يؤثر على وظائف تعتمد عليها.
- احتفظ بنسخة احتياطية من الملفات المهمة قبل عمليات الأقراص أو التعديلات المتقدمة.
- لا تستخدم Tweaks لمجرد أنها موجودة؛ استخدم التعديل الذي تحتاج إليه فقط.

---

## 🛡️ لماذا قد يظهر تحذير من برنامج الحماية؟

Windows Repair Tool Pro عبارة عن Batch Tool تنفذ العديد من أوامر الإدارة والصيانة، مثل:

- طلب صلاحيات Administrator.
- تشغيل CMD وPowerShell.
- تعديل Registry في بعض الخيارات.
- التحكم في بعض Services.
- تشغيل أدوات إصلاح Windows.
- تعديل إعدادات الشبكة والجدار الناري.
- تنظيف ملفات النظام والكاش.

هذه الأنواع من السلوكيات قد تجعل بعض حلول الحماية تتعامل بحذر مع ملفات Batch غير الموقعة أو تعرض تحذيرًا عامًا.

وجود تحذير **لا يكفي وحده للحكم على الملف**؛ لذلك يُنصح دائمًا بمراجعة الكود المصدري وتحميل الأداة من المستودع الرسمي فقط.

### 🔍 المشروع قابل للمراجعة

ميزة نشر الأداة على GitHub هي أن ملف Batch نفسه يمكن فتحه وقراءة الأوامر التي ينفذها قبل تشغيله.

---


## 💡 لماذا WinRTP؟

الهدف من المشروع ليس استبدال أدوات Windows، بل **جمعها وتنظيمها وتسهيل الوصول إليها**.

بدلًا من حفظ عشرات الأوامر أو البحث كل مرة عن مكان إعداد معين، تحاول WinRTP جمع مهام الصيانة والإصلاح والإدارة الأكثر استخدامًا داخل Toolbox واحدة.

يمكن أن تكون مفيدة في حالات مثل:

- تشخيص وإصلاح مشاكل Windows.
- تجهيز جهاز بعد تثبيت Windows جديد.
- Backup للتعريفات قبل الفورمات.
- إعادة تثبيت البرامج بسرعة.
- الوصول السريع لأدوات Windows الإدارية.
- صيانة أجهزة متعددة.
- تجربة Tweaks محددة بدون البحث عن أوامرها يدويًا.

---

## 📸 Screenshot

ضع Screenshot للأداة في:

```text
assets/WinRTP-Screenshot.png
```

وسيظهر تلقائيًا في أعلى صفحة الـREADME.

---

## 👨‍💻 المطور

**Hesham Taha**  
صانع محتوى تقني متخصص في Windows والكمبيوتر والبرامج والشروحات التقنية.

### 🌐 الروابط الرسمية

- ▶️ **YouTube:** https://www.youtube.com/@heshamtaha1/
- 💻 **GitHub Repository:** https://github.com/newmatrix/WinRTP

إذا أفادك المشروع، يمكنك دعمه من خلال إعطاء المستودع ⭐ **Star** ومشاركة الأداة مع من قد يحتاجها.

---

## 🤝 المساهمة والإبلاغ عن المشاكل

إذا واجهت مشكلة أو لاحظت Bug:

- افتح **Issue** داخل GitHub Repository.
- اذكر إصدار Windows المستخدم.
- اذكر إصدار WinRTP.
- وضح الخيار الذي قمت بتشغيله.
- أرفق رسالة الخطأ أو Screenshot إن أمكن.

هذا يساعد على تشخيص المشكلة وتطوير الإصدارات القادمة بشكل أفضل.

---

## © حقوق الملكية

© 2026 **Hesham Taha** — All Rights Reserved.

تم تطوير المشروع لأغراض صيانة وإدارة وتحسين أنظمة Windows.

يرجى الرجوع إلى شروط المشروع قبل إعادة نشر أو تعديل أو توزيع الأداة.

---

<p align="center">
  <strong>🛠️ Windows Repair Tool Pro — أدوات Windows التي تحتاجها في مكان واحد</strong>
</p>

<p align="center">
  شكرًا لاستخدام WinRTP ❤️
</p>
