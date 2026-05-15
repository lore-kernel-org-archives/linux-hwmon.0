Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012069.outbound.protection.outlook.com [52.101.48.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD2948096B;
	Fri, 15 May 2026 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852759; cv=fail; b=TbMubu0KMDW71srwuHHnYN5V3p3fGgc0SIiY+iWvpBAJk5ON6rqqLnnZPtgyMOBjGxfj1TvT/E1OMz+fsQEDsXixUPl7WqUKgTfH96mrZD5NgHg5VjcBr515sQpz+qfillY1srF2T8qrJs/Iv118RkI7A6YT5Irrw813Euesl4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852759; c=relaxed/simple;
	bh=B1JR69Q6qC0uoFdxBOltxBz9Dy9IEjvxwph4B4JGWgg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hZDMV2thSz1KPWrWi8/R6gklt9i9oRxEW89xeGoGtwdb7trGvg5BNNCa5/I9o1vOpOvdObr/gQKyHioS55xgLEAAFG+4FwWk6UdrO3wGhK1tjv2VRgeUzEDAJGpM+hLFvbFlbsrdLzepAlylQMU7xdH4DCyCxAzVi51b0/5yeNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xPPXokbw; arc=fail smtp.client-ip=52.101.48.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xPPXokbw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hC9ksT0mcgu/bsz6cIqIvvXIdvAbe26CmF0Lk7339faTIrizg+bUazzqy9YhYAtQ8hqZJsku3OrQkYCaUeYxXP8yFwMmnBXWB1oR+6aJ9lFt14OyC027aaG6PrZOo/XULLvEWd1WphjRCXhV40rZz13cF65UGkztn6BxpFiCUTVIcGXCBEH8gPxzSkbcj9HjzN3kek9HXOWcL1dKBZ3bIFiHZsVPBQwRjwPSNH4yrJTNQ8j6Y2+R6L+5+XO5huwf6I5O59jPgSDj8fG1QzJSEB3u5Myrqn4qjmJa5dTz3WUHSVLBkCUF+lNVEUvrWG9sX9aRHyJ+afMFGb6SUL20NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8W3cdWhdyKCIPUm2XQEtqipMXG98PQfth3ev8ggIhI=;
 b=g2XyCOnOiYi80XB9cpVquNrJsGpQHi93nHsYybAQcDaISBH/SVZlnrd//tJdSf2ZE4pbFE8TjgNWf05DPtYlBjxxQGHgHv7noXfgbt9Gfg6HEM9asR7Wt+3FDiph2OU4P7hFL720ELFiLHpNltjpV0cB5CFcoOyUlA0pXUkpeTC0ZB+udt7AufloSX+dIyJ2PAmZwl3fNlSbDxK/FVXOiQWL89mENRLzh1D/Gf726QXGKva1+yeF/eVHamGyVMf6EmdyS6GExR4dw0v/0J1zfhh7hUUjO+jnrt8vTzNcWd4S2DGQ38PIIbXKX8a4VdtMKBlX0sYvRo9jU96pIVUyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8W3cdWhdyKCIPUm2XQEtqipMXG98PQfth3ev8ggIhI=;
 b=xPPXokbwgVZ2Qezk0DsSZ7qfHv60IAZzo0G5mhirwbvCa+eDa0EfJ40xTo2p1RkkWsIeqpYk71x5iXO8fpwxp8nu9T9Q3C0zIBw3Chyo/CWM4lSLT8i+1fB0rgvekcm7cr6k6s0dXGWXYHpJonFLn0PweiJmIEnmsjdVXjg88aU=
Received: from BN9PR03CA0162.namprd03.prod.outlook.com (2603:10b6:408:f4::17)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 13:45:51 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::42) by BN9PR03CA0162.outlook.office365.com
 (2603:10b6:408:f4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.14 via Frontend Transport; Fri,
 15 May 2026 13:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 13:45:51 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 15 May
 2026 08:45:47 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<naveenkrishna.chatradhi@amd.com>, <Prathima.Lk@amd.com>,
	<Anand.Umarji@amd.com>, <Kevin.Tung@quantatw.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v2 5/6] misc: amd-sbi: Add SBTSI ioctl register transfer interface
Date: Fri, 15 May 2026 19:15:05 +0530
Message-ID: <20260515134506.397649-6-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515134506.397649-1-Akshay.Gupta@amd.com>
References: <20260515134506.397649-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: 629ede53-a14c-423a-3a3b-08deb2884767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|56012099003|22082099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	NORowF4YbLvOyxfGSDEhgkzb9Z94imeYPP63vR+txv0pEpG5f283jgjyH1zIBIvP8Zw1csIOYArUGoeYqIUEshwGjYJ/FXXOq+qqljsGnXHPWwTQfHOkA37YRTcYB5PbFxWJy860fkFvxAEuKSCyw8nimZLM/KB9bj8KX8w2GVeqfYH5H5FoB4Eht3ScK7JTV+hHYNS1KKkdXYhMqnbiMW4q032KGtmrSWgT6+PBianYwuXRQLLocYrhvVFbhAx2FLdsKTvZbxkQYu6Y3pDIiTidmP/NWQMpHMatIz6DchROEa8RONL1SVrlpFhB4YiB+55nj0/frAX4/MT9GGtQl42hGtlt0Ce+EIleWbXUhAzFNlcZDq+TfMUjMvFwJ1kTYGgSYkn2SQ/49/8W4T2rTM64zgriolJH2KdxyW4Tt818xp8+GvRwdwIZ67meK/32x5eQueN4C1qu4iRoGGscZg2jf+6QvIyBU9/NMrQE4ZHgqUODZ2L2v+VMCAHt8qGxPoCplxRwSIOlpG7e4+/uOImiLDXdXWVoXORSsO6d5TED1zPNqheE0ibYGv+nYkhGEfI/FJrOnlEp/VRwfPyEIwq7MauYaFRDy7s76gJG/69AwNe9Q3RjifuZxxUkxtw/9w8miRLUdUnMlIc8ZUjAxGue1qLqzy8njXFqVn42fOSC/PFrBG+X1fj3gtXXilWzXF+kpOITgBVuUcLneTWw2nbjYURc6TPqXNr30Su+cLM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v+0Ta5UjrZGZBwDECdwWocQgJY9Po2bH02cGWY8AL+eb8Fj4Gsp+LEC2l6vJhKXf2FY8EPe/wNDa5kEnZtSsmgbYrbWqP1NUjNCxemsshcYqSmpxs1v1pI0MXiGaNzjmzph1t4T5s7AcNaMNrbZ2C7rp/d2QiL7daxY/SjwZmh6ci165+6V3GzwVJZVVXQiedrgup/TLrYBPstuh0Jg4bAVwgXouwzDLo3Zh3RIw5HbC/uast+MtGzRMmgnBL7K4YC48YBtWlD62jmBvEG/uKkmso0jEtC/6iBss6Fd/93OYHumq0Rt1dbN9Vp4MKjxVVyaKt4p6+GTxls/mJDg+Vjt6qT8JSLb21eqwoQfhuIDboomGyiM7juTQE5wBUrLa+v//QgBcSxjfYJkzWC7+VRxBbySEQ/6yI6DY6G+R6ohL9wq2qm/6q1vz5SQxUUCb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:45:51.6001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 629ede53-a14c-423a-3a3b-08deb2884767
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110

From: Prathima <Prathima.Lk@amd.com>

Implement IOCTL interface for SB-TSI driver to enable userspace access
to TSI register read/write operations through the AMD Advanced Platform
Management Link (APML) protocol.
Add an ioctl command (SBTSI_IOCTL_REG_XFER_CMD) that accepts a register
address, data byte, and direction flag. Serialize access with a mutex
shared between the hwmon and ioctl paths to prevent concurrent bus
transactions from corrupting register state.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
Changes since v1:
- Use of devm_mutex_init in place of mutex_init
- Use of guard_mutex in place of mutex_lock()/mutex_unlock()
- Use of devm_add_action_or_reset() for clean removal
 
 drivers/hwmon/sbtsi_temp.c      |  6 +++
 drivers/misc/amd-sbi/tsi-core.c | 84 ++++++++++++++++++++++++++++++++-
 drivers/misc/amd-sbi/tsi-core.h | 15 ++++++
 drivers/misc/amd-sbi/tsi.c      | 20 ++++++--
 include/linux/misc/tsi.h        |  8 ++++
 include/uapi/misc/amd-apml.h    | 23 +++++++++
 6 files changed, 151 insertions(+), 5 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/tsi-core.h

diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
index d7ae986d824c..00e982f4c716 100644
--- a/drivers/hwmon/sbtsi_temp.c
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -64,12 +64,15 @@ static inline void sbtsi_mc_to_reg(s32 temp, u8 *integer, u8 *decimal)
 /*
  * Read integer and decimal parts of an SB-TSI temperature register pair
  * The read order is determined by the ReadOrder bit to ensure atomic latching.
+ * The mutex protects against concurrent access to the shared I2C/I3C bus by
+ * the hwmon sysfs and a userspace ioctl
  */
 static int sbtsi_temp_read(struct sbtsi_data *data, u8 reg1, u8 reg2,
 			   u8 *val1, u8 *val2)
 {
 	int ret;
 
+	guard(mutex)(&data->lock);
 	ret = sbtsi_xfer(data, reg1, val1, true);
 	if (!ret)
 		ret = sbtsi_xfer(data, reg2, val2, true);
@@ -78,12 +81,15 @@ static int sbtsi_temp_read(struct sbtsi_data *data, u8 reg1, u8 reg2,
 
 /*
  * Write integer and decimal parts of an SB-TSI temperature register pair.
+ * The mutex protects against concurrent access to the shared I2C/I3C bus by
+ * the hwmon sysfs and a userspace ioctl
  */
 static int sbtsi_temp_write(struct sbtsi_data *data, u8 reg_int, u8 reg_dec,
 			    u8 val_int, u8 val_dec)
 {
 	int ret;
 
+	guard(mutex)(&data->lock);
 	ret = sbtsi_xfer(data, reg_int, &val_int, false);
 	if (!ret)
 		ret = sbtsi_xfer(data, reg_dec, &val_dec, false);
diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-core.c
index 19388737b225..c5bd60409d5b 100644
--- a/drivers/misc/amd-sbi/tsi-core.c
+++ b/drivers/misc/amd-sbi/tsi-core.c
@@ -6,8 +6,12 @@
  * Copyright (C) 2026 Advanced Micro Devices, Inc.
  */
 
+#include <linux/fs.h>
+#include <linux/ioctl.h>
 #include <linux/module.h>
-#include <linux/misc/tsi.h>
+#include <linux/uaccess.h>
+#include <uapi/misc/amd-apml.h>
+#include "tsi-core.h"
 
 /* I2C transfer function */
 static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
@@ -62,7 +66,83 @@ int sbtsi_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
 	if (data->is_i3c)
 		return is_read ? sbtsi_i3c_read(data, reg, val)
 			       : sbtsi_i3c_write(data, reg, *val);
-
 	return sbtsi_i2c_xfer(data, reg, val, is_read);
 }
 EXPORT_SYMBOL_GPL(sbtsi_xfer);
+
+/*
+ * The mutex protects against concurrent access to the shared I2C/I3C bus by
+ * the hwmon sysfs and a userspace ioctl.
+ */
+static int sbtsi_xfer_ioctl(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
+{
+	guard(mutex)(&data->lock);
+	return sbtsi_xfer(data, reg, val, is_read);
+}
+
+static int apml_tsi_reg_xfer(struct sbtsi_data *data,
+			     struct apml_tsi_xfer_msg __user *arg)
+{
+	struct apml_tsi_xfer_msg msg = { 0 };
+	int ret;
+
+	if (copy_from_user(&msg, arg, sizeof(struct apml_tsi_xfer_msg)))
+		return -EFAULT;
+
+	ret = sbtsi_xfer_ioctl(data, msg.reg_addr, &msg.data_in_out, msg.rflag);
+
+	if (msg.rflag && !ret) {
+		if (copy_to_user(arg, &msg, sizeof(struct apml_tsi_xfer_msg)))
+			return -EFAULT;
+	}
+	return ret;
+}
+
+static long sbtsi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	void __user *argp = (void __user *)arg;
+	struct sbtsi_data *data;
+
+	data = container_of(fp->private_data, struct sbtsi_data, sbtsi_misc_dev);
+	switch (cmd) {
+	case SBTSI_IOCTL_REG_XFER_CMD:
+		return apml_tsi_reg_xfer(data, argp);
+	default:
+		return -ENOTTY;
+	}
+}
+
+static const struct file_operations sbtsi_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= sbtsi_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+};
+
+static void sbtsi_misc_deregister(void *data)
+{
+	misc_deregister((struct miscdevice *)data);
+}
+
+int create_misc_tsi_device(struct sbtsi_data *data, struct device *dev)
+{
+	int ret;
+
+	data->sbtsi_misc_dev.name = devm_kasprintf(dev, GFP_KERNEL,
+						   "sbtsi-%x", data->dev_addr);
+	if (!data->sbtsi_misc_dev.name)
+		return -ENOMEM;
+	data->sbtsi_misc_dev.minor    = MISC_DYNAMIC_MINOR;
+	data->sbtsi_misc_dev.fops     = &sbtsi_fops;
+	data->sbtsi_misc_dev.parent   = dev;
+	data->sbtsi_misc_dev.nodename = devm_kasprintf(dev, GFP_KERNEL,
+						       "sbtsi-%x", data->dev_addr);
+	if (!data->sbtsi_misc_dev.nodename)
+		return -ENOMEM;
+	data->sbtsi_misc_dev.mode = 0600;
+
+	ret = misc_register(&data->sbtsi_misc_dev);
+	if (ret)
+		return ret;
+	return devm_add_action_or_reset(dev, sbtsi_misc_deregister,
+					&data->sbtsi_misc_dev);
+}
diff --git a/drivers/misc/amd-sbi/tsi-core.h b/drivers/misc/amd-sbi/tsi-core.h
new file mode 100644
index 000000000000..7bf967a09837
--- /dev/null
+++ b/drivers/misc/amd-sbi/tsi-core.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * AMD SBTSI misc tsi device .
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _LINUX_TSI_CORE_H_
+#define _LINUX_TSI_CORE_H_
+
+#include <linux/misc/tsi.h>
+
+int create_misc_tsi_device(struct sbtsi_data *data, struct device *dev);
+
+#endif /* _LINUX_TSI_CORE_H_ */
diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
index 43bbac7faf08..6a9356740f4e 100644
--- a/drivers/misc/amd-sbi/tsi.c
+++ b/drivers/misc/amd-sbi/tsi.c
@@ -10,8 +10,8 @@
 #include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/misc/tsi.h>
 #include <linux/slab.h>
+#include "tsi-core.h"
 
 #define SBTSI_REG_CONFIG		0x03 /* RO */
 
@@ -89,6 +89,9 @@ static int sbtsi_i2c_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	err = devm_mutex_init(dev, &data->lock);
+	if (err)
+		return err;
 	data->is_i3c = false;
 	data->client = client;
 	err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
@@ -98,7 +101,11 @@ static int sbtsi_i2c_probe(struct i2c_client *client)
 	data->read_order = FIELD_GET(BIT(SBTSI_CONFIG_READ_ORDER_SHIFT), err);
 
 	dev_set_drvdata(dev, data);
-	return sbtsi_create_hwmon_adev(dev, client->addr);
+	err = sbtsi_create_hwmon_adev(dev, client->addr);
+	if (err < 0)
+		return err;
+	data->dev_addr = client->addr;
+	return create_misc_tsi_device(data, dev);
 }
 
 static const struct i2c_device_id sbtsi_id[] = {
@@ -145,6 +152,9 @@ static int sbtsi_i3c_probe(struct i3c_device *i3cdev)
 	if (!data)
 		return -ENOMEM;
 
+	err = devm_mutex_init(dev, &data->lock);
+	if (err)
+		return err;
 	data->i3cdev = i3cdev;
 	data->is_i3c = true;
 
@@ -156,7 +166,11 @@ static int sbtsi_i3c_probe(struct i3c_device *i3cdev)
 	data->read_order = FIELD_GET(BIT(SBTSI_CONFIG_READ_ORDER_SHIFT), val);
 
 	dev_set_drvdata(dev, data);
-	return sbtsi_create_hwmon_adev(dev, i3cdev->desc->info.dyn_addr);
+	err = sbtsi_create_hwmon_adev(dev, i3cdev->desc->info.dyn_addr);
+	if (err < 0)
+		return err;
+	data->dev_addr = i3cdev->desc->info.dyn_addr;
+	return create_misc_tsi_device(data, dev);
 }
 
 static const struct i3c_device_id sbtsi_i3c_id[] = {
diff --git a/include/linux/misc/tsi.h b/include/linux/misc/tsi.h
index 7ce689081427..184b1aa14f0a 100644
--- a/include/linux/misc/tsi.h
+++ b/include/linux/misc/tsi.h
@@ -11,12 +11,17 @@
 #include <linux/i2c.h>
 #include <linux/i3c/device.h>
 #include <linux/i3c/master.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 
 /**
  * struct sbtsi_data - driver private data for an AMD SB-TSI device
  * @client:	underlying I2C client
  * @i3cdev:	underlying I3C device (when using I3C bus)
+ * @sbtsi_misc_dev: miscdevice exposing ioctl interface at /dev/sbtsi-<addr>
+ * @lock:           mutex protecting concurrent access to the device
+ * @dev_addr:       I2C/I3C device address, used to name the misc device node
  * @ext_range_mode:	sensor uses extended temperature range
  * @read_order:	if set, decimal part must be read before integer part
  * @is_i3c:	true when the device is accessed over I3C
@@ -26,6 +31,9 @@ struct sbtsi_data {
 		struct i2c_client *client;
 		struct i3c_device *i3cdev;
 	};
+	struct miscdevice sbtsi_misc_dev;
+	struct mutex lock;	/* protects concurrent access to the device */
+	u8 dev_addr;
 	bool ext_range_mode;
 	bool read_order;
 	bool is_i3c;
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
index 745b3338fc06..8a85f79b0938 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -73,6 +73,13 @@ struct apml_reg_xfer_msg {
 	__u8 rflag;
 };
 
+struct apml_tsi_xfer_msg {
+	__u8 reg_addr;		/* TSI register address offset */
+	__u8 data_in_out;	/* Register data for read/write */
+	__u8 rflag;		/* Register read or write */
+	__u8 pad;		/* Explicit padding */
+};
+
 /*
  * AMD sideband interface base IOCTL
  */
@@ -149,4 +156,20 @@ struct apml_reg_xfer_msg {
  */
 #define SBRMI_IOCTL_REG_XFER_CMD	_IOWR(SB_BASE_IOCTL_NR, 3, struct apml_reg_xfer_msg)
 
+/**
+ * DOC: SBTSI_IOCTL_REG_XFER_CMD
+ *
+ * @Parameters
+ *
+ * @struct apml_tsi_xfer_msg
+ *	Pointer to the &struct apml_tsi_xfer_msg that will contain the protocol
+ *	information
+ *
+ * @Description
+ * IOCTL command for APML TSI messages using generic _IOWR
+ * The IOCTL provides userspace access to AMD sideband TSI register xfer protocol
+ * - TSI protocol to read/write temperature sensor registers
+ */
+#define SBTSI_IOCTL_REG_XFER_CMD	_IOWR(SB_BASE_IOCTL_NR, 4, struct apml_tsi_xfer_msg)
+
 #endif /*_AMD_APML_H_*/
-- 
2.34.1

