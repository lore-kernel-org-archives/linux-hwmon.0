Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2119.outbound.protection.partner.outlook.cn [139.219.17.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31EB524B16;
	Wed, 23 Sep 2026 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168892; cv=fail; b=UbHVK/UXYecfw/thbrUup3hA8o1rAtsa9am5SerVtX4DOGpygUTSb8LfQ7xlGBXI6m5Vk5YtnaxTQIx1D0wBmA8p5dJHPk1GLofrOcUEOJF6Ska1sMQ5SARNBWKlNWc+zfibnDii/z4Q4kObMXyG7FSIwug4lOyB6A5xy3pGCAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168892; c=relaxed/simple;
	bh=VxXpY0MkGy4j81QpzTUnsQKv2LXWooKmc1g3rjZsUD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KGb8WsC74/GIs+TDWyevsz0dYq4x4B6A67MuwtZRuoAF0axVighp9ZFFG/LZ48AhzxtiWDzyYD00TSWXIK6tGSLHxUHr6blLy3DFrSN0epx8VUDadYlXo+afcwLRQqIEC6F5QDuM/A1Hkiwy4kO3n7UZ+oeeVDTqv2NlKw2lwok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6nwGdFoQmD2fknHcIDDpH/zPe2K+6SIhgvF3zk5aJZyXV5gQuvb8AGWkuzS7Hxyp3YXgGeO6Xzuyh71wpWbb5sUHlb/EJUI4xepz1pDd4ls9EkLjPd9OlgEDkMW3tDdyDDqd7Lv+7p/O+Zzs1nZ0a/8GZvZoVBxkuxM0toRR64u8Mg3AzXtVTZ+jy3yh1K8Dar5gY2XhilAnhCXLTgHink9lQXA8SK1lwMTTcBewXkEGw82TTUlkevytZoUeu1LDRoxVEcLUSpfjYPsePcWbwaXbWKpyiMS0cwMA8OV5za+GxyWR/l6K5PkjPj77ZS+BUqR0KjxkAZJadYyhuH9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bi4VO4cd6RfeFV+1KBC8yc78hWL9eeghuYbIz+mDwGU=;
 b=XOqItN70jmy09cZcmd8bARL/aSwmdFyNBgxepTtn0WzVNf84KBsGSIO9rRG+VUERVBbFm9Fp34NRG3lv6X6os9EngKCeSCCtNC8YvtsmcrgmLA/ybvpj81HrEL3KZq5waXeBy1ulXhpIQtpRQgOaqSG1nO25WJTb1GKlxzflOeCDTYSbtC2m0X6CsUdEAYZgXHthMIjsmpaREOr7VZlIcQodBfpkwSBN+viidLmZsto3bBBCF4+a1R4vuyYWHaaXrxjbjPQytl8Pacunqwuia2QVlw2RpyFqgxETvvJnnnFxlgjWqvhE6GLfpz0L8D+QiXKQiNeAr97/UvpwQn32Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 13:07:51 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.014; Wed, 23 Sep 2026 13:07:51 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v5 2/2] hwmon: (starfive-pwm-fan) Add PWM fan driver for StarFive JHB100
Date: Wed, 23 Sep 2026 06:06:24 -0700
Message-Id: <20260923130624.239499-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260923130624.239499-1-changhuang.liang@starfivetech.com>
References: <20260923130624.239499-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0008.CHNPR01.prod.partner.outlook.cn
 (10.43.110.209) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b2a7bf5-8b5c-4c23-feab-08df1973ac0e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|38350700014|6133799003|3023799007|10067099003|56012099006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tzdfFXFKkQkBtvZDc0JpnJ/2ETrEhe7hNjZdA1rePXEawv0NVBD+byWZM7MpkIXqREf4/eKixmi9w/ZAy7sWaRO7tGYXl0siInCrZS+FekBQcCjjMBjEz1+xNV9wF8R+UHMIKl3KiuAH05ie1ND6ZLuDllZTkkKnq2KdXZiEhxPqZoaPnpjAsOp0BScF2NiwpG0Uk4/uYto5GZXuhlwbqIiElmeB9dS5jgR/rF0qdqHWxOcqVPF8gE+H4DCXdSo/EyOf3oUY7NcMBVV9ZYcNouRkZET+uP1Z/2rA+x/2hGz61/pqzkmwr88WVJpoY7GHA5GGBgsXv9JSfyzdTmyQyleuvtIL172C7Szwcl6VJH3IKejCEZj3IphaZY7znOzmxUKXnafqOJDWLRscNPZ2kPrB9GUJQLP4gE1EBkz0BsoCS//IVeL4DwXkvW/AgkXNIWUz57tNkOcA5T2OO3rE75NyyVvzyIn/yFc3N4b7GYmrSA1ml0dL2nfMb82sBgD/Snll6dwfSQQNR3MLLg2RjlofkqN3+7ac/E59FGbXyt+LmkR3s5T2GtoeSIvbh4Nz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5NZIzNYXQ2p0AZGPYZmuoRCgFQN0k65VY7I/PkvqhwlWMlZD9I8Y3pMS9rhA?=
 =?us-ascii?Q?kHlGc7IL/AofglTlqVaV7Z3ii4m9GktN4fNkrNXorYgoQlz2p/w0dgx7WMsU?=
 =?us-ascii?Q?dcZMWdwgXbHc6TjPs0F8orNeVOSiEtIM3kxGE/GZQLpGYBEnsk2YGeG/6Pn3?=
 =?us-ascii?Q?EbhChhrVZokiLDNmhTh+7xMW2Jxbe3ujEfmO3XqTakKRfhlDy32A0z2ZVPu/?=
 =?us-ascii?Q?yNCag+FtI8cz5NwaP/Mj+VKTE2JAgXCng/0AM4zzSzchW3tuXHq64+UO3a4/?=
 =?us-ascii?Q?Bk/OJW0DV2isZYMmWpEx28XgAlyrPS6iItqnfSIiMzIH2EtOj5f1kyqLG4u2?=
 =?us-ascii?Q?3txw1RrD6qpZ+MBz5DHqEg0LYHglpbkwp0kdQgiUFPRPlVMhMfH+QhYV4bvd?=
 =?us-ascii?Q?fSWxlP9NqZRdVLkz7UiEGDrbthqXMmsf7tNjdx3kpmP/4mI8iY+jmiv3CQ3v?=
 =?us-ascii?Q?0vWyFOEWqSZNOQazj4Yjv1c0NP+vDRESgr5YBpaVEKxUBM+gWM970HGmZ549?=
 =?us-ascii?Q?XK6qOB5/sqtXsX5uDTU9ER428I+/w20bReRN1IoBxvxpZCPNUmCgRW3L4Frv?=
 =?us-ascii?Q?q/R89Ei3DL/YDl/+cPxYAxqd+LHUZoKmbO3lGh8hIaJtkQr0R5Fh6XsE59gR?=
 =?us-ascii?Q?T++tOKrZsJTYXPRLdCKhSB1UoOpA4WfDo1ImwtZyAPTW4y99LL1Yr/fSWfKs?=
 =?us-ascii?Q?jmdwrMDNuEPBp02Uq5mLSG9EFKIUItytaupFRkFWkXSpe96H0djMm0V4hlcm?=
 =?us-ascii?Q?JGXGlD0ZWZm0ze0nmHJWJ0zycrkUDYT44iYiFlbLVDkgSxe2QmkAmFVW4a6E?=
 =?us-ascii?Q?pXSJsGrjNGxn9Q9XUPLPaVJ+mQ76wNReQDBb2ZDJwBH4CO9c0FD2EhmYzaE7?=
 =?us-ascii?Q?suoAfUGPUj7ZcyQCd7em9KFTpns8uFWVjZF+DlOZeN5wEWbB0BJtIceZpnfb?=
 =?us-ascii?Q?WCkmRIZTBekxCG9/He+rU/YzpaU02roAXLO9BL24FHKaGDuli9311/4Dl3ew?=
 =?us-ascii?Q?CIe2w16ATPU2RNxScD09JJ4hYKSjMEKQNi90rJKhC4OPQN9cICCwKy7lbuqG?=
 =?us-ascii?Q?F/B7zEK6pZDeCzWUzeZysXseNvH4xQ9MZjnx6PNfGXVrVW7e3efm3QYjJ22k?=
 =?us-ascii?Q?5iXMc0ZQqELneAminVUSAQpeiKkgaABRrbqkib1SpVZc7LG6dV/ArhF0guut?=
 =?us-ascii?Q?oAikZSvkI8mvQCNVsB+TjWzFVXjH13GCRDlMOh4Ywd+f28J5W1Sb+IoeyC6x?=
 =?us-ascii?Q?oGQzEDjLEdKXC82tmogeK5ZvHR/rOMUYpI/TD7s9lqsJCkr6ORSvNn8tKSUW?=
 =?us-ascii?Q?7fgQVx+/RX+uSTYLWRPjYL+m1jFqIhZw4W64sMLZOXcSVvTRL0BN4hAwwwOE?=
 =?us-ascii?Q?PawVV9BGXS6BTbHZkZ/lBLIWS4ZcL2e1XUxKBYgamVZUQhEZOYMM/+cIL4Fz?=
 =?us-ascii?Q?SWNRydgft2C+P9C3+D5bDFzJLkgDpzWUNYnXpv/vpttJKWfxz9R032m/hSLC?=
 =?us-ascii?Q?OgxHlHldJo1WjWaIpklxJ1uOyPTnqPigu5FSHvL5paeqSjbH/D4f7/Ts8DNL?=
 =?us-ascii?Q?IhrxpsG22YE387KM/OXlDOPC+MulA8zTwVQTXlhhQPulZPNgHrHyNXm0GcI3?=
 =?us-ascii?Q?1tVknv8fETtkT3nHVZCkarLfmVkfPJiFiMmA++qYyqTPY4Y4vDDhbTqxoumX?=
 =?us-ascii?Q?5m0ndNCHARkpDKV5renLVvGZfX6lFros4Cz0+2lrzoFjtm63UIIHU3l60aB7?=
 =?us-ascii?Q?ArDN2roPYg/gBSwt0jkoleSG7O+e0wzD07CJUz/CIj4PBfF8X2yA?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2a7bf5-8b5c-4c23-feab-08df1973ac0e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 13:07:51.0253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnJ5Kj8nAIIWwV12Ae7bSZ19aUA5/U19zZEGXB7G0GKH9YN4Po4hhscY1V5o6QggBgjkBincIaSAZbo+4+P4HvxXOi8r9JYQfrvrA1fdirayK76K6cfspqlSbNC+pgl9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

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
 drivers/hwmon/starfive-pwm-fan.c         | 762 +++++++++++++++++++++++
 6 files changed, 832 insertions(+)
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
index dccddc99ac9a..3735e87da3bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26483,6 +26483,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
 F:	drivers/irqchip/irq-starfive-jhb100-intc.c
 
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
index 000000000000..aba016e55960
--- /dev/null
+++ b/drivers/hwmon/starfive-pwm-fan.c
@@ -0,0 +1,762 @@
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
+struct starfive_pwm_fan_data {
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
+	int i, ret;
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
+		ret = pwm_apply_might_sleep(fan->pwm, &state);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void starfive_pwm_fan_pwm_disable(void *data)
+{
+	struct starfive_pwm_fan_data *priv = data;
+
+	starfive_pwm_fan_pwm_disable_all(priv);
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
+
+	return starfive_pwm_fan_pwm_disable_all(priv);
+}
+
+static int starfive_pwm_fan_resume(struct device *dev)
+{
+	struct starfive_pwm_fan_data *priv = dev_get_drvdata(dev);
+	int i, ret;
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
+		if (ret)
+			return ret;
+	}
+
+	return 0;
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

