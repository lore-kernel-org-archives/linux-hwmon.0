Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010000.outbound.protection.outlook.com [52.101.201.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6F03BF689;
	Thu,  9 Apr 2026 11:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732493; cv=fail; b=RP4x4oSXQipQCjiIEGSCwt6nikM+42d7BPLh0qW5IWzQWe/KTnyOyj2ioPuY24KHlj84PUOgGe/ZqMITfMKmSNJJjfPl9WUUrN0678IO9+B+GrNRf3AwgKZ559ECjNYEDtd9Fbc8Erck6bQWxdfsY/pvQUEpVnvxo25skfUnaqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732493; c=relaxed/simple;
	bh=Tkdbxms4uYWLC7gV3hBgkfAjiuRPMHkumb4On0FFvjk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a6MLd6x5NByux3G9EGwQxOm/1V5MoFf3/mL/+FnLzlzHxkgUQeMtJv2XcGdtsGDyvcegOZKz1VCH1I83nrsJ8EuH5bxPKbnnMBxKvLlSj9qGgvddwKafDejXnQ0+TqzG13BIfN4vlUTnK5ykTW5OCJzY5uJSGrMBZmxH57y+hR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HVH9M+w0; arc=fail smtp.client-ip=52.101.201.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HVH9M+w0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKRVhSTQ5gvxCSGKoc4Pv0sShpaMkpMwhrngYU0Zt4RHv7wd31B1c8lqb4kJlZGU9TiDC1knvcchQxTxyDfz3ZC457LO7WH9sH0ZFlvWq4wjjv0WTuaH/kG08csYmfekaQ73MrjMLB0vQ92w+ZaERbbJAPDuzWVAH5XRwXSD00GXnMilTQ9cYaa9vhXuUynwkKGq8/qONGV4yDM9CWKeu6Y/pqD0J3ByBPpz3rxIHzE+mVR5ih8/SP6Kxl1pKBG198EsOM0zIdaprUWGHf7zDRr6OOi/jCAZRjjhQfc1uw7PePOJo/WaR6LMFTYUbQa4vptmKRWfjrVyrXnAzA86IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODcZcJPfoiP9gCT0JNeMCbMtE6Imxth0LkrQcabj8Jw=;
 b=UHzTAIM2ECny521+I+kiXf9Gg+iI6RgxonEJ6F/bqSED6P8RQSyrPrfRtxzctEkNUWc4N1lDCUTAHIY3SQh5KksVtDrvL3qhygICzM2jR/VTV2MUrjFcTDObjuLIN3suBRj0WUlVFD36wTMLjIivfIHfOl8VVLEsSLOII6hUL29bZjZ9YJTuyc035cx07VfToGk8INPEEezdjMnuAA+OwEhiQZl89AmtE9Zv1I5uW17iFD9AS39sHCpd4dPXeRppzIRIge2T3F80NZ/FYfXDxQkbH68enrkEYt5KiBpdzGaUlmnLv7j9rSZJI5U8VsEil/hcqN1QgN9YlnOl9sYMzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODcZcJPfoiP9gCT0JNeMCbMtE6Imxth0LkrQcabj8Jw=;
 b=HVH9M+w0nfkePzLuLi2xhvpGwY2nKPcdNjIVrIcRvNI1O0t9ywqgpTDq0JwPI62B7ibkavbNynSYOIH8aG5TSrggVxU1d25kcJN4VGkHy2r6q6BZIE6Ab7D50u1Dmfq4yc/oS1AGFwkSIYvqJwO8foyR3SxW7p3ZHvLBGWuiLKlLvSodGDZv43runX0vIJdHhb9cBAfISwcLQTbOPbONtXjd/PfTAKDsvFBZClhexZ9JBDcby1DB9MT7Va6FzQWnu5I2nto4nyGk2sZ1K1RFgdpVZOx3ToI6ekAQgYwdxkB7Y4cwgCQcnNnl6DetJWRQGGOsWE33WTFAuapnviG0mw==
Received: from BY3PR04CA0006.namprd04.prod.outlook.com (2603:10b6:a03:217::11)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 9 Apr
 2026 11:01:26 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::29) by BY3PR04CA0006.outlook.office365.com
 (2603:10b6:a03:217::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 11:01:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 11:01:25 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:01:05 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:01:04 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 04:00:59 -0700
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
Subject: [PATCH v2 13/13] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Thu, 9 Apr 2026 16:27:43 +0530
Message-ID: <20260409105747.48158-14-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|CH2PR12MB4247:EE_
X-MS-Office365-Filtering-Correlation-Id: f1037932-f72c-4b19-fa85-08de962757ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3/wF+8JIdlgRn6PTEj6YD5XQA9cP0dJWpL/mvYe8+765iM521mVtTjHXPFmE0t1xxDFy5YOKkq4uVzntVfjNv61wmYqgqfQLeInEnwpIrF2I0r+bdwaecR2zjuEc7yMjI8OpR0/CZ9VvulIGwDBzpbJD2d665sT+HocCrcJuJXMilayY6w1VsuBMIABEUHXLVgYuEARHcbDfkCuWqjGdrUeyMPwfQ31NzwQuvNtJNXJRUM3DtnRx83OtetCVHxihjLgrJewm5zf1JGF36E+GplEaZ3u0EF5Uo71n6cIjX4Fye5ZE74/NTXK1JFKOunICoj/umNcLJzM53GfVWD0GTGP3yCpEsVafG3nvhQrU8ua5Zfb/8oZJVKw+G+stEogDG4s8P+1TqGdXi4wf58pTKkJwWBgp8in+DIZDM7c4xE/e2TfiDhdegK+71yrPRwbBy2EWOnvzk8J8NwzgFRKDKQBNem7YNNXrQh+4WdZBqlbEEUoQXYh/zhA7I7TzquYclaXsi/JTGz4a+Xq0tiUIS5OcsKjSZkDwW08rYm/WbJQ9RTHKgVer0I+Ub2xQvwR2XUSYQKATZA1DPNIIzjKUqGt7whIuxwIPPTOmK+gY5dDanjbX1b0Fwsl42yBHH0BavW1+WK75jOW08NJqCQFR2w27klvctBVlbmE/tcjZu/P/3a3YJubhlzieLfr2I8oC9jfrpiHmh5kKtfHcYBQwdHkhNvBFc15Xd6SD/WwdxcBIO7aHy1q5G4XFylCAMjle4nrQ7zzTDajiWHPMkpBnhy3zzhPyKf5MNbXbugXg9xcOAUyMRV4m8U5iTHPTn5Jv
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/VNWYN+csR1Iyp+qzE5lDjbRhWUiW81s6vhuuwI/mQtt1jfm/dKklqhFgW/EkJWAs7bFpEdSeVUteBOtP+9SGJvgHVbAKU0luWkIttUz+gDRDWPq4a1EAZYuMagEnXFzKoq6xfXqmJFRwis1ixM632i7TK3gUA6pw9fE3p1K2M54djc6h8C8/38PTPb3bq2AShFr8FwMjtSUC5UNPlptYbp66OJ8EaXA089ZYKytrDtlRzCLhTuYGk/d/niXiyOzh73VJwLm2V8ek5WmlG4jWJcl5g8jP7HY7k/NDL0iJ1P6EDIMUBNi18RCYmnCkSkIO/e1IpAEelPsVMUowrqcMF7wkyvzCrRM0EVClOEmuTyvRS6o3oTv6O/zhIJuyGEZL90jZ17GYRZx1fEe8BKGwIsqYN68EVVf+Ke4UtASVOVlyvkJfFzczN/w6BqWfVgi
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:01:25.4949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1037932-f72c-4b19-fa85-08de962757ef
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247

Add I3C subsystem support, DesignWare I3C master controller, and
SPD5118 hwmon sensor as modules to the defconfig and therefore
enable the support for SPD5118 sensor on SOCAMM found in NVIDIA
Vera platforms.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 18881bd239f9..5dde063822cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -582,6 +582,8 @@ CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_XILINX=m
 CONFIG_I2C_RCAR=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
+CONFIG_I3C=m
+CONFIG_DW_I3C_MASTER=m
 CONFIG_SPI=y
 CONFIG_SPI_APPLE=m
 CONFIG_SPI_ARMADA_3700=y
@@ -761,6 +763,7 @@ CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_SENSORS_SPD5118=m
 CONFIG_SENSORS_TMP102=m
 CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
-- 
2.50.1

