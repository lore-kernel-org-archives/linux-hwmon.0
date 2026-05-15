Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012007.outbound.protection.outlook.com [40.93.195.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41904480949;
	Fri, 15 May 2026 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852750; cv=fail; b=Hun2F5csn1mHDpiLFAKzETIyXurcwLFsH9bHeYO6Y3SFf6jG1Ri/WcsfDj6z9Rdyp4VCwyCvZ4RtX7/CKMxWj9m5eDLiRJaSETT1veJ6NhJMAxpvbjIPGCut6i1v9q3hO/pB7Htfk2nmXNgu2efRYsrR1wnbBcNXKFHu+EYA5Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852750; c=relaxed/simple;
	bh=Fojgjmvzgxp6YhgwvQoYQbtcfT/AzhJq2zeJfIgeLq4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3+v8vlS8UN7HR9lFk8pYVeIU/NESMOaZSioS6WzrxfGWr7j+cRuguhXyn9JQB7gGp2AZs0vJ6QlEzX3nbquvmhMC4nvEXuJggk5sN+NmsVOlV/SzAjNMsl4Kmdb67W1Wme1jKzaLHbfF60ChY7WelcYYV97OfCXAYgcstsdN7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bHCukE24; arc=fail smtp.client-ip=40.93.195.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bHCukE24"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNwxBSHyF/WZo92E9QvgWEV3wxMiV0w/Mbr+v9ZjOGFS58BO/PbdEdc16aZCYJjNP82azaGYRBvFzV9reQL7h6exFAI4e1Rp9PVN0P9TJ1GAhDx7FI4Nk6KyPC6KeAJY4ByGlC3Eo4PNwdj4W9iX0UWf1y7N14HBnJks4jMadHTXhu0X98txtD2sIgU7Og4iu93PV/gPs3qMALXIJXjkM4UUZZsLPQlwjYawO0SZcu3+gNhLNnWUR26eem0b5CjyY0uUqPZxW67LnYTprBrp5wsEfjGIoXolErmoEJd+mZM+21016LeZF1Y9UscU6+MT+6KCtEGbfkRaRH00aN43Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vNBS9RsY/wscygEY80hMgjqO8PMx5T/clek61lcu88=;
 b=SGZRVoOF1GN+5g4LisTjKmp7GM8Y7legO8grSczZP6hWASCCCrRTKDQe50cpBH2/UnvyEWiJT40KjldAc19mNrSxGRgi/xh78gp6v86c3R1NhpnlKMP0nK8eAyhXShynHotyFzfFLfiIMj3LRGL0+d8sxMC/sfrskBRoBe9KaSh5hKbUg1T2TyRv7CqdhzxPFVaXbxFgOoaVSpZBSKasHBuq90SnQDw+p4T9yiV39ssroKWxVgMvUIuiDj9KVYmiYenn9N/oeJ1zUAdeGHuFEXHzwpQksFjUgsaD/msz9nLCCr6uTCV9kt48zNrqAD6zZKojHM2Bj2DyW0XhkCZXyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vNBS9RsY/wscygEY80hMgjqO8PMx5T/clek61lcu88=;
 b=bHCukE24AAIPa9QYSeQpS3bnLJTREaZjUlg6moYD8roMj+4qMcEFyKpWGBTG7RKpD2iOgRdMjP54OjqsiXDn1OBgDsC+n03XU/jKKOG1MqMZ2yAV+MeYP0MUNvCV5N9jX1BAythBM6xYI8QMIbTJwuBfE0pJTTAaJUQI1FTO2aI=
Received: from BL1PR13CA0446.namprd13.prod.outlook.com (2603:10b6:208:2c3::31)
 by IA0PPF12042BF6F.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Fri, 15 May
 2026 13:45:44 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::59) by BL1PR13CA0446.outlook.office365.com
 (2603:10b6:208:2c3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Fri, 15
 May 2026 13:45:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 13:45:44 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 15 May
 2026 08:45:38 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<naveenkrishna.chatradhi@amd.com>, <Prathima.Lk@amd.com>,
	<Anand.Umarji@amd.com>, <Kevin.Tung@quantatw.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v2 3/6] hwmon/misc: amd-sbi: Move sbtsi register transfer to core abstraction
Date: Fri, 15 May 2026 19:15:03 +0530
Message-ID: <20260515134506.397649-4-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|IA0PPF12042BF6F:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffdc4f4-380e-4961-1efe-08deb2884336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003|11063799003|3023799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NQVdN95PIPfubbeLViFUb5dhZ3Wg3mPD9J0oVH2Pobw5cV31cHqFQgRfIuUdPcgFMEhQtCg9gyTtw6E1zwF6wlf0+zaTA1dyvWNuN1FhYMlQSCSsIxvHhnLuecATZ9kyQeuVkWO1gO5VjDpf/U7dUUbqrnc+4mD3QMiodkRiiFUj3b1ZNrC6FxR/79RXEenokzuCpR6u1gsnhQIkJQ6kV0clYXtLQ32JMoptnpYuD3PZ9uBOtIq32A8djnTzmzBuC9DW/jPWgCIEzJ/sv/ILt47EcDeGBn0Ldoh4cwr5Bm2/1qiMjOOGDq8K5qrBq8ahCzVdvSUs27MYPNc21z3vnzff/l+fpw1EXTXapqy2dH/5f9RTjlzT57JGWFdyo6neSDvI6KgYGXs7KXEqEryMcAvOqDlf6mUoO3LNV+ZkKve42mbkkrnxYY1TMI+urCm6szSXDQXPYzlgTtOniF42Kg2l4rgBTeN5/7xW3f8Z8F3Ep9z6ud1AG6f2RYwYR7UGLOuoi3ct+ryvMoMJyI4s2RQ9u/0Rg/Ji58Av7QnHUPoI+Curf3Zh0R0wYZQl2hk1jTSL3FSjBpA/pKd/+eLXnYlki369NhouSVZDAKsFeFgm6/0k8yCya26eHJSPmYqXW7GWlIvdforBCJXAW+8o9r45UUOYV87l9xcUPX9Voq/lhWaiYtLtz3SsGCGTDrqp1ViNrrAvqlBwJhvOPyY0wH3eB59eto1gJlxC7i03SP0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003)(11063799003)(3023799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ixHF0PcXIE1Q8P9UygcPdPjsegDH0jD1QX6fmA/uWKxV/GyWMOKBKLeQt/S6WwGbauCa0R3q7Lo3Kergs1Bs02TvXwxcfLOhNtRotM3MWdxfZkbeAsQ9bWsAZHZu9mjPjb+4RyR4ZnU0mpl9hMz6rf8TRxtTyMP+kK+8RLX13+dCdhPblTBVeqkXkvyM9tasNrp5NRxw52yQze2J8FAKi9h0giBcoVVRMRAwVnE6j3PbGG7MaLJHvbThxpEt2ZAn5wSkI0PabHW9iToijxhNkJg1/YQiTy6TKCw4u537rc1MFgxfCbpAZ0drQGnBWCH4I/5JRG9wRm+P6waQxfTLeHkfDDRogPUJ+mGvOaQ8UgNY37iJ17IFFAK1mKUGZA+xNJT1BHP7T0nbLHgjLKlQ2EgxACjulTPWmVzGUSHg7XltVDuzlzZhL/z0wuFJm64A
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:45:44.5684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffdc4f4-380e-4961-1efe-08deb2884336
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF12042BF6F

From: Prathima <Prathima.Lk@amd.com>

Move the I2C read/write byte operations from the sbtsi hwmon driver into
a common sbtsi_xfer() function in tsi-core.c.
This decouples the hwmon sensor driver from the underlying bus transport,
preparing for I3C support in a subsequent patch.
This patch does not introduce any functional changes. The updates are limited
to code organization/cleanup and should not affect the runtime
behavior of the driver

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
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
index 6f7177edbcf5..8f8cb90c2023 100644
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
 #endif /* _LINUX_TSI_H_ */
-- 
2.34.1

