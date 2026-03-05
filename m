Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazhn15010017.outbound.protection.outlook.com [52.102.133.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAB72FFFB8;
	Thu,  5 Mar 2026 19:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.133.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740613; cv=fail; b=XmanTBn7FD8wFk+TCz21XK8v2yBtYsXGnymPNF5kU1QqY8dKM/QOmBZ5mhbG4LYjGeykL6QJR0LX1dqu1tlkZRKrU8s2dhqV1ydocED/UrcAzoOBTXX80zLIPSQIiEgi9+QJEr94h66KcDsNqrhAYs9Af2Mkx9qiD2P5ViB/xgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740613; c=relaxed/simple;
	bh=lqVn1WASKZwFKQt5uiMMtLH6bFm2XYPedw3VRERnsTk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=feMjpeJdmSyRRiihiuWYl7BUqbYLfv4QSGmlLJG5hmRdRCqKhfC0b1Iy2zzEyvjf7ZnkvNYRRepbksCj9KVqNGPjsZP8C4vILI7PM8t+JAeb0tDg7VN/wS5E0PGabIA+DAvvhKgmO26r8+epfW9tGkmP5fneWS1j+ljETMyzTkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nicrJJWC; arc=fail smtp.client-ip=52.102.133.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nicrJJWC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNWzYWmMFfgqgUfK8x80ByB6GeeQkz7fNnDbH10/YsSkXEgt42+4A2dCTua1G0usayBivGNyd/k1lXMWAyTKKa66C+mesDrypPYikyTiBHa+816yQBYhLsOtERl+SBAty72Xkw25FQemp8w3Rd+S9yQLPIrELBU0YluZJCylO/ZEC3wTIyKOEdlAJHFnh1tPdx7NjZDpxzeSPcwX4mXvqfvqWMbc8bfaZdCyLLvPl8iGR7+fTaKmclN42rVM/w1rRcWmgsa0hWNcCIWCUk0Nco50bw/nrV+XHYHOxmyv4kacYs/wKuIfPahzvTm6XhreETvETilikXr/1rGyqJ2caA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsI2Q7uxG1SJZ2uXHXrzJMkZfJkPbd3DdNSp2IKg9Lw=;
 b=XD88X1vSg5mQLa9nluI/HYgdrHmk05OkcXCNZxzWxSTqSyjMrz/8GQ0JPUPCvU028bnfDiJJiCDbgfnrEJ8h22EqCHWQWF3P77sXaXGiNKF74U1/x477lLVNLbDo9DBkmjtukbWE3OVNqtvnPsAeWq7cXpa3k3Z/ueCAJhcVVap4GnNxFrVtvcZ4c2wy+W2rsNlX9oN/e/shSlEvBZyBqxyGbXXuFgi+tCJiHtQXWhrGmgjMy4t7wB7b81pPpuPPdxteBcPjLA99Cyq8XPw2kZFda7LZHFV1nJo86pnqylK3g3twwa2Og1H4MTFS6cDlWmmzj8npr2LjomepSCV5wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsI2Q7uxG1SJZ2uXHXrzJMkZfJkPbd3DdNSp2IKg9Lw=;
 b=nicrJJWC6ZB/yIOuCqD7EeaYetvX5w3CZYWow4LljaGttAbqiaOzeB5gjcnahnDgaS9ocCj1MwbD9ydk5EP9sWb+6MrrQiAewMVQZgyL/TI9U0/ytMXneQL6aWom96bDE9vnvw4wrFE/TxsUmVrByqOlz2HoGQqczzQQBfEuUGQ=
Received: from SA1P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::15)
 by BLAPR10MB4963.namprd10.prod.outlook.com (2603:10b6:208:326::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 19:56:49 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:22c:cafe::b1) by SA1P222CA0023.outlook.office365.com
 (2603:10b6:806:22c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 19:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:56:49 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:46 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:56:46 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Juigk2456638;
	Thu, 5 Mar 2026 13:56:45 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 04/11] hwmon: (pmbus/max20730) Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:56:35 -0600
Message-ID: <20260305195642.830695-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260305195642.830695-1-afd@ti.com>
References: <20260305195642.830695-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|BLAPR10MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b583305-8afa-4dae-909c-08de7af156c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|34020700016|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	bB7LpK3eFOressDHIEUyY76WMD+TzCwE9/11ovAQw450pi6YGbypQhy72P5TdgyuPp85h59cMaa/32g2v1st9q0cVcT6wmy50RWP2yMYzKYgcvx+9zEtizGDGHBjk4mkzDA2LqOd8lrerQ6+Md9vSQZNSKJKORlar+AB5mJ6Uj37nZCSp6eSvNylFcWYniNjOuktAY1bdY55HhnMkK40ReF8epLe7lr5ThO0UwWXTuF6ESj+kQHVnEWSMcA4USdOntpfoTmeGYC9utk+8ukp8h41SJ9ALztkmzVoCc/D4NnBnKNflev5zFOnx1O9fMAw6/nKgRPqcXqC4WtWyNqdZIrqXftkrzaiqcZNzo06OjygSNsUtAGE9s06e0EKnWtMMw/gn9Lkc0d+oG+l71NlkVgEjwJRprXV22RuLg7DyRYleIiKDvMs6rhljyvEwBVZ/n6saQpXecYaip8GRWgR6uzO9VgSTj+q6aVXezt6UgyctvDOFA68nHTD1Pywf7q9YvSEJGSt4+bkG2ILRNxqzVLPVZHwM9J6YEfA75pYS7M5cmzrr4IdqJuMHMsKwZr26QYux16QWThXYDzLjU0VVbL9/axP739p8wkI+yUur6vzBmV5uQEdUOpX6ZwcMUhMP55o2kBCUyD5oUoxL++JAUGx/QXTSSn5tTBOwp9EawpHxcFdvs0ryMnxoYGUOZTKxafXBxgzoBkRH3mGX/4ZQ11QhKen5r/UfbSnMlVCgMKLCSF33w1Cpq5O3c4VtKblglCixxAvPSFYToz3nFgNMg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(34020700016)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SjyuzaHF6vFZutdf9/9SBa656tSidTOmoPUVyZwW5aMaEVRsretDM6nr4a6BdpB6TUSyO2fNwqAoGvuqw+rrqkoATJSX464ExEua/pX0PaMckTaklWXGHMmqBs92TOEale6k52kPTHNSmz6ekv7dD2NFokd4UnKQfRLpAkm5yDLIk2lxQNTeWCK7e5v/jCRKurN4/CINIQafxjK/2b3BxmtPHwGVF6Gpr1qqf/nHj7x1UeTBr+wQLs9ZebaK6Ag5q6ywGdbnj95UlELRBbNf76h2tL1utCq7WYmiKv058YucQb9/2At1AKw16wT+mS5DStMO763w+GWEBte+ihLpQwBr9mn76t0gKtfbUwrpP88TwxxSBBwEGB0APiWtlMMpLndjKjThB3xTzXvGrr7O3kg2dXGLx4IbZQ2jypm9MMbTykRTWKeQOAA/8DTHASpc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:56:49.4008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b583305-8afa-4dae-909c-08de7af156c7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4963

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has a couple other benefits:
 * It doesn't need the i2c_device_id passed in so we do not need
   to have that forward declared, allowing us to remove those or
   move the i2c_device_id table down to its more natural spot
   with the other module info.
 * It also checks for device match data, which allows for OF and
   ACPI based probing. That means we do not have to manually check
   those first and can remove those checks.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/pmbus/max20730.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index 95869d198ecf0..fe03164788dfa 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -715,10 +715,7 @@ static int max20730_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	if (client->dev.of_node)
-		chip_id = (uintptr_t)of_device_get_match_data(dev);
-	else
-		chip_id = i2c_match_id(max20730_id, client)->driver_data;
+	chip_id = (uintptr_t)i2c_get_match_data(client);
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
-- 
2.39.2

