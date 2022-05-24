Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1F1C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 May 2022 16:18:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239063AbiEXQSS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 May 2022 12:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239073AbiEXQSL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 May 2022 12:18:11 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151494FC4B;
        Tue, 24 May 2022 09:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gwi+aozYr2PJwAnRTM47Iz3A1K6WGSPnvuFAX1NjT7nwz4W5A6s1I3/KX3/fIIqxSw7YT9krRWnpj32yZhbcQVc0nYNWFvWO2+1X0VKzOp8wk/fAW1r5R/TpTmIdUeaoTLzEWSF4gXMnxOHBjSbCSyv3WKgFcpGG4987AEQJULyR1tGnPv4hb6HIvoYbcN4m1oUmX14up0BnCXCTStO5TmA36kN1LhfNqB3EKwkLzcADrTQ18MGN3Wr35XAhJ8osTH7qdA+68H1bDfnS9kqGrG3dBEoucZ9MX+Bmyovd7JoYUSNOVzG8zkcw6Y3Ywmq36Cikj3dlLXBv5yI28OzhBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMGuZfDEF8fmCD5YramSuF7EUPRW7YxXWZ39UCFnbaM=;
 b=arQgZLr59oIDH+nIJeIfZ4MhRRNYTC32/pefiY5k7sLq5SbF1ePXLPfLlsf6AFEVP6vbv+XdUFZKRNiOYCXYterfeKxqPjldRQnau48zznYQQFoEj5HhG+grx7bDes9YA+gPVnwAhD7f5Sq2JgJetrYzIV5KfiMxFjskkC3p3J5oPMsKHGz2HWrlVR1hT53hT0C3FAl37skzzuIqI5e2WiU2W093+6nj98hq5JeRq8gm6yFC38GEb/4jnhimkaGSoVWlGX/CLwk5O7tR+of+uoKNHUqxi8exPBt0ZzdxDXE9LIei3O0wW4caj0gxv/bm4fxzVQPh59ngJ2eN7PHRbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMGuZfDEF8fmCD5YramSuF7EUPRW7YxXWZ39UCFnbaM=;
 b=Y8aOAh+mVb+SV/EruoAAC/xsiMkuw+hh+xu+qCathBgFdO/6V24q27wYUBzpyRl7c3jjl+35BKDBHfefyc9SQv9Lmy4FEh0ZajcSDVLPZqMBerA1azqdd8Y19u2dkDY99W7cDK9u7MTIRoX72gDvd0KrisoJ5EXrR3t2BRqbIaxHAvM4xccAc1CsTOU1UyrYEjshoLFnLjUs0uNjllr5YRQr1pzLwPxUK8mTge6SONVFQxrC4iwQSvxoYI/pfIk7pOihpJO1XozaxZCN40zgouXEY6TcP6D87mROy/J7hfxGIvzATQh0+MLJYvDNNcbFdP98g1Vnn7aEVJMZ/gP0Mw==
Received: from MWHPR15CA0028.namprd15.prod.outlook.com (2603:10b6:300:ad::14)
 by SN6PR12MB4765.namprd12.prod.outlook.com (2603:10b6:805:e4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Tue, 24 May
 2022 16:18:06 +0000
Received: from CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::4b) by MWHPR15CA0028.outlook.office365.com
 (2603:10b6:300:ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23 via Frontend
 Transport; Tue, 24 May 2022 16:18:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT068.mail.protection.outlook.com (10.13.175.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 16:18:06 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Tue, 24 May
 2022 16:18:03 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 24 May
 2022 09:18:02 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Tue, 24 May 2022 09:18:00 -0700
From:   <michaelsh@nvidia.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH hwmon-next v2 1/3] hwmon: (emc2305) add support for EMC2301/2/3/5 RPM-based PWM Fan Speed Controller.
Date:   Tue, 24 May 2022 19:17:53 +0300
Message-ID: <20220524161755.43833-2-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220524161755.43833-1-michaelsh@nvidia.com>
References: <20220524161755.43833-1-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8439dcb-cb31-4fdd-a14d-08da3da0fc56
X-MS-TrafficTypeDiagnostic: SN6PR12MB4765:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB4765E8831734E3C70411DA0DD4D79@SN6PR12MB4765.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rL5lLhsHfCWDvcqNUTxzUj6/r+NwolHrRAnFY8ldKOEh+fSBOeCDqSNcMHJWj1msqGT4RmQzHRELloBb/DvGjOs04o3EuNlIfg/hHCWTKXD1drGezDYdPlgPWLqY5V2+OLMW2H0eQd/ZO4cSxjt6QYukrf5/Dw3+W5GIZVKm4br4JdzRklQzk9G5fsIU4L/NJkHbj/GM2oDG4aaSPVHXFxY2gkr1EhVj33pk9FNvrJK6lwV+ICLct8j6HALLBhNsvvCER7EDL3dVF2xsZKuJ48Vn37A6e81xYeIYXsgdV0Pt+Q2Z+F/7aDjYKSvGjfz9cGkUx1TUPQ7Lz0+Vq0NC2XEWI9jETMMRWex5DmqdDRu7bG36h99AWmZUHjaxxPZ4MSA4OcSHs2oB+4R+ngGE0Sx6F8Si/tFEHkRmUYg1HiLKofXbFifAMW7e11eMIMaLFyYLpQxEEao0QAAVhW4ZkDsk7W7kdjzEZnSsk6qgwRbOLLXXnXwE1z/ixX7pCVUirHCP6C2gj8bv+SghDeCFXejyn7tuHf3GX7jB7CmwTpd2r9joI5uvtNSeFdzaaEEzBj7Ppli72cyx/i93meOn2subtJytrLIG6meS3aoZ6LAVXojuYkQCi/8JXEFdMDdAIKcy6jLXm5r8wq8b/rBzpDvWUqMuui1Vw7+aSBSM7IdA2dV8Vjb7YJUiki7eAHz61FpASS0oOVuuZ74tzYAEtA==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2616005)(83380400001)(107886003)(26005)(186003)(2906002)(356005)(70586007)(70206006)(2876002)(5660300002)(336012)(47076005)(81166007)(426003)(8676002)(82310400005)(4326008)(1076003)(8936002)(508600001)(36860700001)(36756003)(86362001)(316002)(54906003)(110136005)(6666004)(30864003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 16:18:06.2850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8439dcb-cb31-4fdd-a14d-08da3da0fc56
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4765
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
- Change PWM write in case of common PWM channel.
- Separate pwm-min, pwm-max per PWM channel
---
 drivers/hwmon/Kconfig   |  13 +
 drivers/hwmon/Makefile  |   1 +
 drivers/hwmon/emc2305.c | 677 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 691 insertions(+)
 create mode 100644 drivers/hwmon/emc2305.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 590d3d550acb..642d56e42476 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1780,6 +1780,19 @@ config SENSORS_EMC2103
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
index 000000000000..fd8adff6c2b6
--- /dev/null
+++ b/drivers/hwmon/emc2305.c
@@ -0,0 +1,677 @@
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
+#define EMC2305_PWM_CHNL_CMN		0
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
+ * @pwm_max: array of maximum PWM per channel;
+ * @pwm_min: array of minimum PWM per channel;
+ * @pwm_channel: maximum number of PWM channels;
+ * @cdev_data: array of cooling devices data;
+ */
+struct emc2305_data {
+	struct i2c_client *client;
+	struct device *hwmon_dev;
+	u8 max_state;
+	u8 pwm_num;
+	u8 pwm_channel;
+	u8 pwm_max[EMC2305_PWM_MAX];
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
+static int emc2305_get_max_channel(struct emc2305_data *data)
+{
+	if (data->pwm_channel == EMC2305_PWM_CHNL_CMN)
+		return data->pwm_num;
+
+	return data->pwm_channel;
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
+	 * Retuns index of cooling device 0..4 in case of separate PWM setting.
+	 * Zero index is used in case of one common PWM setting.
+	 * If the mode is set as EMC2305_PWM_CHNL_CMN, all PWMs are to be bound
+	 * to the common thermal zone and should work at the same speed
+	 * to perform cooling for the same thermal junction.
+	 * Otherwise, return specific channel that will be used in bound
+	 * related PWM to the thermal zone.
+	 */
+	if (data->pwm_channel == EMC2305_PWM_CHNL_CMN)
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
+	int cdev_idx;
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
+	val = EMC2305_PWM_STATE2DUTY(state, data->max_state, data->pwm_max[cdev_idx]);
+	if (val > EMC2305_FAN_MAX)
+		return -EINVAL;
+
+	data->cdev_data[cdev_idx].cur_state = state;
+	if (data->pwm_channel == EMC2305_PWM_CHNL_CMN)
+	/*
+	 * Set the same PWM value in all channels
+	 * if common PWM channel is used.
+	 */
+		for (i = 0; i < data->pwm_num; i++)
+			i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i), val);
+	else
+		i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(cdev_idx), val);
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
+
+	if (val < data->pwm_min[channel] || val > data->pwm_max[channel])
+		return -EINVAL;
+
+	i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(channel), val);
+	data->cdev_data[channel].cur_state = EMC2305_PWM_DUTY2STATE(val, data->max_state,
+								    data->pwm_max[channel]);
+	return 0;
+}
+
+static int emc2305_get_tz_of(struct device *dev)
+{
+	struct device_node *pwms_np, *pwm_np, *np = dev->of_node;
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
+	/*
+	 * Not defined or 0 means one thermal zone over all cooling device.
+	 * Otherwise - separate thermal zones for each PWM channel.
+	 */
+	if (of_find_property(np, "microchip,pwm-channel", NULL)) {
+		ret = of_property_read_u8(np, "microchip,pwm-channel", &tmp);
+		if (ret)
+			return ret;
+		else if (tmp > data->pwm_num)
+			return -EINVAL;
+
+		data->pwm_channel = tmp;
+	}
+
+	/* PWM_MAX and PWM_MIN can be any value in range 0..255 */
+	pwms_np = of_get_child_by_name(np, "microchip,pwms");
+	if (pwms_np) {
+		for_each_child_of_node(pwms_np, pwm_np) {
+			if (of_find_property(pwm_np, "pwm-max", NULL)) {
+				ret = of_property_read_u8(pwm_np, "pwm-max", &data->pwm_max[i]);
+				if (ret) {
+					of_node_put(pwm_np);
+					return ret;
+				}
+			}
+
+			if (of_find_property(pwm_np, "pwm-min", NULL)) {
+				ret = of_property_read_u8(pwm_np, "pwm-min", &tmp);
+				if (ret) {
+					of_node_put(pwm_np);
+					return ret;
+				} else if (tmp > data->pwm_max[i]) {
+					of_node_put(pwm_np);
+					return -EINVAL;
+				}
+				data->pwm_min[i] = tmp;
+			}
+			i++;
+		}
+	}
+
+	return ret;
+}
+
+static int emc2305_set_single_tz(struct device *dev, int idx)
+{
+	struct emc2305_data *data = dev_get_drvdata(dev);
+	long pwm;
+	int i, cdev_idx;
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
+	if (data->pwm_channel == EMC2305_PWM_CHNL_CMN)
+		for (i = 0; i < data->pwm_num; i++)
+			emc2305_set_pwm(dev, pwm, i);
+	else
+		emc2305_set_pwm(dev, pwm, cdev_idx);
+	data->cdev_data[cdev_idx].cur_state =
+		EMC2305_PWM_DUTY2STATE(data->pwm_min[cdev_idx], data->max_state,
+				       data->pwm_max[cdev_idx]);
+	data->cdev_data[cdev_idx].last_hwmon_state =
+		EMC2305_PWM_DUTY2STATE(data->pwm_min[cdev_idx], data->max_state,
+				       data->pwm_max[cdev_idx]);
+	return 0;
+}
+
+static int emc2305_set_tz(struct device *dev)
+{
+	struct emc2305_data *data = dev_get_drvdata(dev);
+	int i, ret;
+
+	if (data->pwm_channel == EMC2305_PWM_CHNL_CMN)
+		return emc2305_set_single_tz(dev, 0);
+
+	for (i = 0; i < data->pwm_channel; i++) {
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
+	int max_channel = emc2305_get_max_channel((struct emc2305_data *)data);
+
+	/* Don't show channels which are not physically connected. */
+	if (channel + 1 > max_channel)
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
+				if (data->pwm_channel == EMC2305_PWM_CHNL_CMN)
+					cdev_idx = 0;
+				else
+					cdev_idx = channel;
+				data->cdev_data[cdev_idx].last_hwmon_state =
+					EMC2305_PWM_DUTY2STATE(val, data->max_state,
+							       data->pwm_max[cdev_idx]);
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
+		return -EINVAL;
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
+	data->pwm_channel = EMC2305_PWM_CHNL_CMN;
+	for (i = 0; i < EMC2305_PWM_MAX; i++) {
+		data->pwm_max[i] = EMC2305_FAN_MAX;
+		data->pwm_min[i] = EMC2305_FAN_MIN;
+	}
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
+	for (i = 0; i < data->pwm_num; i++)
+		i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_MIN_DRIVE(i), data->pwm_min[i]);
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

