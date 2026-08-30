Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B844A32;
	Sun, 30 Aug 2026 02:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788058362; cv=fail; b=fKy4lHAXpH0huqL7ssZyRTMhPgR/vPdCdQS1sMcHhj+6LgklHnQkXCH73zuYGFFEPiU/0Z6T7jotB2W/nRr3cEgCwIbNErRkX/nJ9A8oxcPI/6unIaJ2qGGQwanMtF0sRvpYKIKgU+p0lTZjkUS2vJgnYvZvZFM6lLs9/N1YQWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788058362; c=relaxed/simple;
	bh=Uk3FNqLQfcG4apxoJznmRchzGXFZ8a6UTFV8/e5A4g8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dixxo5U3Sulk43SwL2n5TscxZiLvXIUcXqkOqw1Z3Gkw/o9WXmFmlzPAw+UUMyVB8dmFWheo/ZOsfT6BcUIUpDw4uSw9PRHPk7SS3ciPdFX5KO6cpaWiOBd8Ry5DzkC9afy4HcdPoMEPzNVIEjbtzkjgmX9yJ1/dYabHC0JoUcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDGllSugiMie/NAn0PjIW6Xs9mF332OLruyHA4yJAIwH0qPsooTMlQYNzRkG5Hl5YANCJE6mykV55KrSr6IUp4Dq494ZOGYAk455nl7D87UhIjBKDAbsjVQ4dtSug6lkQnyKDngKvo4falbLZwy5eq/xRs6Q31IfhOEyK3apPhnrMsjC4BfW/aGcYx/r5Z3PQZ9XmToJm7hFz3hts6WJpURENqAhjmO8cwB30xPQPNVG5xKqbTnUsrNhRMcdZorWaU5FchXs/LU7mVMLD+9waJ0eOZoCXl8+dU0PgQpS7eM2wmRHHanSZT6nQt5Q8CvZrtWxyF26v+MsdeuVc7pzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAey36BT5N7pxfVICB7C4MH5XjmrOxYE0j4yDHQWIaU=;
 b=a54xEJUSyi2XVjxrpWm/4uTPqIldrjs/1klt4x3lkJFko4s8m9aYdDnbU0JNj4KD/Gda/XMwjHuW+MvBPWt8rK6uyY5c+vGipydsaDpH9+vYObHesJoXtcMR9WHG1YLVDGODXNVi8o0EGytPv2GQByZn3u8WCWQFhQYJBKyIUXtlEwvXQyv5+qDM0feZ3n0wOYLYtduoGFkSHB9oOPYtNMjofl2bJYzDTMN9f70xB8i9i65YVKtragYHOLsYtzvmowFmOa74dxNWkT8uFzy1VpM0CyFWLacS6HtA5Vc3XjO+oMqShbqW0M/EgvG/VaGEGkkRp9HVY+cADrZtdK8JoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Sun, 30 Aug
 2026 01:19:55 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sun, 30 Aug 2026 01:19:55 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v4 2/2] hwmon: (starfive-fan-tach) Add fan tach driver for StarFive JHB100
Date: Sat, 29 Aug 2026 18:19:41 -0700
Message-Id: <20260830011941.40199-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
References: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::15) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7904fb-c47c-40e0-4742-08df0634cc79
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|56012099006|10067099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	EtykLF8JwPHeOCaRFy0Q6OPxpBkBMdsRKRqEuJhuQZdvLKDiZDCGgRmzlvsxF78OuJ71rr6DTVv1EEGIffRuEZRsbOOXeWvjqYmI8G0rd1EfLu5idYxrRWcV9fLc2pY3gsi6dgEUNESgtDt20jQ1fCuhvIukuuCJYMb6dLEUeLwDgQjqBkx2TezFijpfADsPMIWMuKKI0Jhx9TYFsFRaXoH7XmK5Dp2VJ3EdnH+CsZPgGOXYTWE/ikGNIWc5BG320BkSOMv3413OcymQRXuWM0wxDKNiiY8h6K9HZ2HTcrjaPv4omZYuK8fpBMpiwJ1gbWIH/I3isC6ZlIWm7+Kpk6/csvR1XpYubC2XFrIqAFlsow+sLuTXhtlenYKerRRZGAND8oZrJX0DhltOoUmv+VGK+ZlmkCrye/jioy0sGhUyXi9VhDywYr69zHnPcsy9QbfSi9kYzyE8wVe4yLbyvOzfoy+03uA9R0ZEbJbZmCONM+uskPfDUk3c/ShkoVpg6MrrTvcgV1cLPPr+iKe9h4eMlAHUG0op2KogfIbTlpU++eOmspbCxHqbMTK2DmY6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?80+vF2736VtUn3P2g9S1uPg1X7lfqDHfpzycoEAJJJEGInqtkn5z82GQXhI2?=
 =?us-ascii?Q?Css+/IJOh70giqiBkhZhaQ6ZU3HgIhFPgf4sxVMvlBb2J1ZjE8MPcRAPYHnr?=
 =?us-ascii?Q?OvPcPTjN82Csl3h18l80spG6eZtKJxLUCc3RV2szAzAKgjpriOm6zb9+vgAQ?=
 =?us-ascii?Q?nXK+0HNUrpkApP/qTmbLhOp+zW5RW3XWG+TmlacGiCtUR+BacvJXoGJaS43s?=
 =?us-ascii?Q?lisFL6JYBUXkyNTQdaz38zFpzxTYzEFaMlsHBK6nr7GMDxulM0nOeGrK4lBe?=
 =?us-ascii?Q?l48YDcBXXflcL6mnZQ4Le3eRKWrO78ubEJ5LT9vgV9lq1R8z9oay4ew/u5IY?=
 =?us-ascii?Q?jxf2EO88vpzta8WMFObtqYCsGA9M943yRjS7whnxeb23VbIByWI+1OEMUVVs?=
 =?us-ascii?Q?9kwFpzQpGo6x7lTbDAlQV0gEIjBtgJsDS9lJOE9MWzAfJS9SS+lVFSYKBIaG?=
 =?us-ascii?Q?piMS7EpbdvewbjXAEXVa9vGLSWWK11dTFuEPKDCgWzFToKgNcr5usSR2Oe6U?=
 =?us-ascii?Q?wW9RaLgMH5jxviGdGLUKFwYraTS2CVuS4QqKa2s9tos0e6iTTd5DCGkM8ppt?=
 =?us-ascii?Q?Mp/ZfMgx3/pQKiz0hxyE/yIbW0U3bQr/UxgJdPe0UU0QNqxFttuDwPiHLY4l?=
 =?us-ascii?Q?naSZjHgcObcNtNdPPP5GTEeArPhWAyPhnwuyj1twP5q5MY02XKRhIxBXv4Du?=
 =?us-ascii?Q?ynP9NTx5tETHf4TxGN/8z//HVAS9+VPtuFQ47aQf8WRagSB5yVmOYGvFSbhU?=
 =?us-ascii?Q?Qsaty4rMIZqaoCIrM6raHP1sYHI7SgkVLG4ikKdXiMQUrHdSRC2mtT0vViCu?=
 =?us-ascii?Q?MmiNwWmeH+V21v4te7zsmS5oP1tQHKQO+MwV/JOOxZwIYL/8ZO8CrqlmSacq?=
 =?us-ascii?Q?ysyviZhOTJlVPtb0Oh1Zk/QM/WWDQCFbIDJN5W0nP25Q5uRf77Lwtst+nBZi?=
 =?us-ascii?Q?zQlyyCKfbPEarFOA7E40vzuDlEEusD8WOzn7+ueGs6SSeD6TQcW2GESezJAY?=
 =?us-ascii?Q?/3lGV0oTau5KT7HlzZfnyXKTm4w4FVkNhPi0wbs9ANOo+dqmJAGenTisHbgM?=
 =?us-ascii?Q?hstMaQm/NdfY2+/omAcL4AJTnEpAYGWSieIWjFdp1lhxSr8tFukswm5uX8a6?=
 =?us-ascii?Q?7EkIVZctDo/50nGYCSxmWUCyCreIW8R//jtlkNvf1c1N72W8O4i53qIsabk5?=
 =?us-ascii?Q?hLd9t8laS4nLP9j8RiTuvIopEki+itV8hZW/r+Aia/4QRQ0eL5bZA+AaaUjE?=
 =?us-ascii?Q?xVfxV6T38PUlrecDviw6KTX9LKhT70ttpYEoGXSmQ/JWupJHxJ8uQ+UWaSXe?=
 =?us-ascii?Q?GSE61Dz+OGHP4TnkQKQOx/3c8sYnDOjBP6+simT/yKrbpBDDqgQPvXOiMm94?=
 =?us-ascii?Q?S16BU9vJyFMEELOwmTsv4RP5DVW4+aAtKJXlmgJJNTjZ9sVwcBspbWolzvne?=
 =?us-ascii?Q?N8IOclCe0fsZLe8ZHgM9uquFnX4/vnN7SuyfY0Lbh/Z7q0rwSW44JVAhA0N6?=
 =?us-ascii?Q?zjWA94beOGCPXS8MOj8aPTmMd3WHngXw6/qUCbUX9wggSI/dmmr1HS1rfuXJ?=
 =?us-ascii?Q?G+guD8lh+MbfAYpZm/8E/0GL1z5c5Wx9SGKu3vqf2m1JGsqNhhmGnBw9QUGT?=
 =?us-ascii?Q?9NlC3cl0pNO+rTBdjVX+/w5EulDNieX6IRwp9hGixFz7o402SQd98kxGn/PD?=
 =?us-ascii?Q?J5IOyZ6057JGGH/X5JOJw+b4yOx//rY+IrKZpQr4p4kUMWXxaHYBTO16/Fo0?=
 =?us-ascii?Q?kn3uqDOyQouWHR1977gqh7BtZ/T9+azkGIfe3tgmHCggGOK+DriF?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7904fb-c47c-40e0-4742-08df0634cc79
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 01:19:54.9598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1EZZvfPaPHJgqTMTo13l9w9n12ZyFFY88cjlyh/iq617TjW9REGeJQXnz6yYT7Nz9mTsA5wLZgrmQDrnQCShwi61oKQ7LS0VknoUk8QA1K359c5OR4WOFNFiU3w3MnP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add fan tach driver for StarFive JHB100 SoC.

The controller supports up to 16 independent fan tachometer inputs and
reports fan speed in RPM through the hwmon sysfs interface, along with
stall and low-speed alarms.

For this controller, the special clock and reset operation sequence is:
  probe: clk_prepare_enable() then reset_control_deassert()
  remove: clk_disable_unprepare() then reset_control_assert()

Co-developed-by: William Qiu <william.qiu@starfivetech.com>
Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 Documentation/hwmon/index.rst             |   1 +
 Documentation/hwmon/starfive-fan-tach.rst |  38 ++
 MAINTAINERS                               |   8 +
 drivers/hwmon/Kconfig                     |  14 +
 drivers/hwmon/Makefile                    |   1 +
 drivers/hwmon/starfive-fan-tach.c         | 542 ++++++++++++++++++++++
 6 files changed, 604 insertions(+)
 create mode 100644 Documentation/hwmon/starfive-fan-tach.rst
 create mode 100644 drivers/hwmon/starfive-fan-tach.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 29130df44d12..0d64e4cf1051 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -253,6 +253,7 @@ Hardware Monitoring Kernel Drivers
    smsc47m1
    sparx5-temp
    spd5118
+   starfive-fan-tach
    stpddc60
    surface_fan
    sy7636a-hwmon
diff --git a/Documentation/hwmon/starfive-fan-tach.rst b/Documentation/hwmon/starfive-fan-tach.rst
new file mode 100644
index 000000000000..1931472993c9
--- /dev/null
+++ b/Documentation/hwmon/starfive-fan-tach.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver starfive-fan-tach
+===============================
+
+Supported chips:
+
+  * StarFive JHB100
+
+    Prefix: 'starfive_fan_tach'
+
+    Addresses scanned: -
+
+Authors:
+      - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+Description
+-----------
+
+This driver implements support for the fan tachometer controller found on
+the StarFive JHB100 SoC. The controller supports up to 16 independent fan
+tachometer inputs. Each tachometer channel measures the number of pulses
+within a fixed 100 ms window.
+
+Sysfs entries
+-------------
+
+===================== =======================================================
+fan[1-16]_input       Fan speed in RPM (read-only), without a fan connected,
+                      reading this value can be significantly slow.
+fan[1-16]_min         Lower fan speed limit in RPM (read/write)
+fan[1-16]_enable      Enable/disable the tachometer channel (read/write)
+fan[1-16]_fault       Fan stall indication (read-only), with the fan running
+                      normally, reading this value can be significantly slow.
+fan[1-16]_min_alarm   Fan speed below fan[1-16]_min (read-only), when
+                      fan[1-16]_input is greater than or equal fan[1-16]_min,
+                      reading this value can be significantly slow.
+===================== =======================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index c545aa121d51..83318d2e3e2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25897,6 +25897,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
 F:	drivers/irqchip/irq-starfive-jhb100-intc.c
 
+STARFIVE JHB100 FAN-TACH DRIVER
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
+F:	Documentation/hwmon/starfive-fan-tach.rst
+F:	drivers/hwmon/starfive-fan-tach.c
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5c2d3ff5fce8..2c0000f8e777 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2383,6 +2383,20 @@ config SENSORS_SPD5118_DETECT
 
 	  If unsure, say Y.
 
+config SENSORS_STARFIVE_FAN_TACH
+	tristate "StarFive Fan-Tach driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  This driver provides support for the fan tachometer controller
+	  found on StarFive SoCs such as the JHB100. The controller supports
+	  up to 16 independent fan tachometer inputs and reports fan speed
+	  in RPM through the hwmon sysfs interface, along with stall and
+	  low-speed alarms.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called starfive-fan-tach.
+
 config SENSORS_TC74
 	tristate "Microchip TC74"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 63effc0ab8d1..80b2704b94e5 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -223,6 +223,7 @@ obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
 obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
 obj-$(CONFIG_SENSORS_SPD5118)	+= spd5118.o
+obj-$(CONFIG_SENSORS_STARFIVE_FAN_TACH)	+= starfive-fan-tach.o
 obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
 obj-$(CONFIG_SENSORS_SURFACE_FAN)+= surface_fan.o
 obj-$(CONFIG_SENSORS_SURFACE_TEMP)+= surface_temp.o
diff --git a/drivers/hwmon/starfive-fan-tach.c b/drivers/hwmon/starfive-fan-tach.c
new file mode 100644
index 000000000000..d2f539cbaee5
--- /dev/null
+++ b/drivers/hwmon/starfive-fan-tach.c
@@ -0,0 +1,542 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * FAN-TACH controller driver for StarFive JHB100
+ *
+ * Copyright (C) 2018-2026 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/hwmon.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+
+#define STARFIVE_FAN_TACH_CH			16
+
+/* Fan-tach register offest */
+#define STARFIVE_FAN_TACH_STATUS		0x0c
+
+#define STARFIVE_FAN_TACH_SPEED(ch)		(((ch) * 0x04) + 0x10)
+#define STARFIVE_FAN_TACH_SPEED_VALID		BIT(31)
+#define STARFIVE_FAN_TACH_VALUE_MASK		GENMASK(30, 0)
+
+#define STARFIVE_FAN_TACH_THRESHOLD(ch)		(((ch) * 0x04) + 0x50)
+
+#define STARFIVE_FAN_TACH_INT_EN		0x90
+#define STARFIVE_FAN_TACH_STALL_INT_MASK	GENMASK(15, 0)
+#define STARFIVE_FAN_TACH_SLOW_INT_MASK		GENMASK(31, 16)
+#define STARFIVE_FAN_TACH_STALL_INT(ch)		BIT(ch)
+#define STARFIVE_FAN_TACH_SLOW_INT(ch)		(BIT(ch) << 16)
+
+#define STARFIVE_FAN_TACH_MEASURE_TIME		0x94
+
+#define STARFIVE_FAN_TACH_CH_EN			0x98
+#define STARFIVE_FAN_TACH_EN(ch)		BIT(ch)
+
+#define STARFIVE_FAN_DEFAULT_PULSE_PR		2
+#define STARFIVE_FAN_DEFAULT_MEASURE_RATIO	10
+#define STARFIVE_FAN_DEFAULT_RPM_PAUSE_TIME	(60 * STARFIVE_FAN_DEFAULT_MEASURE_RATIO)
+
+#define STARFIVE_FAN_TACH_TIMEOUT \
+	(USEC_PER_SEC / STARFIVE_FAN_DEFAULT_MEASURE_RATIO)
+
+#define STARFIVE_FAN_TACH_TIMEOUT_JIFFIES \
+	(msecs_to_jiffies(1000) / STARFIVE_FAN_DEFAULT_MEASURE_RATIO)
+
+#define FAN_ATTRIBUTE_SET \
+	(HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_ENABLE | \
+	 HWMON_F_FAULT | HWMON_F_MIN_ALARM)
+
+struct starfive_fan_tach_data {
+	void __iomem *regs;
+	struct reset_control *rst;
+	struct clk *clk;
+	bool tach_present[STARFIVE_FAN_TACH_CH];
+	unsigned long clk_rate; /* APB clock frequency */
+	u8 pulses_per_rev[STARFIVE_FAN_TACH_CH];
+	struct completion comp_stall[STARFIVE_FAN_TACH_CH];
+	struct completion comp_slow[STARFIVE_FAN_TACH_CH];
+	u8 fan_stall[STARFIVE_FAN_TACH_CH];
+	u8 fan_slow[STARFIVE_FAN_TACH_CH];
+	u32 armed_stall;
+	u32 armed_slow;
+	/* protects fan_stall[]/fan_slow[]/armed_* and the STATUS register */
+	spinlock_t lock;
+};
+
+static void starfive_fan_tach_ch_enable(struct starfive_fan_tach_data *priv, u8 tach_ch,
+					bool enable)
+{
+	if (enable) {
+		writel(readl(priv->regs + STARFIVE_FAN_TACH_CH_EN) |
+		       STARFIVE_FAN_TACH_EN(tach_ch),
+		       priv->regs + STARFIVE_FAN_TACH_CH_EN);
+	} else {
+		writel(readl(priv->regs + STARFIVE_FAN_TACH_CH_EN) &
+		       ~(STARFIVE_FAN_TACH_EN(tach_ch)),
+		       priv->regs + STARFIVE_FAN_TACH_CH_EN);
+	}
+}
+
+static void starfive_fan_tach_ch_stall_unmask(struct starfive_fan_tach_data *priv, u8 tach_ch,
+					      bool unmask)
+{
+	if (unmask) {
+		writel(readl(priv->regs + STARFIVE_FAN_TACH_INT_EN) |
+		       STARFIVE_FAN_TACH_STALL_INT(tach_ch),
+		       priv->regs + STARFIVE_FAN_TACH_INT_EN);
+	} else {
+		writel(readl(priv->regs + STARFIVE_FAN_TACH_INT_EN) &
+		       ~STARFIVE_FAN_TACH_STALL_INT(tach_ch),
+		       priv->regs + STARFIVE_FAN_TACH_INT_EN);
+	}
+}
+
+static void starfive_fan_tach_ch_slow_unmask(struct starfive_fan_tach_data *priv, u8 tach_ch,
+					     bool unmask)
+{
+	if (unmask) {
+		writel(readl(priv->regs + STARFIVE_FAN_TACH_INT_EN) |
+		       STARFIVE_FAN_TACH_SLOW_INT(tach_ch),
+		       priv->regs + STARFIVE_FAN_TACH_INT_EN);
+	} else {
+		writel(readl(priv->regs + STARFIVE_FAN_TACH_INT_EN) &
+		       ~STARFIVE_FAN_TACH_SLOW_INT(tach_ch),
+		       priv->regs + STARFIVE_FAN_TACH_INT_EN);
+	}
+}
+
+static u32 starfive_fan_tach_rpm_to_val(struct starfive_fan_tach_data *priv, u8 tach_ch, u32 rpm)
+{
+	u64 tach_val;
+	u8 ppr;
+
+	ppr = priv->pulses_per_rev[tach_ch];
+
+	tach_val = (u64)rpm * ppr;
+	tach_val = div_u64(tach_val, STARFIVE_FAN_DEFAULT_RPM_PAUSE_TIME);
+
+	return min_t(u64, tach_val, STARFIVE_FAN_TACH_VALUE_MASK);
+}
+
+static long starfive_fan_tach_val_to_rpm(struct starfive_fan_tach_data *priv, u8 tach_ch,
+					 u32 tach_val)
+{
+	u64 rpm;
+	u8 ppr;
+
+	ppr = priv->pulses_per_rev[tach_ch];
+
+	rpm = (u64)tach_val * STARFIVE_FAN_DEFAULT_RPM_PAUSE_TIME;
+
+	return div_u64(rpm, ppr);
+}
+
+static int starfive_fan_tach_get_rpm(struct starfive_fan_tach_data *priv,
+				     u8 tach_ch, long *rpm)
+{
+	u32 val;
+	int ret;
+
+	ret = readl_poll_timeout(priv->regs + STARFIVE_FAN_TACH_SPEED(tach_ch),
+				 val, val & STARFIVE_FAN_TACH_SPEED_VALID,
+				 100, STARFIVE_FAN_TACH_TIMEOUT);
+	if (ret)
+		return -ENODATA;
+
+	val = FIELD_GET(STARFIVE_FAN_TACH_VALUE_MASK, val);
+	if (!val) {
+		/* Sampling = 0 may mean no valid capture; wait 1.5 more cycles for valid read. */
+		fsleep(STARFIVE_FAN_TACH_TIMEOUT + STARFIVE_FAN_TACH_TIMEOUT / 2);
+		ret = readl_poll_timeout(priv->regs + STARFIVE_FAN_TACH_SPEED(tach_ch),
+					 val, val & STARFIVE_FAN_TACH_SPEED_VALID,
+					 100, STARFIVE_FAN_TACH_TIMEOUT);
+		if (ret)
+			return -ENODATA;
+
+		val = FIELD_GET(STARFIVE_FAN_TACH_VALUE_MASK, val);
+	}
+
+	*rpm = starfive_fan_tach_val_to_rpm(priv, tach_ch, val);
+
+	return 0;
+}
+
+static long starfive_fan_tach_get_rpm_threshold(struct starfive_fan_tach_data *priv,
+						u8 tach_ch)
+{
+	u32 val;
+
+	val = readl(priv->regs + STARFIVE_FAN_TACH_THRESHOLD(tach_ch));
+
+	val = FIELD_GET(STARFIVE_FAN_TACH_VALUE_MASK, val);
+
+	return starfive_fan_tach_val_to_rpm(priv, tach_ch, val);
+}
+
+static void starfive_set_tach_rpm_threshold(struct starfive_fan_tach_data *priv,
+					    u8 tach_ch, u32 val)
+{
+	u32 reg_val;
+
+	reg_val = starfive_fan_tach_rpm_to_val(priv, tach_ch, val);
+	reg_val = clamp_val(reg_val, 1, STARFIVE_FAN_TACH_VALUE_MASK);
+
+	writel(reg_val, priv->regs + STARFIVE_FAN_TACH_THRESHOLD(tach_ch));
+}
+
+static bool starfive_fan_tach_get_ch_en(struct starfive_fan_tach_data *priv,
+					u8 tach_ch)
+{
+	u32 enable;
+
+	enable = readl(priv->regs + STARFIVE_FAN_TACH_CH_EN);
+
+	return !!(enable & STARFIVE_FAN_TACH_EN(tach_ch));
+}
+
+static int starfive_fan_tach_hwmon_read(struct device *dev,
+					enum hwmon_sensor_types type, u32 attr,
+					int channel, long *val)
+{
+	struct starfive_fan_tach_data *priv = dev_get_drvdata(dev);
+	int ret = 0;
+
+	switch (attr) {
+	case hwmon_fan_fault:
+		scoped_guard(spinlock_irqsave, &priv->lock) {
+			writel(STARFIVE_FAN_TACH_STALL_INT(channel),
+			       priv->regs + STARFIVE_FAN_TACH_STATUS);
+			/* clear fan_stall first */
+			priv->fan_stall[channel] = 0;
+			reinit_completion(&priv->comp_stall[channel]);
+			priv->armed_stall |= BIT(channel);
+		}
+
+		starfive_fan_tach_ch_stall_unmask(priv, channel, true);
+
+		/* Waiting for hardware to measure */
+		wait_for_completion_timeout(&priv->comp_stall[channel],
+					    2 * STARFIVE_FAN_TACH_TIMEOUT_JIFFIES);
+
+		starfive_fan_tach_ch_stall_unmask(priv, channel, false);
+
+		scoped_guard(spinlock_irqsave, &priv->lock) {
+			priv->armed_stall &= ~BIT(channel);
+			*val = priv->fan_stall[channel];
+		}
+
+		break;
+	case hwmon_fan_input:
+		if (!starfive_fan_tach_get_ch_en(priv, channel))
+			return -ENODATA;
+
+		ret = starfive_fan_tach_get_rpm(priv, channel, val);
+		if (ret < 0)
+			return ret;
+
+		break;
+	case hwmon_fan_min:
+		*val = starfive_fan_tach_get_rpm_threshold(priv, channel);
+
+		break;
+	case hwmon_fan_min_alarm:
+		scoped_guard(spinlock_irqsave, &priv->lock) {
+			writel(STARFIVE_FAN_TACH_SLOW_INT(channel),
+			       priv->regs + STARFIVE_FAN_TACH_STATUS);
+			/* clear fan_slow first */
+			priv->fan_slow[channel] = 0;
+			reinit_completion(&priv->comp_slow[channel]);
+			priv->armed_slow |= BIT(channel);
+		}
+
+		starfive_fan_tach_ch_slow_unmask(priv, channel, true);
+
+		/* Waiting for hardware to measure */
+		wait_for_completion_timeout(&priv->comp_slow[channel],
+					    2 * STARFIVE_FAN_TACH_TIMEOUT_JIFFIES);
+
+		starfive_fan_tach_ch_slow_unmask(priv, channel, false);
+
+		scoped_guard(spinlock_irqsave, &priv->lock) {
+			priv->armed_slow &= ~BIT(channel);
+			*val = priv->fan_slow[channel];
+		}
+
+		break;
+	case hwmon_fan_enable:
+		*val = starfive_fan_tach_get_ch_en(priv, channel);
+
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int starfive_fan_tach_hwmon_write(struct device *dev,
+					 enum hwmon_sensor_types type, u32 attr,
+					 int channel, long val)
+{
+	struct starfive_fan_tach_data *priv = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_fan_min:
+		if (val < 0 || val > U32_MAX)
+			return -EINVAL;
+
+		starfive_set_tach_rpm_threshold(priv, channel, val);
+		break;
+	case hwmon_fan_enable:
+		if (val != 0 && val != 1)
+			return -EINVAL;
+
+		starfive_fan_tach_ch_enable(priv, channel, val);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static umode_t starfive_fan_tach_dev_is_visible(const void *drvdata,
+						enum hwmon_sensor_types type,
+						u32 attr, int channel)
+{
+	const struct starfive_fan_tach_data *priv = drvdata;
+
+	if (!priv->tach_present[channel])
+		return 0;
+
+	switch (attr) {
+	case hwmon_fan_input:
+	case hwmon_fan_fault:
+	case hwmon_fan_min_alarm:
+		return 0444;
+	case hwmon_fan_min:
+	case hwmon_fan_enable:
+		return 0644;
+	}
+
+	return 0;
+}
+
+static const struct hwmon_ops starfive_fan_tach_ops = {
+	.is_visible = starfive_fan_tach_dev_is_visible,
+	.read = starfive_fan_tach_hwmon_read,
+	.write = starfive_fan_tach_hwmon_write
+};
+
+static const struct hwmon_channel_info *starfive_fan_tach_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
+			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
+			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
+			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
+			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
+			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
+			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
+			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET),
+	NULL
+};
+
+static const struct hwmon_chip_info starfive_fan_tach_chip_info = {
+	.ops = &starfive_fan_tach_ops,
+	.info = starfive_fan_tach_info,
+};
+
+static int starfive_fan_tach_create_fan(struct device *dev, struct device_node *child,
+					struct starfive_fan_tach_data *priv)
+{
+	u8 tach_ch[STARFIVE_FAN_TACH_CH];
+	int ret, count;
+	u32 ppr, index;
+
+	count = of_property_count_u8_elems(child, "tach-ch");
+	if (count < 1 || count > STARFIVE_FAN_TACH_CH)
+		return -EINVAL;
+
+	ret = of_property_read_u8_array(child, "tach-ch", tach_ch, count);
+	if (ret)
+		return ret;
+
+	/* Parse pulses-per-revolution, default to 2 if not specified */
+	ppr = STARFIVE_FAN_DEFAULT_PULSE_PR;
+	of_property_read_u32(child, "pulses-per-revolution", &ppr);
+
+	if (!ppr || ppr > 4)
+		return dev_err_probe(dev, -EINVAL,
+				     "Invalid pulses-per-revolution %u, must be 1-4\n", ppr);
+
+	for (index = 0; index < count; index++) {
+		u8 ch = tach_ch[index];
+
+		if (ch >= STARFIVE_FAN_TACH_CH)
+			return dev_err_probe(dev, -EINVAL, "Invalid tach-ch %d\n", ch);
+
+		priv->pulses_per_rev[ch] = ppr;
+		priv->tach_present[ch] = true;
+		starfive_fan_tach_ch_enable(priv, ch, true);
+	}
+
+	return 0;
+}
+
+static irqreturn_t starfive_fan_tach_irq(int irq, void *dev_id)
+{
+	struct starfive_fan_tach_data *priv = dev_id;
+	u32 fan_status;
+	int i;
+
+	guard(spinlock)(&priv->lock);
+
+	fan_status = readl(priv->regs + STARFIVE_FAN_TACH_STATUS);
+	if (!fan_status)
+		return IRQ_NONE;
+
+	writel(fan_status, priv->regs + STARFIVE_FAN_TACH_STATUS);
+
+	for (i = 0; i < STARFIVE_FAN_TACH_CH; i++) {
+		if (!priv->tach_present[i])
+			continue;
+
+		if ((fan_status & STARFIVE_FAN_TACH_STALL_INT(i)) &&
+		    (priv->armed_stall & BIT(i))) {
+			priv->fan_stall[i] = 1;
+			complete(&priv->comp_stall[i]);
+		}
+
+		if ((fan_status & STARFIVE_FAN_TACH_SLOW_INT(i)) &&
+		    (priv->armed_slow & BIT(i))) {
+			priv->fan_slow[i] = 1;
+			complete(&priv->comp_slow[i]);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void starfive_fan_tach_disable(void *data)
+{
+	struct starfive_fan_tach_data *priv = data;
+
+	clk_disable_unprepare(priv->clk);
+	reset_control_assert(priv->rst);
+}
+
+static int starfive_fan_tach_probe(struct platform_device *pdev)
+{
+	struct device *hwmon_dev, *dev = &pdev->dev;
+	struct starfive_fan_tach_data *priv;
+	int irq;
+	int ret;
+	u32 i;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->lock);
+
+	for (i = 0; i < STARFIVE_FAN_TACH_CH; i++) {
+		init_completion(&priv->comp_stall[i]);
+		init_completion(&priv->comp_slow[i]);
+	}
+
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regs))
+		return dev_err_probe(dev, PTR_ERR(priv->regs),
+				     "Unable to map IO resources\n");
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk),
+				     "Unable to get fan tach's clock\n");
+
+	priv->rst = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(priv->rst))
+		return dev_err_probe(dev, PTR_ERR(priv->rst),
+				     "Unable to get fan tach's reset\n");
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable clock\n");
+
+	priv->clk_rate = clk_get_rate(priv->clk);
+	if (!priv->clk_rate) {
+		clk_disable_unprepare(priv->clk);
+		return dev_err_probe(dev, -EINVAL, "Unable to get clock's rate\n");
+	}
+
+	ret = reset_control_deassert(priv->rst);
+	if (ret) {
+		clk_disable_unprepare(priv->clk);
+		return dev_err_probe(dev, ret, "Failed to deassert reset\n");
+	}
+
+	ret = devm_add_action_or_reset(dev, starfive_fan_tach_disable, priv);
+	if (ret)
+		return ret;
+
+	/* Mask all sources before touching status / requesting the IRQ. */
+	writel(0, priv->regs + STARFIVE_FAN_TACH_INT_EN);
+	writel(STARFIVE_FAN_TACH_STALL_INT_MASK | STARFIVE_FAN_TACH_SLOW_INT_MASK,
+	       priv->regs + STARFIVE_FAN_TACH_STATUS);
+	writel(priv->clk_rate / STARFIVE_FAN_DEFAULT_MEASURE_RATIO,
+	       priv->regs + STARFIVE_FAN_TACH_MEASURE_TIME);
+
+	for_each_child_of_node_scoped(dev->of_node, child) {
+		ret = starfive_fan_tach_create_fan(dev, child, priv);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to create fan %pOF\n", child);
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
+
+	ret = devm_request_irq(dev, irq, starfive_fan_tach_irq, 0, pdev->name, priv);
+	if (ret)
+		return ret;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "starfive_fan_tach",
+							 priv, &starfive_fan_tach_chip_info,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct of_device_id starfive_fan_tach_of_match[] = {
+	{ .compatible = "starfive,jhb100-fan-tach", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, starfive_fan_tach_of_match);
+
+static struct platform_driver starfive_fan_tach_driver = {
+	.probe = starfive_fan_tach_probe,
+	.driver	= {
+		.name = "starfive-fan-tach",
+		.of_match_table = starfive_fan_tach_of_match,
+	},
+};
+
+module_platform_driver(starfive_fan_tach_driver);
+
+MODULE_AUTHOR("William Qiu <william.qiu@starfivetech.com>");
+MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JHB100 Fan Tach device driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

