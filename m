Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11023113.outbound.protection.outlook.com [40.93.196.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623603FF1AD;
	Thu,  3 Sep 2026 07:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419403; cv=fail; b=pvgkPEWAZtoUMGCf3u/rKpJt8UuqtlQ/Bidnb9AUkCsDltsOZ9Nf7y49NLKaqIVTrnOU6OLe8RU5tFUZ0iZuKCM08WsqiydtnG+HIX1zDtDyqrDTYVOrCwlS9vbqT/NO0hym9DeTmqueKPm71T7LMVe7hePLeuws3aDgYkQm5YE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419403; c=relaxed/simple;
	bh=j/sBEYZNs00U5mCm4PwiSaoa5m+FMa6qmdu0ZxWNAfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nl7Gp9SC/DVM+iVI24Qmf942CGrNYrdGQoUBxqaQcAJwoNmu/fFcH3hQmHaFwq2twGSw0ms+2JqoFKzBW1cnTi10qE/wS1tq6gwq1iCASiYf6UWgJDy9t9qkLU/Bat3HKdRBVcCGj4l4Ses5g37JYDxZNdOII4MYfLWanKbtL7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=rr/XawuT; arc=fail smtp.client-ip=40.93.196.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="rr/XawuT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1+KvvOBAVPTinmeIMr9CvwzDB9kPznfY/xusMt0BqYZzIL6o5dDRiy3fqr0MI8Lqeso83bCyIXKz/Am0h6TVkj13pvenHsX+vbol80rryh3tA0vNLWmDdDSdpTVKWAof/JLBTq6zGG1tTnJnaQ0oeUznLqhlVwYpMleBDm6lWT6n3nHFeI90ewgG+09XwkTVyZQSBqHnZ7errdt7vkWSiZm5Q1yKGZRPPnU1ZLjorXgoRa0LmoHjN8pEfoTVO+43450j7tZmJQ0KtsW+YfnhH5c3RzTilUiDTgqNhlOzG/yNMswfhloen9YuOPfPiy/7dvsAo8F/MsLD/pmvZsZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgHe5oO2XYh+0zLGjPywDxE9/YyoToVlW3JxEpkYaHg=;
 b=Us0Ks5A8HzoH34Rz3JeDh0uHwWZvuoetNkS2+gOwygL+2cIk1M7SxdvqDcE4NNOaUg03AmaCIg7wouOeinRo+4SMXG82kZqChb5gWn3Ep2uQpgbbXjgz7rGPRHzCSJJuRE9SJBMfVq5dd0K/7R9YSmwQdOVp+WupdZrAjPYDR49XCCWUKnDQ97DMUT3nP7Q0exyCH0Gus7G3dO5xSGAaLJ+M4hiUPeFXC2qZGLk9PoLdkml5XGKXSozVuLxo05ChS+YsBL9DQTA8uuA2T5JphMRTVnV+8o6Y4iWdDIA+kMmPCC6yC1izm5WZ9nFZ126KdawoGhypmxyIpDP8RRJ+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgHe5oO2XYh+0zLGjPywDxE9/YyoToVlW3JxEpkYaHg=;
 b=rr/XawuT17eIqZAJ8ykHSjmJx0yUtuXZDmVoq2VuBYoNOZsmN3+jzbI+L41zXSi0uMGCaH41ESXsRwLvZyY1yHiwybmpfbJB6FeT/gsu9+T+yuHP/CAplOzw02XWMdgXB7a4yGIw7Hw4gS/1x/6A3KuE02UpqD5Rnbw0MV6QSAl666e6D2fNB1PXjCDLy7eApDXjGE373/quFLDfRbh5O0h5YdhRNnpmaGpO4fzTXgx+fqeZn3Ht+AIROhavtrGYPRTvkhEl244GIiAVyRe48G7Fg8Pvg0zFF55OsZv9SsagcOhnFWfIdHTiJYbypQi+K767i1R6XCKVxJNIfiBCcg==
Received: from BN9P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::24)
 by IA2PR18MB6084.namprd18.prod.outlook.com (2603:10b6:208:4b7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:09:52 +0000
Received: from LV8PEPF00000067.namprd03.prod.outlook.com
 (2603:10b6:408:10b:cafe::34) by BN9P223CA0019.outlook.office365.com
 (2603:10b6:408:10b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 07:09:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 LV8PEPF00000067.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 07:09:52 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 591CE40BFE04;
	Thu,  3 Sep 2026 00:09:51 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Thu, 03 Sep 2026 00:09:48 -0700
Subject: [PATCH 2/2] hwmon: axiado-tsadc: Add AX3000/AX3005 TSADC support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
To: Akhila Kavi <akavi@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Petar Stepanovic <pstepanovic@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419391; l=13935;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=j/sBEYZNs00U5mCm4PwiSaoa5m+FMa6qmdu0ZxWNAfk=;
 b=ZHQtGk0VttKobh6NVEzUXuImQYzsxuJ6TO75IRsO24tGru39gmSs/Ut3mTNglMX+fGNqXiYmq
 3aJIKDy2ndLCOuI3uP2waKo/1VCw+fuYqfdD9Pnf+Ty7DX0yrFmmyNf
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000067:EE_|IA2PR18MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7d172b-19b8-4dbd-569a-08df098a59ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|23010399003|36860700016|376014|82310400026|7416014|1800799024|921020|6133799003|10067099003|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	LMhAnWQd3W4l8OnJRLoPYD9fi4S5WDBQJcjw9RYEsCCF5z1Ymotbjw217AroBXq4hxqOKJCrmXFv+hs1Zo9PIQcFc6AajdapaTRy+g6s+ITmAfSr9lHH49XNZJ0YJkIg73VmBWAif8LpugaDXHLPxthyWvDydVMuugdP3n3k0zub5Vpzvj4nIdQueW6h8Y/Fuju+0mB8gitmeA+Wnrp8r3m3/4H4CXPjjfmjkiWAeOH1oqU0Z9zAIK5XBcupfIc/oRr8Bos+TWap8MlMmlK8YRv+ymiknnDULisDEv9z1oVpLgZhXhKQyeu62zmGUO4wrlM+MNPcwDVn3+x/oZzQY5MkSu8+DUPC0jYSvApHM8IkPyHqFXdC5n+i362lBP5etMGbIWoXpsztxeMX6T+vjax18f789OiOQZAhwu326QgeVEdPbOoAAozuEeJzJU9F28dUOnThWi2XfLxUDburJPwGxTw5BfwspRlTJHFBFs83a1H8dApNnWidfLUbkpEIwF8+fkwU8r/v5JJdKJUkP0lF8bt9WZlmBlT05McoZTMxIiD3AL4Ff1wGH6NtOlPXs8MvLAUORJoKLDwd1SU3y3kXCadOX3eXXBC7n83JZ60sxqqpyFBAQj3TW1smav73QX4tqEMkJBQtnvH4ZnwOf8QLVdmYj6yOp+4RKgkH8ukYpLSeO7OHaEZ2B9AE80Th8j9odwW9pRH5Ns/vD9p4MF4QLSg84VibM+kbBP5ksfUusf/+CSEY9YnLN4lzR3AU
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(23010399003)(36860700016)(376014)(82310400026)(7416014)(1800799024)(921020)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JYAKAipehggFEKOYWEqHnV8x5Zhydv3GPmDlfDCOe5uK3DUpF3MFZ4F34s/wEo2np+HJGgy+IgeshMPe6HznjQyYs0inHZw/EoCtGBHgVnq4JYmvuxWO8HC3nWPWQOyWNBpfLiLU4Ffdu+rNafQ04VcNHbd0tsXSqJAGwhrX6jBXTef9ZWKbe67ul5M/0QwsGFk+DDPylCTGDHoTq4o6gL1KiSRfH/xm11BoGAlGWUc5Ulb4ijiItdyfcHDh4h/NUGFe1T939Jx8Dih7KiaCQankfKPmOpjCf8bfcYZvLAm2I1oIzKyoqZBydzt6t2iqzbh2kFVOLD5IYNg5ZGejWB8HOe0NW3ZmI2Ufhk80b2m8UYiSWhNFTl1UoE1CsPrZ0EAyqE23i0y+aBBPN+Ut/koiC/EZD5YeBZDoRTRSnIvHQkujCvIgWZLhYtcRhkJj
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:09:52.2275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7d172b-19b8-4dbd-569a-08df098a59ad
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF00000067.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR18MB6084

Add a hwmon driver for the temperature sensor ADC (TSADC) controller
found on Axiado AX3000 and AX3005 SoCs. The controller measures
temperature at locations within the SoC silicon die.

Each TSADC controller is registered as a separate hwmon device and
exposes one read-only temperature channel. The sensor is configured for
continuous conversion during probe.

The current TSADC hardware does not support threshold or alarm reporting.
All TSADC interrupt sources are masked during initialization, and only
the current temperature is exposed through temp1_input.

The averaged 12-bit ADC code is converted to millidegrees Celsius using
a lookup table with linear interpolation between adjacent entries. Raw
values outside the characterized lookup-table range are clamped to the
nearest supported temperature.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 Documentation/hwmon/axiado-tsadc.rst |  41 ++++++
 Documentation/hwmon/index.rst        |   1 +
 MAINTAINERS                          |   2 +
 drivers/hwmon/Kconfig                |  11 ++
 drivers/hwmon/Makefile               |   1 +
 drivers/hwmon/axiado-tsadc.c         | 275 +++++++++++++++++++++++++++++++++++
 6 files changed, 331 insertions(+)

diff --git a/Documentation/hwmon/axiado-tsadc.rst b/Documentation/hwmon/axiado-tsadc.rst
new file mode 100644
index 000000000000..b8fd0aeacc1f
--- /dev/null
+++ b/Documentation/hwmon/axiado-tsadc.rst
@@ -0,0 +1,41 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver axiado-tsadc
+==========================
+
+Supported chips:
+
+  * Axiado AX3000 and AX3005 on-chip temperature sensor (TSADC)
+
+    Prefix: 'axiado_tsadc'
+
+    Addresses scanned: -
+
+    Datasheet: Not publicly available
+
+Authors:
+
+  - Petar Stepanovic <pstepanovic@axiado.com>
+
+Description
+-----------
+
+This driver supports the Temperature Sensor ADC (TSADC) block found on Axiado
+AX3000 and AX3005 SoCs. The block monitors the on-die temperature of the SoC.
+
+An SoC may instantiate several TSADC blocks at different locations on the die.
+Each block is described by its own device tree node and is registered as a
+separate hwmon device with a single temperature channel.
+
+The sensor is configured for continuous conversion at probe time, averaging
+16 samples per conversion. The averaged 12-bit ADC code is converted to
+millidegrees Celsius using a lookup table with linear interpolation between
+entries. The table covers -40 to +125 degrees Celsius; readings outside that
+range are clamped to the nearest supported temperature.
+
+sysfs entries
+-------------
+
+======================= =======================================================
+temp1_input             Die temperature in millidegrees Celsius (read-only)
+======================= =======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index d979e6d6e9f2..b79a27aeb4b4 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -51,6 +51,7 @@ Hardware Monitoring Kernel Drivers
    asus_ec_sensors
    asus_rog_ryujin
    asus_wmi_sensors
+   axiado-tsadc
    bcm54140
    bel-pfe
    bpa-rs600
diff --git a/MAINTAINERS b/MAINTAINERS
index c6efb04fc376..3108a004439f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4474,6 +4474,8 @@ M:	Prasad Bolisetty <pbolisetty@axiado.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/hwmon/axiado,ax3000-tsadc.yaml
+F:	Documentation/hwmon/axiado-tsadc.rst
+F:	drivers/hwmon/axiado-tsadc.c
 
 AYANEO PLATFORM EC DRIVER
 M:	Antheas Kapenekakis <lkml@antheas.dev>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 81a9a1d40eec..f12a47e70f0c 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -311,6 +311,17 @@ config SENSORS_AXI_FAN_CONTROL
 	  This driver can also be built as a module. If so, the module
 	  will be called axi-fan-control
 
+config SENSORS_AXIADO_TSADC
+	tristate "Axiado AX3000 TSADC temperature sensor"
+	depends on ARCH_AXIADO || COMPILE_TEST
+	help
+	  If you say yes here you get support for the on-chip temperature
+	  sensor (TSADC) found on Axiado AX3000 and AX3005 SoCs. The die
+	  temperature is reported through the hwmon sysfs interface.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called axiado-tsadc.
+
 config SENSORS_K8TEMP
 	tristate "AMD Athlon64/FX or Opteron temperature sensor"
 	depends on X86 && PCI
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 0cad7e21634c..b5f5d18e1ccf 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -59,6 +59,7 @@ obj-$(CONFIG_SENSORS_ASPEED_G6) += aspeed-g6-pwm-tach.o
 obj-$(CONFIG_SENSORS_ASUS_ROG_RYUJIN)	+= asus_rog_ryujin.o
 obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
 obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
+obj-$(CONFIG_SENSORS_AXIADO_TSADC)	+= axiado-tsadc.o
 obj-$(CONFIG_SENSORS_CGBC)	+= cgbc-hwmon.o
 obj-$(CONFIG_SENSORS_CHIPCAP2) += chipcap2.o
 obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
diff --git a/drivers/hwmon/axiado-tsadc.c b/drivers/hwmon/axiado-tsadc.c
new file mode 100644
index 000000000000..c111df6f0044
--- /dev/null
+++ b/drivers/hwmon/axiado-tsadc.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021-2026 Axiado Corporation
+ *
+ * Driver for the Axiado on-chip temperature sensor (TSADC)
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+/* TSADC register offsets */
+#define AXIADO_TSADC_MODE	0x0000
+#define AXIADO_TSADC_FUNC_CTRL	0x0004
+#define AXIADO_TSADC_AVG_DOUT	0x000c
+#define AXIADO_TSADC_INTR_MASK	0x0010
+#define AXIADO_TSADC_ANA_REG	0x0020
+#define AXIADO_TSADC_SEL	0x0028
+#define AXIADO_TSADC_TSEN_EN	0x002c
+#define AXIADO_TSADC_EN	0x0030
+
+/* TSADC mode register: continuous conversion */
+#define AXIADO_TSADC_MODE_CONT	0x2
+
+/*
+ * TSADC functional control register: bit 0 starts the conversion and
+ * bits [31:16] specify the number of samples. Average over 16 samples.
+ */
+#define AXIADO_TSADC_FUNC_CTRL_START		BIT(0)
+#define AXIADO_TSADC_FUNC_CTRL_NUM_SAMPLES	GENMASK(31, 16)
+#define AXIADO_TSADC_FUNC_CTRL_CLR		0x0
+#define AXIADO_TSADC_FUNC_CTRL_SET				\
+	(FIELD_PREP(AXIADO_TSADC_FUNC_CTRL_NUM_SAMPLES, 16) |	\
+	 AXIADO_TSADC_FUNC_CTRL_START)
+
+/* TSADC average output register: 12-bit ADC result */
+#define AXIADO_TSADC_AVG_DOUT_MASK	GENMASK(11, 0)
+
+/* Interrupt mask bits */
+#define AXIADO_TSADC_INTR_BIST_DONE		BIT(0)
+#define AXIADO_TSADC_INTR_LOOP_DONE		BIT(1)
+#define AXIADO_TSADC_INTR_THRESHOLD		BIT(2)
+#define AXIADO_TSADC_INTR_MASK_ALL		\
+	(AXIADO_TSADC_INTR_BIST_DONE |		\
+	 AXIADO_TSADC_INTR_LOOP_DONE |		\
+	 AXIADO_TSADC_INTR_THRESHOLD)
+
+/* TSADC analog block configuration required for temperature measurement */
+#define AXIADO_TSADC_ANA_REG_INIT	0x6
+
+/* TSADC SEL: select temperature measurement */
+#define AXIADO_TSADC_SEL_TEMP	0x00
+
+/* TSADC EN / TSEN_EN field values */
+#define AXIADO_TSADC_DIS	0x00
+#define AXIADO_TSADC_ENA	0x01
+
+struct axiado_tsadc {
+	void __iomem *regs;
+};
+
+/*
+ * Lookup table: raw ADC output (12-bit) vs temperature in millidegrees
+ * Celsius. Raw values decrease as temperature increases, from -40°C
+ * to 125°C in 5°C steps.
+ */
+struct axiado_tsadc_point {
+	u32 raw;
+	int temp_mc;
+};
+
+static const struct axiado_tsadc_point axiado_tsadc_table[] = {
+	{ .raw = 2776, .temp_mc = -40000 },
+	{ .raw = 2748, .temp_mc = -35000 },
+	{ .raw = 2721, .temp_mc = -30000 },
+	{ .raw = 2694, .temp_mc = -25000 },
+	{ .raw = 2667, .temp_mc = -20000 },
+	{ .raw = 2640, .temp_mc = -15000 },
+	{ .raw = 2612, .temp_mc = -10000 },
+	{ .raw = 2584, .temp_mc =  -5000 },
+	{ .raw = 2556, .temp_mc =      0 },
+	{ .raw = 2528, .temp_mc =   5000 },
+	{ .raw = 2500, .temp_mc =  10000 },
+	{ .raw = 2472, .temp_mc =  15000 },
+	{ .raw = 2444, .temp_mc =  20000 },
+	{ .raw = 2416, .temp_mc =  25000 },
+	{ .raw = 2389, .temp_mc =  30000 },
+	{ .raw = 2362, .temp_mc =  35000 },
+	{ .raw = 2335, .temp_mc =  40000 },
+	{ .raw = 2307, .temp_mc =  45000 },
+	{ .raw = 2279, .temp_mc =  50000 },
+	{ .raw = 2251, .temp_mc =  55000 },
+	{ .raw = 2223, .temp_mc =  60000 },
+	{ .raw = 2195, .temp_mc =  65000 },
+	{ .raw = 2167, .temp_mc =  70000 },
+	{ .raw = 2138, .temp_mc =  75000 },
+	{ .raw = 2110, .temp_mc =  80000 },
+	{ .raw = 2081, .temp_mc =  85000 },
+	{ .raw = 2052, .temp_mc =  90000 },
+	{ .raw = 2024, .temp_mc =  95000 },
+	{ .raw = 1996, .temp_mc = 100000 },
+	{ .raw = 1967, .temp_mc = 105000 },
+	{ .raw = 1938, .temp_mc = 110000 },
+	{ .raw = 1909, .temp_mc = 115000 },
+	{ .raw = 1880, .temp_mc = 120000 },
+	{ .raw = 1852, .temp_mc = 125000 },
+};
+
+/* Convert raw ADC code to millidegrees Celsius with linear interpolation. */
+static int axiado_tsadc_raw_to_mc(u32 raw, long *val)
+{
+	int i, n = ARRAY_SIZE(axiado_tsadc_table);
+	long num, denom;
+
+	if (raw >= axiado_tsadc_table[0].raw) {
+		*val = axiado_tsadc_table[0].temp_mc;
+		return 0;
+	}
+
+	if (raw <= axiado_tsadc_table[n - 1].raw) {
+		*val = axiado_tsadc_table[n - 1].temp_mc;
+		return 0;
+	}
+
+	/* Find i such that axiado_tsadc_table[i].raw >= raw > axiado_tsadc_table[i+1].raw */
+	for (i = 0; i < n - 1; i++) {
+		if (raw >= axiado_tsadc_table[i + 1].raw)
+			break;
+	}
+
+	if (raw == axiado_tsadc_table[i].raw) {
+		*val = axiado_tsadc_table[i].temp_mc;
+		return 0;
+	}
+
+	/* Linear interpolation within the interval */
+	num = (long)(axiado_tsadc_table[i + 1].temp_mc - axiado_tsadc_table[i].temp_mc) *
+	      (axiado_tsadc_table[i].raw - raw);
+	denom = axiado_tsadc_table[i].raw - axiado_tsadc_table[i + 1].raw;
+	*val = axiado_tsadc_table[i].temp_mc + num / denom;
+	return 0;
+}
+
+static int axiado_tsadc_read(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, long *val)
+{
+	struct axiado_tsadc *tsadc = dev_get_drvdata(dev);
+	u32 raw;
+
+	if (type != hwmon_temp)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		if (ioread32(tsadc->regs + AXIADO_TSADC_SEL) != AXIADO_TSADC_SEL_TEMP ||
+		    ioread32(tsadc->regs + AXIADO_TSADC_EN) != AXIADO_TSADC_ENA)
+			return -ENODATA;
+
+		raw = ioread32(tsadc->regs + AXIADO_TSADC_AVG_DOUT) &
+			       AXIADO_TSADC_AVG_DOUT_MASK;
+
+		return axiado_tsadc_raw_to_mc(raw, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t axiado_tsadc_is_visible(const void *data,
+				       enum hwmon_sensor_types type, u32 attr,
+				       int channel)
+{
+	if (type == hwmon_temp) {
+		switch (attr) {
+		case hwmon_temp_input:
+			return 0444;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static const struct hwmon_channel_info * const axiado_tsadc_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops axiado_tsadc_hwmon_ops = {
+	.is_visible = axiado_tsadc_is_visible,
+	.read = axiado_tsadc_read,
+};
+
+static const struct hwmon_chip_info axiado_tsadc_chip_info = {
+	.ops = &axiado_tsadc_hwmon_ops,
+	.info = axiado_tsadc_info,
+};
+
+static void axiado_tsadc_disable(void *data)
+{
+	struct axiado_tsadc *tsadc = data;
+
+	iowrite32(AXIADO_TSADC_DIS, tsadc->regs + AXIADO_TSADC_TSEN_EN);
+	iowrite32(AXIADO_TSADC_DIS, tsadc->regs + AXIADO_TSADC_EN);
+}
+
+static int axiado_tsadc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct axiado_tsadc *tsadc;
+	struct device *hwmon_dev;
+	struct clk *refclk;
+	int ret;
+
+	tsadc = devm_kzalloc(dev, sizeof(*tsadc), GFP_KERNEL);
+	if (!tsadc)
+		return -ENOMEM;
+
+	tsadc->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(tsadc->regs))
+		return dev_err_probe(dev, PTR_ERR(tsadc->regs),
+				     "failed to map registers\n");
+
+	refclk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(refclk))
+		return dev_err_probe(dev, PTR_ERR(refclk),
+				     "failed to enable reference clock\n");
+
+	/* Mask all interrupts before setup */
+	iowrite32(AXIADO_TSADC_INTR_MASK_ALL, tsadc->regs + AXIADO_TSADC_INTR_MASK);
+
+	iowrite32(AXIADO_TSADC_ANA_REG_INIT, tsadc->regs + AXIADO_TSADC_ANA_REG);
+	iowrite32(AXIADO_TSADC_ENA, tsadc->regs + AXIADO_TSADC_EN);
+	iowrite32(AXIADO_TSADC_SEL_TEMP, tsadc->regs + AXIADO_TSADC_SEL);
+	iowrite32(AXIADO_TSADC_MODE_CONT, tsadc->regs + AXIADO_TSADC_MODE);
+	iowrite32(AXIADO_TSADC_FUNC_CTRL_CLR, tsadc->regs + AXIADO_TSADC_FUNC_CTRL);
+	iowrite32(AXIADO_TSADC_FUNC_CTRL_SET, tsadc->regs + AXIADO_TSADC_FUNC_CTRL);
+
+	/* Enable the bandgap circuit once the block is fully configured */
+	iowrite32(AXIADO_TSADC_ENA, tsadc->regs + AXIADO_TSADC_TSEN_EN);
+
+	ret = devm_add_action_or_reset(dev, axiado_tsadc_disable, tsadc);
+	if (ret)
+		return ret;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "axiado_tsadc",
+							 tsadc,
+							 &axiado_tsadc_chip_info,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct of_device_id axiado_tsadc_match[] = {
+	{ .compatible = "axiado,ax3000-tsadc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, axiado_tsadc_match);
+
+static struct platform_driver axiado_tsadc_driver = {
+	.driver = {
+		.name = "axiado-tsadc",
+		.of_match_table	= axiado_tsadc_match,
+	},
+	.probe = axiado_tsadc_probe,
+};
+module_platform_driver(axiado_tsadc_driver);
+
+MODULE_DESCRIPTION("Axiado TSADC temperature sensor driver");
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_LICENSE("GPL");

-- 
2.34.1

