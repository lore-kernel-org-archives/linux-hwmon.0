Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82139C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Feb 2022 15:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236330AbiBIPxc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Feb 2022 10:53:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236315AbiBIPxb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Feb 2022 10:53:31 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2093.outbound.protection.outlook.com [40.107.20.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42FB0C0613CA
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Feb 2022 07:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4pzylMea5HUV9CIikiyNKpnlX4RbSURcT2nVHpCUdqTejaP6QU4XM4TyBlz8D9Sfy9cno0BjdPDBWQTeI7IPs7cM2xSlmdIjzJnG3YxgeRXQO2B+/tBYv3m8C33+aE/7TkW7FIxwlZvicrUTgXaybckYrEPET2zm1KakhEInEJgU4VDFkgruyDWt0Kx2GDn7LyZNzoCuCqqq5mNQPPsuqBWWDOoCro/uCgtjJFmcxHtqK7iXMQ4Kn2b0DwBiIP7vm3AIvTRCmuejNqCdvzR4+1leAusq6f2K4D6kRlm9mVneN22QafjTMBMLWxdXfXtRxRdai8cmuZslFK5AfeReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+Sdx4tasYslTOAmre7bpmhV7F9tBDO1+GY7Z+o3S+0=;
 b=FlrqhjOTLQP/PQWmfvdZ3WNAMNd0s7BkB0h6cKPe8kIIRiVwDt+BsDimhHiMMTDH4/VOOASpZUdk2f/d5eRh7SQPDbn6k1Gk4xJ0kauQn9kC5XVUt8UKT3q74nu9AI4rBiSHF0w2AZw3LeSfXllKjTf8a3/0JrFRuJrX4wEll0eS6VuxIC+velggwhcQ7+86Cbun4YMVUcI9EXDdyMkSkZGV2tvtQf1+HKTroicxbjEGqFAjr7TZO3UxzszxuwjO5ntUYyBqqoEILPBW8j2M0grPNbGrCbo4Cc4hv9Abr3+6ouLWL+6FkvLW7HF8w1aWJe7TEYrCIl8/Yb5b2RnWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+Sdx4tasYslTOAmre7bpmhV7F9tBDO1+GY7Z+o3S+0=;
 b=DDs8UBv3cHwgGuZlb6Ej9OFACC1d4aK/iqfzjsOwpHuRq6RGxiLcfCU9e4YkPaoWAHphUgU8a1gr29zKJUezbxSj1ZfN/6U8Gu9s/RbQjj4oOsbrtSFp/yUrVCwqspNGcz6Nn7b+cWtblZRY+yvG4M+sKLwv9PzPXU81gZH4Hz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PR3PR07MB6921.eurprd07.prod.outlook.com (2603:10a6:102:7b::22)
 by AS8PR07MB7205.eurprd07.prod.outlook.com (2603:10a6:20b:254::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.9; Wed, 9 Feb
 2022 15:53:31 +0000
Received: from PR3PR07MB6921.eurprd07.prod.outlook.com
 ([fe80::450a:62a8:8912:daab]) by PR3PR07MB6921.eurprd07.prod.outlook.com
 ([fe80::450a:62a8:8912:daab%4]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 15:53:31 +0000
From:   Agathe Porte <agathe.porte@nokia.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Agathe Porte <agathe.porte@nokia.com>
Subject: [PATCH v2 2/2] hwmon: Add driver for Texas Instruments TMP464 sensor chip
Date:   Wed,  9 Feb 2022 16:53:08 +0100
Message-Id: <20220209155308.88938-2-agathe.porte@nokia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209155308.88938-1-agathe.porte@nokia.com>
References: <20220209133617.67297-1-agathe.porte@nokia.com>
 <20220209155308.88938-1-agathe.porte@nokia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P251CA0019.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::33) To PR3PR07MB6921.eurprd07.prod.outlook.com
 (2603:10a6:102:7b::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 594d9fb8-5b14-4fc7-f0af-08d9ebe45265
X-MS-TrafficTypeDiagnostic: AS8PR07MB7205:EE_
X-Microsoft-Antispam-PRVS: <AS8PR07MB720562315AE8A8F4CCC2D21A9B2E9@AS8PR07MB7205.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GG5jW2wnQQLONbt1EQQkaipGa6i7OIAmvBoE6wREuolDS5yCT5lZi8jv2sXLNJR7OsJpOfmDMenhBOiAITTBFwjh6M5YWZ58foUBhq5dj1fAQ+1KEp7aayZNfj8JKztSUYxo+UeDNWUVztjMtF39RiolHtHgWGqWFd8UJD117JkWek0nyczL5hn2dE5Wbvrz7vIV9lR9ettkkZOKBWQdNByubP3W9ZnzEowD3p/ZBUN7N5pvUS1D1/n+dWqda8UX6yxlG0bFetZoT2gbuDF5RTB4P/5mpGLt9rFCNu9cINpxkErXwKQ00V5CxNt9nXlERvjiDZh50efg3rBpYGKbpUJKNM3liVwX3duX4eaNZg+9kAFYYizbk2fhQAWehLkZZMCrqCE66T+EzwICEnDuNT/0HpVrJOo9bSG4SleFGpfDplrSNPsRjzZtXLgTlRKCkPLu4Af1bo2JCrqWfqDi+0I/EvpaEMDjDb06qgAq7F84TzWSQt1JEtcLy8Xy32YdweBsXdnOFZE3Qo4nOqcJnb9HVSAjLaTx0Xe5+vhWrLF4H5NfKFPWD0GIs8el64mbLOL/g91SAJN/SF4kCjve2pv54basK0DR5rRkzGSIi1yeIJ9Emu1a5DRhSHpUTtp8oQKNwN+kokVHdlJOBMLrOihZHr5qgEt2FjdlLesEF7cIEO8RM2r+DqYaVhUUCnaPY/6E0P4esNARWiAzKk3xA8hjQEShvujPooz6ph0Zpax0rOgu76H83SjkG+baJyz2VPAkOYnekybMMYRYqmoc9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6921.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(86362001)(26005)(44832011)(1076003)(2616005)(107886003)(30864003)(83380400001)(36756003)(5660300002)(8936002)(6666004)(6506007)(6512007)(66946007)(66556008)(66476007)(508600001)(6916009)(2906002)(54906003)(316002)(4326008)(38100700002)(6486002)(966005)(8676002)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qyv4+XB1+zLidKr+glnqjDXbebUeLuzECUGQtVxQLursiANpG2urp7/AIVwa?=
 =?us-ascii?Q?NXm5FN5uCooG7JKgCTx/5A7iSUaZe1F6w9vgfBtcR3aoVUgpJ271eeazeLPz?=
 =?us-ascii?Q?/zwzH0iSUJOBEj1hcQa+UUxuntyY2B2CDRAqyA4Cz46BFjQ8e+3OlK8PfM0j?=
 =?us-ascii?Q?3ZvX7vxod4RtIzyZj/3yZ4dKRt7VQgVc82M6VeMavR1R/lkhFPNRggxHUu0c?=
 =?us-ascii?Q?hX05eRYv7nwHtkL+sIxliTMuCuk5BC4UKAEETvie7wGz7FI51GKIjnNZIeYE?=
 =?us-ascii?Q?FMmP3J3UtKYDExdpTRVgZ2f4DOzD24nxS0lxdPkNhJq+zCfK6aosZxN9XDz/?=
 =?us-ascii?Q?UjUAXPdePhm4zz4KUZlCb9jbkh7+6ntBqtAtNoRUNqxtGlKBbfZn5FAz1ygJ?=
 =?us-ascii?Q?2vunXTwVC1HxtzrNJ/Knlhh5VdPPQZ11OM/0VqjQGTUbBfvdOqWGxOIrvvGE?=
 =?us-ascii?Q?jlTHOweo3G8Pft7fJGSx50y6aXD2fJ5iMjm3B5GZUE1ERGK3QaIkzJOlngbU?=
 =?us-ascii?Q?dyShexB5GP4vIMhsHl50cFPhNSU2Ap7ZQLTcOUQ66aUNJc7n+gi2C5IJMm1T?=
 =?us-ascii?Q?pj7HWBKMmOeSCyOkoyBMkkbfLcq9a2yci2bGolJCB9JXnBc/215NSSoOtrwr?=
 =?us-ascii?Q?D35YkpA4rY0mI3ximpociaagtnJCUWQHY2p9v3TEstfu3d8wc54zzYPExO5j?=
 =?us-ascii?Q?fr0+FEMBG3HoWZFqQBGcF9QSQIibpey5pRiuJancDWDqTN4vJuKoPJ8AWNYn?=
 =?us-ascii?Q?H5sXj96odNpDY49O0MbwsarblnbX9RXH73uhZeTp4sxVJgbgYSk+esj298ze?=
 =?us-ascii?Q?0+j1NsJtXMCWPAR2apj9Oy9id/NiI4MaCvcaig20m7vZmIPm7zd1KRiSONfH?=
 =?us-ascii?Q?hGMk14Ay8IKKe9WnGFg7C9elWD14HSMItHweDCfQrEEFzcNVaLXn0DvPczq0?=
 =?us-ascii?Q?22hf54CW9/AYOyh7F7rgQ5rkqb32Z9fbn4cJh5TLprWkxfJ5yrBW1h9EBtcx?=
 =?us-ascii?Q?Chrd4M/XV+vzTWQAn2fQSjgTZdTkL+TkyNWCb1dEzH+4GLgiv976pKQhRD1A?=
 =?us-ascii?Q?waOmoC4WMc7vD3bPTLGmms3mbc+orGolFwNod2oC7D2UyhXhxZMEIJMiON50?=
 =?us-ascii?Q?3TCxZKxklgSowTn2wa7fYeeps9JmJDGJo1sVa639PsA/99zjDas2xhZ/YPrD?=
 =?us-ascii?Q?vOiicVuy39+B2FQoPoAunP2fj+z7oMmxFcGDY72PdKYEAIeDvPitwEmTTWya?=
 =?us-ascii?Q?vhqQ/zdyrXP+MJM5Aql5eVHwnOmvtYlweh7qRPQNqN6CwtC6iMUCHcc4cEks?=
 =?us-ascii?Q?QEc/NLlAYBryKyXn05jhw0b1fRO4JE8oX3dvqb30x8qaL+gN2vAmpKXsAork?=
 =?us-ascii?Q?bQcO2VnlGeH6k5vnpHlxSo4MREHORfEpC+0isyvY8gI6jMrHZqNHodgW9pwG?=
 =?us-ascii?Q?VZVtcCQu6RVg59gS9ppgEu6vPhq5tdAZcXN4ECL4H1G1ckIAkL39HFYVSLEh?=
 =?us-ascii?Q?ae8K6j+YKYUyZj8i1QLEDB05dN28Pzh8kr1HBpNRJjBT7IHRmlF1v+vsF4de?=
 =?us-ascii?Q?dDUEkBQ0p6PNJu38L+loI55hEj0F+KL1CHVtSqPuBDytuM5PKjskrYReXQkV?=
 =?us-ascii?Q?UOkfZV6nQueFRsF8ojAuX6Q=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594d9fb8-5b14-4fc7-f0af-08d9ebe45265
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6921.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 15:53:31.8056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXqVXWwSlN47K4voN3ouOwDzKhRyyi3deS+rb1q/9r8TbzpX7UOk6IrOguoLrGv9zxUIDfwReEYY3/r5bfBUNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7205
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for Texas Instruments TMP464 temperature sensor IC.

TI's TMP464 is an I2C temperature sensor chip. This chip is
similar to TI's TMP421 chip, but with 16bit-wide registers (instead
of 8bit-wide registers). The chip have one local sensor and four
remote sensors.

Signed-off-by: Agathe Porte <agathe.porte@nokia.com>
Acked-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/tmp464.rst |  43 ++++
 MAINTAINERS                    |   2 +
 drivers/hwmon/Kconfig          |  10 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/tmp464.c         | 447 +++++++++++++++++++++++++++++++++
 6 files changed, 504 insertions(+)
 create mode 100644 Documentation/hwmon/tmp464.rst
 create mode 100644 drivers/hwmon/tmp464.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index df20022c741f..37590db85e65 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -193,6 +193,7 @@ Hardware Monitoring Kernel Drivers
    tmp108
    tmp401
    tmp421
+   tmp464
    tmp513
    tps23861
    tps40422
diff --git a/Documentation/hwmon/tmp464.rst b/Documentation/hwmon/tmp464.rst
new file mode 100644
index 000000000000..8990554194de
--- /dev/null
+++ b/Documentation/hwmon/tmp464.rst
@@ -0,0 +1,43 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver tmp421
+====================
+
+Supported chips:
+
+  * Texas Instruments TMP464
+
+    Prefix: 'tmp464'
+
+    Addresses scanned: I2C 0x48, 0x49, 0x4a and 0x4b
+
+    Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp464.html
+
+Authors:
+
+	Agathe Porte <agathe.porte@nokia.com>
+
+Description
+-----------
+
+This driver implements support for Texas Instruments TMP464
+temperature sensor chip. This chip implement one local four remote
+sensors. Temperature is measured in degrees Celsius. The chips are
+wired over I2C/SMBus and specified over a temperature range of -40 to
++125 degrees Celsius. Resolution for both the local and remote
+channels is 0.0625 degree C.
+
+The chips support only temperature measurement. The driver exports
+the temperature values via the following sysfs files:
+
+**temp[1-5]_input**
+
+Each sensor can be individually disabled via Devicetree or from sysfs
+via:
+
+**temp[1-5]_enable**
+
+If labels were specified in Devicetree, additional sysfs files will
+be present:
+
+**temp[1-5]_label**
diff --git a/MAINTAINERS b/MAINTAINERS
index 136cd34be715..7fa2796adbef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19462,6 +19462,8 @@ M:	Agathe Porte <agathe.porte@nokia.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
+F:	Documentation/hwmon/tmp464.rst
+F:	drivers/hwmon/tmp464.c

 TMP513 HARDWARE MONITOR DRIVER
 M:	Eric Tremblay <etremblay@distech-controls.com>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8df25f1079ba..52b4f5688b45 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1979,6 +1979,16 @@ config SENSORS_TMP421
 	  This driver can also be built as a module. If so, the module
 	  will be called tmp421.

+config SENSORS_TMP464
+	tristate "Texas Instruments TMP464 and compatible"
+	depends on I2C
+	help
+	  If you say yes here you get support for Texas Instruments TMP464
+	  temperature sensor chip.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called tmp464.
+
 config SENSORS_TMP513
 	tristate "Texas Instruments TMP513 and compatibles"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 185f946d698b..a1f2d6686227 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -194,6 +194,7 @@ obj-$(CONFIG_SENSORS_TMP103)	+= tmp103.o
 obj-$(CONFIG_SENSORS_TMP108)	+= tmp108.o
 obj-$(CONFIG_SENSORS_TMP401)	+= tmp401.o
 obj-$(CONFIG_SENSORS_TMP421)	+= tmp421.o
+obj-$(CONFIG_SENSORS_TMP464)	+= tmp464.o
 obj-$(CONFIG_SENSORS_TMP513)	+= tmp513.o
 obj-$(CONFIG_SENSORS_VEXPRESS)	+= vexpress-hwmon.o
 obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+= via-cputemp.o
diff --git a/drivers/hwmon/tmp464.c b/drivers/hwmon/tmp464.c
new file mode 100644
index 000000000000..564090929ad4
--- /dev/null
+++ b/drivers/hwmon/tmp464.c
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/* Driver for the Texas Instruments TMP464 SMBus temperature sensor IC.
+ * Supported models: TMP464
+
+ * Copyright (C) 2022 Agathe Porte <agathe.porte@nokia.com>
+ * Preliminary support by:
+ * Lionel Pouliquen <lionel.lp.pouliquen@nokia.com>
+ */
+
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+/* Addresses to scan */
+static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, I2C_CLIENT_END };
+
+enum chips { tmp464 };
+
+#define MAX_CHANNELS				5 /* chan 0 is internal, 1-4 are remote */
+
+/* TMP464 registers */
+static const u8 TMP464_TEMP[MAX_CHANNELS] = { 0x00, 0x01, 0x02, 0x03, 0x04 };
+static const u8 TMP464_THERM_LIMIT[MAX_CHANNELS] = { 0x39, 0x42, 0x4A, 0x52, 0x5A };
+static const u8 TMP464_THERM2_LIMIT[MAX_CHANNELS] = { 0x3A, 0x43, 0x4B, 0x53, 0x5B };
+static const u8 TMP464_OFFSET_REMOTE[MAX_CHANNELS] = { 0x40, 0x48, 0x50, 0x58 };
+#define TMP464_N_FACTOR_REG_1			0x41
+#define TMP464_CONFIG_REG			0x30
+
+/* Identification */
+#define TMP464_MANUFACTURER_ID_REG		0xFE
+#define TMP464_DEVICE_ID_REG			0xFF
+
+/* Flags */
+#define TMP464_CONFIG_SHUTDOWN			BIT(5)
+#define TMP464_CONFIG_RANGE			0x04
+#define TMP464_CONFIG_REG_REN(x)		(BIT(7 + (x)))
+#define TMP464_CONFIG_REG_REN_MASK		GENMASK(11, 7)
+#define TMP464_CONFIG_CONVERSION_RATE_B0	2
+#define TMP464_CONFIG_CONVERSION_RATE_MASK      GENMASK(TMP464_CONFIG_CONVERSION_RATE_B0, \
+							TMP464_CONFIG_CONVERSION_RATE_B0 + 2)
+
+/* Manufacturer / Device ID's */
+#define TMP464_MANUFACTURER_ID			0x5449
+#define TMP464_DEVICE_ID			0x1468
+
+static const struct i2c_device_id tmp464_id[] = {
+	{ "tmp464", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tmp464_id);
+
+static const struct of_device_id __maybe_unused tmp464_of_match[] = {
+	{
+		.compatible = "ti,tmp464",
+		.data = (void *)5
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, tmp464_of_match);
+
+struct tmp464_channel {
+	const char *label;
+	bool enabled;
+	s16 temp;
+};
+
+struct tmp464_data {
+	struct i2c_client *client;
+	struct mutex update_lock; /* used to update the struct values */
+	u32 temp_config[MAX_CHANNELS + 1];
+	struct hwmon_channel_info temp_info;
+	const struct hwmon_channel_info *info[2];
+	struct hwmon_chip_info chip;
+	bool valid;
+	unsigned long last_updated;
+	unsigned long channels;
+	u16 config;
+	struct tmp464_channel channel[MAX_CHANNELS];
+};
+
+static int temp_from_raw(s16 reg)
+{
+	return DIV_ROUND_CLOSEST((reg >> 3) * 625, 10);
+}
+
+static int tmp464_update_device(struct tmp464_data *data)
+{
+	struct i2c_client *client = data->client;
+	int ret = 0;
+	int i;
+
+	mutex_lock(&data->update_lock);
+
+	if (time_after(jiffies, data->last_updated + (HZ / 2)) ||
+	    !data->valid) {
+		ret = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
+		if (ret < 0)
+			goto exit;
+		data->config = ret;
+
+		for (i = 0; i < data->channels; i++) {
+			ret = i2c_smbus_read_word_swapped(client, TMP464_TEMP[i]);
+			if (ret < 0)
+				goto exit;
+			data->channel[i].temp = ret;
+		}
+		data->last_updated = jiffies;
+		data->valid = true;
+	}
+
+exit:
+	mutex_unlock(&data->update_lock);
+
+	if (ret < 0) {
+		data->valid = false;
+		return ret;
+	}
+
+	return 0;
+}
+
+static int tmp464_enable_channels(struct tmp464_data *data)
+{
+	int err;
+	struct i2c_client *client = data->client;
+	struct device *dev = &client->dev;
+	int old = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
+	int new, i;
+
+	if (old < 0) {
+		dev_err(dev, "error reading register, can't disable channels\n");
+		return old;
+	}
+
+	new = old & ~TMP464_CONFIG_REG_REN_MASK;
+	for (i = 0; i < data->channels; i++)
+		if (data->channel[i].enabled)
+			new |= TMP464_CONFIG_REG_REN(i);
+
+	if (new == old)
+		return 0;
+
+	err = i2c_smbus_write_word_data(client, TMP464_CONFIG_REG, new);
+	if (err < 0)
+		dev_err(dev, "error writing register, can't disable channels\n");
+
+	return err;
+}
+
+static int tmp464_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	struct tmp464_data *tmp464 = dev_get_drvdata(dev);
+	int ret = 0;
+
+	ret = tmp464_update_device(tmp464);
+	if (ret)
+		return ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		if (!tmp464->channel[channel].enabled)
+			return -ENODATA;
+		*val = temp_from_raw(tmp464->channel[channel].temp);
+		return 0;
+	case hwmon_temp_enable:
+		*val = tmp464->channel[channel].enabled;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int tmp464_read_string(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, const char **str)
+{
+	struct tmp464_data *data = dev_get_drvdata(dev);
+
+	*str = data->channel[channel].label;
+
+	return 0;
+}
+
+static int tmp464_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	struct tmp464_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_enable:
+		data->channel[channel].enabled = val;
+		ret = tmp464_enable_channels(data);
+		break;
+	default:
+	    ret = -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+static umode_t tmp464_is_visible(const void *data, enum hwmon_sensor_types type,
+				 u32 attr, int channel)
+{
+	switch (attr) {
+	case hwmon_temp_input:
+		return 0444;
+	case hwmon_temp_label:
+		return 0444;
+	case hwmon_temp_enable:
+		return 0644;
+	default:
+		return 0;
+	}
+}
+
+static int tmp464_init_client(struct tmp464_data *data)
+{
+	int err;
+	int config, config_orig;
+	struct i2c_client *client = data->client;
+
+	config = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
+	if (config < 0) {
+		dev_err(&client->dev,
+			"Could not read configuration register (%d)\n", config);
+		return config;
+	}
+
+	/* Set the conversion rate to 2 Hz */
+	config_orig = config;
+	config &= ~TMP464_CONFIG_CONVERSION_RATE_MASK;
+	config |= (0x05) << TMP464_CONFIG_CONVERSION_RATE_B0;
+
+	/* Start conversions (disable shutdown if necessary) */
+	config_orig = config;
+	config &= ~TMP464_CONFIG_SHUTDOWN;
+
+	if (config != config_orig) {
+		config = i2c_smbus_write_word_data(client, TMP464_CONFIG_REG, config);
+		if (config < 0) {
+			dev_err(&client->dev,
+				"Could not write configuration register (%d)\n", err);
+			return config;
+		}
+	}
+
+	return tmp464_enable_channels(data);
+}
+
+static int tmp464_detect(struct i2c_client *client,
+			 struct i2c_board_info *info)
+{
+	enum chips kind;
+	struct i2c_adapter *adapter = client->adapter;
+	static const char * const names[] = {
+		"TMP464"
+	};
+	int reg;
+
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
+		return -ENODEV;
+
+	reg = i2c_smbus_read_word_swapped(client, TMP464_MANUFACTURER_ID_REG);
+	if (reg < 0)
+		return reg;
+	if (reg != TMP464_MANUFACTURER_ID)
+		return -ENODEV;
+
+	/* Check for "always return zero" bits */
+	reg = i2c_smbus_read_word_swapped(client, TMP464_REG_THERM_STATUS);
+	if (reg < 0)
+		return reg;
+	if (reg & 0x1f)
+		return -ENODEV;
+	reg = i2c_smbus_read_word_swapped(client, TMP464_REG_THERM2_STATUS);
+	if (reg < 0)
+		return reg;
+	if (reg & 0x1f)
+		return -ENODEV;
+
+	reg = i2c_smbus_read_word_swapped(client, TMP464_DEVICE_ID_REG);
+	if (reg < 0)
+		return reg;
+	switch (reg) {
+	case TMP464_DEVICE_ID:
+		kind = tmp464;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	strscpy(info->type, tmp464_id[kind].name, I2C_NAME_SIZE);
+	dev_info(&adapter->dev, "Detected TI %s chip at 0x%02x\n",
+		 names[kind], client->addr);
+
+	return 0;
+}
+
+static int tmp464_probe_child_from_dt(struct i2c_client *client,
+				      struct device_node *child,
+				      struct tmp464_data *data)
+
+{
+	struct device *dev = &client->dev;
+	u32 i;
+	s32 val;
+	int err;
+
+	err = of_property_read_u32(child, "reg", &i);
+	if (err) {
+		dev_err(dev, "missing reg property of %pOFn\n", child);
+		return err;
+	}
+
+	if (i >= data->channels) {
+		dev_err(dev, "invalid reg %d of %pOFn\n", i, child);
+		return -EINVAL;
+	}
+
+	of_property_read_string(child, "label", &data->channel[i].label);
+	if (data->channel[i].label)
+		data->temp_config[i] |= HWMON_T_LABEL;
+
+	data->channel[i].enabled = of_device_is_available(child);
+
+	err = of_property_read_s32(child, "ti,n-factor", &val);
+	if (!err) {
+		if (i == 0) {
+			dev_err(dev, "n-factor can't be set for internal channel\n");
+			return -EINVAL;
+		}
+
+		if (val > 127 || val < -128) {
+			dev_err(dev, "n-factor for channel %d invalid (%d)\n",
+				i, val);
+			return -EINVAL;
+		}
+		err = i2c_smbus_write_word_data(client, TMP464_N_FACTOR_REG_1 + i - 1, val);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+static int tmp464_probe_from_dt(struct i2c_client *client, struct tmp464_data *data)
+{
+	struct device *dev = &client->dev;
+	const struct device_node *np = dev->of_node;
+	struct device_node *child;
+	int err;
+
+	for_each_child_of_node(np, child) {
+		if (strcmp(child->name, "channel"))
+			continue;
+
+		err = tmp464_probe_child_from_dt(client, child, data);
+		if (err) {
+			of_node_put(child);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static const struct hwmon_ops tmp464_ops = {
+	.is_visible = tmp464_is_visible,
+	.read = tmp464_read,
+	.read_string = tmp464_read_string,
+	.write = tmp464_write,
+};
+
+static int tmp464_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct tmp464_data *data;
+	int i, err;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
+		dev_err(&client->dev, "i2c functionality check failed\n");
+		return -ENODEV;
+	}
+	data = devm_kzalloc(dev, sizeof(struct tmp464_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	mutex_init(&data->update_lock);
+	if (client->dev.of_node)
+		data->channels = (unsigned long)of_device_get_match_data(&client->dev);
+	else
+		data->channels = i2c_match_id(tmp464_id, client)->driver_data;
+	data->client = client;
+
+	for (i = 0; i < data->channels; i++) {
+		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_ENABLE;
+		data->channel[i].enabled = true;
+	}
+
+	err = tmp464_probe_from_dt(client, data);
+	if (err)
+		return err;
+
+	err = tmp464_init_client(data);
+	if (err)
+		return err;
+
+	data->chip.ops = &tmp464_ops;
+	data->chip.info = data->info;
+
+	data->info[0] = &data->temp_info;
+
+	data->temp_info.type = hwmon_temp;
+	data->temp_info.config = data->temp_config;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data, &data->chip, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static struct i2c_driver tmp464_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name	= "tmp464",
+		.of_match_table = of_match_ptr(tmp464_of_match),
+	},
+	.probe_new = tmp464_probe,
+	.id_table = tmp464_id,
+	.detect = tmp464_detect,
+	.address_list = normal_i2c,
+};
+
+module_i2c_driver(tmp464_driver);
+
+MODULE_AUTHOR("Agathe Porte <agathe.porte@nokia.com>");
+MODULE_DESCRIPTION("Texas Instruments TMP464 temperature sensor driver");
+MODULE_LICENSE("GPL");
--
2.34.1

