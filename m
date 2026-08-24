Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2116.outbound.protection.partner.outlook.cn [139.219.17.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA8E227EA4;
	Mon, 24 Aug 2026 03:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787541478; cv=fail; b=AMMhlQhDzAXU7BblShcemZxhlxnxjxEe1/J46gO7pBrALG/pkkhnJ14VYOGJeSXHG0RTgRjYuY0KvJ0VI7K+jBKNHt4A35JENbVZNSetug0QpioKg3+svmZRHoLUPS+mx4ZsaCx6Xrhh6X188rgMJW92rAZjT3WXjOoi9JPCuAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787541478; c=relaxed/simple;
	bh=N44FVCraHMwpmOTOv7eSZRQ1snUeLu5PdtOzxAfk028=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mkkNrZCpfLqwxfpebogm8kzxFXozp6aPmLGbcbll9Nya160aD6/QsRO9B8mP9lWKTRy+MRNQCQjR4ukCTv18iOtvLYEjAFUwLeG4A9P9NBBTkg0liauBk6xwbAshnlSvUpbT2hNoR/ZGbyD83UQ9+5KOmIkNPFASuNC1LAyKLX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjzX+LDa2ZJebIlUTPINyZRnaY54CJmlf8ScXb0Lb7oSmfM0eSv+lOBiS3lgP/6n7+jA7S41VNvxFiQKTb2KcvjYCGVQTdRgeC+HdMD6DkOOsTFePMr3lkRTZGJozxTXC4sphqb+npY24UJqiO6tsHkkJt+mfaQN9Xq3osZmgNVKbrkza19addMDvvDKpBERjCQDqm+9EGQk2FSPcZTjZKJcQUc1sJkrCkQxFUNx8wvtx8VuKmuBcOgX9qA2SI65D1McHJUvtBBgWDpFdM7ihqIzPA/9H8GG/jiOFukDhbx6MdsDTL1uhx+hsVwf7tz3tF028wzNd50LSGkWVPQ9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcZOQoVJz78yYlodSvZrRZRenCeO3V1aG6PVPBo+NfI=;
 b=E0L7eTNCMVWaghp3Qi2BCL7QFItmxR1c2EOJtTvl0TpLwZ/1nct8xcdIwkQJxRYAxpFxjFtB29QkoY21emGiNVbwi/ch15wtWfasAFxiJdJLvCqh4HqRfvWnx9b0R5HQvalkeMvmDOSAJmygs7ddQV+x5QsoxnrMrge3O3UaUX9MHj6h8iYgG0qjcReVZKlPdoohf8s4g43UMusZEQxC4zic62EVuH3ddYGgdrg2QmVsZ0t9faurs0lZ8FrHUkcfQ8AIKq9Rb2UXIiP8XUzLairz5FY6ZpcFSEpcaajF+FUddLTYiY7G87wPKu8ywfpanRJmPs8Lx5JInDKVrqvT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Mon, 24 Aug
 2026 03:02:46 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 24 Aug 2026 03:02:46 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v3 2/2] hwmon: (starfive-fan-tach) Add fan tach driver for StarFive JHB100
Date: Sun, 23 Aug 2026 20:02:34 -0700
Message-Id: <20260824030234.9321-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260824030234.9321-1-changhuang.liang@starfivetech.com>
References: <20260824030234.9321-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::12) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1201:EE_
X-MS-Office365-Filtering-Correlation-Id: 111cadc4-da78-4c63-fa18-08df018c2c4f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	lf56XVWHwOsCsOFrm6TjEkowuIix/SV4MKwGBnQwb+ny5tTb4tnXmzEoSp6L6ahCM+PwI4BgkGv5KgfwVu7y1Nd9Wx9rSOICGqrI6hiLpa/lVNdUS8JYxpThAHLAQmR76XUF6uJkmLnIZe8pgrVhz4TzrBAlioy2CTtq7rrhzR1YJRKenS7zKFjCb7JW4yKblethBTtFNtodD9uADe9wFV4AJYZjz9Oj8Tl6zop1u6PknM2fMXS3Z5MaVvrBzSJ8QrngyvIsgoR08sSaDgQvX3CrUTPQURa6qbNO0yhPXHudPCYxyQ9Pi7iqFIOOAYA9yKMVs1l/9SfWXKYsuF2WE0KIfjMCuqLz/drWtdseUfY/d/TiF9Rtxu89gXkQQlE2W6zhNBqDWW9UJG0X3iYf+BQgyeDeintJTftJGsVCe4gAf2R8Lk1wfV1VHF+fr+ah0HiFK4QF7MbgmIDfOldgkDOxsqSP/d/5bzDHYRoH51UXbVx9m4qpjTZiuPI0QiF4oSd/lEUEEgFG2h5X0W3BORsSJ7jrBK+lKYvIC9XJe477faDVq39AkQpSHwaM2OvV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yPXp982K70jPP8I0FSlctbLUgFZinUc61BalpnDH/53lvHL4GLcjsz+SQa8F?=
 =?us-ascii?Q?Azxgc5py2dCL3EFN1QoR0ovbC/WOINqtSlT96ewJ6e24uvBHrljnSltiXgvZ?=
 =?us-ascii?Q?qgPIaXCt6JyNiEEE3JvPlRFs4zIrzHEC02NoAGoLuqPiW40K4oaYHiUxqF6R?=
 =?us-ascii?Q?SOTp4SW38pXhhpOVlF5miByscFqR4GMn2+A15peIEUhJ+HiClnxhmKEXRIjN?=
 =?us-ascii?Q?1V843d5Sfs0JZa4o4faooLTXy/TXDMTgfaz+0D7tgsCNOjjMQNxvrCeXoolr?=
 =?us-ascii?Q?Vg53yDRXqBuBvt50TC8IdidmdBjS/WF1N75ncStCQRWMCxfh2Lr5i598O86d?=
 =?us-ascii?Q?0RLBWENxXkjRAlXm51800bJo0/slsv2wPJ4MRb8txRstUbx9sEwTYvBn6yWk?=
 =?us-ascii?Q?M06i8P4LAuN72TGwXqLIpTnrIiH3jkBTWIJzUJv9M3phCJVDwlvyfSOm2fdf?=
 =?us-ascii?Q?EmRCG63i4qODj+ECES1FKKbYH6pQmlaOX6lSEnPOW7CcFIpjJz/px7cYEgJY?=
 =?us-ascii?Q?KBMpK3OCbq9teoX/wpQ1eOFvOrhO9QsdwZpr+BtGu4G/PLhPGxCl7BI4vsjB?=
 =?us-ascii?Q?TxBEmtGKFyR1XOpHGt3svJ0KZg53veA5Ah/Mdu5iW16LZL0aDgWoGFehSZ83?=
 =?us-ascii?Q?RmMhRFybP5v4mTHKpzM/cTZH2KXASBIKWa/Xa+N8eLK5NaLP1fnMbMIFupvB?=
 =?us-ascii?Q?aC2FxWc7Yb22qOGpVJ1clHzxczDjlV1H2yzvRqIu6rvXODC58A53ZCpNsmBK?=
 =?us-ascii?Q?5cOZErFDpQUvM6ZTbfOQ2S9AWsYPf0lSFVh2akBsAuy03ck7ouEhdzQgkejv?=
 =?us-ascii?Q?OLyXlsOog3oYHleHJlvojtFX6uj38wQ/4IWeX20jJB5/PCGFg+I7RNIYBvLv?=
 =?us-ascii?Q?Z6/XFeJgt/DB6IwZhsvm0jr/m8LQx4LTGCl+U2//EtDpIPxrDBTG3P4EjX8d?=
 =?us-ascii?Q?/evurN7giFZ+vw983WdCfioIvSGleNyY39SZens2gM/S6qUN/oxBvF4WrK/f?=
 =?us-ascii?Q?sv3jqzqlm1zuJRFcM6fBNv2LH2BCvPYTyKLY5FFoT4Mo/ghmCsyiS9bIjEpT?=
 =?us-ascii?Q?4eQ+94VdgtiFSGxdHmnGsTXbwQDjkmaCGhwEr6odvJ4ogp/Adsfq3Va83l3k?=
 =?us-ascii?Q?kWd7cWAKneKf3TlhzpmHiNTDsNrNh38WW2innShEvQJTeHOvF0ZmLUoXzkoF?=
 =?us-ascii?Q?GxoCALfPcmx0TL9uFVlgmCGz73cOvXxFQMS8avsz8axUc7UbcoM68e6RMCc/?=
 =?us-ascii?Q?l3Ok2XuX5TqDKKP55bhu8rKQBBKikuwuOSXoEfZKNScszTZ9s+rNll2V1wJR?=
 =?us-ascii?Q?OijvP79yOA2UKLtMP+JAyosC6rzdI4AeysRt9ZobgQNjzYPTrCoG51Su956c?=
 =?us-ascii?Q?1sq4acE7sFmqL7XdcO/Z1Z6WfEWBSUG3Onl3UU07xZZE3jALJQHDUZkY3Mfh?=
 =?us-ascii?Q?5NhwCiw6dpaCYtYWjxUKpOKZCdB2MTqkMx+k899f27fMR+3Qw/y59Iw5+Arz?=
 =?us-ascii?Q?OFOql9rkNxjNK6P+bETsq4qjvufCj7mLEZ4RFQgS/zRnfzJafgB18AMgMmJE?=
 =?us-ascii?Q?/GADTRIloYYgCFExZJanYGcSRUWuToTm0w0oveODeT5SSQmeNi1uexfe8Ytb?=
 =?us-ascii?Q?yCGvQGaG2OImFCM2PrX6Z1PTTnTfLvsbO5Gk/VZA0SHT1Oco948PUbclUWla?=
 =?us-ascii?Q?TcSfxGfED0f0sxejGsUXTsk3Y17hCUHZZDbGf0Naifb1SyUKHLp/5goB7Wbk?=
 =?us-ascii?Q?MsclrKmuC9uxEo7/k8VZuLdqQg5dEFtzSq0q2SJJGzxwa9ffG0ZX?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111cadc4-da78-4c63-fa18-08df018c2c4f
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 03:02:46.1790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8KS0GyuInzK94I4/heShtDjQTspHkkpp4TjM7CUkOIH/oTlKvDjDKNSiToZGjpmnsOEkJBKfChj/R7pUB5GPcE3p5qaVNFcpVTOiRmQCiM1JCcqJjUZEETzRPg5AjbG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201

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
 drivers/hwmon/starfive-fan-tach.c         | 540 ++++++++++++++++++++++
 6 files changed, 602 insertions(+)
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
index 000000000000..7f56ecc87c1c
--- /dev/null
+++ b/drivers/hwmon/starfive-fan-tach.c
@@ -0,0 +1,540 @@
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
