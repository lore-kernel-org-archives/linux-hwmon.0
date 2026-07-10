Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013004.outbound.protection.outlook.com [40.93.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260BC4195DD;
	Fri, 10 Jul 2026 11:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682243; cv=fail; b=XBzjfzyqJqqZCUgJlG9D4tZRzZYQl+ZDamO0xmyl+Czz2kaAVtKj2qmqCpxavcla5Ud724646ZIJLMiYq71gOZWexreFVDDJXQCcSdlbHTkA65sVj1w3X3FUvxPlx275O27KkvYwypEkdKueJXx/Hye/8z/hlNJov66+F/mTEF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682243; c=relaxed/simple;
	bh=+PFBSNCmekxCUdNbiJQgWPlzKbMFRC9CP/BW4wMJt70=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PJhoV8Tcy6MBOOoSW+qTSGVHB6KCyhq4OwAqVuc8Re0H9/LJfZR2NmKs3wR8x7v+mjtYR2gMy7PNBRsIuUPTFSyB5+7ZhlvPsFk6TtvmmMkogXdPDvdP+4rpBdOb7NnYhv6uO+Fs2TeRIHxeZXz/AvftzAlXs2kK0WC6Lmclrf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=brEnQZSv; arc=fail smtp.client-ip=40.93.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="brEnQZSv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdMiwhhX9ogJUxyCXo0d2Hg1taonVL4a7G7rhXmxeC+yohc3kq/6OdBMLlosbpjkeawWDwtX1RAuDopKEQ7YE5H+XpbFYm2IvZPrG169W8rAhTwxHdF9CRA/O2p1n0tZ/ZkdsRR5Jo7kpTg7H8+z4Y53NMWXsXtA3UYeZ1QTcBWNZKcxA7qOaVoFu/9HTo2QbUtV6tCldzTWsIBsQjSQY5hVQC20V0Pz1mJ8JFpz+OWGUaHGpJza0SG3CEWoLLFefpAEspzbN+aqKvPllZtHZ0fqSDW3Tf6RKR0ApbpxMGIKnoEbLAA4wXpgqxh9OeP1oYNVs+drr6hLbe0L+v/2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7eQ5xfOtCBAdverK09YxFMMbry1u7K2YfZOSgBlo94=;
 b=v/NJ3QN/djTAEuO1EPr4kqtRakkLE7VU/eDD1+ZXu47PvtMmyvWSRHyI1MwDj4drboNGIb28fwzH3iVpQSBBEDLEotlA1LzSO6ZNrMsjlDQuUt0I5pEdLcMZ0D1R7PKZwjQGGYqz5bcJNwg2h+WsknSkDDLP4HmuJrRNIs9aBfcgMtUnZYq5ep8zNoXvI9a76Skdd+K+5W+wae2L6ddusKP7RTp3MpmS2+VQLieRc/nzgMUkMEfYKkr67sM/G2ISUxXr0x9Cvh55z5/bNjGz0+yDeOROqo/jWU/O9sKmkPPN1BBtkG/rKj9i3d1WBsW0S7UK/zbNpORbNsBD/ewXfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7eQ5xfOtCBAdverK09YxFMMbry1u7K2YfZOSgBlo94=;
 b=brEnQZSvHo5UCxHuk9+d7nfJRNl7cRpc0oi2h3ntJG3XjZd0LoTQJMLpC95Y9qPpUTqy/w1PEaWuhVptpLVG/L882T8uE8czs3MjE1an39a1mzDwZVqziRtshgYgRgdNQkn58UAKjHCpJyHB38+LeQeqmpWcuiZLvP5tVQ64fQU=
Received: from DSZP220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::10) by
 MW4PR12MB6922.namprd12.prod.outlook.com (2603:10b6:303:207::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 11:17:15 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:280:cafe::3c) by DSZP220CA0012.outlook.office365.com
 (2603:10b6:5:280::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 11:17:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 11:17:15 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 06:17:11 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v4 3/8] hwmon/misc: amd-sbi: Move sbtsi register transfer to core abstraction
Date: Fri, 10 Jul 2026 16:46:37 +0530
Message-ID: <20260710111642.850022-4-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710111642.850022-1-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|MW4PR12MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: b42c9927-42ba-47fc-a6f1-08dede74cbf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|11063799006|56012099006|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	U5mg94Kn7AQUncjz3HFGOBaRWhTXLewmwUarDe/TlsAoHw1w9raR0CFz5tMTmwMJPMEGxV6fKk4cFU83ksl1dGMSAw/1rK3673lH5ScU3WIbZFg3QzRljpFNqDXikyZ2v0ACWqRCGZ4VfCtfj37iCgKbLZFrlxW9jlsbQrIb6b/oiduGS8ZvwOfdRKM7P9qUgNfDlcAWCBg+YExYLXsC6pY0heDjOeh6+PLZVUVX/DQR7T5yaqUEWWkakjljMKZ1++hYDvYbt5tQgd0hTVpYudVo9L3MXXG3WfLTJlCgXemH31kmzF0NTwdgSP1MCXt4LCta8clhFVwiO4BLcWS1uU42j9tL00XXi9W//aOLZCPwZRuFMZLmPbGnBwmlKiKQlbjAabcQbF3xcq6DbxehmSkqr9Tx2WevDN3tOcmTpqDoKxVZuKbOe9qh+mDYmXH0jOn/hXbrQBBfckUA+ZWSXrbDbA8nsAV7Fd6tB0qtiC4ldTxwYVS557Nc+1feTAAM/ojYtZt5+k99xrT2smK2TNJSEsSWbXl5zDIUAMytMaqJwzylkeHCjazDeRmFEhafVUJgsMO9tgMzNjLOqis2auVhtZlk1JNnQHdr9j0Fnne03QnDXoxn0sks+h9DhFWvx+/G5aPJwAXAdRyY0mdC2jZJyWeiQfYxnTpR7hqQyDu8YNghhnqSmn+/4lTaULmbukxBc/e2cuo46jpfYdqVQQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mc6P1fyo2k9S1bLKK4Xi4cewCUOM3Nb5Mbg6kF4LnSHtFCVsaoqZvHqcvXKZnLfmM8yecliJ7ca31QhfzZkBlyilnaZwHasR0p1S3gMAgguhrmGsC7QHQmLcSOGNP3GQx48MwCEbgbYw+rLp4LLBpjq1Mfrua4UwXx5td4vJ4z4EOvPkINr2RYr1qj8WQ7BCNxYx+fXyZCfNy187nyejhtfF/OVyNdwj3nqSt5Ctra3x3vYLJz4svMzJR9hcFLgfwm92/z4And5HKBa1WKe2NtN2AO2EhtzBOmq+22vxJ2r9duDgIM/eIBltTdyCs9Ff3GZM4B/DyCb0r6EMRMVKPEJ5YB5c+mP5YleE8PiWE6FNOV/rIlmcoPIo2Ks/d8u8zmM1QIquHZCqtKtsHPY6FQbhlX8jfvTDjS3FSEIa5NVi9XUszNhi5qmgEsRnFEVr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 11:17:15.1576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b42c9927-42ba-47fc-a6f1-08dede74cbf1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6922

From: Prathima <Prathima.Lk@amd.com>

Move the I2C read/write byte operations from the sbtsi hwmon driver into
a common sbtsi_xfer() function in tsi-core.c.
This decouples the hwmon sensor driver from the underlying bus transport,
preparing for I3C support in a subsequent patch.
This patch does not introduce any functional changes. The updates are
limited to code organization/cleanup and should not affect the runtime
behavior of the driver

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
Changes since v2:
- Name change for header inclusion guard to misc specific 

Changes since v1:
- New patch
 drivers/hwmon/sbtsi_temp.c      | 17 ++++++-----------
 drivers/misc/amd-sbi/Makefile   |  2 +-
 drivers/misc/amd-sbi/tsi-core.c | 30 ++++++++++++++++++++++++++++++
 include/linux/misc/tsi.h        | 13 +++++++++++++
 4 files changed, 50 insertions(+), 12 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/tsi-core.c

diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
index 078f4ab25bde..d7ae986d824c 100644
--- a/drivers/hwmon/sbtsi_temp.c
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -70,15 +70,10 @@ static int sbtsi_temp_read(struct sbtsi_data *data, u8 reg1, u8 reg2,
 {
 	int ret;
 
-	ret = i2c_smbus_read_byte_data(data->client, reg1);
-	if (ret < 0)
-		return ret;
-	*val1 = ret;
-	ret = i2c_smbus_read_byte_data(data->client, reg2);
-	if (ret < 0)
-		return ret;
-	*val2 = ret;
-	return 0;
+	ret = sbtsi_xfer(data, reg1, val1, true);
+	if (!ret)
+		ret = sbtsi_xfer(data, reg2, val2, true);
+	return ret;
 }
 
 /*
@@ -89,9 +84,9 @@ static int sbtsi_temp_write(struct sbtsi_data *data, u8 reg_int, u8 reg_dec,
 {
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(data->client, reg_int, val_int);
+	ret = sbtsi_xfer(data, reg_int, &val_int, false);
 	if (!ret)
-		ret = i2c_smbus_write_byte_data(data->client, reg_dec, val_dec);
+		ret = sbtsi_xfer(data, reg_dec, &val_dec, false);
 	return ret;
 }
 
diff --git a/drivers/misc/amd-sbi/Makefile b/drivers/misc/amd-sbi/Makefile
index 28f95b9e204f..ce9321f5c601 100644
--- a/drivers/misc/amd-sbi/Makefile
+++ b/drivers/misc/amd-sbi/Makefile
@@ -3,5 +3,5 @@ sbrmi-i2c-objs  		+= rmi-i2c.o rmi-core.o
 sbrmi-i2c-$(CONFIG_AMD_SBRMI_HWMON)	+= rmi-hwmon.o
 obj-$(CONFIG_AMD_SBRMI_I2C)	+= sbrmi-i2c.o
 # SBTSI Configuration
-sbtsi-objs	+= tsi.o
+sbtsi-objs	+= tsi.o tsi-core.o
 obj-$(CONFIG_AMD_SBTSI)	+= sbtsi.o
diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-core.c
new file mode 100644
index 000000000000..6ef1831515bb
--- /dev/null
+++ b/drivers/misc/amd-sbi/tsi-core.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * tsi-core.c - file defining SB-TSI protocols compliant
+ *              AMD SoC device.
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/module.h>
+#include <linux/misc/tsi.h>
+
+/* I2C transfer function */
+static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
+{
+	if (is_read) {
+		int ret = i2c_smbus_read_byte_data(data->client, reg);
+
+		if (ret < 0)
+			return ret;
+		*val = ret;
+		return 0;
+	}
+	return i2c_smbus_write_byte_data(data->client, reg, *val);
+}
+
+int sbtsi_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
+{
+	return sbtsi_i2c_xfer(data, reg, val, is_read);
+}
+EXPORT_SYMBOL_GPL(sbtsi_xfer);
diff --git a/include/linux/misc/tsi.h b/include/linux/misc/tsi.h
index befdc2d14160..2d2709f1ff32 100644
--- a/include/linux/misc/tsi.h
+++ b/include/linux/misc/tsi.h
@@ -31,4 +31,17 @@ struct sbtsi_data {
 #define AMD_SBTSI_ADEV		"amd-sbtsi"
 #define AMD_SBTSI_AUX_HWMON	"temp-sensor"
 
+/**
+ * sbtsi_xfer - Perform a register read or write transfer on an AMD SB-TSI device.
+ *
+ * @data:    Pointer to the sbtsi_data structure containing the device context
+ * @reg:     Register address to access.
+ * @val:     Pointer to the value to read into or write from.
+ * @is_read: If true, performs a read transfer and stores the result in @val.
+ *           If false, performs a write transfer using the value in @val.
+ *
+ * Returns 0 on success, or a negative error code on failure.
+ */
+int sbtsi_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read);
+
 #endif /* _LINUX_MISC_TSI_H_ */
-- 
2.34.1

