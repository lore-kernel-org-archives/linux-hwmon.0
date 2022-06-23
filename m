Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DA8CCA47C
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Jun 2022 16:52:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232204AbiFWQws (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Jun 2022 12:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbiFWQwg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Jun 2022 12:52:36 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::603])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 526B325D5;
        Thu, 23 Jun 2022 09:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnMlAieHCdxd9pgnP9mL4m9ARtaLWyPPDwFAaayoMKWHw6LfMKxLtFG3Cm5sx0km9/WR4ZZbNfaIKxjXjxMAVHX8foH5VKnOVSTbsdtySpfMJ1+XaoFB/hueyE1BnD+q+kuvI+QNedUnSz///JE4dC11yUIqvEVapQJKsAm5t0vHAHl68JEH91izNdcwVWm+bS3lWJMblF98TLdj0yBrlozfjhMn/LLsGULqLoDS9bywOl3cBx50/u3dwHOmR9VGYzvTnhcpXHbEAibRfiUY00VJNUk5JbyZvvgunz6L352zYwZJM8ofDFSYVpL4lPJMxUzFxkfebRv7lt01BA6CtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m8Ensq2LNGhRSENXIfdYWVzjfRCfTfRr0/sgbgwTG0=;
 b=hLTIlHIBKzIOklt1a0mCTaeSJYNup2/88CY9X7yNxp6Rjm4Ndi1Mgzx7NuXl9L+1LjCB41yTMOjSU/xZwgUw0fqMJXY/u9cYCvCTZL0dT3S0GmzM4sPIpJv13RXK4lZn92BqfScuMj/9R9TAah/KIZIIRwMkxd6O/tlJryydThkVOX4WWGPxLRAx7me5BNOXQnp+AxqW8J7KqDiahBAuX4LMmESwH2sJn/EEpqhQyyFHcyEGMIoNxPANMN+os0CExTbDV2xkWo6b81PknWerlT+g5YNO2E5seukOyvAK9ugo0QINcPH8coUTIDxxw7hDUHln7lAo7KwjOQd/Y78SUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m8Ensq2LNGhRSENXIfdYWVzjfRCfTfRr0/sgbgwTG0=;
 b=fD+AWpilLnLUajC6HGumhVQzAVxjOeHK0eo4VrzOkfEaaUWC/9JQE4N/sg4RLtjOasvUY2gPn+xtGDCdZr44f+UQplL+6yt44K/vZi2D5m7zjFcJwGz+a7WpqeGP9P3DfuGy18cTgpWElNy1wQoppvCebZBGF4J8gdhwW1zaAsWSiVfzLRiy2Hu7FtLNVQv2E9IWuHFDS6KGyn6avP0B1EN6tMBIzbJxcY+qtNQFI6fM8UpjB/Xr3K07W2nvsvmHjgQD1akekZPpAyV5G5xcD41/uJqGIMwvTP6WYqX1darcpigESNyOKohHlIlUd5FJbAfXJcMeVoQi7tmmJMfBZw==
Received: from MWHPR12CA0052.namprd12.prod.outlook.com (2603:10b6:300:103::14)
 by BL0PR12MB5012.namprd12.prod.outlook.com (2603:10b6:208:1ca::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 16:52:27 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:103:cafe::cf) by MWHPR12CA0052.outlook.office365.com
 (2603:10b6:300:103::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Thu, 23 Jun 2022 16:52:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Thu, 23 Jun 2022 16:52:26 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Thu, 23 Jun 2022 16:52:26 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Thu, 23 Jun 2022 09:52:25 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Thu, 23 Jun 2022 09:52:23 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v4 1/3] hwmon: (emc2305) add support for EMC2301/2/3/5 RPM-based PWM Fan Speed Controller.
Date:   Thu, 23 Jun 2022 19:52:15 +0300
Message-ID: <20220623165217.59252-2-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220623165217.59252-1-michaelsh@nvidia.com>
References: <20220623165217.59252-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f12393b8-c2fc-402d-33f8-08da5538c0ea
X-MS-TrafficTypeDiagnostic: BL0PR12MB5012:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RvFPhNaJ+TkktbMkzJK2zEB1ZbXSdNt9DS9/2KSX/GFEV9DpSCD6CN5DTk6JYltYnw5fmgRHqgV6xY7BZ4AArq6vxDKQMkWL9f3K1h8WY5vJwzBTcTcad+pn0+HpFSqssQUOEG7bEZrdccTxyS1/9N9bUTr8SNFZPJeCwmxr31hCh3/f0Y1cHgfpUT7+Weezb9f3S/r/GGJrKgUCxY4BP+EH/1wLbLa42lcLECjq0WcnVCtnG48cX7G1x2W/iwMN1gBkTuQg90K2ikQ3zrCWErCoUr462qYiPsPI5HBKKk/G1MNcwYbT9e+Xiu/GgvuWJ5ieF5LXcTJrNEKLUD4gt4SY998xIsH2gi5K6jNV+DyMj7i9mCaLEKMPFY9xG/ytG3vOonnHP770YEQYN/+jJvSXPaPnkBLHc4f3jFXt8xfxRG0m7jOUJEP536Zcm0hilAe9m5+eZCd/jtLAfTWZHwEAYNVI8AgbvEf88nnq0sU/tVWZY/JWe96CYXnzsNmHLOrD3oWFQGX/1z50gVbeWlPuEynqIm6bgXR/3aYwAyUc/OM2xWQJDcRZCFlU7OMy1XbDLklxC16/nd8g8chu208OjOrkXP4yu6YyzAhpuXZM1+WmOiWjE98KB6JLiyUm03KRD6JyvvbEqgMFWt32NvbyPeCBjkUcud+gkJLzSwR3DVHM7YA8+Yon0pNCLdVUr9egvsQABA+EhLCLkpSfMvZRvEh9FY5EGf4Q50i1Ewy4Lp9YITaFFs7twacVySWP6YOUmoGlbz6pSVR3vvHPSvOryQeFI0t1rrdKD2iisuZtJgmUNt8TVDoFHdWw3Jw8I+uunqCmKQK0D7HairBLKw==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(136003)(376002)(40470700004)(46966006)(36840700001)(5660300002)(478600001)(82740400003)(186003)(30864003)(81166007)(40460700003)(6666004)(8936002)(356005)(2876002)(36860700001)(2616005)(70206006)(2906002)(41300700001)(40480700001)(26005)(336012)(70586007)(54906003)(110136005)(36756003)(82310400005)(8676002)(107886003)(83380400001)(47076005)(316002)(4326008)(426003)(1076003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 16:52:26.8356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f12393b8-c2fc-402d-33f8-08da5538c0ea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5012
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Add driver for Microchip EMC2301/2/3/5 RPM-based PWM Fan Speed Controller.
Modify Makefile and Kconfig to support Microchip EMC2305 RPM-based
PWM Fan Speed Controller.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
v3->v4
Changes pointed out by Guenter Roeck:
- Add error check in functions returns;
- Typo fix;
- Change error code in return;
- Change if case.
v2->v3
Changes pointed out by Guenter Roeck:
- Change casting from const pointer;
- Remove pwm_max per channel parameter.
Changes added by Michael Shych:
- Add pwm_separate field instead using of a special case of pwm_channel;
- Change the mechanism of obtaining a number of pwm channels.
v1->v2
Changes pointed out by Guenter Roeck:
- Remove unnecessary include;
- Standard multi-line comments form;
- Defines indentation;
- Remove unnecessary returns;
- Add validation of received dt parameters;
- Remove unnecessary brackets;
Changes added by Michael Shych:
- Fix initial PWM settings;
- Change PWM write in case of common PWM channel;
- Separate pwm-min, pwm-max per PWM channel.
---
 drivers/hwmon/Kconfig   |  13 +
 drivers/hwmon/Makefile  |   1 +
 drivers/hwmon/emc2305.c | 676 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 690 insertions(+)
 create mode 100644 drivers/hwmon/emc2305.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index fd2446cf343b..9fb6124af3dc 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1785,6 +1785,19 @@ config SENSORS_EMC2103
 	  This driver can also be built as a module. If so, the module
 	  will be called emc2103.
 
+config SENSORS_EMC2305
+	tristate "Microchip EMC2305 and compatible EMC2301/2/3"
+	depends on I2C
+	imply THERMAL
+	help
+	  If you say yes here you get support for the Microchip EMC2305
+	  fan controller chips.
+	  The Microchip EMC2305 is a fan controller for up to 5 fans.
+	  Fan rotation speeds are reported in RPM.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called emc2305.
+
 config SENSORS_EMC6W201
 	tristate "SMSC EMC6W201"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 007e829d1d0d..7706557dfa86 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_DS620)	+= ds620.o
 obj-$(CONFIG_SENSORS_DS1621)	+= ds1621.o
 obj-$(CONFIG_SENSORS_EMC1403)	+= emc1403.o
 obj-$(CONFIG_SENSORS_EMC2103)	+= emc2103.o
+obj-$(CONFIG_SENSORS_EMC2305)	+= emc2305.o
 obj-$(CONFIG_SENSORS_EMC6W201)	+= emc6w201.o
 obj-$(CONFIG_SENSORS_F71805F)	+= f71805f.o
 obj-$(CONFIG_SENSORS_F71882FG)	+= f71882fg.o
diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
new file mode 100644
index 000000000000..7c1a5e5c6977
--- /dev/null
+++ b/drivers/hwmon/emc2305.c
@@ -0,0 +1,676 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for EMC2305 fan controller
+ *
+ * Copyright (C) 2022 Nvidia Technologies Ltd and Delta Networks, Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/thermal.h>
+#include <linux/version.h>
+
+static const unsigned short
+emc2305_normal_i2c[] = { 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d, I2C_CLIENT_END };
+
+#define EMC2305_REG_DRIVE_FAIL_STATUS	0x27
+#define EMC2305_REG_DEVICE		0xfd
+#define EMC2305_REG_VENDOR		0xfe
+#define EMC2305_FAN_MAX			0xff
+#define EMC2305_FAN_MIN			0x00
+#define EMC2305_FAN_MAX_STATE		10
+#define EMC2305_DEVICE			0x34
+#define EMC2305_VENDOR			0x5d
+#define EMC2305_REG_PRODUCT_ID		0xfd
+#define EMC2305_TACH_REGS_UNUSE_BITS	3
+#define EMC2305_TACH_CNT_MULTIPLIER	0x02
+#define EMC2305_PWM_MAX			5
+
+#define EMC2305_PWM_DUTY2STATE(duty, max_state, pwm_max) \
+	(DIV_ROUND_CLOSEST((duty) * (max_state), (pwm_max)))
+#define EMC2305_PWM_STATE2DUTY(state, max_state, pwm_max) \
+	(DIV_ROUND_CLOSEST((state) * (pwm_max), (max_state)))
+
+/*
+ * Factor by equations [2] and [3] from data sheet; valid for fans where the number of edges
+ * equal (poles * 2 + 1).
+ */
+#define EMC2305_RPM_FACTOR		3932160
+
+#define EMC2305_REG_FAN_DRIVE(n)	(0x30 + 0x10 * (n))
+#define EMC2305_REG_FAN_MIN_DRIVE(n)	(0x38 + 0x10 * (n))
+#define EMC2305_REG_FAN_TACH(n)		(0x3e + 0x10 * (n))
+
+enum emc230x_product_id {
+	EMC2305 = 0x34,
+	EMC2303 = 0x35,
+	EMC2302 = 0x36,
+	EMC2301 = 0x37,
+};
+
+static const struct i2c_device_id emc2305_ids[] = {
+	{ "emc2305", 0 },
+	{ "emc2303", 0 },
+	{ "emc2302", 0 },
+	{ "emc2301", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, emc2305_ids);
+
+static const struct of_device_id emc2305_dt_ids[] = {
+	{ .compatible = "microchip,emc2305" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, emc2305_dt_ids);
+
+/**
+ * @cdev: cooling device;
+ * @curr_state: cooling current state;
+ * @last_hwmon_state: last cooling state updated by hwmon subsystem;
+ * @last_thermal_state: last cooling state updated by thermal subsystem;
+ *
+ * The 'last_hwmon_state' and 'last_thermal_state' fields are provided to support fan low limit
+ * speed feature. The purpose of this feature is to provides ability to limit fan speed
+ * according to some system wise considerations, like absence of some replaceable units (PSU or
+ * line cards), high system ambient temperature, unreliable transceivers temperature sensing or
+ * some other factors which indirectly impacts system's airflow
+ * Fan low limit feature is supported through 'hwmon' interface: 'hwmon' 'pwm' attribute is
+ * used for setting low limit for fan speed in case 'thermal' subsystem is configured in
+ * kernel. In this case setting fan speed through 'hwmon' will never let the 'thermal'
+ * subsystem to select a lower duty cycle than the duty cycle selected with the 'pwm'
+ * attribute.
+ * From other side, fan speed is to be updated in hardware through 'pwm' only in case the
+ * requested fan speed is above last speed set by 'thermal' subsystem, otherwise requested fan
+ * speed will be just stored with no PWM update.
+ */
+struct emc2305_cdev_data {
+	struct thermal_cooling_device *cdev;
+	unsigned int cur_state;
+	unsigned long last_hwmon_state;
+	unsigned long last_thermal_state;
+};
+
+/**
+ * @client: i2c client;
+ * @hwmon_dev: hwmon device;
+ * @max_state: maximum cooling state of the cooling device;
+ * @pwm_num: number of PWM channels;
+ * @pwm_separate: separate PWM settings for every channel;
+ * @pwm_min: array of minimum PWM per channel;
+ * @cdev_data: array of cooling devices data;
+ */
+struct emc2305_data {
+	struct i2c_client *client;
+	struct device *hwmon_dev;
+	u8 max_state;
+	u8 pwm_num;
+	bool pwm_separate;
+	u8 pwm_min[EMC2305_PWM_MAX];
+	struct emc2305_cdev_data cdev_data[EMC2305_PWM_MAX];
+};
+
+static char *emc2305_fan_name[] = {
+	"emc2305_fan",
+	"emc2305_fan1",
+	"emc2305_fan2",
+	"emc2305_fan3",
+	"emc2305_fan4",
+	"emc2305_fan5",
+};
+
+static void emc2305_unset_tz(struct device *dev);
+
+static int emc2305_get_max_channel(const struct emc2305_data *data)
+{
+	return data->pwm_num;
+}
+
+static int emc2305_get_cdev_idx(struct thermal_cooling_device *cdev)
+{
+	struct emc2305_data *data = cdev->devdata;
+	size_t len = strlen(cdev->type);
+	int ret;
+
+	if (len <= 0)
+		return -EINVAL;
+
+	/*
+	 * Returns index of cooling device 0..4 in case of separate PWM setting.
+	 * Zero index is used in case of one common PWM setting.
+	 * If the mode is not set as pwm_separate, all PWMs are to be bound
+	 * to the common thermal zone and should work at the same speed
+	 * to perform cooling for the same thermal junction.
+	 * Otherwise, return specific channel that will be used in bound
+	 * related PWM to the thermal zone.
+	 */
+	if (!data->pwm_separate)
+		return 0;
+
+	ret = cdev->type[len - 1];
+	switch (ret) {
+	case '1' ... '5':
+		return ret - '1';
+	default:
+		break;
+	}
+	return -EINVAL;
+}
+
+static int emc2305_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	int cdev_idx;
+	struct emc2305_data *data = cdev->devdata;
+
+	cdev_idx = emc2305_get_cdev_idx(cdev);
+	if (cdev_idx < 0)
+		return cdev_idx;
+
+	*state = data->cdev_data[cdev_idx].cur_state;
+	return 0;
+}
+
+static int emc2305_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	struct emc2305_data *data = cdev->devdata;
+	*state = data->max_state;
+	return 0;
+}
+
+static int emc2305_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
+{
+	int cdev_idx, ret;
+	struct emc2305_data *data = cdev->devdata;
+	struct i2c_client *client = data->client;
+	u8 val, i;
+
+	if (state > data->max_state)
+		return -EINVAL;
+
+	cdev_idx =  emc2305_get_cdev_idx(cdev);
+	if (cdev_idx < 0)
+		return cdev_idx;
+
+	/* Save thermal state. */
+	data->cdev_data[cdev_idx].last_thermal_state = state;
+	state = max_t(unsigned long, state, data->cdev_data[cdev_idx].last_hwmon_state);
+
+	val = EMC2305_PWM_STATE2DUTY(state, data->max_state, EMC2305_FAN_MAX);
+	if (val > EMC2305_FAN_MAX)
+		return -EINVAL;
+
+	data->cdev_data[cdev_idx].cur_state = state;
+	if (data->pwm_separate) {
+		ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(cdev_idx), val);
+		if (ret < 0)
+			return ret;
+	} else {
+		/*
+		 * Set the same PWM value in all channels
+		 * if common PWM channel is used.
+		 */
+		for (i = 0; i < data->pwm_num; i++) {
+			ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i), val);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops emc2305_cooling_ops = {
+	.get_max_state = emc2305_get_max_state,
+	.get_cur_state = emc2305_get_cur_state,
+	.set_cur_state = emc2305_set_cur_state,
+};
+
+static int emc2305_show_fault(struct device *dev, int channel)
+{
+	struct emc2305_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int status_reg;
+
+	status_reg = i2c_smbus_read_byte_data(client, EMC2305_REG_DRIVE_FAIL_STATUS);
+	if (status_reg < 0)
+		return status_reg;
+
+	return status_reg & (1 << channel) ? 1 : 0;
+}
+
+static int emc2305_show_fan(struct device *dev, int channel)
+{
+	struct emc2305_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int ret;
+
+	ret = i2c_smbus_read_word_swapped(client, EMC2305_REG_FAN_TACH(channel));
+	if (ret < 0)
+		return ret;
+
+	ret = ret >> EMC2305_TACH_REGS_UNUSE_BITS;
+	return EMC2305_RPM_FACTOR * EMC2305_TACH_CNT_MULTIPLIER / (ret > 0 ? ret : 1);
+}
+
+static int emc2305_show_pwm(struct device *dev, int channel)
+{
+	struct emc2305_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+
+	return i2c_smbus_read_byte_data(client, EMC2305_REG_FAN_DRIVE(channel));
+}
+
+static int emc2305_set_pwm(struct device *dev, long val, int channel)
+{
+	struct emc2305_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	int ret;
+
+	if (val < data->pwm_min[channel] || val > EMC2305_FAN_MAX)
+		return -EINVAL;
+
+	ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(channel), val);
+	if (ret < 0)
+		return ret;
+	data->cdev_data[channel].cur_state = EMC2305_PWM_DUTY2STATE(val, data->max_state,
+								    EMC2305_FAN_MAX);
+	return 0;
+}
+
+static int emc2305_get_tz_of(struct device *dev)
+{
+	struct device_node *pwm_np, *np = dev->of_node;
+	struct emc2305_data *data = dev_get_drvdata(dev);
+	int i = 0, ret = 0;
+	u8 tmp;
+
+	/*
+	 * OF parameters are optional - overwrite default setting
+	 * if some of them are provided.
+	 */
+
+	if (of_find_property(np, "microchip,cooling-levels", NULL)) {
+		ret = of_property_read_u8(np, "microchip,cooling-levels", &tmp);
+		if (ret)
+			return ret;
+		else if (!data->max_state || tmp > EMC2305_FAN_MAX_STATE)
+			return -EINVAL;
+
+		data->max_state = tmp;
+	}
+
+	if (of_property_read_bool(np, "microchip,pwm-separate"))
+		data->pwm_separate = true;
+
+	/* PWM_MIN can be any value in range 0..255 */
+	for_each_child_of_node(np, pwm_np) {
+		if (of_find_property(pwm_np, "pwm-min", NULL)) {
+			ret = of_property_read_u8(pwm_np, "pwm-min", &tmp);
+			if (ret) {
+				of_node_put(pwm_np);
+				return ret;
+			} else if (tmp > EMC2305_FAN_MAX) {
+				of_node_put(pwm_np);
+				return -EINVAL;
+			}
+			data->pwm_min[i] = tmp;
+		}
+		i++;
+	}
+	/*
+	 * Number of active pwm channels can be less than maximum
+	 * suppoerted by device.
+	 */
+	if (i > 0 && i < data->pwm_num)
+		data->pwm_num = i;
+
+	return ret;
+}
+
+static int emc2305_set_single_tz(struct device *dev, int idx)
+{
+	struct emc2305_data *data = dev_get_drvdata(dev);
+	long pwm;
+	int i, cdev_idx, ret;
+
+	cdev_idx = (idx) ? idx - 1 : 0;
+	pwm = data->pwm_min[cdev_idx];
+
+	if (dev->of_node)
+		data->cdev_data[cdev_idx].cdev =
+			devm_thermal_of_cooling_device_register(dev, dev->of_node,
+								emc2305_fan_name[idx], data,
+								&emc2305_cooling_ops);
+	else
+		data->cdev_data[cdev_idx].cdev =
+			thermal_cooling_device_register(emc2305_fan_name[idx], data,
+							&emc2305_cooling_ops);
+
+	if (IS_ERR(data->cdev_data[cdev_idx].cdev)) {
+		dev_err(dev, "Failed to register cooling device %s\n", emc2305_fan_name[idx]);
+		return PTR_ERR(data->cdev_data[cdev_idx].cdev);
+	}
+	/* Set minimal PWM speed. */
+	if (data->pwm_separate) {
+		ret = emc2305_set_pwm(dev, pwm, cdev_idx);
+		if (ret < 0)
+			return ret;
+	} else {
+		for (i = 0; i < data->pwm_num; i++) {
+			ret = emc2305_set_pwm(dev, pwm, i);
+			if (ret < 0)
+				return ret;
+		}
+	}
+	data->cdev_data[cdev_idx].cur_state =
+		EMC2305_PWM_DUTY2STATE(data->pwm_min[cdev_idx], data->max_state,
+				       EMC2305_FAN_MAX);
+	data->cdev_data[cdev_idx].last_hwmon_state =
+		EMC2305_PWM_DUTY2STATE(data->pwm_min[cdev_idx], data->max_state,
+				       EMC2305_FAN_MAX);
+	return 0;
+}
+
+static int emc2305_set_tz(struct device *dev)
+{
+	struct emc2305_data *data = dev_get_drvdata(dev);
+	int i, ret;
+
+	if (!data->pwm_separate)
+		return emc2305_set_single_tz(dev, 0);
+
+	for (i = 0; i < data->pwm_num; i++) {
+		ret = emc2305_set_single_tz(dev, i + 1);
+		if (ret)
+			goto thermal_cooling_device_register_fail;
+	}
+	return 0;
+
+thermal_cooling_device_register_fail:
+	emc2305_unset_tz(dev);
+	return ret;
+}
+
+static void emc2305_unset_tz(struct device *dev)
+{
+	struct emc2305_data *data = dev_get_drvdata(dev);
+	int i;
+
+	/*
+	 * Unregister cooling device in case they have been registered by
+	 * thermal_cooling_device_register(). Clean-up flow in case they
+	 * have been registered by devm_thermal_of_cooling_device_register()
+	 * will be done automatically, no need in unwind function.
+	 */
+	if (!dev->of_node) {
+		for (i = 0; i < EMC2305_PWM_MAX; i++)
+			if (data->cdev_data[i].cdev)
+				thermal_cooling_device_unregister(data->cdev_data[i].cdev);
+	}
+}
+
+static umode_t
+emc2305_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr, int channel)
+{
+	int max_channel = emc2305_get_max_channel(data);
+
+	/* Don't show channels which are not physically connected. */
+	if (channel >= max_channel)
+		return 0;
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			return 0444;
+		case hwmon_fan_fault:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+};
+
+static int
+emc2305_write(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel, long val)
+{
+	struct emc2305_data *data = dev_get_drvdata(dev);
+	int cdev_idx;
+
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			/* If thermal is configured - handle PWM limit setting. */
+			if (IS_REACHABLE(CONFIG_THERMAL)) {
+				if (data->pwm_separate)
+					cdev_idx = channel;
+				else
+					cdev_idx = 0;
+				data->cdev_data[cdev_idx].last_hwmon_state =
+					EMC2305_PWM_DUTY2STATE(val, data->max_state,
+							       EMC2305_FAN_MAX);
+				/*
+				 * Update PWM only in case requested state is not less than the
+				 * last thermal state.
+				 */
+				if (data->cdev_data[cdev_idx].last_hwmon_state >=
+				    data->cdev_data[cdev_idx].last_thermal_state)
+					return emc2305_set_cur_state(data->cdev_data[cdev_idx].cdev,
+							data->cdev_data[cdev_idx].last_hwmon_state);
+				return 0;
+			}
+			return emc2305_set_pwm(dev, val, channel);
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+};
+
+static int
+emc2305_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel, long *val)
+{
+	int ret;
+
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			ret = emc2305_show_fan(dev, channel);
+			if (ret < 0)
+				return ret;
+			*val = ret;
+			return 0;
+		case hwmon_fan_fault:
+			ret = emc2305_show_fault(dev, channel);
+			if (ret < 0)
+				return ret;
+			*val = ret;
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			ret = emc2305_show_pwm(dev, channel);
+			if (ret < 0)
+				return ret;
+			*val = ret;
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+};
+
+static const struct hwmon_ops emc2305_ops = {
+	.is_visible = emc2305_is_visible,
+	.read = emc2305_read,
+	.write = emc2305_write,
+};
+
+static const struct hwmon_channel_info *emc2305_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info emc2305_chip_info = {
+	.ops = &emc2305_ops,
+	.info = emc2305_info,
+};
+
+static int emc2305_identify(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct emc2305_data *data = i2c_get_clientdata(client);
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(client, EMC2305_REG_PRODUCT_ID);
+	if (ret < 0)
+		return ret;
+
+	switch (ret) {
+	case EMC2305:
+		data->pwm_num = 5;
+		break;
+	case EMC2303:
+		data->pwm_num = 3;
+		break;
+	case EMC2302:
+		data->pwm_num = 2;
+		break;
+	case EMC2301:
+		data->pwm_num = 1;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int emc2305_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct i2c_adapter *adapter = client->adapter;
+	struct device *dev = &client->dev;
+	struct emc2305_data *data;
+	int vendor, device;
+	int ret;
+	int i;
+
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
+		return -ENODEV;
+
+	vendor = i2c_smbus_read_byte_data(client, EMC2305_REG_VENDOR);
+	if (vendor != EMC2305_VENDOR)
+		return -ENODEV;
+
+	device = i2c_smbus_read_byte_data(client, EMC2305_REG_DEVICE);
+	if (device != EMC2305_DEVICE)
+		return -ENODEV;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, data);
+	data->client = client;
+
+	ret = emc2305_identify(dev);
+	if (ret)
+		return ret;
+
+	data->max_state = EMC2305_FAN_MAX_STATE;
+	data->pwm_separate =  false;
+	for (i = 0; i < EMC2305_PWM_MAX; i++)
+		data->pwm_min[i] = EMC2305_FAN_MIN;
+	if (dev->of_node) {
+		ret = emc2305_get_tz_of(dev);
+		if (ret < 0)
+			return ret;
+	}
+
+	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "emc2305", data,
+							       &emc2305_chip_info, NULL);
+	if (IS_ERR(data->hwmon_dev))
+		return PTR_ERR(data->hwmon_dev);
+
+	if (IS_REACHABLE(CONFIG_THERMAL)) {
+		ret = emc2305_set_tz(dev);
+		if (ret != 0)
+			return ret;
+	}
+
+	for (i = 0; i < data->pwm_num; i++) {
+		ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_MIN_DRIVE(i),
+						data->pwm_min[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int emc2305_remove(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+
+	if (IS_REACHABLE(CONFIG_THERMAL))
+		emc2305_unset_tz(dev);
+	return 0;
+}
+
+static struct i2c_driver emc2305_driver = {
+	.class  = I2C_CLASS_HWMON,
+	.driver = {
+		.name = "emc2305",
+		.of_match_table = emc2305_dt_ids,
+	},
+	.probe    = emc2305_probe,
+	.remove	  = emc2305_remove,
+	.id_table = emc2305_ids,
+	.address_list = emc2305_normal_i2c,
+};
+
+module_i2c_driver(emc2305_driver);
+
+MODULE_AUTHOR("Nvidia");
+MODULE_DESCRIPTION("Microchip EMC2305 fan controller driver");
+MODULE_LICENSE("GPL");
-- 
2.14.1

