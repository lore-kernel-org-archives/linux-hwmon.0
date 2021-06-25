Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98434C2B9F4
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Jun 2021 13:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C34F61962
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Jun 2021 13:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbhFYN21 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Jun 2021 09:28:27 -0400
Received: from mail-dm6nam10on2069.outbound.protection.outlook.com ([40.107.93.69]:16416
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231617AbhFYN20 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Jun 2021 09:28:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeGK/q2z6jJgSRYDAi6WmHCuaitp5vjko5cwkpqmIFiPMY5vhjF3RGSDvJbG1H4xHRJtLW/mDOF0CuBjeEHduHmAnooVEdVVA+1wbbRS0iN0V2lkNjkuoQ8ljtucpJaM7AzxCkWDrve6yLefRs4RQfEXqiSZX/MYJ9D0AWRS4Xdi6M0qRew9e2huqUYdU9DLI4B34O7zd319wVopmPKIqIiyaM8LdVIOu1HpOlnD4HKwkCgvaXSMSwh35NPbTvKWOP0tPapOdDPghlObnTB8FeuIFD8dOCVj2dMZrx4QJqYQkXXK16KJJD1ZbiAFKeJYJaZUM/+LAP0NuNnjW1V7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtORC8AYLiFwXNcPWCbm0211Kdna1m30tK23kf8njF0=;
 b=Gm/plh2B8g3iRUIDKhdc7jWym3KRp90aijj1OVcsZi+A3fHzWBkzarKAbgK6QoJ4Iir/RUMw1T1fq6eM0DklempsPHWxJ8HsEhnzeaZ3aDLYg77BhMfsS+Ppf6EItSdj1trEU6tllGrj/R8mDbY/p+KeTexY9EvT33AM1AZRLm2R+8laZ5Q86RyI/VVAtmzNZzugCp/R5HpGZDnepRDqckemze2oTAZE0s0aTcjmDtOCymmdjkV5mWY4Dp0/TG7LLFMscV7PA0J0TOirMZd7hMEUl7EIpwzOtIU9c4UVc28H0/rcyza4RhnXhofhm/TiRjWA9URkyASA4jPvaUCYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtORC8AYLiFwXNcPWCbm0211Kdna1m30tK23kf8njF0=;
 b=JDKCgWaPpsi75EN6+uebuzqKdk/v6H3IfdzUJg98r+dM/MH+eFIqEgOe84f8dFLEg8SUB9In0AJNXI3dMPftDxLFMawlhQbOPNDt0Wn/cRWpcMttr3vqeWEYs+J7Ki3B4abp11v/HvLEu+RjfDWSH1IxDlSAiVNIAVTOgwbIU/Q=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 25 Jun
 2021 13:26:04 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::1514:9ec7:76dd:568c]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::1514:9ec7:76dd:568c%7]) with mapi id 15.20.4264.021; Fri, 25 Jun 2021
 13:26:04 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Akshay Gupta <Akshay.Gupta@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 1/3] hwmon: sbrmi: Add support for sbrmi power module
Date:   Fri, 25 Jun 2021 18:55:42 +0530
Message-Id: <20210625132544.18094-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To BL1PR12MB5286.namprd12.prod.outlook.com
 (2603:10b6:208:31d::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend Transport; Fri, 25 Jun 2021 13:26:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21cde9cb-92ea-422d-6b1e-08d937dcc804
X-MS-TrafficTypeDiagnostic: BL1PR12MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5032B08F653451EC65AA1075E8069@BL1PR12MB5032.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B7/QoJeC9lBCQ51LvN1BTKdwx8OijYNIQfMPf+XxwkyTl++lgOn7TAQk9hcKH0K/W+Pj1i8i7DJ7UpTvie4qdfQscWNHlVBL6OxYb+x4xf2xHeyNvkq4V+9pEDCh/mNmofnXfhGfk1hCBstNeSwyFIrPV4Yt5xrTYKcd3g2Zhk5CgVC06eZgGk2I7F3NxoEcsFNg9ZJEHawSj4CxpvWA+HjoAE5VLhMQiGvGMgzcNemLo50HTGf3uR51Yvbg6WNbWVZd8A1ZLKygXqjLC0plqUSOnv9ZxQoMQPnoCmiDseRl5GeN6HUlYIqlrpB8MqzwzVE7JlhFdba1wSSVkJ/bWF7DTa2mAQbJbkJrOKT0np1jFIv8GVpYbiPVuIxQlCd0KnyiBm/c9eA1eU35Kgw/fb7xeMRcwLxk5xjBa68u9e4bnUA0qtI8/pyoGOyqm5/MzEkrbPiainH+Q/gI1TLqii1ysfjdUeUZcBgybAJlj2LhQ5IzMG+9C+jxUv4SG8TXny6sPlxJ9Oz6GNV9uGR4OGkbTIQA/rdAeVsVcQeI5/PA4/+/gUQptUZbnDC/jlvsaRgkLP+THMlAzEQZsb5JRXWNPdBumLm2jVcPLG03rKdyHXqruWevC4FVTdcL8Jf5xOU8Auuzrhd2BGr1Kvzxb4Dc+PcIhpKYGLGT9boLsmNk21DsAY8ndswxGgUmAmUGCsHce8LN6/2FRrGbsYm/nQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(38350700002)(38100700002)(186003)(16526019)(7696005)(956004)(54906003)(6666004)(2616005)(30864003)(1076003)(52116002)(2906002)(6916009)(316002)(26005)(5660300002)(83380400001)(478600001)(36756003)(8936002)(66946007)(66476007)(66556008)(6486002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oxi307V4vhmNK65HBckn+ndTaA733UY4wAtt91Ox65nXWrKuTuuF5n9dyDHd?=
 =?us-ascii?Q?g8taSiq3RAgMbGfozEeuifvGvjB0ehE9Npx0eXkp4cf8cnC3AM+ktlLdbhvI?=
 =?us-ascii?Q?7uBCQ8FUDzfOdq2sR/wbzwTFUjcDJnJPDswOStz+DpcKWlhbrGHtxKQzuzKD?=
 =?us-ascii?Q?E5xSLw/RBlP1tlW1ge445fBhcxeRc4dToxQwpSuUOTeiHkjthQK0kJKoQG7t?=
 =?us-ascii?Q?Vw8OTlxzDog6XdrH+ZX5ASdpA0qIoUZL88J6hIGrZYt54iaJf2PJy3EL8ePg?=
 =?us-ascii?Q?f8EjpLZ4DvTMXgT9kKaTz9SsVO1QuOfW3t1sKzjwKsJebasniW5om1fimaaj?=
 =?us-ascii?Q?pcFc5ixVOdUhwd+Cf6hHKRfYyk0JfDPSJWqGctT4WrbIyhF05zkyqe8pY8lV?=
 =?us-ascii?Q?ND4Yt/lkqMGbAlCtVf/MfHBTDhul5n/dLx4F78YLssVcHtlde/WSGERHvxVX?=
 =?us-ascii?Q?Anb4QAsYZtK8/RY5k9UtIHNET4H8b0corMYv8ZeMmqtLX4iE1BZL7RMj1Lua?=
 =?us-ascii?Q?RlelAezBqpz34MlK80r1WU3LT8LT0O+hsK55J8Dha7ruHTuMagZzSQt4QcY+?=
 =?us-ascii?Q?surmZGotwAfFPkurqpCU13XPxDtPKVK4jKwbyOTiL5QdUTmUQyO8AGmxh+Qt?=
 =?us-ascii?Q?ckwboD43us2Y93jwzAyC0NobNX6p5uBYZlayfErm+Fm0f5VdptVPHr6GComY?=
 =?us-ascii?Q?YU/7jSRfNHYuzeFaAdIgY696FGAhPA+UHJPprhXz+v0xag7F47Sb1GrXRfOv?=
 =?us-ascii?Q?6QuamBlx3uIkFFqNCI9no1dDccXfQVfxAxdBDkubmMBz4LTpHW10BBLBEwAq?=
 =?us-ascii?Q?orw9InMbQzMiP4RPlAyhdEaFapKuN5F+Qagmm6MSCpZu/3nk18cRB11ByIBP?=
 =?us-ascii?Q?dWfYYccxNT46jiOTFFFeEWOsMX3FiVQ1iTlNqduGQcbo2cMKVT8BgCgDHiFR?=
 =?us-ascii?Q?t6wvps148d96ds0n8sR6hZ6afOv/lhwl2wEnWfIaqjPt+dicW0HNpbVWSjRE?=
 =?us-ascii?Q?UdMFY03WmkX2Vl7i4+fhtzkR6BU41MUZ84Mj7PtMs4YwjFx0ABrGYfLkIgvm?=
 =?us-ascii?Q?baxeBJr2pOc/by+WXKhscc62WSCLWmhup+XPraCcOzPdrI7YfF5fLEnzzqY9?=
 =?us-ascii?Q?YEuAz5QDaN+JT8REzEBvQwBmx1jiCR+LeSzzzD7aO+7tkWfq2/1k3w6O8otI?=
 =?us-ascii?Q?ApTs5gGnHZ7XsU9x71qgzdXvRnZdWrQMpGbucxSjO7ojIa0HcXcWjkSRnUVs?=
 =?us-ascii?Q?zKsTuIZaGwduS6zPReQdFyHSO+fbUCDUvYFKPWwY9nn9wqtVXNW1NVZ1Drwy?=
 =?us-ascii?Q?5qIddjB4m++mbTSgb+OWWGRm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21cde9cb-92ea-422d-6b1e-08d937dcc804
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:26:04.0479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJkhiJ1gDCBaweZsvxSrSR106WpUYchGY54LNy3yMKWKz5LbhtTpy9w/8NdOclRF97FDk99V44MUL53UxrzNlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5032
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Akshay Gupta <Akshay.Gupta@amd.com>

On AMD platforms the Out-of-band access is provided by Advanced Platform Management
Link (APML), APML is a SMBus v2.0 compatible 2-wire processor client interface.
APML is also referred as the sideband interface (SBI).

APML is used to communicate with the Remote Management Interface
(SB-Remote Management Interface (SB-RMI) which provides Soft Mailbox messages
to report power consumption and power limits of the CPU socket.

- This module add support to read power consumption,
  power limit & max power limit and write power limit.
- To instantiate this driver on an AMD CPU with SB-RMI support,
  the i2c bus number would be the bus connected from the board
  management controller (BMC) to the CPU.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 drivers/hwmon/Kconfig  |  10 ++
 drivers/hwmon/Makefile |   1 +
 drivers/hwmon/sbrmi.c  | 394 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 405 insertions(+)
 create mode 100644 drivers/hwmon/sbrmi.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 87624902ea80..d1813ea8382c 100644
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
index 000000000000..c35829513459
--- /dev/null
+++ b/drivers/hwmon/sbrmi.c
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * sbrmi.c - hwmon driver for a SB-RMI mailbox
+ *           compliant AMD SoC device.
+ *
+ * Copyright (C) 2020-2021 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <asm-generic/ioctl.h>
+#include <linux/delay.h>
+
+/* Do not allow setting negative power limit */
+#define SBRMI_PWR_MIN 0
+/* Mask for Status Register bit[1] */
+#define SW_ALERT_MASK 0x2
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
+/*
+ * Each client has this additional data
+ */
+struct sbrmi_data {
+	struct i2c_client *client;
+	struct mutex lock;
+};
+
+/* Mailbox message data format */
+union mailbox_word {
+	u8 bytes[4];
+	u32 value;
+};
+
+struct sbrmi_mailbox_msg {
+	u8 cmd;
+	bool read;
+	union mailbox_word data_in;
+	union mailbox_word data_out;
+};
+
+static int print_mailbox_error(struct sbrmi_data *data)
+{
+	int status;
+
+	/* Mailbox error code will be written by Firmware in
+	 * SBRMI::OutBndMsg_inst7 (SBRMI_x37)
+	 */
+	status = i2c_smbus_read_byte_data(data->client, SBRMI_OUTBNDMSG7);
+	if (status < 0) {
+		pr_err("SMBUS translation failed\n");
+		return status;
+	}
+
+	switch (status) {
+	case 0x0:	/* Success */
+		break;
+	case 0x1:
+		pr_err("Mailbox message command is aborted\n");
+		break;
+	case 0x2:
+		pr_err("Unknown mailbox message\n");
+		break;
+	case 0x3:
+		pr_err("Invalid core is specified in mailbox message parameters\n");
+		break;
+	default:
+		pr_err("Unknown Error\n");
+	}
+
+	return status;
+}
+
+static int sbrmi_enable_alert(struct sbrmi_data *data)
+{
+	int ctrl;
+
+	/* Enable the SB-RMI Software alert status
+	 * by writing 0 to bit 4 of Control register(0x1)
+	 */
+	ctrl = i2c_smbus_read_byte_data(data->client, SBRMI_CTRL);
+	if (ctrl < 0)
+		return ctrl;
+
+	if (ctrl & 0x10) {
+		ctrl &= ~0x10;
+		return i2c_smbus_write_byte_data(data->client,
+						 SBRMI_CTRL, ctrl);
+	}
+
+	return 0;
+}
+
+static int rmi_mailbox_xfer(struct sbrmi_data *data,
+			    struct sbrmi_mailbox_msg *msg)
+{
+	union mailbox_word output, input;
+	int i, err = 0, retry = 10;
+	int sw_status;
+
+	mutex_lock(&data->lock);
+
+	err = sbrmi_enable_alert(data);
+	if (err < 0)
+		goto exit_unlock;
+
+	/* Indicate firmware a command is to be serviced */
+	err = i2c_smbus_write_byte_data(data->client,
+					SBRMI_INBNDMSG7, START_CMD);
+	if (err < 0)
+		goto exit_unlock;
+
+	/* Write the command to SBRMI::InBndMsg_inst0 */
+	err = i2c_smbus_write_byte_data(data->client,
+					SBRMI_INBNDMSG0, msg->cmd);
+	if (err < 0)
+		goto exit_mod;
+
+	/*
+	 * For both read and write the initiator (BMC) writes
+	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
+	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
+	 */
+	input = msg->data_in;
+	for (i = 0; i < 3; i++) {
+		err = i2c_smbus_write_byte_data(data->client,
+						(SBRMI_INBNDMSG1 + i),
+						input.bytes[i]);
+		if (err < 0)
+			goto exit_mod;
+	}
+
+	/*
+	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
+	 * perform the requested read or write command
+	 */
+	err = i2c_smbus_write_byte_data(data->client,
+					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
+	if (err < 0)
+		goto exit_mod;
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
+			err = sw_status;
+			goto exit_mod;
+		}
+		if (sw_status & SW_ALERT_MASK)
+			break;
+		usleep_range(50, 100);
+	} while (retry--);
+
+	if (retry < 0) {
+		pr_err("Firmware fail to indicate command colmpletion\n");
+		err = -1;
+		goto exit_mod;
+	}
+
+	/*
+	 * For a read operation, the initiator (BMC) reads the firmware response
+	 * Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
+	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
+	 */
+	if (msg->read) {
+		for (i = 0; i < 4; i++) {
+			output.bytes[i] = i2c_smbus_read_byte_data(data->client,
+								   (SBRMI_OUTBNDMSG1 + i));
+			if (output.bytes[i] < 0) {
+				err = output.bytes[i];
+				goto exit_mod;
+			}
+		}
+	}
+	msg->data_out = output;
+
+	/*
+	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
+	 * ALERT to initiator
+	 */
+	err = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
+					(sw_status | SW_ALERT_MASK));
+
+exit_mod:
+	if (err < 0)
+		pr_err("SMBUS translation failed\n");
+	else
+		err = print_mailbox_error(data);
+exit_unlock:
+	mutex_unlock(&data->lock);
+	return err;
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
+		msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
+		ret = rmi_mailbox_xfer(data, &msg);
+		break;
+	default:
+		return -EINVAL;
+	}
+	/*
+	 * hwmon power attributes are in microWatt
+	 */
+	*val = (long)msg.data_out.value * 1000;
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
+	msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
+	msg.data_in.value = 0;
+	msg.read = true;
+	rmi_mailbox_xfer(data, &msg);
+
+	val = clamp_val(val, SBRMI_PWR_MIN, msg.data_out.value);
+
+	msg.cmd = SBRMI_WRITE_PKG_PWR_LIMIT;
+	msg.data_in.value = val;
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
+static int sbrmi_probe(struct i2c_client *client,
+		       const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct sbrmi_data *data;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&client->dev, "adapter does not support true I2C\n");
+		return -ENODEV;
+	}
+
+	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	mutex_init(&data->lock);
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

