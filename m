Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A9D39E191;
	Thu,  9 Apr 2026 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732391; cv=fail; b=fCWTHY5SBxFA+USQtEsASyIn4M2m5wHAuRe7jEQAiISAQUNmkTHC43/LT6hToajHAPE5CIxkAyLGevXcAxh0a63RHZtTDID6GoLwqjKZPK00V5vlZobJJKKAktJ7x/Yp/hmyyllgkAhbN4TJTzq1lIUUWnHFMBx1o4T/ECbn+Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732391; c=relaxed/simple;
	bh=knNvGuKiZYeKDsz1IkS32EzebT/ZH5PKQy7/F1Tgn3s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O6/u9s+wD1vcUnbX34Snsc2B5emFrSTdn5QRi5u8w/M3w1S3HP1FDS0FAZ0ad3nieFwiDowQfg42k1q+5JbYOV5fMk4o/rAtEjYbIlGwz/XEzP3pHHeGVZuNZ7kiC0pDwPAE/Y087H4imNVy0aOwjAADSEEgwqhk5Gz/p3PtSLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jTK3Qm1T; arc=fail smtp.client-ip=52.101.61.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jTK3Qm1T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6MxQOb+hhkeGBpYQa3dVy9TRmsG3hsg6gX5CBDIZ0xYlFkBDypWXuXnk5NmdGUYDYRVffJI/Ow0O3nvUaRRhXI/x2ecCeJGHxEoiSRIEfsNmBOjn6lGrWccXt6euLHo1oYiRjPCuNzCb7g3PhadRiILjSofKBZGR+q9CfBCnLFQnPhNBYeH3YgpUTRqDuwpgnysuGFeZOdJbS9EOCK6YfPa/cibkXAxoy/fEhK5kwel6ZJd+OVDmNhT1waMsahOxD/nWyN+yRWPPKa+s90eKkg4bmt+6eiGYAcZt4IKdwdG1gZoJSfsOcAUqZaS+QUSIFfQOA0+nc2fCidwQZ7wLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fL8MGfEfMrgjc7AcmAmUaU/Q+xBzvnCMYOXlTx0EXaE=;
 b=O+Zkc8oHCq+52pgg0A8l1mCXt0yaVpvcMGXXcvxxYIHTPhqale/p/Pz4/miqIxt5zeXeIYO9ByMfp/LaJkLuY0k2eui8AeOipdCy3SMLyTCYau/1q6bLiEpsQ1YfhqCuIPghhyNsDEAkgtD5ln1LCdD8oG7LswAY87BQQgbuG4IR/OGmDUKs0zEzZyuw3HCe8ui/RzxrhyUm7GsNc6qAVm+lh9Mh9tPcxGhxJqVbQamS+kfRg+G0rUvM4kLlKsIKb/PpmwNa/iGJfycI7I/vaDQNnM5WEb2wu8TQC9aWqYVvefyHz6Z+bCWCwBdIMfG7/uBRfBZPZr3oqslCnpiGxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fL8MGfEfMrgjc7AcmAmUaU/Q+xBzvnCMYOXlTx0EXaE=;
 b=jTK3Qm1T//MLy/xrDM3BAQxeYBooC8XBBo76FHI7WLyumB2Xru9c43fSQwRRK3KrtXCCYNAT7ioeObeok0JaoaapU+fZjPTfgfXdPJyq/g9sRV/ayGPvOq/GtHKcFw3K7y/Wu1/g2FSXt10W/Wd5aosNh4VaC7CRzpsIYYVWXhFOeXboXQGe67hLAhJZglUaRpKUR2nYeiTXDabKH1PIzkeWDc9jNbO8O9Ow1+BmUClJoAxYdkjst97XMWUMG9cWmEJadBf9A9QL9/wH1JPebv9onYMtNXgx6GFILCGqg5yKsNjg3C+HGTFqTkrePhWGLBMIzt6nMuKe8utU74G/Lg==
Received: from CH5PR05CA0020.namprd05.prod.outlook.com (2603:10b6:610:1f0::13)
 by DS5PPF5A66AFD1C.namprd12.prod.outlook.com (2603:10b6:f:fc00::64d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Thu, 9 Apr
 2026 10:59:42 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::fd) by CH5PR05CA0020.outlook.office365.com
 (2603:10b6:610:1f0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 10:59:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 10:59:41 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:59:27 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:59:26 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 03:59:21 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 05/13] i3c: master: Add support for devices using SETAASA
Date: Thu, 9 Apr 2026 16:27:35 +0530
Message-ID: <20260409105747.48158-6-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260409105747.48158-1-akhilrajeev@nvidia.com>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DS5PPF5A66AFD1C:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc50901-5345-40f0-5df8-08de96271a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|921020|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VtDCsue7aLPPuywlhbTlPuYa0wr6sJuv3xDtWAn0k602tMxDbJAR2IgCACR9osEUG9SFbtvqy+qg+WbccXSV1T/zVqEjZVBlFcnyFB4n7P95Unq/TXcEJzB2UjiswZW7AkD5V4G4XsjYzoGWvu2yDsnh/0rrdIPriSo977blkKhKauRdIS1kbVSrfhwtOkmSmr9u9DSMXQ9LX2sB7MaTtbirAUfwZ/RMS6CgGAJ5KZe4DscjLZpMUgkCs+CZK29qKnoEVNrwTloNZ9FzuDplIrDJUdsfOgGJIyNpzDtdBjlbEoDy1TTFQSYn+NjX0v2boP54Fww6WXMnpjtHIr4C2LD2TOYZtE3mgj3yo8bfee+TQzIplmNB3VJBUAGOioOy7MVXUR6uPi/Q8MgI5C2GLQxaebVHAuws+/LZMwX5m0h6W/dU/778kvd0JUd1QwxUQIZSIm2qlIDX+i30PpXFdblKgmPeCVkJ6Xek/In82ezlDEGEF6OrY6WcIrMNCJFH0cFU3xgs0wjwdeGgnDKZYb3LBJkDyq/8whOi+W8h87ny75G62yEjVHcduz3myhZveassgBpHL8uQ7II0BZDNh/TyXUl2VZLTPxDcSWR4Wjv1vD7Flz55hlztg8Uq0VUAcc4YAyQ9W4fWKOU4vkjVxNAZHwpCxCvmAbx5nXBFK7OWuWJc+EgEeV6b0BBMrmcPdV2dDhaKwdo1JxWvpf9OYl38Xy+uGB3Phmo1E+sxuTX/B8K+Q9jt0ekjPnlC8afrTEllqPOTaQE/Fo3kjX2UmlbnnWKJfZGIzuTYv60uANxYxJTMpvIbAsK3u9Gts1N6
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(921020)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gR4Jw0YqKXw8o2Jmj6EM+pjpQr582iJq8NpvIH452qnjSynUEMxOssKGrXMk9xAXakbg9xphXcSeXd8RDaHAyQw0hSu3NBtpjN4VeCtZAHQhEQI9rtQgosvk9aiE9lIGfXs+83EAIk/fdyp/OqZKfGMH0Pct6le9EE/jJmipNoQ/YXCFFDse2SjVZJaHey5UsR32e/nKkKZZJItaCxUeIId+x/dIT13k5mgdKmBu+aezu33j66J8paVcK+32ux33cS4EL6r8VsQ66c4C6Dk/u/JnNzqOQHOqvsyhooKN7NytiJlTS/k545Uw+htDjOWbrbC0dUcpnENq2ztJcn22F3Jfe0QSOsDmyP78dy5MTWw/XWMx1rrAbnRKapnED7xXtK1tKerj465ue9hFNLQHsaeQuk+dK2xJKnYLg3hYBbBamT5ifK2OVpWBBUsN4O5f
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:59:41.7924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc50901-5345-40f0-5df8-08de96271a24
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5A66AFD1C

Add support for devices using SETAASA, such as SPD5118 and SPD5108
attached to DDR5 memory modules that do not support ENTDAA. Follow the
guidelines proposed by the MIPI Discovery and Configuration
Specification[1] for discovering such devices.

SETAASA (Set All Addresses to Static Address) differs from standard I3C
address assignment that uses ENTDAA or SETDASA to assign dynamic
addresses. Devices using SETAASA assign their pre-defined static
addresses as their dynamic addresses during DAA, and it is not mandatory
for these devices to implement standard CCC commands like GETPID, GETDCR,
or GETBCR. For such devices, it is generally recommended to issue SETHID
(specified by JEDEC JESD300) as a prerequisite for SETAASA to stop HID
bit flipping.

[1] https://www.mipi.org/mipi-disco-for-i3c-download

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c       | 73 +++++++++++++++++++++++++++++++++++++-
 include/linux/i3c/ccc.h    |  1 +
 include/linux/i3c/master.h | 17 +++++++++
 3 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 08d0fcabd6f1..a0f7a0d35f3f 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1049,6 +1049,47 @@ static int i3c_master_rstdaa_locked(struct i3c_master_controller *master,
 	return ret;
 }
 
+/**
+ * i3c_master_setaasa_locked() - start a SETAASA procedure (Set All Addresses to Static Address)
+ * @master: I3C master object
+ *
+ * Send a SETAASA CCC command to set all attached I3C devices' dynamic addresses to
+ * their static address.
+ *
+ * This function must be called with the bus lock held in write mode.
+ *
+ * First, the SETHID CCC command is sent, followed by the SETAASA CCC.
+ *
+ * Return: 0 in case of success, a positive I3C error code if the error is
+ * one of the official Mx error codes, and a negative error code otherwise.
+ */
+static int i3c_master_setaasa_locked(struct i3c_master_controller *master)
+{
+	struct i3c_ccc_cmd_dest dest;
+	struct i3c_ccc_cmd cmd;
+	int ret;
+
+	/*
+	 * Send SETHID CCC command. Though it is a standard CCC command specified
+	 * in JESD300-5, we are not defining a separate macro to be explicit that
+	 * the value falls under the vendor specific range.
+	 */
+	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
+	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_VENDOR(0, true), &dest, 1);
+	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+	i3c_ccc_cmd_dest_cleanup(&dest);
+	if (ret)
+		return ret;
+
+	/* Send SETAASA CCC command */
+	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
+	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_SETAASA, &dest, 1);
+	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+	i3c_ccc_cmd_dest_cleanup(&dest);
+
+	return ret;
+}
+
 /**
  * i3c_master_entdaa_locked() - start a DAA (Dynamic Address Assignment)
  *				procedure
@@ -1733,6 +1774,18 @@ static int i3c_master_early_i3c_dev_add(struct i3c_master_controller *master,
 	if (ret)
 		goto err_free_dev;
 
+	/*
+	 * For devices using SETAASA instead of ENTDAA, the address is statically
+	 * assigned. Update the dynamic address to the provided static address.
+	 * Reattaching the I3C device is not useful. It is also not mandatory
+	 * for such devices to implement CCC commands like GETPID, GETDCR etc.
+	 * Hence, we can return here.
+	 */
+	if (i3cdev->boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		i3cdev->info.dyn_addr = i3cdev->boardinfo->static_addr;
+		return 0;
+	}
+
 	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
 					i3cdev->boardinfo->init_dyn_addr);
 	if (ret)
@@ -2132,6 +2185,16 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 			goto err_bus_cleanup;
 	}
 
+	if (master->addr_method & I3C_ADDR_METHOD_SETAASA) {
+		ret = i3c_master_setaasa_locked(master);
+		if (ret) {
+			if (ret == -EOPNOTSUPP)
+				dev_warn(&master->dev, "SETAASA is not supported. Some devices may not be detected.\n");
+			else
+				goto err_bus_cleanup;
+		}
+	}
+
 	/* Disable all slave events before starting DAA. */
 	ret = i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
 				      I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
@@ -2501,7 +2564,7 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	struct i3c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
 	enum i3c_addr_slot_status addrstatus;
-	u32 init_dyn_addr = 0;
+	u32 init_dyn_addr = 0, static_addr_method = 0;
 
 	boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
 	if (!boardinfo)
@@ -2529,6 +2592,13 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 			return -EINVAL;
 	}
 
+	if (!fwnode_property_read_u32(fwnode, "mipi-i3c-static-method", &static_addr_method))
+		boardinfo->static_addr_method = static_addr_method &
+					(I3C_ADDR_METHOD_SETDASA | I3C_ADDR_METHOD_SETAASA);
+
+	/* Update the address methods required for device discovery */
+	master->addr_method |= boardinfo->static_addr_method;
+
 	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
 
 	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
@@ -3156,6 +3226,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 	master->dev.release = i3c_masterdev_release;
 	master->ops = ops;
 	master->secondary = secondary;
+	master->addr_method = I3C_ADDR_METHOD_SETDASA;
 	INIT_LIST_HEAD(&master->boardinfo.i2c);
 	INIT_LIST_HEAD(&master->boardinfo.i3c);
 
diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
index ad59a4ae60d1..a145d766ab6f 100644
--- a/include/linux/i3c/ccc.h
+++ b/include/linux/i3c/ccc.h
@@ -32,6 +32,7 @@
 #define I3C_CCC_DEFSLVS			I3C_CCC_ID(0x8, true)
 #define I3C_CCC_ENTTM			I3C_CCC_ID(0xb, true)
 #define I3C_CCC_ENTHDR(x)		I3C_CCC_ID(0x20 + (x), true)
+#define I3C_CCC_SETAASA			I3C_CCC_ID(0x29, true)
 
 /* Unicast-only commands */
 #define I3C_CCC_SETDASA			I3C_CCC_ID(0x7, false)
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 6b03a3ce574c..71802d9b5943 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -174,6 +174,14 @@ struct i3c_device_ibi_info {
  *		 assigned a dynamic address by the master. Will be used during
  *		 bus initialization to assign it a specific dynamic address
  *		 before starting DAA (Dynamic Address Assignment)
+ * @static_addr_method: Bitmap describing which methods of Dynamic Address
+ *		 Assignment from a Static Address are supported by this I3C Target.
+ *		 A value of 1 in a bit position indicates that the Bus Controller
+ *		 supports that method, and a value of 0 indicates that the Bus
+ *		 Controller does not support that method.
+ *		 Bit 0: SETDASA
+ *		 Bit 1: SETAASA
+ *		 All other bits are reserved.
  * @pid: I3C Provisioned ID exposed by the device. This is a unique identifier
  *	 that may be used to attach boardinfo to i3c_dev_desc when the device
  *	 does not have a static address
@@ -189,6 +197,7 @@ struct i3c_dev_boardinfo {
 	struct list_head node;
 	u8 init_dyn_addr;
 	u8 static_addr;
+	u8 static_addr_method;
 	u64 pid;
 	struct fwnode_handle *fwnode;
 };
@@ -498,6 +507,8 @@ struct i3c_master_controller_ops {
 				  unsigned long dev_nack_retry_cnt);
 };
 
+#define I3C_ADDR_METHOD_SETDASA BIT(0)
+#define I3C_ADDR_METHOD_SETAASA BIT(1)
 /**
  * struct i3c_master_controller - I3C master controller object
  * @dev: device to be registered to the device-model
@@ -516,6 +527,11 @@ struct i3c_master_controller_ops {
  * @boardinfo.i2c: list of I2C boardinfo objects
  * @boardinfo: board-level information attached to devices connected on the bus
  * @bus: I3C bus exposed by this master
+ * @addr_method: Bitmap describing which methods of Address Assignment required
+ *		 to be run for discovering all the devices on the bus.
+ *		 Bit 0: SETDASA
+ *		 Bit 1: SETAASA
+ *		 All other bits are reserved.
  * @wq: workqueue which can be used by master
  *	drivers if they need to postpone operations that need to take place
  *	in a thread context. Typical examples are Hot Join processing which
@@ -543,6 +559,7 @@ struct i3c_master_controller {
 		struct list_head i2c;
 	} boardinfo;
 	struct i3c_bus bus;
+	u8 addr_method;
 	struct workqueue_struct *wq;
 	unsigned int dev_nack_retry_count;
 };
-- 
2.50.1

