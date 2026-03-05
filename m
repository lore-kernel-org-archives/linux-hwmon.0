Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazhn15013062.outbound.protection.outlook.com [52.102.133.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26543E5584;
	Thu,  5 Mar 2026 19:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.133.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740615; cv=fail; b=qAaa7czOpWMDal8hc3h1WZ2wX2iJrUHkWQtl8B4SlDjWk0R+tRaxYF0WxFAZ2lAgYbf3p1hUvm611OHlegecz4+4FhzytX+rI5YdL0fVW1Eer/exAc/hHB8Q4FEysWLO0TmD8x8/TKeYaxKCKX09zSc2YdDLhJ9uxAGTdBVsuxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740615; c=relaxed/simple;
	bh=9Kpx5jwiTpOEeTnjIbNVVOUNeKMdwgWhEDPcTwku5GI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LyaxcIx56/qt1/RDwvawdWSJG/o+oe6vGUZUPBp21oSglpfPbpvOzY6E/oPilsjcdDll/Hz03m2YZ6Puc5KjWShMJxUhyFwbOlhBisMwbCjZ5JdUG/naAZReSj0JOAx6IFz3g0zUOrqLbko2Yx92gOYw4d1RY93Q3UUatWSsr60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OacXmc8L; arc=fail smtp.client-ip=52.102.133.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OacXmc8L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xl1lMDI4YI5wQdrCJrpgoegROjQ6ydk1pUY+5619bf+lKZQP+HSW8NfVHOAqA3q9r2Stbl66S75dMuvh5ttTkd2vU8cwZlPaoVFhMM/6l9B1eas6DyF5+2F5owFMRtttWE5tuYGgGjeRq1U3wNnd2LQvZDUaaWMYUq9tVvcfeA8WU5DYoqfAPsKqYGyJaGb4W8toBV30ryeZ0pnEFqwVKpat0vdsH08xYwjoOs+hl/1iow6L7gJJZnjxqAD+KOPB0CaFPgxm+iFLLRWKu6W+4VCQbByRnspP69lk21KXrrropryc6gHZHDcjCFiT/JxpzvlRmVuoUB6c6j9+GwUDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrOHZEB/iubfPEIH4QtZ3+1sRAJp7wiu8/yrVHKTEk0=;
 b=xtj7Qpi8M6eUGwZ9dcwCOKRULAE93t0Ag0o5zlpsa7L7js1Z1wbUYjSUssL+SEvBj35vAGzYy8oav2WwX1OhTcimhOcYw7lqbB/hFgg5grEgDrWpDdbV/hQRIfmqfyc1XGxgC5xyP8KXVvOq42sSMRvnrlOwqK5gooSa0B/y8ZDHemiDysnYHe9idFZTDAzFfknBqRCNMm7iKJbm6/Dy3WrZl7pyd5EeDn6dpgmxQuKI00l/rHvVreDTrL5dpu8mOOqpI1f2ORYIi2jVwcDO2hZDzg1+wI2BgDyEmmfkMOd+9X3R0amE1XkcMkt3GV7n6onh65L/YaGWKVQUsXAzyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrOHZEB/iubfPEIH4QtZ3+1sRAJp7wiu8/yrVHKTEk0=;
 b=OacXmc8LxXf2/j52MMk7kZCnbFOzfn5BUR1jgq49ab3SqWhfee8dT1LRC7FTDUxkmhfREeW1+1AIrRUYZN+f+z/dPRtjxjoAKjGOzdK3uf2CGGzJyIQzamPltxylA4IDdWHBk2tr+aQRF/GThpxB29h5X3sA/YUG0WvZhx1TltM=
Received: from PH7PR02CA0018.namprd02.prod.outlook.com (2603:10b6:510:33d::19)
 by SJ0PR10MB5694.namprd10.prod.outlook.com (2603:10b6:a03:3ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 19:56:51 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::e9) by PH7PR02CA0018.outlook.office365.com
 (2603:10b6:510:33d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 19:56:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:56:50 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:48 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:48 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:56:48 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Juigo2456638;
	Thu, 5 Mar 2026 13:56:47 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 08/11] hwmon: (pmbus/tps53679) Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:56:39 -0600
Message-ID: <20260305195642.830695-9-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|SJ0PR10MB5694:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6dfe8d-9f25-44a4-24e1-08de7af1579f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|34020700016|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	bAERmYdc+sVFLLqhWynVTvvKo2Etm+2VyAuL/oOePyIAYt8Qto1F0b6GS13LYzRLynmLkV7Kdt0k4SrTVUAzF0pGFIzkPDrO6WtJJeMxAZWsFwBoMDDovqbjszSm4rtP8PH/hIiOZjvfODeiKGWp9oxHsfLdYbcIiBklcVvO2vmQ75Z67IEZyDsPBFcheJ/4+9rWc8vX+6AmE0zoY3KRxia2aCbFX3wWBsoqClikSisUWm1Ef+4sWjJF0v4ifkpQPUEYyTjmO9yuZ9JMAajubSFxtVLoTfGaIOex1Rf5/M71bTcCm5vHzR1O/0oH8uypb9MugVAACs+usB/Z0eMUKM9TXmavMB7F25+TNAICz1J8y/IAucT66rhY8sH+KUIx0kcooOJ+JH6F7MtuPZ6dHOWhOqTxDrZNnu1qKJOfv68sM/lhDcNZj7k6+tOMRapUVYcXcPo9KblLwN2d6tX21bl3j4J7qxEIXYIqUbMUjZ8UJLp4JyMVNWUvWdOHekfIwAZ2TPWAwXqxKfqdsjZ9EcjpDJgVcofbzj0pqSQdrbEAZtGkap6qpGWJNsgwiZX8A9cpll+GOuEVFiyHR6aV1er9VZ4A6YWl4825c8yDbW+a3X4ssOZ9uMLXxa6xXQIw3gHjc2P7gxyHtEzXeCJQ5+M073fc17pFU7e0fq4yfsYf8REUWif5ntrTZnZmHPXMCoCIfawUgFqIGbxv+mkSMV6g6kwiRNxxc1KEHOCutR3s4ogTgYpGkeGGKVB7Zc1roB1vX1krjITR4Uua5uK2aw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(34020700016)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IeCPNCKuIj7eTQr/No7JyDiXt4h/TkbQF1EFP7k5+QrAvRarI6kTA1oLCY0JQNs9dn/erfbk8dafv3/pjcV5DMCg1oi4fTc6TWr1OQuFpEgbtbc8gK/Wn2ySfRCB41HQ276w82N8iDf61tDbrt+PfKm1Au2RT0VGgwsvYsmVKpkq+B8nUuxQ9U85aw+LgdY5kx6qx7A97cczVP488UYcTvGcjK9diLvxDiZ9jY7IP50jzbBShBdN/XuKnDXXed36qDZIXPOEGpnuMHSjO4XCrc1IMrU7bEYqPxbtkz6EPSpnLxMMAPF3eHAzKNsWOBioAjyeycgo5oZZw1vx3UvXvbJgqFy4kGkE6f/h3FycF/WeC3hDDeAdtf7ClYp1Yh8w9wcsz9Lp+NWmlURYuiZP6RMIhkD8ipwfOyhfdJW2+gbIqGpxqrEKENx1VXkIltQP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:56:50.8158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6dfe8d-9f25-44a4-24e1-08de7af1579f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5694

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
 drivers/hwmon/pmbus/tps53679.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index ca2bfa25eb04c..df2726659a4ed 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -253,10 +253,7 @@ static int tps53679_probe(struct i2c_client *client)
 	struct pmbus_driver_info *info;
 	enum chips chip_id;
 
-	if (dev->of_node)
-		chip_id = (uintptr_t)of_device_get_match_data(dev);
-	else
-		chip_id = i2c_match_id(tps53679_id, client)->driver_data;
+	chip_id = (uintptr_t)i2c_get_match_data(client);
 
 	info = devm_kmemdup(dev, &tps53679_info, sizeof(*info), GFP_KERNEL);
 	if (!info)
-- 
2.39.2

