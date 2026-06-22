Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012016.outbound.protection.outlook.com [40.93.195.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F303B6349;
	Mon, 22 Jun 2026 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136758; cv=fail; b=ufmtC55eL2XMsIjEoStCpDD6czY+d7NGlkFpgr/bUQZsDV5W+dk2OqHo4SwshB1uiXlwkJxvd7esr8iQTPeAMN/R8BdRFnVMkU2VxDPl9SRQvPeIKsN+w8rLG2Ca4W0xjk8EMCdGveTV0U0rbWAyMYZZt8y4zkJ6db9SZliDES0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136758; c=relaxed/simple;
	bh=cMJXwHPq1o9SiQcZ4H8PEd8RWcd10Y11ZbBvoyXdBdE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ds8js+Dh1zN/V1OE8lBSkPKav9xIjsbXjDurMFAipp2OECkpFuZRaD4BmA5f3rLDYHjBMuZ8WQYTa5LYMHBUQ/0B3fkDuGAVDP/2wNIqByrr26z0SxMmuwWzpoUzC/SuZLGyGuKy42oDsjC0Hnssfg1Ui2nbk/InXBOqS26WVEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zAWTw2fo; arc=fail smtp.client-ip=40.93.195.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zAWTw2fo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dX44W5YhlK/Y6OgCe0xb9uESHjMqtvJrF8gMQN/fCjOJiVSsKAxhaiGXvxxNNa1okiEkWahEU6WsBxUfhAnc+xgxoKe41oMezEUabKA5Adg9RCoXgn5ivFPRUdZWT423Y24nAeceMfu3NEnIzRTrUmunDa+0c8OmjryAXDUxep7hcPp1Mxdbjlwv1aKuTzEtDE2h48Moqbx/Pg8jIcycGRNAhpk9OEeqQOC1w4/QE8RtSiUijTTXb3dB2Qib3Ylx0r2gDEg55ULVSc+pyOLPx3exWg3lHNvYq7SZj9nKnuxEe1Xa7wcAXaaM+utZrgrM+Q/lIYVe4bgygTMwbAhVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiqeA8YRacrkQLLSTPUY9QdN5b3/GLhByT27aostrNM=;
 b=NVRQuPeSpzOcyFy9A8khy1+laX5adLWKmzqyrJSTbct3rZOMASBVwaeGiogZO+cR06ppAJgOGsC5aAhjOwGm5AD18Plk/sdzbEpW2IcB8ogYIDYGmn4+kJq0ECv7/Z5j7bWe1h+yHsZIgZ8h3DLpob4O8G1ZT0Ny1S979W5kfgmuuggPDnSF+iaXcB4TJNl/DtDTqDFnzIE3piz3BON8xDRjs7IosSMldQiT9kIda3BJJSxpZLouk7HJpj5XQAKG3r4z6TofeIrPBezCIAgbxFnW3jUzldBdHgObjqqWrTE6SDEsjy546I4J22B86UHQD1wCexwwQDGZ30K6nO4+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiqeA8YRacrkQLLSTPUY9QdN5b3/GLhByT27aostrNM=;
 b=zAWTw2foDuHxfjex9ni7gE3QLKRrIYZ0zAxDfPYPcNC44f+a1G96lWkL3etp0tH+mnBdtdTEGfN3c0hrD8k3lUpHbCCQvfMB4aP0T3JvBFhy6eRhvp7koPFWzY5qWY1b4QO3m6eKKe6/7i2YlyMvvZeFGGXTwXEcSJSzVLDlfS0=
Received: from SJ0PR03CA0097.namprd03.prod.outlook.com (2603:10b6:a03:333::12)
 by DS4PR12MB9684.namprd12.prod.outlook.com (2603:10b6:8:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 22 Jun
 2026 13:59:05 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::4a) by SJ0PR03CA0097.outlook.office365.com
 (2603:10b6:a03:333::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Mon,
 22 Jun 2026 13:59:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 13:59:04 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 08:59:00 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v3 5/8] misc: amd-sbi: Add support for SB-TSI over I3C
Date: Mon, 22 Jun 2026 19:28:18 +0530
Message-ID: <20260622135821.2190260-6-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|DS4PR12MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: c07cbf42-6c34-4629-c1c0-08ded0666b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jGb1l5u5NzC7W5wlmRgz1OD5CqXG9B9a0VukgVpT6iDy3Oa4ohaqFjRWxazK4I9mAzbqAvjbF3UYjFzD0o0OQbdqhJBD+ADHzQ7+p9jH5CQ7E07bn5CphgWCtNn2LKUoWisCmlOn1VzJkTlKHBLRpbyUClnKJWPE72L0Ifp76wV6ld79b05aD3FGGKz+T70CUjqgafvqGJsFfiv7UdUUR5nP3PQcnB1Vn+B6vm5OzcdkVPR33schkzPCqq6bwHAmtX6SyJNzh3xt0FURlfjyNMoeWOP8ttR4JM+ESOJaQnYxkaipD69TZqnHv/2OG5kpBFaAqWr5V6W0ruPDIMs/SUgfjOS7ImW4g3KU1MfB+62AkjvCASFxKFLKvIrOrv8sEDFixuwFoe9YS/m7TSjgolr/gPPw4vjhniyXy0sqIKM/t11pJN1OXIwykPaxMjlWnnqUjSFZ3mzqq0YhAWCxCBs8NsfmoE69iVsp2G8SQaerZaPHkFwDNANEm5HN2x9OjsvPAZm0FIvHFsr0I3wCKHE+xUDWhRMdWB6jnT2XlTDnNsjEFNZTnnexwHKtacXc941tNiWv3RvFGOPAVYD3EBKl/39sLyxBipB3eENTIoYfKv6G2berRTxpY6AIYPzEeyukBrP2p8tWcYjtwoXmLyTJiyrNwOrXe8QFJCaUNzHrDPmSkEtCqiNpIzTC3W+/X4PB3Dr87Z/2qqJimFBT6g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KQM1MArxIAjAIXkRaZSdyrmSdf5aAIn6nnxuu9v4+GoFVbVWxG/zpdTv6BXFeo1MqnmUK3P8BoVNE+HPOxgWPOejhWo+6lRoc0p/Y2HgeH3O/676Nm2mJDLuq7GygdU/p1RIOrae3KJ4mEBumopdVdnrFfAVk3Elbq6xKINHY9OIa0roIZ942VQipBKnyxTZ/bEzKKdcIN5UibipNDq367vuBudYaAc7rhlWcw/lR2GUXsHXCcQYkkU0smkYiLdTNP0hsHKWNcOBii/cfqku/aexDcW09j7dzGd0OShhNSi8aA2qioqSc4Dx0w3EsYO0vSzJI0ws5UmkmT0QCWysCgE2ZLRwO4QUGGIbHio6nfn7k/N36CFuoytnQNMAjGuKuPGspBl5Q17JS/YqNzqdZG5uvYPUzIhQ/0udQ9JsQf2EazYKn7e87RBPbTOsXP31
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:59:04.2764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c07cbf42-6c34-4629-c1c0-08ded0666b9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9684

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
Changes since v2:
- Fix DMA mapping issue to prevent memory corruption or kernel panics
when CONFIG_VMAP_STACK is enabled
- Use i3c_device_get_info() to populate i3c_device_info structure fields
- Remove unused header file inclusion from "include/linux/misc/tsi.h"

Changes since v1:
- Changes in accordance with usage of auxiliary device

 drivers/misc/amd-sbi/Kconfig    |  4 +--
 drivers/misc/amd-sbi/tsi-core.c | 58 ++++++++++++++++++++++++++++++++-
 drivers/misc/amd-sbi/tsi-core.h | 23 +++++++++++++
 drivers/misc/amd-sbi/tsi.c      | 58 ++++++++++++++++++++++++++++++---
 include/linux/misc/tsi.h        | 11 +++++--
 5 files changed, 145 insertions(+), 9 deletions(-)
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
index 6ef1831515bb..9278d06d8e5f 100644
--- a/drivers/misc/amd-sbi/tsi-core.c
+++ b/drivers/misc/amd-sbi/tsi-core.c
@@ -7,7 +7,17 @@
  */
 
 #include <linux/module.h>
-#include <linux/misc/tsi.h>
+#include "tsi-core.h"
+
+static inline struct sbtsi_i3c_priv *to_sbtsi_i3c_priv(struct sbtsi_data *data)
+{
+	return container_of(data, struct sbtsi_i3c_priv, data);
+}
+
+static u8 *sbtsi_i3c_buf(struct sbtsi_data *data)
+{
+	return to_sbtsi_i3c_priv(data)->buf;
+}
 
 /* I2C transfer function */
 static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read)
@@ -23,8 +33,54 @@ static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool is_read
 	return i2c_smbus_write_byte_data(data->client, reg, *val);
 }
 
+/* I3C read transfer function */
+static int sbtsi_i3c_read(struct sbtsi_data *data, u8 reg, u8 *val)
+{
+	struct i3c_xfer xfers[2] = { };
+	u8 *buf = sbtsi_i3c_buf(data);
+	int ret;
+
+	buf[0] = reg;
+	/* Add Register data to read/write */
+	xfers[0].rnw = false;
+	xfers[0].len = 1;
+	xfers[0].data.out = &buf[0];
+
+	xfers[1].rnw = true;
+	xfers[1].len = 1;
+	xfers[1].data.in = &buf[1];
+
+	ret = i3c_device_do_xfers(data->i3cdev, xfers, 2, I3C_SDR);
+	if (ret)
+		return ret;
+
+	*val = buf[1];
+	return ret;
+}
+
+/* I3C write transfer function */
+static int sbtsi_i3c_write(struct sbtsi_data *data, u8 reg, u8 val)
+{
+	u8 *buf = sbtsi_i3c_buf(data);
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
diff --git a/drivers/misc/amd-sbi/tsi-core.h b/drivers/misc/amd-sbi/tsi-core.h
new file mode 100644
index 000000000000..7dde040caf30
--- /dev/null
+++ b/drivers/misc/amd-sbi/tsi-core.h
@@ -0,0 +1,23 @@
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
+#include <linux/misc/tsi.h>
+
+/**
+ * struct sbtsi_i3c_priv - per-device state for I3C SBTSI (includes DMA-safe buffers)
+ * @data: public device state exposed via dev_set_drvdata()
+ * @buf:  I3C transfer buffer; [0] register address, [1] data byte
+ */
+struct sbtsi_i3c_priv {
+	struct sbtsi_data data;
+	u8 buf[2];
+};
+
+#endif /* _LINUX_TSI_CORE_H_ */
diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
index a4c7e1be5624..8fb17ccab73d 100644
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
 
@@ -109,6 +109,7 @@ static int sbtsi_i2c_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	data->is_i3c = false;
 	data->client = client;
 	data->dev_addr = client->addr;
 
@@ -138,7 +139,56 @@ static struct i2c_driver sbtsi_driver = {
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
index 55ee7e42a65d..02c90ec285ec 100644
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
- * @dev_addr:	I2C device address, used to name the misc device node
+ * @i3cdev:	underlying I3C device (when using I3C bus)
+ * @dev_addr:	I2C/I3C device address, used to name the misc device node
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

