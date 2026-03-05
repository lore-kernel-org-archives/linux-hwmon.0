Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azhn15012028.outbound.protection.outlook.com [52.102.149.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51CF3EB7F6;
	Thu,  5 Mar 2026 19:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.149.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740614; cv=fail; b=oGrxl4eR51/UWqPdZSAdlz43Kt96izVmUxZsF05gQouQ0lI8ei9I7GTelpYZ1UFqiTj3GtY/edKRGl+OLta4EsPMmrF530BraPP9lpuFRdrpSazgE95TtEnPXmnMklT9PLn4IJhiYBA/eGpz/WkDeqxSaVR2esmT5tUt3w9MQ3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740614; c=relaxed/simple;
	bh=nQ8HT1FmX85D5PAFwIx51WZBZw2BMlqiznnUVpp5HJ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CIFQbPgZCRulOa6ZZuWaZPGo92CeXmWJTkNG9eBS4KYHS3sy8Ydb7GB8xAYauwletrc3v8JwoZlQKlysDBwDkf5E2U7Et9IrQIh0C6mlocYeNpqtzFHfxifIbblhGKsP0sgNGXNYQeM76i8zu648KkG9oObur20ROmt+/vnx/3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kQC4aw+C; arc=fail smtp.client-ip=52.102.149.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kQC4aw+C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8AklTdMg1liGW7mIqsTZbUaiPfDfNJ2RjmxGS9ShLs2e8w+/LBSG/qW4wmgldTjmWJCeTfPi+3w8r2Syp5kPCov9PMtGy4cIOtBpR5GId7DGWKELUeVAJTIs5vWsf7pyr/CysQXxmsVLTUOW8TE+YhLLPL70PKjriwveBf4FieJKmyL7rDNms1ixCw5jTF1pW6WtpN8sQgdiPcFBNvMzHb1T0bwRm0N1qq8IGW6O3ck6bm5kqVEELskroureNlBNvADewnTAdEovdMP5dyVqcx2GhsxmzYgfwXNlObmYKJv2ESizCo7Xr2zXYks/qoyStdgGYEtcqF1ztOS6nw6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvaY/IurmObiSRHxEXGts+BpBNUPBS2qToFF7rGP778=;
 b=Q307OIEk8UL94TC85zNxx7WF1HSJe6nquzmMOoxb9OaTyJUlxtMQAxsDfsDXDHPxbeNjGYfSdo8egSDP7GJydd324p+LvC4dWHzLC6sDwDxzSJDEMobf2XOQEnKuUmkuebcS/86wuYBEJ9pvVGs+JUY1KPrynekl3Et43I7fvTpuLxMf4L05FwSO2eSUCKobdHV47B+bmeGp17bxHvQsDME1J48zhJfsbefPQ4lzorLKySWBwfWSo+DJ7bCHWainqKl0seFIFiR/NQqZLmiUTMrFcqD4vKI00eE2kJ9lbltsv2ew6eNQGdInn7LTBeHcNz5vYbJZutfpBlY9/JfkrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvaY/IurmObiSRHxEXGts+BpBNUPBS2qToFF7rGP778=;
 b=kQC4aw+CcZEu2B1xqUa3rNiEqfu6UQm/Ib0CpvEh5TQ9R8Sk7KeRwu6DWNFpm3lf07KSCqg4cCuJTxyxMwqBVCoknivqIRSAW6rkxGM9iKICenMEfyeLXlBqSbN2voJfqiFHDE0LmKJGJX/TVuHl3S0tg36Zq1rhazi5b/9129c=
Received: from SA1P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::11)
 by SA1PR10MB7737.namprd10.prod.outlook.com (2603:10b6:806:3a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:56:50 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:22c:cafe::21) by SA1P222CA0027.outlook.office365.com
 (2603:10b6:806:22c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 19:56:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:56:50 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:49 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:56:49 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Juigr2456638;
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
Subject: [PATCH 11/11] hwmon: (pmbus/max16601) Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:56:42 -0600
Message-ID: <20260305195642.830695-12-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|SA1PR10MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 3328083c-2951-4ad2-1e74-08de7af1576c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|34020700016|36860700016|7416014|12100799066;
X-Microsoft-Antispam-Message-Info:
	FiZQOh5dOoq/oGp6bRrPjyPqPalCq5M/P/COkErgjUlqQhdWpiN9TWDFoXULT3Y9EX9AQc+EUfMkAiq/su/gF/N1b+RXFl6mA2L8+blrr9mQjmIy5mBg1FFFdf0eeFIrTPbYWEeUj+/V9XyZYEurbGi0Ez4HxdJhrKPeGZdBDJLM4Flw9AtrQdT5Iq44H0mZIDLdLqJgz2fIkUPo2Jh1kU6qXD/JW9aGMl4jqIIMhw/jV7UOHwEhvQUp3YQeKYBYsxA62Vvdb0oxcHfydwLLPAiswgWBN2jx/vkHaRWxD9vZTehNyJNhB1+Rfy6XjFm1416uFkn0jkEXA8nXrmxR8L+jmGlUdM8kTvSbEc/5ZOq6a2KixhQZdTd24LnfcwrYKPZ/vr+sFKU28stcPB8wY+PQz5vm619yCYr6M+guGRGNj+kT6T/l2OX/Cg58lbUPJxWQLz96SnJt9FtAduBRpAo5zmyemLNqBlfS717SHapnnZyxaKflSMR3gjL1xqYKfiHV0Nmo9FJmk3egKOh71Cideh60enwI20/WV3QCQLVzprwVhWghGXy1HEAeV6LRO6PUeS29jUTAWSrRgcTKeS8riVP386thDgRwTy17t777zYMjOCwZI0dbX7Eq3656E3vrSjTyBhPJ8iVghdud3vAZwfS9lWr8Lhn2JxSsORv4PnXhdcWniarSpXz3uVO+snf+Y+B9yhlKxKobomyAXcqOFTv/aVj6UbMitPqRa8KvhAJkIT7Z9HdMOUlSNHjKV/6ptr0MaP2JXLBkmbP1BQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(34020700016)(36860700016)(7416014)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+VB3CgAfOdRg3+hqQue3zqh4OcdLeTeOBeB7lOHwZR8e8agtFFNVoEbIQfFBjUBYom6n1PD7DLRq0MUknZFl4MHQn/9oJ2407h54WcdB5Lxm7GNA22LOwRt7MgFaSVtJ7WrlLMvKm1Pgf8Ndp+pTFQOQgvM88nHZ9GcqVoO1UOCYuKn0Y10yn9otS/6WLucijaImjAIyd8PokmWUMVPeQ50UpujfCnyZlUiVA6+QbVbasuTaDxyEK8O+SBt2Ftqtopzg37CkJXXPgYlXm0yRQ/2ErmbrM9+FjzxQliI0KL2n2S6hVx4r+bHqdL2Ujgf4FEwS7w9vi0WPzem937M0ZWmOItBOJTqg9k1gyDn3XqgFpBsj6VGCfx/XlAUioT/vSDgV/UxJUHQgUvlGpM/ijQ5tX1vPkjMf7OqqzJ34JLvnPm64uXFBPZyW3rxY/sBP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:56:50.4947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3328083c-2951-4ad2-1e74-08de7af1576c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7737

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
 drivers/hwmon/pmbus/max16601.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index d696e506aafba..36dc13424d929 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -318,7 +318,7 @@ static int max16601_probe(struct i2c_client *client)
 	if (chip_id < 0)
 		return chip_id;
 
-	id = i2c_match_id(max16601_id, client);
+	id = i2c_client_get_device_id(client);
 	if (chip_id != id->driver_data)
 		dev_warn(&client->dev,
 			 "Device mismatch: Configured %s (%d), detected %d\n",
-- 
2.39.2

