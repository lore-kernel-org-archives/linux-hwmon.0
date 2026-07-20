Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012009.outbound.protection.outlook.com [40.107.75.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725D53998A4;
	Mon, 20 Jul 2026 06:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529489; cv=fail; b=skvWfxnMB/bSRGq2IYR7Tr8xDNbzVAoolZSVHQs0QwoTQmCGXZSaXXYGXUeabzaYKLb8YM6BSaPT9igCO15kz0niTKzgpBlw1etCcQNdR4QBryskHbDxcyWgKyxDz/9K1pO5Gm4XeF1dRkFEU722SdO4m5DF8doGvgBD5LiSp7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529489; c=relaxed/simple;
	bh=luEQg9qzaDUtuU00470+Tae0I8wGH1pIieLvj8haSes=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bhEBak8j4e4MYoQEuu8q0+kYLrIe3KbfkfGNCzMaxk4NFqFQ2WuGCJ9qdTS8e02tT1bNBfs5JBLvSnvAjuXzhAlGwz8p3OW2x2R+JwvI9je3AXs0kKMq+1nwAhF7/avb7esntAhCTysq1YpxBCbDhZC2qP6HD6YpK0WfsoLl3/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=N5m6Zrga; arc=fail smtp.client-ip=40.107.75.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="N5m6Zrga"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwCvwePHLsn0KnzgI4R+A2Uyg1wBKQuZXFrmxdjJkxmogbLAVPRHi6tl9E2cKDt0MRdioLr1S19ghu4WRwvNR4miRq7BU4dLzGYjtwJgpzSrs13qymT9lyKgNU4u1kUTMLcDijHev6wX9JI0haaOnTPlLiPJ3MZMIIs4Xs39+N5mNKERevVRkIwE1Wx+A1E2Z3xwormuNC+afEsdrjP5+uToSdoRH+b5WOiVupfDAYlSLCmQpK2Wbp93EJE4g6keLe9DXYlt3T0TWLig2Zqcda44qFuoZFb+vwyXqO3Grt9j3ET9UrtCBOJv4FowoYsdaoj3l7xTwk1MVNn7Au6mQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnEibpdvKjlQvdG/Oyp4n/x1tUO6x7QIDLZKtCHYlPA=;
 b=p79p2ZkTAQZ3f0YTplerVvSiHxGrDeRNBTvYhkOjjp998/worCIeo+MFVr80rAltKkSPr4w3E0lnDJz9g/oPNttYwxMEZYzH7fKemDrppE69mctSTvc8SQ/JAx20FPNY69qU+CaAXYluFOUMCcvSeVfLP3/mFIe724Eex0rErow7I0Gh9doNOxByksECgOdz2v4NOnTTZ1AZ4zldiB7+dyWGsGnNmC9F6JqZhAfQ8MdLBzH7OEXrSwGcKdF7r4auVLFb+EKsLTjgNabYyJS7biHEZkn6vG95sDFZCapHUWzmVxro5HAzvUAfL/YG6/ZIBAFHU4LPnOSN9nWIo/6YJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnEibpdvKjlQvdG/Oyp4n/x1tUO6x7QIDLZKtCHYlPA=;
 b=N5m6ZrgaYmqFWMFRQ1TBsLPcRbQ+svnp+In9pz5qaquW0hoeTYcACNtqwWukh5m3D0z/dXsgAyp75bshSjKRVCoI5keXcC3W5CrdyiAzhhdVtmciEvjHmTVsXnYZaoYi/Z2nueSnMM+LuijDC9Hf5HtwY8WHeV9+G9kkmbqOFVkSQyLYOlvCuzJ416eFaD2xwPRaKDbWLshBkWGzIH/IoRis+wgxQ6ScT8hCnXheVYz8Cl+d0WuIgmjpEwlS3E4ickLgHptySO8E/bIOF8U/ky01rnsIp+/zF6lSn4pwQieeNacPtGmGPrJtyH8BZK5nm9FeHB097hjaeFeDNzIIgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI3PR06MB8491.apcprd06.prod.outlook.com (2603:1096:4:2a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 06:37:58 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 06:37:58 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Support Opensource <support.opensource@diasemi.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH v2 2/7] hwmon: (da9055) Remove redundant dev_err()
Date: Mon, 20 Jul 2026 14:37:36 +0800
Message-Id: <20260720063745.309331-3-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 22bbc44e-0ace-4b46-b1ab-08dee6296fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|22082099003|18002099003|10067099003|56012099006|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info:
	NbxdYB9LFE7ZbVWerg/oO9csFS9ra/mbgTWvKBoHC+oseaMvp6o63Pp2V/t4hiZmyojzI6KwCLWZYEgGJsSc7B1JiZtACaMPpqyFnLFOK/kOxo9vcFkxHJ33m3y14biGETuzmCyLHeqM53tuA2/0nTRQ3yIMBzsbt8CcV646ZZgzzQ3ImtOsHwoxuQEzgCTsBp/suv+F93IaZ90t5FZeTbdasQjexUdHEIJF3mZGhVNOWETEQEzSRUMozNj/OlPTUVXUxBRfobFHKcDmc+0atSo+Jd8tTimJYCfnnM2JPHmYZKcNPuT8BjUPx8n2jVGJ2dtSa8yRs+O4sVFwIjYh5+YTh/n4pLKbEEQ6davM0ofycvpTwp6qPLVYLP9SsoPyqMVquWnj5qNfy1YwZNll+8ZixqyAcWQXQWzcZxvwr3Cbk6NNFTG0KPGsmso49ZMEu2Ubh0r80Alshkp5egosoLM5DAq5CQ1ILSOkGBRtl2RStv857XO4mDL05Sy/ch7Ql0Su4ztkMO0bx9pNzKWj/YtuHQdBSY3nBZI+TzZIEfqAR8AYXhcg4oZzzFJlAXZUdR3V9zu2894ZC/FXImfB2HbWA15QRxN/8u1dKwKKjChO4cbim/KxWeJeYk8I249qj3hYTisY5NbPpClNDj2g5cfD3LXTYOqo7vzVor/2TtxzuOizSnhx7hjJOKRqBERON6pewCTQ6XZqAvOhO3LZa+22599vJjTowAaIb96UdWM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0Lhmauk4X932nRkspG02P36NElWTippEArx5KkSVinORBF7DZpjdUQhFiAPB?=
 =?us-ascii?Q?quMOeUG4KoEmSi/n1T9AlCakrvDrmAKk/mV8+8YWwEfK1kXvvki/37wHPutP?=
 =?us-ascii?Q?mOKh5OpsOSM0eSTjexVSGlQ/8FxFqMQgclJbHSMd7sVl9B1vnR+QCf6AqkTI?=
 =?us-ascii?Q?kNbrgOef02IDTwvvYPoX4r6+xwAn17AYGLL/gdBaDPNSJLUg/bfQxwGC5oBB?=
 =?us-ascii?Q?YoobYYLhCVTPKQYvPF+yngC22aPgT2SWXBcwOyfDMyqDevHMGushoqczEPnV?=
 =?us-ascii?Q?N28YhT40m0yhcx5vyRjltitEbrEpC/IZX1iZFgg/GGiYrnZX83N1MV9uP816?=
 =?us-ascii?Q?m5jgGNDfARts4rMu6bE7iHGdo+jmMMmu9H1mNSjP+PxBhmUJzliBTuTl6S9l?=
 =?us-ascii?Q?qeLCHOE6IsCV8JP5ZX0Y8h7CmlurvAy2vNb7pL42PGS82Ebg7YdufIiXEl5w?=
 =?us-ascii?Q?3iW7Ufi6nlFQsA5L3XtUF+uOGswlx+1lmpK47N2nEL9SY6kwPxF2CkKCmHGl?=
 =?us-ascii?Q?4t7a5oPnzATo8kR15y6DiCfwQ7p00kVknGDtAdEI5c3NTXFZJvzmRh8+8UJB?=
 =?us-ascii?Q?YrJV0xxfTKnwziGgkRjd+erPpNgmu8K+ES9I+R1YKNDdjwpRAh/OQNaS7hC/?=
 =?us-ascii?Q?3hi/zgRzRHLjQeM/k+WnO8JI7e1hE6YaEhbJw+yNIbQBI/bf8FmW+0rZ6jLI?=
 =?us-ascii?Q?OhKFmETGSLP0TurG9/ov1yAPIQR7B6n6AxyEcyRNG/fXjaUlxuHkNVWiecQv?=
 =?us-ascii?Q?bcrGgNEd+PHdv69tha/xvrGTQ8mToOgFGRXF6KsvtB8b6Rw46Qur0lnDWruV?=
 =?us-ascii?Q?feyMCkzGgs8gLPuKGqlxAWMxp4kP49Sne+Ani1AxFkQWdeqh0667eRoSe798?=
 =?us-ascii?Q?2asRvgU5n7VKr7ChJbbr1EP2uNYzNsJRw78CYyN2sDce60NLOLKyQI519C0c?=
 =?us-ascii?Q?/mUsqCOaeihPFsd+ah82RCVOGMLJoOsC3tJ76JRZUkCZYc+7JWCzRrE+/TUb?=
 =?us-ascii?Q?hdw6aIxXy3UCilpht9pdN/CV279W6Aueqwk+dBmNwDzpOPDmXNIoHl8zmbsH?=
 =?us-ascii?Q?2QLI4lXj24gBf12BXCdO9eXaJ8y0UcphXKJK40SqtLAU5rjxO4ngaQk1FNP4?=
 =?us-ascii?Q?yGjg41OBGsEG5vc9LekMrL6E+vMFTgWBSnIpa68MVhqGnKyqF2ah7s/eRidj?=
 =?us-ascii?Q?7kZb3amR76Rd4REFBXto5/m4bbusnB/1A7bG9HghvMlJ66cn0R/X8+WMw0Z/?=
 =?us-ascii?Q?qpZAOjTbJdKOvZqb2D4htnbvTcKEiK3gXlkZo2HRmlwIQgL7ziEoCFDoCHW9?=
 =?us-ascii?Q?B/5piUQUDf93E9PPQ/Pp/QGD2i4BpfL+eUqFYcdCXyIUwIVytf9BQLjAPSwa?=
 =?us-ascii?Q?soXK2Bm6nQDNKMW0adJ2aA5Hn801uwevXFyTGH7FrmjaHBr+eziEbIrW8fXr?=
 =?us-ascii?Q?iXE/8WcDh+qd6ZpKOYQTWalOkzPmseM6ecjcnhLkpuJzSZjYOfEg/ol42SKO?=
 =?us-ascii?Q?nIrxojw+PljNdqgnHC5pXGxfqUvoH1skqpm+UcnebbeZNHCPEhA0yNBmwLhd?=
 =?us-ascii?Q?/+CWN10aM1hSJLVtvIuoEWqz0QHsqLHKwglNEo5iacGsHLfF0yU8XLV8UUwm?=
 =?us-ascii?Q?XEhk5pMvFXx7FyrzoR6QHc95j52nIOA1b+8oITghEg1qs14Wb7AUwA1EXVuI?=
 =?us-ascii?Q?CEajHrmBVvEdqm+qj+4pjmRzYCttun9P9gVAogI6XczuSIzjbgo48BqyyIyV?=
 =?us-ascii?Q?tSA0R8wqOw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bbc44e-0ace-4b46-b1ab-08dee6296fe1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:37:57.9987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: my4VfjzBQW3gmgGfMpFWFTiVcnLn+VU1oDmdPfLfuS9Qe2ffTYB/9TFfTxgwjBkoS1mLujyzjCWxxwcg4qzyog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8491

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() call.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/hwmon/da9055-hwmon.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hwmon/da9055-hwmon.c b/drivers/hwmon/da9055-hwmon.c
index 7652d553b8ea..7d330baa0f05 100644
--- a/drivers/hwmon/da9055-hwmon.c
+++ b/drivers/hwmon/da9055-hwmon.c
@@ -256,11 +256,8 @@ static int da9055_hwmon_probe(struct platform_device *pdev)
 					NULL, da9055_auxadc_irq,
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					"adc-irq", hwmon);
-	if (ret != 0) {
-		dev_err(hwmon->da9055->dev, "DA9055 ADC IRQ failed ret=%d\n",
-			ret);
+	if (ret != 0)
 		return ret;
-	}
 
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, "da9055",
 							   hwmon,
-- 
2.34.1

