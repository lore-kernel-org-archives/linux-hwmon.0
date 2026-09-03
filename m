Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2127.outbound.protection.partner.outlook.cn [139.219.17.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F24AE110;
	Thu,  3 Sep 2026 13:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442560; cv=fail; b=R1wHT/0E/v4jhXw3wgZMYqFAV85mi1k8mwkVO07Cx68wwiCF8H/az0Sw65XFX4kE3Lh9d+OJ1C+yQetUPXF1yAyW8ccB7BNfMdkDtD0PMQhbQPK4GHYMoZ0xn8ry89Ks9pkhTsMDWTqFXdEtEpvq6b40U44+O+WWYeqrDx2sGdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442560; c=relaxed/simple;
	bh=4v8GK6Q37Dvn72+Z5rSa2wOND/HP9S2vGvahn5RTqPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j2xBv5nd1dsW5u3B3QD8JDV+QS6aFKPZ5v/6HV6Co7CE1G1AOqy3rBjQ9kp96SF5aRuXAlJ+EGcuXMgbe5K9HNljwgDWX6ylHj3wjXxk7fXwLAh89kVxQEnFLV56ba0z0u4KvFamJxOUdp6/PLo3aCsWneCEKilePI/sXV60OBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzckHyvIRCp34ZPTQDh0jmdCitW8VnAVAYgn6H0UI1LlDieUSHqucAHQSya6V5s3i1MMGFhoDxHJ8D/Xpl0tWwxZ49SeD0RtcILFMejk681aR/OEMc0fQk/n99aabWJeOy+/ZMMDZJYDep7B4GAlb8Ox+EgVVCHbQTrwRlyGHYNo4SV3hbUFCz6bNaCCeaRadRXAJ0XjXWyyAcbEeqUG2kLNim9a+Q/ZE4ZN5mBqyE87fH+HTs9dXsNE3sxi/bu4yknh0jE3F8+wyZHwvQcNkoVNB6Dmji2Aee22ruBxtuDRaYA5TWxpILYu1P6wyIgfbVqCtPmcRrJ5s05p0tr2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOrdiMNoaVOT5Aaegu6cyFikOmdJbGmwKoSIhj2HefU=;
 b=jJrxvH7WLcs+Hzq1lDvFfIeRECAtncXs5cg64j0RJQeg8lUVXC/jHhaKpZAtvhOdTqslhcpQIL4VyKJGu921S/5yspcNKFk8wrvOz9G1gpUBk102qnj9AofYoV/XcGz9DtEhZlPg15/bDqGs9tDEUO9e2QMup16pQ9UfxRsWjGVRdpzRfpB25p/nTyzURN9Peae3S6rvjmNvanl+dTjSK9nGp/EAaWkkyoWs7OxloL9K3I1WxXUCMNBPzAKN/0HQhiRe2BXosW9bayu0QDUhPkhhz6SdVAngBd3yjD0IlyT36IovyvSSk6YyugSe3ea40QN3QRGAZG7nfuV0iD/FIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102) by
 ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn (10.2.1.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.12; Thu, 3 Sep 2026 13:35:27 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Thu, 3 Sep 2026 13:35:27 +0000
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
Subject: [PATCH v1 2/6] peci: controller: Add StarFive JHB100 PECI driver
Date: Thu,  3 Sep 2026 06:34:04 -0700
Message-Id: <20260903133408.110847-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::29) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1201:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fcfd89b-c7c6-4d36-5248-08df09c032fa
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|52116014|376014|22082099003|38350700014|6133799003|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	e3moMX4j6yXpZtVXahPuGGmzCZTUL2GVFuiVnyyXOOf8n59pbS1BGF9Ap3mt7Jk3biUBXDFgCzC1rQ68ZSVAlfkvPZV3DlylRHc9FkKemCGtblSn04S6l/rk/LORUYs1/DXJ7/HA9dPfHnFJxMCXKD0rJSUuq2OzeU2K4jxiFQf6YxCY5mf/hNLZYlG2eVVlEnwq1iNkEFktcT/77dqEOOsWRtyizo1NFU8sgOC9V+U91JdSdvjqCpPHcaIUTqek2qOx0eCB9dxR7GZ25vDmAsalsfZv/EMkxp/duS24OcmIOEJap7oPaxW3blWaSXldcWCqI+5Hnmb5vVF8O+akzGkhExo5d5ukdo4I8BnhspPS3Smm1YsJ4O4GIVUlanZMHsOeB4i9GLxtJZ5LPc2/jvdMVo9tWybm1r72H0FyYobGywTh3pD214GeSuBcKmaXqsCaUiatve4qVM6PY93EcVTAMz4PNV+ig1f6lKCPNM0HlCw4wqDc78uJ85zzV3rwJXxV+g1yUiCWFMGkd56pIEvHr4CHWJoaW03dZzrRoN6ahIbMyQmK42juTuvNcGll
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(52116014)(376014)(22082099003)(38350700014)(6133799003)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wcMHqGc4ztxFwtdJAQy25yMHCGFp8f+eQ7zZGJooBT/9z6O6CLRCFd7YnGfT?=
 =?us-ascii?Q?vwV0ilpyRyv0BhaP7pckpG9vVEW2QzsmJfL6VCxPWEoDNnSOmp2hO+c4KIYx?=
 =?us-ascii?Q?wihlAwCtgmbQV8SlsfpatPY4dtw+Xa9EIm4XOwvICR088NKaKThHxJNpIe4N?=
 =?us-ascii?Q?ZGjEaFrNJnFfOLKPLIFj0i0OblJmhvm+8PdTaX0jOMHhN3QQC9f+AgjJITjn?=
 =?us-ascii?Q?+lLmgrDzuMzmtO0uRwoCIHRkNeIOefeuJ4XQgG9JYvj3w4Tqbl+8EM6Y3jlh?=
 =?us-ascii?Q?xSvvmeE7bb8KuGa2/mJ9pqiogPF28EWMeHQJwApWxKWCcqT5ybvDImS62i37?=
 =?us-ascii?Q?qP0w0wQXHkZoOIxExNXDuJ6RpUeMxxvGIFZtOrP3oTMojN21wmLsMCWiccOC?=
 =?us-ascii?Q?XV/NJaey4ATciYqcikmhOQHWSSQnvehE2pEYAyW9LBWrHotzcFyJTYGWDfF4?=
 =?us-ascii?Q?AWipsUgB8kzOytwKChq15PM5FPt6mzyE9WpoOf6JGqeudz1SHIawctDNKKMz?=
 =?us-ascii?Q?UQ+P4ucWyvzb23LCDL1YHLki0dztTy0s+lX6Yu0Dn7g38vm0rL4bX2ekvP70?=
 =?us-ascii?Q?ULICghHEbaEl6XAU/88f6GphKBVw6WpJUbRvtHm6fHyiMjdaD8f5unSQJkOM?=
 =?us-ascii?Q?8pYG4wkNlBC42ezja0OJg1dEKlDsh1qOOYOPVUxpUXRnlhJx50Z3aLR7HyWr?=
 =?us-ascii?Q?qViDaA6VaFQ+s3bgCAPWI9x7Ems4Ier5bGqLhPVPMfK39pp3nk1VWZ14Aw39?=
 =?us-ascii?Q?a9NBOutAMdLeyEE7XvyqCoMaUOP459iFyKW7vkhqyDquQOd7rR25yevXu1j+?=
 =?us-ascii?Q?Ew3pJKARyvCKJuIDoqYeIg3swe4D4lmLR8/4+lVvBtTaViN3cRL5Ws3JI4zO?=
 =?us-ascii?Q?cx1Ff/OurZ+EEhOJ+nr7+G8Xbilu4/CSx+KCDVsBW8edp/CratGV4ZXbIf0f?=
 =?us-ascii?Q?Rsz0iA8e+KwqlwckSw7TlEBM230rWcXpW3oztkGhA4FZAvgqfP+7lVw+8FGR?=
 =?us-ascii?Q?8atFPRTu5RawXO3Fo9lt8oeWoSqCbGjxOzQ2Bj8T8y6/aJpX1CM64Zouyc70?=
 =?us-ascii?Q?UxE4drWP3/jLQn+KZsq02YIwt/quaURa5O2fD5elQY04BPnSBmGQqRau/wSV?=
 =?us-ascii?Q?MCi58JqwmVU6RU/3K8h/PMbsbsOy/alZNEnGTLXpJZY+jbui3O6/PCNDIVaz?=
 =?us-ascii?Q?7RqRxsAEVkXulW6t/lXf/heCVSovVkpSCnSAV62ub9AgQgbIQHV0j08saffR?=
 =?us-ascii?Q?c2hFxUh6M03tNhloF7h6VdVpAluW0MFQqT6MkZguroWmqDZvZuok2W4un0dL?=
 =?us-ascii?Q?8+eYu8MDyjue8qIUpra5ivHb7R1GISUkKycB733G5LjSByIi9/Co/J9EMI57?=
 =?us-ascii?Q?EQKZ7tfsY7IyjX6zE+9/Nv5al+lMEdA7z/UrZOh3NxhJeevY5ZsWp+TWu2f5?=
 =?us-ascii?Q?1TyPvXfXOEc9p5ZB2o/bzPDfusmy28h6BlCQ9egDpDMwLd3Do/1ysYdZ+1Vg?=
 =?us-ascii?Q?HoPmj/KwJIahz6kQbAZNugIJpG+UQ6GI7EpzTM+2B8pqepQ4vH4WlKqgSiQd?=
 =?us-ascii?Q?oG8NR/R7IWVD2M7OaUkFcqgpIlRj5ZiSrpDst1b5lscIWJkFCnBmL5m9tNBn?=
 =?us-ascii?Q?WEEK8ai7znelz8ZgCLC54Ypkj79p0FmzkMy1yB+iJfcM396hfSK72h8BDqZM?=
 =?us-ascii?Q?ktcM/gVMcpnoyjnH6Y2DXtk9HSg/QnXe329wDTL/6KBQx+FxHA7eovKpKwql?=
 =?us-ascii?Q?B4UsiJAvRGPLiHpoIKQtE2esz7yu2GmRq8KE5sNAsktWet5U4Q2E?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcfd89b-c7c6-4d36-5248-08df09c032fa
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 13:35:27.4171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBGV5clkzLP6PgrGooxnijioPVgQQUFajAFwcALb55P/n9bTtAPKKLjp5/pA0kwAk/Ik6tTVOWkIat5Zo2Txngnj3+31WUrmRujc6fZHTfiD5rtUmVwfvkAhFY0WyDmu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201

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
 drivers/peci/controller/Kconfig         |  17 +
 drivers/peci/controller/Makefile        |   1 +
 drivers/peci/controller/peci-starfive.c | 405 ++++++++++++++++++++++++
 4 files changed, 431 insertions(+)
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
index 000000000000..54a87ebae009
--- /dev/null
+++ b/drivers/peci/controller/peci-starfive.c
@@ -0,0 +1,405 @@
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
+/*
+ * All PECI write commands (WrPkgConfig 0xa5, WrPCIConfigLocal 0xe5,
+ * WrEndPointConfig 0xc5, ...) share the same low nibble, which is what the
+ * controller uses to decide whether the assured-write FCS has to be appended.
+ */
+#define STARFIVE_PECI_CMD_WRITE_NIBBLE		0x5
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
+	if (req->tx.len) {
+		/*
+		 * req->tx.buf[0] always store the command code.
+		 * Use command code set different configuration.
+		 */
+		u8 cmd_nibble = FIELD_GET(GENMASK(3, 0), req->tx.buf[0]);
+
+		if (cmd_nibble == STARFIVE_PECI_CMD_WRITE_NIBBLE) {
+			/*
+			 * This indicates current command code is write.
+			 * Only write command should enable has_awfcs.
+			 */
+			regmap_write_bits(priv->regmap, STARFIVE_PECI_CTRL,
+					  STARFIVE_PECI_CTRL_AW_FCS_EN,
+					  STARFIVE_PECI_CTRL_AW_FCS_EN);
+		} else {
+			/* Ensure other command code disable has_awfcs. */
+			regmap_write_bits(priv->regmap, STARFIVE_PECI_CTRL,
+					  STARFIVE_PECI_CTRL_AW_FCS_EN, 0);
+		}
+	} else {
+		/* Ping command code also need to disable has_awfcs. */
+		regmap_write_bits(priv->regmap, STARFIVE_PECI_CTRL,
+				  STARFIVE_PECI_CTRL_AW_FCS_EN, 0);
+	}
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

