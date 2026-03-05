Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazhn15013060.outbound.protection.outlook.com [52.102.133.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA4D3EBF14;
	Thu,  5 Mar 2026 19:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.133.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740625; cv=fail; b=AMwfJ1VL6MT6nKveh7jPZ4wPNpqMUqZrw7BHlC8LQyHQQraS12wt2gmGc7Z4K1S3pvi4PRYb/17wIOyCliupKgByQtyE0OAyjotZa5wtM/MrVlefjQHSXNfQouGCfL85aGSoRkUkfcOszHVNvApTxz/VJtR5ivHtQxncgHo535A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740625; c=relaxed/simple;
	bh=Qedl7l5uopyR1yT3GaEhtWA7oN80N+dbDJYG2W1BbcQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OdCKj6L6G36rWZHXkqiw/9QGA56bfb/AU0S0tGuWJJEE236C8AiYYvUrjJEZmteYzwNPPVe5IElHSfK3v5DfZJyiwRxtSc1bUf/rvEylpX2fFyldDj8rcMjKMb6SRIq8ffgTFEjIMWWtqRBK5IGiK5NFY+1G/f15MW7YyR+qfWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GUzDxph+; arc=fail smtp.client-ip=52.102.133.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GUzDxph+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6i/5WLgYMqdu3hY+564sym4qHJx7Y9jod2cRCQf3bBrTmyxKBSWKYerki8Y8KKn1ONgl1oPEcX9aSkN6bchennm7lexJQe/NYXHMnOukPyx/rA9gy7p4+4ZAhWbpj5UwjKsldb7B3OaKb/lPfQhjGB27DnepnRpNuvnjmOgjizxWxDD2mt6uWuDaXb70DS3fvqHvSZRa7E6WRGuZ49Fbd/pcyOHWBJm1gZX38uAj2wY0BxSKE79mOVKgYoJVSNdAjjgQoLHd4PgTv3fdFkO2MBWA3zsF/iDT6HiT/fOu3NdLkendCInTizl+kTdp0tjUboAJoC4tipLrfQY315mhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoxjNFEg4YhYxlJLOgr7y+VSvf7ULWMkAsQlDAVTVH4=;
 b=Ge2aHc42V+ILlyZIobccJTyyC1IrBv5hJhKL5iTwzm+4aEoZi+4CVXxY9KgM8x78GMFpTy3AJt/ofhAnfwM2BYPA/B20WA69L28dCXb8varSJJlz5SaEzvep7JjmGloaSkWjf6SbtvzCsq+1U4CT/4Q+RHLReuUPTDlbI3SK4dZDCiDqMM155d9V5Oh/aNbpdzGNU4dXBMGXnrx14IPCZDmXSVlC8Ye78MW0jG0AYj0l0Y1FLkMITJiwtlcsgrbEr2k3iBE1WMd8tMoEuZVBoo6PxxpXhTM5gYxFuG+wZXfbJ/79VmqrXDWO8Zv+Dgf0eUh+Ug7xNJ7kjsAT3f5ThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoxjNFEg4YhYxlJLOgr7y+VSvf7ULWMkAsQlDAVTVH4=;
 b=GUzDxph+4H4i/45af8CwqRM3XWXksqdAhGmwFkOyGPtbhWFXS9gXywC3QU/FfYGIbuInVmVVeLdXSObwFEec+xam44ZgHZbrOCn/dtw7LBIUvnBdjkmy3Kar0bOcB/b6npiT61x1GfE0eyZQyGPRxfYkGJRYNFhVFZpABiQ8ybE=
Received: from BY5PR04CA0009.namprd04.prod.outlook.com (2603:10b6:a03:1d0::19)
 by DM3PPFA9583E3CA.namprd10.prod.outlook.com (2603:10b6:f:fc00::c40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:56:58 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::19) by BY5PR04CA0009.outlook.office365.com
 (2603:10b6:a03:1d0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 19:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:56:56 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:47 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:56:46 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Juigl2456638;
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
Subject: [PATCH 05/11] hwmon: (pmbus/max34440) Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:56:36 -0600
Message-ID: <20260305195642.830695-6-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|DM3PPFA9583E3CA:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f3e4a2-d101-4b7a-a767-08de7af15b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|34020700016|36860700016|376014|7416014|82310400026|12100799066;
X-Microsoft-Antispam-Message-Info:
	JuuYqEBqWKQJ8yPewRwfc0qC1KAZ9+HRQPHPz8uR7a9kznRlkKXgvqdwuSuW0I67Mdf96Q1uJogkBkKJ6jhhOyY+76kDSHVkjcbDjocYQcTa4TmwAn8y5teuDG4BXegH4B0ixPXnwgaEIkeqFFOq2DRn7T7EFpZ2eLPy5uAovZzvrDoE79FIshWUoKjVMjcHWeeFPJbUD3tPkjXCtoYiaGd3W75ckejBWokaZUZOO38cCJGYX+oZymYpulYzyEGCUV88MUoD15SfNEPRtupC2eB8bZ4vPP1WvTPNcT2xJ0IhUkux0QorPkwdVm5+9T2hjF98jPOp3pl0bkq2P/jHTYACNLxfH4XGIPh/hYjH4SOy5mo192h58DTPRsR1gpTpISIlQAv7+oRCAXrmGOgNcj4tctdZPcv9+YtWX6UH052sSTaYUHRtO9zbpmxIV0+QgB97aqWwOoxXx+SIbBvsOT2ejouftX0z53HSN2uKDPrj5mZFZTe9uL/xXo5ODWuJrbMQyAGow/Dfzhtkn1rEe5Xr0T+kImchQx3GdrDzU+wz5KNHPIYWtk8quFrquigY3suTID+c85bx4PXNA5AM3HUTJAAbtDV/eTT1dRbqsvzTijd+ZxdlJvoFKkT+TYUL+Deiwd3KZbYWP+MPUE8FYapsY8TuoUFJQA9bZ5uATYRcQhmLbr63ozUFpDxRWyAmc5g/4QbzVQT9slTVXR3YUrciXPE0WOR0ygjgMzc/AZwByepRSNcBS4NaCpH+chcqsq++mmApT8SQ84vdo/o75Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700016)(376014)(7416014)(82310400026)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n+XYVL1xGoNkATV1jN6RdAdnyJRXb8A6gcrCypFJaO+0NqiuZjuGOZwO/t49Sfa6aEn3kN+zSfhXqoaH4lCIArJKBbnQTmGBQqQCJSyVcKkv8of7EOjH2iiTwrj+QMO0p5KpvJA+5JFcGVDSDQl0WjP/3EecBaw0Jzffe/SWu3CBqL2VE4K3nzu/qmqPGiVk0t5Z5PNQvvCctMFLxCh/sipmi0RslbSwpgT6Advygo2OLm9MQ0UYJaEjMdo+w8i1zQajZVO4qMXziUFwW+Kl6llHySRtlKmFyz3ltLPLbDqkbnEtRXBMyESSOkppSmfIset2ASlkz6QnSBlxL4jn6IoVYfRakOcojHYDs9oKJBMtgwn5pig9cjK7TmRn0q8INWLAbbe8/ZqlsZqR8Vibq2rx7XICdRF2Gy6vpRhkgb7a0WDqzVPBvE5/G6ViQSLO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:56:56.5408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f3e4a2-d101-4b7a-a767-08de7af15b10
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA9583E3CA

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
 drivers/hwmon/pmbus/max34440.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index 8ea4e68d4e9de..cc96bb22f8f5a 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -71,8 +71,6 @@ struct max34440_data {
 
 #define to_max34440_data(x)  container_of(x, struct max34440_data, info)
 
-static const struct i2c_device_id max34440_id[];
-
 static int max34440_read_word_data(struct i2c_client *client, int page,
 				   int phase, int reg)
 {
@@ -628,7 +626,7 @@ static int max34440_probe(struct i2c_client *client)
 			    GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
-	data->id = i2c_match_id(max34440_id, client)->driver_data;
+	data->id = (uintptr_t)i2c_get_match_data(client);
 	data->info = max34440_info[data->id];
 	data->iout_oc_fault_limit = MAX34440_IOUT_OC_FAULT_LIMIT;
 	data->iout_oc_warn_limit = MAX34440_IOUT_OC_WARN_LIMIT;
-- 
2.39.2

