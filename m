Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7786C433B4
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 14:59:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 812E161456
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 14:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237729AbhEGPAR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 11:00:17 -0400
Received: from mail-bn8nam08on2061.outbound.protection.outlook.com ([40.107.100.61]:65504
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234601AbhEGPAR (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 7 May 2021 11:00:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPxM9KjR9Veax2VYjawu3v1cY8JF75nmkqhI8fhMR4QgSq4aO/bD2XaGOAXW6mAzcRg4VTmbcufSLrjTLhZzQFmz1onEcW5sI1xDiXQ0yT2/b525XiNmpGX2Pr80nogd3tSm8xcO4rFKrrgl3N6hBFFiU+KKf2er3CdIPuoyBJ8p/fSKcckbc8Id8lR3rT0n/wsf6jKHyXJ2WO4JFmD04tET6ta1v2ubrTyS8m+bMJtiwn9fyoYcbHVC+ApkxWpNcrbYEefhlhkEjDnFKdnvwt5+/mKjSkr7V7NjwQ8z39wdo4QB48sKYhx3VIgS1bFxhnYkM6t7imFX6O2BA9Ad7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6DRw8iGvkms/sAFP1uwN0yxNsnch+UFACcFM8DIVyI=;
 b=lBpvAtp7ZG4HS8h0ZyaOelSuUDA2A1KyVmUd23gN+HHfAsHFl06dP7ADtGnwJ1lFLBIV2iaTgATIhWqsLwioqkSu8kWn2MhNJ2trqPvDYlP2nkW7hlN0PBfRhKaC+WRuFquuDfQYdTrM6aJbtQyv3rJusUQLOrFm4emNA1+qmbQ7pfDFuu49pwLPPseyrhrEPkVChJATxr+S/2VwfppjpU59gs/NI3W/B3r3oVjmo1BzUO5ZUMvqKwtftdpeJw4R4s9qvvksXFeR3vixrtcZlndb4ku77js2tjYnjZkYZxCm1ILCQn1bZPouBZ9/PwpaVMMEJoF94V0VN+E/xCLEVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6DRw8iGvkms/sAFP1uwN0yxNsnch+UFACcFM8DIVyI=;
 b=obLYzaoNBJi/XZpYOVwkwc4p8Btp92zS/brOBiLaVMTEeZsxA3Dzl9juCM13cbnvT4SIJcPACItYvVrr4YrjIWnYyMokXOpMOU7OYLDDIqVIgs121TEpBKFdg1swjhAd3xVw3TtnCOB94USi50U8m144poZaDWLaHKgCSyfX9zHjmFUo5JLeWLPbZIzbCVQ4b8opxkNeKZOblv1kk80/3urErO/+SchMrqv1aT3rF38e2yD0Eduhj0pkIUC/7ZIoW6eCHRKVLWIT+SYxi50ZOfvg5CR64HhBUegoj3/JzkrjyWf0qC3XZh5vpDe4wrf6iYsYiLKzHo5s1PDnWePr9A==
Received: from DM5PR13CA0043.namprd13.prod.outlook.com (2603:10b6:3:7b::29) by
 MN2PR12MB3421.namprd12.prod.outlook.com (2603:10b6:208:cd::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.27; Fri, 7 May 2021 14:59:15 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::2a) by DM5PR13CA0043.outlook.office365.com
 (2603:10b6:3:7b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.9 via Frontend
 Transport; Fri, 7 May 2021 14:59:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 7 May 2021 14:59:15 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 14:59:13 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v5 2/3] hwmon: (pmbus) Add support for MPS Multi-phase mp2888 controller
Date:   Fri, 7 May 2021 17:58:49 +0300
Message-ID: <20210507145850.420889-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210507145850.420889-1-vadimp@nvidia.com>
References: <20210507145850.420889-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f11ffdef-6d63-43de-2bb9-08d91168aed9
X-MS-TrafficTypeDiagnostic: MN2PR12MB3421:
X-Microsoft-Antispam-PRVS: <MN2PR12MB34216005F8299776136C7E54AF579@MN2PR12MB3421.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3VlXPPf95aKcZiPbxrLk21LC4Uy4Eh0toX1D+v3Vedn6dDfDt5gfs4d+nnwpYnuODp/gzDIweyrHII29OifSvp0U+G+Z7ZhvFxij58yzlu+yaZRVw39nXm+hD6j2EpxQtYBCj3Oc9NKR9gSH5WuQyBGVsMZwBlXKlXzc9Xs2pqpQIgTtZvqmm8mEvZhvAksU54Mtylnm94q1u/lGtxKeAnjwukOmDbJJhlEkqbuPXuBHq+rmrd7yL8IY7dEz9YybfyhfLmQs6gxvZ7/kuarnYAFrwvYtIs0rvbgCLYEN0gA29VhU0g9knqJXOMcxSwUHOrz0hS7kH3ZGJ9B+0rFWFaxoEEUOThVg3ilrAb7dILBPI3HvmlD68XQBEfnBthIUCFFneLPRlaH+053ABWExwIa+5Dl574SAxsELkknDX/u7fi7jgjtmQsA2kNif3FBDdIs0EA8SVXN0LsezRomeTSEdHrB12g/7wC/gjbeR998vV1CvfX9PEMxpJkUQ3n/g9HJK0IkawLR6RgiDc4jVimFhZ3ILGvEXNcLdW1N0Kj6IlhKnAnI5IQFdwzKm3TztZ31gql69piMIlRBuigKXPhJCV4+OIV1cBG+gnmMVibykrLVO4+nQDIV6O9yyKhOgATIGOrbjbs6oxslmHFrtAnthpk3rpWt85+ucwYqvrdM=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(46966006)(36840700001)(70206006)(82740400003)(83380400001)(30864003)(16526019)(478600001)(36860700001)(186003)(82310400003)(107886003)(4326008)(2616005)(26005)(70586007)(110136005)(54906003)(6666004)(36906005)(8936002)(8676002)(36756003)(316002)(1076003)(7636003)(47076005)(356005)(336012)(2906002)(5660300002)(86362001)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 14:59:15.5885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f11ffdef-6d63-43de-2bb9-08d91168aed9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
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
v4->v5
 Comments pointed out by Guenter:
 - Fix calculation of PMBUS_READ_VIN.
 - Add mp2888_read_word_data() for limits setting.
 - Treat PMBUS_POUT_OP_WARN_LIMIT in separate case.
 - Drop tuning of "m[PSC_POWER]" and "m[PSC_CURRENT_OUT]" from probing
   routine.
 Fixes from Vadim:
 - Treat PMBUS_IOUT_OC_WARN_LIMIT in separate case.

v3->v4
 Comments pointed out by Guenter:
  - Fix PMBUS_READ_VIN and limits calculations.
  - Add comment for PMBUS_OT_WARN_LIMIT scaling.
  - Fix PMBUS_READ_IOUT, PMBUS_READ_POUT, PMBUS_READ_PIN calculations.
  - Enable PMBUS_IOUT_OC_WARN_LIMIT and PMBUS_POUT_OP_WARN_LIMIT.
 Fixes from Vadim:
  - Disable PMBUS_POUT_MAX. Device uses this register for different
    purpose.
  - Disable PMBUS_MFR_VOU_MIN. Device doe not implement this register.
  - Update documentation file.

v2->v3
 Comments pointed out by Guenter:
 - Fix precision for PMBUS_READ_VIN (it requires adding scale for
   PMBUS_VIN_OV_FAULT_LIMIT and PMBUS_VIN_UV_WARN_LIMIT.
 - Fix precision for PMBUS_READ_TEMPERATURE_1 (it requires adding
   scale for PMBUS_OT_WARN_LIMIT).
 - Use DIV_ROUND_CLOSEST_ULL for scaling PMBUS_READ_POUT,
   PMBUS_READ_PIN readouts.
 Notes and fixes from Vadim:
  - READ_IOUT in linear11 does not give write calculation (tested with
    external load), while in direct format readouts are correct.
  - Disable non-configured phases in mp2888_identify_multiphase().

v1->v2:
 Comments pointed out by Guenter:
  - Use standard access for getting PMBUS_OT_WARN_LIMIT,
    PMBUS_VIN_OV_FAULT_LIMIT, PMBUS_VIN_UV_WARN_LIMIT.
  - Use linear11 conversion for PMBUS_READ_VIN, PMBUS_READ_POUT,
    PMBUS_READ_PIN, PMBUS_READ_TEMPERATURE_1 and adjust coefficients.
  - Add reading phases current from the dedicated registers.
  - Add comment for not implemented or implemented not according to the
	spec registers, for which "ENXIO" code is returned.
  - Set PMBUS_HAVE_IOUT" statically.
  Notes from Vadim:
  - READ_IOUT uses direct format, so I did not adjust it like the below
    registers.
---
 Documentation/hwmon/mp2888.rst | 113 +++++++++++
 drivers/hwmon/pmbus/Kconfig    |   9 +
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp2888.c   | 411 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 534 insertions(+)
 create mode 100644 Documentation/hwmon/mp2888.rst
 create mode 100644 drivers/hwmon/pmbus/mp2888.c

diff --git a/Documentation/hwmon/mp2888.rst b/Documentation/hwmon/mp2888.rst
new file mode 100644
index 000000000000..5e578fd7b147
--- /dev/null
+++ b/Documentation/hwmon/mp2888.rst
@@ -0,0 +1,113 @@
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
+**curr[1-{1+n}]_input**
+
+**curr[1-{1+n}]_label**
+
+**curr1_max**
+
+**curr1_max_alarm**
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
+**power2_input**
+
+**power2_label**
+
+**power2_max**
+
+**power2_max_alarm**
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
index 000000000000..1e72c8fd82fa
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2888.c
@@ -0,0 +1,411 @@
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
+#define MP2888_MFR_READ_CS1_2	0x73
+#define MP2888_MFR_READ_CS3_4	0x74
+#define MP2888_MFR_READ_CS5_6	0x75
+#define MP2888_MFR_READ_CS7_8	0x76
+#define MP2888_MFR_READ_CS9_10	0x77
+#define MP2888_MFR_VR_CONFIG1	0xe1
+
+#define MP2888_TOTAL_CURRENT_RESOLUTION	BIT(3)
+#define MP2888_PHASE_CURRENT_RESOLUTION	BIT(4)
+#define MP2888_DRMOS_KCS		GENMASK(2, 0)
+#define MP2888_TEMP_UNIT		10
+#define MP2888_MAX_PHASE		10
+
+struct mp2888_data {
+	struct pmbus_driver_info info;
+	int total_curr_resolution;
+	int phase_curr_resolution;
+	int curr_sense_gain;
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
+mp2888_current_sense_gain_and_resolution_get(struct i2c_client *client, struct mp2888_data *data)
+{
+	int ret;
+
+	/*
+	 * Obtain DrMOS current sense gain of power stage from the register
+	 * , bits 0-2. The value is selected as below:
+	 * 00b - 5µA/A, 01b - 8.5µA/A, 10b - 9.7µA/A, 11b - 10µA/A. Other
+	 * values are reserved.
+	 */
+	ret = i2c_smbus_read_word_data(client, MP2888_MFR_SYS_CONFIG);
+	if (ret < 0)
+		return ret;
+
+	switch (ret & MP2888_DRMOS_KCS) {
+	case 0:
+		data->curr_sense_gain = 85;
+		break;
+	case 1:
+		data->curr_sense_gain = 97;
+		break;
+	case 2:
+		data->curr_sense_gain = 100;
+		break;
+	case 3:
+		data->curr_sense_gain = 50;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * Obtain resolution selector for total and phase current report and protection.
+	 * 0: original resolution; 1: half resolution (in such case phase current value should
+	 * be doubled.
+	 */
+	data->total_curr_resolution = (ret & MP2888_TOTAL_CURRENT_RESOLUTION) >> 3;
+	data->phase_curr_resolution = (ret & MP2888_PHASE_CURRENT_RESOLUTION) >> 4;
+
+	return 0;
+}
+
+static int
+mp2888_read_phase(struct i2c_client *client, struct mp2888_data *data, int page, int phase, u8 reg)
+{
+	int ret;
+
+	ret = pmbus_read_word_data(client, page, phase, reg);
+	if (ret < 0)
+		return ret;
+
+	if (!((phase + 1) % 2))
+		ret >>= 8;
+	ret &= 0xff;
+
+	/*
+	 * Output value is calculated as: (READ_CSx / 80 – 1.23) / (Kcs * Rcs)
+	 * where:
+	 * - Kcs is the DrMOS current sense gain of power stage, which is obtained from the
+	 *   register MP2888_MFR_VR_CONFIG1, bits 13-12 with the following selection of DrMOS
+	 *   (data->curr_sense_gain):
+	 *   00b - 5µA/A, 01b - 8.5µA/A, 10b - 9.7µA/A, 11b - 10µA/A.
+	 * - Rcs is the internal phase current sense resistor. This parameter depends on hardware
+	 *   assembly. By default it is set to 1kΩ. In case of different assembly, user should
+	 *   scale this parameter by dividing it by Rcs.
+	 * If phase current resolution bit is set to 1, READ_CSx value should be doubled.
+	 * Note, that current phase sensing, providing by the device is not accurate. This is
+	 * because sampling of current occurrence of bit weight has a big deviation, especially for
+	 * light load.
+	 */
+	ret = DIV_ROUND_CLOSEST(ret * 100 - 9800, data->curr_sense_gain);
+	ret = (data->phase_curr_resolution) ? ret * 2 : ret;
+	/* Scale according to total current resolution. */
+	ret = (data->total_curr_resolution) ? ret * 8 : ret * 4;
+	return ret;
+}
+
+static int
+mp2888_read_phases(struct i2c_client *client, struct mp2888_data *data, int page, int phase)
+{
+	int ret;
+
+	switch (phase) {
+	case 0 ... 1:
+		ret = mp2888_read_phase(client, data, page, phase, MP2888_MFR_READ_CS1_2);
+		break;
+	case 2 ... 3:
+		ret = mp2888_read_phase(client, data, page, phase, MP2888_MFR_READ_CS3_4);
+		break;
+	case 4 ... 5:
+		ret = mp2888_read_phase(client, data, page, phase, MP2888_MFR_READ_CS5_6);
+		break;
+	case 6 ... 7:
+		ret = mp2888_read_phase(client, data, page, phase, MP2888_MFR_READ_CS7_8);
+		break;
+	case 8 ... 9:
+		ret = mp2888_read_phase(client, data, page, phase, MP2888_MFR_READ_CS9_10);
+		break;
+	default:
+		return -ENODATA;
+	}
+	return ret;
+}
+
+static int mp2888_read_word_data(struct i2c_client *client, int page, int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp2888_data *data = to_mp2888_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_READ_VIN:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret <= 0)
+			return ret;
+
+		/*
+		 * READ_VIN requires fixup to scale it to linear11 format. Register data format
+		 * provides 10 bits for mantissa and 6 bits for exponent. Bits 15:10 are set with
+		 * the fixed value 111011b.
+		 */
+		ret = (ret & GENMASK(9, 0)) | ((ret & GENMASK(31, 10)) << 1);
+		break;
+	case PMBUS_OT_WARN_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+		/*
+		 * Chip reports limits in degrees C, but the actual temperature in 10th of
+		 * degrees C - scaling is needed to match both.
+		 */
+		ret *= MP2888_TEMP_UNIT;
+		break;
+	case PMBUS_READ_IOUT:
+		if (phase != 0xff)
+			return mp2888_read_phases(client, data, page, phase);
+
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+		/*
+		 * READ_IOUT register has unused bits 15:12 with fixed value 1110b. Clear these
+		 * bits and scale with total current resolution. Data is provided in direct format.
+		 */
+		ret &= GENMASK(11, 0);
+		ret = data->total_curr_resolution ? ret * 2 : ret;
+		break;
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+		ret &= GENMASK(9, 0);
+		/*
+		 * READ_OUT should be multiplied by 0.25 if total_current_resolution=0 and by 0.5
+		 * if 1. IOUT_OC_WARN_LIMIT is not scaled if total_current_resolution=0 and should
+		 * be multiplied by 2 if 1.
+		 */
+		ret = data->total_curr_resolution ? ret * 8 : ret * 4;
+		break;
+	case PMBUS_READ_POUT:
+	case PMBUS_READ_PIN:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+		ret = data->total_curr_resolution ? ret * 2 : ret;
+		break;
+	case PMBUS_POUT_OP_WARN_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+		/*
+		 * READ_POUT should be multiplied by 0.5 if total_current_resolution=0 and is not
+		 * scaled if 1. IOUT_OC_WARN_LIMIT is not scaled if total_current_resolution=0 and
+		 * should be multiplied by 2 if 1.
+		 */
+		ret = data->total_curr_resolution ? ret * 4 : ret * 2;
+		break;
+	/*
+	 * The below registers are not implemented by device or implemented not according to the
+	 * spec. Skip all of them to avoid exposing non-relevant inputs to sysfs.
+	 */
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
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_POUT_MAX:
+	case PMBUS_IOUT_UC_FAULT_LIMIT:
+	case PMBUS_POUT_OP_FAULT_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+	case PMBUS_MFR_VIN_MIN:
+	case PMBUS_MFR_VOUT_MIN:
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
+static int mp2888_write_word_data(struct i2c_client *client, int page, int reg, u16 word)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp2888_data *data = to_mp2888_data(info);
+
+	switch (reg) {
+	case PMBUS_OT_WARN_LIMIT:
+		word = DIV_ROUND_CLOSEST((int)word, MP2888_TEMP_UNIT);
+		/* Drop unused bits 15:8. */
+		word = ((s16)word < 0) ? 0 : clamp_val(word, 0, GENMASK(7, 0));
+		break;
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		/* Fix limit according to total curent resolution. */
+		word = data->total_curr_resolution ? DIV_ROUND_CLOSEST((int)word, 8) :
+		       DIV_ROUND_CLOSEST((int)word, 4);
+		/* Drop unused bits 15:10. */
+		word = ((s16)word < 0) ? 0 : clamp_val(word, 0, GENMASK(9, 0));
+		break;
+	case PMBUS_POUT_OP_WARN_LIMIT:
+		/* Fix limit according to total curent resolution. */
+		word = data->total_curr_resolution ? DIV_ROUND_CLOSEST((int)word, 4) :
+		       DIV_ROUND_CLOSEST((int)word, 2);
+		/* Drop unused bits 15:10. */
+		word = ((s16)word < 0) ? 0 : clamp_val(word, 0, GENMASK(9, 0));
+		break;
+	default:
+		return -ENODATA;
+	}
+	return pmbus_write_word_data(client, page, reg, word);
+}
+
+static int
+mp2888_identify_multiphase(struct i2c_client *client, struct mp2888_data *data,
+			   struct pmbus_driver_info *info)
+{
+	int i, ret;
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
+	/* Disable non-configured phases. */
+	for (i = info->phases[0]; i < MP2888_MAX_PHASE; i++)
+		info->pfunc[i] = 0;
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
+	.R[PSC_TEMPERATURE] = 1,
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.m[PSC_CURRENT_OUT] = 4,
+	.m[PSC_POWER] = 1,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_IOUT |
+		   PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		   PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
+		   PMBUS_PHASE_VIRTUAL,
+	.pfunc[0] = PMBUS_HAVE_IOUT,
+	.pfunc[1] = PMBUS_HAVE_IOUT,
+	.pfunc[2] = PMBUS_HAVE_IOUT,
+	.pfunc[3] = PMBUS_HAVE_IOUT,
+	.pfunc[4] = PMBUS_HAVE_IOUT,
+	.pfunc[5] = PMBUS_HAVE_IOUT,
+	.pfunc[6] = PMBUS_HAVE_IOUT,
+	.pfunc[7] = PMBUS_HAVE_IOUT,
+	.pfunc[8] = PMBUS_HAVE_IOUT,
+	.pfunc[9] = PMBUS_HAVE_IOUT,
+	.read_byte_data = mp2888_read_byte_data,
+	.read_word_data = mp2888_read_word_data,
+	.write_word_data = mp2888_write_word_data,
+};
+
+static int mp2888_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+	struct mp2888_data *data;
+	int ret;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct mp2888_data), GFP_KERNEL);
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
+	/* Obtain current sense gain of power stage and current resolution. */
+	ret = mp2888_current_sense_gain_and_resolution_get(client, data);
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

