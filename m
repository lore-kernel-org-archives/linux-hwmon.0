Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2126.outbound.protection.partner.outlook.cn [139.219.146.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A14C4E780F;
	Mon, 19 Oct 2026 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410332; cv=fail; b=lAZrOzFIumtsjjyZJckDqNLjN8S+1+zt51s1oL1FWR0Cp5nTYU4c8dOScSh5pOXtLVAnAuhK2H2vRE5YsJrVNGAyrc4flJ9XujSFl50ey2jeljCUTPsTXE8vwVZzBPl+VZ9+zqnhVn9QH6x2PhL4bUS66IGkVibLgQr+6Fb+71s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410332; c=relaxed/simple;
	bh=PxK12Zqz3D2lDLjCeCekGLVsV6mLQ3QLAeNbgDuEk00=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bMHce0VThKhZ40Sk9OKaSydCyseEAgMPI/w7SNb2t+O0NgK32IutoG/Czr6X0kdx0C6vRDAmG9H0CbausW+CtGuqGk2xrmR+Cekicaj4/T1B2yb/hHVghOXO9bRyqYnAwa9W9xX1ez5F8wMINLJ8iek9tMYtI6uSwOzXQrvfXS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaY++rGzgUDSs1V+TvVtKHLfrHFzocJbzWAZJldUwe8/AIS2DkzZ0quT7s5aZW1+wYvaui0KbIq6xKgcuRvjawm1Ry7c4zqSe5UJQI4wm51fPr6moOJUzwhTUEw8wm4tzATP6veGAti2+xytK1n80+GSvpDgQvYxUH/9iAytWgFNyz3jgqXxee5Rn+lCf/6JGNR2anYPHtK0003i2xptydJreRCI8eESQH8xNjZnGHWl7pnEt2Cx6280MkAeVDxquEpUj+MxB/gJ7Ri4BZsByVeDWWfLZjq5DPoiWJxNaAS+gnJkEVuZkzHt9/xzvryDVdWsxz+DGpdmMkGKk04T3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L39XH9UwQUH/IhhDvUvGhfvDUgnIn5HwFVZV2HAwq8g=;
 b=gisdkA3oMjt7vQdXw9pDXSgbMt+/S49SzWg8cNHkmOaDVyvoNncm5v6ZDvkljh2s7GluIimKu9Dthqnx1F66Xx8g7wI5ryaiy+Kc81EgQtmFX9t1s6Hdi373rxFMER3r6+BVUFyrgbLzIwzmQ1V+zbfCSxfW6aCRY8tnYorfpyCdAwYXXri9/rpka9Ix5p8UhkFsDSZWBhRfsoi0mr1a5i5MrFTC2deVpSCSrcx0tGtmPDW/2vt2AQKUZXKOZwLa0tQDBWycQZ6qC9tUFN1yWeabRSAMviE/iI3UxeK1hlpwqfH8JjqIr2yC+9LA9AbLh5G5LL+T7td7Sg7y15tmnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1316.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:45:14 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.017; Mon, 19 Oct 2026 11:45:14 +0000
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
Subject: [PATCH v4 2/6] peci: controller: Add StarFive JHB100 PECI driver
Date: Mon, 19 Oct 2026 04:44:58 -0700
Message-Id: <20261019114502.55307-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0010.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::17) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1316:EE_
X-MS-Office365-Filtering-Correlation-Id: 923a480b-8962-4310-1289-08df2dd6705c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|52116014|6133799003|18002099003|10067099003|22082099003|3023799007|38350700014|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FurtRVtB+oEJyI2+2swGeweuccX2WLj96vhPaVdEbH6sXnzJ9BhkKK5xKOjkFA3L2qIECFPTab7S8u5lXCIIlFCcaR+T+rR6PkQVoq10AFYQGnD269L/sx4Ozq9kPQBw467eS8nQlxJ7weUMZIGAi0XIEl7VGVH/8o2a7Grcm5+hYw+NRxv7JGfG8+aEtyEB/7Xs6Vjtx+NKU8UNkUiPFZlpTq5uMJGRNyCw8F6drPeewy0RvHinuUKYUlhQ5zLRlM5KWcwU7ssb1dTp8NHkbHUz8V3coV2Q76hR1uGhIUOC1MSHtLXhVAF8EkN2xAtzg1gsNDvpf6fuIVqn/a+qDa/SXmJ3gUnxWBQb+VvB2e/VbK7rjYb5qUXq1HlsPCrrmOc2BYCCZyeIh4EMCXsVS0ZP9V9OQvhWxNbYf/DJOaafvm65Y+30K01BL7fFTu9aIgejIURfK0piv4zJTQyhArY3f8kDooiFT4CgURJ+ptJfMSuEAJuginVyV++pbSSyPHBqK76XSFztgWiLqFYZsPnWCbPXl9VpFV4myyt69bECyvXTSLggkxw899ZSPuSg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(52116014)(6133799003)(18002099003)(10067099003)(22082099003)(3023799007)(38350700014)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ft58IrfhYYq5z65RYoDsx2x6bqO3wfJZ9/bdG6TFwwrpJjDY1YHIB+Hnv5nk?=
 =?us-ascii?Q?yttqIDYGF38jovmcTZID3Jg1EtykCMldP+gAk6UUpZGzBAX8Fw3BY18TslGN?=
 =?us-ascii?Q?ZCWesrQ6gkVEtgWUdzMfy9sJJJHf97kckRnuSbaaYJR98TvVDYhslpOPZKvK?=
 =?us-ascii?Q?CxmIbyHaxE3ipJCVE3o9qVfngfZJcjGn3EfkBik9F2aIY7cVtyrCJM+lcX2U?=
 =?us-ascii?Q?qXeVpsxj1rPXTvyzzciKTGtjTvN54zb1rhYsxCaVXqQkdHxEFPhoJuXR3ds/?=
 =?us-ascii?Q?N6ShEmc4xdlOlK6I0zl1Rsl+gCg9kB3anTdB1uOdgfxG29307vlvHFpYkdyH?=
 =?us-ascii?Q?H6HF5b+RgeKhxSaHmR02VqT8rq4jijoAHkVbXEmZ5aOWduEVCaHexVPIHqIV?=
 =?us-ascii?Q?1ACCvSBepp6vOfiVW2v2w3c997s2NkQHdM/Xmz1sGLrwdwboEUGBbKwEUsRR?=
 =?us-ascii?Q?n4hWqZeD7M04Xp1/UEeh7/PfTaaVEcMWIg75HcoFLYbbUFPopZKDvlsmYV24?=
 =?us-ascii?Q?ODNHG1UQszPRZ7nL68hbtWYH5xflWV4gEpKp4DoVXxGH+muGDObyeC+W9YRO?=
 =?us-ascii?Q?WSWy/W18fQwBztacEnbEhYASHHKVOLgmVfndfmXVr4kTbCAGDbMAZQ6bupQA?=
 =?us-ascii?Q?q60KqHInbbJBwBerlcjYyqtwEFxMY3huH39LdGQHxK+l+6wr94YhZO37C77V?=
 =?us-ascii?Q?pXAeXPVQFYbPhWXX9+gqRozOx7N6U+vViDXeOgI/ERCLyDKZh2LqGzX8CFXX?=
 =?us-ascii?Q?c0IiN4m9Io5rsFkXAVAvI+S4RrqAvyhL5HhnLVW8Lm9HK4IpTVteNfpp1Fod?=
 =?us-ascii?Q?6z2PAYaq/9MGQLOrJxg7OpjvNe+oTDZMZ0/Xnv8tQTtNVWuEUZHE94NvxqSU?=
 =?us-ascii?Q?9gWRJ9PzrvZ14kKgzf+xNi1wYGpEoNH9+/1Zk4Dh8KBR/kj4kp8AAo9ZHyrZ?=
 =?us-ascii?Q?A7hLrcsg+APsY3iPE3BRcsQLwspGBGFKB1d2Z8AuUvF3B0KHIwV0Z+WC55Ua?=
 =?us-ascii?Q?ploFLs8pqbq0y8RXPH9e4GhtN8tgtQgduoIZFE1qHegokAqSDlF67vYj7GvP?=
 =?us-ascii?Q?7hGc6qL0XeLCfwAQVV+9scoczL+TWM2fw22r4cw3CsTSzOYs6QH3us1nzGAz?=
 =?us-ascii?Q?SRh+BKnEibV2wDH3VfwNi48BOm8R3VLXe1sDMc8wsDu+zdBYTKshNS+n7RSZ?=
 =?us-ascii?Q?6H23HxJu5iU9gBVM7kvpGmDLcEJ8Fn5jH380ukyn/r5mmoGsbJXvTMCdF6yy?=
 =?us-ascii?Q?XUeiMfym7LEfZFMiu5RLRb/emek9urjfTWrYyTznFGFNv5I6SEHmKUPwY5f4?=
 =?us-ascii?Q?HJoeEEf0Os3IICXboWBFbX2EMyZ8gQZCQfOXW3bex9AC73Y9fvM2E3sazhQo?=
 =?us-ascii?Q?dbk7Evk9G3pjXWUWEOyKe6QooqN1D2uPG9DbJtLt7OT+BPxfNHK2D+RSoW4g?=
 =?us-ascii?Q?L2uLk5BGVKloGxS1o09Q71J5uq2fywjsIYBpsf/YJGHrdmfCo/1ZIRrjx705?=
 =?us-ascii?Q?Gg1Uk5sZsScwbLuu7CWJ7dmljLHGu+9OyD85TdkHfkRimvkrOdJVdzIxF/wN?=
 =?us-ascii?Q?TlI2Rf7IEfvWDR7oHP+U3imtokKSG/GRAM7WRdTG5PMJz2KJrhmem5+440tN?=
 =?us-ascii?Q?2t8fWd4sFVFL9MA/tpf6Sd2KHSflqKbI08VOiAEH5jsiIoetqTeEKO/dchur?=
 =?us-ascii?Q?nLCG8BpyTm6pnsVl1FO2Ecw4NdPqLzQiOhK+k06nIAbH5iAMRbDhZG5r+pIV?=
 =?us-ascii?Q?DxnLZ2by5IoUdl9gJQ1GwCMRt8HW83j8kGSOE9AGkAW47JKeqrVv?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 923a480b-8962-4310-1289-08df2dd6705c
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:45:14.2679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmDMGB4cb/o8xspe7RjkCbQYWS01TUtVpd0zEdRuzo705yUZuFSjBo9KEI9iRRBueFVbZxnuQVEU7T87ukR4CypDotfpUv6btsvcrRlxp8uFbX6ywUhVj5vA1xDPpxVb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1316

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
 drivers/peci/controller/peci-starfive.c | 367 ++++++++++++++++++++++++
 4 files changed, 393 insertions(+)
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
index 000000000000..9f59721b891d
--- /dev/null
+++ b/drivers/peci/controller/peci-starfive.c
@@ -0,0 +1,367 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ */
+
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
+#include <linux/unaligned.h>
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
+	/* Clear any interrupts before the transfer */
+	regmap_write(priv->regmap, STARFIVE_PECI_INT_STS, STARFIVE_PECI_STS_MASK);
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
+		dev_dbg(priv->dev, "No valid response, status: %#02x\n", priv->status);
+		return -EIO;
+	}
+
+	spin_unlock_irq(&priv->lock);
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

