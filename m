Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862BCC07E9B
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Jul 2021 05:57:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66D2F6113A
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Jul 2021 05:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236855AbhGTFRQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Jul 2021 01:17:16 -0400
Received: from mail-dm6nam08on2079.outbound.protection.outlook.com ([40.107.102.79]:65377
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236240AbhGTFRQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Jul 2021 01:17:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4yWqL1btqMjtD8tuM5oamuPbTxqDCcyb7z0d3PdtV9hhI1AltGap9G545rxW3DLLOzBHMW6xJNGcDbjrCnnXUJsXGEEg4xUkTnJJi0611HCltjzIubF1t4h8GGkP2MkelaEHNM6jpDcwsghrxqHYVzof+9zV5NhmybF2wAChN6PeIaN4o+lQpG6dwqnma5v6jAWxp+RlboBYIQ8oIdGbggLHj2s5pnhjtz+KFzwPXkxLSKqAv8/HnRmxlfx/9EzQ+4C4qo5Cz730ZmfPK4OKliGT5oay3fNsmlrDZghZFfFkDJr/PRuHCmG/dFrSHo65bYAoaW81WnHbfECwJ0NPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKEOkld0fjCz6p+ltpweALR1jxeAphLsmIuiLGQ1yzw=;
 b=TqVFBUYqYI0G5o3prH1rKilNw9kUWlFzGeHTptNNYQGudQ2TcOkQDvb28/W9V7cDiGhEjgykVmSmHl6lIreVFq/7sAJtMmQL0evUVCYpzwGNsOrSRAbSAyTfu2kXQ2ntU6aFAvngaSU/Epr5ovFJYOz5OpvEeDRinCNHp8U54K6R0rp5dV0df/zM+elYhyx2vDrEgA30Okcm+f9fbVNehVhyeyFR5D3TCrq/92Rl1RHzKjkdsO/YQ4TNNLmgsFmvq+Uf0lMg3FWPomrKk0OC23k2K8EyPjPrgu+yCt696U3Ow7Scbi3qXHkQV7CbFakpOyHrk4/CJkbrPRE1Ks/oWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKEOkld0fjCz6p+ltpweALR1jxeAphLsmIuiLGQ1yzw=;
 b=MqeVKfIvMSFXo0qPae4dvePPNGVJ4WYCN5hGgN0wBi86lwH/pu5zUzIm9NRZWeFAeYVlgzIbqkSpQuY0uoFx2GvLj1agy6DvT+jh10zLQRxdRQBCFdn/glqjtf54fYtXnEazwM/mx041kxhOyZ46b783QAvUkI3v9MeVc/CtMNA=
Received: from BN9PR03CA0455.namprd03.prod.outlook.com (2603:10b6:408:139::10)
 by DM6PR12MB3868.namprd12.prod.outlook.com (2603:10b6:5:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Tue, 20 Jul
 2021 05:57:53 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::80) by BN9PR03CA0455.outlook.office365.com
 (2603:10b6:408:139::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 05:57:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 05:57:53 +0000
Received: from milan-ETHANOL-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 00:57:50 -0500
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     <linux-hwmon@vger.kernel.org>
CC:     <linux@roeck-us.net>, Akshay Gupta <Akshay.Gupta@amd.com>,
        "Naveen Krishna Chatradhi" <nchatrad@amd.com>
Subject: [PATCH v3 1/3] hwmon: sbrmi: Add support for sbrmi power module
Date:   Tue, 20 Jul 2021 11:27:35 +0530
Message-ID: <20210720055737.8666-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625132544.18094-1-nchatrad@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8eab2e98-8719-4b5f-3f80-08d94b435041
X-MS-TrafficTypeDiagnostic: DM6PR12MB3868:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3868FE2506AFB2818F2DA304E8E29@DM6PR12MB3868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6LbIPGV9BqCBA3SKk5MCmUes9hThzZhYXOBmsWaqPViqFAlJtxaPGZJRcyOfk29QdrPO4lnMh97IyiZ/sUF7ZhZTNN/WGXGzBruw6K0dNOO2pd/klegwDRgTxRFZBlMGpZ+isM0CZdTTgfkQN76MGEWVlqGjWX9r4pAQzfnWB5eCB2AmijF1ItbjmMIMk7fmIh1/dBFCFzHXNi+K89Po+LbFVo5yLby/Sf11sx8WiwsJLEf4qBQ8Yp3JE9MXlBGy+bDKG4htmutfTvMDjQMBe9ODFKS8NQoqdDvjl/uMhaOAteeZzWqoBgr7ctQoKXlY8zUwdAIJ/3u7ESPIlnJsX8zRRzUOO7wU2Ypp2O0wLDODfnhNcGphSan2CzRCl4e15cDLBnecPDk6z8gEkDmhdbCYNjoByPC23Kb4Nr4a0Q+M6kvFb3LA2NMOMH8bwPEx7PhCyINcbPCVmyK9QUVGYT22blKaTld8Aft4ZMyYUtn0JP2NZ9LyZX7aRE203sdRVXqyt+7DT92s3+F2z26DQuiriklbNxPXeq5HwXo2q+5dfU8YlqKjmgYUoJaOQlMVk97WpiGhUpeCxjieBCE2S7/XgWK/QjIaU7dz/IA548InAssyt6Nvty+7ehL+w1Whd7Cz3+pi2orHSkSEKAtyKRodv0PGsM/BjBGFtCqJm/qrTGt7QBBg36JWZgyE10sR9/BsxLIgDQtDbvhVp+s7pqt4gqyFjoBMl524ZSjtHA4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(47076005)(4326008)(1076003)(2616005)(5660300002)(30864003)(426003)(8676002)(8936002)(54906003)(70586007)(6666004)(70206006)(336012)(82310400003)(316002)(36860700001)(356005)(81166007)(82740400003)(36756003)(83380400001)(2906002)(478600001)(26005)(186003)(16526019)(7696005)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 05:57:53.0461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eab2e98-8719-4b5f-3f80-08d94b435041
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3868
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

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v2:
1. Modify to cache the power_limi_max during probe
2. Enable alert during probe
3. Use dev_err instead of pr_err
4. Remove unnecessry bit mask
5. Checking rmi_mailbox_xfer retrun value

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

