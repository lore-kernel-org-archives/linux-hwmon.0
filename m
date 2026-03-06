Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazhn15010016.outbound.protection.outlook.com [52.102.128.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CCC1D5CFE;
	Fri,  6 Mar 2026 17:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.128.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817457; cv=fail; b=gq9XZcbDK9kq+20jHY8okiajk+qzGDkn+d8hFYtjrKo1fhOmxnQyBNgghb143rzgsljtSDw0BDVAYkDO6c5IraQlx/NlCbWRkwW/FcAA9dC4/a7zqV2EOeTecx3sdxIm/lYanvatuErO2MjN/X4A+vlYoTvZVs5sh4h2Gveum/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817457; c=relaxed/simple;
	bh=IDNZb6WbtOX+ok+3I7PP5EnjkMEvtcydUqFsedDNkzo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NipTd0C4YNMuDzHGGq+BmZ5TBECoCFSQSmvZpEGU+VRP/2ssL8qhcZlfCZPOAXqwEuNIhZl6jBRIoDaXCbs1SpoBfNFZzqwhhi1LnuAm3C/FS7vzKucQ+S6SDxMAa1xu/4vq+PhEahxSN8QxYoXfoir8msdCbJ+0Cse8FtVR1pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C/q0gp7k; arc=fail smtp.client-ip=52.102.128.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C/q0gp7k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jj4Oo4F0fvjqZiwC6zDlO8rb0J8djiOa0mKA1VbPeKtgX751y2vmM0vErwuGAJOp4hEJxPZV9RqHUPBq6atoBSd9SYhdop9pLMtpX71Wep9qg7RJUqKeXHKutPVDU/olhPpI9kRH5NCW2bsa71qTi0FoIbnPa2EY28/S9JQ9xXERwwKtNX4r5Scxd/6fM/1COm8HbyTAZMsA5Mv3yKaLGp6nU2hnlqtnwZj5CIrlZ6HO7mWcRUJYJ1dhUwfraKV4Cn4o/cVcZpG8qQpC6GNd4C09Csx+f3HZfXoAR5X+hdykgR75vIHnaXtCuUXYf5MqVGYJukByyjghcDRhTx2Eqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h23MooCB/Uh/OOgubVvyWwHPtImahx7U8I/+gheP7JI=;
 b=VPKvQxLIZgBkgaXJFsVOcmVmNnUSPCOKcVe1LxvaNYApDVCt4pGwqkR8fLJqyKUggDBLP4kkz1DC9HdmGcWFJSDv3MBYg67pS/KdhkVqwNALYaYApYJ3behfM7wDywgppMyvE2KKhW8HxrTywcMqBVlvT16BdJxXzW2y0pbV8SKmyhsksVeNTuMrggHAW5d/WwigfKZGKMkOD8pzOmRjdcsaGGCUqTOzMW4SmCau89fwMABl4H7IjdJYx1rWolDTqb2ThS2ZSAnnQbfyyoIoXaktlHQeEaKfRgy3zWPzQuMaX5fT4oqvyBmbs1U/bMaurULRk+I1rFhfRCH3O5QhUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h23MooCB/Uh/OOgubVvyWwHPtImahx7U8I/+gheP7JI=;
 b=C/q0gp7ketOyX+r0Zc6YLRLXBW6rSUjgZkMYzZ8+crkbspwqW1kJZ0kk40kRZKvxdWUC5eA4fbCCcmjnTaCPP80GY5H1C82flChaO9scO94g42nGfd/O9jxpWz0Gc7DJn8IKPlscpWnyam3Gwzc5u5qD0iQIsCvRMBDk8QkZbbg=
Received: from PH1PEPF000132E8.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::28)
 by MN0PR10MB5958.namprd10.prod.outlook.com (2603:10b6:208:3ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 17:17:32 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2a01:111:f403:f90e::3) by PH1PEPF000132E8.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.20 via Frontend Transport; Fri,
 6 Mar 2026 17:17:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 17:17:29 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:58 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:57 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:16:57 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HGs3k491523;
	Fri, 6 Mar 2026 11:16:57 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH v2 07/11] hwmon: (pmbus/q54sj108a2) Remove use of i2c_match_id()
Date: Fri, 6 Mar 2026 11:16:48 -0600
Message-ID: <20260306171652.951274-8-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|MN0PR10MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a5ebd4f-1891-4ff4-0d38-08de7ba43f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|82310400026|1800799024|376014|7416014|36860700016|12100799066;
X-Microsoft-Antispam-Message-Info:
	LTeXfS24hARTUuUs9cZXK8OFfpI224wjZzOCLFZ9T1uVOHvBSjp138t/blOIXXWlVcdbENEO+6SnKVcSW0PFMft5OJoLHzoBa/JbO2J58My1rBuZAUHcAqYnB+jp0pwCh0hobEdq7SUYitEgaig1Va+HVGOkH8uKtFn3lum1jcqtAeVsVYYcdWAT9v7irwGJ5JSnFYY+ZL5uQT22Gjri7ECRddyMNlYOGPwVM+HUM68XpvHtYbysyGL6b0MdDwmRZ6FqSqw6Xr3aJ7YwPMa5xiI12A9FJtKrcMoEFCDJMUMs152EKWdpPq/8eXF+K9y/HPsLp3gnchXG2exdifOYZtdy29bfk5AvgXkXJ5yngXS219wcawVLp0PfmtwUpTQhwd9Kk20AtgBM0hBoTr8R+bZFesVrn6eAhAIvrOAvNIwmMAUJDUqmD03oJqrIKb1PcYHVh79FvRAuCXMEDtkIiujWX+yUsi0U+QUlFGoEM7j/dhzXKTfVEOxE4iJaiIMCHGo2nF75fHokQjtwgWZtyILqFGajPgJiosgcang/rX5PyD5srQIeywsPOD+1WLoCjJjLcwEuXTG0xb5h1PNq7pdCeE8qIK9v74h//ZqkgETzClPhq8hL/hBpl3ErDgVJQKzRXQafLOHBGt9l1TrOj+zIV7ZhGcdScgW6SfZHatD17/0W+EAwOqAi0t7FzG0K6Xd+7hhA6MRbOOt+opbNyHUuMxgcDpDmcVGi4HjxEIe9aZcj+RLpUxQeEMmZH9WEH2lXinlPu/7/spkuUAJ/2Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(1800799024)(376014)(7416014)(36860700016)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l9w2DpQLWictU/RhYlV9wBoRi29k2kqmV++SBH8XZ7ddFLiKA4iJuk8jY9F42pTIzD+9l/6MRrtd+2LLvn4YhvLK0N50fgob+ky2d3j5x/z4D4KSXX7Z+7NTmRJzHaECjBsUgcerAQY5qoll1vY7vhem57diiKajlbwZzkT8ck5ptNRoWr0eJ25EDSVP7BY59eB7msIXiSLF2wLh6FEDjEyk/rijeWnxEAUhQT8y/EJYPD3o03riefYb2trtUadB7JexWZUco1AKcYTWGsrC9XAivpeWigyEbO34fhHb7tn+caCoRSrLsjcO4u4p+TSuGVnGDeKIEZmAOSYbDL0f7c1+7GW/V9ABsDE6jznHzV2zDUeDOPLftaYSMefSjqUjLoXjwhsnGV5gGq/tGB5Lb+ZYOagbY0Se2b6x1g2vTddb/gvwuEBQ5i7wN8kVzzmT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:17:29.7041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5ebd4f-1891-4ff4-0d38-08de7ba43f24
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5958

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has another benefit:
 * It also checks for device match data, which means we do not have
   to manually check that first.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/pmbus/q54sj108a2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index fc030ca34480c..88c25290ffce1 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -291,10 +291,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
-	if (client->dev.of_node)
-		chip_id = (enum chips)(unsigned long)of_device_get_match_data(dev);
-	else
-		chip_id = i2c_match_id(q54sj108a2_id, client)->driver_data;
+	chip_id = (enum chips)(uintptr_t)i2c_get_match_data(client);
 
 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
 	if (ret < 0) {
-- 
2.39.2

