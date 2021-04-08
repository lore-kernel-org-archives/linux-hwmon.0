Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB506C43461
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Apr 2021 14:18:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 833E46024A
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Apr 2021 14:18:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbhDHOSx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Apr 2021 10:18:53 -0400
Received: from mail-eopbgr680063.outbound.protection.outlook.com ([40.107.68.63]:27790
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231744AbhDHOSG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 8 Apr 2021 10:18:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mgdz5pQwuliWcpiZ2x5hHaJhbhbP2Hbv2VU+gT0aGqdHUgDY9cw//5v0v0yBGL+ZY/3k7KPzy8wsNsIzYJ2jk/9ofr6mAqAEABBOcp21O0TFnZO/ajPZ9edW59Q+fI4PWF3+v2bZjfA1UllgbIJAuR031coo3RWFivZPPobFd9e8DPOPpo7XefDsBZxIZl8j7dws4xNMwevNqGKgRf2Vrrti9BEyH8TAnXZ6EpFxH8I2loMMnWii9rHOznoT3iJT+EuTyftC68aJVQWmFqHX89pHnqNTAyGWLqIw+fanWVCSe2nSHjFzi5bohQ89cUJJX5RgQOZ195BR3BrOWiTRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6muzqOUqLe+dZymF28m+T3LdcsawRkycvfARPOFDZs=;
 b=IHqocs/6Yr8rrfbVp63k0Jym5SCl1ZICHBIIV9bM2351rgpLm7mOGbfxXWrvzY6FO1+yibY9zy5qW/B72hsQu63TWDJeaDIuk2OWRWYCgcWEDI9rglCzhD5KU1CIpheccjaCBMu55uF3vgUij85o0Q2DNltCzfMnehML3GjT8C3DEOjKJGgV4NcaY7fKGRrzYVUKPZSXcLYn6bJCunQPQ9AzdgqknvO6SXBM9+RskenenhHKbFVD6hdLKrQm4JhsiH37okKB4o73A4v+3FJstA2YKznWTQAPdbcQfN4AL7KqIjbxcOGZ2COn99gTJ7qW3viIV9MBYEP2hkXX1/9FgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6muzqOUqLe+dZymF28m+T3LdcsawRkycvfARPOFDZs=;
 b=nVKTG9bfVfodRMuq5Qxe+qEcldY7cDkxsugE3hhIQ1LNIHnfSiFCKmtc/e9gWIV4wg6S0w6qeqaJDVxHwACBYlLnrpt060SV6LeH/049MXb3332SmrsmLnygLFJ0aguPUXigTltMCsvKqRg5LZtzztE9ay37NGzpW06FptfPqLjLrPZd2zda4AWikGXIFCgTS0MwiR2+yjjDkbQbURY0blThkKfVk9Co2Yuhq99mmIZjUwB75W7f8mgnG0jnJ8MauXi7gr+/t91NHEtWhGKH16QLm+lbAvCPTcJhc/2UuOcVJg6vPRxClFGh/zhCrWgGdMI8TEozaOsR9DlJGKlnJg==
Received: from BN6PR14CA0019.namprd14.prod.outlook.com (2603:10b6:404:79::29)
 by MWHPR12MB1375.namprd12.prod.outlook.com (2603:10b6:300:10::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 14:17:53 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::b4) by BN6PR14CA0019.outlook.office365.com
 (2603:10b6:404:79::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Thu, 8 Apr 2021 14:17:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 14:17:53 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 14:17:51 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next 2/3] hwmon: (pmbus) Add support for MPS Multi-phase mp2888 controller
Date:   Thu, 8 Apr 2021 17:17:25 +0300
Message-ID: <20210408141726.2561683-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210408141726.2561683-1-vadimp@nvidia.com>
References: <20210408141726.2561683-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af8a38e5-0a52-49ea-4b2c-08d8fa991939
X-MS-TrafficTypeDiagnostic: MWHPR12MB1375:
X-Microsoft-Antispam-PRVS: <MWHPR12MB13756122698EC9169E267679AF749@MWHPR12MB1375.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WCqlfmyhnbwAyErc2Ycz7fmWLENhPt5mGB/m8H9TXLjdDfuU49bScx18k6TdFilOhLa6kXmQU6lUxmumyk8eXtFRu6ssasP7sJlrMjvBXuqZKkOrnQoJ/toOFNaDyASdvunkL/EaQpeeLvhdvox1ZRUtLaklQynf9MlS53mOXZ9CBU3nkFnHZuvCN7IxPKoC6QL1Avkx2wr3vMI6dclAc9ghxdVhNPpPpLNHSp339LDM+Jcc6UKS93Tw9tqwRwAH7bZg39Xb++vR/V7/QRBqJcBW9UyAiISa5Wdpox7io1ACpEdsaiJIjhz93S4MKTwWwgwpxxZtMZKAKbLsxmWg21H8o9ZckEa7eVabgZf61ZyR7cpl7N/C42IxycljT0zfjJBE7VXN7awXsv68tpUDS8K3JLQ2FciQH5E6+RY2YZGSiQDWIDhID7cmzgMJcs9CmamfjBtTUQ6u/NTSx+2p0/cEJUPpbg/VZRxDy9fKbglLBqVM3WMyVoi0P/SAwpvKoBmc+t2P8xsxRUU848FRZSOwO8qpNtaVieaO/bAGnMQRl5+oVMJH+U2yZZgIB0P3NKelXe1YKJmlonPyVz75/h+qnVOrXedPhkumXRfagI78Y5/z9G8QsSfzinICHeyfZUsIaVgQHH+BZgjqM53t87m/zkhaG0sox8aM71g7Ehc=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966006)(36840700001)(426003)(336012)(36756003)(82740400003)(8676002)(186003)(2616005)(83380400001)(7636003)(86362001)(107886003)(356005)(26005)(8936002)(4326008)(16526019)(478600001)(36860700001)(47076005)(2906002)(316002)(5660300002)(30864003)(70586007)(54906003)(6666004)(36906005)(82310400003)(110136005)(1076003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:17:53.0392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af8a38e5-0a52-49ea-4b2c-08d8fa991939
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1375
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for mp2888 device from Monolithic Power Systems, Inc. (MPS)
vendor. This is a digital, multi-phase, pulse-width modulation
controller.

This device supports:
- One power rail.
- Programmable Multi-Phase up to 10 Phases.
- PWM-VID Interface
- One pages 0 for telemetry.
- Programmable pins for PMBus Address.
- Built-In EEPROM to Store Custom Configurations.
- Can configured VOUT readout in direct or VID format and allows
  setting of different formats on rails 1 and 2. For VID the following
  protocols are available: VR13 mode with 5-mV DAC; VR13 mode with
  10-mV DAC, IMVP9 mode with 5-mV DAC.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 Documentation/hwmon/mp2888.rst | 111 ++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig    |   9 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp2888.c   | 256 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 377 insertions(+)
 create mode 100644 Documentation/hwmon/mp2888.rst
 create mode 100644 drivers/hwmon/pmbus/mp2888.c

diff --git a/Documentation/hwmon/mp2888.rst b/Documentation/hwmon/mp2888.rst
new file mode 100644
index 000000000000..7839a010642a
--- /dev/null
+++ b/Documentation/hwmon/mp2888.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp2888
+====================
+
+Supported chips:
+
+  * MPS MP12254
+
+    Prefix: 'mp2888'
+
+Author:
+
+	Vadim Pasternak <vadimp@nvidia.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+vendor dual-loop, digital, multi-phase controller MP2888.
+
+This device: supports:
+
+- One power rail.
+- Programmable Multi-Phase up to 10 Phases.
+- PWM-VID Interface
+- One pages 0 for telemetry.
+- Programmable pins for PMBus Address.
+- Built-In EEPROM to Store Custom Configurations.
+
+Device complaint with:
+
+- PMBus rev 1.3 interface.
+
+Device supports direct format for reading output current, output voltage,
+input and output power and temperature.
+Device supports linear format for reading input voltage and input power.
+
+The driver provides the next attributes for the current:
+
+- for current out input and maximum alarm;
+- for phase current: input and label.
+
+The driver exports the following attributes via the 'sysfs' files, where:
+
+- 'n' is number of configured phases (from 1 to 10);
+- index 1 for "iout";
+- indexes 2 ... 1 + n for phases.
+
+**curr1_alarm**
+
+**curr[1-{1+n}]_input**
+
+**curr[1-{1+n}]_label**
+
+The driver provides the next attributes for the voltage:
+
+- for voltage in: input, low and high critical thresholds, low and high
+  critical alarms;
+- for voltage out: input and high alarm;
+
+The driver exports the following attributes via the 'sysfs' files, where
+
+**in1_crit**
+
+**in1_crit_alarm**
+
+**in1_input**
+
+**in1_label**
+
+**in1_min**
+
+**in1_min_alarm**
+
+**in2_alarm**
+
+**in2_input**
+
+**in2_label**
+
+The driver provides the next attributes for the power:
+
+- for power in alarm and input.
+- for power out: cap, cap alarm an input.
+
+The driver exports the following attributes via the 'sysfs' files, where
+- indexes 1 for "pin";
+- indexes 2 for "pout";
+
+**power1_alarm**
+
+**power1_input**
+
+**power1_label**
+
+**power2_cap**
+
+**power2_cap_alarm**
+
+**power2_input**
+
+**power2_label**
+
+The driver provides the next attributes for the temperature:
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_max_alarm**
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 32d2fc850621..a57571928b31 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -211,6 +211,15 @@ config SENSORS_MAX8688
 	  This driver can also be built as a module. If so, the module will
 	  be called max8688.
 
+config SENSORS_MP2888
+	tristate "MPS MP2888"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP2888 Digital, Multi-Phase, Pulse-Width Modulation Controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp2888.
+
 config SENSORS_MP2975
 	tristate "MPS MP2975"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 6a4ba0fdc1db..a6d7352621ca 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
 obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
 obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
+obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
diff --git a/drivers/hwmon/pmbus/mp2888.c b/drivers/hwmon/pmbus/mp2888.c
new file mode 100644
index 000000000000..3d4b272616c6
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2888.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers
+ *
+ * Copyright (C) 2020 Nvidia Technologies Ltd.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+/* Vendor specific registers. */
+#define MP2888_MFR_SYS_CONFIG	0x44
+#define MP2888_MFR_VR_CONFIG1	0xe1
+
+#define MP2888_TOTAL_CURRENT_RESOLUTION	BIT(3)
+#define MP2888_VIN_LIMIT_UNIT		8
+#define MP2888_VIN_UNIT			3125
+#define MP2888_TEMP_UNIT		10
+#define MP2888_MAX_PHASE		10
+
+struct mp2888_data {
+	struct pmbus_driver_info info;
+	int total_curr_resolution;
+};
+
+#define to_mp2888_data(x)  container_of(x, struct mp2888_data, info)
+
+static int mp2888_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		/* Enforce VOUT direct format. */
+		return PB_VOUT_MODE_DIRECT;
+	default:
+		return -ENODATA;
+	}
+}
+
+static int
+mp2888_read_word_helper(struct i2c_client *client, int page, int phase, u8 reg, u16 mask)
+{
+	int ret = pmbus_read_word_data(client, page, phase, reg);
+
+	return (ret > 0) ? ret & mask : ret;
+}
+
+static int mp2888_read_word_data(struct i2c_client *client, int page, int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp2888_data *data = to_mp2888_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_OT_WARN_LIMIT:
+		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(7, 0));
+		break;
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+	case PMBUS_VIN_UV_WARN_LIMIT:
+		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(7, 0));
+		ret = (ret < 0) ? ret : DIV_ROUND_CLOSEST(ret, MP2888_VIN_LIMIT_UNIT);
+		break;
+	case PMBUS_READ_VIN:
+		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(9, 0));
+		ret = (ret < 0) ? ret : DIV_ROUND_CLOSEST(ret * MP2888_VIN_UNIT, 100000);
+		break;
+	case PMBUS_READ_VOUT:
+		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(11, 0));
+		break;
+	case PMBUS_READ_TEMPERATURE_1:
+		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(11, 0));
+		ret = (ret < 0) ? ret : DIV_ROUND_CLOSEST(ret, MP2888_TEMP_UNIT);
+		break;
+	case PMBUS_READ_IOUT:
+		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(11, 0));
+		ret = (ret < 0) ? ret : data->total_curr_resolution ? DIV_ROUND_CLOSEST(ret, 2) :
+		      DIV_ROUND_CLOSEST(ret, 4);
+		/*
+		 * Current phase sensing, providing by the device through the dedicated
+		 * registers 73h - 77h is not accurate, because sampling of current occurrence of
+		 * bit weight has a big deviation. Calculate per-phase current as total current
+		 * divided by number phases.
+		 */
+		if (phase != 0xff)
+			ret = (ret < 0) ? ret : DIV_ROUND_CLOSEST(ret, data->info.phases[page]);
+		break;
+	case PMBUS_READ_POUT:
+	case PMBUS_READ_PIN:
+		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(11, 0));
+		ret = (ret < 0) ? ret : data->total_curr_resolution ? ret :
+		      DIV_ROUND_CLOSEST(ret, 2);
+		break;
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_UT_WARN_LIMIT:
+	case PMBUS_UT_FAULT_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_VOUT_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_IOUT_OC_LV_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_UC_FAULT_LIMIT:
+	case PMBUS_POUT_OP_FAULT_LIMIT:
+	case PMBUS_POUT_OP_WARN_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+	case PMBUS_MFR_VIN_MIN:
+	case PMBUS_MFR_VIN_MAX:
+	case PMBUS_MFR_VOUT_MAX:
+	case PMBUS_MFR_IIN_MAX:
+	case PMBUS_MFR_IOUT_MAX:
+	case PMBUS_MFR_PIN_MAX:
+	case PMBUS_MFR_POUT_MAX:
+	case PMBUS_MFR_MAX_TEMP_1:
+		return -ENXIO;
+	default:
+		return -ENODATA;
+	}
+
+	return ret;
+}
+
+static void mp2888_set_phase(struct pmbus_driver_info *info)
+{
+	int i;
+
+	for (i = 0 ; i < info->phases[0]; i++)
+		info->pfunc[i] = PMBUS_HAVE_IOUT;
+}
+
+static int
+mp2888_identify_multiphase(struct i2c_client *client, struct mp2888_data *data,
+			   struct pmbus_driver_info *info)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+	if (ret < 0)
+		return ret;
+
+	/* Identify multiphase number - could be from 1 to 10. */
+	ret = i2c_smbus_read_word_data(client, MP2888_MFR_VR_CONFIG1);
+	if (ret <= 0)
+		return ret;
+
+	info->phases[0] = ret & GENMASK(3, 0);
+
+	/*
+	 * The device provides a total of 10 PWM pins, and can be configured to different phase
+	 * count applications for rail.
+	 */
+	if (info->phases[0] > MP2888_MAX_PHASE)
+		return -EINVAL;
+
+	mp2888_set_phase(info);
+
+	return 0;
+}
+
+static int mp2888_current_resolution_get(struct i2c_client *client, struct mp2888_data *data)
+{
+	int ret;
+
+	/*
+	 * Obtain resolution selector for total current report and protection.
+	 * 0: original resolution; 1: half resolution (in such case phase current value should
+	 * be doubled.
+	 */
+	ret = i2c_smbus_read_word_data(client, MP2888_MFR_SYS_CONFIG);
+	if (ret < 0)
+		return ret;
+	data->total_curr_resolution = (ret & MP2888_TOTAL_CURRENT_RESOLUTION) >> 3;
+
+	return 0;
+}
+
+static struct pmbus_driver_info mp2888_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.m[PSC_TEMPERATURE] = 1,
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.m[PSC_CURRENT_OUT] = 1,
+	.m[PSC_POWER] = 1,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_IOUT |
+		   PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		   PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
+		   PMBUS_PHASE_VIRTUAL,
+	.read_byte_data = mp2888_read_byte_data,
+	.read_word_data = mp2888_read_word_data,
+};
+
+static int mp2888_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+	struct mp2888_data *data;
+	int ret;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct mp2888_data),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memcpy(&data->info, &mp2888_info, sizeof(*info));
+	info = &data->info;
+
+	/* Identify multiphase configuration. */
+	ret = mp2888_identify_multiphase(client, data, info);
+	if (ret)
+		return ret;
+
+	/* Obtain total current resolution. */
+	ret = mp2888_current_resolution_get(client, data);
+	if (ret)
+		return ret;
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct i2c_device_id mp2888_id[] = {
+	{"mp2888", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, mp2888_id);
+
+static const struct of_device_id __maybe_unused mp2888_of_match[] = {
+	{.compatible = "mps,mp2888"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp2888_of_match);
+
+static struct i2c_driver mp2888_driver = {
+	.driver = {
+		.name = "mp2888",
+		.of_match_table = of_match_ptr(mp2888_of_match),
+	},
+	.probe_new = mp2888_probe,
+	.id_table = mp2888_id,
+};
+
+module_i2c_driver(mp2888_driver);
+
+MODULE_AUTHOR("Vadim Pasternak <vadimp@nvidia.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP2888 device");
+MODULE_LICENSE("GPL");
-- 
2.11.0

