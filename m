Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazhn15010018.outbound.protection.outlook.com [52.102.146.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02962BE65B;
	Fri,  6 Mar 2026 17:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.146.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817453; cv=fail; b=aOm33Tjy1A//K8Cszr0faDMOcL+LGBq70FWTq0aXxWe0CPBE3OanIl5UIRJbm0H4jYlmeKJPCgWgT0EzFTkxhMp8XhHvsQfV8aprfDXac622RzN+YvcTmCAqg5y9hLuQsq9bJ425TEBiBgPrYRpztngUQ2LO2DBDAD+25Qx4NZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817453; c=relaxed/simple;
	bh=jGSSH/p5x5v56VjLA41HqIneQsicVWGUjwkoQHBBYRA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GS6S3KE/D/7FwIpKEnV7/mQXAg2AdVIDIOgnaW9L76foJTTLleIr0Jg4aeXM8m1dit8qPs0AGn+Co79DtjisVPYmoRpJQ+Xu68rqYOL5KypAsoeiZLx3iJiALH6O0SvDMUtxR1/T97sklX98sjP8XXdW7ZIN9RxipHqjduUmXA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TRn30hQ2; arc=fail smtp.client-ip=52.102.146.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TRn30hQ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCqpeO+zlqFArmdadvOoFrtNDOnvJH8axNb36bp/inggY9LJMNUD8bOtU0lPYqQRMW2tH4zxoxQtCLVW9GKkb6nulI7iK7Mi9NBZh0+hne9QCHV4pbalwp67UBoLrV927B+2dfAl8Xgo4Xlxb2au/W9rE+7k45tPR6YljFriPOp/O82XzBwD2zRn2nKYXh7UmNpEP7lsPkaVRWNGLUqN6vUzVTHtgebf1HluY+rLdJ5jh6cZUhwONSapA6B6Fh4ZZlE1VqRcwBlSV0xUXhzprFFXqHDcOABPNkwehV0yTCCROwUo6lS2LsC9uxNdDWdeA5Zy/j0ocCOOFJrjU6tHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EW8gbZ8A09zB60cuht5fYFU+Yxakqu0WWO1VDbfISDM=;
 b=T3EhWN7X5gsR6yIAxpZFKdQv8nceSisYECWEBoywKicoXeERQ7K3m+KAI7mQXzq02gopN0RCi+Fphab7aqwNQ9oXsWizuW/kSSjlriDaEPhDXL8zW3Oz5n3q0h38gDfMPYKC1Z0uQPy7oYHP42FSWyTs5Dlp2H3PvP2U+nXnCUbmLf9b4fXKxs/0hhDrihIeuy0hG19cq6Tif4vedSfm3hC7vdufKoFdlIwTpDQ4GW3pmmHRXagcrA2aF57bJRv5qRCVjkXBt0qShmSn9UCD3fnNMULPyG1DiHKJXVMlM1Zf0mWCMDHV0Eqe17J8hgE5qVhwMJVzSb1h1YssTQwolA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EW8gbZ8A09zB60cuht5fYFU+Yxakqu0WWO1VDbfISDM=;
 b=TRn30hQ2xJUH5MpZezR6VFUP0SALzDp1hiPFbK0PfcIEB/uaNLjGb0ye/6uXQOPle1kr7i0WMmWQfff5y4UJjfka5OGvpS1HIcXjliBcdD3mWEfB3A15NK9UJkkJbTJZGkResaUTIZRwF6oKIiZJaws5j6trCvCqDvAdzFJV+BA=
Received: from PH1PEPF000132FB.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::2c)
 by PH7PR10MB5772.namprd10.prod.outlook.com (2603:10b6:510:130::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 17:17:29 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2a01:111:f403:f90e::3) by PH1PEPF000132FB.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 17:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 17:17:28 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:55 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:16:55 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HGs3e491523;
	Fri, 6 Mar 2026 11:16:54 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH v2 01/11] hwmon: (pmbus/bel-pfe) Remove use of i2c_match_id()
Date: Fri, 6 Mar 2026 11:16:42 -0600
Message-ID: <20260306171652.951274-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260306171652.951274-1-afd@ti.com>
References: <20260306171652.951274-1-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|PH7PR10MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c5ed75-9728-45e5-bf80-08de7ba43e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|34020700016|36860700016|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	LY0LkIbbOpSc0LXvPUtbHtkGSI1S/EkiD80sKOJbUEXknyB3P7hqdXi5PGZ44Gc/ekBlGQYpYWTq2sCi/6le3KOklAhs/xZaswe55wA9eQfH9OMyf/hEVRiLKnjPFO6EdXlppSetu1+qO8EBl2O++PAVlzgmCYohPfr7eDD7Vva103NmB/ozho8/PGeC3zZdhWJMql56DsAI+31+lS4zGqBByHAc2yhoTluQ2UwZlxsEPLBlawgR//V9966z8phLxOJmrhrEletyJj7ucq5INIJxrSmHWhWH5bYXU1/BNCHnftOCmeiyxzfkoY1tBhoNuDB2/6tSPzlIgRUk7JrvbeN4zkjNw8sAJJJdEcU55Vo8LFKQe0HG15gexuFqhw34bEnX0QuUTq+WB/3UmKCgcukTCHjfprlZF+p0eeGa5m9qS8B2Uhfbu8nV7vokYU0Jy2B9P8k9nE6QgHs1CDfDNBFf1Pan0+j8BLNR21/kUkeYnCUJ8TTX1U6ThbVaOWml/rHDAymxxtoWEz2YYW5gJ7ksMaOg2B6d//3g2LILtn5bJLP39cFZPLwl9RX6oUZAtLN5NWBvZbTsq1BIqyxlDO8VN1s+JfIYnVa7GIgXNBovjp0GttoBrO9ddz7cxxJGoKyD+AJATt9uZr1ogZ+dn4FwpRCRFz0MBxhUadYFmsREvGn6lGf6Q8pkutM4vwY9Gs2Vmr6gczl3J4fIBwUky8Pu5ZVNbjy7it6L8d+0D7kFU73hf20TStz+fbK8A47MUi7O/3nLqLPCdEJvFGvOBA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(34020700016)(36860700016)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	knfUnHGqAkakRNme4tU190NEr7kWhUpwpoC8tTGfRYlbZX0sFCZ51qEmi5felnqbIpqORL4Q7K3ZdkNV5b4pe8WbrqfgGliin/uX4DIfh44LjLGxJmTV5Y2Cc8wa9OzzXwKruUqRxQSbIPxJGVVjd3ePVZxQijhwlzdQDu8iaNgg4SM4x7m/0Ist0tNfbGgYmnEnEcYb1JdRqjHijfvkLtfIgbzZAj2ivT1YH+y3Qr7A5VU4UQ47zNdRZDx1jFbjTFa0nWNmCoYrD4BR24uNX8P8XF1zHdXakond0d3sQ0KqPkastz7mTCJmHfwoazyFGBLvlGB+WtVEPOfXhgNX+wqBaTV58ApWbdD42KXJ3phgsy+PhMPtZKBTDyAVKEhpAP7IayIMkw4lJ9Ia7eKdu9JOTBBnYevFrYFChHt45TFoR8IhXNGOVf9cPRvki6F5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:17:28.2377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c5ed75-9728-45e5-bf80-08de7ba43e43
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5772

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has another benefit:
 * It doesn't need the i2c_device_id passed in so we do not need
   to have that forward declared, allowing us to remove that.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/pmbus/bel-pfe.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/bel-pfe.c b/drivers/hwmon/pmbus/bel-pfe.c
index ddf9d9a2958c4..6499556f735b4 100644
--- a/drivers/hwmon/pmbus/bel-pfe.c
+++ b/drivers/hwmon/pmbus/bel-pfe.c
@@ -88,13 +88,10 @@ static struct pmbus_driver_info pfe_driver_info[] = {
 	},
 };
 
-static const struct i2c_device_id pfe_device_id[];
-
 static int pfe_pmbus_probe(struct i2c_client *client)
 {
-	int model;
+	int model = (uintptr_t)i2c_get_match_data(client);
 
-	model = (int)i2c_match_id(pfe_device_id, client)->driver_data;
 	client->dev.platform_data = &pfe_plat_data;
 
 	/*
-- 
2.39.2

