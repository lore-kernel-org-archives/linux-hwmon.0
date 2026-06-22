Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013011.outbound.protection.outlook.com [40.93.196.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135EC3B5F48;
	Mon, 22 Jun 2026 13:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136742; cv=fail; b=W9r81OLwxS7V767/E7Hlhsy9pyoX9UgROYXPPA236zTvMS+NVTmjPCudbJ8Kg8ynVWMBm7/Wpp6s/EDNL+BiCBjrl/YeqtA9RLvQmv2AEFIee7Sk8+poYKGpcFlfILlMnFLpqIET50jig00xx1XHw/3qQgeZ9WA8v7iPaqfIXCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136742; c=relaxed/simple;
	bh=+PFBSNCmekxCUdNbiJQgWPlzKbMFRC9CP/BW4wMJt70=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C9rJ3s1NosKLIbMQ89qvVvj/Iy8QeHvUiaxSpVEmuRM7iwQ4uM7iXFuzRIxFlLV3A/kVqK7K2Px3IHnQBMGbD0kpcEXlSS5uWg5pc4CY39wCcBX0SslvPmzUJ5+6omjTGXeU6GWGiw6VuViqAkxqKRXU2CRLlRhQ+IR+yRCk7lU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OT8cKqKX; arc=fail smtp.client-ip=40.93.196.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OT8cKqKX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXaYQY2mph183PLWyjGzJJGRHk8ytLASggJv70eUK3Ez6wDkWhu1sWSHkDpOUhJPSHa5UHTNNM4+n1WTwZUkGiIv2neB5Fho2B5J5vB6kWbruP53bJNl3NnC/4fszIYIqjC0GiG0zkwTyBl0bByLCPVFtJ9wRE9LQpbN1Sd63tZvktgzv3kYDxqWRK1egYOGX48j9MxuYvwI56DYOWHUwUjcChMYmH6NFoPjPkCvm6nwV4sMqQWXu+HRCJuqfKDheRVJRMLfHDsSS929rG1S6jnF7b/Y+s7Jq4ek7O1d9Hrh/o160XojOfEojuyBf4e9/MROgdp8/Dg0te3DQDFEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7eQ5xfOtCBAdverK09YxFMMbry1u7K2YfZOSgBlo94=;
 b=F/X4NXYeEgedQLJeE++Hy55GPHSbHzpADNZRbPHFj9oFbOu+ZNfZc3t51ZViB+jyQeHV7Sis17mpi80vyZJIi8Yr5SfmBKBbzi3EBzuXhWWAt2UxcvcwuK5NgdstPOiQ01SoVEI4y/tvMbVVkfmcmQkpx4GzETu/MYRJwmeahUFDSQdjqhlWZADHz3044GSOdRB5DL2Kjudqil6LIDNg6w6GntT2TBUGwC7Q75CzAd4xC7mGJyso2CnCiO7q4luvqN8ATephF4i0l+CvRGTEIj0iGZpTUFT89u/cJkyfzupYRFZ75FvGRsZO0KSorsXXCyn8Yoa53aHJyvSV8b9CNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7eQ5xfOtCBAdverK09YxFMMbry1u7K2YfZOSgBlo94=;
 b=OT8cKqKXLilIr49NBiVUBS1OsTJH304AzxpJN3wXHpv6K+l5O18BMI3UGVblk72qFIkpy/q4nADy/OaTtH0pUY49iiqbTfds9zkug89A+1oTcp8h8Ov/RelrRFbElisj7qnGNiqnL/7EI4WWEO/luJ+H7/dUXTfq5LwjzagQqfE=
Received: from SJ0PR03CA0118.namprd03.prod.outlook.com (2603:10b6:a03:333::33)
 by MN0PR12MB6368.namprd12.prod.outlook.com (2603:10b6:208:3d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 13:58:56 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::18) by SJ0PR03CA0118.outlook.office365.com
 (2603:10b6:a03:333::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Mon,
 22 Jun 2026 13:58:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 13:58:55 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 08:58:51 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v3 3/8] hwmon/misc: amd-sbi: Move sbtsi register transfer to core abstraction
Date: Mon, 22 Jun 2026 19:28:16 +0530
Message-ID: <20260622135821.2190260-4-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|MN0PR12MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f29a4eb-40df-465c-8840-08ded0666696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|56012099006|11063799006|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	SW+g1VOGSmHCH3cT5a40dOkQINUgc+W86iRoBoLRkXCgA+Whk+aRMcs3ghEHL0dXNi8dlTZh4kzthN/5B8VQXw/mmDwrqBoFJZ27soMLQYk8B8olgpznkOzc04/f2R8C1G+u1ERr9CRAjElj6mv4uqgSfczw1bzEbrOdcxqMBCSmZBUehFoOemJiZX1Xdhml8VbNLU5vTeAg0Oq4su/O063PN5norBg5ZuXzzrXfMaVtyBsAISTnGwANFnuu5DcNMtSsYzWBj6mNUyrChUJvThzmpWpzYLN2C90eakeIuzQnXCzPcIS1F1fyNxVCZdSfonjmOzQzdd2NY504GKl/ZtRlE6bVWnRJ+OOWLTFW5Nfq1afbdUSiA2YYZ1AQf83ZgyAKuORPeevs1sQzRJwhBHz7zHGIWpNtu8deg4iOZFuGaOMkYZkJivyrXLoqdXJNEDFWBqHsqHNWyrSNkt35eOi0T2JSVUKi/5YAmLq/pyw71fyg+yw6IrVrBJ/P21v5DPjjKX4fnhjgnN5LCHp1sbB7Rpsrr6UravnmAAhO94Yl3PjNFxJf1T2xgOlL0UZqOLPYvYGeJmKPQn+iHWsHtJMH3tNYriAnDmKKW5kh8en+e2t9GoXx80C0nM3lPWpMpU/Z0cDVLatWHR8YdAfB8XHewt33a/LF09z4B073hFTEyl02A2+0+bu1Cg7URxw0XWNLSVR+U7p/DKWpqFsyow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EivntpF1Zwp9WzR8Uof2h41fdmc0CKsitJZG/IsiQunFbp7R4YClLVNLabvuveZ2sdkpRynKC6cmrHDgx7sget4vmnvmIMuPvE9gYK4zJUhxsXt5BNFHb61NI9Z9A/xoweav3pv7Gi4dKTRRDRlBPKwfbwSTyDCYJ1qlg7LQkMG0UZxVQzNVH7jONz8EyNv6/6Lo5DxqQrSY5Hc/cD3Aj5qgezQ0heu/zA8rdUk7QocNPhFBHiM7L/X79iFOhtao8JZDAr2LUpAnWzYLlUXrjGm00lFJE+eGf4FEQ5/somCqkBYl0dw8NxtlnU1qFvq+L3fNGR3HQsf+te+j3IUsIOiA6JY0BPyzL2JUMhPVvaSAYbYpTHgBeY1L4EQHYNvJu0n1Rx0OIGg4Ah/8dh2Cl8pop0BP8cLl51hmiAsLbzwJ42QwZ8fjFP15xbe3vxfG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:58:55.8230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f29a4eb-40df-465c-8840-08ded0666696
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6368

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

