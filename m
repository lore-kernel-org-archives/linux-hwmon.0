Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2113.outbound.protection.partner.outlook.cn [139.219.17.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121BB346769;
	Thu,  8 Oct 2026 08:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449602; cv=fail; b=ITEV5xpUBpYQsY+DLYt8jU64qZVVhGiYqgCGeD7RAXDk5kmh+WEQkbqz2KrdhK8CCyGFN3m+fLTBiwHINJAQ0zDCOBkK2r7/xFDiwWXrjMLhHLqUH1qfWjY6v7uQmluUhhJnIHNEKh8nbEk+1niKR7uY4akCJ5yFLUtOTKjHTBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449602; c=relaxed/simple;
	bh=P+dnuaP9tvz3xaTyWvtY7mYo5mP32Lc6FE3hGa9bgP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nWJ7e0HtS/uYPQnBiiQ59rhpgViPFnpZNC3oyO7QCdaRjXNbvFZ8JKnypK7g+dqZvDWFosbml70iy+m1CJMS1hkL9fzhlgavdST9gERk4T920Ia4jh4/flJzRaoy+LyS4q61fOQE/vNWgZbp8m+UlcbS0JchxP9/+SuQOdZwqho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChN0ocQLdDglEBmkGpbDJSJAJo4u6hdBj5DiFzdssiUdwGhBBQ4BbFsuWVqaMJzpj53PdNclUMMgrM9kP0gsaFcUHZg9Qpb6PSvrllfjIZeRXEXzEGMm0XQTjV3F0mlMWDXo3zXkegfVBZIG5GL2sXbLvSXJD2+aRaKrC1VLgJSvr5ovispfP3sWVHLT58pWnARnvNNYUfEdpF24PJHWvVbWLdcOLPL+AY5MZXyqWckrjE0A+cyKVvtL3CtsmOIzXu+fupGzTXxh6hXM3jlLjenfV/ZCKQ/y11uIdteURaLYnG/ui39SOjnVdSe7jBiyb+or1a9mbDlj0GXefwoNZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fIaXN2qPWoTLfxh1BquRu6x6uJ056yJeAIVKakACWk=;
 b=hwjHh4qt5KdfyBCDkA3zq/VF7SahZhvZNl+9CeFlUji6YVwvG/4Ce2JsCqdCY2OqZPOgA8SeV61KxoVTgI4NutrNmnrcv5JGCkhLD+HZJ8HC5l8yuEsh88Gm4ndnfbuSmCw10s/9hZTi1Kbb4dfbWV149/23+EwWMiSBVlfReDFIxzauqQT6Hd0qGrxHDSLN0C5SuU4igPnkcuz7+nD53kZL48GDoNvnG3VuALgwBA4yDGwM80QpQtrxaDDp4DYLYqrpAt3lVeiFioInGzfNW0zCHHeYj6BT8uFwUCzrPIJ6pObTl7A7kB4qXEJIzV4qYFNDqSzJ3tc9fmYDf1aX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 07:20:12 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 07:20:12 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v6 2/2] hwmon: (starfive-pwm-fan) Add PWM fan driver for StarFive JHB100
Date: Thu,  8 Oct 2026 00:19:50 -0700
Message-Id: <20261008071950.4772-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008071950.4772-1-changhuang.liang@starfivetech.com>
References: <20261008071950.4772-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::30) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
X-MS-Office365-Filtering-Correlation-Id: 087c189f-2bbe-48d2-f449-08df250c974a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|56012099006|5023799004|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fnWMqVPC74pczJQuPPR121wAmpod9zuv3bO0nuTMlf96QVHfj+7CLPtYR5uDWwy/LSnu4rHF5A/R6oFcfw28pFMsnuVuNtSv4OM419ZIu9vWBMEffuu+TdiAb6XfQhrPeY86SM1o4qZ6uY540VxeXXElf0Zy815HTuoyvW4HVA/HLdsXFbopM9JuqvCqmsHlXEa5WnQrrEdMtTlCY//fUZ5SaRcbRTZ2H8tTR+g4xMHQpLhOuvpv1xakiHnNTvNoUhpHKk5pmNb2G+QFyNOuKZ5Qxinl/355i43j+K7TXi762C2K04w5mVnC01D2EkIT/MSHPpaHlU3JaXy5CbiQ8ycEYZ6qweJFmqvoPH2XEWpK3AlE06l42li/q8VVCAALGu0ouWTXEXB9ixERGTpbzqtPRwncLiC0s3NUUBntQubruoh4nMDleQPB0vqFv5gcRtShOXPqb9ryel0ZnzGMfMCLQW83TIrsJIN3RtrDG5ffX8ks0BfojXtmEHIAC/aWn4yXDl8aGHoGsStB/sz8NVWwNLJSDQdaPeMyuEhtIfLrri+ChEvbappVcBe5nKzy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(56012099006)(5023799004)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cgs/Gu2QA65QauXe5sZZDHF6w0CEwYZvsXkOLl/ilFeYnfwDpiWEJ+djg5Wh?=
 =?us-ascii?Q?ysWIycKORuJlW33INjyKhKBpynEkXdVLmwqQmwlMAuc4A4NwvjFX0fv9OWmh?=
 =?us-ascii?Q?+A+i3CPskrRGE9vBhDr1I6S+mppOf8YMsB3X/MFieMKEpyJtG0Lu8XJCF8od?=
 =?us-ascii?Q?y2PxvpCbGGWLjKcWs3JlKKIn0tNN9Mi6NCOeDgiwhxvL9nd+Rx2QnkRwKtiE?=
 =?us-ascii?Q?4S61r8t8l5M3Kuum3bITowYj19fyBzK05XmgQSTqe2wMa+uQoue/lzKKjRX3?=
 =?us-ascii?Q?YmKDCkOhXhPMwZ1fkErw0qo/r0HECgf8eIxvLNy+njbItJjYFjqoRIK4WrIw?=
 =?us-ascii?Q?N+6eXxctEZ9DjErVwL0h5jWme84Lk29T6AP4MUIBWnSOikK4W4lFvIYOpEcc?=
 =?us-ascii?Q?bpJsdUCyZVnkFDNmkXffsW43Ilx3eKMigLrFEjVwMnIIgeZ4dBqqCaT3mjRy?=
 =?us-ascii?Q?diT02OYatYBdCPbGqTfNiy/JF8SyoqjThbhZxDbiPbuB8uyvmeok4REE7nmi?=
 =?us-ascii?Q?3ebBvd6+wDspJTQz1iueJIpjde6mtgHFG9TlDO/itrNPTOiLMZpvmtx/d+ny?=
 =?us-ascii?Q?5EBWwzjqdm0eLit37LOsLaa2m0MxrRw44l9ZOrj280g2YNTy7bhT98LZqd8t?=
 =?us-ascii?Q?WOASOoUP/sVFNBz/Xx9yViyEm1f0b7jsLwemGNUE2H0vByulJdpWTF2Tt5gG?=
 =?us-ascii?Q?n07ugEllrMAl9QV3TGdUA0kt+e426G2Qe5E5njoDG5VMYCSKWiIFrnHrnHL0?=
 =?us-ascii?Q?7jF+qIhrGaPBV53kF2st1+04l1X5DNLfbQYRzkQ8e4DrNiHd2u660TrwKs3u?=
 =?us-ascii?Q?sWGSJ/0zpTl0M1y5ac0LW5Y258/DQkoaFxyX1162EcbuJAAfrfrwe4KEJXUW?=
 =?us-ascii?Q?F8joXCNooOa6eVqUVP4V4EgkfAPybHr7msPD5RpentD43xyw5IlAsKw76Jjv?=
 =?us-ascii?Q?LUAvfe3UVtkM0IHB/QI8FEJtyPvl2lw+Rbq3U5BNUfM6rBOO23eALR2opCQC?=
 =?us-ascii?Q?yVF4TUDycObFp8NfZu9Tit5WSa0ck3KKoUFm9i+FuHQdzyU/eNBdpYqixmVv?=
 =?us-ascii?Q?u4hk1p8BgMSS7QtotqHw1/UDrgHYhyKgcOTXlvli7BZ1GEYzLBxF1vZoawUs?=
 =?us-ascii?Q?oQJXge+IF8Dl0NFdwLAbsipLTqUmS5Co+6wklhkAuZF+054I+tUqRVJRR2wk?=
 =?us-ascii?Q?MjFwO06Ovv1o3+aNTTyLpX00qwPkgQsfE6m/PkNF6BtKUlrYcUDVUeAW0QiP?=
 =?us-ascii?Q?WDy0aBX08PeWa16ISaL//FBiQhsueAvw4VXUKMOOJOL1A71SK8dYDuU1tpq5?=
 =?us-ascii?Q?bCcaR8+UefPY663GPRRjDeguQbXC05EFI2d2dy93kL65R2hXWokCyVT/7H7d?=
 =?us-ascii?Q?V1rqdhnb/j+myizsA2ecaMiQtVkMT0xlUpZIVscCNIjWC2mJzPX3jkBFpyYy?=
 =?us-ascii?Q?IjGsVbeYILVX7A5vh5c5LbW70AJyi8v0nVy3AbG5U93XAxrwQ1dpJR5DDTFt?=
 =?us-ascii?Q?fR4hnqQSx7j77sfJ+5dEII5SOhYYPaPgMINpjEm3VWHbQbm/M9iTDugiUqsm?=
 =?us-ascii?Q?kI73sVLs317iyE1AuKHGT15aI/nV97lJHQDHXYxGZlKQkf2eu0x3mpUhyP9K?=
 =?us-ascii?Q?Z3LDt0ieo5I2ovUfMtt0R1mf0JQQGgBGYB/CLgGQVWHRPgQ4ZWttojP4Npqr?=
 =?us-ascii?Q?cklJZxDrsBkZOnKRV0EGMMpEU89JJUTIDuDIkn2Ows2wW0802lM9sr7++tZD?=
 =?us-ascii?Q?LzKb0RFi4OVe9KyW3slcKQo+B+6mS2Ul6mocOGQHqFD84tkyoP/v?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087c189f-2bbe-48d2-f449-08df250c974a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 07:20:11.9436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JNAh42JpzxXeRRElP+42aPEWnvc+sSjTqECxOJDrWKMU7H7GP+vunDmzcDL82o+HbVU8LZoYmytp0pBoZiN/dhPUKT+PsTeAU+x3k6Ku2a0hPXevtbVVcK0mOHIDWuw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

Add PWM fan controller driver for StarFive JHB100 SoC.

Fan speed is controlled through up to 8 PWM channels supplied by an
external PWM controller and exposed as pwm[1-8], and one PWM channel can
drive up to two fans. The tachometer block supports 16 independent
inputs and reports fan speed in RPM through the hwmon sysfs interface,
along with stall and low-speed alarms.

For this controller, the special clock and reset operation sequence is:
  probe: clk_prepare_enable() then reset_control_deassert()
  remove: clk_disable_unprepare() then reset_control_assert()

Co-developed-by: William Qiu <william.qiu@starfivetech.com>
Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 Documentation/hwmon/index.rst            |   1 +
 Documentation/hwmon/starfive-pwm-fan.rst |  45 ++
 MAINTAINERS                              |   8 +
 drivers/hwmon/Kconfig                    |  15 +
 drivers/hwmon/Makefile                   |   1 +
 drivers/hwmon/starfive-pwm-fan.c         | 834 +++++++++++++++++++++++
 6 files changed, 904 insertions(+)
 create mode 100644 Documentation/hwmon/starfive-pwm-fan.rst
 create mode 100644 drivers/hwmon/starfive-pwm-fan.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 199ca79621e9..949b46dcc258 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -263,6 +263,7 @@ Hardware Monitoring Kernel Drivers
    sparx5-temp
    spd5118
    sq24860
+   starfive-pwm-fan
    stpddc60
    surface_fan
    sy7636a-hwmon
diff --git a/Documentation/hwmon/starfive-pwm-fan.rst b/Documentation/hwmon/starfive-pwm-fan.rst
new file mode 100644
index 000000000000..c61c01088b78
--- /dev/null
+++ b/Documentation/hwmon/starfive-pwm-fan.rst
@@ -0,0 +1,45 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver starfive-pwm-fan
+==============================
+
+Supported chips:
+
+  * StarFive JHB100
+
+    Prefix: 'starfive_pwm_fan'
+
+    Addresses scanned: -
+
+Authors:
+      - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+Description
+-----------
+
+This driver implements support for the PWM fan controller found on the
+StarFive JHB100 SoC. Fan speed is controlled through a PWM signal supplied
+by 8 PWM channels of an external PWM controller, and measured by a hardware
+tachometer block with 16 independent tachometer inputs. Each tachometer channel
+measures the number of pulses within a fixed 100 ms window.
+
+Each fan-N child node in the devicetree references one PWM channel, which
+may drive up to two fans, and lists the tachometer inputs wired to them.
+
+Sysfs entries
+-------------
+
+===================== =======================================================
+pwm[1-8]              PWM duty cycle (read/write), 0-255. pwmN corresponds
+                      to the Nth fan child node.
+fan[1-16]_input       Fan speed in RPM (read-only), without a fan connected,
+                      reading this value can be significantly slow.
+fan[1-16]_min         Lower fan speed limit in RPM (read/write)
+fan[1-16]_enable      Enable/disable the tachometer channel (read/write)
+fan[1-16]_fault       Fan stall indication (read-only), with the fan running
+                      normally, reading this value can be significantly slow.
+fan[1-16]_min_alarm   Fan speed below fan[1-16]_min (read-only), when
+                      fan[1-16]_input is greater than or equal to
+                      fan[1-16]_min, reading this value can be significantly
+                      slow.
+===================== =======================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 5c57cbb68060..08cadca4a07a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26647,6 +26647,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
 F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
 
+STARFIVE JHB100 PWM FAN DRIVER
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/starfive,jhb100-pwm-fan.yaml
+F:	Documentation/hwmon/starfive-pwm-fan.rst
+F:	drivers/hwmon/starfive-pwm-fan.c
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a475..f0d85da48956 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2467,6 +2467,21 @@ config SENSORS_SPD5118_DETECT
 
 	  If unsure, say Y.
 
+config SENSORS_STARFIVE_PWM_FAN
+	tristate "StarFive JHB100 PWM fan controller"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on PWM
+	help
+	  This driver supports the PWM fan controller found on StarFive SoCs
+	  such as the JHB100. It uses up to 8 PWM outputs supplied by an
+	  external PWM controller to control fan speed, and a tachometer block
+	  with 16 inputs to report fan speed in RPM through the hwmon sysfs
+	  interface, along with stall and low-speed alarms.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called starfive-pwm-fan.
+
 config SENSORS_TC74
 	tristate "Microchip TC74"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4c345ed7261..2b04216bfcf1 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -231,6 +231,7 @@ obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
 obj-$(CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON)	+= socfpga-hwmon.o
 obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
 obj-$(CONFIG_SENSORS_SPD5118)	+= spd5118.o
+obj-$(CONFIG_SENSORS_STARFIVE_PWM_FAN)	+= starfive-pwm-fan.o
 obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
 obj-$(CONFIG_SENSORS_SURFACE_FAN)+= surface_fan.o
 obj-$(CONFIG_SENSORS_SURFACE_TEMP)+= surface_temp.o
diff --git a/drivers/hwmon/starfive-pwm-fan.c b/drivers/hwmon/starfive-pwm-fan.c
new file mode 100644
index 000000000000..22060c40591b
--- /dev/null
+++ b/drivers/hwmon/starfive-pwm-fan.c
@@ -0,0 +1,834 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PWM fan controller driver for StarFive JHB100
+ *
+ * Copyright (C) 2018-2026 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/hwmon.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/jiffies.h>
+#include <linux/math64.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pwm.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+
+#define STARFIVE_FAN_TACH_CH			16
+#define STARFIVE_FAN_MAX			8
+#define STARFIVE_FAN_TACH_PER_FAN		2
+#define STARFIVE_FAN_PWM_VAL_MAX		255
+
+/* Fan-tach register offset */
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
+#define STARFIVE_FAN_TACH_SLOW_INT(ch)		BIT((ch) + 16)
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
+struct starfive_pwm_fan {
+	struct pwm_device *pwm;
+	struct pwm_state pwm_state;
+	unsigned int pwm_value;
+};
+
+struct starfive_fan_tach_ctx {
+	u32 ch_en;
+	u32 measure_time;
+	u32 threshold[STARFIVE_FAN_TACH_CH];
+};
+
+struct starfive_pwm_fan_data {
+	struct device *dev;
+	void __iomem *regs;
+	struct reset_control *rst;
+	struct clk *clk;
+	/* Serializes PWM updates with PM operations */
+	struct mutex pwm_lock;
+	struct starfive_pwm_fan fans[STARFIVE_FAN_MAX];
+	bool tach_present[STARFIVE_FAN_TACH_CH];
+	u8 pulses_per_rev[STARFIVE_FAN_TACH_CH];
+	struct completion comp_stall[STARFIVE_FAN_TACH_CH];
+	struct completion comp_slow[STARFIVE_FAN_TACH_CH];
+	u8 fan_stall[STARFIVE_FAN_TACH_CH];
+	u8 fan_slow[STARFIVE_FAN_TACH_CH];
+	u32 armed_stall;
+	u32 armed_slow;
+	/* tach registers saved across system sleep */
+	struct starfive_fan_tach_ctx tach_ctx;
+	/* protects fan_stall[]/fan_slow[]/armed_* and the STATUS register */
+	spinlock_t lock;
+};
+
+static void starfive_fan_tach_ch_enable(struct starfive_pwm_fan_data *priv, u8 tach_ch,
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
+static void starfive_fan_tach_ch_stall_unmask(struct starfive_pwm_fan_data *priv, u8 tach_ch,
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
+static void starfive_fan_tach_ch_slow_unmask(struct starfive_pwm_fan_data *priv, u8 tach_ch,
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
+static u32 starfive_fan_tach_rpm_to_val(struct starfive_pwm_fan_data *priv, u8 tach_ch, u32 rpm)
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
+static long starfive_fan_tach_val_to_rpm(struct starfive_pwm_fan_data *priv, u8 tach_ch,
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
+static int starfive_fan_tach_get_rpm(struct starfive_pwm_fan_data *priv,
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
+static long starfive_fan_tach_get_rpm_threshold(struct starfive_pwm_fan_data *priv,
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
+static void starfive_set_tach_rpm_threshold(struct starfive_pwm_fan_data *priv,
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
+static bool starfive_fan_tach_get_ch_en(struct starfive_pwm_fan_data *priv,
+					u8 tach_ch)
+{
+	u32 enable;
+
+	enable = readl(priv->regs + STARFIVE_FAN_TACH_CH_EN);
+
+	return !!(enable & STARFIVE_FAN_TACH_EN(tach_ch));
+}
+
+static int starfive_pwm_fan_set_pwm(struct starfive_pwm_fan_data *priv,
+				    int channel, unsigned int pwm)
+{
+	struct starfive_pwm_fan *fan = &priv->fans[channel];
+	struct pwm_state state;
+	int ret;
+
+	guard(mutex)(&priv->pwm_lock);
+
+	state = fan->pwm_state;
+	state.duty_cycle = DIV_ROUND_UP_ULL((u64)pwm * state.period,
+					    STARFIVE_FAN_PWM_VAL_MAX);
+	/*
+	 * Keep the PWM enabled even at zero duty cycle so the output stays
+	 * driven low instead of being left floating by the PWM hardware.
+	 */
+	state.enabled = true;
+
+	ret = pwm_apply_might_sleep(fan->pwm, &state);
+	if (ret)
+		return ret;
+
+	fan->pwm_state = state;
+	fan->pwm_value = pwm;
+
+	return 0;
+}
+
+static int starfive_pwm_fan_pwm_read(struct starfive_pwm_fan_data *priv,
+				     u32 attr, int channel, long *val)
+{
+	switch (attr) {
+	case hwmon_pwm_input:
+		scoped_guard(mutex, &priv->pwm_lock)
+			*val = priv->fans[channel].pwm_value;
+
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int starfive_pwm_fan_fan_read(struct starfive_pwm_fan_data *priv,
+				     u32 attr, int channel, long *val)
+{
+	int ret;
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
+static int starfive_pwm_fan_read(struct device *dev,
+				 enum hwmon_sensor_types type, u32 attr,
+				 int channel, long *val)
+{
+	struct starfive_pwm_fan_data *priv = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_pwm:
+		return starfive_pwm_fan_pwm_read(priv, attr, channel, val);
+	case hwmon_fan:
+		return starfive_pwm_fan_fan_read(priv, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int starfive_pwm_fan_write(struct device *dev,
+				  enum hwmon_sensor_types type, u32 attr,
+				  int channel, long val)
+{
+	struct starfive_pwm_fan_data *priv = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_pwm:
+		if (attr != hwmon_pwm_input)
+			return -EOPNOTSUPP;
+
+		if (val < 0 || val > STARFIVE_FAN_PWM_VAL_MAX)
+			return -EINVAL;
+
+		return starfive_pwm_fan_set_pwm(priv, channel, val);
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_min:
+			if (val < 0 || val > U32_MAX)
+				return -EINVAL;
+
+			starfive_set_tach_rpm_threshold(priv, channel, val);
+
+			return 0;
+		case hwmon_fan_enable:
+			if (val != 0 && val != 1)
+				return -EINVAL;
+
+			starfive_fan_tach_ch_enable(priv, channel, val);
+
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t starfive_pwm_fan_is_visible(const void *drvdata,
+					   enum hwmon_sensor_types type,
+					   u32 attr, int channel)
+{
+	const struct starfive_pwm_fan_data *priv = drvdata;
+
+	switch (type) {
+	case hwmon_pwm:
+		if (!priv->fans[channel].pwm)
+			return 0;
+
+		if (attr == hwmon_pwm_input)
+			return 0644;
+
+		return 0;
+	case hwmon_fan:
+		if (!priv->tach_present[channel])
+			return 0;
+
+		switch (attr) {
+		case hwmon_fan_input:
+		case hwmon_fan_fault:
+		case hwmon_fan_min_alarm:
+			return 0444;
+		case hwmon_fan_min:
+		case hwmon_fan_enable:
+			return 0644;
+		default:
+			return 0;
+		}
+	default:
+		return 0;
+	}
+}
+
+static const struct hwmon_ops starfive_pwm_fan_ops = {
+	.is_visible = starfive_pwm_fan_is_visible,
+	.read = starfive_pwm_fan_read,
+	.write = starfive_pwm_fan_write,
+};
+
+static const struct hwmon_channel_info * const starfive_pwm_fan_info[] = {
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT, HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT, HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT, HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT, HWMON_PWM_INPUT),
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
+static const struct hwmon_chip_info starfive_pwm_fan_chip_info = {
+	.ops = &starfive_pwm_fan_ops,
+	.info = starfive_pwm_fan_info,
+};
+
+static int starfive_pwm_fan_create_fan(struct device *dev, struct device_node *child,
+				       struct starfive_pwm_fan_data *priv,
+				       unsigned int fan_idx)
+{
+	struct starfive_pwm_fan *fan = &priv->fans[fan_idx];
+	u8 tach_ch[STARFIVE_FAN_TACH_PER_FAN];
+	struct pwm_device *pwm;
+	int ret, count;
+	u32 ppr, index;
+
+	count = of_property_count_u8_elems(child, "tach-ch");
+	if (count < 1 || count > STARFIVE_FAN_TACH_PER_FAN)
+		return dev_err_probe(dev, -EINVAL, "%pOF: invalid tach-ch\n", child);
+
+	ret = of_property_read_u8_array(child, "tach-ch", tach_ch, count);
+	if (ret)
+		return dev_err_probe(dev, ret, "%pOF: failed to read tach-ch\n", child);
+
+	/* Parse pulses-per-revolution, default to 2 if not specified */
+	ppr = STARFIVE_FAN_DEFAULT_PULSE_PR;
+	of_property_read_u32(child, "pulses-per-revolution", &ppr);
+
+	if (!ppr || ppr > 4)
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOF: invalid pulses-per-revolution %u, must be 1-4\n",
+				     child, ppr);
+
+	pwm = devm_fwnode_pwm_get(dev, of_fwnode_handle(child), NULL);
+	if (IS_ERR(pwm))
+		return dev_err_probe(dev, PTR_ERR(pwm), "%pOF: could not get PWM\n", child);
+
+	pwm_init_state(pwm, &fan->pwm_state);
+	if (!fan->pwm_state.period)
+		return dev_err_probe(dev, -EINVAL, "%pOF: PWM period is zero\n", child);
+
+	fan->pwm = pwm;
+
+	for (index = 0; index < count; index++) {
+		u8 ch = tach_ch[index];
+
+		if (ch >= STARFIVE_FAN_TACH_CH)
+			return dev_err_probe(dev, -EINVAL, "%pOF: invalid tach-ch %u\n",
+					     child, ch);
+
+		if (priv->tach_present[ch])
+			return dev_err_probe(dev, -EINVAL, "%pOF: duplicate tach-ch %u\n",
+					     child, ch);
+
+		priv->pulses_per_rev[ch] = ppr;
+		priv->tach_present[ch] = true;
+		starfive_fan_tach_ch_enable(priv, ch, true);
+	}
+
+	return 0;
+}
+
+static irqreturn_t starfive_pwm_fan_irq(int irq, void *dev_id)
+{
+	struct starfive_pwm_fan_data *priv = dev_id;
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
+static int starfive_pwm_fan_pwm_disable_all(struct starfive_pwm_fan_data *priv)
+{
+	struct pwm_state state;
+	int i, ret, err = 0;
+
+	guard(mutex)(&priv->pwm_lock);
+
+	for (i = 0; i < STARFIVE_FAN_MAX; i++) {
+		struct starfive_pwm_fan *fan = &priv->fans[i];
+
+		if (!fan->pwm || !fan->pwm_state.enabled)
+			continue;
+
+		state = fan->pwm_state;
+		state.duty_cycle = 0;
+		state.enabled = false;
+
+		/* Keep going so one broken channel does not leave others running */
+		ret = pwm_apply_might_sleep(fan->pwm, &state);
+		if (ret) {
+			dev_err(priv->dev, "Failed to disable PWM of fan %d: %d\n",
+				i, ret);
+			if (!err)
+				err = ret;
+		}
+	}
+
+	return err;
+}
+
+static int starfive_pwm_fan_pwm_restore_all(struct starfive_pwm_fan_data *priv)
+{
+	int i, ret, err = 0;
+
+	guard(mutex)(&priv->pwm_lock);
+
+	for (i = 0; i < STARFIVE_FAN_MAX; i++) {
+		struct starfive_pwm_fan *fan = &priv->fans[i];
+
+		if (!fan->pwm)
+			continue;
+
+		ret = pwm_apply_might_sleep(fan->pwm, &fan->pwm_state);
+		if (ret) {
+			dev_err(priv->dev, "Failed to restore PWM of fan %d: %d\n",
+				i, ret);
+			if (!err)
+				err = ret;
+		}
+	}
+
+	return err;
+}
+
+static void starfive_pwm_fan_pwm_disable(void *data)
+{
+	struct starfive_pwm_fan_data *priv = data;
+
+	starfive_pwm_fan_pwm_disable_all(priv);
+}
+
+static void starfive_fan_tach_save(struct starfive_pwm_fan_data *priv)
+{
+	struct starfive_fan_tach_ctx *ctx = &priv->tach_ctx;
+	int i;
+
+	ctx->ch_en = readl(priv->regs + STARFIVE_FAN_TACH_CH_EN);
+	ctx->measure_time = readl(priv->regs + STARFIVE_FAN_TACH_MEASURE_TIME);
+
+	for (i = 0; i < STARFIVE_FAN_TACH_CH; i++) {
+		if (priv->tach_present[i])
+			ctx->threshold[i] =
+				readl(priv->regs + STARFIVE_FAN_TACH_THRESHOLD(i));
+	}
+}
+
+static void starfive_fan_tach_restore(struct starfive_pwm_fan_data *priv)
+{
+	struct starfive_fan_tach_ctx *ctx = &priv->tach_ctx;
+	int i;
+
+	writel(0, priv->regs + STARFIVE_FAN_TACH_INT_EN);
+	writel(STARFIVE_FAN_TACH_STALL_INT_MASK | STARFIVE_FAN_TACH_SLOW_INT_MASK,
+	       priv->regs + STARFIVE_FAN_TACH_STATUS);
+	writel(ctx->measure_time, priv->regs + STARFIVE_FAN_TACH_MEASURE_TIME);
+
+	for (i = 0; i < STARFIVE_FAN_TACH_CH; i++) {
+		if (priv->tach_present[i])
+			writel(ctx->threshold[i],
+			       priv->regs + STARFIVE_FAN_TACH_THRESHOLD(i));
+	}
+
+	/* Enable channels last so measurement starts with the restored config */
+	writel(ctx->ch_en, priv->regs + STARFIVE_FAN_TACH_CH_EN);
+}
+
+static void starfive_fan_tach_disable(void *data)
+{
+	struct starfive_pwm_fan_data *priv = data;
+
+	clk_disable_unprepare(priv->clk);
+	reset_control_assert(priv->rst);
+}
+
+static int starfive_pwm_fan_probe(struct platform_device *pdev)
+{
+	struct device *hwmon_dev, *dev = &pdev->dev;
+	struct starfive_pwm_fan_data *priv;
+	unsigned int fan_idx;
+	unsigned long clk_rate;
+	int irq;
+	int ret;
+	u32 i;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	spin_lock_init(&priv->lock);
+
+	ret = devm_mutex_init(dev, &priv->pwm_lock);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < STARFIVE_FAN_TACH_CH; i++) {
+		init_completion(&priv->comp_stall[i]);
+		init_completion(&priv->comp_slow[i]);
+	}
+
+	platform_set_drvdata(pdev, priv);
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
+	clk_rate = clk_get_rate(priv->clk);
+	if (!clk_rate || clk_rate > U32_MAX) {
+		clk_disable_unprepare(priv->clk);
+		return dev_err_probe(dev, -EINVAL, "Invalid clock rate: %lu\n",
+				     clk_rate);
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
+	writel(clk_rate / STARFIVE_FAN_DEFAULT_MEASURE_RATIO,
+	       priv->regs + STARFIVE_FAN_TACH_MEASURE_TIME);
+
+	fan_idx = 0;
+	for_each_available_child_of_node_scoped(dev->of_node, child) {
+		if (fan_idx >= STARFIVE_FAN_MAX)
+			return dev_err_probe(dev, -EINVAL,
+					     "Too many fan nodes, at most %d\n",
+					     STARFIVE_FAN_MAX);
+
+		ret = starfive_pwm_fan_create_fan(dev, child, priv, fan_idx++);
+		if (ret)
+			return ret;
+	}
+
+	/* Must be registered after the PWMs are requested */
+	ret = devm_add_action_or_reset(dev, starfive_pwm_fan_pwm_disable, priv);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < STARFIVE_FAN_MAX; i++) {
+		if (!priv->fans[i].pwm)
+			continue;
+
+		ret = starfive_pwm_fan_set_pwm(priv, i, STARFIVE_FAN_PWM_VAL_MAX);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to configure PWM of fan %u\n", i);
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
+
+	ret = devm_request_irq(dev, irq, starfive_pwm_fan_irq, 0, dev_name(dev), priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "starfive_pwm_fan",
+							 priv, &starfive_pwm_fan_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return dev_err_probe(dev, PTR_ERR(hwmon_dev),
+				     "Failed to register hwmon device\n");
+
+	return 0;
+}
+
+static int starfive_pwm_fan_suspend(struct device *dev)
+{
+	struct starfive_pwm_fan_data *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = starfive_pwm_fan_pwm_disable_all(priv);
+	if (ret) {
+		/* ->resume() is not called for us on failure, undo here */
+		starfive_pwm_fan_pwm_restore_all(priv);
+		return ret;
+	}
+
+	starfive_fan_tach_save(priv);
+
+	return 0;
+}
+
+static int starfive_pwm_fan_resume(struct device *dev)
+{
+	struct starfive_pwm_fan_data *priv = dev_get_drvdata(dev);
+
+	starfive_fan_tach_restore(priv);
+
+	return starfive_pwm_fan_pwm_restore_all(priv);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(starfive_pwm_fan_pm,
+				starfive_pwm_fan_suspend,
+				starfive_pwm_fan_resume);
+
+static const struct of_device_id starfive_pwm_fan_of_match[] = {
+	{ .compatible = "starfive,jhb100-pwm-fan", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, starfive_pwm_fan_of_match);
+
+static struct platform_driver starfive_pwm_fan_driver = {
+	.probe = starfive_pwm_fan_probe,
+	.driver	= {
+		.name = "starfive-pwm-fan",
+		.pm = pm_sleep_ptr(&starfive_pwm_fan_pm),
+		.of_match_table = starfive_pwm_fan_of_match,
+	},
+};
+
+module_platform_driver(starfive_pwm_fan_driver);
+
+MODULE_AUTHOR("William Qiu <william.qiu@starfivetech.com>");
+MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JHB100 PWM fan controller driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

