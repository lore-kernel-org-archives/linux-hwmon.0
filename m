Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013071.outbound.protection.outlook.com [52.101.127.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A6D3AFCFB;
	Mon, 20 Jul 2026 06:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529505; cv=fail; b=DCa3UugiwVMzpgN3lpTUlDkhCIqZrcSpP5vZXnHT/Axt0iZbUnSLtAAc4rwl4CLoi2lfbEkBTLr4huwhlaM5PW4bnY5JPT5EPvCSTmFFapnhgEQVZxOt3g0xvXj3QDdDU3n01z9LudyIGkcJAcpFkhLGktFPGdMiLh373aFC8uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529505; c=relaxed/simple;
	bh=MAU2DIjWkvO5wJnWTvp5Y2TJYETaEvUSGD2w5bh/DkU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q2V334opwaYAAsIcT+oSzyzZWUiGWaMSwVjnnE+BWWhKmF+69VSWdQ0fpU8wg6p1iNwMpnq9ptYbR9c/pgsRekujen3LEh3jTw6dLnlyaWLeIz4afGfiCQNmxaDPAcobYppZTRtiNAXCH+Tc0rHFZn3Zwe4YL1JCafGK122DwyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=mBk1d53C; arc=fail smtp.client-ip=52.101.127.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="mBk1d53C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqEV6M4hr/dOpZO7m9dnYbcToEPeDvIBwl5XO8a4bq23xZvlFTTIOT5EFThcs5gHLCkYn+uIzVo0rO296HsaY4iCIlQ/lFKPGfhvGJYVEA9zZtsiGQuQh1k6NuQB96fBSWczbXeyjZAKnlHYJvE/QrEkuznuFTmlgm+0KQVHz+AO221mIW65pnSl0zedKH6jKxtwyWPD3dxNW8z62d6QHmdzQd8qkS02QjAfl/wMyJuyzyGHr/xTwSvJuSkCjXOVt3lYgtqq/a7Ui0WodxnJ8gGXUpHzLkNxbwIEHzl5VjFoWOPe6GHatwfTW1lJdZOKb7Zx5+FmgPsf10Gu1VpJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvUhpgXv7kmdgihBEhVMafs8Nkg8ZUHnB0oRMpo1n+s=;
 b=xofXO3XO0CgktfsmFr9sgMelDXbMBoocatA9hkmkbmD6621ZM+7fJQTpxgzdAtImXUjPlA8ExnUjmK5liHlYOqlcBfdoJrxB6n/AlCoIcFPp0a0eHaTcH/IuwS1dlRt0m0Rm2G23DcteChwJH3b7FEx+UgkttyLsABlucqrS0uRCxWkoSQacBeswSryoSXIZgoX9OBx8ASAls1GP8ey6G5lVuS6nPSEwB8JcNN4dDpnN6naM2fqrRmi2GuTgaz3++OtiiQv7fdsT0ZDgpEBDbsRl78geJpc3jSTBvf8HG/853RhBoyaXqPT7ReAsrIcH3OeYSLN7b5pIY8HkeXYJ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvUhpgXv7kmdgihBEhVMafs8Nkg8ZUHnB0oRMpo1n+s=;
 b=mBk1d53Cgyeuffp4QxcXuVE7rS+l91bvlsOwsyQpYUy4l3FLw7ukL0RrS9TLG/wG++BSzXfiLzjywvcFKQ/DxCLXPZahCS/sZsatIDti5OYEbvj9pae42MvhqqhN/m4xQeE3nW8MkO2c4t0leZjh3MQWXCE+NYlHV/L0aE24D08zuslKFl622VCxQpm87wdrvXPK9ZipZH3G+aWuunUQl5janIO5eTF3gW09o473rzAkyoVPAMQ0lnTFnU70zXcBr/pX4InxHumNHbukgO5p7v+biEKpRMGyGpcR67/DIMjb0Vbey4LzFo5MbNSyxDH2aEhjuW/xiFUiakNZsPCjyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI3PR06MB8491.apcprd06.prod.outlook.com (2603:1096:4:2a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 06:38:08 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 06:38:07 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Sanman Pradhan <psanman@juniper.net>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Pan Chuang <panchuang@vivo.com>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 7/7] hwmon: (pmbus) Remove redundant dev_err()
Date: Mon, 20 Jul 2026 14:37:41 +0800
Message-Id: <20260720063745.309331-8-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1c060931-3dc5-4636-23c9-08dee62975ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|22082099003|18002099003|10067099003|56012099006|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info:
	Usk5jKkhEju15/dOxUAixix4VximGLyxAikfq+CKEqZFkP+jknT2GhgrN3RhrHif3N3ns1s2CAW+6dJSG+anNTWyugJa8bPSs16MqZ4qHjIqRxomIJw8MzJDkHKRe3HR61XwpTOD8+nzyirwD1iU84IpelxraE+VOGbJZIlvOJuIIjuj1Y5xHhypMs7vQYgL2OjcKl2uIHM1WGb0g8Tb5fOyTkwS3zQIpoCs8CmHZJBLecSOGnMWsUgb2B7v7RdgSB+4H9AhaeCtnJ2AjnbpknbgfhokbEj8xkhVES8Z5E6dQE/BMfV9rwcPhdEC+duXE0l+VRF2tUk98y6k1hjKwMCBENLDwgHf5snavM3tuSsAQMPO5pHnIMof0Bxbw1NwdC6TjD9lAuKZgXLy6THU+YFRxK/hy9aiieoXFDsmgXLxkdvzR9a6vSotsFOeDHJfVpTQtAP/rI4cSoLfWo1NWkI/8aZSw6pr8+TO0qIuUeEf9e/qo5eey+35ilyY2+tFTWlIt+DonU3ARS/VHkKGH5WQDDa496tSRNui34yaCcl6MyjaJO58Efp+78vu+xoNiKbHfou7ERyOpZc0UQn5BKWSpj4YK8RmsvQcK9RPvZUdp2IHXzFp4PgAC1fb5EP+gmXv3InWRNqLBDqZ4lqVSvU89jULYYli4HymthSVM1YA5hgb4Nao+uktMBnhitOxaqjb8l216LvAQGJVJcKaboi9Iv/7B3XBlidKxH1G860=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XeHdklxpMb5wbd+rZdp4Fbbfu8p6CT6Ueh6GrPfk1a7SU3kqJlgym+P0lboP?=
 =?us-ascii?Q?q1o5U+7tRgAy6ACvsTW6eC7okJuRq65J5NLyseAx9C2dER9lZVdsIDvkyeTj?=
 =?us-ascii?Q?bAYOAoTweqMv1WGK3ZzRlOQPdN7LOizmBpa2rAU2GRAdJNAp9AJEp5vHCkLa?=
 =?us-ascii?Q?EjsSx3MC0p1Ld7c5L5gr9zVcB6HaRpG6/Arv5/Agr98fafkhSxZdV+zUSbHI?=
 =?us-ascii?Q?bkD5ATAKoeChvbiKD5tEk7Xz6mRYvUZJfwvMgi2WB8Ga1wZ+Tdy4dwVQCd7s?=
 =?us-ascii?Q?U4UPUO/3lxhtUAuglWP6y/haFG2ZnKoQzFDm2/ozXYOrdB1Wl1C8IVC7lO2C?=
 =?us-ascii?Q?atcY9OFuNfxL7A2+vRlZDIuhF7U0TyrLly+T9a1AUy2zXeXYKle6J3wpZs8C?=
 =?us-ascii?Q?YpDYbBbgkv0FUjJd2VPesNpVQUViSOIzgzhqOkdkBg8dzkR/aGWCkDggyaKi?=
 =?us-ascii?Q?tcd7axe2ssITYJMmBa7rGh8eksQX6QTEV5Uz8Js8M0j0bNV+jqX28WBJ2s9I?=
 =?us-ascii?Q?Fpk1C/YTuuIPwKz9VlRmtGw/qSskdg2enyQbVBo0lZIjROr8g2xQeJM41h0V?=
 =?us-ascii?Q?j3AbwQ/UcVPWqnm1tDqrcQacANc7WH+fNYJ73xY14wnbEYpK/NBKD1Izu0oI?=
 =?us-ascii?Q?U/Y2SM1RqMJoP29Sv4Swv66IzOD4diFryzaHFl9BoyI+6aCHO++CCXCH9LLD?=
 =?us-ascii?Q?3KMfYDoGMgNYj6B+V08FQs/ZaZClbCwr1bIGBduiFacPmmsVnDmMe7erN7bv?=
 =?us-ascii?Q?X5mZuPsTAlZUnZP/b7VFEkwqV1RDWGFQNC1Xpa07IU1JisB4aYmOK62Z5T2H?=
 =?us-ascii?Q?jTdN+f9vs74a/vnxk7xcXVjZ0VedINf8795vh23KV7SjgFGC7LxHRIE4lR1y?=
 =?us-ascii?Q?gHVsxO+20QNeXtOcTKCHA8Ezr7b+f5UloTy8i9cfgZsJvGDuZY7K1MNgcNZA?=
 =?us-ascii?Q?e0bpHwA71PlX2/VIArDfiq2i3anKf+eslDfNtmbRECnjy5ZngQjrlUQPpjvc?=
 =?us-ascii?Q?kSW3qqxFSDx07FggWhgCnH7CoZN91SjOLB+7DGdSsrpSXZ5+awuUzh5BMuYT?=
 =?us-ascii?Q?tn4/JXwY01vr2RSCgCq17oMWheRbqqFqTe+ViI8dx6+SA0wo4uLSUxykmS3M?=
 =?us-ascii?Q?VCHenscbzCcdDLgpHLH/fF/bkCPjwh+oiRMPjyTaPwY19V0b5gTGEtICEAUE?=
 =?us-ascii?Q?H6CVks/SffzuNXswz7B6aujaycIXRfQXABA372+YBztj35/nvPf3+1AFlSKd?=
 =?us-ascii?Q?Mt6ZaQ5lbKrD6UII+fy8MtV8rCYKL7aofJMBPoPZijX0TDATTwLLctoUrknk?=
 =?us-ascii?Q?w+FrybnJ6OyubQCYufN9gk/T1EtqG14/5QpraDpKBgAQPakbs+TbQ8HzLmvv?=
 =?us-ascii?Q?TqOOUQ6UgZb+vlyFu1IqJGgzwNdum8QYzF0OlpqFM4kH8lzn1zsmvjN1DL/V?=
 =?us-ascii?Q?52m5Iu0H7F7SxUEDqS4d1abTxyECe78oNd4EdE3nUmXQNNOM9nlzJEcUwdFv?=
 =?us-ascii?Q?kD55rcnJS4CPRepm5Pm7nL0Z+pflUPDgUilJiK5erOI1mfUYKzRyT4cK6OqW?=
 =?us-ascii?Q?yc7mQUGBsGRyPqZeWnQJAduuMp04uhKs7BScVt/ll1He2QL0+/GP0XeDdKlF?=
 =?us-ascii?Q?hBQvuZTBMmWri4tECNmeie28z6IomlS6XXo5IEUieDHPq47NezpI5IAY+xVT?=
 =?us-ascii?Q?OkwyOU+oF+3gyJgV1jcRsRYaA5elhnB5+aGrdrslnauOSId1BMAu1evxxTIl?=
 =?us-ascii?Q?OsIqAyWtsQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c060931-3dc5-4636-23c9-08dee62975ba
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:38:07.8496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERbY8DOLR397C1pvU+stVCAorjiemqN+7PWx6juk6E2xMPQc+BaPR6gffJFdxtIlozmGJynp4fnWvgLiKNklMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8491

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() call.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 3143b9e0316c..91771747e2ca 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3496,10 +3496,8 @@ static int pmbus_irq_setup(struct i2c_client *client, struct pmbus_data *data)
 	/* Register notifiers */
 	err = devm_request_threaded_irq(dev, client->irq, NULL, pmbus_fault_handler,
 					IRQF_ONESHOT, "pmbus-irq", data);
-	if (err) {
-		dev_err(dev, "failed to request an irq %d\n", err);
+	if (err)
 		return err;
-	}
 
 	return 0;
 }
-- 
2.34.1

