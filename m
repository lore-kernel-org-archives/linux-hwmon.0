Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD023BED31;
	Thu,  9 Apr 2026 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732453; cv=fail; b=SqVlpWHFtWsexM09M6T4ajDLPe4lfJ9Nd+N29LK19wRWLVRKEyneXMR/IK69sUYswkIdi3i7oE5xt+aAc8RSNze5BRAdfeaF6Bim18QkrUQ+ec4ihN1X455CLIk4zXpoRH/DRDH/Gtz7vxRIQbjtrOrXAj2Kmc2PwvbY8EpLEYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732453; c=relaxed/simple;
	bh=kP8da9UvPxNd84GmWKHdbLO2b4BlXcFc7xIELpLd4hc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XpxdRfSTa0rsw1xZflOCKb7VO5VfX2VhP52vjipTvCtZk79Vy1OpBJ2ru1xswZ9Y4/4gjN4jMT7eAjm07yCG12fdmrjlMiQbaJny9UdLiRUOhCHxlWHjgG/0gG5TgVT15Cu8oU+/6z4s3x62/LrOxSnFj7sxe4ZqAm8mTWejC48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dC8lp11t; arc=fail smtp.client-ip=52.101.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dC8lp11t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLIwtOFbkuOK/4c1GzM5uhZYe1MPpEUlOSjakES8XpNcxvICOVy+pFP7TsdfsoVrpbmixp0ex1OXsmamkNUzoXSYHuxsuNYS6ZvqO/3JcAexK0FUlOar8vUUBce3fa8yH3XU4pxWla6sLe98Ha0ThHnZpng/AzvzI49QGvqCe1lCHFfvnE0KKFXSaNb8aswy9ahOx8Ed4wal1ntS/NhnxWVRq7Rxg6JjY11xxeYiqTppZA5f5q4GE/PzrCQW+EoGl3ZZHmm5xTfatHcQIH41ulN1kuTg73Rj/c9s0g1ku1CgcN0MY0rlqNUBRYRLOAVOHzFLoS8aXoFa1evdCcLytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vi7g7HNTUTA9oq8bj+sI0R6oLRjUINfehkIP8hA9f7A=;
 b=p5vqjrA8JnuWE/vf0yyzUutDybfsJsZemEueopFnQK+PA7RpRBywnJ+ZWWkUI5yvbkOdVkMpgYoB6/EH8UZqEMl3zN5lgYzbtYjnmRkvOHer/qmW1VOvjdDNIGwatBsHF1j3HmVouUAesRJmBbXpn720vILiR9ehbG+yPXtUbyimLCkbjjmdUZzotqpq0H7MrtxKG49a1JOk4ovK8Jj4xG/FsJVTRoJ//rVdjQQIoRqQ6AZImRWDqL3zywhJklHefDAlPJO8VArOB0p/RTNSFw+DJewHNjSNuqEckjh6mV645KfDD13fQ6sycVacpj9lGM9gYl+fbjIZou+4dsECFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vi7g7HNTUTA9oq8bj+sI0R6oLRjUINfehkIP8hA9f7A=;
 b=dC8lp11top6Xjpk31nunQkwhuYFExUUqnSiznJLtuLFMgvq5jNOAUTJ1r5R0+CJrh1aFNsk30JU09UprMqH2/307/iiYXUF8n3TGASXMxHxkhjEzEFszEwH2+Kqn1IgRSt2unUcD3biH7ZzsnDb+nJqn4lmE+TD3EGlxyTyhhMdT3SbEcrcBfs0aBeNIBAW2OKbwFdaQ5sDv7fHXNigRxjvtVuK1YwK+ZC4GfokZyC033aVNPfKLt2HZVFdXVBhv+uPEwwiYLHYDoIejd/IV9BuU/Ng6v7xhLMSm4rcEontWGs1SsAkE0WNsV/PX+j7dVLjJK0/Cgal7ym2IHuNo1g==
Received: from CH2PR12CA0024.namprd12.prod.outlook.com (2603:10b6:610:57::34)
 by DS0PR12MB6414.namprd12.prod.outlook.com (2603:10b6:8:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 11:00:42 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::b5) by CH2PR12CA0024.outlook.office365.com
 (2603:10b6:610:57::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 11:00:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 11:00:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:00:21 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:00:20 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 04:00:15 -0700
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
Subject: [PATCH v2 09/13] i3c: dw-i3c-master: Add a quirk to skip clock and reset
Date: Thu, 9 Apr 2026 16:27:39 +0530
Message-ID: <20260409105747.48158-10-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|DS0PR12MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: 29964f6f-2ac8-4ab0-9c66-08de96273da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|7416014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZMnu7GbO8KBl0RMTo3dI3uIqjzfz1Dzs6g0kjMvVdbIyC0bFToOQkMxT24vc3NK/tufqupad4GGjgUafnrho/3eGii0JeDldkXFfj2snTqpciwyVFcxgrFDn1htudRnirvM/+Rz/aSZ0LpjO+rp7b/HtRi1GQW/rQdC2j3sIuwOTasRwiqcubvCuAYvXmAoCnUtzdVAmkd8TVlQaSnBUTSCBG7gAZwSqeBEGjDsULC1LiFSsCc5P+Nn97ua0CJCqpp1nJrZZvJF19A+lVZcxwpp9bYUEHMiVYaj3AyRblVwMJi7hYh6M2BTt51aJtpTDVRL8C3MfejH+NtHwLtAu+DxHRufzWvzwII4du88jF8S0SnVZtbi/cRl4R4uYfzc+naDJZbykOn6kIJ/S1yFpxYK3B3MP/6CErzO3bJg0G7uKAFJZS2/syzDk1Rtbu1EMQG54TUi5BxYfE3Z6nMJh+KJcz4eYbwe7BljjnT8uIl8wT2uvaI34syKA871GnmTgDKVXRNOs+J5rzE3HMyOd4ZTH0Tl5o/ztCi0dS4524vgG1tP7ZScKBp9IXdARPANojgvI92IFmVb2H0fIdXzShDlAS1FLV9CS1RAUMzQ2uS43mBXNZfV0rkH4+AXa51GMEl1aMnKoBuzTbpkRvCjwN38xnnlbQrgpl4+tM8kSQPOEDVGF4cZYWYgTImg22MSCenLRM2MsdCX6D5nKntpq7dv4g+gnNYBXzm6RCLDMkmGw5jlbjDqeULNYMg84liFSBp/XRduL9gT3UGeQN54qLzhI+FnKziZZw61VUKnFkoj2nivdZcqih111LmzXKebX
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(7416014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AHHWcXFylu4UclkAe0yLyJ4fusveB1rPqauVNpGl0Go8seoZiFYaTKkmWP4/OFzbMWvXB0xjbGrvOrA3XJLeKsZjix4nxzysy5lRfUguOMd7ooaDYCbvObGJK5981qiyr4aMgwYhq8Uk8ofdwxR1DZ2j3jidCu2xrzUQNTpJ26HBM/EMj0ZeXldn9WDfEZXUqo3ffIZqdnM8jxCZgGzHBt2Ia4cgO+DjollcQm0tle5lsxCLflBVWZegGmNshttAohC/ca9lN7p1bTEdnyw3BMaJmmO4M/1eFOq6pE+3kSW0sf4OSILVrDKp/PTwoc7QaBtCfb/5ZdSsu9yCFgdUf6xt7b/vfkZh09zGajIGXc6lHya9g6xxILdzWuulJwKz4R2Ob4Jb8INmW6hou+GR6rEbL8/PDFvKGTFBz3irGVp52kAS2be0R1XB57akone5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:00:41.3708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29964f6f-2ac8-4ab0-9c66-08de96273da4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6414

Some ACPI-enumerated devices like Tegra410 do not have clock and reset
resources exposed via the clk/reset frameworks. Add a match data for
such devices to skip acquiring clock and reset controls during probe.

Move match data parsing before clock/reset acquisition so the quirk is
available early enough.  When the quirk is set, fall back to reading
the clock rate from the "clock-frequency" device property instead.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 60 +++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 05ccdf177b6d..a62eec6d2ac0 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -241,6 +241,7 @@
 /* List of quirks */
 #define AMD_I3C_OD_PP_TIMING		BIT(1)
 #define DW_I3C_DISABLE_RUNTIME_PM_QUIRK	BIT(2)
+#define DW_I3C_ACPI_SKIP_CLK_RST		BIT(3)
 
 struct dw_i3c_cmd {
 	u32 cmd_lo;
@@ -560,13 +561,26 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
 }
 
+static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
+{
+	unsigned int core_rate_prop;
+
+	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST))
+		return clk_get_rate(master->core_clk);
+
+	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate_prop))
+		return 0;
+
+	return core_rate_prop;
+}
+
 static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 {
 	unsigned long core_rate, core_period;
 	u32 scl_timing;
 	u8 hcnt, lcnt;
 
-	core_rate = clk_get_rate(master->core_clk);
+	core_rate = dw_i3c_master_get_core_rate(master);
 	if (!core_rate)
 		return -EINVAL;
 
@@ -619,7 +633,7 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
 	u16 hcnt, lcnt;
 	u32 scl_timing;
 
-	core_rate = clk_get_rate(master->core_clk);
+	core_rate = dw_i3c_master_get_core_rate(master);
 	if (!core_rate)
 		return -EINVAL;
 
@@ -1600,21 +1614,34 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
 
-	master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(master->core_clk))
-		return PTR_ERR(master->core_clk);
+	if (has_acpi_companion(&pdev->dev)) {
+		quirks = (unsigned long)device_get_match_data(&pdev->dev);
+	} else if (pdev->dev.of_node) {
+		drvdata = device_get_match_data(&pdev->dev);
+		if (drvdata)
+			quirks = drvdata->flags;
+	}
+	master->quirks = quirks;
+
+	if (master->quirks & DW_I3C_ACPI_SKIP_CLK_RST) {
+		master->core_clk = NULL;
+		master->core_rst = NULL;
+	} else {
+		master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
+		if (IS_ERR(master->core_clk))
+			return PTR_ERR(master->core_clk);
+
+		master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
+									     "core_rst");
+		if (IS_ERR(master->core_rst))
+			return PTR_ERR(master->core_rst);
+		reset_control_deassert(master->core_rst);
+	}
 
 	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(master->pclk))
 		return PTR_ERR(master->pclk);
 
-	master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
-								    "core_rst");
-	if (IS_ERR(master->core_rst))
-		return PTR_ERR(master->core_rst);
-
-	reset_control_deassert(master->core_rst);
-
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
@@ -1647,15 +1674,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	master->maxdevs = ret >> 16;
 	master->free_pos = GENMASK(master->maxdevs - 1, 0);
 
-	if (has_acpi_companion(&pdev->dev)) {
-		quirks = (unsigned long)device_get_match_data(&pdev->dev);
-	} else if (pdev->dev.of_node) {
-		drvdata = device_get_match_data(&pdev->dev);
-		if (drvdata)
-			quirks = drvdata->flags;
-	}
-	master->quirks = quirks;
-
 	/* Keep controller enabled by preventing runtime suspend */
 	if (master->quirks & DW_I3C_DISABLE_RUNTIME_PM_QUIRK)
 		pm_runtime_get_noresume(&pdev->dev);
-- 
2.50.1

