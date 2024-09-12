Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7BF189F2A
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2024 07:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726124925; cv=fail; b=gLPhqXAKFq0pM6vUL+SVUMPoS8WxWpD8XvJd5oOiDRWHz6041Z/5P6Z5VaudEP//EgHTJ0y1gJiuC+jWX/JLZ97UlGZQYP4+uKeOoLvoCxPFEx8GGE12+nglwVAUKOwlG6XduRQ+RGYQvWKVaCJvtcH9A1oWM9D1X4GDw/3eNLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726124925; c=relaxed/simple;
	bh=jMv/QrqBJFuuYIVqev3tXqeWryWjk29ATHYANcNnXv8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h15CTWZGUBHCi2ny2xQOuNVux7l7dpqBiJ0tdJvSa01FFR8CCMxiKZ+O06TIUo+yelNT0v81C8VxU0mnVKcgjiN/LdSbwjxVvdsHcGuRk1O/fYV8LIiTbYFMTfFtJOslPP324zoCR8ezEA8Yl8qf7xK6AmQzuFpM5LFsjISCUsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kJMkAAjS; arc=fail smtp.client-ip=40.107.93.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kJMkAAjS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbaimzdERKjLnMy1izcL+lWMajZqwmRP/PsHmvHFq0c+YJu4zMy3PhwZmiXta9eVU+JEilBmPyfhhriOTrG2Fux2HMiVrpnOBGYYButHcEBIenRVaF7GvJl/F7xQKwAy2/kF38NoNoVTg8se+hZwdWgqdeHn0pfmt8RusJKQGO6llSIeD7Z4HWcexrtfTAcmTooCPnxs+8TkuY1ls8ROCKq3aim7LAn+ddGK7m+QJ3R1cMBhcwGtTKsB+X4hAGMs4l/TIoEYO3oE8CZBpAfhjt2xBlkxzpsL08QlndNEStGbAlHUtIr2IViZEa19IZL5dHgQvrhVYZlSv2BLLLsssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioX+ve7GGeemcpIvhLj7o9nLzvlqlaRoA7YT3+R7ra8=;
 b=xfg6+QGbVxKY6C5vVqd0J9hyFvPZA3DL4TDwyxuRPhZIanRLEScKtPNcsEbmlluYu4EF7QtzOf1VXI+WdBJHwJWVjDKUxKN7qZBtbDrhs9h5GAk10V255QZcGbYS4ERK+YFceTyPt/zjEP8vBrTFJIDoIZ7pHvPqM0UUf2gWUt9JaTF+C54Hl+byurSUtjmDCaPJWY5nyIIB9jWY+JnP29bs5epoaVYy1Ly3Qhu5EEDl/hvmAvJIFSruVfKsjhca169fjK6Wp7P/8HuEhf+bqFnGIZwm7pcgFBiQNBlkOhP9NjrnE46EehCqCsgymqhSYO3pLwxUVS4MssggX1M+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioX+ve7GGeemcpIvhLj7o9nLzvlqlaRoA7YT3+R7ra8=;
 b=kJMkAAjSrAsYPKfNnGtKwdh5nMFSYvW80s/0O58jV3TOBkG63l51wtS0dl4cf7r3IyT23zr+WAVW8ppMU3Uye1d6dtIm71XD1HGboAM45z2oS9DjBpgR/xcd7YIwDxOhOjjWOeT3JgkfjhyrOZDLC8cEYkwM92CKeRMy3skjnko=
Received: from CH5PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:1f4::29)
 by CH3PR12MB9080.namprd12.prod.outlook.com (2603:10b6:610:1a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Thu, 12 Sep
 2024 07:08:39 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::65) by CH5PR04CA0018.outlook.office365.com
 (2603:10b6:610:1f4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.27 via Frontend
 Transport; Thu, 12 Sep 2024 07:08:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 12 Sep 2024 07:08:38 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Sep
 2024 02:08:36 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<naveenkrishna.chatradhi@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v4 2/9] misc: amd-sbi: Use regmap subsystem
Date: Thu, 12 Sep 2024 07:08:03 +0000
Message-ID: <20240912070810.1644621-3-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912070810.1644621-1-akshay.gupta@amd.com>
References: <20240912070810.1644621-1-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|CH3PR12MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5f08c8-70d0-485e-ad5f-08dcd2f9ba12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Avt+Q2U1rvA6PnqSsd1QzUHwuAdNCf3aELyCFj+8bKqNzCAfmkcYmqivmaxw?=
 =?us-ascii?Q?Y3SueNLbxujJWizWigCBuj3GL1fHi1y+x5gi7HlCNNCRQ+kAwRwHieRTPWEJ?=
 =?us-ascii?Q?ug4IwXyFyOsxpi3yLJ700uw9P0u04ABWhQ+Rr00mUEF6j0flobI5IYwVKQVa?=
 =?us-ascii?Q?aokxj6ygQ+wPYFj5ASpAnYNV1nKLxxa1Ys+65KOQnfhQ2fyYrleuaAd6a1f3?=
 =?us-ascii?Q?wgpevg6E2+la8qTDpB5Kt5KX2nxMAud2InSo2Uhu3QrKO0VG2p8b3FwW7DY3?=
 =?us-ascii?Q?WwT0nrdTjByC25eof9ha1cmnsDcZc+HL2dk4rZJl0dbQI6sSyveP+ThECBAN?=
 =?us-ascii?Q?M3dNthdV0N0tU9eOWu+S7G1w+RbIcpICuOTSKjFa64PXmVmaxDoAxI11H4bc?=
 =?us-ascii?Q?dt0Ja7pTam+/5uwfQxpUtwatYDRwdqVBSFN3ePmva6ein6X8/Cc/dhm7B9Ff?=
 =?us-ascii?Q?zsYxNekdXVVMnaG4wYhhPkstlSSKy+IQ49NCefLPC3mbvY7TjtnOGnkEUp9f?=
 =?us-ascii?Q?y2RyzFvsyCPk68UWY4XHclX5X+Zevw7uns5UEo7jJTvJ5AJEvo/8bgMbRlKu?=
 =?us-ascii?Q?FJYXRnBg0G69f4msz7C9DoSCs6H9HERTrx5w/AIYMEwtNKCX8n0yTSXBzGca?=
 =?us-ascii?Q?W7GpApXqMyKZ4GxkLZYgcusWAi7tWwyUWneZ3xxZfCVFBpB0PMoHMg2fgNYm?=
 =?us-ascii?Q?R4tt2eyO410l2FbiDbQabNBf2Dzi9/QzG6jKwjc5N3wlN3klyEs+qzwQxo3R?=
 =?us-ascii?Q?0bTRKGUDaJQnkBl3xJN41i86PckTp9xMPqdap9gGAEuf0zNXVudKRsa1I/hw?=
 =?us-ascii?Q?wupmnwDk9fyGOSdmCed73Xj0yOv4TH9N7+Agk/me9E4RV8Fg5L+FiOblWNfV?=
 =?us-ascii?Q?kmt4WWqojqfeKmpKYkzmh42ZAYi3oXH5U34dI358XcYDjcaJkHw+OLpz9uns?=
 =?us-ascii?Q?ZY15BI9LKZ9RNg7RTktR1QKraRJw/C/OHs1RygylRN04kNDbck6BDcCX+DzC?=
 =?us-ascii?Q?tJIuC8fxnA1wZBG7RNpCKf96DS5AgqetsdjFSOrtNwdikfWXhK9zBxtNCouX?=
 =?us-ascii?Q?X6D/5/Xf9geoUeo3KaRA+XaL97wkgVTQa760Byqrjf6QO0TNGxhQi5cPzu3t?=
 =?us-ascii?Q?WYNA0+qYPGPp7EtRAcIQjZ29WCd7XzPwbrm0o7dRTaXw+tW4hUCAZfLGmj11?=
 =?us-ascii?Q?ehBXqinpcPRDhO1XpM+JnKGhmFSjg+Pk4VkG9bRZObt5fmwCvfS0EmhjDIz5?=
 =?us-ascii?Q?iGbAqoM+D0DNOe3tBEJCv+bNBfpI8VaFIshe6lHyKfyrDfxp98ehw72SAKhd?=
 =?us-ascii?Q?+V/Ae/TJHBrtdUaeVTQa3dWYhMkh2g/qLEmJhibkXc/wvl8IBWjckWOcYZt9?=
 =?us-ascii?Q?8fQdwrKljGoJnRrZjltYGb3+5HZ49SOHSMwKJ9RBAuQElGf/YPF4T+jHvyLr?=
 =?us-ascii?Q?9HTZarBke9Ve6T0W7Wf0G5AGcPJaN9Px?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 07:08:38.9306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5f08c8-70d0-485e-ad5f-08dcd2f9ba12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9080

- regmap subsystem provides multiple benefits over direct smbus APIs
- The susbsytem can be helpful in following cases
  - Differnet types of bus (i2c/i3c), we have plans to support i3c.
  - Different Register address size (1byte/2byte)

Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
- Previously patch 3
- Remove "__packed" from data structure

 drivers/misc/amd-sbi/rmi-core.c | 29 ++++++++++++-----------------
 drivers/misc/amd-sbi/rmi-core.h |  3 ++-
 drivers/misc/amd-sbi/rmi-i2c.c  | 25 ++++++++++++++++---------
 3 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 5d93fb703fa0..5a0b7912cc4e 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/mutex.h>
+#include <linux/regmap.h>
 #include "rmi-core.h"
 
 /* Mask for Status Register bit[1] */
@@ -23,6 +24,7 @@
 int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct sbrmi_mailbox_msg *msg)
 {
+	unsigned int bytes;
 	int i, ret, retry = 10;
 	int sw_status;
 	u8 byte;
@@ -30,14 +32,12 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
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
 
@@ -48,8 +48,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 */
 	for (i = 0; i < 4; i++) {
 		byte = (msg->data_in >> i * 8) & 0xff;
-		ret = i2c_smbus_write_byte_data(data->client,
-						SBRMI_INBNDMSG1 + i, byte);
+		ret = regmap_write(data->regmap, SBRMI_INBNDMSG1 + i, byte);
 		if (ret < 0)
 			goto exit_unlock;
 	}
@@ -58,8 +57,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
 	 * perform the requested read or write command
 	 */
-	ret = i2c_smbus_write_byte_data(data->client,
-					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
+	ret = regmap_write(data->regmap, SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
 	if (ret < 0)
 		goto exit_unlock;
 
@@ -69,8 +67,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * of the requested command
 	 */
 	do {
-		sw_status = i2c_smbus_read_byte_data(data->client,
-						     SBRMI_STATUS);
+		ret = regmap_read(data->regmap, SBRMI_STATUS, &sw_status);
 		if (sw_status < 0) {
 			ret = sw_status;
 			goto exit_unlock;
@@ -81,8 +78,6 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	} while (retry--);
 
 	if (retry < 0) {
-		dev_err(&data->client->dev,
-			"Firmware fail to indicate command completion\n");
 		ret = -EIO;
 		goto exit_unlock;
 	}
@@ -94,11 +89,11 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
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
 
@@ -106,8 +101,8 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
 	 * ALERT to initiator
 	 */
-	ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
-					sw_status | SW_ALERT_MASK);
+	ret = regmap_write(data->regmap, SBRMI_STATUS,
+			   sw_status | SW_ALERT_MASK);
 
 exit_unlock:
 	mutex_unlock(&data->lock);
diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
index 3d600e450e08..24a6957c8fa0 100644
--- a/drivers/misc/amd-sbi/rmi-core.h
+++ b/drivers/misc/amd-sbi/rmi-core.h
@@ -9,6 +9,7 @@
 #include <linux/mutex.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 /* SB-RMI registers */
 enum sbrmi_reg {
@@ -47,7 +48,7 @@ enum sbrmi_msg_id {
 
 /* Each client has this additional data */
 struct sbrmi_data {
-	struct i2c_client *client;
+	struct regmap *regmap;
 	struct mutex lock;
 	struct platform_device *pdev;
 	u32 pwr_limit_max;
diff --git a/drivers/misc/amd-sbi/rmi-i2c.c b/drivers/misc/amd-sbi/rmi-i2c.c
index ae968cf3c29c..c4207672d1e4 100644
--- a/drivers/misc/amd-sbi/rmi-i2c.c
+++ b/drivers/misc/amd-sbi/rmi-i2c.c
@@ -13,26 +13,26 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/regmap.h>
 #include "rmi-core.h"
 
 #define SBRMI_CTRL	0x1
 
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
@@ -57,17 +57,24 @@ static int sbrmi_i2c_probe(struct i2c_client *client)
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
 
-- 
2.25.1

