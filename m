Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010035.outbound.protection.outlook.com [52.101.46.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF723B5F48;
	Mon, 22 Jun 2026 13:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136754; cv=fail; b=CCGFhU//JUa9RVbohLAVgPm19BIQtnbMLQ5zV5hNELJDJSyuK6w404m+jmeRITuz+kO5Vz14CB+M83FWpP4OKE9PZ44z0tzAOI3/O62aJ4L/MJlasNOa1vmIZyK3KVL84JVgYsdk1kSsaQiIcbGfUF54XTds97PoyvnIfp/NRPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136754; c=relaxed/simple;
	bh=T0oGAHoTA0UiZUb+I0BA2n/wKbb/UcISVOarGG7ui4M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bOfkBVwR0Bt0gW2ct66rx02Kjcq9ycCrrkHHkhJBU5g2HlnimF9RD1A1pknvF2oqSRKZ4zvIi8Xf7b/T8F22zHTYx9Btxt2QxJwdbx12mrdeb2I6fi46J4jCv8hOqLv/1V1H0xgr0XnT8mPcVY/8hoPfcJsEud9HNBWyk7+NamA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AWK4j5lS; arc=fail smtp.client-ip=52.101.46.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AWK4j5lS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK7OuQ81yiOD8cL8AvsYJbndweTB/xmf4n8aQzIlsL9lcO0DPmWXNInqZ/+280iLnRNw06qDsYXLnKh39wE92+r7NKwoRrqbmaAm2PbJ5u5tAYVVcUUZp2C3+/CIHP4FSqJxbv9ofIaSiGhJUg9MwaAHixONS9bfHdzcBBwG1DfKrjehcW4jGwqB2oPsGK/5HeqR5u2EwKgu3taeItVPAV8InrFsGiD6UZJi04PpuJ7ie73ZzCVZxx/zNitu4QkntnI0pdDFStJ717NdbupcdC1aqkDDrJhRPxh+fv8Wdab5cdGD8U+AJ8gAP9bwgiNO8xFXt1k18HfJoMKWEH1nRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTxEfK563l4AoSmUD6RY6MF1AXL4NeEJ4KAfD41ry4E=;
 b=A4MVqDFkLau5jgXA5qiMI4dsQlCExHC09JsZheEFT2su5OXYZqVsVWaqY7zfYrJ6XkYzsGpkNAQAYKWe2ikJk0XLmhVTfdnKpqCHig7C5Rnns889gh/lT3hmEdUzSkF2+675CTjsY2g2hsbmckSxUWM/IQAPsK2lFsm6dMdtOaAsqbfCzIO4C+xwOO2fhi/2ZFyndt9LU0+7BmjYnYs2Rs4bNk7vIGZuh4eL1NC7dRniKGfp4IPCOdy3Eqos/2N6Gl+xO26QXOZ0w2uTDyq98wS1Z0m0ZkXQrqHn0Lvg1aQywVvq+6DmODDWdLqPqvhQEfCXLEElJmOSJU8Myku65A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTxEfK563l4AoSmUD6RY6MF1AXL4NeEJ4KAfD41ry4E=;
 b=AWK4j5lShbn02c/8yKZD0WS7Qcd9b1Yf6OdFRt7o79abLtwpeH1FRgH+R/xDTJZ0C5VbGCUL37U/LqcAJnj8QdpDkN5Bwx1qL0HKp1C6AEjJHtZ2OrOX/YWC1kVgzG0Fz0U/ByaVWyoOj6dI9b1yIDUbZVyYOdNOxgXLkhwGFsQ=
Received: from SJ0PR03CA0120.namprd03.prod.outlook.com (2603:10b6:a03:333::35)
 by SJ2PR12MB8689.namprd12.prod.outlook.com (2603:10b6:a03:53d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 13:59:07 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::2c) by SJ0PR03CA0120.outlook.office365.com
 (2603:10b6:a03:333::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Mon,
 22 Jun 2026 13:59:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 13:59:07 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 08:59:04 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v3 6/8] misc: amd-sbi: Add SBTSI ioctl register transfer interface
Date: Mon, 22 Jun 2026 19:28:19 +0530
Message-ID: <20260622135821.2190260-7-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|SJ2PR12MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 967a26d7-2e15-4d9e-4ae0-08ded0666d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	z2hfrioCRCFUCdjoB4HK2tE1THAF/dIOYj8ZW2AAMZ4KZCqX+pU7rNQglR/+B+C+VzghiOct2yaPJUJwZIzwsh+isdRb/0870ySQAVnsJ238dE0SI28Ncbb5E4O5PhNgvbBLa02cB3Uzq70LGV3K9RLvn/4TcYfzu8kNNCc7Ewf2gT6NxyHaK366xUq2oabqOnjLPLbcAf/P53QAW+z6rgLD6mowjKJapG7c4JW/UKeykhS4cP+glxHMbbBqXc/7t4khIiWJ5aSkzqmsuUWaTEakKPYWilJZd0VSla0NKJwxbQVWH8XmxqntHSIrg9dPEoj+0j63vN00/DA/TShj72KnkKDOegKAXdIUfkKgIR0Wlpemo3rC5HCNwEHeN2VLKS+vWVKAupv145mkAAQWsmwZc+/E5miYdoFCQ4tvj5d+d+UK7q7pdVYyntMWUDuMU7n1c4sKb+hp+nXF45QTJJ8RFR6A76dpmf032/1ShYyUJWmhsiTNjT3+2f2hkZPd2KOLKev8YbsDa5q0YYmR1q9qAHpdfhkyzLJod9H8o5sdI2NznWo1N2CohxYa/sTDfEIONgFVwOh3FzD+NZNLtnK/q/rDSTk8aDyqXNNdBT1xV/s3OdPVAJc13oFH0lNZi6gWBGJ14P7MgvMdkzdCwspuVgw3ncxN0D0+/+nePecAG3pP/OTIs3J/8Q8H1WSOKksqn0CW6DqcVXqmQb7+KQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rnus6pMHnVqSgkem5vgPAAviYJRasiHitYlVsQzWn+5vI2m0vB3yOgiAi9kLYjZpUptrJBv812WwgtRZDNcjIV0LHbLdzhTto5dqLkHv2y1RDpAp2KGIF/iZ4AeuV3IhpZTcDO9d1CVR13EWYmKaYLCEoy7ckcxcUSFhUbv65OdygDkycUq+ZXN/R4IzXeVdMf1k7qR/YGoqMPfx9s1/9SKOCW2VypuzZVG1dYeONME74kR+YtV3skxwyCOEaYe48p9mkP9TV7oeWfRX21g0jIHXy9L48ccV40SQiTTMZ9VW5VUQrC/PF7Gceb9LzL/r5zFDuyXz/zAfrGXZtti/+J0HmbE1iJ1xTqpGkKEvVSqTl0ImY/P+beu36rSnrFwnA5G+oVQUVi3j6v9ulXECrUgj96A2nUJGQZulE8/affw5As9SCCu3nvvpSqMZBAUk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:59:07.5914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 967a26d7-2e15-4d9e-4ae0-08ded0666d9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8689

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
Changes since v2:
- Address feedback to hide mutex with common guard function
- Separate out mutex patch in hwmon file to next patch, 7/8
- Use file operation, open/release and kref to prevent use-after-free
  if the device is unbound in IOCTL
- Add check for msg.pad
 
Changes since v1:
- Use of devm_mutex_init in place of mutex_init
- Use of guard_mutex in place of mutex_lock()/mutex_unlock()
- Use of devm_add_action_or_reset() for clean removal
 drivers/misc/amd-sbi/tsi-core.c | 118 +++++++++++++++++++++++++++++++-
 drivers/misc/amd-sbi/tsi-core.h |   3 +
 drivers/misc/amd-sbi/tsi.c      |  36 +++++++++-
 include/linux/misc/tsi.h        |  15 ++++
 include/uapi/misc/amd-apml.h    |  23 +++++++
 5 files changed, 191 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-core.c
index 9278d06d8e5f..688b9221868f 100644
--- a/drivers/misc/amd-sbi/tsi-core.c
+++ b/drivers/misc/amd-sbi/tsi-core.c
@@ -6,7 +6,11 @@
  * Copyright (C) 2026 Advanced Micro Devices, Inc.
  */
 
+#include <linux/fs.h>
+#include <linux/ioctl.h>
 #include <linux/module.h>
+#include <linux/uaccess.h>
+#include <uapi/misc/amd-apml.h>
 #include "tsi-core.h"
 
 static inline struct sbtsi_i3c_priv *to_sbtsi_i3c_priv(struct sbtsi_data *data)
@@ -19,6 +23,17 @@ static u8 *sbtsi_i3c_buf(struct sbtsi_data *data)
 	return to_sbtsi_i3c_priv(data)->buf;
 }
 
+void sbtsi_data_release(struct kref *kref)
+{
+	struct sbtsi_data *data = container_of(kref, struct sbtsi_data, kref);
+
+	mutex_destroy(&data->lock);
+	if (data->is_i3c)
+		kfree(to_sbtsi_i3c_priv(data));
+	else
+		kfree(data);
+}
+
 /* I2C transfer function */
 static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
 {
@@ -80,7 +95,108 @@ int sbtsi_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
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
+	guard(sbtsi)(data);
+	return sbtsi_xfer(data, reg, val, is_read);
+}
+
+static int apml_tsi_reg_xfer(struct sbtsi_data *data,
+			     struct apml_tsi_xfer_msg __user *arg)
+{
+	struct apml_tsi_xfer_msg msg = { 0 };
+	int ret;
+
+	if (data->detached)
+		return -ENODEV;
+
+	if (copy_from_user(&msg, arg, sizeof(struct apml_tsi_xfer_msg)))
+		return -EFAULT;
+
+	if (msg.pad)
+		return -EINVAL;
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
+static int sbtsi_open(struct inode *inode, struct file *fp)
+{
+	struct sbtsi_data *data;
+
+	data = container_of(fp->private_data, struct sbtsi_data, sbtsi_misc_dev);
+	if (data->detached)
+		return -ENODEV;
+
+	kref_get(&data->kref);
+
+	return 0;
+}
+
+static int sbtsi_release(struct inode *inode, struct file *fp)
+{
+	struct sbtsi_data *data;
+
+	data = container_of(fp->private_data, struct sbtsi_data, sbtsi_misc_dev);
+	kref_put(&data->kref, sbtsi_data_release);
+	return 0;
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
+	.open		= sbtsi_open,
+	.release	= sbtsi_release,
+	.unlocked_ioctl	= sbtsi_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+};
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
+
+	return 0;
+}
diff --git a/drivers/misc/amd-sbi/tsi-core.h b/drivers/misc/amd-sbi/tsi-core.h
index 7dde040caf30..c0849c704c7b 100644
--- a/drivers/misc/amd-sbi/tsi-core.h
+++ b/drivers/misc/amd-sbi/tsi-core.h
@@ -20,4 +20,7 @@ struct sbtsi_i3c_priv {
 	u8 buf[2];
 };
 
+int create_misc_tsi_device(struct sbtsi_data *data, struct device *dev);
+
+void sbtsi_data_release(struct kref *kref);
 #endif /* _LINUX_TSI_CORE_H_ */
diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
index 8fb17ccab73d..6649cd8cdf85 100644
--- a/drivers/misc/amd-sbi/tsi.c
+++ b/drivers/misc/amd-sbi/tsi.c
@@ -42,6 +42,21 @@ static void sbtsi_unregister_hwmon_adev(void *_adev)
 	auxiliary_device_uninit(adev);
 }
 
+static void sbtsi_misc_unregister(void *arg)
+{
+	struct sbtsi_data *data = arg;
+
+	misc_deregister(&data->sbtsi_misc_dev);
+	data->detached = true;
+}
+
+static void sbtsi_driver_unref(void *arg)
+{
+	struct sbtsi_data *data = arg;
+
+	kref_put(&data->kref, sbtsi_data_release);
+}
+
 /*
  * Create and publish an auxiliary device. The hwmon driver in
  * drivers/hwmon/sbtsi_temp.c binds to this device.
@@ -89,6 +104,13 @@ static int sbtsi_probe_common(struct device *dev, struct sbtsi_data *data)
 	u8 val;
 	int err;
 
+	mutex_init(&data->lock);
+	kref_init(&data->kref);
+
+	err = devm_add_action_or_reset(dev, sbtsi_driver_unref, data);
+	if (err)
+		return err;
+
 	err = sbtsi_xfer(data, SBTSI_REG_CONFIG, &val, true);
 	if (err)
 		return err;
@@ -97,7 +119,15 @@ static int sbtsi_probe_common(struct device *dev, struct sbtsi_data *data)
 	data->read_order = FIELD_GET(BIT(SBTSI_CONFIG_READ_ORDER_SHIFT), val);
 
 	dev_set_drvdata(dev, data);
-	return sbtsi_create_hwmon_adev(dev, data->dev_addr);
+	err = sbtsi_create_hwmon_adev(dev, data->dev_addr);
+	if (err < 0)
+		return err;
+
+	err = create_misc_tsi_device(data, dev);
+	if (err)
+		return err;
+
+	return devm_add_action(dev, sbtsi_misc_unregister, data);
 }
 
 static int sbtsi_i2c_probe(struct i2c_client *client)
@@ -105,7 +135,7 @@ static int sbtsi_i2c_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct sbtsi_data *data;
 
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 
@@ -157,7 +187,7 @@ static int sbtsi_i3c_probe(struct i3c_device *i3cdev)
 	if (I3C_PID_INSTANCE_ID(devinfo.pid) != 0)
 		return -ENXIO;
 
-	i3c_priv = devm_kzalloc(dev, sizeof(*i3c_priv), GFP_KERNEL);
+	i3c_priv = kzalloc_obj(*i3c_priv);
 	if (!i3c_priv)
 		return -ENOMEM;
 
diff --git a/include/linux/misc/tsi.h b/include/linux/misc/tsi.h
index 02c90ec285ec..3ce3770d1ad5 100644
--- a/include/linux/misc/tsi.h
+++ b/include/linux/misc/tsi.h
@@ -8,30 +8,45 @@
 #ifndef _LINUX_MISC_TSI_H_
 #define _LINUX_MISC_TSI_H_
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/i3c/device.h>
+#include <linux/kref.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 
 /**
  * struct sbtsi_data - driver private data for an AMD SB-TSI device
  * @client:	underlying I2C client
  * @i3cdev:	underlying I3C device (when using I3C bus)
+ * @sbtsi_misc_dev: miscdevice exposing ioctl interface at /dev/sbtsi-<addr>
+ * @lock:           mutex protecting concurrent access to the device
+ * @kref:      reference count; keeps @sbtsi_data alive while misc fds are open
  * @dev_addr:	I2C/I3C device address, used to name the misc device node
  * @ext_range_mode:	sensor uses extended temperature range
  * @read_order:	if set, decimal part must be read before integer part
  * @is_i3c:	true when the device is accessed over I3C
+ * @detached:  set on driver unbind; open/ioctl return -ENODEV afterward
  */
 struct sbtsi_data {
 	union {
 		struct i2c_client *client;
 		struct i3c_device *i3cdev;
 	};
+	struct miscdevice sbtsi_misc_dev;
+	struct mutex lock;	/* protects concurrent access to the device */
+	struct kref kref;
 	u8 dev_addr;
 	bool ext_range_mode;
 	bool read_order;
 	bool is_i3c;
+	bool detached;
 };
 
+DEFINE_GUARD(sbtsi, struct sbtsi_data *, mutex_lock(&_T->lock),
+	     mutex_unlock(&_T->lock))
+
 /*
  * Name of the auxiliary device published on the auxiliary bus by the core
  * driver.  The full device name is "amd-sbtsi.temp-sensor.<id>". where
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

