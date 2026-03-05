Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazhn15012044.outbound.protection.outlook.com [52.102.140.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659CD3EB7EF;
	Thu,  5 Mar 2026 19:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.140.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740613; cv=fail; b=GogB5K7GnAnti4v3M+m4Ui6FVI21HhwqS+bQxoZZxHIJODJGpwIfYacydKCGFWLk6i1OuUhFkEFS2fTJxbqAiG5UqnIpZ5IqOsDg4n96TTTbPPAgon2VkwASF6/pWkRhRaB/cuLP7XoPt5PR1SAB8hUmP4ia9Faeclq3k07v+Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740613; c=relaxed/simple;
	bh=Bb68I+TLognAj2G0ibMban8TSA/YLQ+PsGOtT/o2QNE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qw6rOGsIZqplq7YfX3i16lu4dIhNcMxNc/HAo2TA+1Jv4bwh6ryEiyazs2C2Tl041U+YMDZUGrzmP7XEiX4IW2cjeDYkQ0DlrFETc2eIHxZd71G7MHT7f8zmRJPOABw4m19kfTB6EaAku4bJwe1QdTEFiSJGn1zebCa9aaCUybE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=folyarMr; arc=fail smtp.client-ip=52.102.140.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="folyarMr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRTAlQyeIKaxwp3M7sU4dXVl7gCmAGx7ekGtdI/FcvUxuUkx+7af722fvGOglmg/1LHn+5ylJgrT+AgdXT1/BgduWy81zvkzSusU0YGNQH8p62FF4Mr7xVpOD7FLRkSrzt6ZD657rOAH8/BoP949QrKqTy6H3rS8J4b6K0SEizmO0S8R32Rdth27bsAzeRZrQQ7lsE3S50y8y/lRkIMKEXHvNOIowYrG9bGxcjTMe/yzY5qwL0qfBq4MoitTCUqplROfR/2DGTBiAVkW9/Ljg+d+HZZ7vo2oWQoz/eR0G7W0J3BAf17elL7TbwMlItGm08y0eN0fGrWW/RJcIk+8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoYSQhBXUwMBNi2aatoKazvcmk87iCH5SkbVk3A2L8o=;
 b=HKpKOatUOj5rlx8QuQ8/oCG1i4bTM/JXUqL4lNeyG36m/SCa5GGD3t3UtUjWFXqChzLncaDJBoT+Sg8Y7P3uFwQk//Ju8VsbDbWFWoCgXV2ip+JfB/rgF20wjx7TRwV7agmSDXIala+c+n7DuBXl2ump/oTC2z/oDYGNIXZ45PQmbhacbha5NXrw4KhmKYvDlrBGdD5lyweidG9KtjznBBvyMkDxCLmFYa5azK2ksFjJqsX3lyyZpp4izCeB7bIIGYvzh+aqCbCp6QREajJCLeq6HxVF7kOsL2YE6FdgjP6uzhFZrgFTP27d5XW6AghEJ5AssNE9X3UHphuesCG5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoYSQhBXUwMBNi2aatoKazvcmk87iCH5SkbVk3A2L8o=;
 b=folyarMrPoBQ8BiHp/+b44Jf4g5NY8j8wRlmhkkF+8zAaB6gPBe197abMfnAX3voqe8a51krL7Vs5yY7l/m0sa6ek0U9FgMRzEuZVHsjYzQRniO5+phBS8UBh2wa4R2hCmhb6QJCDZlMhVd7sMgVgYdVWKjVtLQ9r01Sc8cc9/E=
Received: from SA1P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::19)
 by IA3PR10MB8760.namprd10.prod.outlook.com (2603:10b6:208:581::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 19:56:50 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:22c:cafe::f0) by SA1P222CA0022.outlook.office365.com
 (2603:10b6:806:22c::19) with Microsoft SMTP Server (version=TLS1_3,
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
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:47 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:47 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:56:47 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Juigm2456638;
	Thu, 5 Mar 2026 13:56:46 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 06/11] hwmon: (pmbus) Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:56:37 -0600
Message-ID: <20260305195642.830695-7-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|IA3PR10MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 233edaa1-9bb6-4277-c44b-08de7af15700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|1800799024|376014|82310400026|34020700016|12100799066;
X-Microsoft-Antispam-Message-Info:
	6wGsQgf9PUhRCIxmu2ZIVHAcZnmY/j15H1sYP6p/8oDTrHDuEjqdslCinpTOBx+TV+4qVqJfmbIYEBYdlJLrn+KsJUuMy6R12oXyyzHlQ3k6LVgejaIOMIkqSufBPzYAEQY6ee0zhvopy2zac8xXkzsJvtVJORSYeYkYlPocfYy5rctjSR8NS9OLuS+HrWOtyw/R/AP8BLfP6GeA+vu7YYUM0Qv97wF9/OdsEPAV0m/UmmFP3jcBvMoQ2IWCXVYkg0AW/xIgpGlLAe7XgJsl2HYU7137hPLGJS2DbJan8562PjET22SsNlCl8wIqrRbLexUD9uulh8gHq8B6ZUV8yDYV+dZ/8/0Hr0rsEQOH8jUfOXATlgisDKDOrKruZGa1EPOA4zVolkACeaTe/ClmYjIgiBFZWS8elmP0oifzbhozfo+qJp77U6kNJvOOidisnZNz+qzEuvywsb1jnWPsWQc0s2sDzUPan5mkylcwFjTsPjHrHWr1N9TgHChgp7owIytJ+lKFf/u9Wyxk30MBk5fnn0NF/UFuJ1ZCFok6aynvPhDf231jlqM8/eli7W3Kb82uefkuRlTRoUTqer8S1rl4cJ8gGY10+fQ8V8PTra2TUQZk9SUEwiEeSzL/6tBRU1igJDwUN157lwMATOed3SAdsKPdv33bkfrfRRho9n/wtUabOg6T+T0qoyj4RrqDQ02TvsQBSa941llk6//I1xwSdoeG0pRahgLI0xtIepatQxLRlqWQGxZGprZ5cpvf
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(1800799024)(376014)(82310400026)(34020700016)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rKvBD7wkTxJC9swwO7mPFgMgqI1ciR8Y5pv4+/20C/nZ7OQb3eftduHLEUANhIT2fdMPBDdTOVLQnN82beMlYIzV2I2lGrZML7no2WlOAI1QDdGow+VZ5tlRqIMOU1bpTeV4fhODZB7kY8umoT9BKSrVZso6EabUTa6r4wCA8NO0NBXgk6Ypv/qLLpeCR96uVdj6L0bUxWW7j/bgXAUmbQihWycY1dNV8QzNd2i/dt3aL26EqYUdkIPy8wyZFnf38I7nk41c+aoeN82C2ybe4Wf+UA9boXwsk7Q7Mce8tnbusJl+9jSCXOKAJ9TaIRKEn6T74OqFsyFvEKGtS/e8D51hcO7cj+NGkXQf0cFneFgcAeLkIpZuUEPwNcHoZabaZgm8lH3PlZBfJbJvFPJIiIwydti8ppaR+55T2eNYsycDKH9mm7Q36WxZ5C62pZIB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:56:49.7848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 233edaa1-9bb6-4277-c44b-08de7af15700
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8760

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
 drivers/hwmon/pmbus/pmbus.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 920cd5408141a..d1844c7a51eef 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -20,8 +20,6 @@ struct pmbus_device_info {
 	u32 flags;
 };
 
-static const struct i2c_device_id pmbus_id[];
-
 /*
  * Find sensor groups and status registers on each page.
  */
@@ -174,7 +172,7 @@ static int pmbus_probe(struct i2c_client *client)
 	if (!info)
 		return -ENOMEM;
 
-	device_info = (struct pmbus_device_info *)i2c_match_id(pmbus_id, client)->driver_data;
+	device_info = (struct pmbus_device_info *)i2c_get_match_data(client);
 	if (device_info->flags) {
 		pdata = devm_kzalloc(dev, sizeof(struct pmbus_platform_data),
 				     GFP_KERNEL);
-- 
2.39.2

