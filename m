Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azhn15011002.outbound.protection.outlook.com [52.102.149.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282C741160E;
	Fri,  6 Mar 2026 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.149.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817459; cv=fail; b=ZiQvtpqbqZmL06xc+a0927dIfkygZ8qGwe3RrXNJ2ftL8fnCO/qG4bq69Kdu44AVx3z5GtD++bkDI51mqDJ1tgTrkw/Kv0impekJAgGxKXou/LZf0smV+XpOq9l1ja+FDFtlGiMqR/fJG1zXeGKLpHjaX59F/tBQhmNxy2sotc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817459; c=relaxed/simple;
	bh=XziiFwCpu6uKp6K8OmNQBiEaXCvUJ7zttxxKDWwFSVk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b0kc1g8G0xkGlxdEavrxIUDa25ZBxRmp0L8cgaVHUTs4r9jRqPgH5XUPB3/1imShnmWfev4OxpQmFEqIsGiShxtZQXzGunP5f/WOmvlg0MJl7mKSo1GJwFM3mz7sz/19qRzn0LdYG2k7pIo8/CB7epjpBg340XMH8SYo8f+EwQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AAUn/SXY; arc=fail smtp.client-ip=52.102.149.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AAUn/SXY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItS8m080Dr/B3L99xzhvrJtLvAoyNnHjMisjnbwNH1zowvNfgIq5e+x4a5czmSZQXxbt1yqQsXN0m1Dhn8NxluoUNgAHblJaHTNPjd1RbDlByAue+5wDFaOsG42cV7yX35pEoMGxL8eye22Cg+ilXCxYmt6RR6BTnRQJyVPAbbfXWWMMJmVnmDOw2C/uM+Q2pr6FABtpdyfgW2QII3g749CdRW9iucTRkptlYkM/sK0hLH67xOu9r9FXngU7uSsPXucLGC7GlzUShONLV1uL5TWvdglm2UH+VWX0aryDep/sO72bdjzW/ZVveQVnga3m+CNOgXWqZbJ+Zl2ifvRcWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ND97cAAgaQWHhNAVIousbA8ktP2wwCrxILyv1lhQTdM=;
 b=NdDx2ti1QNwmTLG66qjKIzf+LHuKWoPTk24JXlxmRSmuLuqzLYxMP0VwezX1YVdR5hjSD5vQCtaY3hO3p6ReIMrg0WX4BfJdjcHXGVgfXjFW99gzYhdXAc7QjYjd+2Afk6111AdaNj1bvLnLibsv+4sm+bMx30V7kbR09Evqm6zo9NdSnmEHkjwZKx024K3vTpAZfJevRQLBQ9Mc+ZGYyRnxHdP9pPLFHRUUWwjq6L5Ie6hMszqJAJaMC1bkQWdu2OhME6iciydU8xGI4/NkSIklw+5EbxGbyqLqTz4qTS5SP1ko9cNoCgaPxfIchBp7oDSTTsV6iIUStopQd3Fibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ND97cAAgaQWHhNAVIousbA8ktP2wwCrxILyv1lhQTdM=;
 b=AAUn/SXYdZG8w9Q4XvDmbRsqdh2Mq4tQ8JOw2PBZyubOOMcdS8wRwrXPSQgOsxmnBmGrXAhEZbRtpAH2MTDB7Mis4dThewY6CjA5q0a5LtJwUv57/5ouwMAiQ6JyAZNCBm9VYkHky7MeOWy/NqQ8CvEvtc8KJJGs+K3/tmL3BeA=
Received: from SJ0PR03CA0289.namprd03.prod.outlook.com (2603:10b6:a03:39e::24)
 by IA3PR10MB8706.namprd10.prod.outlook.com (2603:10b6:208:580::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 17:17:34 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:a03:39e:cafe::26) by SJ0PR03CA0289.outlook.office365.com
 (2603:10b6:a03:39e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Fri,
 6 Mar 2026 17:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Fri, 6 Mar 2026 17:17:31 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:56 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:16:56 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HGs3h491523;
	Fri, 6 Mar 2026 11:16:56 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH v2 04/11] hwmon: (pmbus/max20730) Remove use of i2c_match_id()
Date: Fri, 6 Mar 2026 11:16:45 -0600
Message-ID: <20260306171652.951274-5-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|IA3PR10MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea7681c-0857-4e92-0388-08de7ba44059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|34020700016|12100799066;
X-Microsoft-Antispam-Message-Info:
	yAFMN6IUFNYcu3NlJ+MJG/StzE52pV556RSnU2K7W1v1AY/i9gnHRzNRj8ZYmesv8FBw5Nn9ylkRsOTh4EIljQFuLrGv9A3KpNnc6J6fXtW2lm/0i4S1Aj/A/SUgRYaBiOOV3tfEpzjSErzLLRmXZhf17O++c6b+++V9DnWZ4G3Ji2OlMWiXdjvA3ysA/iku8lLB+OQTme0Bjj6Ufy5s2JGkHVxiZo8LXqEQA9toUNl+IkerXs3x15N7jjKawdJovOa+L4/weT53Yl/DoWANXL+VbiNY7F/+sCqGc+iGXsmsoCWc9KMX5jCqM/UX1hDclYEOzajuhEnw1yqZWrHT+GWddxSEF2Ti+VlgnNvTm8R3AJtVoWLftjTpyKV9syP0vNI7pab/2XikwKpznj02qOfIElhUqKAQzOYY1urXD/OEIraczkAWiyvmV8D8TTHcBA9+LZY1ISw3QCYaJJwKug/20pqEPjEsJTnj8uhQiFThX8BNnq4mVRCAwIep5m3MhyTt3APTFRsjtyGXZ0IlhmrwmP7VDx9DmSTcZM0O2Z7eYImlYhiNv05FpFM17xg6wYUN/hN+aai5JXeV0VuGti0843OeKk0FrKt8eTPDdVqW3wYQ3I/j+dNiMpmuY7JkF63pA7e88WOC7Mpz8PrENhgaLXKVXoDCLyvjU8ioRxD9/B/30nXmYDe2Ojrq1I1JeUGqnvHQ9/jj+oygNJYCtnrhLR0Jf2pBg37fPDe9pp707BF97RawvE5Uy5hQYzBSWkokqc5TKbs8UwmdFnjXyA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(34020700016)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UUFwegPxEffm9O5EByViQ5MMiM+x66NnvCkds1uCHycZGEhP8mebu0nJ6PtQseRtIAggyKH+hyojjA25N+EkJ7eBch2AJLAaL6/EItnLxBPz6EV8B0xTNBreej1s93AzvbzikayfuvRsMXqi6vCZIJI25NbFkHA38hAvahyy9ipE8CBeuWGEAwMFigHJlp+1cW0LhBZbEM9rnTnDiICMyEBFssLn9RlZgOoytl2H0fxIDC3DfFmkQZk2U8RILCcC36Wj8ijSABb8btulyIFaberOsQHNoeI/P7Ooa69LGT4xUBTyOTph2gZUyD82tTTBxNX8d+UJIN+B5PeeJsH9/z1/pBI3dJbIUKc4Sh2gi93ZU8rqQvSRz3Zz18JIVX50Vdm6Nl555Nh+04SUolrLiex8e4hYHRW/9+mdMeyC0OYiZDcwi8y90l/Rvb6hfdOy
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:17:31.6308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea7681c-0857-4e92-0388-08de7ba44059
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8706

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has another benefit:
 * It also checks for device match data. That means we do not have
   to manually check that first.

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

