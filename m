Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4459421880;
	Fri, 10 Jul 2026 11:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682259; cv=fail; b=n0SxoOD1MJCzqYp9tzh5INGRQgF+3xo02IVfijc5EIiu2tYquYKU+DauIbvLUKMrYv7vHzUsK35p6uiTfukO7jO97dY34UiN1wTw/5Px20bck+2OCEalnmEh1aISDndq0tJ+y655PKv7Iv6JXedhbU5u1IfF16VpBe5QZ+vh8zA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682259; c=relaxed/simple;
	bh=0kyJS3Q1QEamSYuIzRThkCCQ1eUGxphhwu1kPTq6Vcc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=clZVpA99AsGrL3dRQG2ltdVmS5AyerF0VPzHQB0rOtdkSsLeXVDfgHdXVEGispZaEP09Tah9wM/vyz720pHv9gm6IIgw4uFqoqhAYkzymWyWRKKMs/RvE2PbendPykSobYZ71apSaKXU0kCcoa/TOEaEb5zdTXSMrTt+bFcDcL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EFkAPcjr; arc=fail smtp.client-ip=40.93.196.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EFkAPcjr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKsR91uDzll/RLmxnSABZkgoD/BVGhDOq/xdF3vY73gixEmcNcGnsJo57QQ3x/P8rEPb/M1VKzTHYiZuBongPHzDC1JIo9sL+zy2LYahzY3rJ3qg4/M/ieXEeNNtPlRA5QFgH8yNSGq1Vai6wyeZX782JQOYc64PRNyyM8805YuTReAXAhh8lZkaapBwUui/VwGtFR8oHbFKoG9iD7+QlwuiUj9R3eZeENcO1sbnOdJoOsas4lyZVdZX7OztWsLB/PR5FxD+vG8SC1HZiQQhr52fvyBwtoHU7vEaVb/5Y8NjUnTBdba6gPkw1T1mmycOGjOch2dHZiNrxeCbD8bPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfWSRqOOG5anG2Vj+vlckP7EdFl851Rb5a003JOHNgo=;
 b=rfB1QQL9wWoAKCJskQuoBZtxS4WYECikNcSfDATpKGmaokA6Pr1QO7VC9/w2AZ2681irru3C1bR+1WY4ix9XcmPnSn9eYWnzmADGcCVMrngspJs+29B9K1GECVcy53B/Pb000pmZB1W38ftPFk82VbpNYgl0f5PWfnrM8vpXFsB//G4+wtEHS7mH10IAhEPVEWMooQKyFjhba4um68jwoj/g24iXXngi6EemNIKrLmF/V/UwMNSuDI5QfJhjQEg6V1jpfw16Kw5DToeA5hAIekmIbYW+luQ5wB5J8iX90WrgEIrmjINADnlWfDDDBKVXh9Mr+GHbeTAjj9PN7qMIlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfWSRqOOG5anG2Vj+vlckP7EdFl851Rb5a003JOHNgo=;
 b=EFkAPcjrhMrwaIZm25KmeXY1pGBjUn3heeOtDt8F4xOykzTmO52/hTaC6EMkIoIgSPr1oI73uQfRyVMgfC2ZiZugDrx6S90XUJbsB3FH9RHfJiEKprBaVYTDl7h6H9nWXuE5rQtlrn6Of1c1rkUPl7zWA++I3iS1DABj8vqAIcY=
Received: from DS7PR03CA0094.namprd03.prod.outlook.com (2603:10b6:5:3b7::9) by
 SA1PR12MB8857.namprd12.prod.outlook.com (2603:10b6:806:38d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.15; Fri, 10 Jul 2026 11:17:28 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::1c) by DS7PR03CA0094.outlook.office365.com
 (2603:10b6:5:3b7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 11:17:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 11:17:28 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 06:17:23 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v4 6/8] misc: amd-sbi: Add SBTSI ioctl register transfer interface
Date: Fri, 10 Jul 2026 16:46:40 +0530
Message-ID: <20260710111642.850022-7-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|SA1PR12MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d64cbbe-64a7-47b2-5a35-08dede74d3ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QoDsqJWZBCEt8Prd8JDpA657gK/mOcMJuwNgfU3M310ic5HtT/VPnqnHkbxRmQM2fHNYW9O0HoUh4RUIYXtsbLxvmJOwgc8eFUp5o5LSfGpZqp/MLb0r64RtbPY0KltncXiEItidExPVy00rwMYnNxc9pI8OD9MzrJmJfFkgWWSlOVFpxTkyV1+3IKiO/+7JlViURlR+/VUE1sSFh2NmgbM41VzvH3jFBfMQkPYguDPpEERz7M0qygv9l3BZPgZplivBJboq8mjR8oQIPaJZ5XPL4JNHxIan16Dwqkl7R71P7bIbFKtjI7eAIoQI6o/DWYd1nxHmzoB/hK1oKVdtj4dnnn/nq7BKJsv1NuBWxQ3Zng/JcqJNf1PEK5oc61rQ82d+YWs6JE84rA4G6uYt5mQsFnVIaK3sz/h62m+JtcVQpdxFqhrnUVYDQs8PuqTwrmG3f1iuENLn8PU3wQEevxmTBH7f2qdjCxErJ8K8/cpy1uTgDbwhtVu2xulahQ9VRu8uw95fa9rBr/NJ+z76Fbl12S3j0HVkMoIF9BG2wkpQkRQiCwT/4qzPSqje6zyQ1LcQHZXUzxdosDj0rDceNz6a/YRHfh4YaeEGZ6SRYyTgMCAwTDShiDYiinvfGGX/KZlGzR6fshWn54UcY2L1nN4FFeRZ7qUV2ic//AsyFXia7Nm8np8A8QjhOPwab2V57OIivtakJXF6pjPgDsSNpQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l3nSwFJSSIkrNTWU4yn9o3BhBF4+Orqcbi6i6IfcgDPkoeSYejobJsgrCiOx4dXSnc+woLk2d0nyCXMXyxxo7cSd37HPSTO26ZexwD4SIBH5mILqQPRHnlKnCcQHuR7mqJB0m9okwA3E/IhgRzNmGYcqIDXZQXij88buCSqtheAWvw0cyQIzNHkJozEv6CTugQK39Y35UNSM2sXps96pHPd+YGKMABkD1XqNcXevKKU11PxdgSuHHvKTO1w2dQe780uYD1NGda5/OQa0DKScKSedB+64DEklespO2h3JhQic5Jh5O3R58mxvU+TmJui3gkt+4Jns5dLmlTjRX5WhDfK4xud5uf6x4W2vioetgWu2RzRHt56TNpbweTI2krQTjmcaw14D1OEuoGr8rqFodXpWxcZd/+gEMnjtVw/LH2VIUXHfmn4w34D5N2xEAwYb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 11:17:28.3233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d64cbbe-64a7-47b2-5a35-08dede74d3ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8857

From: Prathima <Prathima.Lk@amd.com>

Implement IOCTL interface for SB-TSI driver to enable userspace access
to TSI register read/write operations through the AMD Advanced Platform
Management Link (APML) protocol.
Add an ioctl command (SBTSI_IOCTL_REG_XFER_CMD) that accepts a register
address, data byte, and direction flag.
The mutex is taken on the ioctl path here; the hwmon path is placed
under the same lock in the next patch, which completes serialization between
the hwmon and ioctl paths.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
Changes since v3:
- Implement a check on the read flag.
- Introduce a mutex lock on "detached" in the sbtsi_misc_unregister() function.
- Relocate the "detached" check to sbtsi_xfer_ioctl to prevent a time-of-check
  to time-of-use race condition if the device is unbound during this ioctl operation.
- Use devm_add_action_or_reset() in place of devm_add_action(), as in event of probe abort,
  it can leave the misc device registered

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

 drivers/misc/amd-sbi/tsi-core.c | 126 +++++++++++++++++++++++++++++++-
 drivers/misc/amd-sbi/tsi-core.h |   3 +
 drivers/misc/amd-sbi/tsi.c      |  38 +++++++++-
 include/linux/misc/tsi.h        |  16 ++++
 include/uapi/misc/amd-apml.h    |  23 ++++++
 5 files changed, 202 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-core.c
index 1c6f37f26d94..5c178702c67a 100644
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
@@ -14,6 +18,17 @@ static inline struct sbtsi_i3c_priv *to_sbtsi_i3c_priv(struct sbtsi_data *data)
 	return container_of(data, struct sbtsi_i3c_priv, data);
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
@@ -77,7 +92,116 @@ int sbtsi_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
 	if (data->is_i3c)
 		return is_read ? sbtsi_i3c_read(data, reg, val)
 			       : sbtsi_i3c_write(data, reg, *val);
-
 	return sbtsi_i2c_xfer(data, reg, val, is_read);
 }
 EXPORT_SYMBOL_GPL(sbtsi_xfer);
+
+/*
+ * The mutex protects against concurrent register transfers to the device
+ * over the shared bus.
+ */
+static int sbtsi_xfer_ioctl(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
+{
+	guard(sbtsi)(data);
+
+	if (data->detached)
+		return -ENODEV;
+
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
+	/*
+	 * rflag is a boolean direction flag (0 = write, 1 = read). Reject
+	 * any other value so the upper values stay reserved for future
+	 * extensions instead of being silently treated as a read.
+	 */
+	if (msg.pad || msg.rflag > 1)
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
+	scoped_guard(sbtsi, data) {
+		if (data->detached)
+			return -ENODEV;
+	}
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
index 7e8c0e7c3bcf..4cf55c46230e 100644
--- a/drivers/misc/amd-sbi/tsi-core.h
+++ b/drivers/misc/amd-sbi/tsi-core.h
@@ -23,4 +23,7 @@ struct sbtsi_i3c_priv {
 	u8 rx __aligned(ARCH_DMA_MINALIGN);
 };
 
+int create_misc_tsi_device(struct sbtsi_data *data, struct device *dev);
+
+void sbtsi_data_release(struct kref *kref);
 #endif /* _LINUX_TSI_CORE_H_ */
diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
index 1530f440a020..f06f417f451c 100644
--- a/drivers/misc/amd-sbi/tsi.c
+++ b/drivers/misc/amd-sbi/tsi.c
@@ -42,6 +42,23 @@ static void sbtsi_unregister_hwmon_adev(void *_adev)
 	auxiliary_device_uninit(adev);
 }
 
+static void sbtsi_misc_unregister(void *arg)
+{
+	struct sbtsi_data *data = arg;
+
+	misc_deregister(&data->sbtsi_misc_dev);
+
+	guard(sbtsi)(data);
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
@@ -84,6 +101,13 @@ static int sbtsi_probe_common(struct device *dev, struct sbtsi_data *data)
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
@@ -92,7 +116,15 @@ static int sbtsi_probe_common(struct device *dev, struct sbtsi_data *data)
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
+	return devm_add_action_or_reset(dev, sbtsi_misc_unregister, data);
 }
 
 static int sbtsi_i2c_probe(struct i2c_client *client)
@@ -100,7 +132,7 @@ static int sbtsi_i2c_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct sbtsi_data *data;
 
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 
@@ -158,7 +190,7 @@ static int sbtsi_i3c_probe(struct i3c_device *i3cdev)
 	if (I3C_PID_INSTANCE_ID(devinfo.pid) != 0)
 		return -ENXIO;
 
-	i3c_priv = devm_kzalloc(dev, sizeof(*i3c_priv), GFP_KERNEL);
+	i3c_priv = kzalloc_obj(*i3c_priv);
 	if (!i3c_priv)
 		return -ENOMEM;
 
diff --git a/include/linux/misc/tsi.h b/include/linux/misc/tsi.h
index 0bdd9d923f92..5273c44688f0 100644
--- a/include/linux/misc/tsi.h
+++ b/include/linux/misc/tsi.h
@@ -8,30 +8,46 @@
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
  * @dev_addr:	I2C/I3C device address, used as the auxiliary device instance id
+ *		and name the misc device node
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

