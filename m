Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF1EC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Feb 2022 13:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiBINh3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Feb 2022 08:37:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234263AbiBINhZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Feb 2022 08:37:25 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2122.outbound.protection.outlook.com [40.107.20.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441A6C03FEFB
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Feb 2022 05:36:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aU+HcG7dxHaLLYg9lZWXQV8wargFelMha/gW6klnJ/SiEkzL6AR26hAS6n/LyW7Mz86t3npqwbMM/KspDkSm3IM/ISUnxzqzobRQ1l7R5OM2qjP/73wtIkqewe0RcgwqwkrVwpnwxevoVy36XoF3hAfsSw7Z/91mGrR/7PoSR1o3rdteqvg5qKVkDCjrdKkXmTnYgyxxeWl/UogH1smbiavoaSWKU4TMLl9N7AOpNIagOk6aOJi1docbsgEF1iV8xymn9FtXUvCHV8Bgd7iZmSOsQXSZDBVeUhI/XHZScqTA6XbrTqefsrDgGp7Vh0GLfXC7qsYUYBHurkRY84IUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXF/A+e/wfUstQHj3iNBZJMgzweGYa8QvTm6M6s4MkU=;
 b=SKn1K2n13Gf6S9xD2LcfAE+Fdm3j6MeQM91TMelIVZqhRyuJ486N1HJWCY4RODNuSyUMZ2JTmL4xjl1fq2Ky4AXeulUXRzudiK2+x+IVE0jVkfVckZMxqjnw1zVp/XzGfvviWS+/dhA3nFVd69VSpY3QbIECDaggtWOZvDi9WIlSL2MHngXZJKshutYbRcCGoziEgKZWzIfNUtx7OXf88TYFgwJPqvz+KUTDIHSO8fpcep9o7uJgXtVs0clTV5SguyqoxeMJJ8knmlJdlZfbwps8+ugdOLxmy7RPAEo18B7Zs3JcOlh8iB7jEqJ4U2oYqFZFRWULeGuGcvvRuojihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXF/A+e/wfUstQHj3iNBZJMgzweGYa8QvTm6M6s4MkU=;
 b=hJRkNHnbpI3gBEZPY8cpytRPSZ/3uaTa6y8toi6MiLRU0KzIJT4+bPZrZe+LarnpX9meJJI0ezbfyfQPOJ/ebH6fm4pAlTbbJ++B1vy74p+WPCNofPUHCDvLtnbHy1dCHD7dTk3wohK4Jr03P6hQ3l0aEns8haY0DWFoexqSD6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PR3PR07MB6921.eurprd07.prod.outlook.com (2603:10a6:102:7b::22)
 by VI1PR07MB6286.eurprd07.prod.outlook.com (2603:10a6:800:134::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.9; Wed, 9 Feb
 2022 13:36:48 +0000
Received: from PR3PR07MB6921.eurprd07.prod.outlook.com
 ([fe80::450a:62a8:8912:daab]) by PR3PR07MB6921.eurprd07.prod.outlook.com
 ([fe80::450a:62a8:8912:daab%4]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 13:36:48 +0000
From:   Agathe Porte <agathe.porte@nokia.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Agathe Porte <agathe.porte@nokia.com>
Subject: [PATCH 2/2] hwmon: Add driver for Texas Instruments TMP464 sensor chip
Date:   Wed,  9 Feb 2022 14:36:17 +0100
Message-Id: <20220209133617.67297-2-agathe.porte@nokia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209133617.67297-1-agathe.porte@nokia.com>
References: <20220209133617.67297-1-agathe.porte@nokia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0123.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::15) To PR3PR07MB6921.eurprd07.prod.outlook.com
 (2603:10a6:102:7b::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d407d71a-efbc-49e0-4bc4-08d9ebd138d7
X-MS-TrafficTypeDiagnostic: VI1PR07MB6286:EE_
X-Microsoft-Antispam-PRVS: <VI1PR07MB6286997662A2F62FC5AD2ACD9B2E9@VI1PR07MB6286.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CRFauHOYHxD+e722Ps3dSW9pp1RhzFzdzQQ+2ti3ByjC+c4gIaZ1x/+LmH+EATum/X5m444w3fVTIvwiOod818D/SdwNLNsQg0t8pcnUZb1HeNltRUSInAARaBJXdLzys8KrEPFjqOvdRl7NAd0jdLSVSKijs3q3wW0XuQmmfy0WVWLDhDMkzIEy7xLnn3odnosvF+Bp4Zxwnw6RajBcyWxHPpiK92S/q+TpYJ/FqTS4s5fswM8dUuAZekXUM0GqaTD21LMRfbGPIoW0Lz4VKE6spaQghelztJRHctd5fagyZ14rroJCGg8QUqFbtu+8z8BRwVMTROOb9OCZZblFFoRmG8uuR+bnj/iTw37t4imsPVMCialMlw3Z1F7WjlyNAc1zTAsDny7vkniFevD+DcuYeUrDrJzn7GSS5WHstTfAuhi43cCBkWktW026mhCx4BI8FCc3WRYBPMz1QFD/FtWNLGXGFaMzxdSlGh+XtiyMeFZOAQbRP7iF/Zp3WRslo6sAyko/kJUtRWE+nMVr6FrwOaiR8K2/jPib2eR5J8awTJRkbvVCK4NiN0qNybo7GaGkRW2Ze0Qx1DA7gK/10yvBUJKwWehi4g/JCGR7+bOis4Hwv5YyGsW++TqHSPbOTlzzhWcxStSYrdfVTZvzaWSVIpxIAncaltyuuncMC1tJRIULfn4p+U5TjUo7aIu3DRvKDI9A0xn9AdTfm6/HgF1rnLuCeB7EGTToUlwmrGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6921.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(6486002)(966005)(508600001)(83380400001)(6512007)(6506007)(6666004)(38100700002)(86362001)(6916009)(316002)(36756003)(54906003)(66946007)(44832011)(8936002)(5660300002)(66476007)(66556008)(2906002)(82960400001)(4326008)(8676002)(2616005)(1076003)(186003)(107886003)(30864003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?swE82kNj65EhxsH6T17lPc+8lFb/uD5Hlx7eBiv5uB07WJQ88/YFRuEiEbZZ?=
 =?us-ascii?Q?2s0L8DTp0ZkgLMAtYrM6nDV24sFUHzA4NRo29lUtlh0Xj+LCXQuOxztbGRGr?=
 =?us-ascii?Q?wMPo6hlOJ3fyq9gK+dttAZ+1wvNnGU+y6YGv7JT5xCPXT30YNZ/VJH2ZZs+g?=
 =?us-ascii?Q?JpE6fSLgJNJE5HTJNo6VVNN13y7dlR65D2YT+o2rQmcqYwrYWPqjFIsdQ4T+?=
 =?us-ascii?Q?0qDkgaaAyGyYnB9FY5swUvjYZi0j5H/uTeA5FTHetb/mVbFmpF1ebRl4AM49?=
 =?us-ascii?Q?4QB/00VIW//yWSA27fy6XWy6+fVsG5zlM3vtSNlJ646oJz5Tftq9DmGCl42R?=
 =?us-ascii?Q?9V6bQPxHNUphfIxxRo9kgGNZ2s82y5Z4N1Gsl82d8xN3GVVRyHkVRbexLdui?=
 =?us-ascii?Q?WR4uFpUNxrceXupp4JWNbWc8chX8p+ZqV7n4AZ+LT7Au1Wv4u7AH2P4VjsXD?=
 =?us-ascii?Q?q91gpCSat1rmtLtFuV4XP3ryG+bAaGJfc4DCfoRsM2Kjm6d3GQrXcv8l0eaT?=
 =?us-ascii?Q?lMgEBXYrOk6tEUzFFYRQ7gXzp6ic8vPV1uab5LXKmvJDBN9MO5zdF+PS+Kk0?=
 =?us-ascii?Q?Ox07TtZerzuGNjFYeGRFaF9H7phuKI9kK3CCFdVWCknO3baXcOkjBwWuorc6?=
 =?us-ascii?Q?W4nmMlws+NLb1nux21WOY0BOecZg3M7M+YtajNAaXFPYn1ZRtuEkPzlpUEox?=
 =?us-ascii?Q?AceO+T9uExUAPSBZMZQUAXPV5Fj2bjAf8VG0dG8LvY8o1kjwCWkecOGizuWK?=
 =?us-ascii?Q?U/ZsAJIemll+nNwHeJm0ou7OcbR2fwnhCj+Sjm0cSybMnvOfU4wdBGoqRJab?=
 =?us-ascii?Q?F5Fh0piZhwgldDMAFZ52m8jiIIEXt3MoyzDkxKZdxC1w8cfvTA1CeLd24hGW?=
 =?us-ascii?Q?ae8IIXY9AaCCVvzPvU78yMdCfe3YVUARy88p86DA/NGP/CjIDVi94iGuyCKL?=
 =?us-ascii?Q?mCsprcmmleOwmk4d8KPGbSCs0mY8C4ZuJrHrB43xtyHNycUDWWuAA8O79YEI?=
 =?us-ascii?Q?1fHyb0zO+E8EDzU009pmUmXf1PS9ZdeQlSEPx8TrIbwNAwFGvOv+268j84va?=
 =?us-ascii?Q?ZdI1snTQnafVddMDzTx6NG1bLB70OeR2bNYzULJrf+xV7kKU8Wj/XBpxwnst?=
 =?us-ascii?Q?Kjwusr5bFRA9oNP8qbR/4cqUbFpMKu8tWx8rMpTXx1u1As/GnQ4HoUaCH+dV?=
 =?us-ascii?Q?WgOh3JJHpiVoxXQ1rJx/72Y4tehDbuQBPIsgFeMaqEkj++9LWGLe7AIdVO4a?=
 =?us-ascii?Q?D2Ot04n+5az8sj+xhmWYqW1KcFLgDSPFIGgg+aW3cSVmYlWQoulmsQQQgbtl?=
 =?us-ascii?Q?9/DO1hAsP9a+4s86DEFA3mhVkg4lT+zKIJmx9DqGVxj//s+B1Z4uUnVE/dEw?=
 =?us-ascii?Q?ODXE9lhhSieRRPt+8JLAM35AmxvQKC8aCP9yEm9p7f1zvUf4IC5dP4mOToyY?=
 =?us-ascii?Q?rGnwD8y1Fxfrc2jrR6j3X2l5vUqz3KKLXWdU5ObUj4lbjiOVl4qd+PWgP6ID?=
 =?us-ascii?Q?sVqgfjYWzH/edvjTkg/d0MadHW2CurEX8GXR1TmA0dEEAuyoPdG7LujxgMLJ?=
 =?us-ascii?Q?en7qSrKwKqwQHkeUsQ/7g+GxXzF2zVZca7oZh5/oGVA6xk81Z4KmPJ3cJa1q?=
 =?us-ascii?Q?orMR3oN3iLBDlmwNF/2tbeM=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d407d71a-efbc-49e0-4bc4-08d9ebd138d7
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6921.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 13:36:48.5211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2v0Syff9K+I18YKj2jJGfxNcLVCUw0MYwfTd6TmG+1m0ncCKdbaSg56Nhu2+cI4iuVioZgcvHHtnRovREB5uuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6286
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
 Documentation/hwmon/tmp464.rst |  43 +++
 MAINTAINERS                    |   7 +
 drivers/hwmon/Kconfig          |  10 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/tmp464.c         | 472 +++++++++++++++++++++++++++++++++
 5 files changed, 533 insertions(+)
 create mode 100644 Documentation/hwmon/tmp464.rst
 create mode 100644 drivers/hwmon/tmp464.c

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
index 3e461db9cd91..fa0b27a8fe28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19457,6 +19457,13 @@ S:	Maintained
 F:	Documentation/hwmon/tmp401.rst
 F:	drivers/hwmon/tmp401.c
 
+TMP464 HARDWARE MONITOR DRIVER
+M:	Agathe Porte <agathe.porte@nokia.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/tmp464.rst
+F:	drivers/hwmon/tmp464.c
+
 TMP513 HARDWARE MONITOR DRIVER
 M:	Eric Tremblay <etremblay@distech-controls.com>
 L:	linux-hwmon@vger.kernel.org
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
index 000000000000..f294e12b1e39
--- /dev/null
+++ b/drivers/hwmon/tmp464.c
@@ -0,0 +1,472 @@
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
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/jiffies.h>
+#include <linux/i2c.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/err.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/sysfs.h>
+
+/* Addresses to scan */
+static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b,
+					     I2C_CLIENT_END };
+
+enum chips { tmp464 };
+
+#define MAX_CHANNELS				5 /* chan 0 is internal, 1-4 are remote */
+
+/* TMP464 registers */
+#define TMP464_REG_THERM_STATUS			0x21
+#define TMP464_REG_THERM2_STATUS		0x22
+
+static const u8 TMP464_TEMP[MAX_CHANNELS] = { 0x00, 0x01, 0x02, 0x03, 0x04 };
+static const u8 TMP464_THERM_LIMIT[MAX_CHANNELS] = { 0x39, 0x42, 0x4A, 0x52, 0x5A };
+static const u8 TMP464_THERM2_LIMIT[MAX_CHANNELS] = { 0x3A, 0x43, 0x4B, 0x53, 0x5B };
+static const u8 TMP464_OFFSET_REMOTE[MAX_CHANNELS] = { 0x40, 0x48, 0x50, 0x58 };
+#define TMP464_N_FACTOR_REG_1			0x41
+#define TMP464_CONFIG_REG			0x30
+
+/* alarm offset in THERM_STATUS/THERM2_STATUS register */
+#define TMP464_ALARM_BASE_NUMBER		7
+
+#define TMP464_REG_THERM_HYSTERESIS		0x38
+
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
+
+struct tmp464_channel {
+	const char *label;
+	bool enabled;
+	s16 temp;
+};
+
+struct tmp464_data {
+	struct i2c_client *client;
+	struct mutex update_lock;
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
+
+/* funcs */
+
+static int temp_from_raw(u16 reg)
+{
+	int temp = 0;
+
+	temp = (reg >> 8) * 2000;
+	temp += ((reg & 0xFF) >> 3) * 625 / 10;
+
+	return temp;
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
+
+}
+
+static int tmp464_read_string(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, const char **str)
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
+	int config, config_orig;
+	struct i2c_client *client = data->client;
+
+	/* Set the conversion rate to 2 Hz */
+	config = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
+	if (config < 0) {
+		dev_err(&client->dev,
+			"Could not read configuration register (%d)\n", config);
+		return config;
+	}
+
+	config_orig = config;
+	config &= ~TMP464_CONFIG_CONVERSION_RATE_MASK;
+	config |= (0x05) << TMP464_CONFIG_CONVERSION_RATE_B0;
+
+	if (config != config_orig) {
+		dev_info(&client->dev, "Set conversion rate to 2 Hz\n");
+		i2c_smbus_write_word_data(client, TMP464_CONFIG_REG, config);
+	}
+
+	/* Start conversions (disable shutdown if necessary) */
+	config = i2c_smbus_read_word_swapped(client, TMP464_CONFIG_REG);
+	if (config < 0) {
+		dev_err(&client->dev,
+			"Could not read configuration register (%d)\n", config);
+		return config;
+	}
+
+	config_orig = config;
+	config &= ~TMP464_CONFIG_SHUTDOWN;
+
+	if (config != config_orig) {
+		dev_info(&client->dev, "Enable monitoring chip\n");
+		i2c_smbus_write_word_data(client, TMP464_CONFIG_REG, config);
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
+	u8 reg;
+
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
+		return -ENODEV;
+
+	reg = i2c_smbus_read_word_swapped(client, TMP464_MANUFACTURER_ID_REG);
+	if (reg != TMP464_MANUFACTURER_ID)
+		return -ENODEV;
+
+	/* Check for "always return zero" bits */
+	reg = i2c_smbus_read_word_swapped(client, TMP464_REG_THERM_STATUS);
+	if (reg & 0x1f)
+		return -ENODEV;
+	reg = i2c_smbus_read_word_swapped(client, TMP464_REG_THERM2_STATUS);
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
+		i2c_smbus_write_word_data(client, TMP464_N_FACTOR_REG_1 + i - 1,
+					  val);
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
+	if (!i2c_check_functionality(client->adapter,
+	    I2C_FUNC_SMBUS_WORD_DATA)) {
+		dev_err(&client->dev, "i2c functionality check failed\n");
+		return -ENODEV;
+	}
+	data = devm_kzalloc(dev, sizeof(struct tmp464_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	mutex_init(&data->update_lock);
+	if (client->dev.of_node)
+		data->channels = (unsigned long)
+			of_device_get_match_data(&client->dev);
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
+							 data,
+							 &data->chip,
+							 NULL);
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

