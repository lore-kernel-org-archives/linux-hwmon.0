Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2095.outbound.protection.partner.outlook.cn [139.219.146.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E0743CE71;
	Mon, 28 Sep 2026 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583351; cv=fail; b=UHnQQUQZC+4Z3WGlv8wfy4sqGCMo8kMXr60kRIveL5OfokBUUxDhNvVxV3DvuYG9BbFDoleYF62it+2+6Oi1SNpAKY/ZjgRtqY5tRWkBAoHF7AZylq1T/1edj0r1153lEyp15EXw40Oi1sdjDUJAxAxizIVi0+c1j4J2mxUfxZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583351; c=relaxed/simple;
	bh=O8ZYgUP322CQJ4eNLfNCchXgqh1vmmHw5rqljzmHGJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OR4do9gj9Za7OLksQvbh3SBSNkb6aeCVM4oGlkaTsRPsRDot7sIaj2dC5uuJ9ZFEyECO0cMEyqOspRKQRJnhyi8JrZNDd0P19jFGPp43+QSxBpkGB8G1bBtuposvGQ1yDVAUzlFvau/iYRu3HkdioCU8juDoflC/PVhyyLgLpJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfDxS9MLuvEAcc+p9APRIAjP79390XyShAZ/BK36o2EwJuLpags2iB1KLDyYAb1y0TkF29+16KncVOmlHCL4cDL1ZGkhr1tNfBAv+09iC+nkGTircxofA82dlp2Ak0A6qbRSiGTa/g6vVvxxYa0h+aU5Yk3E7//LP432dVVKgiDOgHsEKkQPmxu+Ntcc0iFvKacndH/4GY1ETJXGtni9uzTKUIF3bg+AZuY5xUsn//Py3KPSPjGfEnsX++iS2TzFTO+mxq3H1rD3/D9qeiKKHjoE7rAVZDF0JR+OJ5uFIr/62QCOm23ZeSf9ZsFHvbidc5tvd5v6ZsbYbswTnlv8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+upHDXdPEXQbo5/e62PbDGafxNsyT5NLrcgRMZq4PI=;
 b=IoSeZ0rU9wUb7gMT5exdKqpXf64CjAuGTATJOFS8gY+OVN/XKzWNdsyQWtc5AoQerA9MmV50S6dmWNCqpvzXNsOxdYOvt9ccOr+jG0tn0RZHapB03H3M7tiCSHgDZaAth49gP9SYdRVOolAmO67I7L16LI5Vbf1pVohG0sZbTZq5oB7pKZYoYv0uwt6c+K7qzNf5U8HP36bjM4p/niH8kGD3MWcS0S74kUXEjWtvEDOu3oyUyjMJ+wEkAvABj6wdawckVXiqbExaHkpDdU4stlkWgkU/MrC7RB9Mk0YA/YMDoR7/HU5dqic3I4JSIFMXp3TcP0pIAB7cMGcwu1Ej2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1236.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:00:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.022; Mon, 28 Sep 2026 08:00:37 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 2/6] peci: controller: Add StarFive JHB100 PECI driver
Date: Mon, 28 Sep 2026 00:59:52 -0700
Message-Id: <20260928075956.62298-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260928075956.62298-1-changhuang.liang@starfivetech.com>
References: <20260928075956.62298-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0022.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1236:EE_
X-MS-Office365-Filtering-Correlation-Id: c2dfc3d3-18cb-4820-a087-08df1d3694ee
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|7416014|366016|376014|38350700014|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	wzMUjAQGKJLZK37/rfg40gxTILOxEOuD02neoPg1X0dmfO8NNVbsT+FdVFnm2YhGs5aYE5OyMxy8A/VQl9bBqbWrspRngl64+s0RuTRrIMk0jM3ob+kwfet7qatOteMrGaFbR6cIIrqrbPueOtq1RujQJELucspuJhdni9tQseRHTZpnL+K/ezcOgBky1vDftG2EzR7f7N0U3IDzeqgHEjtbrjX2J0u5So4kCk+edRcCiAoZ8w4uFSZo68j0lXegE7x8kG6xlE7i35sFcQfsZ1wF+YsDiB585uHhqdzBe/KQMTCDirLoyqPni7+0bbCtzEHHs8gB1iXqLBgebiy0PPSFNH6kBXFtR4t/kkXLNZkmCE+IMWsmTkLQysKsmycPzApDPA+4chVa7OTTQD36uEvoaSj6UkYGV8e1sEirsHSR9RaXkHAIQdyGBs0KVyhWmXp2sokgNaTZ+R50F54n1QE3bZ1x2JhKNq0HVBgcsgD1AWtSfvrbSP+OAc8wNITv5PhDggQFtZpbi2dEABFRdOHT93N//m7BCdFIrCUqbQmQD9PkkxrULtScP5KKjPSB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(7416014)(366016)(376014)(38350700014)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JCSbnQ/xTXtUeGIjFIq4DerGvEhtsscktFnXS8ZfnevEJaO7iPr5N94WYKjp?=
 =?us-ascii?Q?i6iopS8+av8S0ThW+0p5QZj1+8Xo3PmonoekSz+KsPaRYhhwlNqea3WXeKBw?=
 =?us-ascii?Q?8A6oVlqZxYyirNFU/opTMOWz412+OOI1P3Ll24T9H+kL52VtfzAQOPSKC81v?=
 =?us-ascii?Q?fsORjGQ7IoHqEynH5xx34mhrcH2RvzYphuJhslQkk44GZJa+Q/Au5VOM7umx?=
 =?us-ascii?Q?c+oOZhc1wild5qOmgjKdKUNsSCk8X12EWc36mJM9PubmCBipaYlIpiSGgnTc?=
 =?us-ascii?Q?X2ASxZULfZvGgIJKg8SKGi6dgeAvlujaQ2o9E02Lzv5+QXJj7RNtdenwSGlE?=
 =?us-ascii?Q?ID2tc61uuNyO/oF6IXRyCAZrBLndyQeeRmDjD42SYXzeTx85+e3CKOqMNvE9?=
 =?us-ascii?Q?zIly3sme0z3zWh38dMzKNuv9oV5TdGFUlh1Gy7JXyM/2wqxIXlfHYtXc3g/p?=
 =?us-ascii?Q?sDf5JttIF0knRemhjYdNOa6kiCdtRVzhqb3V3O1o7oo990efA3H0zOBhjzyU?=
 =?us-ascii?Q?/A69fcdTYDNz3+98VwiKRUS8vMW+gPt9/cwaZ/3FF3RUAXyUPkWN3Ocb8aSl?=
 =?us-ascii?Q?Mm31izZCbgrQdOQ6O4hsQS/Dn9niMQ19z1fGszPgD1SY5aqkRCF5C4bPBjiw?=
 =?us-ascii?Q?BjV3WS+oB7+wv38SRuUWLpGkOMgrOyDwGzmPsNr/0H3am8DqJ/AsaRIT6aLJ?=
 =?us-ascii?Q?SjniNoCOwAYKSUwu9tzJ5Gf46/Hefse8lYnOK9TgkjzCU3aJ9RreFpXXv5SF?=
 =?us-ascii?Q?ghedLvYcGEizwAXL7cTX16P1T9YN9+l9kfMADfNUo9IXaq/di1apJlP318Dc?=
 =?us-ascii?Q?M6X4OJt032MNotNNS4zzC2E8C8LtcWfQVXdo/6AC7zccpvnOlvqdytwse/2K?=
 =?us-ascii?Q?HGXxZIGv3B4Y9noYepAzjfagLnudjziUemUSZssnLNUD3bluSoJLiUO84rJq?=
 =?us-ascii?Q?LVfQi20IAu5kuSu0ezoAxEOhswSuezVYo3KDx30W8/F6JXmN/LywHUmK2ENu?=
 =?us-ascii?Q?Voo5l0VfVBOUGjiUB8EEi8mNATfpTVX8s6ELeCWHGjnz22uNv12RUeR7YXrJ?=
 =?us-ascii?Q?uyf4aUJHFXJiCjeJJkn3WwOLO2GOr75NBkihG9OLZRn+vOPEyBgVnBqEoCHM?=
 =?us-ascii?Q?XQrZRmy8jcDZlyoNHs1HlBvFRt4YYEb3qYH5xtO1MPBMKSg06hV2T3UN3ICq?=
 =?us-ascii?Q?PuL3mDkotDWUmso9Wu3VP4qIs7LRAeHWuHktEbjO4yfufEYa3jI/s36jfHl5?=
 =?us-ascii?Q?beaNbNPQBObQC7L9qcMuNYbKuunZO3bIKUSDFAe/RnZ8SsENuLTpJNgM1S/E?=
 =?us-ascii?Q?rMX04CmFlnzb8hTOXXAGZqFnD53A++/8Z5lkcUq52luClWp4xtIJmu40d5n9?=
 =?us-ascii?Q?C+VVH8oxg8r2FXP7w8KSs3LWXX3XnLLOTjodCxPDSnNda95NCu0VQHA5XELR?=
 =?us-ascii?Q?0jrBjEkFMZtVxRbzsQaNKhGiMDsI0Pp8QIiUluCY/Q8ShvPZQfSZCuBUqX+h?=
 =?us-ascii?Q?NNLKy+NumW2lz+jZQeLENoLFlZC41cWyyD8KvPavNrsVArb9zUxvA+c5W4j6?=
 =?us-ascii?Q?jinhJs1BsvmhV5vM4+YcqCmstTk37SQckQt0bcPYMUt8XTA805ECu18ZI0BU?=
 =?us-ascii?Q?6rBJjpd/751bb4qlVJ0OdI/h8ZhSBEKaXZ3IR4V5R1mWHZvwXA4fMmM8TsgQ?=
 =?us-ascii?Q?qAqBKn4qynJDXJxL73aCs++2UFgM7WbRaNC4FjKLrYlkel2Sd2lMpIL4JCt6?=
 =?us-ascii?Q?lUh2Fq6Xbheu8ny3K7BZ9j9u0moPFgOJw74V39q/E+SdkQOmpgUw?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dfc3d3-18cb-4820-a087-08df1d3694ee
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:00:37.4890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Tg2zkdHNAMDknQUG7JDY3Tk9brNZ1+N7kmaJBBXd5W49nZMVvCgoIDaYPQRzSxWHrY/kprP3eR/iTcggC5cotAkI/1vfINRGc+YZwGnJZvFP1hbtiugoZnxkV6CWDPE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1236

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
index 834f88b7a41b..a8d7ece2d199 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26224,6 +26224,14 @@ S:	Supported
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
index 000000000000..6004cb27a774
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
+	priv->rst = devm_reset_control_get(priv->dev, NULL);
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

