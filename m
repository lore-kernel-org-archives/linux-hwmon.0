Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012009.outbound.protection.outlook.com [40.107.75.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5BD392C4C;
	Mon, 20 Jul 2026 06:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529493; cv=fail; b=GU6/Rul3P0xCSVg+XpmMjajWEOFNoAn4mhK1yxgRuGSYFMKfPHTTFmFK3udP/gISw3ySroT6cOMCned2eftjxzISCtXigDYJMwjSPkyJzdwLaYY/MKTd+/VVAix9C+9l8vHzbLQ8VPP2gytFmuzCV1izqnICzwQcwJpadF1eWfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529493; c=relaxed/simple;
	bh=hh3vBnuiPWqfCPe+KS8mmg9BFS76XMhSc+OfjdepqLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rtu/sCfpsGWYmwyXRQ2PSTyT47hewuZna349tkPcZgNmXz6g2mzG1g4Bxbh0MLXM+8SJDVeZT3rriM9Egbo2DuBY/HullAt2K1VImLDRyX6I30/JBi0OhfyZFMck4RtRlF6h03b+cHz4c5nuA304nKqCEkDSg6ql/9IkRTkVqy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=MUchRXc4; arc=fail smtp.client-ip=40.107.75.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="MUchRXc4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jltg6n/XTdUKwgq6LlBtoYsnxzcVUE34nlTKTI/KXYvgGgd6Ek8klexNL9p22i5YTj5tp+6s5TvLfYPu3bpiWA8vNIfFz/3NZCLOXDehoL4zrZ6PyHeoq3uotFxvtulAZdu0MR9096lGItKP/dNp+B1RoaZdvcH4wZbKwkK6YLgNr6baf8eHCy5UF1tp6M5+7loAxzj+bjGzTgQFd5dBHEHADBVqTnC+03V4+Jc+zyprS0dX7o/vUu6Bpmdc9tfNKzUKkIRL7NBcLEA95WTtn32IB1epNe+4Za7Fx0tRfMreP5EJOsDVrMrNNuxOV75gwQkPSiV7DO0WaiJ12SRKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yoauox3eP4HvtldtaAhnsj5bQ+e8A4OrLzz4Jkj1vOo=;
 b=lSYCpUYjIEBoTuPaV5OcncUJMa/OtEhY8/WGLi6NOBQXvFGucHF/46WNm0OdpXvM/m/2h+jWj/9AhAyOJ+LjBgH/tcIynjhrX7pVBWi6Ihcvyxtwz/Up4jp153L9UZqrkS00dzDRg1/SmyGsOiQJzHNqpKTWMEUO9xxu4JEMCeY7qyLYjE9Hg8XD7x26az3Sll+pF6zmFtZLKC3ValPWgR0O0ZsCVNXDvzlmsjvjxf+jYG80WPxsQRRWhZA3r9MB1oYMcEGaqNc6o6bUxKYC6iwkrLl7/wWZYZYdd1UgZv51DuzuHs0fBt+XfijpyhRxmOQ58anTN8vzZ9zVJv/vwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yoauox3eP4HvtldtaAhnsj5bQ+e8A4OrLzz4Jkj1vOo=;
 b=MUchRXc4iwxlSBflNLXltkk+u9xwXiKv9B0ponLwdXXtCReT0kRR63jpC0ZuszRTic5iY7IQFSv7QdK6ltbo1T9To0slPHztXA+L6K9asA05r0MMWUwnxvmzG+Su/DqiC+Ro3c3QNmv+SCM0sOxeHbWKS0KuhDNAhiUhhqoO78PDVp84BR47BM1O0nuqTTy3Yf1qX3qF17nWKrevnwr6Jhy5b8LQTE4vrbKjjG96/OflSYfuP7/Y+vutvjt0DanrHP686Zacz1jq6qrLPvwNmSqCYS8egq6+gJnl+8wFP2WYzUM+OxHKarSd4RmGH/oQhKXQizoG6s8GtTiMeOIZdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI3PR06MB8491.apcprd06.prod.outlook.com (2603:1096:4:2a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 06:37:59 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 06:37:59 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:LM90 HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH v2 3/7] hwmon: (lm90) Remove redundant dev_err()
Date: Mon, 20 Jul 2026 14:37:37 +0800
Message-Id: <20260720063745.309331-4-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720063745.309331-1-panchuang@vivo.com>
References: <20260720063745.309331-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0107.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::7) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI3PR06MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 034baea4-a078-4775-8e59-08dee6297090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|22082099003|18002099003|10067099003|56012099006|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info:
	P4I5X9iCLm70lEB0MTrT7d7Fitkk+KJXcIUZ4WHq5zLyCzdC5EPuZfbEv8oWe5StNAwDm/h8HYsPs+hNpjBwsQJsOkUQPx2e87pvcK5DxOPZL1crobfKC+f/Q4sH5jsvgPsvVNZ6qJTIC9Fi+WHQ5aniRdigDmxnf8KhzsbibUtDsWuybELfnTGGzOgcP44EZQiEdw6SZ8wAW6AA4mbLmaJQX2gtoIr5b8ATnUsvVabRyaZmEpNlwBVkJdqYZW+fjYxwPuLOGXkW+dUSyBQiSo7wLCFErgB0UYWELtmAvFOtcLjiPErZ4gWi9tb2AgQfXCV6sVD1oUJmBsg1C0zEFe9mEVF4ehuFutey9dTRa5z/WpWWbOhXN/4juFqwY6PF9s2BsAb9nWiLZzYLKcMfF3IwFW6zemZMMuCUCXlOOyPOQc1L2zDCtfAoMZjD3bW7gzDxoBsl9cX+3Q7/tZtJ+5DuAIK/al4YStdOe+r5gCQFhlsyZN4WjRkTlxKrMPjJm5apvPEJdVnxkyZlC5dzmy/DCE8tozzuIvqX/HYvaei/q1usL2Gl29L13mWEfETr3PLPfyM7PEHEmO/q0p/MVWLlASLTLHctqYFcBx2OD/MuMtvZF7wqaUDouJzJvDiI2td6wSrjcmmq3EH14+i2fG6azvIJCUSfz3e/XxDaKX6ORRcVp/0bT0LOZI+QVd2MT61X2JZvvI0wXF3oIl97jHrP5bZIsfZTSVb1+q4UJgQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eQQwRKpJs/ZNiHABOYLn16/xwUujbYFJGvHc/0be3QGhAwQL8EOikIkr6q0D?=
 =?us-ascii?Q?DW2lUjk7O9q76z97RUa5Fce1RIlwW5fSzfWRNys44Gcv9z24G9xBuPmKJA+g?=
 =?us-ascii?Q?GZ1JLpLQy16fLNlVUXSx5U2+Jjen1pLGKn8t5B4zmw3/9HNfIGIA/ThtHLfJ?=
 =?us-ascii?Q?DwiBu7N5lKRtmX+gIEdl1Ox2pz42QHykGULV9UuszCUTRYNAIgwTEN/fLGyG?=
 =?us-ascii?Q?tUCi+nZBroeX+/NysVl8Lvr+94qZCdXQXZDkRuUVzr19K/EDnJ+cDBBEhPf5?=
 =?us-ascii?Q?IOm98jFiAwl+l1H5byy6H/vMCoL4t5KFyFJT6/7y4NWNj4ArkIsTi7Bf/G7g?=
 =?us-ascii?Q?0C0iJnoLvxfWLKw67eC3Z5rrh6gGFnrFeesRCLZNKG3YzEOqhB2Yt8jbhS1z?=
 =?us-ascii?Q?XWUT9bLhadg+/0tqifpAIobggUFOYwv0Jx/XOcRkP/U3aWxs78sW94hMoEqP?=
 =?us-ascii?Q?ux4ax35HklLjzqT+C70BMMjAf3d+PTAOgEUTdRPIr+qkub1jZXIxUsFtAZJN?=
 =?us-ascii?Q?BSidw2Y0pPvzBMd638OsMqT1y4rYy2LsMV7pFVUkbDpis05M/hFR0st67+2E?=
 =?us-ascii?Q?JkNG3j70O2qt7BWM10J3iCEAY3RhvsQhC6y7EASNg4xCclKYziTjCO3Qa+KB?=
 =?us-ascii?Q?X03gP8UVBcKjVSqpaGffzk8QRGZoPu10O7tcP97bjZmu0dYRhJ/D5F62hYto?=
 =?us-ascii?Q?shPrcshITPStgy8gLk0gfHq1+8pAPlKkC3Si49r628/P1jTKYrHQn4V5ZAsJ?=
 =?us-ascii?Q?9ZZOmapABVjKJBFfDKLS1hk+5dC1HopT0Jsh8lMJo7bcBaC/4oI37n4E3QtT?=
 =?us-ascii?Q?sZ+ZIPBAE5sWK1on7folWFSYOgFjpWq4k0LZBaY7ti29+VJyuj7L32HijFI5?=
 =?us-ascii?Q?XxIS2dmUZWm9G33+nbBj5TfqMchWaLz6FINygacQIcdEC8bePy0hEDcge9C3?=
 =?us-ascii?Q?8/aSQXtj3NyMIZrOxmESTP1nu/XBAMR32Y5zojLPNvWPn4Q9ykUpZqGOp7Gi?=
 =?us-ascii?Q?9C3k9+KTxVqCRKWA921mn2AcdxoYfxnkjN+e1rb2RusrkmDs4SR6tuna/TTk?=
 =?us-ascii?Q?lLab2IDX6JjfNQGNp2IDFIqfZr/H+I+g/9jDYiw7ZA8AvMW0E39EeownsXjk?=
 =?us-ascii?Q?81fPeoF4w4wZ7yrAMsjly3rawkA17AYqSXGKzueua1jE66J+RC8pXSKMrnIw?=
 =?us-ascii?Q?U0LTriz+5h2NbdDG0VhaRsNGI4+S2RkSmhfrvl+2E1HqkD2LtiqxJWL7lFGY?=
 =?us-ascii?Q?uVICsRCI9y8H6PLRiRwimnVnCPvDDByYSaRo2dp1T/mHPkMuwgE57pel8dY+?=
 =?us-ascii?Q?YH6IjVKzuUmh6ax5ecHirg4iHREi/e/8AdRPgHayu39dkCyBOM2FJJggjr8O?=
 =?us-ascii?Q?FkvjF+666Hg3q7yTi9RPXeZQZCHcJMhVYN/RLhkf751C6uQAp1857tGY1TCg?=
 =?us-ascii?Q?kbYx5XP0Bii89rijed1B4Ew9L7vQKov+6/kh0wGbA56cJHborLBptJVdVMi4?=
 =?us-ascii?Q?AIUuz3BihZ4k7G8E4TUdj2SGqx6Nc/jn4ygz9Piu0naY60jCfj3a3ipM5wzx?=
 =?us-ascii?Q?st5CGWPynIofhkQyp6sSDFndiMeI7kOS00hlGzYN7tmWagZkQyiI9OaQh/Fp?=
 =?us-ascii?Q?HPOz5UV6UjKGFVvf0ttlSJnNtoLuosrw219ITS/OutDXds+BRyOd5P44Q1zH?=
 =?us-ascii?Q?dKs2t7Qreyq2CXQ1gqRqTxQwdyVo8zPRh0HerwCPLTmjKsno5rruLeJckdZs?=
 =?us-ascii?Q?ZtWqK0zSLA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 034baea4-a078-4775-8e59-08dee6297090
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:37:59.2154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGvR/Vdk3vs3g9P/5tOxpllVcwr5sUWQwt5fWLlzVI24deWB8NPkZIhfwqhVVIWwinR3ivDwG+Bltk9gVZ7m6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8491

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() call.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/hwmon/lm90.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 4b9c0ccdf260..348eea5bec3f 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2918,10 +2918,8 @@ static int lm90_probe(struct i2c_client *client)
 		err = devm_request_threaded_irq(dev, client->irq,
 						NULL, lm90_irq_thread,
 						IRQF_ONESHOT, "lm90", client);
-		if (err < 0) {
-			dev_err(dev, "cannot request IRQ %d\n", client->irq);
+		if (err < 0)
 			return err;
-		}
 	}
 
 	return 0;
-- 
2.34.1

