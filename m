Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B631EC4338F
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 13:36:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CC2F60C51
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 13:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233194AbhGZM4H (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jul 2021 08:56:07 -0400
Received: from mail-dm6nam10on2086.outbound.protection.outlook.com ([40.107.93.86]:58489
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232527AbhGZM4G (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jul 2021 08:56:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKCbkWW8Kt+zgnU1sGwgZ1p2dEoOsUr1l+mLLvkbBUXh6HfnUWYWpGHghXVNRHpRVa4vgALPd+PgLTSVLxivkRkCvzreE6nFvF1PpJKR4+fLNaqqWV6jJMKi3ZBfZWvw11iM+xJFDhHxbRoflOqcU2/4ks+qXBwFxSTcNUhia+kWQ33NKeYeoupU3iqhm6D+Uo+k0VF8JxlawOD6JZtAeAITGHO4Y3ToXS+vloTXx2x0tX72Pf4g5pBp1LmvRMTUJzF8YBptGq7UD/dtIm8RqBHHBD0nxDylJ29YVmvVP2wvv6+dtW9U7qte5gcFkeDK4JxmMWdJWYdmf1X1gz/HyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuPETK2ryHuGEQzZzjQcc0lwAhB46Qx+ekIufVMaJz8=;
 b=klWk+rHlspyRatVnhHd7PtJpFBTmmuMS00mAi+W8vQ81a9ymlb1Zay0UHOUTWDAgk/VcPpCbaqzbZIyBIN7vlkmcSTsZ7Fj8WnLm3eKI1/s6SqClkDeQLqBhgZvQd+Xpn902+lmmWWcTa5utU0nQtXzG+Qv0vJARgC6ElEAYQr1dJ52z8jFTocO0xoHpb4smk9VIHGd92csJTfjw6u5L6A5nbmrpxJNxkTvMKPGRiXgENzWBZpkKZ7PvB5+9ZBKEYlwEpaS1Pl5pkfFppWllGuc0rKyMzl91wO92upTd2FhpVpA86Z4MxsigRubBScGda6IISeuodRRoduxBFCMqwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuPETK2ryHuGEQzZzjQcc0lwAhB46Qx+ekIufVMaJz8=;
 b=uoaJLz/snyRhsdkTsoMwzs7sOomRFRHqwqvHk0tHgkyah/Z5xaF666fbsEv9K+mjy3EPlZvbOxJQCF/tOTfvpliW99rZ0f09H+mqfrLlWAYjdmq3Flzvg4dF+RKxzsodIjPlxujPdex1RhCYPkjU1hlRKUGhS8DLSU0ca0ZHbBo=
Received: from MWHPR10CA0060.namprd10.prod.outlook.com (2603:10b6:300:2c::22)
 by BN8PR12MB3009.namprd12.prod.outlook.com (2603:10b6:408:42::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Mon, 26 Jul
 2021 13:36:33 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::3) by MWHPR10CA0060.outlook.office365.com
 (2603:10b6:300:2c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Mon, 26 Jul 2021 13:36:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Mon, 26 Jul 2021 13:36:32 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 26 Jul
 2021 08:36:29 -0500
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <linux@roeck-us.net>, <robh@kernel.org>, <jdelvare@suse.com>,
        <broonie@kernel.org>, Akshay Gupta <Akshay.Gupta@amd.com>,
        "Naveen Krishna Chatradhi" <nchatrad@amd.com>
Subject: [PATCH v4 1/3] hwmon: sbrmi: Add support for sbrmi power module
Date:   Mon, 26 Jul 2021 19:06:13 +0530
Message-ID: <20210726133615.9709-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625132544.18094-1-nchatrad@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95699e5d-3886-46ef-e4cf-08d9503a61b6
X-MS-TrafficTypeDiagnostic: BN8PR12MB3009:
X-Microsoft-Antispam-PRVS: <BN8PR12MB30091E847B67106DBA644E0BE8E89@BN8PR12MB3009.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: orCXlPAWD7V7tV/HWbR7XPzSZa5jiESRBDwI1ImtRjUCHuZCrTB1XKdQgvorw9ryggZj5Y27/iyVfSihrZTQfbBf5x8Vx2bACmktl3XX9ZqnkvqM8Dl9bIF09D0waHreFmLv4YTYZPkjabcPSQNTfTH+bE9CUmuTKFc7dPa7kFlwDK6gknzH+NqR8pmPTMR9V7qfsHy6R2esCiHPSBe7vJBr6UE1a2UIdvQokxDaXyoMVHnkr8OgSFNKJ0gSPch+NMu+aZ8aA4ytNASngF0niofTJKIRgsPCZihOaHFk9zRptfvBMBZR0EhVn+LgxSEaDOgEiCqRaiLu+lZRlUlkbHixkaUolUz/xV5PlgCzWG3AH7C2fDYT9JrzH1glnydFh0532XCOpthh+qf+vy6feRpkG73zRcms9IZS1bnkX8S1PQkePcC3spZagWDfe5Kz21w/qLFOJ4suwPpQGTVl+z+36ScCWK+0dvlJLw4v30W33nduW6EmgOu5J26uU2SZper98Rpkg0pZ0hV3K5oBEIOoFPzaUEojgG4nHg8p4C3uDqKzp7RRGbtIxsdtwOJp3xecm0ngLNHBwBcDIkv34duTtMV1VARUCDvgZZPgZ7n6eVPNbZSTz8jbFQRPQ/CWVUAPuemS9g0l1a28N4pxc5Nx2De3eFuHK+lTBS/mh/13Pz/L1ztGhT52wgPDfGd4fd8HiwWHifmhz/PkHZHL9fTAFhd1VbuAcRZlOwibJ2g=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(36840700001)(46966006)(70586007)(70206006)(16526019)(478600001)(26005)(36860700001)(426003)(2616005)(54906003)(82310400003)(36756003)(110136005)(47076005)(1076003)(336012)(82740400003)(316002)(5660300002)(81166007)(6666004)(8676002)(186003)(83380400001)(4326008)(30864003)(7696005)(2906002)(8936002)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 13:36:32.5648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95699e5d-3886-46ef-e4cf-08d9503a61b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3009
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Akshay Gupta <Akshay.Gupta@amd.com>

On AMD platforms the Out-of-band access is provided by
Advanced Platform Management Link (APML), APML is a
SMBus v2.0 compatible 2-wire processor client interface.
APML is also referred as the sideband interface (SBI).

APML is used to communicate with the
Side-Band Remote Management Interface (SB-RMI) which provides
Soft Mailbox messages to manage power consumption and
power limits of the CPU socket.

- This module add support to read power consumption,
  power limit & max power limit and write power limit.
- To instantiate this driver on a Board Management Controller (BMC)
  connected to an AMD CPU with SB-RMI support, the i2c bus number
  would be the bus connected from the BMC to the CPU.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v3:
Added reviewed by Guenter Roeck

 drivers/hwmon/Kconfig  |  10 ++
 drivers/hwmon/Makefile |   1 +
 drivers/hwmon/sbrmi.c  | 358 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 369 insertions(+)
 create mode 100644 drivers/hwmon/sbrmi.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 87624902ea80..f489972a6309 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1551,6 +1551,16 @@ config SENSORS_SBTSI
 	  This driver can also be built as a module. If so, the module will
 	  be called sbtsi_temp.
 
+config SENSORS_SBRMI
+	tristate "Emulated SB-RMI sensor"
+	depends on I2C
+	help
+	  If you say yes here you get support for emulated RMI
+	  sensors on AMD SoCs with APML interface connected to a BMC device.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called sbrmi.
+
 config SENSORS_SHT15
 	tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
 	depends on GPIOLIB || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 59e78bc212cf..8031acf58936 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -164,6 +164,7 @@ obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_S3C)	+= s3c-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
+obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
 obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c
new file mode 100644
index 000000000000..372b099c04a0
--- /dev/null
+++ b/drivers/hwmon/sbrmi.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * sbrmi.c - hwmon driver for a SB-RMI mailbox
+ *           compliant AMD SoC device.
+ *
+ * Copyright (C) 2020-2021 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+
+/* Do not allow setting negative power limit */
+#define SBRMI_PWR_MIN	0
+/* Mask for Status Register bit[1] */
+#define SW_ALERT_MASK	0x2
+
+/* Software Interrupt for triggering */
+#define START_CMD	0x80
+#define TRIGGER_MAILBOX	0x01
+
+/*
+ * SB-RMI supports soft mailbox service request to MP1 (power management
+ * firmware) through SBRMI inbound/outbound message registers.
+ * SB-RMI message IDs
+ */
+enum sbrmi_msg_id {
+	SBRMI_READ_PKG_PWR_CONSUMPTION = 0x1,
+	SBRMI_WRITE_PKG_PWR_LIMIT,
+	SBRMI_READ_PKG_PWR_LIMIT,
+	SBRMI_READ_PKG_MAX_PWR_LIMIT,
+};
+
+/* SB-RMI registers */
+enum sbrmi_reg {
+	SBRMI_CTRL		= 0x01,
+	SBRMI_STATUS,
+	SBRMI_OUTBNDMSG0	= 0x30,
+	SBRMI_OUTBNDMSG1,
+	SBRMI_OUTBNDMSG2,
+	SBRMI_OUTBNDMSG3,
+	SBRMI_OUTBNDMSG4,
+	SBRMI_OUTBNDMSG5,
+	SBRMI_OUTBNDMSG6,
+	SBRMI_OUTBNDMSG7,
+	SBRMI_INBNDMSG0,
+	SBRMI_INBNDMSG1,
+	SBRMI_INBNDMSG2,
+	SBRMI_INBNDMSG3,
+	SBRMI_INBNDMSG4,
+	SBRMI_INBNDMSG5,
+	SBRMI_INBNDMSG6,
+	SBRMI_INBNDMSG7,
+	SBRMI_SW_INTERRUPT,
+};
+
+/* Each client has this additional data */
+struct sbrmi_data {
+	struct i2c_client *client;
+	struct mutex lock;
+	u32 pwr_limit_max;
+};
+
+struct sbrmi_mailbox_msg {
+	u8 cmd;
+	bool read;
+	u32 data_in;
+	u32 data_out;
+};
+
+static int sbrmi_enable_alert(struct i2c_client *client)
+{
+	int ctrl;
+
+	/*
+	 * Enable the SB-RMI Software alert status
+	 * by writing 0 to bit 4 of Control register(0x1)
+	 */
+	ctrl = i2c_smbus_read_byte_data(client, SBRMI_CTRL);
+	if (ctrl < 0)
+		return ctrl;
+
+	if (ctrl & 0x10) {
+		ctrl &= ~0x10;
+		return i2c_smbus_write_byte_data(client,
+						 SBRMI_CTRL, ctrl);
+	}
+
+	return 0;
+}
+
+static int rmi_mailbox_xfer(struct sbrmi_data *data,
+			    struct sbrmi_mailbox_msg *msg)
+{
+	int i, ret, retry = 10;
+	int sw_status;
+	u8 byte;
+
+	mutex_lock(&data->lock);
+
+	/* Indicate firmware a command is to be serviced */
+	ret = i2c_smbus_write_byte_data(data->client,
+					SBRMI_INBNDMSG7, START_CMD);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/* Write the command to SBRMI::InBndMsg_inst0 */
+	ret = i2c_smbus_write_byte_data(data->client,
+					SBRMI_INBNDMSG0, msg->cmd);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/*
+	 * For both read and write the initiator (BMC) writes
+	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
+	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
+	 */
+	for (i = 0; i < 4; i++) {
+		byte = (msg->data_in >> i * 8) & 0xff;
+		ret = i2c_smbus_write_byte_data(data->client,
+						SBRMI_INBNDMSG1 + i, byte);
+		if (ret < 0)
+			goto exit_unlock;
+	}
+
+	/*
+	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
+	 * perform the requested read or write command
+	 */
+	ret = i2c_smbus_write_byte_data(data->client,
+					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/*
+	 * Firmware will write SBRMI::Status[SwAlertSts]=1 to generate
+	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
+	 * of the requested command
+	 */
+	do {
+		sw_status = i2c_smbus_read_byte_data(data->client,
+						     SBRMI_STATUS);
+		if (sw_status < 0) {
+			ret = sw_status;
+			goto exit_unlock;
+		}
+		if (sw_status & SW_ALERT_MASK)
+			break;
+		usleep_range(50, 100);
+	} while (retry--);
+
+	if (retry < 0) {
+		dev_err(&data->client->dev,
+			"Firmware fail to indicate command completion\n");
+		ret = -EIO;
+		goto exit_unlock;
+	}
+
+	/*
+	 * For a read operation, the initiator (BMC) reads the firmware
+	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
+	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
+	 */
+	if (msg->read) {
+		for (i = 0; i < 4; i++) {
+			ret = i2c_smbus_read_byte_data(data->client,
+						       SBRMI_OUTBNDMSG1 + i);
+			if (ret < 0)
+				goto exit_unlock;
+			msg->data_out |= ret << i * 8;
+		}
+	}
+
+	/*
+	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
+	 * ALERT to initiator
+	 */
+	ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
+					sw_status | SW_ALERT_MASK);
+
+exit_unlock:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long *val)
+{
+	struct sbrmi_data *data = dev_get_drvdata(dev);
+	struct sbrmi_mailbox_msg msg = { 0 };
+	int ret;
+
+	if (type != hwmon_power)
+		return -EINVAL;
+
+	msg.read = true;
+	switch (attr) {
+	case hwmon_power_input:
+		msg.cmd = SBRMI_READ_PKG_PWR_CONSUMPTION;
+		ret = rmi_mailbox_xfer(data, &msg);
+		break;
+	case hwmon_power_cap:
+		msg.cmd = SBRMI_READ_PKG_PWR_LIMIT;
+		ret = rmi_mailbox_xfer(data, &msg);
+		break;
+	case hwmon_power_cap_max:
+		msg.data_out = data->pwr_limit_max;
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (ret < 0)
+		return ret;
+	/* hwmon power attributes are in microWatt */
+	*val = (long)msg.data_out * 1000;
+	return ret;
+}
+
+static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long val)
+{
+	struct sbrmi_data *data = dev_get_drvdata(dev);
+	struct sbrmi_mailbox_msg msg = { 0 };
+
+	if (type != hwmon_power && attr != hwmon_power_cap)
+		return -EINVAL;
+	/*
+	 * hwmon power attributes are in microWatt
+	 * mailbox read/write is in mWatt
+	 */
+	val /= 1000;
+
+	val = clamp_val(val, SBRMI_PWR_MIN, data->pwr_limit_max);
+
+	msg.cmd = SBRMI_WRITE_PKG_PWR_LIMIT;
+	msg.data_in = val;
+	msg.read = false;
+
+	return rmi_mailbox_xfer(data, &msg);
+}
+
+static umode_t sbrmi_is_visible(const void *data,
+				enum hwmon_sensor_types type,
+				u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+		case hwmon_power_cap_max:
+			return 0444;
+		case hwmon_power_cap:
+			return 0644;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_channel_info *sbrmi_info[] = {
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_MAX),
+	NULL
+};
+
+static const struct hwmon_ops sbrmi_hwmon_ops = {
+	.is_visible = sbrmi_is_visible,
+	.read = sbrmi_read,
+	.write = sbrmi_write,
+};
+
+static const struct hwmon_chip_info sbrmi_chip_info = {
+	.ops = &sbrmi_hwmon_ops,
+	.info = sbrmi_info,
+};
+
+static int sbrmi_get_max_pwr_limit(struct sbrmi_data *data)
+{
+	struct sbrmi_mailbox_msg msg = { 0 };
+	int ret;
+
+	msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
+	msg.read = true;
+	ret = rmi_mailbox_xfer(data, &msg);
+	if (ret < 0)
+		return ret;
+	data->pwr_limit_max = msg.data_out;
+
+	return ret;
+}
+
+static int sbrmi_probe(struct i2c_client *client,
+		       const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct sbrmi_data *data;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	mutex_init(&data->lock);
+
+	/* Enable alert for SB-RMI sequence */
+	ret = sbrmi_enable_alert(client);
+	if (ret < 0)
+		return ret;
+
+	/* Cache maximum power limit */
+	ret = sbrmi_get_max_pwr_limit(data);
+	if (ret < 0)
+		return ret;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
+							 &sbrmi_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id sbrmi_id[] = {
+	{"sbrmi", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, sbrmi_id);
+
+static const struct of_device_id __maybe_unused sbrmi_of_match[] = {
+	{
+		.compatible = "amd,sbrmi",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sbrmi_of_match);
+
+static struct i2c_driver sbrmi_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = "sbrmi",
+		.of_match_table = of_match_ptr(sbrmi_of_match),
+	},
+	.probe = sbrmi_probe,
+	.id_table = sbrmi_id,
+};
+
+module_i2c_driver(sbrmi_driver);
+
+MODULE_AUTHOR("Akshay Gupta <akshay.gupta@amd.com>");
+MODULE_DESCRIPTION("Hwmon driver for AMD SB-RMI emulated sensor");
+MODULE_LICENSE("GPL");
-- 
2.17.1

