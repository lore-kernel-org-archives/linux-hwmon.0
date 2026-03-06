Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazhn15010017.outbound.protection.outlook.com [52.102.146.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22CE421887;
	Fri,  6 Mar 2026 17:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.146.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817459; cv=fail; b=TzjWQMYCPFmeKiHs5DQ7iMKauKR8Tj0HGjPRv95pn4NQwkuCOjnkW6nQ6we4vRZsV6K84+vAYjlGV82vMMh4fkj3nCOUDazAvHAEYupu/OOBiYwFV0L/252xotK9HAb5DwciGbt4Csfm7OLoib7+S7TIxHXgIVUjwTxfCpZ377E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817459; c=relaxed/simple;
	bh=BPmUuQ736t278qNkYHgTVzMdT8Mf72ffbA3xP0VH6Ps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EMZwZ0TKsq8brWgmkXY45+9eDQzyq+zt1dRlIx97VOb6lQgxx/I3UYOakVzPQ+pmrkcIbgsjH2aYm78oXu6ibJxeM6Kbil2AJMYvjimGf+kAmj5zyx9BfPnBWJtLlj6Rx9+9tEMT6UzAuA97dU6vmQ9y2ivf7oojGvU9Tr0DquA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=D0ZjHb0u; arc=fail smtp.client-ip=52.102.146.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="D0ZjHb0u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjOVXb4SgG/1UOSqrIwyKFp5L9zx79GBn/Oy6uoHLgydKDM72z8FzKZmdsFWhUFsupU1JFuheU2cfuoFc7cLAkxRicADfF4yZm8Pbwbh+Ye2VLbJZ+gFdpfzNBvgEMs1OK/LhZa79naXw/6fOY5uMx1PbvynHS8cRRBjdBRxZCl16psICINeA/g/dSxcXN1LR/87s6wcGs0lZvyD0desyA2H5r7yh8v0a2GPj0YFMWIwrU7o1E7DlhD4DSDwUJtjmlqY3zs8IuYi2OeygnSswzWSONUnb3picCTX1jmgOQ6D3i/crRm8MznIF4x4DoW7CYazOWOeSnJ30u4eXjCHnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHBXFrmtpL3+9Qy1eb3RGOG6ch+SGlix4ADfDHMp0JM=;
 b=dn2HQh+gwIStpnWKhKl/iGSMTecUjLqEfMOeBKZqm+VNj9d+fjVM4BzhJ1/fXt+V9oGV4wZ3LXonHRwGoiBEa6lsjOhywxhPBRQnWvH1eSElFnTvakdavf/LjTnW99hOTEnUhmdafgSWup6QODTUyF11Nxw5ClCsWucSeY+/57djlCdbCSvjHAwz9ASChxTor2fntFyyimhdsM50XZsszLIsY7GZYYqysVSIvFLIGxp/VfyOtPb2ONgID2xYDmHX6bSoQkw8LILMbOpxiIb7S8pEye2ZKwWkk1I+DU7Lohk5z0FpTSwJAuBUrkSgt78eU63KE6wyj5NKJdD96cIzlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHBXFrmtpL3+9Qy1eb3RGOG6ch+SGlix4ADfDHMp0JM=;
 b=D0ZjHb0uuio+Fa3BKZMqOhBpImVbEIFdi0rg0z9k9f1VGdRN7u1dImBJi3MjSW1ZGd9LTcEbrYf5EBLRlpaNDF6D0/E1BKtLG96m59jQ3cEb84u1O6TKwLQWGz7hPciDkP6HWvDV8VLC9+/lT1L7OZ2bRMz0d6Xdt1XdaqZX53k=
Received: from PH1PEPF000132EB.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::2f)
 by DS0PR10MB7362.namprd10.prod.outlook.com (2603:10b6:8:f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 17:17:34 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2a01:111:f403:f90e::3) by PH1PEPF000132EB.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 17:17:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 17:17:33 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:58 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:16:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:16:58 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HGs3l491523;
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
Subject: [PATCH v2 08/11] hwmon: (pmbus/tps53679) Remove use of i2c_match_id()
Date: Fri, 6 Mar 2026 11:16:49 -0600
Message-ID: <20260306171652.951274-9-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|DS0PR10MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f11cb31-16b7-4d03-202a-08de7ba44146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|34020700016|1800799024|36860700016|12100799066;
X-Microsoft-Antispam-Message-Info:
	gYHIoj49q8hqJM4UzXRTWO1JxAFsf9b9hYk0uJQHJVsL7LiR8j+J2o9znnJMyQKweNeeZjMx37DxwsUYrToQbMbeaiEo1U2P33UEB3UvV3JQe/M4IxDbE430TD9cLx+pj08640RASqCeAKFnGwkMuAPzD/APoNtO9ReZTsMwlmFExYEibYq2I7Gzw0829efwi4mCTJTuD+uVyHNCH3V+qaBzMVvsa4t3K6Javk7o7cW/mfG8j5U/Zj/d9wlzmgo9MxFPGgrY6Hy9ov3DtWXDTJbLaPZoeyIHqx2UndAEI6yOuX7G0juMRKIy33/ggd0M0FriKZU7jlpP5xK23ZY48hK3Us/V7Xr496otvJkr7D07zbcbbqFDMz+sHcyXdEBxrh2Grttc+GVbxwk5xSYG2lOHarTa28EBioh6g6av+WFyA3a0pwgLXYHd4As8pvP8vYGy6TSzsqwtrJzHzJSR35Ma/qWg+HkV/LLdPPvAr/4f/BLZxtiyDNeUYZ2R4qa1oejvGAWCIyybXlWaw2nOOOHqUE7AAJ8ZXwf/jg+2hXWl1tt0hPHbYBYZNvo/Hyou6SAe7tTTuHOU4L5z42ASj/2gnMwZka1KOi98kOsyFEVL8NTByxvCBBLsIC9twi8kPtm8zaovHlG4hsMAzlrnyAsqUS2YeoO0PVQ/wHLC/dPyV2i6x2ZbmqSZoCna+hfsQorW4LN6STpC3Q6hKM//CGAirCTVFY1OR/9dxfjsgtuaqpt1weJuVWK9urFYo7CGOxqqkAUlrryxrX0miMu0iQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(34020700016)(1800799024)(36860700016)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aGK/GYn/R7MNx19VaMGzgiqgLNsWo8hbhGEgHU85bNJMWoTZ3mIBR0EROU7kuFHphiE/+6x2bk9uWLN4eYL1S9u9XcfE/PuWjfYMPzxLCU35s0UYYuMFRN/7F66qmCfDtG2NV6YsSGM687lM0bLPBMoQhqTHgV28OsKFTF+aHCF9Lvbnk8FIL7XS03koOHicjEF18WN56RVs/AIjURONr0+d+zMhBeC8cEjZEXGfqJdf1xrzcUwwVDF6RcDgZp4Ae39l0+AoWON7/soIJag3zrvs/eNd2/aftiNlL0ZZ8SsBhQieJ/Laf6Bs7YeK9mtHTrSaqKinN4K11ZSBhle9V167pj8bX0MGoq7d/wr8c86B0OKPll/aOynfyUFTX0aDiyXPvMgp2ZRzRxgx4D7T7XoX14o8rh70ErGwcbcfQXU9uQAcxICrl43Zb3+Qg+Jy
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:17:33.2730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f11cb31-16b7-4d03-202a-08de7ba44146
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7362

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has another benefit:
 * It also checks for device match data, which means we do not have
   to manually check that first.

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

