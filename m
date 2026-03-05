Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazhn15012045.outbound.protection.outlook.com [52.102.140.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A383EB7E1;
	Thu,  5 Mar 2026 19:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.140.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740617; cv=fail; b=P5DamyOgDqVbyjeYKxUWhruAiczXcWCxYnQGlppPIVEYJY7tbWN7XOhdKBa3Llij/e6e3CRKYDb93SRoAaETDg5kT04wKeGkhQnSg7Fi2z6lrTlHlWo1EJyW9QkIG+dVhf7g0hTobnE4TYQ29ZaxSJSytwkv9DYT01aMs2IkCCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740617; c=relaxed/simple;
	bh=PUmsl1DZ6Mk9MxneHyqUJGeoIPAMi/xjJuo8NreJblQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W/zbFqWskWMPmMg9Ke49ge1wdXtYEwcMhxeiJjmYuX803yzUAiPP9PQE2BsT484ByWLcV/bNyqoSEX4YFDyqlLqEkIWbvnWcMeCRz4+Fb7u+MPz3wdfIMHy1rNVs+CXQEbEfTs66ZNQMG9nvttySK08kBKd+NKfLZZZjk9gfzlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Bv171CrJ; arc=fail smtp.client-ip=52.102.140.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Bv171CrJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1YH5WwWoFTZsjuVXdfR6+9OrubIBk5vBZ03xcvhK7qJgTjWwzFCP2PQNHB5ZUe4f4u6q+L5OyF7AtO9ciG+/Em0cDzynGQ49+mGohr5foXYcKqrFV72tIYJsQUDEccRJrIkIWEVWJtXCmYmE7h3dKWSlPXDGwrw4KaBKOcgLWQ6fk0kGbZKfjvQKfOePEKNs1HbKoztws2DrB3HeA7fz0P5pV7cYBoOR3zGnpacoIwgyAhzLmo3Ra+UTQeiiCQ1hw6glQACLfzVveT90BQlsuGQkXi3SEAGyz6szClSQtds6nDtglAp+plqSvazxQ5vyKdG/6rnxfYavUQOyytgfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/v6fizqNoHxS16kNPBlfNBjrsk+dGqmGYpghE6GBK5c=;
 b=dmJjsrzGAwZGxfag6mL5BBbG5/fnKW1/ycE2Y1b4LVg4VR423usg4rING3o9NjaseD1EWA4LnMGyXW+BoN9o7zwQ3CYQnTKc7ufzQ7Cg/InmlMX0gRSb6vCKOO4BW5ihS02VlZ10LmmdA/JEnk8ZJ9T2MvRNEFk4LocJBIkOI0MttCJnk0UN+m5w5twIEZ7RlLzbMwS4ud6S3emQ/tpz8jV/uH723aoCKo6i2Bsd9udXhYFUhojP54x9mU3WQh3yIi5vEDT2NYpTlADgXP0E9kZKdGjSd4wqSUaVp5PkkuLwzZJjmz8LXt3qh0SlbkAlQwLKIhCbUKysMyc9cAKUZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/v6fizqNoHxS16kNPBlfNBjrsk+dGqmGYpghE6GBK5c=;
 b=Bv171CrJQsKzRxdJUemRkNwUVRVg7fuRhdHzLQ6UUfqgoGemiM/9YlVoHiXPvFJhq5wm6i8lrKT0udgyj0NmjzzrC28MAPXko4AL/MYb9ClrvnGPW+gn0NL2gzsJ/zj9m/iZeVo69vP7rFVWb9faF2CgmOUl6de+A1QxQfiq2L8=
Received: from BY5PR04CA0013.namprd04.prod.outlook.com (2603:10b6:a03:1d0::23)
 by BY5PR10MB4226.namprd10.prod.outlook.com (2603:10b6:a03:210::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 19:56:51 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::e3) by BY5PR04CA0013.outlook.office365.com
 (2603:10b6:a03:1d0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 19:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:56:49 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:45 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:56:45 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Juigi2456638;
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
Subject: [PATCH 02/11] hwmon: (pmbus/ibm-cffps) Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:56:33 -0600
Message-ID: <20260305195642.830695-3-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|BY5PR10MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: b87e8aef-b04f-4bd7-d13e-08de7af15724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|34020700016|82310400026|36860700016|376014|7416014|12100799066;
X-Microsoft-Antispam-Message-Info:
	gjcNjVQkn4bI3k3oeVDuoAMTtJGRpJZPvZW8qgQyB+2N5oTNC6VmwPsu4DjXjKtbqTSOHFUigIoWohT8N2WRRW7tn1QGXCByCzG1384Zk4iaG3G++duGVDEV0Sh/p8WeFTpx3ZdBJH+KFhaX/2wzpFy0GeloeT1Pxr9qHYuI6R8Esy5e2E2WPP6yNMuYuissOihDPyUmJ2GQhz/YXjafG9dh1ufpXjfIZG76vj39BbBexSS3LBHqEHHehsnMaPZQPQ4goz40/TaomzLROEWa10Vbdw9PaTA0xB+rSPzQurq11iUdao3GCkt/1YUWIfWlQsoPaNF87JHz5Mh6lcizhqpTBA1Mg/rQskizLf1DwT2CWboBA0DHwiSvs6in3RvDjhG5WKIZuXyJwqRtNXS4BxJRwaaL0rlJ/yat2rLhxhCskID82t6nj8SSxZipLtHnmis9Ck5Pr9gnxTsWCV7i0AJKr8F3OBkxCYCTE3ENPTs6/g90OlIGMt1PV/4gSsPZ/0uS48bAyQwYCxVWn9gbkLZQVU0/Bu+2NWYwP4WWYOKnvb8O1V8coorILJK61QjAlw2NXhEEDvRlwKKIlvUkpkR/hZtIQo3dcxoSi+a3L5jDhYEIJDcIX+af51S6B9PDw2xNTCPKrpiIfb12lg63WX7QFUaQkKDhU/rOGD/3lYA0ERzAUjHc1Kd7UPALJHN1TG4D8d+XW/JI4iuHfJsnD0G5wSwVKWU6bJsJqyGZMHlvAiTUMfS4bCdDcraLUibCz4pz4fLoA09DQ8Ia4e7pVg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(82310400026)(36860700016)(376014)(7416014)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JtDGGV7rA6tRBqeqotlBfRCWBSvEjdKqcYfzoBRLiN/uCEEAD7Zl1MEC90PSzS0uq8pk+m+Aj4F6kne7UzwxjErMXh3FvbxmnS9ymG/MSdTdefh/ZwhrlgWdG+Tx+14FUyecCNXoPCHJifeUVAIrMIefkfbYpenwtpsHCT45oKsCYAXqsZlhyDR4rNXcJn9+vUQ7TtdLlUrtbbEKQWUmmoQLxmc3KT5PrWU69kad0AUBNtUhOVLjQh7lRhqdG176ula3b7sTpwMTfFJnys7Kl080SS5uFmy9R1hUXJzAd2ja16LsJ3rN/Z0u5Z4vFbff9JiX610DWTUNTE0Xl8ztKgUxYFw4i7jYU1naN0zRP/sWUvO7pasAwWtoVExRxLsiUpODsZSJj9VYtNTA2cS9oF3LoLsRRCQ2uIwH0rEW0TAGe24nFuKjM6w+J5+PVp/F
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:56:49.9545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b87e8aef-b04f-4bd7-d13e-08de7af15724
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4226

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
 drivers/hwmon/pmbus/ibm-cffps.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index d05ef7a968a96..884b17de3b623 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -482,19 +482,9 @@ MODULE_DEVICE_TABLE(i2c, ibm_cffps_id);
 static int ibm_cffps_probe(struct i2c_client *client)
 {
 	int i, rc;
-	enum versions vs = cffps_unknown;
+	enum versions vs = (uintptr_t)i2c_get_match_data(client);
 	struct dentry *debugfs;
 	struct ibm_cffps *psu;
-	const void *md = of_device_get_match_data(&client->dev);
-	const struct i2c_device_id *id;
-
-	if (md) {
-		vs = (uintptr_t)md;
-	} else {
-		id = i2c_match_id(ibm_cffps_id, client);
-		if (id)
-			vs = (enum versions)id->driver_data;
-	}
 
 	if (vs == cffps_unknown) {
 		u16 ccin_revision = 0;
-- 
2.39.2

