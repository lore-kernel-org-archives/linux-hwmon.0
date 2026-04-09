Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3C23BED31;
	Thu,  9 Apr 2026 10:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732372; cv=fail; b=HyZQNA7Ero7qj7J2YMXKLA7bzfKme4EevysHwkQyUcPLfS/e2NHaNb1jzdwyBaDbCqhwa2McQWWJ9Et6jkla4FHq8GQ3wnyhLLkI9zyHwMFTPnrFhP3nSwtszR2w3IIhLAKIJVzu3C7avoNHftfU/rn2nhWtqaZofEht6dARouY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732372; c=relaxed/simple;
	bh=1783VO0xhos705EiChL6SL6FDzH2gIBdP5/wJrv+Lls=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G2Rt1t9j45yJmHu2NR/jVxkauWIMpXz6SLZrY52wwqTrspofMon1h8NQ9m+CNyPjH2FYUpsbmGKXhnE/r4AnpG8Pm6QXFeEOeReDQXsJAiprT2WSNR/ztJvsP/vyFFUjBCc8KoJdJF2/n4Jn88moXDJgwyJxS/lKV43xSw85w+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CJTCMHT1; arc=fail smtp.client-ip=52.101.43.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CJTCMHT1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHiiu0nGdEWSOXHn9EiddrIWjwIkRVkgsI8PCoVrCS4VCZHrfPa5c8R6+e79AOuieaZJLZOZ1KfaRyz2+TiX1XiyLmTj+UfSUu74hBN+JgxPQ6DCrT2SvsgGsLUC9UN7RWvbrdSiTUY9L5KnQRS7NSB4mr0KvAxX1H2tbaeOsU7/88ug1CYoCfx/cpnwdcjMek3c+Bp1GjHzUcdJ1jN98mndWrAYwC3JAiveVO+PBc57VAoCBTyXhVV9A8K03cmP1OhNPUgnVI0o1DSQItVbUx39bdqHAZvWUtVZtisKPI/0UmxYTsV0DYcerdYa6r3kfB2WDCH8kxTt4EBwRn+s2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrJ0vy8RTZwoHol689kf+sHLWhdrcnEuvj5BT8kYUO4=;
 b=LzVAEYCdFLarRM9PmbCvIHekfC89GRZvS0KnEgerb/0Jhs1Djp9dqzrEs77vF0TTtv9RJ9vXn2AFqSA/YgcTuEzpDO+05SjFs6lDf2979EqeR9euHOBxxE2vwAR1kPc7zUV3bnULnn9FYXRJw8l85EsQfGtFRMp4y+vV40QsXdwlzJb+V8n+VKiWrZuFlssEhZebfYQVhfYB8UMVqvZmw1MTf14uQ06VVxK5N0Eg3brminkJjK6GmLH7crqUipvVsBH3ZrxbxCp2i/nTyQAD3ps3FpD1a1YXiw725doj78WX6rgkZa+QOUYMHkrc4V9wbR5XlOxDRz7S9DXlvsuw7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrJ0vy8RTZwoHol689kf+sHLWhdrcnEuvj5BT8kYUO4=;
 b=CJTCMHT1JPKvt7Wm9GyVzYujtaPdHsLwqpzPZtpSYDQqRwsgX3xKLRJ6Djysr6MQ0q5PDdvF9SoMG9PjzAgeH5ENxo5z7emBcgARXb12tPptIcmT/5iYyohcFdfD0neU6KDBATKDDfd32Jdxar1dDXucd+MmEAsg3qE3OQT1T8Jgfg/2PevHFjqPzrC5EFy+J6ZIYCAFyLhichdxRrddOuGNCevJR9Cb3KAf5bWDY3s0Pla9+W6QjOjII0mF67peuXIszvJ4sGFY/ollXjRxch8ydZrUzQTBGUxap2EaliXh0GowLMEJ0jKWD/hu2hxQRfG3TIwW3MxGfnetP16kRw==
Received: from DM6PR02CA0153.namprd02.prod.outlook.com (2603:10b6:5:332::20)
 by LVXPR12MB999197.namprd12.prod.outlook.com (2603:10b6:408:3dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 9 Apr
 2026 10:59:27 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:5:332:cafe::f5) by DM6PR02CA0153.outlook.office365.com
 (2603:10b6:5:332::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 10:59:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Thu, 9 Apr 2026 10:59:26 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:59:14 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:59:13 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 03:59:08 -0700
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
Subject: [PATCH v2 04/13] i3c: master: Support ACPI enumeration of child devices
Date: Thu, 9 Apr 2026 16:27:34 +0530
Message-ID: <20260409105747.48158-5-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|LVXPR12MB999197:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f0011bb-1324-4a26-b7df-08de962710d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|921020|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LlUBjLcMUk4EiiWw9hxjY0lYpeW90a8WRNcVHl0DAkCapxrxPjfRg//Siu1VQSbVOvJMOIZjQQcnTJ1eKZ0/5eUlUTYRbbp87uAPSEXeJyEl5THswiGdWPyRfxq7eiETdS8TNeAp+xVbPQmNgd/PT56I8bi5iuZIV4GZ1s+0k9jPscc3+E4mqfR5E79oeVCHMGEN1XHJrci83d9BhV8naw8yBKVr5JYUoDSMXFcS0F6m1/gAcoJpxS/Lp1te8NmZozQOobdjiBvR6EA2hT6VIEzgw+xyvr+g8pnMlbU14OVxVRTJLWOoLRDunfuMgWrcIjdA8fKAufdQjeo2iSpGqynoGni83jtep649rbPDYbRH3jCXhK8Oz31t58239MvamNdfPrZjZl9ekggPTidEyGayzS5qyqVVFPhLA1Tl3rqXN+5qi7eZ8T11CVCnUB9jlDOPaCBuUJz1BZzRmGrk33EqzEiERbVZDk74UyvRcxwbHHKcl3drLSfHChqjOkH9HATkY1lARCOlu1OuQowvEV0Smk4efP3NyL6Tn7omdM9sVrmbN4b0mJSY6g4/O+5oMLnyEjvWcpKEnoKtcCCUXfPkrQHUJfuzBwAxJpG8F9Be1P/3iACxPFeebn/6zfb2AYLJEeBdUQFL2uIUf6gDpUHFwaYU2p1ee6DIyxm3Lud/1gJ2c7utHe5JUQuT6CvRlqT+Ue8vqj4rucqdmlLdUEmwYN2mwhXEnBsnTd6jfs6mdfrtLNBvA8LwXA2ByYBnn/EdXcTqTl4udnzpfv6yf9/ALreOwOMtaNnOgAnSvJ+bfQ8qc9WuI7iJLENMxcy8
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(921020)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FSA039r1eYCnEH4pghm/CLgSJTbrgkUsPi2UwUcT1oDmlSEFwqmsTtO7BnTR2i+t30smvXfcIf+EKr+FOiIKbXH/aRAXS/QXesTXMvyUVrBZTdX5jYDc4FXd3MxXe/uT8jNQmlOI05QXLWQN9uXdwLQ/Yq0aXzX4XHzyQp0Kp93gYEU2MPNCcbf/foUHO9McBy7pn5cNsKw4GwR1MVhqV7KM7wqdSkz0r737RJ1U95peYV6YFEJeUgRlTBeJ3YgfMm6TVlia6bndEvOYKMw9U9FQjGsJR6i+DoXMJG2xl5wEO/3E1Y7Z0vuRA4cLK1blpxQc4eMwoS3XqxuXX5wlpEEZvR8hsRNpj/qVL8z1E7I3k4KRlwurldRTOrUayRwGMSEvmI5Xevu0ZowTbS/SrEEVlHH1mrLfJfQ2p95TxekiupiUrlg+rxp5keuqU9KP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:59:26.2175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0011bb-1324-4a26-b7df-08de962710d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR12MB999197

Although the existing subsystem allows host controllers to register
through the ACPI table, it was not possible to describe I3C or I2C
devices when using ACPI. This is because the driver relied on reg
property to retrieve the PID, static address etc whereas ACPI uses
_ADR or serial resources to describe such devices.

Read _ADR and LVR from the ACPI resources and extract the data as per the
ACPI specification for an I3C bus. Also read mipi-i3c-static-address as
per the MIPI DISCO specifications [1] to get the static address to be
used. Hence enable describing the I3C or I2C devices in the ACPI
table, which is required if the device is using a static address or if it
needs some specific properties to be attached to it.

[1] https://www.mipi.org/mipi-disco-for-i3c-download

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 140 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 132 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 5e0e926f61f3..08d0fcabd6f1 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -5,6 +5,7 @@
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/atomic.h>
 #include <linux/bug.h>
 #include <linux/device.h>
@@ -2403,6 +2404,53 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
 
 #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
 
+#ifdef CONFIG_ACPI
+static int i3c_acpi_get_i2c_resource(struct acpi_resource *ares, void *data)
+{
+	struct i2c_dev_boardinfo *boardinfo = data;
+	struct acpi_resource_i2c_serialbus *sb;
+
+	if (!i2c_acpi_get_i2c_resource(ares, &sb))
+		return 1;
+
+	boardinfo->base.addr = sb->slave_address;
+	if (sb->access_mode == ACPI_I2C_10BIT_MODE)
+		boardinfo->base.flags |= I2C_CLIENT_TEN;
+
+	boardinfo->lvr = sb->lvr;
+
+	return 0;
+}
+
+static int i3c_acpi_add_i2c_boardinfo(struct i2c_dev_boardinfo *boardinfo,
+				      struct fwnode_handle *fwnode)
+{
+	struct acpi_device *adev = to_acpi_device_node(fwnode);
+	LIST_HEAD(resources);
+	int ret;
+
+	boardinfo->base.fwnode = acpi_fwnode_handle(adev);
+
+	ret = acpi_dev_get_resources(adev, &resources,
+				     i3c_acpi_get_i2c_resource, boardinfo);
+	if (ret < 0)
+		return ret;
+
+	acpi_dev_free_resource_list(&resources);
+
+	if (!boardinfo->base.addr)
+		return -ENODEV;
+
+	return 0;
+}
+#else
+static inline int i3c_acpi_add_i2c_boardinfo(struct i2c_dev_boardinfo *boardinfo,
+					     struct fwnode_handle *fwnode)
+{
+	return -ENODEV;
+}
+#endif
+
 static int
 i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 			     struct fwnode_handle *fwnode, u32 *reg)
@@ -2419,6 +2467,13 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 		ret = of_i2c_get_board_info(dev, to_of_node(fwnode), &boardinfo->base);
 		if (ret)
 			return ret;
+
+		/* LVR is encoded in reg[2] for Device Tree. */
+		boardinfo->lvr = reg[2];
+	} else if (is_acpi_device_node(fwnode)) {
+		ret = i3c_acpi_add_i2c_boardinfo(boardinfo, fwnode);
+		if (ret)
+			return ret;
 	} else {
 		return -EINVAL;
 	}
@@ -2433,9 +2488,6 @@ i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 		return -EOPNOTSUPP;
 	}
 
-	/* LVR is encoded in reg[2]. */
-	boardinfo->lvr = reg[2];
-
 	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
 	fwnode_handle_get(fwnode);
 
@@ -2490,8 +2542,8 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 	return 0;
 }
 
-static int i3c_master_add_dev(struct i3c_master_controller *master,
-			      struct fwnode_handle *fwnode)
+static int i3c_master_add_of_dev(struct i3c_master_controller *master,
+				 struct fwnode_handle *fwnode)
 {
 	u32 reg[3];
 	int ret;
@@ -2515,6 +2567,67 @@ static int i3c_master_add_dev(struct i3c_master_controller *master,
 	return ret;
 }
 
+#ifdef CONFIG_ACPI
+static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
+				   struct fwnode_handle *fwnode)
+{
+	struct acpi_device *adev = to_acpi_device_node(fwnode);
+	acpi_bus_address adr;
+	u32 reg[3] = { 0 };
+
+	/*
+	 * If the ACPI table entry does not have _ADR method, it's an I2C device
+	 * If the ACPI table entry has _ADR method, it's an I3C device
+	 */
+	if (!acpi_has_method(adev->handle, "_ADR"))
+		return i3c_master_add_i2c_boardinfo(master, fwnode, reg);
+
+	adr = acpi_device_adr(adev);
+
+	/* For I3C devices, _ADR will have the 48 bit PID of the device  */
+	reg[1] = upper_32_bits(adr);
+	reg[2] = lower_32_bits(adr);
+
+	fwnode_property_read_u32(fwnode, "mipi-i3c-static-address", &reg[0]);
+
+	return i3c_master_add_i3c_boardinfo(master, fwnode, reg);
+}
+
+static u8 i3c_acpi_i2c_get_lvr(struct i2c_client *client)
+{
+	struct acpi_device *adev = to_acpi_device_node(client->dev.fwnode);
+	struct i2c_dev_boardinfo boardinfo = {};
+	LIST_HEAD(resources);
+	int ret;
+	u8 lvr;
+
+	lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
+
+	ret = acpi_dev_get_resources(adev, &resources,
+				     i3c_acpi_get_i2c_resource, &boardinfo);
+	if (ret < 0)
+		return lvr;
+
+	if (boardinfo.base.addr)
+		lvr = boardinfo.lvr;
+
+	acpi_dev_free_resource_list(&resources);
+
+	return lvr;
+}
+#else
+static inline int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
+					  struct fwnode_handle *fwnode)
+{
+	return -ENODEV;
+}
+
+static inline u8 i3c_acpi_i2c_get_lvr(struct i2c_client *client)
+{
+	return I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
+}
+#endif
+
 static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
 {
 	struct device *dev = &master->dev;
@@ -2526,7 +2639,13 @@ static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
 		return 0;
 
 	fwnode_for_each_available_child_node_scoped(fwnode, child) {
-		ret = i3c_master_add_dev(master, child);
+		if (is_of_node(child))
+			ret = i3c_master_add_of_dev(master, child);
+		else if (is_acpi_device_node(child))
+			ret = i3c_master_add_acpi_dev(master, child);
+		else
+			continue;
+
 		if (ret)
 			return ret;
 	}
@@ -2594,8 +2713,13 @@ static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
 	u8 lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
 	u32 reg[3];
 
-	if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg", reg, ARRAY_SIZE(reg)))
-		lvr = reg[2];
+	if (is_of_node(client->dev.fwnode)) {
+		if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg",
+						    reg, ARRAY_SIZE(reg)))
+			lvr = reg[2];
+	} else if (is_acpi_device_node(client->dev.fwnode)) {
+		lvr = i3c_acpi_i2c_get_lvr(client);
+	}
 
 	return lvr;
 }
-- 
2.50.1

