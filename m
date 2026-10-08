Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2098.outbound.protection.partner.outlook.cn [139.219.17.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E9138654F;
	Thu,  8 Oct 2026 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454873; cv=fail; b=PfbOhE/yQCD3wwgqFQ2KGo6xc27NgwGeDle4mmVgynrhQyiD2xi1ty6Nj8fyB/UpFPrQuAzazVuTEdo3GGZ29UvhZk9bYgwaRaSqynHDY1NqOK+g96rVmMx34/3CufeB3ZfJkyWxK9P6lO7TzmW5k5u2+d4X42sAUkdLrSr7mxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454873; c=relaxed/simple;
	bh=dJayZTZgFCX2mFmmZGTwhOZTmpPgHJZYCI08zu3qZHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eeV5zncYTVlurN4bKbaT9dfzNnO0iCe1u+7/EKeFdFMRalDwufaZl/K2itzFmvQcZNzlTR/JX91crOVVOJw1jbErfbHl1AvDkehVIVJb6czhHjabC7dI8Dx3bLMs/po1TGC7mSwKQ6khAE8mYl+wICRLjVbS6MLQpejHOPgez9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8Y3OFoAd9XEdPuQIR+KBqxY+gTDsPa2/3JsQjWEfyJvFj1ELs0CcGs5LQCxuCuGv/AQ4/0G6CB94R2YlsgL7zXHlh8JTrFBFyQ3JJ8PQdMq0jqayROgD5HZSjnSVg90UKjrCmd7IwIts5MIWunTPPJ9A9ILZY5FbtPv/t5Tjp64/rViqgxgZD9IAkFakWRrpPvXaEFc79yoVsot73VMy42eB54a1qZWpCNtY0GVz+Pxtq0aIniWY1rD1GRDjbsgyeI15dT6cUPGwPkHlGljwKcBZXxR01cT/fNjvEiqtMz+M1b/6SYq8fZqiD73666vFsF8S94EX1NF9OYhPd3V6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rA2gtkGfltSD1WyesuBA/KDPUhCXcC8KPu6jFi+f4XY=;
 b=Ya304bDMK+9uTNU9Puc44u9so/oI5ZssGCGPtMx7Yu2ZsNnUN2Fi/MGoU+OtmjLPicqIgrnTxj+WIC/gfHmpjTonVSE3mkRoFAI0dAiqeBnUewP8kddregTGAbcwLl45tHpeJaBs6Rb7fayX+X4sOGK7iiYunOSJ1nxOuNjvVxLBxeE1aSWfCsT581KUr1LdQITzeIDlptfWIrOBhl8FcnopE9c45yt5RDZxdGbyriu92D9P3rX4tFwqdjsdqQ39JHml0E77wanWVTOpqJ1doQba5NTtu+Ej4jse6OIiOYO9a2agqzTwQGFhqSJoMaQbBWy4mgPmY+cHGecTZQvsrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 10:06:35 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 10:06:35 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v3 2/6] peci: controller: Add StarFive JHB100 PECI driver
Date: Thu,  8 Oct 2026 03:06:19 -0700
Message-Id: <20261008100623.7085-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
References: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0026.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::35) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1332:EE_
X-MS-Office365-Filtering-Correlation-Id: b40224aa-4602-46b2-9e8c-08df2523d62b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|52116014|1800799024|376014|366016|38350700014|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	bQ5l2WIUBBeLotttK9/fuXWpfOSUg7DdnyBrPGVqfDF9bs4OjH3wJ+MMm+IjGzHg/c6MT1b9rSCfr23YEq3VNUvHJh/mKjaroadKjkUoj84RKuh1RxWtZyudNtNf+r2PDmrltHb8Atl0qhNbJkDZs/Tix0kABgZdcUxg9M+vv4pgeFxOhDwreI4ncid4dAuiHgHXcTEIXGNfctDymRiLFA8nLtxkKeRQKIRLRWRJJl2peqcQRSWaMUi0LjTZIi6Kscj5R0TSRIcFxLNaLreOO+0gblERBf3MNoVBOaaPMpc7FJYh/hKxolDlYx7dVAwBh/bcsibSQ4kupDjg1qdF/aVsei9FgWxeb1GxpKQ3NkHVVxnHL8vqwQ0MgnitvkzyYttZDyCXQcKdNcOux+elC7QxR6v69ogARn7f9xuMs5vQDQ/iMMgDwHXslH3gE14OgM6A35fRvdPmJ/7mVuISuihxsDIRc03CemBt39o02zsEbYyCYFa2m8mpB5nRAay2rWL1NDeFDM0KjS8faavOfbAe4zKB9BPhfpb61cZvg8QxuWZEG2RQRfuygKX1MzqN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(52116014)(1800799024)(376014)(366016)(38350700014)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dcCJt89n0DP+hT7AXys6Wi9Eid4yrz4lSTm+g1p9vzLDVH1s/ITkL7oH5n6I?=
 =?us-ascii?Q?GuInaW8bJFsAx5YGFBpKGbJewRz9ozAVUONcjyYnooQO3eZguuNrL+giI4m8?=
 =?us-ascii?Q?elWXRPu/B9cz/IKdpADxmSg1Cth90QAj7jgKMIZEBeuAn8hTySpnP+jS+w38?=
 =?us-ascii?Q?hembdvGsLfSilbXt0qZ3uVLx5fvEzu6aY6bVhUS+zjZRfY6+qshL4pykThfV?=
 =?us-ascii?Q?UsQwbpiHDsMIe1pNfwCFg0pGGCGNnM5x1hP5Rojbc5Sr1MNyTVTwSpA+ICHC?=
 =?us-ascii?Q?7fLtxoO1RQGnX2i8cJpcrpEuEI0hChThxRcpJwSfhvVTLWOqXYiDyQ+87GRv?=
 =?us-ascii?Q?ew8+kl9+kHpveuStRubv6VgHH9LwkK25VGw+mUC/kz0/ekgIpms8pxZ6rLGs?=
 =?us-ascii?Q?cQoKsWMN13vdsjWbIZVmxqlUJCjqcP4gMJxy+QbSP4ue42vpeJaLD1hs46ix?=
 =?us-ascii?Q?etgMi9Nsr2DHtVDLz322ZX/Vfv5K8rjJr8zJxYxmp4djHnVX7I1tOogFrAHH?=
 =?us-ascii?Q?UxoJrGDwxtSEdp2S9PipU3sueRlwz+98x54d3lOiF39gR3qYHCDFR+7qwS3H?=
 =?us-ascii?Q?QXLN2uuaH4ZAiir734BKmCDB4bEh8WDTGJAggnarPGEivEIKA+yhix2orL69?=
 =?us-ascii?Q?fr9uV1Rhe/4jXjhi7KIhINrm9J9lVK7v6hGMFvNhNbYjOF9xH0sjXesbU8Q9?=
 =?us-ascii?Q?jKaqQFQNE87aix/u66/KVcDuYg8kMjN6JkOTErPrsnNPrioS0JWZg/+bHJ6J?=
 =?us-ascii?Q?/sYCn1KbAaw55/fbq7SA/ZUf3scGoyCI8OmGn2bjK5Gpbc5RX4mdMQf6ELGx?=
 =?us-ascii?Q?xRauM/d4CiePafoBJdFB9ocVVyatXZodNoWr8J5zdCMILdLWjIQPUCovSdll?=
 =?us-ascii?Q?Kip2HjGgvc/2hTeq13oy2Lvn3iOejpvPjBxxi9niecisrU6B71RSktUfApnC?=
 =?us-ascii?Q?6gOzw3ypGZDJ0htbAyTOL3QXHUWJcCV8tyVh58aBsUHNpQHfN8kRD21XAsQJ?=
 =?us-ascii?Q?wk0KqRmIjY2mpKNOX9unLo0XIQVDNIYH3Yc7I3e97bmTRXcFyk7apQVMtYFT?=
 =?us-ascii?Q?pr38YBmHdAnVZEslvSmcynIm8Dfpee6oRpPBzNjGZIrfMd6grkqUJbUB8vXT?=
 =?us-ascii?Q?XYlvOcN6T6R+nY+3wBe3uRIxaPQJpEtJKdq4IIXI8KlqMo3QNNeLgJgAqILi?=
 =?us-ascii?Q?f2i+nUGE4LevCvO/DiVGPbEOALAAxGKQaLRl5EObK/yITN3crjzaf0DUDH/T?=
 =?us-ascii?Q?L1Sa4rN3T+dEG6o7/ZfuJKmIeu+hIaUKMczQoM58EnANzqrzGTkzK7V0kC5t?=
 =?us-ascii?Q?ULYJR+M4B9VmqWC2LVsy3kAO+WxMBJS5bMphOOVJkWuM7PsWN/ax7FplQskR?=
 =?us-ascii?Q?VtOtTAqlZe0LnHc61XWT5UGAuVT0y1p5erUvqwNLw9jmMDHI9J7QEfNCIRCo?=
 =?us-ascii?Q?U6M085alK682nKxiDsxQItspNWMPPN6JfryNfvf724tEA/fiGCULe6wWkDdU?=
 =?us-ascii?Q?uACWZ6zSDhCfrwSCHit8UeFL7wV+u3Gke6dKc4PEQ0ujo60CjeLls/1R2g3S?=
 =?us-ascii?Q?5vnevsd5L+RPwpvVDUbBipAxuLzo4PfaaPgw+js4PJWkH4xzjJXZyJPLvqi2?=
 =?us-ascii?Q?XZ1b8f0AmsBg4IKOLaYhZkprj+6bajZ6zElOf7wq559lhQb7A+JMKJWEeZac?=
 =?us-ascii?Q?1lt5b2C3GwohE57PCB5uHcXGZnWKHafwQfVpM2BBp4jZohO+0oKNlTaywdaE?=
 =?us-ascii?Q?ctACETL2be+TWokdk3BwbQz3Dw7RAl417fDtOtzm82J2Xulg+bRp?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40224aa-4602-46b2-9e8c-08df2523d62b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:06:35.8064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXWZAFMzMacV820xq3CGkbwAw4s3EmEljelLGfcGHaMCYoVUTOw3GCWhvYIbA4m2m5yWLiQyWEb3IZyUOhAi88K3VnJi7S8J5yXB8mBvta31K85/M0MpNdDpoglTkBvk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Add PECI controller driver for StarFive JHB100 SoC. The driver supports
PECI protocol communication for CPU thermal management.

For this controller, the special clock and reset operation sequence is:
  probe: clk_prepare_enable() then reset_control_deassert()
  remove: clk_disable_unprepare() then reset_control_assert()

Co-developed-by: Mason Huo <mason.huo@starfivetech.com>
Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                             |   8 +
 drivers/peci/controller/Kconfig         |  17 ++
 drivers/peci/controller/Makefile        |   1 +
 drivers/peci/controller/peci-starfive.c | 376 ++++++++++++++++++++++++
 4 files changed, 402 insertions(+)
 create mode 100644 drivers/peci/controller/peci-starfive.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d3dc32c7a0f0..1fb3a3f03fce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26653,6 +26653,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
 F:	drivers/irqchip/irq-starfive-jhb100-intc.c
 
+STARFIVE JHB100 PECI DRIVER
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+M:	Mason Huo <mason.huo@starfivetech.com>
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/peci/starfive,jhb100-peci.yaml
+F:	drivers/peci/controller/peci-starfive.c
+
 STARFIVE JHB100 PINCTRL DRIVERS
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 M:	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
diff --git a/drivers/peci/controller/Kconfig b/drivers/peci/controller/Kconfig
index 4f9c245ad042..c0c35bc179ef 100644
--- a/drivers/peci/controller/Kconfig
+++ b/drivers/peci/controller/Kconfig
@@ -32,3 +32,20 @@ config PECI_NPCM
 
 	  This support is also available as a module. If so, the module
 	  will be called peci-npcm.
+
+config PECI_STARFIVE
+	tristate "STARFIVE PECI support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
+	select REGMAP_MMIO
+	help
+	  This option enables PECI controller driver for StarFive JHB100
+	  SoC. It allows BMC to discover devices connected to it, and
+	  communicate with them using PECI protocol.
+
+	  Say Y here if your system runs on StarFive JHB100 SoC and you are
+	  using it as BMC for Intel platform.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called peci-starfive.
diff --git a/drivers/peci/controller/Makefile b/drivers/peci/controller/Makefile
index e247449bb423..935e356b058c 100644
--- a/drivers/peci/controller/Makefile
+++ b/drivers/peci/controller/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_PECI_ASPEED)	+= peci-aspeed.o
 obj-$(CONFIG_PECI_NPCM)		+= peci-npcm.o
+obj-$(CONFIG_PECI_STARFIVE)	+= peci-starfive.o
diff --git a/drivers/peci/controller/peci-starfive.c b/drivers/peci/controller/peci-starfive.c
new file mode 100644
index 000000000000..93aca2413f5c
--- /dev/null
+++ b/drivers/peci/controller/peci-starfive.c
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/unaligned.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/interrupt.h>
+#include <linux/jiffies.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/peci.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+/* Control register */
+#define STARFIVE_PECI_CTRL			0x00
+/* automatically clears after transfer started */
+#define   STARFIVE_PECI_CTRL_START		BIT(0)
+#define   STARFIVE_PECI_CTRL_FCS_MODE		BIT(2)
+#define   STARFIVE_PECI_CTRL_AW_FCS_EN		BIT(3)
+#define   STARFIVE_PECI_CTRL_RDY		BIT(4)
+
+/* Read/Write length register */
+#define STARFIVE_PECI_HDR			0x04
+#define   STARFIVE_PECI_HDR_RD_LEN_MASK		GENMASK(23, 16)
+#define   STARFIVE_PECI_HDR_WR_LEN_MASK		GENMASK(15, 8)
+#define   STARFIVE_PECI_HDR_TARGET_ADDR_MASK	GENMASK(7, 0)
+
+/* Feature control register */
+#define STARFIVE_PECI_F_CTRL			0x0c
+#define   STARFIVE_PECI_F_CTRL_EN		BIT(0)
+
+/* Interrupt enable register */
+#define STARFIVE_PECI_INT_EN			0x10
+#define   STARFIVE_PECI_INT_XFER_DONE		BIT(0)
+#define   STARFIVE_PECI_INT_CFG_ERR		BIT(1)
+#define   STARFIVE_PECI_INT_TBIT_ERR		BIT(2)
+#define   STARFIVE_PECI_INT_BAD_WR_FCS		BIT(3)
+#define   STARFIVE_PECI_INT_ABORT_WR_FCS	BIT(4)
+#define   STARFIVE_PECI_INT_BAD_RD_FCS		BIT(5)
+#define   STARFIVE_PECI_INT_BUS_CONTENTION	BIT(6)
+#define   STARFIVE_PECI_INT_TBIT_OVER_LIMIT	BIT(7)
+#define   STARFIVE_PECI_INT_ALL			GENMASK(7, 0)
+
+/* Interrupt status register */
+#define STARFIVE_PECI_INT_STS			0x14
+#define   STARFIVE_PECI_STS_XFER_DONE		BIT(0)
+#define   STARFIVE_PECI_STS_CFG_ERR		BIT(1)
+#define   STARFIVE_PECI_STS_TBIT_ERR		BIT(2)
+#define   STARFIVE_PECI_STS_BAD_WR_FCS		BIT(3)
+#define   STARFIVE_PECI_STS_ABORT_WR_FCS	BIT(4)
+#define   STARFIVE_PECI_STS_BAD_RD_FCS		BIT(5)
+#define   STARFIVE_PECI_STS_BUS_CONTENTION	BIT(6)
+#define   STARFIVE_PECI_STS_TBIT_OVER_LIMIT	BIT(7)
+#define   STARFIVE_PECI_STS_MASK		GENMASK(7, 0)
+
+/* Received FCS data register */
+#define STARFIVE_PECI_FCS_RCVD			0x1C
+#define   STARFIVE_PECI_RCVD_WR_FCS_MASK	GENMASK(7, 0)
+#define   STARFIVE_PECI_RCVD_RD_FCS_MASK	GENMASK(15, 8)
+
+/* Rx/Tx Data Buffer Registers */
+#define STARFIVE_PECI_WR_DATA(n)		(0x70 + ((n) * 4))
+#define STARFIVE_PECI_RD_DATA(n)		(0xB0 + ((n) * 4))
+
+/* Hardware TX/RX data FIFOs are 64 bytes, but PECI core caps requests lower */
+#define STARFIVE_PECI_DATA_BUF_SIZE_MAX		min(64, PECI_REQUEST_MAX_BUF_SIZE)
+#define STARFIVE_PECI_MAX_REG			0x100
+
+/* Timeout */
+#define STARFIVE_PECI_IDLE_CHECK_TIMEOUT_US	(50 * USEC_PER_MSEC)
+#define STARFIVE_PECI_IDLE_CHECK_INTERVAL_US	(10 * USEC_PER_MSEC)
+#define STARFIVE_PECI_CMD_TIMEOUT_MS_DEFAULT	1000
+#define STARFIVE_PECI_CMD_TIMEOUT_MS_MAX	1000
+
+struct starfive_peci {
+	u32			cmd_timeout_ms;
+	struct completion	xfer_complete;
+	struct regmap		*regmap;
+	u32			status;
+	spinlock_t		lock;	/* sync completion status */
+	struct peci_controller	*controller;
+	struct device		*dev;
+	struct clk		*clk;
+	struct reset_control	*rst;
+	int			irq;
+};
+
+static int starfive_peci_xfer(struct peci_controller *controller,
+			      u8 addr, struct peci_request *req)
+{
+	struct starfive_peci *priv = dev_get_drvdata(controller->dev.parent);
+	unsigned long timeout = msecs_to_jiffies(priv->cmd_timeout_ms);
+	u32 msg_rd;
+	u32 cmd_sts;
+	u32 peci_hdr;
+	int i, ret, j;
+
+	if (req->tx.len > STARFIVE_PECI_DATA_BUF_SIZE_MAX ||
+	    req->rx.len > STARFIVE_PECI_DATA_BUF_SIZE_MAX)
+		return -EINVAL;
+
+	/* Check command sts and bus idle state */
+	ret = regmap_read_poll_timeout(priv->regmap,
+				       STARFIVE_PECI_CTRL, cmd_sts,
+				       cmd_sts & STARFIVE_PECI_CTRL_RDY,
+				       STARFIVE_PECI_IDLE_CHECK_INTERVAL_US,
+				       STARFIVE_PECI_IDLE_CHECK_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	spin_lock_irq(&priv->lock);
+	reinit_completion(&priv->xfer_complete);
+
+	peci_hdr = FIELD_PREP(STARFIVE_PECI_HDR_TARGET_ADDR_MASK, addr) |
+		   FIELD_PREP(STARFIVE_PECI_HDR_WR_LEN_MASK, req->tx.len) |
+		   FIELD_PREP(STARFIVE_PECI_HDR_RD_LEN_MASK, req->rx.len);
+	regmap_write(priv->regmap, STARFIVE_PECI_HDR, peci_hdr);
+
+	/* Currently, we do not support write commands, force this bit to 0. */
+	regmap_write_bits(priv->regmap, STARFIVE_PECI_CTRL,
+			  STARFIVE_PECI_CTRL_AW_FCS_EN, 0);
+
+	for (i = 0; i < ALIGN(req->tx.len, 4) / 4; i++)
+		regmap_write(priv->regmap, STARFIVE_PECI_WR_DATA(i),
+			     get_unaligned_le32(&req->tx.buf[4 * i]));
+
+	dev_dbg(priv->dev, "addr : %#02x, tx.len : %#02x, rx.len : %#02x\n",
+		addr, req->tx.len, req->rx.len);
+	print_hex_dump_bytes("TX : ", DUMP_PREFIX_NONE, req->tx.buf,
+			     req->tx.len);
+
+	priv->status = 0;
+
+	regmap_write_bits(priv->regmap, STARFIVE_PECI_CTRL,
+			  STARFIVE_PECI_CTRL_START, STARFIVE_PECI_CTRL_START);
+
+	spin_unlock_irq(&priv->lock);
+
+	ret = wait_for_completion_interruptible_timeout(&priv->xfer_complete,
+							timeout);
+	if (ret < 0)
+		return ret;
+
+	if (ret == 0) {
+		dev_dbg(priv->dev, "Timeout waiting for a response\n");
+		return -ETIMEDOUT;
+	}
+
+	spin_lock_irq(&priv->lock);
+
+	if (priv->status != STARFIVE_PECI_STS_XFER_DONE) {
+		spin_unlock_irq(&priv->lock);
+		dev_dbg(priv->dev, "No valid response, status: %#02x\n",
+			priv->status);
+		return -EIO;
+	}
+
+	regmap_read(priv->regmap, STARFIVE_PECI_FCS_RCVD, &msg_rd);
+	dev_dbg(priv->dev, "write & read command FCS : %#02lx & %#02lx\n",
+		FIELD_GET(STARFIVE_PECI_RCVD_WR_FCS_MASK, msg_rd),
+		FIELD_GET(STARFIVE_PECI_RCVD_RD_FCS_MASK, msg_rd));
+
+	for (i = 0; i < ALIGN(req->rx.len, 4) / 4; i++) {
+		regmap_read(priv->regmap, STARFIVE_PECI_RD_DATA(i), &msg_rd);
+
+		if (req->rx.len - 4 * (i + 1) >= 0) {
+			put_unaligned_be32(msg_rd, &req->rx.buf[req->rx.len - 4 * (i + 1)]);
+		} else {
+			for (j = req->rx.len % 4 - 1; j >= 0; j--) {
+				req->rx.buf[j] = (u8)msg_rd;
+				msg_rd >>= 8;
+			}
+		}
+	}
+
+	spin_unlock_irq(&priv->lock);
+
+	print_hex_dump_bytes("RX : ",
+			     DUMP_PREFIX_NONE, req->rx.buf, req->rx.len);
+
+	return 0;
+}
+
+static irqreturn_t starfive_peci_irq_handler(int irq, void *arg)
+{
+	struct starfive_peci *priv = arg;
+	u32 status;
+
+	spin_lock(&priv->lock);
+	regmap_read(priv->regmap, STARFIVE_PECI_INT_STS, &status);
+	priv->status |= (status & STARFIVE_PECI_STS_MASK);
+	regmap_write(priv->regmap, STARFIVE_PECI_INT_STS,
+		     status & STARFIVE_PECI_STS_MASK);
+
+	/*
+	 * All commands are terminated with the XFER_DONE bit set, even when
+	 * an error condition is reported alongside it.
+	 */
+	if (status & STARFIVE_PECI_STS_XFER_DONE)
+		complete(&priv->xfer_complete);
+
+	spin_unlock(&priv->lock);
+
+	return IRQ_HANDLED;
+}
+
+static void starfive_peci_clk_reset_release(void *data)
+{
+	struct starfive_peci *priv = data;
+
+	clk_disable_unprepare(priv->clk);
+	reset_control_assert(priv->rst);
+}
+
+static int starfive_peci_init_clk_rst(struct starfive_peci *priv)
+{
+	int ret;
+
+	priv->clk = devm_clk_get(priv->dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(priv->dev, PTR_ERR(priv->clk),
+				     "Failed to get peci clock\n");
+
+	priv->rst = devm_reset_control_get_exclusive(priv->dev, NULL);
+	if (IS_ERR(priv->rst))
+		return dev_err_probe(priv->dev, PTR_ERR(priv->rst),
+				     "Failed to get reset control\n");
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to enable peci clock\n");
+
+	ret = reset_control_deassert(priv->rst);
+	if (ret) {
+		clk_disable_unprepare(priv->clk);
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to deassert reset control\n");
+	}
+
+	return devm_add_action_or_reset(priv->dev, starfive_peci_clk_reset_release,
+					priv);
+}
+
+static int starfive_peci_init_ctrl(struct starfive_peci *priv)
+{
+	u32 cmd_sts;
+	int ret;
+
+	ret = device_property_read_u32(priv->dev, "cmd-timeout-ms",
+				       &priv->cmd_timeout_ms);
+	if (ret) {
+		priv->cmd_timeout_ms = STARFIVE_PECI_CMD_TIMEOUT_MS_DEFAULT;
+	} else if (priv->cmd_timeout_ms > STARFIVE_PECI_CMD_TIMEOUT_MS_MAX ||
+		   priv->cmd_timeout_ms == 0) {
+		dev_warn(priv->dev,
+			 "Invalid cmd-timeout-ms: %u, falling back to: %u\n",
+			 priv->cmd_timeout_ms,
+			 STARFIVE_PECI_CMD_TIMEOUT_MS_DEFAULT);
+
+		priv->cmd_timeout_ms = STARFIVE_PECI_CMD_TIMEOUT_MS_DEFAULT;
+	}
+
+	regmap_write_bits(priv->regmap, STARFIVE_PECI_F_CTRL,
+			  STARFIVE_PECI_F_CTRL_EN, STARFIVE_PECI_F_CTRL_EN);
+	regmap_write_bits(priv->regmap, STARFIVE_PECI_CTRL,
+			  STARFIVE_PECI_CTRL_FCS_MODE, STARFIVE_PECI_CTRL_FCS_MODE);
+
+	ret = regmap_read_poll_timeout(priv->regmap,
+				       STARFIVE_PECI_CTRL, cmd_sts,
+				       cmd_sts & STARFIVE_PECI_CTRL_RDY,
+				       STARFIVE_PECI_IDLE_CHECK_INTERVAL_US,
+				       STARFIVE_PECI_IDLE_CHECK_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	regmap_write(priv->regmap, STARFIVE_PECI_INT_STS, STARFIVE_PECI_STS_MASK);
+
+	/* PECI interrupt enable */
+	regmap_write(priv->regmap, STARFIVE_PECI_INT_EN, STARFIVE_PECI_INT_ALL);
+
+	return 0;
+}
+
+static const struct regmap_config starfive_peci_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.max_register = STARFIVE_PECI_MAX_REG,
+	.fast_io = true,
+};
+
+static const struct peci_controller_ops starfive_ops = {
+	.xfer = starfive_peci_xfer,
+};
+
+static int starfive_peci_probe(struct platform_device *pdev)
+{
+	struct peci_controller *controller;
+	struct starfive_peci *priv;
+	void __iomem *base;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+	dev_set_drvdata(&pdev->dev, priv);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
+					     &starfive_peci_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(priv->dev, PTR_ERR(priv->regmap),
+				     "Failed to initialize regmap\n");
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return dev_err_probe(priv->dev, priv->irq, "Failed to get IRQ\n");
+
+	init_completion(&priv->xfer_complete);
+	spin_lock_init(&priv->lock);
+
+	ret = starfive_peci_init_clk_rst(priv);
+	if (ret)
+		return dev_err_probe(priv->dev, ret, "Failed to initialize clock and reset\n");
+
+	ret = devm_request_irq(&pdev->dev,
+			       priv->irq, starfive_peci_irq_handler,
+			       0, "peci-starfive", priv);
+	if (ret)
+		return dev_err_probe(priv->dev, ret, "Failed to request IRQ\n");
+
+	ret = starfive_peci_init_ctrl(priv);
+	if (ret)
+		return dev_err_probe(priv->dev, ret, "Failed to initialize control\n");
+
+	controller = devm_peci_controller_add(priv->dev, &starfive_ops);
+	if (IS_ERR(controller))
+		return dev_err_probe(priv->dev, PTR_ERR(controller),
+				     "Failed to add peci controller\n");
+
+	priv->controller = controller;
+
+	return 0;
+}
+
+static const struct of_device_id starfive_peci_of_table[] = {
+	{ .compatible = "starfive,jhb100-peci", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, starfive_peci_of_table);
+
+static struct platform_driver starfive_peci_driver = {
+	.probe	= starfive_peci_probe,
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table = starfive_peci_of_table,
+	},
+};
+module_platform_driver(starfive_peci_driver);
+
+MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
+MODULE_AUTHOR("Mason Huo <mason.huo@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive PECI driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PECI");
-- 
2.25.1

