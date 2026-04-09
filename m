Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013025.outbound.protection.outlook.com [40.107.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FF83939DD;
	Thu,  9 Apr 2026 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732399; cv=fail; b=kgBuWKMQm7ortvLO6+h9yIXjjgmpkgQsmAQ30bi7sm9OnKYC5RJp0aw3HkGMfzziv6NAx7JOOf/YAw60hegNeoBDfhbUc+kY6a64VcGX31HKTS1w3wXlWqbhJ+ft4PpYaunxiBAGgj886PUULbuvvfnOmimC0u8Kw9MEE9bCUeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732399; c=relaxed/simple;
	bh=syFwOCZQMIhxTyPdDR0cJbXhNxSHDoeYbtbEJdA1DVk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s3ZXbhQl5b5xNsr3MpMWByMGm51LDm0hXJFhC4ycDK2VnyrrGvM6uVmi9SgOwhmuv6F5KdHrGqEV8bA6km0pNpy/pbwhhPdX6ZO6lcyL98EzNVh5cGWY63W59iBPkkCpG+dm9uLZp1ig0DnXxVIOfcuphggLhlGWLijcXJid1EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g6EerPyP; arc=fail smtp.client-ip=40.107.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g6EerPyP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7DSUNuHfgLggU80+9qAJ0sar1CKJQstAjtnPjoFwS6RmAwPND5Kn3rQmFUcRjKw+6rr2DRF64ooIqUSRj2BjDgkpu1ZviZ6GW0/R9trc3j6N+qPqJM8YcaHijgTWgkVbBBG1zeygNEdBGD5u86mUhlPp+8c6YD3ucfVwBdIEgpURvOPC4RQDSC98diNmbQCi9bUWYENhSuQarDba6d+Lz37Ujc8c+1fzJhPCwowALfq/cPgJSzmyJkCYncqNs0JrGGvWOewTRLes3ibPVX1VXJgH56DzT9xS/v5h2PVWUlNyKomRFuOjv/XQtntkLY+YJstc2bSGjGjS/OVD2kz1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yNA911S/uUp9aBof1Ku3DyFNWEVl6DZqJZYzjleOVo=;
 b=vdIRqwVkMc1a09pozCPsibUqgkauwg5IhQl/nttAEwnryB6byTCw3MSuzD5Ig2xbAEx9+UBFgkNd8X5ErIh69vS+muI6nmCGY2exjkWVue0jcmBLsaRWWeTJd0keNpogDQuvQe1ALiQxDe3ktYgF0axCu1Gu9BVD7m8Twx7zfaeSIH0H1Beucxc1CnJUFRRHeBPng9WTJVOg7/XiBUAIgVaWqm4ISbhAmwz4z3PNskUM3GAPSGO+MIkkcb76gAISTySVnKbd9rZPMwTbG/0H53HA6f3ATjnR2iNGX3GA8xqQWtFbW+pLuq3BqpNVWHxxtx3DZUCDtPAAXrMHTFlclA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yNA911S/uUp9aBof1Ku3DyFNWEVl6DZqJZYzjleOVo=;
 b=g6EerPyPCkPEDu3+nhHaMxzvzjqtMiPPnYgnzKtvpsquKxmZ73uzh9a6N0++vdN/zRwAFXVPg+AXEuFWcISwkeuvwBfmgh+RyTV8z4i/o1oN4F0RQ3G2qp9Y+EMpOC4zkE138Lx37s5YNn5uxGS+nz54Oqzc5Gd1APqtfQf0L6RxuSiMxQqmfL+8grsAzNbdxX1t3WNK5VgJzJHPjSxRYXh7wR9J7BuORtM1wgzMekRCfDwPU5qDYsR/V7kXl0nQ8zLdD+rF272Wqq74Fct8gXFvCFNLDXynqAbFA3jmUTZCZM+TKYJH4VuOax94pTC3I/JErcnIKeMYMQjh5TI2UQ==
Received: from CH0PR03CA0222.namprd03.prod.outlook.com (2603:10b6:610:e7::17)
 by DS7PR12MB6190.namprd12.prod.outlook.com (2603:10b6:8:99::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 10:59:50 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::84) by CH0PR03CA0222.outlook.office365.com
 (2603:10b6:610:e7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 10:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 10:59:49 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:59:37 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:59:36 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 03:59:31 -0700
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
Subject: [PATCH v2 06/13] i3c: master: Add support for devices without PID
Date: Thu, 9 Apr 2026 16:27:36 +0530
Message-ID: <20260409105747.48158-7-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DS7PR12MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8821ed-abb3-4781-fc51-08de96271eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yGtshohxozm/SSNF1EN0g5jBW28qjB64yjzmifswbnec4HpHwt1MrLHXQevGc3ITWjbr7hkduTrjmC4oL1fflrZzWEa7pqrmBYmax0aGbpp6qr8Dk2baQtviSMhA02oVYeNtytWnv7b2eb91MkBh4VEOuPTfySyDJwdjtbInyvdCZKsIadIK4E1Al1Z8yjWy6zytH6bR5dBPPdfvm5Y+gbPneEg4KRL4OfPGPizC+VzGul15NyU8XiOfDCWvJbkP3EN/GaNXloVQIlylX9uM8nbpio8ss9ba6kQV5E1HEr45L8Gn0oFHe0vBaR7JgWvPS4DX6z6tgCleM7cLgAU5wTZ0KtdFbSJnJNHFLxeY1YEPwRNz61sti27UCCHqv8GfW1judBWjJ1Tnx/GsJJzeEW3Sj09ZU0DZsIH0e7JQqBfdc9qHfqUf1TVn3h4WmrQ7HfLM546rhsh8Rk/6K6XPJ0UkMWHdUC6iLkQ3obYJUo2yJAQKhjwR15ik3WgDCE0pnmhuGgfXycf5wfqFJOHKuFSE9RNKgPiUBf6l5DAvm4nDTFZNGS/KSU2mud4GS98fqCHQ1wzUbdMMvMNgFUdzy3I3tpWYiHGhdq2sri9Dxk7nICJe9Cnb+xmvyO24wo9GBvucOiGKrFXsVNPdXFLf/wCnKbDtaW7j9JwG3ExU0nS2O9HkXug9/+i/EhCie8uM8/pGDFG2xlLsw7oo9JlXUzASHzmTZTMlYCWix9KcK5RJiG6kSFsw7Be4VlmhZjzoBIKV5HoRgPwmmBKStMTb7L4VcY0J4fB9silF1bBmWk91WAlPkF2F+cPuNKP+oSoN
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y4uZsu2OoL2V9jU6xn/CDfFYIqtzDRavLarxf/ynhGV8YKxAPSmO9OErla42RxQGsDrnjjB7y2Dxj+6N182zB+EC0LsWNdajt5kRKrpgMLVcnuq8NwvFJv8Y44YbssIAQA4mHIaIZ/TDNedjtkDbYW+k8Jn4UDQ0WILRJ22wGNXAJF4WHB+3HpJ8OkeOHX6f3Rd/IfJkgM+qkyf5SoMt0hbJ8ARWzzt5gc3TSner7qJxV8izS2sUA4sKc4nT8HIF42rTqPFkpk66ikUTQ/aUX2a2fgNwsdXC0NCdBfIRJuzPTmTfbKkSfoKSysSjxWbZwbPd0BCuSW8gE+Z8u6EZrdSLAtlvbglj0enU2+clGBxFvujmPdxmSgJFX0XTUk/UE3mjhTkQSa6w5LIy1zRlwOGeMHMJO7DtHePbxTumrHSu/kkpLgUSKRuNOl9pw2/K
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:59:49.4811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8821ed-abb3-4781-fc51-08de96271eb7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6190

Devices using SETAASA for address assignment are not required to have
a 48-bit PID according to the I3C specification. Allow such devices to
register and use the static address where PID was required.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 51 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index a0f7a0d35f3f..324a0440724e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1835,8 +1835,17 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 		desc->dev->dev.type = &i3c_device_type;
 		desc->dev->dev.bus = &i3c_bus_type;
 		desc->dev->dev.release = i3c_device_release;
-		dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id,
-			     desc->info.pid);
+
+		/*
+		 * For devices without PID (e.g., SETAASA devices), use
+		 * static address for naming instead.
+		 */
+		if (desc->info.pid)
+			dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id,
+				     desc->info.pid);
+		else
+			dev_set_name(&desc->dev->dev, "%d-%02x", master->bus.id,
+				     desc->info.static_addr);
 
 		if (desc->boardinfo)
 			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
@@ -2285,8 +2294,18 @@ static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
 	struct i3c_dev_boardinfo *i3cboardinfo;
 
 	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
-		if (i3cdev->info.pid != i3cboardinfo->pid)
-			continue;
+		/*
+		 * For devices without PID (e.g., SETAASA devices), match by
+		 * static address. For devices with PID, match by PID.
+		 */
+		if (i3cboardinfo->pid) {
+			if (i3cdev->info.pid != i3cboardinfo->pid)
+				continue;
+		} else {
+			if (!i3cboardinfo->static_addr ||
+			    i3cdev->info.static_addr != i3cboardinfo->static_addr)
+				continue;
+		}
 
 		i3cdev->boardinfo = i3cboardinfo;
 		i3cdev->info.static_addr = i3cboardinfo->static_addr;
@@ -2300,8 +2319,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 	struct i3c_master_controller *master = i3c_dev_get_master(refdev);
 	struct i3c_dev_desc *i3cdev;
 
+	if (!refdev->info.pid)
+		return NULL;
+
 	i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
-		if (i3cdev != refdev && i3cdev->info.pid == refdev->info.pid)
+		if (i3cdev != refdev && i3cdev->info.pid &&
+		    i3cdev->info.pid == refdev->info.pid)
 			return i3cdev;
 	}
 
@@ -2601,9 +2624,15 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
 	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
 
-	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
-	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
-		return -EINVAL;
+	/* For SETAASA devices, validate the static address instead of PID */
+	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		if (!boardinfo->static_addr)
+			return -EINVAL;
+	} else {
+		if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
+		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
+			return -EINVAL;
+	}
 
 	boardinfo->init_dyn_addr = init_dyn_addr;
 	boardinfo->fwnode = fwnode_handle_get(fwnode);
@@ -2626,10 +2655,10 @@ static int i3c_master_add_of_dev(struct i3c_master_controller *master,
 		return ret;
 
 	/*
-	 * The manufacturer ID can't be 0. If reg[1] == 0 that means we're
-	 * dealing with an I2C device.
+	 * I3C device should have either the manufacturer ID specified or the
+	 * address discovery method specified. Else treat it as an I2C device.
 	 */
-	if (!reg[1])
+	if (!reg[1] && !fwnode_property_present(fwnode, "mipi-i3c-static-method"))
 		ret = i3c_master_add_i2c_boardinfo(master, fwnode, reg);
 	else
 		ret = i3c_master_add_i3c_boardinfo(master, fwnode, reg);
-- 
2.50.1

