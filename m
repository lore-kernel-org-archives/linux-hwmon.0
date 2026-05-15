Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012021.outbound.protection.outlook.com [40.107.209.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6D248165C;
	Fri, 15 May 2026 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852761; cv=fail; b=RcxdsxW7WokxzAWt6XX4OOWMq3u8Xp7wmYUaRUEo28GBZnDow6DFT3ZAybdqJmyQmZHOo+/JU61VgyrckeFkYIEuZ3lgnxypL2yZVBK1W81mWffP3u/rBj/VOU9S3n+YRST88CRdrWDjjkiGPfyxzD3SSQBR6GfJFfK56lxX7Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852761; c=relaxed/simple;
	bh=9IlAJb4QS9o4IpbEU1dyIRKkKGnLssfZs+j0/2qZRbc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Acg+QJ/TcVyrPBu91WKjJ1zANJD/+KgvnYzvdH9ur+2FavjsNbzDepAb8+nSROqvUQzO7HM1mWsbyC/xe9yaHzu2JTS1sPEB/W9TVXPPDTAOWGlNl3jrKTlnBoU+6elZcTg1tesisVQPh+VGcciiO/A3J9VMRXnflPIqOrZWGXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XNjNsku0; arc=fail smtp.client-ip=40.107.209.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XNjNsku0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfOqDjyki1J9duQud7ZpvzjUPJA4gneERkxTUo8BM24l2KSAVGvXNuMpqVk1G6BZmiChoCuu3Xhro16shVsFJfxiRL6Oh6mlN9gjhBiRtmCPtCCJVCxi2sQbUcQKi6tSZwo/0V8ZMEPUb3aM4SsksCvlScfP6FfK6nC+4pN8u1oM4Y/nYkk6sZUZb7s1mvUHJwGQfi4VJ4/ox8+XoC3zr+aPgvuiIRmggheYE+CW0W1rzcvgs6wAPwSgID0p39SpQ1b8ldAqaW9nIbauABlKq5Hm9U/6tXNE3C+QDi10jq4DM61smfE+SMx4r0HRq1IHYixHLubMoXCGq0qRH1BArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xzAJIk5wFHCkS9vzBBMHYzHo6lvJzWKOS7YUanPM28=;
 b=EB3zyXeyOkldpNkRkKpIb6jlsrYmsxuNQEvRM+UTxefMTJGdbceR/htyA8mz9BbIlP/SZAsgPyOsDW4hVDWla4plsrjM19CWT0dnAxNZqZkAhUzFGK1OIli/OT2yS0QqUKr/91DtmFrGQKOK+WJKayAOJi/o1oibRH0++i/A1Xkg2urwrcVUZDhrghKjPU6H70JHx3pWsATi8OX8Pbldi76Q6VWXevWWsuoxzlPt15q53cJc1s9VhdaKbaoR72WyyLnfvmj8o0/6nxiC6lrmBHqgVHH+SkFgi0axOnYvxs0hIZRJ7FTYg3MetAsEvyhYoQBbHjh/dWvDPqmbyo6JmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xzAJIk5wFHCkS9vzBBMHYzHo6lvJzWKOS7YUanPM28=;
 b=XNjNsku0Gen0N05Fhy19xDfsW2WdWIRaeyh8zAUUrUWCRGj/Er14geNh8L5p1QSjcr2kERNDNvR9c2nHl4TIyKXa5lQKxmIEIMxC9hGZ21UAcc3JIdomVdbrVwU4FSFtEQjCrfo4J3RPj6+u9YlQAQGnbt8aReSipMJebme1g1c=
Received: from BN9PR03CA0515.namprd03.prod.outlook.com (2603:10b6:408:131::10)
 by MN0PR12MB6054.namprd12.prod.outlook.com (2603:10b6:208:3ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 13:45:47 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::d9) by BN9PR03CA0515.outlook.office365.com
 (2603:10b6:408:131::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Fri,
 15 May 2026 13:45:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 13:45:47 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 15 May
 2026 08:45:43 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<naveenkrishna.chatradhi@amd.com>, <Prathima.Lk@amd.com>,
	<Anand.Umarji@amd.com>, <Kevin.Tung@quantatw.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v2 4/6] misc: amd-sbi: Add support for SB-TSI over I3C
Date: Fri, 15 May 2026 19:15:04 +0530
Message-ID: <20260515134506.397649-5-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|MN0PR12MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: d61351ba-0ffc-47c4-9ac2-08deb288450b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|11063799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OSbnUCn6me6rY/2BGVhUBNkZjvIAkdHx8zy5CJlj0P3XxVBYXRf3rLIYPYgFvGcjk6vS6ihQUCy/cCca5+ppA51e41OSPWALKDzDwioteklC5Yvj57K1F0TmFLjRSFKwRsEenb5Cax0IuGGy5iDAL2ozREpVbS5PA+v8nFV3aZiOJlnuhKE/Rrxg5aOv9C4OU/k3v28B0bHw2Aeybd2UNUcLXa+Ao04TIuXtVipxNdakDKBWmPagK0C6+oO0ouIj/8s8TQoy41onrA3g3AYlqfXwEBRBuJDvT2Tz/rOr+4AUV41nlQ6wD7A0QK24Jay5flUGaLKVRTSuifCaemE7FXbEBa7uIeKJCVgxu48Y4MnRH8HdvTVhF+z/TLjwg1mD8DKk2zT/d35KxcDoUdXJ1zR9M8C/mg0Foh3G2lnJ2N8LdnlyxTxNmNxo7V4wDXMjGAEJsDnHqXcG+y39K8BCBhvUMT1oiZc3gfh6NHbDSMVCm35Knb+sb1UK4lTUi+6wwpanblVzY/D6kSZ1BnEsLpwB4+eRrpNgiGexzLjzf6HMERev8CLtsojNW+218O+Wj8HJZW5RnCZWl+FQ6M8VDbko72lHD5wgTXPwu2PlCGf4lWls/RdZBYbQo7jCbjChaMZeNx2dr+ujlKbY8Kt+rhvLga42xdhL9F3xV/JbLckmKtLT/j6p+2FZ+Reaf4ZvP/VEukuAoTAoe49Y02XYe5pCD6OWVzUcfrRbW5qnjk4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(11063799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wFPs4H0WzUNnczhW3ElzT6SOUbsQZucFGFeuBL7lPhYofH9M7qNIfbfY5awybBOWZWodt+/+0v8XQxFqXpJAQ7oa8TzJyUwBDHMXeBzdJgJyIFGiJwD5EXFTWseEVPKtgIlAmyxWcDjggk9zoCyuczykiwAu4ZT6f65DN/+qr1tHphdeFfgs/yOqD6AEZbA5fgBCgsLGXmsxdwQ9Rr6p0GI22PGbaC3Cp8Wya5tuLd2m9KQcmp23TbS9MRDaFhV0b3m0bpkiftviaX0imzNE8dJdLwt9Fers1jc0hEqpeY74z8AbAdWNwRK2Bnn+54OnWMY+RcRIccTG4yE390N4R/LLNZeu1Ou/5ti/piWqaePckk4b2BgM0+4w3rxigZ9Wh1Lj63WF3Rbn+S8Vg4NCNsF1RIkwdlfRgB7XeLs+OPIxAajPUZ0AfT5ukMB0+u+s
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:45:47.6442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d61351ba-0ffc-47c4-9ac2-08deb288450b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6054

From: Prathima <Prathima.Lk@amd.com>

AMD SB-TSI temperature sensors can be accessed over both
I2C and I3C buses depending on the platform configuration.
Extend the SB-TSI driver to support both I2C and I3C bus interfaces
by selecting the appropriate transport based on the probed bus type.
The driver maintains backward compatibility with existing I2C
deployments while enabling support for systems using the I3C bus.
Register both I2C and I3C drivers using module_i3c_i2c_driver() and
update the Kconfig dependency from I2C to I3C_OR_I2C.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
Changes since v1:
- Changes in accordance with usage of auxiliary device

 drivers/misc/amd-sbi/Kconfig    |  4 +--
 drivers/misc/amd-sbi/tsi-core.c | 38 ++++++++++++++++++++
 drivers/misc/amd-sbi/tsi.c      | 61 +++++++++++++++++++++++++++++++--
 include/linux/misc/tsi.h        | 10 +++++-
 4 files changed, 107 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
index 512251690e0e..1a96b71f8506 100644
--- a/drivers/misc/amd-sbi/Kconfig
+++ b/drivers/misc/amd-sbi/Kconfig
@@ -23,13 +23,13 @@ config AMD_SBRMI_HWMON
 
 config AMD_SBTSI
 	tristate "AMD side band TSI support"
-	depends on I2C
+	depends on I3C_OR_I2C
 	depends on ARM || ARM64 || COMPILE_TEST
 	select AUXILIARY_BUS
 	help
 	  Enables support for the AMD SB-TSI (Side Band Temperature Sensor
 	  Interface) driver, which provides access to emulated CPU temperature
-	  sensors on AMD SoCs via an I2C connected BMC device.
+	  sensors on AMD SoCs via an I2C/I3C connected BMC device.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called sbtsi.
diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-core.c
index 6ef1831515bb..19388737b225 100644
--- a/drivers/misc/amd-sbi/tsi-core.c
+++ b/drivers/misc/amd-sbi/tsi-core.c
@@ -23,8 +23,46 @@ static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read
 	return i2c_smbus_write_byte_data(data->client, reg, *val);
 }
 
+/* I3C read transfer function */
+static int sbtsi_i3c_read(struct sbtsi_data *data, u8 reg, u8 *val)
+{
+	struct i3c_xfer xfers[2] = { };
+
+	/* Add Register data to read/write */
+	xfers[0].rnw = false;
+	xfers[0].len = 1;
+	xfers[0].data.out = &reg;
+
+	xfers[1].rnw = true;
+	xfers[1].len = 1;
+	xfers[1].data.in = val;
+
+	return i3c_device_do_xfers(data->i3cdev, xfers, 2, I3C_SDR);
+}
+
+/* I3C write transfer function */
+static int sbtsi_i3c_write(struct sbtsi_data *data, u8 reg, u8 val)
+{
+	u8 buf[2];
+	struct i3c_xfer xfers = {
+		.rnw = false,
+		.len = 2,
+		.data.out = buf,
+	};
+
+	buf[0] = reg;
+	buf[1] = val;
+
+	return i3c_device_do_xfers(data->i3cdev, &xfers, 1, I3C_SDR);
+}
+
+/* Unified transfer function for I2C and I3C access */
 int sbtsi_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
 {
+	if (data->is_i3c)
+		return is_read ? sbtsi_i3c_read(data, reg, val)
+			       : sbtsi_i3c_write(data, reg, *val);
+
 	return sbtsi_i2c_xfer(data, reg, val, is_read);
 }
 EXPORT_SYMBOL_GPL(sbtsi_xfer);
diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
index ee2216785550..43bbac7faf08 100644
--- a/drivers/misc/amd-sbi/tsi.c
+++ b/drivers/misc/amd-sbi/tsi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * tsi.c - AMD SBTSI I2C core driver. Probes the SBTSI device over I2C
+ * tsi.c - AMD SBTSI I2C/I3C core driver. Probes the SBTSI device over I2C/I3C
  *         and publishes an auxiliary device on the auxiliary bus.
  *
  * Copyright (C) 2026 Advanced Micro Devices, Inc.
@@ -89,6 +89,7 @@ static int sbtsi_i2c_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	data->is_i3c = false;
 	data->client = client;
 	err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
 	if (err < 0)
@@ -123,7 +124,61 @@ static struct i2c_driver sbtsi_driver = {
 	.id_table = sbtsi_id,
 };
 
-module_i2c_driver(sbtsi_driver);
+static int sbtsi_i3c_probe(struct i3c_device *i3cdev)
+{
+	struct device *dev = i3cdev_to_dev(i3cdev);
+	struct sbtsi_data *data;
+	int err;
+	u8 val;
+
+	/*
+	 * AMD OOB devices differ on basis of Instance ID,
+	 * for SBTSI, instance ID is 0.
+	 * As the device Id match is not on basis of Instance ID,
+	 * add the below check to probe the SBTSI device only and
+	 * not other OOB devices.
+	 */
+	if (I3C_PID_INSTANCE_ID(i3cdev->desc->info.pid) != 0)
+		return -ENXIO;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->i3cdev = i3cdev;
+	data->is_i3c = true;
+
+	err = sbtsi_xfer(data, SBTSI_REG_CONFIG, &val, true);
+	if (err)
+		return err;
+
+	data->ext_range_mode = FIELD_GET(BIT(SBTSI_CONFIG_EXT_RANGE_SHIFT), val);
+	data->read_order = FIELD_GET(BIT(SBTSI_CONFIG_READ_ORDER_SHIFT), val);
+
+	dev_set_drvdata(dev, data);
+	return sbtsi_create_hwmon_adev(dev, i3cdev->desc->info.dyn_addr);
+}
+
+static const struct i3c_device_id sbtsi_i3c_id[] = {
+	/* PID for AMD SBTSI device */
+	I3C_DEVICE_EXTRA_INFO(0x112, 0x0, 0x1, NULL),
+	I3C_DEVICE_EXTRA_INFO(0x0, 0x0, 0x118, NULL),	/* Socket:0, Venice */
+	I3C_DEVICE_EXTRA_INFO(0x0, 0x100, 0x118, NULL),	/* Socket:1, Venice */
+	I3C_DEVICE_EXTRA_INFO(0x112, 0x0, 0x119, NULL),	/* Socket:0, Venice */
+	I3C_DEVICE_EXTRA_INFO(0x112, 0x100, 0x119, NULL),	/* Socket:1, Venice */
+	{}
+};
+MODULE_DEVICE_TABLE(i3c, sbtsi_i3c_id);
+
+static struct i3c_driver sbtsi_i3c_driver = {
+	.driver = {
+		.name = "sbtsi-i3c",
+	},
+	.probe = sbtsi_i3c_probe,
+	.id_table = sbtsi_i3c_id,
+};
+
+module_i3c_i2c_driver(sbtsi_i3c_driver, &sbtsi_driver);
 
-MODULE_DESCRIPTION("AMD SB-TSI I2C core driver");
+MODULE_DESCRIPTION("AMD SB-TSI I2C/I3C core driver");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/misc/tsi.h b/include/linux/misc/tsi.h
index 8f8cb90c2023..7ce689081427 100644
--- a/include/linux/misc/tsi.h
+++ b/include/linux/misc/tsi.h
@@ -9,18 +9,26 @@
 #define _LINUX_TSI_H_
 
 #include <linux/i2c.h>
+#include <linux/i3c/device.h>
+#include <linux/i3c/master.h>
 #include <linux/types.h>
 
 /**
  * struct sbtsi_data - driver private data for an AMD SB-TSI device
  * @client:	underlying I2C client
+ * @i3cdev:	underlying I3C device (when using I3C bus)
  * @ext_range_mode:	sensor uses extended temperature range
  * @read_order:	if set, decimal part must be read before integer part
+ * @is_i3c:	true when the device is accessed over I3C
  */
 struct sbtsi_data {
-	struct i2c_client *client;
+	union {
+		struct i2c_client *client;
+		struct i3c_device *i3cdev;
+	};
 	bool ext_range_mode;
 	bool read_order;
+	bool is_i3c;
 };
 
 /*
-- 
2.34.1

