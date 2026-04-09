Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013062.outbound.protection.outlook.com [40.93.196.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECA139E191;
	Thu,  9 Apr 2026 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732460; cv=fail; b=j7NEJ+zOvch9Trf/TsEldeYgYYmmMbbLmArc6QkrRuxQvAVSMpaZgs0zi+vmcydGjL66vLAJcxT+0wuwYLan1w4tOrFc9UeHuaz5wNKvcQah9UY3d3j4/cjDbOaCqEP/k5QR6pzvww6XcijFA0AopAEjLiq7N9rQBRxj4POC6p8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732460; c=relaxed/simple;
	bh=A5tWNmBYit/6OEZePxKwA6uWgkkuW2aFHamuLZtKHfg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QoSKvKdywuXRDYnMWq1En/+MaAMN9+ZA+/LOJmvjSNdLgRGfSvk8kE1Q4uFF9yProzo15Wom0F0tV2MaU6DmFY/kfY4AeGqlDiKbSQYQgcT5ESOg7gireA+4XuXszrQxOREMpkdcBEQ7A8OkGlOo772D0zAlBhdC4GroNowGW4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=amdi+sHR; arc=fail smtp.client-ip=40.93.196.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="amdi+sHR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VseA7yQPTm/dnIz5gzsELgtcdAfSn1k31jpiUwWPtNwZTuko8OVJnTiGYNF0ypkQUd4WhOHNxUUoWikWUct48UupHd7gY2+fYaFmT3b8DAJcACeDy4J00+1DM75eg98Z6v7qbuDc8gHTTcv+pr0Fox8LymygEkoigdZMB3KclEjX5hI6A1763clifFTUbq3/omYVyf4CYIBBFjP2PsQZdkTJ0wEoRt/xMtPI/dwsKrOrKHMrhcjL57T38tZtdIRnFwZTssGcjRH+aujwlE99+YXkLyOcqrY64r+Y8VVc2bD8k/WflTutVZLc8fcssG8EqBhVl/bJg9nP+SAz32wDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlGR+2Rb4Lg+e1QCfyIp3xazsYA5yE4xZegMb2z851c=;
 b=XGTto+54kRDDAsBU76qsswjwmxZaRouJiaqcp1n9HFuQZQcCZJfZiX6U/5MJyRbEbaMRvjD56YQ7HVkQRwM0vqoOuEozPyfWK9Wav+UoMrB/w9EC2MFg3oGq6pBgil0bzui85DOqyRzfF4M44RSuFi5AG3Cozk0KhdL54eSGqGck2BuAlQwew5zSXb1bneqr2H4SyEta3Su8OPuj6HRlZrkDwFbRdgCeYFY651fcE5uQERrcw7PlQGCesjX6RCj6E778db4hNTADXtmn4XQa/Fsgoup1nwRQ7F3+baJ4kyya0bJQ5ngyo1qQOoIEzxdBfOMM5X/tdkWO+mgFWT4IIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlGR+2Rb4Lg+e1QCfyIp3xazsYA5yE4xZegMb2z851c=;
 b=amdi+sHR/j+qkU0wAoYxIrtuPTp/E18Tmk+GW6f6tZ25cW6FIwU1xD39BmlJK/FGQIKCv4pmfUKYj8JXw/hxauSzCNeC0/ibKlOVSxOQq5hjP+Gx92ywKUe5O0Wt9CztOYNw/x1//ojjrYhFuyMxVQ/0jSh8Gte8/OTPWJCqD2bNAITKBh3zlkhS/nsBHrRc8eqCwKuPctE00IQPzUDIMlSSRhXZD9DqcHSCr2rdPO76LcrCk+VGk4VsZviHlTHmUEqFIQdcNWKFD7w8EkSt9/hqFfPGoDq7bVdZDzFjvzj6n8pXSQgjRa8AovN36/nWF99gFUf1e1B8aCS1ezxgtw==
Received: from CH5P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::21)
 by PH7PR12MB6719.namprd12.prod.outlook.com (2603:10b6:510:1b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 11:00:53 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::ef) by CH5P223CA0016.outlook.office365.com
 (2603:10b6:610:1f3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 11:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 11:00:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:00:34 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:00:33 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 04:00:28 -0700
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
Subject: [PATCH v2 10/13] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Date: Thu, 9 Apr 2026 16:27:40 +0530
Message-ID: <20260409105747.48158-11-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|PH7PR12MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 801e4c5b-1cb7-41a9-93a7-08de962743d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|7416014|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/YOBRxI+BgpvjV+1b+IReb/kSu40kXvVQawx93bd1vJFJbkBK+NxZz6iVsMZ5vgCLjZbEHdx6u7Sk8rPOsXSITTAYngr6yUm7HMuOfqqtumD8JnUDOymkRSMTFj0FUSYn86G/nw9ESN3yU3ZxXMHczVjjmpLr6X2FTDI+ui+D4j2vcM6wKtwrw0ch7IUJIkpvqIhlFZX7HzWIBzmhN5zlncWyj1oBlfy1c3ywncfBvLSBdp5JtHpVGrd9IT+7fR+6gyAFsrGi7+zLYPkM3JuAeIyqhRZTt0qEP+8cOAZDQZNwn40dJBqcc7kd208vC0l8njwvX1AqpKgAYLVCF0whr80rnS4yxDbdW+5dJuSOjRmm/rHr/QtyKkCMad0lRNHBqjHraVpwxZ/CdYN6mTbUSynP7IQ8qBFMZZR53aQMcvKqNNNpCT34AHlGBPu8nNm7lfwePjK5dON1ZK2JoxNeSyf5q7VDwieHEkzMDaRl2HFJwAKTIdmUyEW36RAUkP5syaiO5mMK8pE4c8K/+hxjAzfiRRlwq+VohwQ1PfTECzkt+ZLTab7wNDCrx+Ulig03bQkRGd+oZUfiruEAPg1qJKzo+N3DsRW2LCNwew5/5KcuUPzrZNlx5S374ddVkwl/EkEBi/PqKTCQu36kUesEhAtu49975aA+voTr0HxF87VUaE6gWxiu8fvAlb6PJS30uq0mrsmfqdj8zd/dHQ9KQSiYNgn2/ckU/r4qUhGhw5NRdJIfJKqR6Bjt8gMuUyPBANham9jSUr1gJ5bzsxYJEMOULslH2J/XfpiqWYjz/1aZpNXEETjYov36YlxCtP2
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(7416014)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6K2kZB1AqDQ2TfbrOCqCEEeCSSp+wki404hOh3KiZu726QVsvbBz+BfYSPbQM3eSIWYQ74g9Jw6Jv2pq7E53nemwgYfKee4fGjtetdxHsirhw7A3B23EWT+pZa5FKLwjTqDc204J9WCag4GWnDV2YROd8ft17Q1Hyiv6dHvcq32GlB1dt9WSOeKqpTuyVYlghAroIYnGhIYhVNEqM2FIgrBovKKL92VMiDQnkydZ+/Ka2gb8do3O6B975Yzx9JGSfPYZA/1PHG783XS0dl13e1327BY9A38v70rZTNrQQuUGf3e/sKg9ISyXBlwEDaNyTioezBsJP1VmZsoCv7v68Ndu0MUwzXUbviU8Pyvf9a/6zY0EbqujbpVxyuHkcH8StJXx2u/LIvBBUfFFtH+IuM6OFg+ocTmNe/Xww+/3TEPCU/HvI6qZpTHI2FdZS3eZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:00:51.7782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 801e4c5b-1cb7-41a9-93a7-08de962743d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6719

Update variable names to generic names and add Tegra410 ACPI ID to
support the I3C controller in Tegra410 which is a DesignWare I3C host
controller.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index a62eec6d2ac0..e0ca30308cbb 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1869,11 +1869,12 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
 
-static const struct acpi_device_id amd_i3c_device_match[] = {
+static const struct acpi_device_id dw_i3c_master_acpi_match[] = {
 	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
+	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },
 	{ }
 };
-MODULE_DEVICE_TABLE(acpi, amd_i3c_device_match);
+MODULE_DEVICE_TABLE(acpi, dw_i3c_master_acpi_match);
 
 static struct platform_driver dw_i3c_driver = {
 	.probe = dw_i3c_probe,
@@ -1882,7 +1883,7 @@ static struct platform_driver dw_i3c_driver = {
 	.driver = {
 		.name = "dw-i3c-master",
 		.of_match_table = dw_i3c_master_of_match,
-		.acpi_match_table = amd_i3c_device_match,
+		.acpi_match_table = dw_i3c_master_acpi_match,
 		.pm = &dw_i3c_pm_ops,
 	},
 };
-- 
2.50.1

