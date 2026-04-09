Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011009.outbound.protection.outlook.com [52.101.57.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6FA3BED19;
	Thu,  9 Apr 2026 10:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732355; cv=fail; b=iQGQHLZoCENojDR8Gc4AbKQ+PhzSpnNFjXrEouS3/Q6BfUyOIZsgOArpPtgz04gFpVaKFLbqnZGWVTKE+W5GJsTV0BcBdG3AI4BCoT87D72YCB+d1sX5waGsONYVC5cZufmIe8dSaYOCCk3nCYyW89trRtOeoBlKd23sLVKjL80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732355; c=relaxed/simple;
	bh=Kw+XUZ4ltKlXfhiuGr4paaJla12DBA+EMkWQRWMAllI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c41+i80y0Uvm+Utzt/gYY37KmJ5PQHDxRah11Cc3yPQHpAWlMSqLz23GrVfEOxHpKYpuGv8R/gEb3tCK82oeSZXC1n5xTYbz9cwXaDGIpzQgVTsF1b95adVJf6LtPDLGuVoHvjeayPHhRu9jcyMhfhq3duANa+Xc/a2/MwiYAO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mRnsDDSG; arc=fail smtp.client-ip=52.101.57.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mRnsDDSG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkwDe/0tVIW+pI1fb44yunZW7yK0UuDPt7GW19GNJOl9HM3+HcQqg7MnZDZT1ppio2qWL+IbgmdsApRsHMyaL1HtiKg3+51EDMHShu0p0OCC6NuZIB8XG4DuHak82obcWG5KKpC/Fwwh6tJkjB/Q9hBu+sj76jt1oMxSGZZgMNPY4IhZSuwwsVOL7kGTiEu8A4Oh7y8GycOs2owx3UnclxRieUksP9fWjNdFZCC0F64GXvjY9xqiQck6aq/1HbG+dkrjreuP01tkqV8qeiz9NYaTFhqLhlEtqNQ+Y6oeDTqIj4Mr2zgPLHBPfpwtv/p8R4kNEswAhr+DFbDqKyFEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2Qc6d6FE0raGZO3ZBqPW+7ET5hconphrVAlqM5SvdE=;
 b=SWxe2aaQgh0CVxUavA3kKiXXnPk2jUYEC8dGOXW7LaHSsrL/S/kIUG7qqrkUQ3AvswBFR9U/u3zeULUv9pvbRvMPv0q5hd0WhXEp6ZEuG0k4ilo4359OWGtCr0BYGx13tky2zm+rwJJDppsr0z0wMeEYCaWwvfu40ZqT0CsfDrEjXOKcQjIRvt+V6GCWLEIo0V+lN0uOPTjkzmMARw7grFWUc+61hU80QwIszyamROBfZ5EdtH7MqGFOuluqFEt1HLBG3U5lk/jEag+UDG/drerndOrph7HguxJQ1e/igR2BvJfW3p8c94y7npRQZOy8Tzxkz2eicmEfouL90oj+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2Qc6d6FE0raGZO3ZBqPW+7ET5hconphrVAlqM5SvdE=;
 b=mRnsDDSGw/q4N+EUX6vbzBttwof5uTw5JkuHPCh1ALA+2H3sUAjgxFkT+5/FHWjbb5Vr0TRZJBFIOfbML6evKSsVaiJXEob+2e2ND3etvs2zXILeNR1iTdXbaU5Iq9PwCQPfbj9iuYlgn+WFS5P3+nNRrBDUaxq8bB8IVXP1NTJq9YYklsBUXeaN1FeurKYu3ep33J9ksIxoKfsGaIfcxJk550xYAe/UdkON62FtmZmlowFPdyT+qUB2ND0ElXJndvRgwoE3crlN/OB9xmC2RMFQPlX/ja8JaBLrj/1B52VwNvXABvAjTfR7Cqdto4NACebGNTz7bHBsg4hv9RFmgQ==
Received: from CH5PR05CA0009.namprd05.prod.outlook.com (2603:10b6:610:1f0::15)
 by DSWPR12MB999154.namprd12.prod.outlook.com (2603:10b6:8:36e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 10:59:07 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::dc) by CH5PR05CA0009.outlook.office365.com
 (2603:10b6:610:1f0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 10:59:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 10:59:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:58:50 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 03:58:49 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 03:58:44 -0700
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
Subject: [PATCH v2 03/13] i3c: master: Use unified device property interface
Date: Thu, 9 Apr 2026 16:27:33 +0530
Message-ID: <20260409105747.48158-4-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DSWPR12MB999154:EE_
X-MS-Office365-Filtering-Correlation-Id: d5acf681-d647-4004-0125-08de962704fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|22082099003|18002099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	LBnVNI2BUfGlTaW+tAjslt488GKPyc868bgXZoJWSPoPaU+AirNWRQEvRzrvEmJAzPwD2k4rkT+Sv11ZhXHSpmhrM6QuJDIG1th/iRjXfzU5owVkQmvr8yAExh2bmNHMWQ6MEN/G8dpdDhyWyURnKZtBe0i5R+vdGGY6NkIisbyOgVVf4suKndXSxo8IcN8q8v/4GVRSkBoCNUbd9QelktIFNFau0puAmWSDIcuzUvdkU8yWF3qyUxgyAWob7/enUrgesV1ksj2LLXG5N47yOr/RLFFhPMQc8zYCvTv7KkDUTHDV6WECGywDS0dJRFXEEHRnICTggbmpjMNuDwiEDy8B4TkvK0AuH8/kwyhH+l5h1ELtvfGa+6EWLE3Rh9X2/np9AlBKAKeyhJwXVoo4IbW126cousjadjJ0tutw/aIjSsrPGIdYKvyMM3NPwXmsRLGAtfudEOg6tZgTi7M9vMjLB+ayx1sFh9APpHOlOk3zcRz7JeTbbnjr3V+l6vDmn5ndru2Oi3DQETA7zJMTwOG/6BopZyDGfxUFPDigiFkFOucI6qcxzTlsQ4m10I+/ZNunSUltxDDqi7EaIZZG5UiALkAcFYMH9d171mmyK/FyaB8uTwhZCJduxG50iHfdupYRbCdOinj/waWQ71yESuyAsiGL37yfIDRNe9evGGzJ2Mh1bX8L0PszjuxvYT03N22lJPcjIuriLeo98YaQyrJti2CbrRKBoDATKMRWIuQYiWjBVYrSELYvdPI9JtdPLOWXVTVUnZb5LHTPwA5kcOofJ+fm3mv4Or1CeeD2bsGyCZ93ebE/46IuyZMb7gfK
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(22082099003)(18002099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TXqWz0lECa7TeCHdG4VzerExKcUn6WfJfzAJtZ1hsQSmWPCGY0NguQoSkE6wNi71qhOB7dkm8aLWY7SsbvRm1D3EmkX0jinzvDMfjHusoL+a36clZUBhR9MaQpsk9FkdGfNTvTnLHsQTxsM7TK+HJ1CCFz6h7zZnkFlPHTOBC75uVGNpGIXtTtg5b3wR0Zn8XNtC8nxz2ebonD1qLe3mDqjUp/eNw3GqquiunFkGZRABga1RBJGxc1g3nE2xsZH7Hp+n+DeqkkVoXnNKPRBns9gt7dfIbaS4GWY5OUimpc08KxW/ee+C3Tgw57whBibctlnG7NPtMvBFTL/VcAf0ASsrbGcKJ00HuprtaS7YfgwUYKl+eJJVK/SEAVbftDZxmPdMzg2BktDgybfttAQoXDHFo4HzZxNAVXS3Q81YFBIJcUfzgY1H/9FFfWHULzsZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:59:06.2931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5acf681-d647-4004-0125-08de962704fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999154

Replace all OF-specific functions with unified device property functions
as a prerequisite to support both ACPI and device tree.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master.c       | 77 +++++++++++++++++++++-----------------
 include/linux/i3c/master.h |  5 ++-
 2 files changed, 46 insertions(+), 36 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index c32847bc4d0d..5e0e926f61f3 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -11,10 +11,12 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
@@ -497,7 +499,7 @@ static void i3c_bus_cleanup(struct i3c_bus *i3cbus)
 	mutex_unlock(&i3c_core_lock);
 }
 
-static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
+static int i3c_bus_init(struct i3c_bus *i3cbus, struct fwnode_handle *fwnode)
 {
 	int ret, start, end, id = -1;
 
@@ -507,8 +509,8 @@ static int i3c_bus_init(struct i3c_bus *i3cbus, struct device_node *np)
 	i3c_bus_init_addrslots(i3cbus);
 	i3cbus->mode = I3C_BUS_MODE_PURE;
 
-	if (np)
-		id = of_alias_get_id(np, "i3c");
+	if (fwnode && is_of_node(fwnode))
+		id = of_alias_get_id(to_of_node(fwnode), "i3c");
 
 	mutex_lock(&i3c_core_lock);
 	if (id >= 0) {
@@ -811,7 +813,7 @@ static void i3c_masterdev_release(struct device *dev)
 	WARN_ON(!list_empty(&bus->devs.i2c) || !list_empty(&bus->devs.i3c));
 	i3c_bus_cleanup(bus);
 
-	of_node_put(dev->of_node);
+	fwnode_handle_put(dev->fwnode);
 }
 
 static const struct device_type i3c_masterdev_type = {
@@ -995,7 +997,7 @@ static void i3c_device_release(struct device *dev)
 
 	WARN_ON(i3cdev->desc);
 
-	of_node_put(i3cdev->dev.of_node);
+	fwnode_handle_put(dev->fwnode);
 	kfree(i3cdev);
 }
 
@@ -1783,7 +1785,7 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 			     desc->info.pid);
 
 		if (desc->boardinfo)
-			desc->dev->dev.of_node = desc->boardinfo->of_node;
+			device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
 
 		ret = device_register(&desc->dev->dev);
 		if (ret) {
@@ -2402,8 +2404,8 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
 #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
 
 static int
-of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
-				struct device_node *node, u32 *reg)
+i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
+			     struct fwnode_handle *fwnode, u32 *reg)
 {
 	struct i2c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
@@ -2413,9 +2415,13 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	if (!boardinfo)
 		return -ENOMEM;
 
-	ret = of_i2c_get_board_info(dev, node, &boardinfo->base);
-	if (ret)
-		return ret;
+	if (is_of_node(fwnode)) {
+		ret = of_i2c_get_board_info(dev, to_of_node(fwnode), &boardinfo->base);
+		if (ret)
+			return ret;
+	} else {
+		return -EINVAL;
+	}
 
 	/*
 	 * The I3C Specification does not clearly say I2C devices with 10-bit
@@ -2431,14 +2437,14 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	boardinfo->lvr = reg[2];
 
 	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
-	of_node_get(node);
+	fwnode_handle_get(fwnode);
 
 	return 0;
 }
 
 static int
-of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
-				struct device_node *node, u32 *reg)
+i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
+			     struct fwnode_handle *fwnode, u32 *reg)
 {
 	struct i3c_dev_boardinfo *boardinfo;
 	struct device *dev = &master->dev;
@@ -2461,7 +2467,7 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 
 	boardinfo->static_addr = reg[0];
 
-	if (!of_property_read_u32(node, "assigned-address", &init_dyn_addr)) {
+	if (!fwnode_property_read_u32(fwnode, "assigned-address", &init_dyn_addr)) {
 		if (init_dyn_addr > I3C_MAX_ADDR)
 			return -EINVAL;
 
@@ -2478,14 +2484,14 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
 		return -EINVAL;
 
 	boardinfo->init_dyn_addr = init_dyn_addr;
-	boardinfo->of_node = of_node_get(node);
+	boardinfo->fwnode = fwnode_handle_get(fwnode);
 	list_add_tail(&boardinfo->node, &master->boardinfo.i3c);
 
 	return 0;
 }
 
-static int of_i3c_master_add_dev(struct i3c_master_controller *master,
-				 struct device_node *node)
+static int i3c_master_add_dev(struct i3c_master_controller *master,
+			      struct fwnode_handle *fwnode)
 {
 	u32 reg[3];
 	int ret;
@@ -2493,7 +2499,7 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
 	if (!master)
 		return -EINVAL;
 
-	ret = of_property_read_u32_array(node, "reg", reg, ARRAY_SIZE(reg));
+	ret = fwnode_property_read_u32_array(fwnode, "reg", reg, ARRAY_SIZE(reg));
 	if (ret)
 		return ret;
 
@@ -2502,25 +2508,25 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
 	 * dealing with an I2C device.
 	 */
 	if (!reg[1])
-		ret = of_i3c_master_add_i2c_boardinfo(master, node, reg);
+		ret = i3c_master_add_i2c_boardinfo(master, fwnode, reg);
 	else
-		ret = of_i3c_master_add_i3c_boardinfo(master, node, reg);
+		ret = i3c_master_add_i3c_boardinfo(master, fwnode, reg);
 
 	return ret;
 }
 
-static int of_populate_i3c_bus(struct i3c_master_controller *master)
+static int fwnode_populate_i3c_bus(struct i3c_master_controller *master)
 {
 	struct device *dev = &master->dev;
-	struct device_node *i3cbus_np = dev->of_node;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	int ret;
 	u32 val;
 
-	if (!i3cbus_np)
+	if (!fwnode)
 		return 0;
 
-	for_each_available_child_of_node_scoped(i3cbus_np, node) {
-		ret = of_i3c_master_add_dev(master, node);
+	fwnode_for_each_available_child_node_scoped(fwnode, child) {
+		ret = i3c_master_add_dev(master, child);
 		if (ret)
 			return ret;
 	}
@@ -2530,10 +2536,10 @@ static int of_populate_i3c_bus(struct i3c_master_controller *master)
 	 * on the bus are not supporting typical rates, or if the bus topology
 	 * prevents it from using max possible rate.
 	 */
-	if (!of_property_read_u32(i3cbus_np, "i2c-scl-hz", &val))
+	if (!device_property_read_u32(dev, "i2c-scl-hz", &val))
 		master->bus.scl_rate.i2c = val;
 
-	if (!of_property_read_u32(i3cbus_np, "i3c-scl-hz", &val))
+	if (!device_property_read_u32(dev, "i3c-scl-hz", &val))
 		master->bus.scl_rate.i3c = val;
 
 	return 0;
@@ -2588,7 +2594,7 @@ static u8 i3c_master_i2c_get_lvr(struct i2c_client *client)
 	u8 lvr = I3C_LVR_I2C_INDEX(2) | I3C_LVR_I2C_FM_MODE;
 	u32 reg[3];
 
-	if (!of_property_read_u32_array(client->dev.of_node, "reg", reg, ARRAY_SIZE(reg)))
+	if (!fwnode_property_read_u32_array(client->dev.fwnode, "reg", reg, ARRAY_SIZE(reg)))
 		lvr = reg[2];
 
 	return lvr;
@@ -2707,7 +2713,8 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
 	struct i2c_dev_desc *i2cdev;
 	struct i2c_dev_boardinfo *i2cboardinfo;
-	int ret, id;
+	struct fwnode_handle *fwnode = dev_fwnode(&master->dev);
+	int ret, id = -1;
 
 	adap->dev.parent = master->dev.parent;
 	adap->owner = master->dev.parent->driver->owner;
@@ -2716,7 +2723,9 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	adap->timeout = HZ;
 	adap->retries = 3;
 
-	id = of_alias_get_id(master->dev.of_node, "i2c");
+	if (fwnode && is_of_node(fwnode))
+		id = of_alias_get_id(to_of_node(fwnode), "i2c");
+
 	if (id >= 0) {
 		adap->nr = id;
 		ret = i2c_add_numbered_adapter(adap);
@@ -3017,7 +3026,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 		return ret;
 
 	master->dev.parent = parent;
-	master->dev.of_node = of_node_get(parent->of_node);
+	device_set_node(&master->dev, fwnode_handle_get(dev_fwnode(parent)));
 	master->dev.bus = &i3c_bus_type;
 	master->dev.type = &i3c_masterdev_type;
 	master->dev.release = i3c_masterdev_release;
@@ -3036,13 +3045,13 @@ int i3c_master_register(struct i3c_master_controller *master,
 	master->dev.coherent_dma_mask = parent->coherent_dma_mask;
 	master->dev.dma_parms = parent->dma_parms;
 
-	ret = i3c_bus_init(i3cbus, master->dev.of_node);
+	ret = i3c_bus_init(i3cbus, dev_fwnode(&master->dev));
 	if (ret)
 		goto err_put_dev;
 
 	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
 
-	ret = of_populate_i3c_bus(master);
+	ret = fwnode_populate_i3c_bus(master);
 	if (ret)
 		goto err_put_dev;
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 592b646f6134..6b03a3ce574c 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -177,7 +177,8 @@ struct i3c_device_ibi_info {
  * @pid: I3C Provisioned ID exposed by the device. This is a unique identifier
  *	 that may be used to attach boardinfo to i3c_dev_desc when the device
  *	 does not have a static address
- * @of_node: optional DT node in case the device has been described in the DT
+ * @fwnode: Firmware node (DT or ACPI) in case the device has been
+ *	    described in firmware
  *
  * This structure is used to attach board-level information to an I3C device.
  * Not all I3C devices connected on the bus will have a boardinfo. It's only
@@ -189,7 +190,7 @@ struct i3c_dev_boardinfo {
 	u8 init_dyn_addr;
 	u8 static_addr;
 	u64 pid;
-	struct device_node *of_node;
+	struct fwnode_handle *fwnode;
 };
 
 /**
-- 
2.50.1

