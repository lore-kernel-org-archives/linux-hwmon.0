Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A43E3A169C;
	Mon, 23 Mar 2026 11:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264149; cv=fail; b=OgcHsHZ9vBX1jvtKjruNDjlwf11ii+sYrziNB2ou2QTfs3OCy0AmNXFx/7W3FYI6LaefIpLsE7B0OrOeVjSDCBwbhvOWhNuJZ6noEf+QFEuwL2u1dmgYHg+gRZoHp46ZM2a2jyv5mur1L1WEFHKR+z125lV/c6RQvSEHU/JrX7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264149; c=relaxed/simple;
	bh=H24hRCRRJ1B2kUsHpmvX2kmt2me1DeJqEEDrugPlDZs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AzSJslzJ+tXzybPxQvTevQyIk4TELmeG6j10LvSdLdhmm9i/1xHNC/tK61ff1ZMsN//+QCIe9i92httNWPPuxCVUcKpyu4MCDyWYa4+aBbaqNK6Bd+OdXDGvcizLuBwZVOeGyX4au9XutPqzRXjGxNYyXwnHWr08Ae2GZjgvkCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GgWHATx1; arc=fail smtp.client-ip=52.101.43.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GgWHATx1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTCNi7s6F1bMxkzBbTbsRpZk31Z57nUayoXg3J0o+QqjfFxJST51TaTbYAFnQW6XLtUvmFRM3CaRFZgTCKOE4wV3PjvZdtcPM6IrrPs6+3qwkaxbTeTWBo0BmYZ/s8e9YYS7aDLFtihehiNvB0Qt40zW/5CSL9mBw6G6lgW+7osryU4vhGRJGMO+LvRaQvj7LaAa/IjAmRWgNXj0j2kvD+36szc2hUSFJphIHXd8xWt8IAD+18UoW51CP2GT6ayYllL6+fJoJ9JDftJGNCRllaDlGL9u0NdOIoi1TDJtQ9VTDhECEwtQwoLiYborGl3RiC2VtsYWi3WHhfe7Z+/ZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LKrBF7cR4Ljhgvnbv7/Xn82Q4Nov6JyZLHHg9JI3pU=;
 b=mfjjEHXaR5/t91wiATM8j6zYFF/vcDxfjMXB1+ImJrHGGPoRDIXoVLAcjwWiXSDy8eZAwa3Q/h+djncjBkShv5Mtve2r5920qoqs7MGHVebh4VRopnrXjc+pqfv5/eYZfbGJoSf9xIa9KOFqi0B3MUFUjkaZYrNNr6JJI5K4p3nCV0bI870vCJwwKWUPKjXnE8li0ijjoC0b6wFiKJW6ZLy2QeagZBfr1Bgr0oTKA7UXCjXvRl7KLfg5lBzueMeFtOpBNqrAjCAJ2Wi2jyyVD9GwIQBKnxYwrmSczkf4uXLhJKNRPBtMhYl9jAiBJtXW8v4tH7qTw4swO5m3hN5oww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LKrBF7cR4Ljhgvnbv7/Xn82Q4Nov6JyZLHHg9JI3pU=;
 b=GgWHATx1C9oy7xXQBSQ9q7Bx2pQ5q5aA87bXl8Y1Ua4wW9ExWRXY0yArAT/GvdDZ0k4SBGsER/PKCKLe+Wndq2CxIWRLnRCcbr7oeHcGPHrXrwwe2VH66+G9Y3KiQCfY/+tXgVPurUmNq6OBOJl+gv32MYJ18gzAzjvyG3gynU0=
Received: from MN2PR08CA0013.namprd08.prod.outlook.com (2603:10b6:208:239::18)
 by DS0PR12MB7655.namprd12.prod.outlook.com (2603:10b6:8:11e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 11:09:02 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::b8) by MN2PR08CA0013.outlook.office365.com
 (2603:10b6:208:239::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 11:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 11:09:01 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 06:08:57 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<Prathima.Lk@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<Anand.Umarji@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <kunyi@google.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v1 5/6] misc: amd-sbi: Add SBTSI ioctl register transfer interface
Date: Mon, 23 Mar 2026 16:38:10 +0530
Message-ID: <20260323110811.2898997-6-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
References: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb08.amd.com
 (10.181.42.217)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|DS0PR12MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 86da4686-9f78-4368-1441-08de88cc96de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	GwuS3Gwb88BEWbJc9bGoWcTfEF1Pbmc4iHEGjAPWm5OlRl2VV2WkWrtXlkiRmVVcU2Fqhiigrc5Xsp7dE8XPZNzxkaM+Yxsl4UiRUECE45fJvtRRGhSYG9nh1uyJKnJw0+SJesHWvRLIJRjq5liXlfDBT62y4cwsoyy4g/SHlraxmpFViZOdHYLyK6Rg0zSObSPmlJj9b/fW4Fhdc7rpy9MeFL4NsX+L8fiauq/wquovvRapsDEpi/+UhayPz2A0wR6rdVUUny6AEhmWFZBvI5Pyf2zYDZYBKm6MRyjnoV5tHM07BPALKu1zWAh4NR/OCWWA1eiBNZyLFBblTONzyH9ClSj/nAQ/b3YfmFYuiOrYfYm4qPkdwuCDzusMWrocrFUzZBfMNUwtN1/tNCpl6moysnTgvtfxgWCGNgIhafbdEQ9BwxBGf+BQb+ezjROdc+aioDSbA3ZooZ/DtJdyTrMez8yx1uPBg3UDbeJEkOhf61sikpmCRLZkSzPXdPFvjE5E9Ikf71wuVwb+D+QKKICKeMU+4X34r3eXXrLbZaG5entbC/NQ5ZG/88kucXhFaqAHx0vuAPRhiYWYNpHYJ66a7lcyMpToKmTQ64p3mEHXA0ho/YBiNpWM+qNoYcyO9YBGfqEBesklBeTLCs6s/BN+bm0rdsGNmgD0SsQNhQFfJxq/5cp2NNViP1eiICoKYfGWxWwAb8UzCzMfoSRzNJXc42Czuie0QnqQPHGbdQpNk7kPFLITdbxqENI+KrwTDvJwdrVACwhz7UxyEYlPWg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0xaaeQnQOUIDyrJLJUVmQs+64BYY1MNS8WV7jP6eLSCIu6xu1MdHK8N2IDoDM+x7Kc4f8/a+LV61Kg0CD8goG6ASuerZIexPvkiP5QQJH3s1yblc6hhNUWVbKG5k03QUegQ8b+KrD1+tOZUeF3I/Cezm41PjYH5IxbvMLBr8Ve1gf9rmSImYIv0zwMXKF+1I8TE750m/9yT8Mzyjt1H/ZcCeeW+Uy6AD63KfGTeIYT84RcG5S+FPL3ql+D7P7D/miAAYV00BI9JkmkTezQXwojKHIFWhZ1YKvAkcBzG+1O/8y15gTbhjpdK4LaLyhCVFa9Q5/QCH3QM7WDDVB8WFPToHAbAs8qs8P2z63ybRxq5O8d3Ealeh2Xr5qsHx9yj5LOGutIUleLTdSO74KetCR4BlBoV6UkBuhOEWq88Ld2K1ewBLk/FwllFbe0TKO7yn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:09:01.8625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86da4686-9f78-4368-1441-08de88cc96de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7655

From: Prathima <Prathima.Lk@amd.com>

Implement IOCTL interface for SB-TSI driver to enable userspace access
to TSI register read/write operations through the AMD Advanced Platform
Management Link (APML) protocol.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
 drivers/misc/amd-sbi/tsi-core.c | 86 ++++++++++++++++++++++++++++++++-
 drivers/misc/amd-sbi/tsi-core.h |  5 ++
 drivers/misc/amd-sbi/tsi.c      | 37 ++++++++++++--
 include/uapi/misc/amd-apml.h    | 23 +++++++++
 4 files changed, 146 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-core.c
index fcb7fcf87a55..080cf1f368df 100644
--- a/drivers/misc/amd-sbi/tsi-core.c
+++ b/drivers/misc/amd-sbi/tsi-core.c
@@ -6,6 +6,10 @@
  * Copyright (c) 2020, Kun Yi <kunyi@google.com>
  */
 
+#include <linux/fs.h>
+#include <linux/ioctl.h>
+#include <linux/uaccess.h>
+#include <uapi/misc/amd-apml.h>
 #include "tsi-core.h"
 
 /* I3C read transfer function */
@@ -56,9 +60,87 @@ static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read
 /* Unified transfer function for I2C and I3C access */
 int sbtsi_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
 {
+	int ret;
+
+	mutex_lock(&data->lock);
 	if (data->is_i3c)
-		return is_read ? sbtsi_i3c_read(data, reg, val)
+		ret = is_read ? sbtsi_i3c_read(data, reg, val)
 			: sbtsi_i3c_write(data, reg, val);
+	else
+		ret = sbtsi_i2c_xfer(data, reg, val, is_read);
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static int apml_tsi_reg_xfer(struct sbtsi_data *data,
+			     struct apml_tsi_xfer_msg __user *arg)
+{
+	struct apml_tsi_xfer_msg msg = { 0 };
+	u8 val;
+	int ret;
+
+	/* Copy the structure from user */
+	if (copy_from_user(&msg, arg, sizeof(struct apml_tsi_xfer_msg)))
+		return -EFAULT;
+
+	if (msg.rflag) {
+		/* Read operation */
+		ret = sbtsi_xfer(data, msg.reg_addr, &val, true);
+		if (!ret)
+			msg.data_in_out = val;
+	} else {
+		/* Write operation */
+		ret = sbtsi_xfer(data, msg.reg_addr, &msg.data_in_out, false);
+	}
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
+	.owner          = THIS_MODULE,
+	.unlocked_ioctl = sbtsi_ioctl,
+	.compat_ioctl   = compat_ptr_ioctl,
+};
+
+int create_misc_tsi_device(struct sbtsi_data *data,
+			   struct device *dev)
+{
+	int ret;
+
+	data->sbtsi_misc_dev.name            = devm_kasprintf(dev, GFP_KERNEL,
+							      "sbtsi-%x", data->dev_addr);
+	if (!data->sbtsi_misc_dev.name)
+		return -ENOMEM;
+	data->sbtsi_misc_dev.minor           = MISC_DYNAMIC_MINOR;
+	data->sbtsi_misc_dev.fops            = &sbtsi_fops;
+	data->sbtsi_misc_dev.parent          = dev;
+	data->sbtsi_misc_dev.nodename        = devm_kasprintf(dev, GFP_KERNEL,
+							      "sbtsi-%x", data->dev_addr);
+	if (!data->sbtsi_misc_dev.nodename)
+		return -ENOMEM;
+	data->sbtsi_misc_dev.mode            = 0600;
+
+	ret = misc_register(&data->sbtsi_misc_dev);
+	if (ret)
+		return ret;
 
-	return sbtsi_i2c_xfer(data, reg, val, is_read);
+	return ret;
 }
diff --git a/drivers/misc/amd-sbi/tsi-core.h b/drivers/misc/amd-sbi/tsi-core.h
index a4ded17942c9..d130ceadde04 100644
--- a/drivers/misc/amd-sbi/tsi-core.h
+++ b/drivers/misc/amd-sbi/tsi-core.h
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
+#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/types.h>
@@ -21,12 +22,16 @@ struct sbtsi_data {
 		struct i2c_client *client;
 		struct i3c_device *i3cdev;
 	};
+	struct miscdevice sbtsi_misc_dev;
+	struct mutex lock; /* serializes SBTSI register access */
 	bool ext_range_mode;
 	bool read_order;
 	bool is_i3c;
+	u8 dev_addr;
 };
 
 int sbtsi_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read);
+int create_misc_tsi_device(struct sbtsi_data *data, struct device *dev);
 
 #ifdef CONFIG_AMD_SBTSI_HWMON
 int create_sbtsi_hwmon_sensor_device(struct device *dev, struct sbtsi_data *data);
diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
index d7a8237fc4fd..6e321064a3f3 100644
--- a/drivers/misc/amd-sbi/tsi.c
+++ b/drivers/misc/amd-sbi/tsi.c
@@ -38,6 +38,7 @@ static int sbtsi_i2c_probe(struct i2c_client *client)
 
 	data->is_i3c = false;
 	data->client = client;
+	mutex_init(&data->lock);
 	err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
 	if (err < 0)
 		return err;
@@ -45,7 +46,21 @@ static int sbtsi_i2c_probe(struct i2c_client *client)
 	data->read_order = FIELD_GET(BIT(SBTSI_CONFIG_READ_ORDER_SHIFT), err);
 
 	dev_set_drvdata(dev, data);
-	return create_sbtsi_hwmon_sensor_device(dev, data);
+	err = create_sbtsi_hwmon_sensor_device(dev, data);
+	if (err < 0)
+		return err;
+	data->dev_addr = client->addr;
+	return create_misc_tsi_device(data, dev);
+}
+
+static void sbtsi_i2c_remove(struct i2c_client *client)
+{
+	struct sbtsi_data *data = dev_get_drvdata(&client->dev);
+
+	if (data)
+		misc_deregister(&data->sbtsi_misc_dev);
+
+	dev_info(&client->dev, "Removed sbtsi driver\n");
 }
 
 static const struct i2c_device_id sbtsi_id[] = {
@@ -68,6 +83,7 @@ static struct i2c_driver sbtsi_driver = {
 		.of_match_table = of_match_ptr(sbtsi_of_match),
 	},
 	.probe = sbtsi_i2c_probe,
+	.remove = sbtsi_i2c_remove,
 	.id_table = sbtsi_id,
 };
 
@@ -90,7 +106,7 @@ static int sbtsi_i3c_probe(struct i3c_device *i3cdev)
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
-
+	mutex_init(&data->lock);
 	data->i3cdev = i3cdev;
 	data->is_i3c = true;
 
@@ -102,7 +118,21 @@ static int sbtsi_i3c_probe(struct i3c_device *i3cdev)
 	data->read_order = FIELD_GET(BIT(SBTSI_CONFIG_READ_ORDER_SHIFT), val);
 
 	dev_set_drvdata(dev, data);
-	return create_sbtsi_hwmon_sensor_device(dev, data);
+	err = create_sbtsi_hwmon_sensor_device(dev, data);
+	if (err < 0)
+		return err;
+	data->dev_addr = i3cdev->desc->info.dyn_addr;
+	return create_misc_tsi_device(data, dev);
+}
+
+static void sbtsi_i3c_remove(struct i3c_device *i3cdev)
+{
+	struct sbtsi_data *data = dev_get_drvdata(&i3cdev->dev);
+
+	if (data)
+		misc_deregister(&data->sbtsi_misc_dev);
+
+	dev_info(&i3cdev->dev, "Removed sbtsi-i3c driver\n");
 }
 
 static const struct i3c_device_id sbtsi_i3c_id[] = {
@@ -121,6 +151,7 @@ static struct i3c_driver sbtsi_i3c_driver = {
 		.name = "sbtsi-i3c",
 	},
 	.probe = sbtsi_i3c_probe,
+	.remove = sbtsi_i3c_remove,
 	.id_table = sbtsi_i3c_id,
 };
 
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
index 745b3338fc06..199532b8e64a 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -73,6 +73,13 @@ struct apml_reg_xfer_msg {
 	__u8 rflag;
 };
 
+struct apml_tsi_xfer_msg {
+	__u8 reg_addr;	/* TSI register address offset */
+	__u8 data_in_out;	/* Register data for read/write */
+	__u8 rflag;	/* Register read or write */
+	__u8 pad;	/* Explicit padding */
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
+ *      Pointer to the &struct apml_tsi_xfer_msg that will contain the protocol
+ *      information
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

