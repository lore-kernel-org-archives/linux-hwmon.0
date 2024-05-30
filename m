Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F59D172BB6
	for <linux-hwmon@vger.kernel.org>; Thu, 30 May 2024 11:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068224; cv=fail; b=uKQbymBPZ8hIbhVCyhfOZTY18XwatQ48+6FPPau1w6XwyJdm69o+ZZ129i/ktRmZamXNOKlJx0Y+kMTGmBg0Pw6BxMgIVRIdQPR+1UeRw4IMHoz1qu3CkGwbmYoADbgJg2ElO3q54xTIQWNZGxaRapTtJvmj//3HyO5NlchY80o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068224; c=relaxed/simple;
	bh=PxySybW7jGzVog/pejsCPcZ9NQ14hsNEb9HoSO5NFVg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gTRNWiOUjj7vsbebTSMWORTp5gBajsh+hSrx55lQTfLmTg8CxxWzfaIo8SoGHZhq3B/MlZHigXPks6wF9n0I+VzYehGY9Fk+gi+xGAgBCvYfiUOyW5KQtc/ufyUAPooOnEbWOMVWqv6F65CR8x6mK5WGmUHlEADkUUJmT5GoygQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GOVmSwZc; arc=fail smtp.client-ip=40.107.94.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GOVmSwZc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6gbg4W9rjL0nsCvTfhpuhzD0qpmWY02y0Sd9actuADa6FptH3KxR2lT084oZfUDIFFQdhUpBD7X+/JiLpTeO9TIS3Vw9xyGv9KKKvCVLCP95Zj8QQseX6xWm8PJazJMTqA2GCK5xXlDgHYsTVBEeWxewONr/i74HwYLYCBQIaT5zxou7BjMYWcqo4rcC1qxUI0IP8Z7cYqdhHAILJhj3zs4YqhVZTEhwA79SueVIoE8+nW4NzcJvcoagiR+LlgWf092COYETYluALf8tmGt5KMnsIa66BcJT0N/li52RSOfKdMv4xRzXhtJ/ubsAVekjLIfBd4lWEW46jLPLaIPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/Dq9w3snoL1gbr9sgG9jyujvGJq9GfbkvY6dE48EvI=;
 b=jst09A2i3GdHTsu2CsvQmJh9IAvuF1/4bAPCh3FXxRC3V762LER/401xHPQHqhQEOFun7AlO4yyKqwlBhonSwL0amU3Ni49q8RNFdjVPBjXEOg5IGb8AuqYhCmPm2/WsZqy7HtfmooS+oSSuEZYfrWHNknbb/V09CsWdgAN28p5H0RhiXptcZaS5ow3ynW0tJjb843hBg3JZmgnIIsW5l3Y4gbbRbGD1GLWShB8bCN7rspYp4pKBwbRScy948s2wNl3Bsmclac3xT6xKk6uOyFRlp+T9kyVz6WiKw+tkPxPd0+05WIo1LVPaXNaECyr3uMoQCPSgGVqXApFI6YLBuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/Dq9w3snoL1gbr9sgG9jyujvGJq9GfbkvY6dE48EvI=;
 b=GOVmSwZc5OnCs25VL2Gca7OGJ8l5WG40C89EN4+Ew0OMQByCyBoS1ZfrYfgM1pHpBpgcCoKxqJvWm3fWJ65f89uXo1GEBra2K1B5H0j7aDsec6YXMiMizqjXde8l1CWX0kYmHcfd96y8uTUZiawQK5bLJqPm51NTWtlVyvvX33o=
Received: from MN2PR17CA0035.namprd17.prod.outlook.com (2603:10b6:208:15e::48)
 by DM6PR12MB4092.namprd12.prod.outlook.com (2603:10b6:5:214::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Thu, 30 May
 2024 11:23:38 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::da) by MN2PR17CA0035.outlook.office365.com
 (2603:10b6:208:15e::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21 via Frontend
 Transport; Thu, 30 May 2024 11:23:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 30 May 2024 11:23:38 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 May
 2024 06:23:34 -0500
From: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <lee@kernel.org>, <gregkh@linuxfoundation.org>,
	<arnd@arndb.de>, Akshay Gupta <akshay.gupta@amd.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 3/5] mfd/hwmon sbrmi: Use regmap subsystem
Date: Thu, 30 May 2024 11:23:05 +0000
Message-ID: <20240530112307.3089696-4-naveenkrishna.chatradhi@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|DM6PR12MB4092:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a93da91-a173-463c-1d1b-08dc809af3c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H9x4GeTkCnL0urozHqeGPlJ/tEG4aAviz9bsdb2jnpbu1jx9soJrEDRqURMG?=
 =?us-ascii?Q?E707xYMkZGgaTwOQkaSyILlZgEXCRnTOPFd4XFdBR/+gC2oS8OR1pGGOBSWT?=
 =?us-ascii?Q?jJsr/3b4ffl23DJg3T1ocqi8ZNJcAsyaQnpMMJ4c7uqUAxPpgRdFBc6anmsd?=
 =?us-ascii?Q?JkRQMpDWD81wm2g8owcD1iHBXmrV7WQNt4lUe2i2HEKeO6+zml4AvdI1dH6u?=
 =?us-ascii?Q?tUnVZJDrAFaO6iC3PQaE9DEknxlp0K8NeRUd0vGhh0RmIvvViz1SwT4Xo95K?=
 =?us-ascii?Q?1RQWv6mDe3tnHZFjXhh04I7KGtmbX/y19XRpkdtqkZKUs212AsnorA0lZgO3?=
 =?us-ascii?Q?0PHqGay6LG2/GYH5tUVCMkI79vcowaCVCh+aqZnpZyGjcVGIEJBqRJQ3nsuU?=
 =?us-ascii?Q?eMclL9X/JrasB7ZjPa22p+7lz0bKGrqeO1q1kN4IWHwmDi88x87HD8ZJVm34?=
 =?us-ascii?Q?YHJdDul62eQxcv7DH63wDrEXzJfvR3y9qA9jBUXNoXhrAXEOyxwxpSMG6zf8?=
 =?us-ascii?Q?Ro7JI/4ikj/QcI5sjGGaFnqVV2k6vgzI0PB96EKm64p0/KQ1EmkIHW3OTdkN?=
 =?us-ascii?Q?0Ao0OQ4fBjRINtNG1CLixdKOOTa43bsHnGalTc8iSU9frwXTRya0mxKoisW4?=
 =?us-ascii?Q?mL1guQquwxYRSGhxSI4zAzsFLbnn+e4PUL4pGzzWfaK/plwmVFC+VCJVvaxp?=
 =?us-ascii?Q?8GvcKqmdiP9DVlmWpDcNiq/GzN8WQQQNrcxYfYoq2TCt4J6KL/MzrmVplcyZ?=
 =?us-ascii?Q?ygzvKmd19eyeUoXU1kiw7T7Tja+97dstnKfVFUe8I4G81KKHerBaeiBOdnrH?=
 =?us-ascii?Q?aKUwOh4Mp0kBsvRsgcCQBhVcsVaPLGRiKbooeHtwF9jVy9RlZFFJm2aIQCeK?=
 =?us-ascii?Q?3GRVYjV6XuEJMH5z6VL/kXhC8wSTv6qCTAusaQEvxNPyGKVZlWJIfWoyPzv/?=
 =?us-ascii?Q?8pkoJGMDoTVnV2LqJaz6aaeuQ72LgpUz/6RXWa6yqj9Xjexazvd5lAkHlihK?=
 =?us-ascii?Q?2Fa2DJsUe6J/1czhXI2XQ5UzYDaVIVfxLMUbEoAEEuO3OTPJI5EvC4j1mIZW?=
 =?us-ascii?Q?llqFr7IgWjKzygVWQ3PQ0XNoakW50iwR6yk4XvcafGJV0jXfdfEXywmsglTW?=
 =?us-ascii?Q?lBeO0bTvqtuwAW0v0CE5VZUzzuy8mo6TC45D26cTfvYf26smXnI/XEgVDokD?=
 =?us-ascii?Q?QR84eOtnPIiMkc8Xs0oivakdq/9Z110oST+gahGheQUHXrRx8UmH8Sb+VWq5?=
 =?us-ascii?Q?8ZODF0ihnLhu5HFAbv/SOjWXbqbyCgjCGgkkoOzN8NgvigsptoRPtTCZ7hxR?=
 =?us-ascii?Q?v3qIJZnSFvLuwbjhiabnrszpZYn0L0lsWRtSfWVms7S/AN+KkXdsFS2s6uCj?=
 =?us-ascii?Q?4ELedqiiNarvSfnFIP1ayMusO95A?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 11:23:38.2202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a93da91-a173-463c-1d1b-08dc809af3c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4092

From: Akshay Gupta <akshay.gupta@amd.com>

- regmap subsystem provides multiple benefits over direct smbus APIs
- The susbsytem can be helpful in following cases
  - Differnet types of bus (i2c/i3c)
  - Different Register address size (1byte/2byte)

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/mfd/Kconfig        |  2 +-
 drivers/mfd/sbrmi-core.c   | 30 ++++++++++++------------------
 drivers/mfd/sbrmi-i2c.c    | 25 ++++++++++++++++---------
 include/linux/mfd/amd-sb.h |  6 +++---
 4 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 0411cb29b6df..d89513e5a06b 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1444,8 +1444,8 @@ config MFD_STMPE
 
 config MFD_SBRMI_I2C
         tristate "APML SBRMI support"
-        depends on I2C
         select MFD_CORE
+        select REGMAP_I2C
         help
           APML RMI core support for AMD out of band management
 	  This driver can also be built as a module. If so, the module will
diff --git a/drivers/mfd/sbrmi-core.c b/drivers/mfd/sbrmi-core.c
index d872b5107b36..5617b91787ba 100644
--- a/drivers/mfd/sbrmi-core.c
+++ b/drivers/mfd/sbrmi-core.c
@@ -7,9 +7,9 @@
  */
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/i2c.h>
 #include <linux/mfd/amd-sb.h>
 #include <linux/mutex.h>
+#include <linux/regmap.h>
 
 /* Mask for Status Register bit[1] */
 #define SW_ALERT_MASK	0x2
@@ -44,6 +44,7 @@ enum sbrmi_reg {
 int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct sbrmi_mailbox_msg *msg)
 {
+	unsigned int bytes;
 	int i, ret, retry = 10;
 	int sw_status;
 	u8 byte;
@@ -51,14 +52,12 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	mutex_lock(&data->lock);
 
 	/* Indicate firmware a command is to be serviced */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_INBNDMSG7, START_CMD);
+	ret = regmap_write(data->regmap, SBRMI_INBNDMSG7, START_CMD);
 	if (ret < 0)
 		goto exit_unlock;
 
 	/* Write the command to SBRMI::InBndMsg_inst0 */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_INBNDMSG0, msg->cmd);
+	ret = regmap_write(data->regmap, SBRMI_INBNDMSG0, msg->cmd);
 	if (ret < 0)
 		goto exit_unlock;
 
@@ -69,8 +68,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 */
 	for (i = 0; i < 4; i++) {
 		byte = (msg->data_in >> i * 8) & 0xff;
-		ret = i2c_smbus_write_byte_data(data->client,
-						SBRMI_INBNDMSG1 + i, byte);
+		ret = regmap_write(data->regmap, SBRMI_INBNDMSG1 + i, byte);
 		if (ret < 0)
 			goto exit_unlock;
 	}
@@ -79,8 +77,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
 	 * perform the requested read or write command
 	 */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
+	ret = regmap_write(data->regmap, SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
 	if (ret < 0)
 		goto exit_unlock;
 
@@ -90,8 +87,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * of the requested command
 	 */
 	do {
-		sw_status = i2c_smbus_read_byte_data(data->client,
-						     SBRMI_STATUS);
+		ret = regmap_read(data->regmap, SBRMI_STATUS, &sw_status);
 		if (sw_status < 0) {
 			ret = sw_status;
 			goto exit_unlock;
@@ -102,8 +98,6 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	} while (retry--);
 
 	if (retry < 0) {
-		dev_err(&data->client->dev,
-			"Firmware fail to indicate command completion\n");
 		ret = -EIO;
 		goto exit_unlock;
 	}
@@ -115,11 +109,11 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 */
 	if (msg->read) {
 		for (i = 0; i < 4; i++) {
-			ret = i2c_smbus_read_byte_data(data->client,
-						       SBRMI_OUTBNDMSG1 + i);
+			ret = regmap_read(data->regmap,
+					  SBRMI_OUTBNDMSG1 + i, &bytes);
 			if (ret < 0)
 				goto exit_unlock;
-			msg->data_out |= ret << i * 8;
+			msg->data_out |= bytes << i * 8;
 		}
 	}
 
@@ -127,8 +121,8 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
 	 * ALERT to initiator
 	 */
-	ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
-					sw_status | SW_ALERT_MASK);
+	ret = regmap_write(data->regmap, SBRMI_STATUS,
+			   sw_status | SW_ALERT_MASK);
 
 exit_unlock:
 	mutex_unlock(&data->lock);
diff --git a/drivers/mfd/sbrmi-i2c.c b/drivers/mfd/sbrmi-i2c.c
index c19f0b3eb0cd..bdf15a7a2167 100644
--- a/drivers/mfd/sbrmi-i2c.c
+++ b/drivers/mfd/sbrmi-i2c.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/regmap.h>
 
 #define SBRMI_CTRL	0x1
 
@@ -22,22 +23,21 @@ static struct mfd_cell apml_sbrmi[] = {
 	{ .name = "sbrmi-hwmon" },
 };
 
-static int sbrmi_enable_alert(struct i2c_client *client)
+static int sbrmi_enable_alert(struct sbrmi_data *data)
 {
-	int ctrl;
+	int ctrl, ret;
 
 	/*
 	 * Enable the SB-RMI Software alert status
 	 * by writing 0 to bit 4 of Control register(0x1)
 	 */
-	ctrl = i2c_smbus_read_byte_data(client, SBRMI_CTRL);
-	if (ctrl < 0)
-		return ctrl;
+	ret = regmap_read(data->regmap, SBRMI_CTRL, &ctrl);
+	if (ret < 0)
+		return ret;
 
 	if (ctrl & 0x10) {
 		ctrl &= ~0x10;
-		return i2c_smbus_write_byte_data(client,
-						 SBRMI_CTRL, ctrl);
+		return regmap_write(data->regmap, SBRMI_CTRL, ctrl);
 	}
 
 	return 0;
@@ -62,17 +62,24 @@ static int sbrmi_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct sbrmi_data *data;
+	struct regmap_config sbrmi_i2c_regmap_config = {
+		.reg_bits = 8,
+		.val_bits = 8,
+	};
 	int ret;
 
 	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->client = client;
 	mutex_init(&data->lock);
 
+	data->regmap = devm_regmap_init_i2c(client, &sbrmi_i2c_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
 	/* Enable alert for SB-RMI sequence */
-	ret = sbrmi_enable_alert(client);
+	ret = sbrmi_enable_alert(data);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/linux/mfd/amd-sb.h b/include/linux/mfd/amd-sb.h
index 7805f31fb6ea..977b8228ffa1 100644
--- a/include/linux/mfd/amd-sb.h
+++ b/include/linux/mfd/amd-sb.h
@@ -7,7 +7,7 @@
 #define _AMD_SB_H_
 
 #include <linux/mutex.h>
-#include <linux/i2c.h>
+#include <linux/regmap.h>
 /*
  * SB-RMI supports soft mailbox service request to MP1 (power management
  * firmware) through SBRMI inbound/outbound message registers.
@@ -22,10 +22,10 @@ enum sbrmi_msg_id {
 
 /* Each client has this additional data */
 struct sbrmi_data {
-	struct i2c_client *client;
+	struct regmap *regmap;
 	struct mutex lock;
 	u32 pwr_limit_max;
-};
+} __packed;
 
 struct sbrmi_mailbox_msg {
 	u8 cmd;
-- 
2.25.1

