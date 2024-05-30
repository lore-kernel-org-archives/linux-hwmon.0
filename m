Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FE3174ED4
	for <linux-hwmon@vger.kernel.org>; Thu, 30 May 2024 11:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068215; cv=fail; b=em+CSx4s7ABw913DRWQx3KEtc1nHinPhmTaQFpUZ7Bdhtyparn/MUgdWjAhfQ1mmpAwZDDFjM6QDtNadIoAdBN1KA1pDrYZ856FfS08D4W0QNr0O9QFxNeHMX3Gzn1TVF6vU7BUx+tKGktTRh4P6IELojFt/pUBquGwpYVw8V5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068215; c=relaxed/simple;
	bh=eRk089coCR9cSIKiwdJj74PIl8ZuibgdXsixI87G+TY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+aeF5TdYhdGGabqR+SlcQSavrnPNLzSMBT+vLHKlkVd5SeAQNLUOFGDpMlyNjpHgBgKLBdhwkq86gLlQpAGSpjE6tNYsTFT6OViejdxGAnLvElS8WIcr2J2RC6IUi2N4stzBZ0XZCq6sb3qLqxaXFPqjFWbZwQChV6uSndKw7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TUXGAycP; arc=fail smtp.client-ip=40.107.100.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TUXGAycP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6pBb8M/BWtTgw9qX78vsa816ytgpUEAXJpZJ6bj91HUttkHUBEM5hqXOSHtgHR9qTNfXZTb3brWetPSOS7JtU3l9d7o02O4WA1rxGhkNux6nupCw2fvZGJAuSLLkybaILf/kIfHWeL3UerSKUMfhqSdY53bd0GEZ0GOrO3OOugEg2e032Rcisb2iS7W5ZcXuT6UgVGJGf/xPpOlql1gnrpfzB1f/6gnflJtPqyIG8aipMiD+dCltwW8ArhgPwO6EdOZ6h2RWe/8YLMOHYSSd8j4tWpQVSL2j6GlRKyxvRcwg/fd6MUciwV8U4jHGCnduzBQl3KyTtsftqQvpX9Xww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZwSDi93TxiryAvdDZBZd8LhuDo+f6iRycvqmEZJyTQ=;
 b=LUKlyfJe+hfNmzLQH3p52JhUse/ayglPAXd/Fz5X26dXtHhwyVxJ3o8PrD/r3Uh/wBKBvhO/PAPUdLFMU7ILehnzirPCQYV6iueUUPc4/txBcU0QA6Ou9tFWL7/7GoRAPCpyDe+d44brYt/m2KJeA7ECtNAefM74eH6db2ETkVq4dh/3x/xV4YTOyPRdvVvhVtWa29GKBIMYNspza62LBGVk62i7d1MadeEgV/DpL767wgvofr5PiyXj8BC+Oxy7scu6JPGrbFFMNnoFivyGjX25xjy+jnflX3rwUNKW9wVm/AYTIeiRDvcEEoF6X8EN9NG5LY22Qd6+iaBMwhHHQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZwSDi93TxiryAvdDZBZd8LhuDo+f6iRycvqmEZJyTQ=;
 b=TUXGAycPR1yZZgEVxJ1WkBBsN3pVgHyWzW8tbDqIri3M3mVamWvihIQg3vxF4kKJ4QWjIHwSq1H9VDvS/THg/uuvr2+VPscwnFFMadv3j+ISB4YVCEyqkevqNzeNKoHU5PuhYuvr3UYBJFC0zpEjK3PJbujAWdkz4KwBx/yGaac=
Received: from MN2PR08CA0011.namprd08.prod.outlook.com (2603:10b6:208:239::16)
 by SN7PR12MB6766.namprd12.prod.outlook.com (2603:10b6:806:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 11:23:29 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::56) by MN2PR08CA0011.outlook.office365.com
 (2603:10b6:208:239::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Thu, 30 May 2024 11:23:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 30 May 2024 11:23:29 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 May
 2024 06:23:26 -0500
From: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <lee@kernel.org>, <gregkh@linuxfoundation.org>,
	<arnd@arndb.de>, Akshay Gupta <akshay.gupta@amd.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 1/5] hwmon/mfd sbrmi: Move core sbrmi from hwmon to MFD
Date: Thu, 30 May 2024 11:23:03 +0000
Message-ID: <20240530112307.3089696-2-naveenkrishna.chatradhi@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
References: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|SN7PR12MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b26e1ab-939c-4d7c-dc57-08dc809aee9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4tfeYUvd5ianPUT7Fg/yUorgodMzjDSXWF56tlBd5Gu+qz99bxA9D/0dJ9R7?=
 =?us-ascii?Q?2JbO1vkY9UbMhEEi8SsxLjeYL6SSxsgeuIy76En5LAcFodmTqBhsc9h5BeLK?=
 =?us-ascii?Q?pW87FfV9MnF37rFtf3FvZiKPX8CHtLT0joOOjWkH0dW/ojjHvRRJ60N7yLUv?=
 =?us-ascii?Q?SowcY294TdFUA8qJsnqzVHBaWMoMma0A8IujzvAIth5ZeMwb+CgsNuSFGQeB?=
 =?us-ascii?Q?kLpHOWVz9nvdd89/xx42fjTTI+47kqGNezQAA7SPX0tYKQ5ZdkxQFtW0AgDy?=
 =?us-ascii?Q?+Gb8i4L/ePW6BhDEgcOcmfXOgHRyYhTeduO3xQndCQeMuOob1JMk90ytCaNG?=
 =?us-ascii?Q?ekLnJXdn8i8McxUkvgxrGXI7itE9yI7lpn7jJeY/A3lOvul1hdHQoZpMhzoB?=
 =?us-ascii?Q?SyX+9WKCt1vmPp5wambviBMwzjBJw9tY3pxk5kNxnO1F8FYqnzwFc+ovhp7b?=
 =?us-ascii?Q?AULfvVi7VaywXRiDL3Aa3pDo2yAmgH3v/gDSSu0gwLSku24jlPJ7BtOR+eae?=
 =?us-ascii?Q?DsaiFOG/xfT4if0LChZx48B2eS5Bn4DrzZdaPORWkq+Jf/IinnErNeL3GmlO?=
 =?us-ascii?Q?24pb1PVRLFaalDukbSU3/HI0emcU5TQ+gFu/FJ2E3F+pgp7wheto5dVhXYAc?=
 =?us-ascii?Q?6JpAJsQSWIYm3VPO9IIrtS8ttUYzozyvvh9x/Vxj/6L9EbiJF/yDUalebnsT?=
 =?us-ascii?Q?nV2mXiAHP+P0fuVmXNrlqGR0cBTrLiX0rVhr/riiiSNOjzOqG5jOBVQMz33G?=
 =?us-ascii?Q?bTV9ojLtRk9Brqt2XRNQAmtvSSZwdKlgzJopGpgg7IF7bKbehCVib0DtFtR2?=
 =?us-ascii?Q?n61ZnbI7nyxm85hzyeuSD7uCN4ZklltXukBoyxMbSp3JuIHwyWHfu+t7W8od?=
 =?us-ascii?Q?9MP37sEoYA10dPytZxR5yLICYXbx6UutX/wdSmnHa0fUqKcKMInIR1nBOCTv?=
 =?us-ascii?Q?yvBuG/8kUUbnkksVVeShgUYR6AO4SIm2y1aRqYWhbNFaBTgTQKVitCkY/wTU?=
 =?us-ascii?Q?EbbbdkCvGQv0vaHwrWBvxEN2xjm5+eJDwV3lF9bACrGtK8ZPmkf5P8Nxm/Qd?=
 =?us-ascii?Q?/UHsaqQ7lORMfp7zybtlHxB5Ikz7IGjBBysiSKTRmGY4ZvxY7tUdWxzOyhVI?=
 =?us-ascii?Q?/bpZtp7fvELMLICoU/mknod/ZYRGaZyIytxQMmd0lSUQh261kIC91BYhlima?=
 =?us-ascii?Q?VlCBMMl3/GyUC6QocGYUOzF1PbvNy5+VrXcKTY2D1EfWCuPYtH6iEnBCM6Go?=
 =?us-ascii?Q?jOTb5Zzl2J/81PcYVQez3jk+TuoQ4v8mM8M9pqD0jcXn6Tnv8D049VhqvAMt?=
 =?us-ascii?Q?bS6MDeOxw0LrFVqY/bp7QyrOpI9PL5kD5pH2eJZaxgaCbFVM/QQoGKokjjxm?=
 =?us-ascii?Q?mSGz9xsNfibfLA9HQiG+RAZsKsqC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 11:23:29.5940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b26e1ab-939c-4d7c-dc57-08dc809aee9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6766

From: Akshay Gupta <akshay.gupta@amd.com>

This is done to support other functionality provided by the SBRMI, which
does not fit in the hwmon subsystem.

- Move the core SBRMI core functionality and I2C device probing to MFD
- Modify this module to be probed as a platform device by the MFD cell.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/hwmon/Kconfig      |   1 +
 drivers/hwmon/sbrmi.c      | 245 +++----------------------------------
 drivers/mfd/Kconfig        |  10 +-
 drivers/mfd/Makefile       |   2 +
 drivers/mfd/sbrmi-core.c   | 137 +++++++++++++++++++++
 drivers/mfd/sbrmi-i2c.c    | 106 ++++++++++++++++
 include/linux/mfd/amd-sb.h |  45 +++++++
 7 files changed, 316 insertions(+), 230 deletions(-)
 create mode 100644 drivers/mfd/sbrmi-core.c
 create mode 100644 drivers/mfd/sbrmi-i2c.c
 create mode 100644 include/linux/mfd/amd-sb.h

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e14ae18a973b..56b73e665424 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1839,6 +1839,7 @@ config SENSORS_SBTSI
 config SENSORS_SBRMI
 	tristate "Emulated SB-RMI sensor"
 	depends on I2C
+	depends on MFD_SBRMI_I2C
 	help
 	  If you say yes here you get support for emulated RMI
 	  sensors on AMD SoCs with APML interface connected to a BMC device.
diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c
index d48d8e5460ff..aaeb5050eb0c 100644
--- a/drivers/hwmon/sbrmi.c
+++ b/drivers/hwmon/sbrmi.c
@@ -3,190 +3,18 @@
  * sbrmi.c - hwmon driver for a SB-RMI mailbox
  *           compliant AMD SoC device.
  *
- * Copyright (C) 2020-2021 Advanced Micro Devices, Inc.
+ * Copyright (C) 2020-2024 Advanced Micro Devices, Inc.
  */
 
-#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/i2c.h>
-#include <linux/init.h>
+#include <linux/mfd/amd-sb.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
 
 /* Do not allow setting negative power limit */
 #define SBRMI_PWR_MIN	0
-/* Mask for Status Register bit[1] */
-#define SW_ALERT_MASK	0x2
-
-/* Software Interrupt for triggering */
-#define START_CMD	0x80
-#define TRIGGER_MAILBOX	0x01
-
-/*
- * SB-RMI supports soft mailbox service request to MP1 (power management
- * firmware) through SBRMI inbound/outbound message registers.
- * SB-RMI message IDs
- */
-enum sbrmi_msg_id {
-	SBRMI_READ_PKG_PWR_CONSUMPTION = 0x1,
-	SBRMI_WRITE_PKG_PWR_LIMIT,
-	SBRMI_READ_PKG_PWR_LIMIT,
-	SBRMI_READ_PKG_MAX_PWR_LIMIT,
-};
-
-/* SB-RMI registers */
-enum sbrmi_reg {
-	SBRMI_CTRL		= 0x01,
-	SBRMI_STATUS,
-	SBRMI_OUTBNDMSG0	= 0x30,
-	SBRMI_OUTBNDMSG1,
-	SBRMI_OUTBNDMSG2,
-	SBRMI_OUTBNDMSG3,
-	SBRMI_OUTBNDMSG4,
-	SBRMI_OUTBNDMSG5,
-	SBRMI_OUTBNDMSG6,
-	SBRMI_OUTBNDMSG7,
-	SBRMI_INBNDMSG0,
-	SBRMI_INBNDMSG1,
-	SBRMI_INBNDMSG2,
-	SBRMI_INBNDMSG3,
-	SBRMI_INBNDMSG4,
-	SBRMI_INBNDMSG5,
-	SBRMI_INBNDMSG6,
-	SBRMI_INBNDMSG7,
-	SBRMI_SW_INTERRUPT,
-};
-
-/* Each client has this additional data */
-struct sbrmi_data {
-	struct i2c_client *client;
-	struct mutex lock;
-	u32 pwr_limit_max;
-};
-
-struct sbrmi_mailbox_msg {
-	u8 cmd;
-	bool read;
-	u32 data_in;
-	u32 data_out;
-};
-
-static int sbrmi_enable_alert(struct i2c_client *client)
-{
-	int ctrl;
-
-	/*
-	 * Enable the SB-RMI Software alert status
-	 * by writing 0 to bit 4 of Control register(0x1)
-	 */
-	ctrl = i2c_smbus_read_byte_data(client, SBRMI_CTRL);
-	if (ctrl < 0)
-		return ctrl;
-
-	if (ctrl & 0x10) {
-		ctrl &= ~0x10;
-		return i2c_smbus_write_byte_data(client,
-						 SBRMI_CTRL, ctrl);
-	}
-
-	return 0;
-}
-
-static int rmi_mailbox_xfer(struct sbrmi_data *data,
-			    struct sbrmi_mailbox_msg *msg)
-{
-	int i, ret, retry = 10;
-	int sw_status;
-	u8 byte;
-
-	mutex_lock(&data->lock);
-
-	/* Indicate firmware a command is to be serviced */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_INBNDMSG7, START_CMD);
-	if (ret < 0)
-		goto exit_unlock;
-
-	/* Write the command to SBRMI::InBndMsg_inst0 */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_INBNDMSG0, msg->cmd);
-	if (ret < 0)
-		goto exit_unlock;
-
-	/*
-	 * For both read and write the initiator (BMC) writes
-	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
-	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
-	 */
-	for (i = 0; i < 4; i++) {
-		byte = (msg->data_in >> i * 8) & 0xff;
-		ret = i2c_smbus_write_byte_data(data->client,
-						SBRMI_INBNDMSG1 + i, byte);
-		if (ret < 0)
-			goto exit_unlock;
-	}
-
-	/*
-	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
-	 * perform the requested read or write command
-	 */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
-	if (ret < 0)
-		goto exit_unlock;
-
-	/*
-	 * Firmware will write SBRMI::Status[SwAlertSts]=1 to generate
-	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
-	 * of the requested command
-	 */
-	do {
-		sw_status = i2c_smbus_read_byte_data(data->client,
-						     SBRMI_STATUS);
-		if (sw_status < 0) {
-			ret = sw_status;
-			goto exit_unlock;
-		}
-		if (sw_status & SW_ALERT_MASK)
-			break;
-		usleep_range(50, 100);
-	} while (retry--);
-
-	if (retry < 0) {
-		dev_err(&data->client->dev,
-			"Firmware fail to indicate command completion\n");
-		ret = -EIO;
-		goto exit_unlock;
-	}
-
-	/*
-	 * For a read operation, the initiator (BMC) reads the firmware
-	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
-	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
-	 */
-	if (msg->read) {
-		for (i = 0; i < 4; i++) {
-			ret = i2c_smbus_read_byte_data(data->client,
-						       SBRMI_OUTBNDMSG1 + i);
-			if (ret < 0)
-				goto exit_unlock;
-			msg->data_out |= ret << i * 8;
-		}
-	}
-
-	/*
-	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
-	 * ALERT to initiator
-	 */
-	ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
-					sw_status | SW_ALERT_MASK);
-
-exit_unlock:
-	mutex_unlock(&data->lock);
-	return ret;
-}
 
 static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 		      u32 attr, int channel, long *val)
@@ -282,76 +110,35 @@ static const struct hwmon_chip_info sbrmi_chip_info = {
 	.info = sbrmi_info,
 };
 
-static int sbrmi_get_max_pwr_limit(struct sbrmi_data *data)
+static int sbrmi_probe(struct platform_device *pdev)
 {
-	struct sbrmi_mailbox_msg msg = { 0 };
-	int ret;
-
-	msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
-	msg.read = true;
-	ret = rmi_mailbox_xfer(data, &msg);
-	if (ret < 0)
-		return ret;
-	data->pwr_limit_max = msg.data_out;
-
-	return ret;
-}
-
-static int sbrmi_probe(struct i2c_client *client)
-{
-	struct device *dev = &client->dev;
+	struct device *dev = &pdev->dev;
 	struct device *hwmon_dev;
-	struct sbrmi_data *data;
-	int ret;
-
-	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->client = client;
-	mutex_init(&data->lock);
-
-	/* Enable alert for SB-RMI sequence */
-	ret = sbrmi_enable_alert(client);
-	if (ret < 0)
-		return ret;
+	struct sbrmi_data *data  = dev_get_drvdata(pdev->dev.parent);
 
-	/* Cache maximum power limit */
-	ret = sbrmi_get_max_pwr_limit(data);
-	if (ret < 0)
-		return ret;
-
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "sbrmi", data,
 							 &sbrmi_chip_info, NULL);
-
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-static const struct i2c_device_id sbrmi_id[] = {
-	{"sbrmi"},
-	{}
-};
-MODULE_DEVICE_TABLE(i2c, sbrmi_id);
-
-static const struct of_device_id __maybe_unused sbrmi_of_match[] = {
+static const struct platform_device_id sbrmi_id[] = {
 	{
-		.compatible = "amd,sbrmi",
+		.name = "sbrmi-hwmon",
 	},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, sbrmi_of_match);
+MODULE_DEVICE_TABLE(platform, sbrmi_id);
 
-static struct i2c_driver sbrmi_driver = {
+static struct platform_driver amd_sbrmi_hwmon_driver = {
+	.probe = sbrmi_probe,
 	.driver = {
-		.name = "sbrmi",
-		.of_match_table = of_match_ptr(sbrmi_of_match),
+		.name = "amd-sbrmi",
 	},
-	.probe = sbrmi_probe,
 	.id_table = sbrmi_id,
 };
-
-module_i2c_driver(sbrmi_driver);
+module_platform_driver(amd_sbrmi_hwmon_driver);
 
 MODULE_AUTHOR("Akshay Gupta <akshay.gupta@amd.com>");
+MODULE_AUTHOR("Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>");
 MODULE_DESCRIPTION("Hwmon driver for AMD SB-RMI emulated sensor");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 266b4f54af60..0411cb29b6df 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1442,6 +1442,15 @@ config MFD_STMPE
 		Touchscreen: stmpe-ts
 		ADC: stmpe-adc
 
+config MFD_SBRMI_I2C
+        tristate "APML SBRMI support"
+        depends on I2C
+        select MFD_CORE
+        help
+          APML RMI core support for AMD out of band management
+	  This driver can also be built as a module. If so, the module will
+	  be called sbrmi.
+
 menu "STMicroelectronics STMPE Interface Drivers"
 depends on MFD_STMPE
 
@@ -2333,6 +2342,5 @@ config MFD_RSMU_SPI
 	  This driver provides common support for accessing the device.
 	  Additional drivers must be enabled in order to use the functionality
 	  of the device.
-
 endmenu
 endif
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index c66f07edcd0e..6bc807c2e5ed 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -284,3 +284,5 @@ rsmu-i2c-objs			:= rsmu_core.o rsmu_i2c.o
 rsmu-spi-objs			:= rsmu_core.o rsmu_spi.o
 obj-$(CONFIG_MFD_RSMU_I2C)	+= rsmu-i2c.o
 obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu-spi.o
+apml_sbrmi-objs  		:= sbrmi-i2c.o sbrmi-core.o
+obj-$(CONFIG_MFD_SBRMI_I2C)     += apml_sbrmi.o
diff --git a/drivers/mfd/sbrmi-core.c b/drivers/mfd/sbrmi-core.c
new file mode 100644
index 000000000000..d872b5107b36
--- /dev/null
+++ b/drivers/mfd/sbrmi-core.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * sbrmi-common.c - file defining SB-RMI protocols
+ *		    compliant AMD SoC device.
+ *
+ * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
+ */
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mfd/amd-sb.h>
+#include <linux/mutex.h>
+
+/* Mask for Status Register bit[1] */
+#define SW_ALERT_MASK	0x2
+
+/* Software Interrupt for triggering */
+#define START_CMD	0x80
+#define TRIGGER_MAILBOX	0x01
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
+int rmi_mailbox_xfer(struct sbrmi_data *data,
+		     struct sbrmi_mailbox_msg *msg)
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
+EXPORT_SYMBOL(rmi_mailbox_xfer);
diff --git a/drivers/mfd/sbrmi-i2c.c b/drivers/mfd/sbrmi-i2c.c
new file mode 100644
index 000000000000..96215e986740
--- /dev/null
+++ b/drivers/mfd/sbrmi-i2c.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * sbrmi.c - hwmon driver for a SB-RMI mailbox
+ *           compliant AMD SoC device.
+ *
+ * Copyright (C) 2020-2024 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/mfd/amd-sb.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+
+#define SBRMI_CTRL	0x1
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
+static int sbrmi_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
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
+	return sbrmi_get_max_pwr_limit(data);
+}
+
+static const struct i2c_device_id sbrmi_id[] = {
+	{"sbrmi-mfd"},
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
+	.driver = {
+		.name = "sbrmi-mfd",
+		.of_match_table = of_match_ptr(sbrmi_of_match),
+	},
+	.probe = sbrmi_i2c_probe,
+	.id_table = sbrmi_id,
+};
+
+module_i2c_driver(sbrmi_driver);
+
+MODULE_AUTHOR("Akshay Gupta <akshay.gupta@amd.com>");
+MODULE_AUTHOR("Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>");
+MODULE_DESCRIPTION("Hwmon driver for AMD SB-RMI emulated sensor");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/amd-sb.h b/include/linux/mfd/amd-sb.h
new file mode 100644
index 000000000000..7805f31fb6ea
--- /dev/null
+++ b/include/linux/mfd/amd-sb.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AMD_SB_H_
+#define _AMD_SB_H_
+
+#include <linux/mutex.h>
+#include <linux/i2c.h>
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
+#if IS_ENABLED(CONFIG_MFD_SBRMI_I2C)
+int rmi_mailbox_xfer(struct sbrmi_data *data, struct sbrmi_mailbox_msg *msg);
+#else
+int rmi_mailbox_xfer(struct sbrmi_data *data, struct sbrmi_mailbox_msg *msg)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+#endif /*_AMD_SB_H_*/
-- 
2.25.1

