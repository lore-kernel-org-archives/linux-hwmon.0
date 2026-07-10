Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011048.outbound.protection.outlook.com [52.101.52.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C71420E7A;
	Fri, 10 Jul 2026 11:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682254; cv=fail; b=pMvmkjURg5TD50e0xuMOSvgw2gPHECLkI4WlIhzvIAMzlUvCW+G5qh8xGkUz40vRJ1fNss0085U7xVmCESvbhV44V2wOyS9K1Z3qQJlFG2d3Xqgn/uTkn3GY3EzISB1p0OGx1mDZscavyjqQmP9dWAzZrsC3eejlgdy3Bh5m5Bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682254; c=relaxed/simple;
	bh=c4QFBwjEnmJeDKQpEiW1oJExS6sCfuijxaFHg2lvtQU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c6HINcD+OkfaPsYAvACFPU11mdIVEhXi0OJ2SmYDJF3GngojPgOiVqjlEoUBPjN3hOFMitk5HosmUq6nC7knAk42Nx8A9hsbmHG6rfa12K+fZLXwqAQ+wfbAnyzqBTHCO1jVf53LWJfpoqcMEXnI20wreWuOkaMQ5PceVOQcBYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3Jl2bysL; arc=fail smtp.client-ip=52.101.52.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3Jl2bysL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6ljjgziSj1+tgCkY6OM01CSZJBVPN4jXvtj/cOTf4LASe9xeENCOsAEuS1DGvXe6KSzniItw9VE3GP20mg8I+1ZffJnxn8hCeRYrWzul9A9tCLGTaaC3tuwPIGkduOwhZTyZNYYasm0h0m630FTrWLPNgRge8l4x7TU4MKHWcaipELlDEU1MHB6d96VhzngHxd1Zbh5RQBP2T7FdWBsBY3z4ylEsdvPyMAwZMEn1wEwkKtYiI1pIatR7JSg/ug1jeqlI89Jcjclc8IjyHtXTUfGYSdw+MiU/fj7jTqjkij9fw6SY65iYyRvCUxgdKzD5RPPJFq84jYcQmWJwHTlkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eevdo2Ptuu/uhLIoNpxvK56VU/P0xZa4xV+RQpFpTVs=;
 b=VxiZPJpovk04O/V6SlhcsfjQvYWVN+/a82Pk2H/VXUhWe3zPTdxs9QCUCRrOKGqjlc73FmOMnA4Mk8ctdHuEv4/nyEZlae1fiwNHkSWVMAt/HlKbXIoHTUdkGJ2gwk/m/lHNvXdDD8oMOQNBeKX7OnEnQNSrQY14IIRugxiOZgFKAZt9GAXVqmN2EKrLw3G5GtzC3zddDi/ljxjThEDYU7B0DF05F9YgxUdrlivmxiNW54s9o1sSgxwOUo2cAcId0P/VItLH7SECsATTXoK62UmEZ5d/PZCiHeNT/5mC3BVbIYcFb5enHuGv24HiqAAIYJMo0e+aCWefwqwb35GtVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eevdo2Ptuu/uhLIoNpxvK56VU/P0xZa4xV+RQpFpTVs=;
 b=3Jl2bysLhYhawUmTGeuZ0my4pOc/D3MSLNr2z7lDXHJpx9LMQBIbrMGYU8AGYFzO8Tv7XeTitGiADek9I0WVKHOIwyz/RgnF2KDd6ebboiWBQd4sfXiKABUZ6qc33Mh478MoPZs9+gqxoSyVToLKrIuiNPVfT8sZTcRLT7v3agM=
Received: from DS7PR03CA0136.namprd03.prod.outlook.com (2603:10b6:5:3b4::21)
 by IA0PR12MB8350.namprd12.prod.outlook.com (2603:10b6:208:40d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 11:17:26 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:3b4:cafe::8c) by DS7PR03CA0136.outlook.office365.com
 (2603:10b6:5:3b4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 11:17:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 11:17:25 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 06:17:19 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v4 5/8] misc: amd-sbi: Add support for SB-TSI over I3C
Date: Fri, 10 Jul 2026 16:46:39 +0530
Message-ID: <20260710111642.850022-6-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|IA0PR12MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 922cbdf7-5ce9-424c-9e59-08dede74d230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|6133799003|3023799007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	GWqHcvAMvZJcDDYe6TiYM55RX+AYBAYTGcAOH4o+02Alj0aFotkVUfIJhCiZBBrPSNYC0/hKYmue7cfiyHxtFJNP0ONVGPGWbGDhnCg0TEBnP2TFE/C7k9+EO6ljOqSFy31lTBDm5vUjY4wAAk1c2l6mzAoG4tgrFoqm0O4acwYvcNEESPupH1e2oE7BzG7l8qnphx4H/Lsy16hoK3RHve0AMQhLC2x24XEZ0Y3TQFdYvhm2H+LDnEF6NSxXWoUwuxiIk+SnBZUMovMk30qXdFEzj6uOK88h/Mi0Y6j3qtAiryWfwTZQHN1rzZJWbAQl3WA1haRkgmNxiV6GrRIbZzhe2TnRtpeujllSabpgJ12BXvSzpu8sPybo3HYLwwuKXto34kKFJc2w2SgSuP/4wPXQsmx5ST5/RSoyg+pZz2GwIziWn4+w573S/ub8iEwi7OsqftdREnR9j6d9+jwzSmxX4fVCLC84YTwJvhrKkwMIMJ6z9/VB4xHCEnGDiBGLYDHnu11Ty0BJ/wzSiP6lcG/3BTJypaZ3HlB9hT4oLwuDxkg4Z6oLDYmm+YUhHPqoScNid9kqL6DCIby+moGwgJiVkUR0dUTLgBZjKZhVIluPOA/3OZf4IlMPGVi61tAxoHbxhLAhR/tG3SoP/jhxAB60a3X8oa/t2JKypJWH0wMfHsHShZFBaGn26aZ1z8tCmdyRZjk64yq/Knqs0VizgQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lm+SdjVoPoEEx/wIqGUwzOX2u1Ldf4pm5rkYJugh5q2Nd6l8gaZh0Rfl0B6qJFSbMcxEfIIhI3svnjtP5v3sfF84MuPmCCkv0Dou7CpJDU/mwGe/93JtP/VrkEuQqT8N2YyaXYVbKUp2e5Pnw93eq2uYIKzz8qWbVuwBURBmEZmwFa4CAu0wRn5edmE1i1P31IcaHW6+efmFaz6mBAVQdEGe/iut4JY3hDNB9po2XBNGDz5+rKT4YiKGUuPaNkViCPNUz2RT8muk+apt2TzhPL4P8BmxXn+kPwvbJ6JMt4NW+8TD69OOB5XFugv7K8JVyISv0R2/eufw2kB2RLoioT8al2c0Dh2o2NsQPT9aW4aqgCeNyCN3a05z8guBMwesK0sevIQFmtyvo0i16LPd0aDGx43C9/lcTyhEAdRPDm+twWUaQvE+aNvbFKYtoHGh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 11:17:25.6376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 922cbdf7-5ce9-424c-9e59-08dede74d230
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8350

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
Changes since v3:
- Resolved the issue with DMA cache alignment.
- Added a comment regarding the assigned address in a multi-socket system.
- Update comment for "struct sbtsi_data" element 

Changes since v2:
- Fix DMA mapping issue to prevent memory corruption or kernel panics
when CONFIG_VMAP_STACK is enabled
- Use i3c_device_get_info() to populate i3c_device_info structure fields
- Remove unused header file inclusion from "include/linux/misc/tsi.h"

Changes since v1:
- Changes in accordance with usage of auxiliary device

 drivers/misc/amd-sbi/Kconfig    |  4 +-
 drivers/misc/amd-sbi/tsi-core.c | 55 +++++++++++++++++++++++++++-
 drivers/misc/amd-sbi/tsi-core.h | 26 +++++++++++++
 drivers/misc/amd-sbi/tsi.c      | 65 +++++++++++++++++++++++++++++++--
 include/linux/misc/tsi.h        | 11 +++++-
 5 files changed, 152 insertions(+), 9 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/tsi-core.h

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
index 6ef1831515bb..1c6f37f26d94 100644
--- a/drivers/misc/amd-sbi/tsi-core.c
+++ b/drivers/misc/amd-sbi/tsi-core.c
@@ -7,7 +7,12 @@
  */
 
 #include <linux/module.h>
-#include <linux/misc/tsi.h>
+#include "tsi-core.h"
+
+static inline struct sbtsi_i3c_priv *to_sbtsi_i3c_priv(struct sbtsi_data *data)
+{
+	return container_of(data, struct sbtsi_i3c_priv, data);
+}
 
 /* I2C transfer function */
 static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
@@ -23,8 +28,56 @@ static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read
 	return i2c_smbus_write_byte_data(data->client, reg, *val);
 }
 
+/* I3C read transfer function */
+static int sbtsi_i3c_read(struct sbtsi_data *data, u8 reg, u8 *val)
+{
+	struct sbtsi_i3c_priv *priv = to_sbtsi_i3c_priv(data);
+	struct i3c_xfer xfers[2] = { };
+	int ret;
+
+	priv->tx[0] = reg;
+
+	/* Write the register address (DMA_TO_DEVICE). */
+	xfers[0].rnw = false;
+	xfers[0].len = 1;
+	xfers[0].data.out = priv->tx;
+
+	/* Read the data byte into a separate buffer (DMA_FROM_DEVICE). */
+	xfers[1].rnw = true;
+	xfers[1].len = 1;
+	xfers[1].data.in = &priv->rx;
+
+	ret = i3c_device_do_xfers(data->i3cdev, xfers, 2, I3C_SDR);
+	if (ret)
+		return ret;
+
+	*val = priv->rx;
+	return ret;
+}
+
+/* I3C write transfer function */
+static int sbtsi_i3c_write(struct sbtsi_data *data, u8 reg, u8 val)
+{
+	struct sbtsi_i3c_priv *priv = to_sbtsi_i3c_priv(data);
+	struct i3c_xfer xfers = {
+		.rnw = false,
+		.len = 2,
+		.data.out = priv->tx,
+	};
+
+	priv->tx[0] = reg;
+	priv->tx[1] = val;
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
diff --git a/drivers/misc/amd-sbi/tsi-core.h b/drivers/misc/amd-sbi/tsi-core.h
new file mode 100644
index 000000000000..7e8c0e7c3bcf
--- /dev/null
+++ b/drivers/misc/amd-sbi/tsi-core.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * AMD SBTSI core driver private definitions.
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _LINUX_TSI_CORE_H_
+#define _LINUX_TSI_CORE_H_
+
+#include <linux/cache.h>
+#include <linux/misc/tsi.h>
+
+/**
+ * struct sbtsi_i3c_priv - per-device state for I3C SBTSI (includes DMA-safe buffers)
+ * @data: public device state exposed via dev_set_drvdata()
+ * @tx:   outgoing I3C bytes (DMA_TO_DEVICE); [0] register address, [1] value
+ * @rx:   incoming I3C data byte (DMA_FROM_DEVICE)
+ */
+struct sbtsi_i3c_priv {
+	struct sbtsi_data data;
+	u8 tx[2];
+	u8 rx __aligned(ARCH_DMA_MINALIGN);
+};
+
+#endif /* _LINUX_TSI_CORE_H_ */
diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
index 35b9f40741e7..1530f440a020 100644
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
@@ -10,8 +10,8 @@
 #include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/misc/tsi.h>
 #include <linux/slab.h>
+#include "tsi-core.h"
 
 #define SBTSI_REG_CONFIG		0x03 /* RO */
 
@@ -104,6 +104,7 @@ static int sbtsi_i2c_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	data->is_i3c = false;
 	data->client = client;
 
 	/* In a multi-socket system, devices that are otherwise identical do not
@@ -139,7 +140,63 @@ static struct i2c_driver sbtsi_driver = {
 	.id_table = sbtsi_id,
 };
 
-module_i2c_driver(sbtsi_driver);
+static int sbtsi_i3c_probe(struct i3c_device *i3cdev)
+{
+	struct device *dev = i3cdev_to_dev(i3cdev);
+	struct i3c_device_info devinfo;
+	struct sbtsi_i3c_priv *i3c_priv;
+	struct sbtsi_data *data;
+
+	/*
+	 * AMD OOB devices differ on basis of Instance ID,
+	 * for SBTSI, instance ID is 0.
+	 * As the device Id match is not on basis of Instance ID,
+	 * add the below check to probe the SBTSI device only and
+	 * not other OOB devices.
+	 */
+	i3c_device_get_info(i3cdev, &devinfo);
+	if (I3C_PID_INSTANCE_ID(devinfo.pid) != 0)
+		return -ENXIO;
+
+	i3c_priv = devm_kzalloc(dev, sizeof(*i3c_priv), GFP_KERNEL);
+	if (!i3c_priv)
+		return -ENOMEM;
+
+	data = &i3c_priv->data;
+	data->i3cdev = i3cdev;
+	data->is_i3c = true;
+	/*
+	 * In a multi-socket system, otherwise identical devices do not share
+	 * the same address; each instance is enumerated with a distinct dynamic
+	 * (assigned) address on the I3C bus. Use that address (passed in as
+	 * dev_addr) as the auxiliary device instance ID so that every socket
+	 * gets a unique auxiliary device name.
+	 */
+	data->dev_addr = devinfo.dyn_addr;
+
+	return sbtsi_probe_common(dev, data);
+}
+
+static const struct i3c_device_id sbtsi_i3c_id[] = {
+	/* PID for AMD SBTSI device */
+	I3C_DEVICE_EXTRA_INFO(0x112, 0x0, 0x1, NULL),	/* Socket:0, Turin and Genoa */
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
index 6533879cc358..0bdd9d923f92 100644
--- a/include/linux/misc/tsi.h
+++ b/include/linux/misc/tsi.h
@@ -9,20 +9,27 @@
 #define _LINUX_MISC_TSI_H_
 
 #include <linux/i2c.h>
+#include <linux/i3c/device.h>
 #include <linux/types.h>
 
 /**
  * struct sbtsi_data - driver private data for an AMD SB-TSI device
  * @client:	underlying I2C client
- * @dev_addr:	I2C device address, used as the auxiliary device instance id
+ * @i3cdev:	underlying I3C device (when using I3C bus)
+ * @dev_addr:	I2C/I3C device address, used as the auxiliary device instance id
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
 	u8 dev_addr;
 	bool ext_range_mode;
 	bool read_order;
+	bool is_i3c;
 };
 
 /*
-- 
2.34.1

