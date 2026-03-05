Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazhn15013044.outbound.protection.outlook.com [52.102.146.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AC93ED5A3;
	Thu,  5 Mar 2026 19:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.146.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740618; cv=fail; b=iwHWhgW49vAvqevyU0KTz0ixAY83dGSHBJelGSLGO2dBIrLnLL/T2BXvTBeH7QjuvO2MliHQzhT6AeSU2JfuknNzN6uLAGkcVxbxmk4YHKlpzg/tnwPQv7gd66oIJRHHjSog10Bx6ViH6fESqQgmCHyEwdTrneNRvbVhHcddT/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740618; c=relaxed/simple;
	bh=gyNbxyWjoul3lyNP6Hs0HFLW2zRg3uSPVc7b8O9XxlA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=czqsNvG4w1PiMBckqXFjjdZ6JpYSh7lfQqOo9UZk48SZJl1RxIh6Td/6gvIK2rXQ8W0CkPR0QZr/sFUnqL3EmP1ZUCqRrqQKD/8JWRvTaEG+jwBya0xogloV94B9rk38h0m6F9SVFjk89u4+5mgJ+Ph9en/v4Me+fLWv9SQhaTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=U0JpuMf9; arc=fail smtp.client-ip=52.102.146.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="U0JpuMf9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iT20k5JkN9Y3VyHHpQQMWAH5QsVV52g23hZ6x9gWaxoc6Lrw7NXM2dDCz72x63Pf4i5PFEHAoqHpuz/Lnz5nZEH249ieurDgmR1F4qY9znMmDF9rOjee2zFJiRdCyGGUe0OISe74n9WEPVy0LiqryrFFQB2xfbcsvEg+DAoMfwdWO/XN+oGVkYvYl8JlevQQTXDwXKI2wtBuBhhpLMhgg/R01uVaOyQkB6MGwyRc3aZXGdgM3wAxJRdUkPV5OqaKxLbCNKm+HG572RlRVAszVb8L8rNbuDhpYOUwXt5brsnwpKFg15Xwk8qt9/9Y1417aprKAHIu2MX/Dq7hMgC4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlCSE/BUqAFJfStIb490DD44v8di2xJXM37itGgGS6Q=;
 b=YfvcSNLvtM5sPPvENNbLurwmY3pDkDB9DKJYyWKVPrVA+9h2texX3CDH9HHUFNaa63b1CRDA7v+nnnoipDdlh7iA5NHFOw0cyS0dKROCJGhElwToZH3jgyYElGzJ3umeubm1z6F503PmA+pgJmLovPuVW1CjS46+kISMI1OD008/iF2D8dAFM20cOrg81WJWSJ7yZKpOYqd0eGR8Uc8riJcre4Nl7RRird3LBs1MS5vzmxXedJTECP+huANC/jNqrNahN44JN8kDb808tUQtbpt0HmzUZ8el/W+EoIfW7Cb7cQfzC7UoowqEcwZ0DPkD4LLlVfUXXaw9eWgMKv9yQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlCSE/BUqAFJfStIb490DD44v8di2xJXM37itGgGS6Q=;
 b=U0JpuMf9RFlaXHECna/LvcKiagOIPLei1W3yAbXe6/8ItrtCqbwVduheBE69oSihU5BWdidbkqRXv6M2Dc3bdeAuhLTBgtXTgJU+atMWdOA2KMdHDzOu7YpUssZ+mLXT5R/SgAJ7k4vTa9k79It0gY6DajgfgmqNCWOZPhWOqhM=
Received: from PH7PR02CA0012.namprd02.prod.outlook.com (2603:10b6:510:33d::12)
 by LV0PR10MB997638.namprd10.prod.outlook.com (2603:10b6:408:346::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 19:56:54 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::a7) by PH7PR02CA0012.outlook.office365.com
 (2603:10b6:510:33d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 19:56:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:56:53 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:49 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:48 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:56:48 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Juigq2456638;
	Thu, 5 Mar 2026 13:56:48 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 10/11] hwmon: (pmbus/ltc2978) Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:56:41 -0600
Message-ID: <20260305195642.830695-11-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|LV0PR10MB997638:EE_
X-MS-Office365-Filtering-Correlation-Id: 03075605-354f-409c-8330-08de7af15952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700016|82310400026|7416014|376014|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	b6dmLS/Q/RbiBTh1HvLMDMt0oIxguhpetBOZthII14rfZ1piWir+uA5mwtp6oR2fpkZdB8hug1xyFim2quc+CBxjPtJqLQsOEAD4sbkq1AN6yK6kgrDS0IdHe6OzvpowqSNogj7bnB3EeKXuWcEhIgUPuABE630yDjBtF4S91a7eNLJIR032tetLela+DWCH+ZDLZPJnzQthePbqUuXNLJnMJmsDm8Wiz2QFYEFdnwyRQE1xHQwQeC+G8SSjt8gfaOIngsfsIF5C9kSKPi9BlmkhDChQXXCX2R1KOdGxm+mD+ysT7/6V64cunKJ8uooDfkVveoSYzQ0qvG4k0whpsKyaald0oQwzxuC6mOLaBqC5vP9riH0AL9vWjpvHOgl00zzJkQeGwZB27sEr0Mnfbx8dcOConffZC65XcIWvrOnvyWBcoNBHY6+NcE9UwUgA4U0S714i6Q6qSH9Iv3xEf9cG2hnO6Kf3uJVKb2+p+QKjQwWzwYpv93tzjUItZdwPWhethfJUVLMKrwP7oy2fgvPQmeyG/oQYRm3dnD88+gRbbFIRwxfGOt22iRXLOv73/hMjyMSRkHfG5zziCR05nd+eIeQYx9WG/tPQYsuGBceXfxxRyLA6DRhXiFGVHxKhpT3e/3jnrcqzaHXJ8ZlNiKqoD8hn0r1qg6kntrR4rjAkhvuMDrEg3PqNVKPx09YxkogGIvwHEoPHFosUyZxvjIV+7HVxVY6i8CVYzWWMMGA/LANcoRPVtIKddqpORDWhh4wmBoafGmvXCFgiCnkr8Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700016)(82310400026)(7416014)(376014)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KpGgKqg8TZ4lGvz32ZewPLIXcIU2mj2VG/fCM8E9dFSFRsAeb4MsnThAXoSjgLk2uKG9UJdt/x03EPhSYZGp1dfN46jbEP3Hm/1jyT8Zlf+rGOsQqhUhVVGqvLrPx8HTPIXxURGWKzBRvUVp/aXGH5jA65ftiFhoUlyDeFVGMUNgfwqseENZLSIAlJMf9+TCHs1alhx+3we0l+UpugX5WYzdAAZnT0KTOi2uKi1e9aDUkdv2Ya2a7ctLHd3rzKrP5dKYMFG5I+Sc1bwscSmQ05Hefsy7vTDzcHbNkVkISSukxhpbJlywMWA5uATmNyx5jt+YUTqOVwK1XyqzEgD9H6f0hPmHX7DzUoR+ktaN52Rh8wJSqShz4gwWORV97Z5MFhHQv7n5J3DExxGO1+DGAO/E2OPbNPKBuSl5flrDT/OHg7Bfvsx6Yf56V51Yzf5R
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:56:53.6636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03075605-354f-409c-8330-08de7af15952
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997638

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
 drivers/hwmon/pmbus/ltc2978.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 8f5be520a15db..d69a5e675e80e 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -733,7 +733,7 @@ static int ltc2978_probe(struct i2c_client *client)
 		return chip_id;
 
 	data->id = chip_id;
-	id = i2c_match_id(ltc2978_id, client);
+	id = i2c_client_get_device_id(client);
 	if (data->id != id->driver_data)
 		dev_warn(&client->dev,
 			 "Device mismatch: Configured %s (%d), detected %d\n",
-- 
2.39.2

