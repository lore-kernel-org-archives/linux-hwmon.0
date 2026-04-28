Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2106.outbound.protection.partner.outlook.cn [139.219.17.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A19E235358;
	Tue, 28 Apr 2026 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365577; cv=fail; b=X3y1i4Uvim2z2lejD/lA4mwGe3feh/x9i5RcaCc2QklVea2bmDhhhPBNmcHEEjW2ERFPPH2qFF4WeTqHfD0ScNCDXh2Vto/QallpbE2lDZpMF1x7pE/oybdhUo3iBkfcoxz78Xc6m7PFbjYyP2cnOA9pRkNq/M5U9EqNdqvXkDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365577; c=relaxed/simple;
	bh=OoHaqXnhpN/rL/PDYjrY5JFEW2kbEIzYoLJWTpVWg+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l5PUDBr9ksTGF+HPPEl3sCz+LSFLM5vyTB0d+JaS7Gum7FCYudXZMEoEwZI1+16SxyQAbr05iwuYgq3dq8nuZyMgzTTmnSmIQS5d28zD3108qGQGY5BxrZQ6NDY8bAcG3wMKYmTA8geYnVZaoSPSlNDZCg4U06gyfUEPlBqOBm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKC7+8BUDdmX+5vbmCJSSVesk/B+z3vo3ovhqMAC/D0ZEkzPL2VqvX2vAoimXuOKij82JbWuYbnQ3iyNdBL/WCsMP0oWQUO6Hd7+2B6JfHu/F3C+v0WjJ1eChDk6jl05jK0So8kkAhxtPnoh3vu1rgCulCkdgPeY1ksMJL5TCF0609C79Y23QQYp7d44AQvTQVQaH/MjpjIbEwn/2Mboax1uQJcP3DiIPs7btpkJiTpitig3Kk1jqI/SycG3pn3euYYd+ShlHQcLqTWBQ4JeMAQno3wvMfFDFi7HYGKHhGmkrGKe7/IcLA2Ad20DkN+QZmDc0BHdy2cXu5Ynb42NRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7C9FRbHATVqgawSkT31IM0yeBi7XUmaAlFgppreWXg8=;
 b=F4ZtdamsqQ/0YQh5s5LoQ/q8PRzaw952oEjOY1dL+vZSFeShCxgP1Jf0LJkwOpvFXrJzrGBzEfV29aQnIr4Vx2+AaTN1h638WOJeizy2qy1BTa3ofPZzy9qxAN5IF1sKm8HDxr19VRbkBOuEEgapxnATHBfAO8F0WkIgcvwnRxBov8ydXWkhHWEI597qMGykW5fgkCJuQuEUY0wHl3I9lcWFJJx7S1fxAQDfW5SeoyVHxaQGkQNIPMcn+JB4yGE4s/Vs9KWQkSY+fPvrDQJHJMtKTmeZYE9lq0g+d0lpLutOMYGhcIjiW+BEhZR+f3jJTQCmLgHHUs8Sma/7N/YaTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:23:47 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.025; Tue, 28 Apr 2026 08:23:47 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 2/2] hwmon: Add fan tach driver for StarFive
Date: Tue, 28 Apr 2026 01:23:37 -0700
Message-Id: <20260428082337.743546-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260428082337.743546-1-changhuang.liang@starfivetech.com>
References: <20260428082337.743546-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0051.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1219:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a6c2a5-c0a0-4aa2-3eb5-08dea4ff77eb
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jlSsOti+uFcNbVtglBXAPmF0o34iOrQwI0iVOdBGFZr3zTd07tt1i7E1YOk3fnsfGIvT16dENoM/U65LjFkQRMgxzUwFQ4UMHs0NFZxtWBjGIPWhNxgb8rlIzveswK7XcoNxFReHr0udJ+oJN4IK/R7uN324Vfwa3qhWiEoeH/ZPhktSTdAnhHpUyZ+dAMOgyT1Yt8wR46J1KIbs9wtJ+78TVSlhGwyl0SI44t22NRH0eq+H8vjlv8Kt9/I7N78eyTxiSSXhp9q3c7B+5kFq3FeOEa3RfHqKRN8Dx8y9hmnOjHV5MCJtCzzRKtRnTf6zVmCdDUdn10989qsTgFCPcHabbmKbEmgb7EbWb3Y84IbODoteB3H3+kVYTh17JHDPFDbDEvQORPZAaVeXpEXqQQoQOsIcW9mw5oP/5gjZqHTydSejp2zP6meMJE23um+HnqzfbLyy7GGtwDWCiL9qrJTgDXTH7MGSo0t/LcoiBg4kHwI7nBMvdVyHoJMD4wjYpiLSgnBqX01tf+/zeW+wooHUwl1lLPYvAntxLAsh4zKT6IIAcyUM8GQ19gxLiGsSJjGqR+GLwif6kYpdp3EvHGAmbcZe379bRs3TY0g7A+E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pEM6XH0w2H7f6H1uiHt9+jYMRbn4hpMaKyLdPlgLL6Flyr868YOmGPSU/8mF?=
 =?us-ascii?Q?vbQbWqB10AVA0mGmMVvJFwHJAuTEqWx+i0VBarFQWhPQ7eoIAA0GxjC5Cdp0?=
 =?us-ascii?Q?00gEt0L7pRVJX9ZYEfRWq+Heefb3bmod4BSdcRa9dA5TRBeRAcIn74A3ZWUI?=
 =?us-ascii?Q?Mg3osgL3PuUjLKpdkQUKKyFtVWjjvqFTBqxVpx9KVlUuytoKlaeo7uGoJ6UO?=
 =?us-ascii?Q?ij9vlC2T1UCa27FJsaUowDcRNBeUM7P6deuttGdvqZA0fFlMKItjm9ac8uRb?=
 =?us-ascii?Q?CefqLEdTsh4Vu0b1Ip440GX7Ir4wyVnen8spcgodD+/e7FNSzcGONqEXivVF?=
 =?us-ascii?Q?KkkXhVQt8w6zE98Pcf/8a7RIiQ8kak6g4WKk6MmrJv29UTW8Oywlpo91onTX?=
 =?us-ascii?Q?EMBQ1oHjTsdZEhfXoR+82NALzBaIfZfMfSVVmuSZl5qDjMHI84oFBXZN5HKh?=
 =?us-ascii?Q?jamr2ymKrqBIBihkfCobbomkQX7POV1CArUzTSh0GYFKc+KHHVh09rBAAqvV?=
 =?us-ascii?Q?cJWWYV7fR1eXsGamGLoVbjvO5KItKbk+lDuyMogrAkTDKARIL/f+BoWvIKlU?=
 =?us-ascii?Q?/fEUq4fRFm2qdyrwPdJPBDgPJE9+8E45zpdDuDYt0qZIXoAhP9C71h2C81cA?=
 =?us-ascii?Q?LZZRLsgGYzpAiP/LHp52TEhIs1Un4s/VW6bSojXwQ2ktl6MWg5GP7iQZsQzF?=
 =?us-ascii?Q?nWfz9fOJpPsE/JN21YA44qO8aLYpW6TSVGdwJCJJp+LTZ5GxvaHsF5u9uFvQ?=
 =?us-ascii?Q?yBM2+R1kxqg9PRyeS5+XOa3zT1ycMQBqaRaYUKgqBTcN17WDGZCAc/zfQqGV?=
 =?us-ascii?Q?OfSbZaQg0OabnRig6tVsy8bqcyTaZwZjt7w43lFLG8SCk66XXqEGaAxgMDZz?=
 =?us-ascii?Q?9CVJA4CiGHeWn6FSDX0SpoihGyn8++PFK4VGok7cylMJuMw2rSySNjKNqZgX?=
 =?us-ascii?Q?Cekm5kAX/fyYf+lMK8ZK3gKm1gG1LNc8zt0h3fQfpdfmfKQpuirsBsL/iJMB?=
 =?us-ascii?Q?+qLBwHG2+UMhUQk4E6XKPh9hASlFpTxTvWnYDgYWWthe7hPcrHGF8WY8fILh?=
 =?us-ascii?Q?n0bPjZ7DXSNMv952F6e/RrxEb98SBYeE4ESC0NLdhfXcA9hKsaBVW7nR/YXF?=
 =?us-ascii?Q?//iywRI3Qag3ESAJVg2pCKtCquiqv0GK9lYpuf5ihtNiE//fqTmu9uO33Xrp?=
 =?us-ascii?Q?cfxW//Q3vOEHNTSVgh6o6/oNaQ/lNXiJGFi1os+IXlz5kUN8lEh9oIu9RFiN?=
 =?us-ascii?Q?1G2Oksz6ROUSENUj8SG6QHVfBwGdL1pGBVbkFN1HE7KIS11rmi5O/Jn5Al9r?=
 =?us-ascii?Q?sYXVQGsTym9GFMXPs63jluilrGFUjibJxSS3EMYre+Y/SZCzQ4ql2ycmOdZb?=
 =?us-ascii?Q?XqLcanyr+MivXIXVpxY2JsAeqcGogw3yAj01qnEK6JcPT5IupIndX57/6Wb6?=
 =?us-ascii?Q?E/BKBftp2w6UE0UuhB0YCnbc8A7FEyNcyHR5ewuaBGw1nNLii1i1naxSTL0C?=
 =?us-ascii?Q?9P80bQfu0WwC0iVUBOkaIJlLHdXR6fyL++R2Fc1a0oocZyy/Y5uFGIOjZ3so?=
 =?us-ascii?Q?/x3+GQvJrFuAMHSGsXZlLKhoMhvKEN23Iqw0oM34xlGBkEJiGMJq37gzXVZG?=
 =?us-ascii?Q?Pxt2TLYW1ti0867efl3eBQM12YMUhpF1A2WiMfz/YatX3t6cYQUDJ3oXsT84?=
 =?us-ascii?Q?DacFP//HtnpJRQkcnxcrDyDRQDGthge/eTRavm/Ewd+lJfFMqKmV3H59faQu?=
 =?us-ascii?Q?pxHVZYENb3JpzzqKsZhZU8n1c4ln+VY5gMkpy837n7lYWEKHjSpX?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a6c2a5-c0a0-4aa2-3eb5-08dea4ff77eb
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:23:47.0047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0p6hS1BG9pe21VLRvfcbeKDEtYWXgVfjachpVYuR2vMMbdqKrQh2b6lk8p8hAmUdDy3h6NfVJyaq3Rt9EP+jcurOm0z35AwWP7V4VxaeN35eHaRVYTixui1Rs7SIiPsj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219

Add fan tach driver for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                       |   6 +
 drivers/hwmon/Kconfig             |   9 +
 drivers/hwmon/Makefile            |   1 +
 drivers/hwmon/starfive-fan-tach.c | 467 ++++++++++++++++++++++++++++++
 4 files changed, 483 insertions(+)
 create mode 100644 drivers/hwmon/starfive-fan-tach.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..72c1e093b865 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25539,6 +25539,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jh8100-intc.yaml
 F:	drivers/irqchip/irq-starfive-jh8100-intc.c
 
+STARFIVE JHB100 FAN-TACH DRIVER
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
+F:	drivers/hwmon/starfive-fan-tach.c
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 14e4cea48acc..85cd34a635fb 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2338,6 +2338,15 @@ config SENSORS_SPD5118_DETECT
 
 	  If unsure, say Y.
 
+config SENSORS_STARFIVE_FAN_TACH
+	tristate "StarFive Fan-Tach driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	help
+	  This driver provides support for StarFive Fan-Tach controllers.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called starfive-fan-tach.
+
 config SENSORS_TC74
 	tristate "Microchip TC74"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 4788996aa137..ff0bb789defc 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -220,6 +220,7 @@ obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
 obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
 obj-$(CONFIG_SENSORS_SPD5118)	+= spd5118.o
+obj-$(CONFIG_SENSORS_STARFIVE_FAN_TACH)	+= starfive-fan-tach.o
 obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
 obj-$(CONFIG_SENSORS_SURFACE_FAN)+= surface_fan.o
 obj-$(CONFIG_SENSORS_SURFACE_TEMP)+= surface_temp.o
diff --git a/drivers/hwmon/starfive-fan-tach.c b/drivers/hwmon/starfive-fan-tach.c
new file mode 100644
index 000000000000..394c562d2267
--- /dev/null
+++ b/drivers/hwmon/starfive-fan-tach.c
@@ -0,0 +1,467 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * FAN-TACH controller driver for StarFive JHB100
+ *
+ * Copyright (C) 2018-2024 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/errno.h>
+#include <linux/hwmon.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/sysfs.h>
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
+#define STARFIVE_FAN_DEFAULT_MEASURE_RATIO	2
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
+	struct device *dev;
+	void __iomem *regs;
+	bool tach_present[STARFIVE_FAN_TACH_CH];
+	u32 clk_rate; /* APB clock frequency */
+	struct completion comp_stall[STARFIVE_FAN_TACH_CH];
+	struct completion comp_slow[STARFIVE_FAN_TACH_CH];
+	u8 fan_stall[STARFIVE_FAN_TACH_CH];
+	u8 fan_slow[STARFIVE_FAN_TACH_CH];
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
+static int starfive_fan_tach_rpm_to_val(struct starfive_fan_tach_data *priv, u32 rpm)
+{
+	u64 tach_val;
+
+	rpm *= STARFIVE_FAN_DEFAULT_PULSE_PR;
+	tach_val = rpm / STARFIVE_FAN_DEFAULT_RPM_PAUSE_TIME;
+
+	return (int)tach_val;
+}
+
+static int starfive_fan_tach_val_to_rpm(struct starfive_fan_tach_data *priv, u32 tach_val)
+{
+	u64 rpm;
+
+	rpm = tach_val * STARFIVE_FAN_DEFAULT_RPM_PAUSE_TIME;
+
+	do_div(rpm, STARFIVE_FAN_DEFAULT_PULSE_PR);
+
+	return (int)rpm;
+}
+
+static int starfive_fan_tach_get_rpm(struct starfive_fan_tach_data *priv,
+				     u8 fan_tach_ch)
+{
+	u32 val;
+	int ret;
+
+	ret = readl_poll_timeout(priv->regs + STARFIVE_FAN_TACH_SPEED(fan_tach_ch),
+				 val, val & STARFIVE_FAN_TACH_SPEED_VALID,
+				 100, STARFIVE_FAN_TACH_TIMEOUT);
+	if (ret)
+		return ret;
+
+	val = FIELD_GET(STARFIVE_FAN_TACH_VALUE_MASK, val);
+
+	return starfive_fan_tach_val_to_rpm(priv, val);
+}
+
+static int starfive_fan_tach_get_rpm_threshold(struct starfive_fan_tach_data *priv,
+					       u8 fan_tach_ch)
+{
+	u32 val;
+
+	val = readl(priv->regs + STARFIVE_FAN_TACH_THRESHOLD(fan_tach_ch));
+
+	val = FIELD_GET(STARFIVE_FAN_TACH_VALUE_MASK, val);
+
+	return starfive_fan_tach_val_to_rpm(priv, (int)val);
+}
+
+static void starfive_set_tach_rpm_threshold(struct starfive_fan_tach_data *priv,
+					    u8 fan_tach_ch, u32 val)
+{
+	val = clamp_val(starfive_fan_tach_rpm_to_val(priv, val), 1, STARFIVE_FAN_TACH_VALUE_MASK);
+
+	writel(val, priv->regs + STARFIVE_FAN_TACH_THRESHOLD(fan_tach_ch));
+}
+
+static int starfive_fan_tach_get_ch_en(struct starfive_fan_tach_data *priv,
+				       u8 fan_tach_ch)
+{
+	u32 enable;
+
+	enable = readl(priv->regs + STARFIVE_FAN_TACH_CH_EN);
+
+	return (enable & (1 << fan_tach_ch)) ? 1 : 0;
+}
+
+static void starfive_fan_tach_set_ch_en(struct starfive_fan_tach_data *priv,
+					u8 fan_tach_ch, u32 val)
+{
+	bool enable;
+
+	switch (val) {
+	case 0:
+		enable = false;
+		break;
+	case 1:
+		enable = true;
+		break;
+	default:
+		return;
+	}
+
+	starfive_fan_tach_ch_enable(priv, fan_tach_ch, enable);
+}
+
+static int starfive_fan_tach_hwmon_read(struct device *dev,
+					enum hwmon_sensor_types type, u32 attr,
+					int channel, long *val)
+{
+	struct starfive_fan_tach_data *priv = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_fan_fault:
+		starfive_fan_tach_ch_stall_unmask(priv, channel, true);
+		/* clear fan_stall first */
+		priv->fan_stall[channel] = 0;
+		reinit_completion(&priv->comp_stall[channel]);
+		wait_for_completion_timeout(&priv->comp_stall[channel],
+					    2 * STARFIVE_FAN_TACH_TIMEOUT_JIFFIES);
+		*val = priv->fan_stall[channel];
+		starfive_fan_tach_ch_stall_unmask(priv, channel, false);
+		break;
+	case hwmon_fan_input:
+		*val = starfive_fan_tach_get_rpm(priv, channel);
+		break;
+	case hwmon_fan_min:
+		*val = starfive_fan_tach_get_rpm_threshold(priv, channel);
+		break;
+	case hwmon_fan_min_alarm:
+		starfive_fan_tach_ch_slow_unmask(priv, channel, true);
+		/* clear fan_slow first */
+		priv->fan_slow[channel] = 0;
+		reinit_completion(&priv->comp_slow[channel]);
+		wait_for_completion_timeout(&priv->comp_stall[channel],
+					    2 * STARFIVE_FAN_TACH_TIMEOUT_JIFFIES);
+		*val = priv->fan_slow[channel];
+		starfive_fan_tach_ch_slow_unmask(priv, channel, false);
+		break;
+	case hwmon_fan_enable:
+		*val = starfive_fan_tach_get_ch_en(priv, channel);
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
+		starfive_set_tach_rpm_threshold(priv, channel, (u32)val);
+		break;
+	case hwmon_fan_enable:
+		starfive_fan_tach_set_ch_en(priv, channel, (u32)val);
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
+	case hwmon_fan_pulses:
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
+static void starfive_fan_tach_present(struct starfive_fan_tach_data *priv, u8 *tach_ch,
+				      int count)
+{
+	u8 ch, index;
+
+	for (index = 0; index < count; index++) {
+		ch = tach_ch[index];
+		priv->tach_present[ch] = true;
+
+		starfive_fan_tach_ch_enable(priv, ch, true);
+		init_completion(&priv->comp_stall[ch]);
+		init_completion(&priv->comp_slow[ch]);
+	}
+}
+
+static int starfive_fan_tach_create_fan(struct device *dev, struct device_node *child,
+					struct starfive_fan_tach_data *priv)
+{
+	int ret, count;
+	u8 *tach_ch;
+
+	count = of_property_count_u8_elems(child, "tach-ch");
+	if (count < 1)
+		return -EINVAL;
+
+	tach_ch = devm_kcalloc(dev, count, sizeof(*tach_ch), GFP_KERNEL);
+	if (!tach_ch)
+		return -ENOMEM;
+
+	ret = of_property_read_u8_array(child, "tach-ch", tach_ch, count);
+	if (ret)
+		return ret;
+
+	starfive_fan_tach_present(priv, tach_ch, count);
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
+	fan_status = readl(priv->regs + STARFIVE_FAN_TACH_STATUS);
+
+	for (i = 0; i < STARFIVE_FAN_TACH_CH; i++) {
+		if (fan_status & STARFIVE_FAN_TACH_STALL_INT(i)) {
+			priv->fan_stall[i] = 1;
+			complete(&priv->comp_stall[i]);
+		}
+
+		if (fan_status & STARFIVE_FAN_TACH_SLOW_INT(i)) {
+			priv->fan_slow[i] = 1;
+			complete(&priv->comp_slow[i]);
+		}
+	}
+
+	writel(fan_status, priv->regs + STARFIVE_FAN_TACH_STATUS);
+
+	return IRQ_HANDLED;
+}
+
+static void starfive_fan_tach_reset_control_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
+static int starfive_fan_tach_probe(struct platform_device *pdev)
+{
+	struct device *hwmon_dev, *dev = &pdev->dev;
+	struct starfive_fan_tach_data *priv;
+	struct reset_control *rst;
+	struct clk *clk;
+	int irq;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regs))
+		return dev_err_probe(dev, PTR_ERR(priv->regs),
+				     "Unable to map IO resources\n");
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
+
+	ret = devm_request_irq(dev, irq, starfive_fan_tach_irq, 0, pdev->name,
+			       (void *)priv);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register interrupt handler\n");
+
+	rst = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst),
+				     "Unable to get fan tach's reset\n");
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Unable to get & enable fan tach's clock\n");
+
+	priv->clk_rate = clk_get_rate(clk);
+	if (priv->clk_rate <= 0)
+		return dev_err_probe(dev, priv->clk_rate,
+				     "Unable to get clock's rate\n");
+
+	reset_control_deassert(rst);
+	ret = devm_add_action_or_reset(dev, starfive_fan_tach_reset_control_assert, rst);
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
+		if (ret < 0) {
+			dev_warn(dev, "Failed to create fan %d", ret);
+			return 0;
+		}
+	}
+
+	platform_set_drvdata(pdev, priv);
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

