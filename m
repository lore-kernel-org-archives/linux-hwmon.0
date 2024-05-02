Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C2257C81
	for <linux-hwmon@vger.kernel.org>; Thu,  2 May 2024 22:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714687585; cv=fail; b=PMOHxYlUxGE9mvHe3DjV3pLPIcZmToQQJKNZ9H2oaM78rkXoRutUbosrGufrG7c9KG+KUJ8IEWxnn+HsWs69VdTagDYYLnYPd4MnQaWbkydaeKjiQz6jRrVk+QrOGhXagducj21xBzmHqsrHwtBehZVzxbQMFE+L5ulrYCHZylA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714687585; c=relaxed/simple;
	bh=mpxLADePhfVMP6Vu+AX7S3Dssab9rsqMDez3kMFhnPE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ouww3X9a0P3Rtm3D7w7F6ID5jlhxqdn4MMheg42BgIUSySv8bxfbFRlg8qf+sbPENQP5zpFHqRV2DqwyXHxVIbepJYk+/vJ0inDwLJGCdBSjBbX1m35rMiu21ai0KqmDg3/7lNvMoeQVhEM4cEPv/AO77bt0b67IRLIJYoYbrYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FKHsSCdn; arc=fail smtp.client-ip=40.107.243.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FKHsSCdn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BR5MVEWJ/UcwyAF8OzzZEh4CI776+pEzlVHvPcR0S1UWvca7xYPBq8aZQ0uaiCwuEI7/+RfCR4pdPWg4+reJtXb1iHKu1xrv7mjmK4rVUgydb+miuIZsbSidiZvUQqXeOTB35jnntN0CxQNbhOKcLSVNxNuw+RF8PdyZRlETT50+IVqhUNojJIUPdnD4nWHDO1MB6y5RgovLeuIGgZUyes2On+a4/n4UHqgeoU+CTRNZKNqMYilS16CubPFNh9jvP74vW5mtaXmPMUP7wTmmVN/tUMkFbVNNSfo8hTmTLBPfVIsoCc59rSpM28VBQERtB8DIudvTg2PG1uQ+Di4w/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDv+MiRXZWdUFAx1Psz3KoZdo9vQMYVeR05NbnDmROY=;
 b=M9XEoVYFYuY1Orfnbrpfew0xFbbPSKmlqdmRxpwAZB7ff7BETDLkVM7OubQkZjSZ0mde9021Bd8TSSUfSSSHUm4hGqQEn3acIz1314vKKc/2im79u1QgFvwDOafSd0Fja7RaNe/XVh/9WpSLP9LqbqC4gFnejfkJu3H8t4KVLGCN2ZkSionkeX+8uCCubL38tiFrW+WEPSDBoeZU9R+igj0wQeOEBIesN6FWy0xHi0S6V//AZFnogfMeE34os3ITpRe1o7tZ6BdIWixl90L+wfnId05dctEg2sNCEGjcDUWGDZV8bA6pi2R+CpJmjt0DtCLoQtli7QUdfe62X4uRkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDv+MiRXZWdUFAx1Psz3KoZdo9vQMYVeR05NbnDmROY=;
 b=FKHsSCdnwngQjvn7LbOs7rUX/vLfpUlpw6PJ5Ot76RR+m8fKhV0gL6qdM4sJLyTZr4jxf7nJtpdHyg572Y9tyEqnxmoHAwZtSerntZDo+XL3kRDHlXpuNdeCxU5DwfC5rGaisoFfU6S+sKNtui0HoNZktXS2SSRY7Q26u04kj4g=
Received: from MW4P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::8) by
 SJ0PR12MB6781.namprd12.prod.outlook.com (2603:10b6:a03:44b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Thu, 2 May
 2024 22:06:13 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:8b:cafe::86) by MW4P221CA0003.outlook.office365.com
 (2603:10b6:303:8b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34 via Frontend
 Transport; Thu, 2 May 2024 22:06:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.0 via Frontend Transport; Thu, 2 May 2024 22:06:13 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 2 May
 2024 17:06:11 -0500
From: Naveen Krishna Chatradhi <nchatrad@amd.com>
To: <linux-hwmon@vger.kernel.org>
CC: <linux@roeck-us.net>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>, Akshay Gupta <Akshay.Gupta@amd.com>
Subject: [PATCH 1/2] sbrmi: Use regmap subsystem
Date: Thu, 2 May 2024 22:05:53 +0000
Message-ID: <20240502220554.2768611-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|SJ0PR12MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ff7c55-13b0-4cd4-e0c4-08dc6af414df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jL2vSriOU3nlgFetBBhFlQGfsApGCRe0nBc2moPg9JcagKXsp3FUa0bydL9P?=
 =?us-ascii?Q?vtav02XhKA/spbDni8VjfBxqAY5RBg6eANLBdVuurJHGcty81r/r+EjxjZ0u?=
 =?us-ascii?Q?AHE0p9HqapEgRJE4vvGTv8NXK/Su0nZ10IZ9C+mdEeujU8tvcYbFCUdvzJYN?=
 =?us-ascii?Q?d+ZufWmCxnp1k5lk4vbfgwrX3ZR42QRpu3kOKlCFMQye4QRxs+mV1InlWtk7?=
 =?us-ascii?Q?tf8mzOk7/KgAzdOp9dBF6HA/3tA32NwBa9wPpGRCHyPmNfLr3qRBZ2r7ptXf?=
 =?us-ascii?Q?rGepH1Wz1o5Zb67loXld69BkG5HyCG9LuxCfn9kmpgOgWuGjFHHSAtHZ7Yyg?=
 =?us-ascii?Q?ptKotQ7od0rQvpdG4Y1sRqneKdbMHjAoCeIEni4tpkqykyMZlX2mC1oyODCO?=
 =?us-ascii?Q?Di9CVgyrdO+dW3HA310OX/SpuMHcxprWJC8kCwO2a01lsmPPuGLvnR64xXkN?=
 =?us-ascii?Q?Nh2NJ0sFqADFFp9+MspecnrEMVj3NUMtCg91ynkndgWXRiDREsSog3XHxssn?=
 =?us-ascii?Q?3duBIfUGQkzy2Rp+tI7u34nPz6cZwPf9StBfFY9sqXgK7h5TJwwJPc8M/bQs?=
 =?us-ascii?Q?A+yo/p4VsBIXILRgkDHiEyo681ujUe1JD0drI3wFnY/QU+5K8a8bdbgiL2e1?=
 =?us-ascii?Q?aw40Ljd6rO8dCOMzddYCD5O6luGOBAg2PgsivnkafFRB0E403XdmHcdBm8i3?=
 =?us-ascii?Q?e0wpvHVGUQlwe2kzhdNaWsa6TBjxvZ3NNBf8k0nu9NfIZCaHh+bBANeKCZbs?=
 =?us-ascii?Q?2XgkOtNK8op9LMDPC2TRSrhNIdyMkpjSzQKw9z6ccGJ8PJkl8pjvO13jBrTo?=
 =?us-ascii?Q?/eToM54iZcsRsMqo08gwsuQbERopuaUyWAukb4rfKtdLknDNimJo+q+ysZzy?=
 =?us-ascii?Q?RW951nqs3SFCBVaPjRqLwjrTUEw7hRVNnWlQRuweJLVNDgfE3SoO/FAz7QQ2?=
 =?us-ascii?Q?Z86kpQ36kGkHp1dkuGst5nULNvu5YxXiZUYLrSLiAgxgWGIrc7zd4eTVDbJV?=
 =?us-ascii?Q?kN4o03+sFp+6AmZ7ge0xPZ4woVxlzf1mmrXYjpiN/7MAAoy6fAzUORa5Tc2J?=
 =?us-ascii?Q?KDtmsaITXVyXEKtMlb//14Ha6mvERooScSTUSaarO/S+bAZmMbQLZKHJcTp2?=
 =?us-ascii?Q?2KrwBljotEEpVwewrFwp6i3CoKapQ6Yp5NFsEuJRy16qj5rzWv3AC2pIsfUq?=
 =?us-ascii?Q?aYOJKtbDFUnkZp2bUA/CAxfSbxbiTny5BPuQjoGnTUU/MYr23y11WWc/Q8en?=
 =?us-ascii?Q?S1RUGdC/4HB1jZJjRzMCt9ZkaY9Cgr7nQfJN3l+m32Ay/CIDS69aq5JrgC/K?=
 =?us-ascii?Q?RNvVezfuO9MW7KtGPmnNiUirhLAUtOd2+PrWWnapPtliIoE48gXkKntmptOK?=
 =?us-ascii?Q?TbgwlcsXLGJPOHmpJbo1Yom3fMNz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 22:06:13.3142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ff7c55-13b0-4cd4-e0c4-08dc6af414df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6781

From: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

- regmap subsystem provides multiple benefits over direct smbus APIs
- The susbsytem can be helpful in following cases
  - Differnet types of bus (i2c/i3c)
  - Different Register address size (1byte/2byte)

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/hwmon/Kconfig |  1 +
 drivers/hwmon/sbrmi.c | 61 ++++++++++++++++++++++++-------------------
 2 files changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index a608264da87d..903a8ebbd2d7 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1759,6 +1759,7 @@ config SENSORS_SBTSI
 config SENSORS_SBRMI
 	tristate "Emulated SB-RMI sensor"
 	depends on I2C
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for emulated RMI
 	  sensors on AMD SoCs with APML interface connected to a BMC device.
diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c
index 484703f0ea5f..901bd82d71d4 100644
--- a/drivers/hwmon/sbrmi.c
+++ b/drivers/hwmon/sbrmi.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/regmap.h>

 /* Do not allow setting negative power limit */
 #define SBRMI_PWR_MIN	0
@@ -63,6 +64,7 @@ enum sbrmi_reg {
 struct sbrmi_data {
 	struct i2c_client *client;
 	struct mutex lock;
+	struct regmap *regmap;
 	u32 pwr_limit_max;
 };

@@ -73,22 +75,21 @@ struct sbrmi_mailbox_msg {
 	u32 data_out;
 };

-static int sbrmi_enable_alert(struct i2c_client *client)
+static int sbrmi_enable_alert(struct sbrmi_data *data)
 {
-	int ctrl;
+	int ctrl, ret = 0;

 	/*
 	 * Enable the SB-RMI Software alert status
 	 * by writing 0 to bit 4 of Control register(0x1)
 	 */
-	ctrl = i2c_smbus_read_byte_data(client, SBRMI_CTRL);
-	if (ctrl < 0)
-		return ctrl;
+	ret = regmap_read(data->regmap, SBRMI_STATUS, &ctrl);
+	if (ret < 0)
+		return ret;

 	if (ctrl & 0x10) {
 		ctrl &= ~0x10;
-		return i2c_smbus_write_byte_data(client,
-						 SBRMI_CTRL, ctrl);
+		return regmap_write(data->regmap, SBRMI_CTRL, ctrl);
 	}

 	return 0;
@@ -97,6 +98,7 @@ static int sbrmi_enable_alert(struct i2c_client *client)
 static int rmi_mailbox_xfer(struct sbrmi_data *data,
 			    struct sbrmi_mailbox_msg *msg)
 {
+	unsigned int bytes = 0;
 	int i, ret, retry = 10;
 	int sw_status;
 	u8 byte;
@@ -104,14 +106,12 @@ static int rmi_mailbox_xfer(struct sbrmi_data *data,
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

@@ -122,8 +122,7 @@ static int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 */
 	for (i = 0; i < 4; i++) {
 		byte = (msg->data_in >> i * 8) & 0xff;
-		ret = i2c_smbus_write_byte_data(data->client,
-						SBRMI_INBNDMSG1 + i, byte);
+		ret = regmap_write(data->regmap, SBRMI_INBNDMSG1 + i, byte);
 		if (ret < 0)
 			goto exit_unlock;
 	}
@@ -132,8 +131,7 @@ static int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
 	 * perform the requested read or write command
 	 */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
+	ret = regmap_write(data->regmap, SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
 	if (ret < 0)
 		goto exit_unlock;

@@ -143,8 +141,7 @@ static int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * of the requested command
 	 */
 	do {
-		sw_status = i2c_smbus_read_byte_data(data->client,
-						     SBRMI_STATUS);
+		ret = regmap_read(data->regmap, SBRMI_STATUS, &sw_status);
 		if (sw_status < 0) {
 			ret = sw_status;
 			goto exit_unlock;
@@ -168,11 +165,11 @@ static int rmi_mailbox_xfer(struct sbrmi_data *data,
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

@@ -180,9 +177,8 @@ static int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
 	 * ALERT to initiator
 	 */
-	ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
-					sw_status | SW_ALERT_MASK);
-
+	ret = regmap_write(data->regmap, SBRMI_STATUS,
+			   sw_status | SW_ALERT_MASK);
 exit_unlock:
 	mutex_unlock(&data->lock);
 	return ret;
@@ -265,7 +261,7 @@ static umode_t sbrmi_is_visible(const void *data,
 	return 0;
 }

-static const struct hwmon_channel_info * const sbrmi_info[] = {
+static const struct hwmon_channel_info *sbrmi_info[] = {
 	HWMON_CHANNEL_INFO(power,
 			   HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_MAX),
 	NULL
@@ -302,6 +298,10 @@ static int sbrmi_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct sbrmi_data *data;
+	struct regmap_config sbrmi_i2c_regmap_config = {
+		.reg_bits = 8,
+		.val_bits = 8,
+	};
 	int ret;

 	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
@@ -310,9 +310,12 @@ static int sbrmi_probe(struct i2c_client *client)

 	data->client = client;
 	mutex_init(&data->lock);
+	data->regmap = devm_regmap_init_i2c(client, &sbrmi_i2c_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);

 	/* Enable alert for SB-RMI sequence */
-	ret = sbrmi_enable_alert(client);
+	ret = sbrmi_enable_alert(data);
 	if (ret < 0)
 		return ret;

@@ -321,8 +324,12 @@ static int sbrmi_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;

-	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
-							 &sbrmi_chip_info, NULL);
+	dev_set_drvdata(dev, (void *)data);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &sbrmi_chip_info,
+							 NULL);

 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
--
2.25.1

