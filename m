Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013071.outbound.protection.outlook.com [52.101.127.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64E33AEF3A;
	Mon, 20 Jul 2026 06:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529502; cv=fail; b=ux2+AX5H92gSCD8VUHgOMnnxcYgXgr4QMTyTlAdtiM+waOqFL9IdqSR9/y+nElMUyKcbULM6FnZq2XVijZ1Z0kZSDsmwpESS+ikpamOGUPI2Uup0YJJdRxjg9xihXTwhuqHCgjVOowAbo8cdzyaBNCPfsJo2ZWh1yXCRYe8gTSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529502; c=relaxed/simple;
	bh=MZrA26s1tNRnmWgaCeXYulLZP+DLd1ziHtOHS5rj6bY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KYAfn4FRm5sVx8VNypdlrWxc2eqAKG8qyiHdtJcqlbbueuZWVLr6hBE/3ZfBiKzk5VwtqulQFt0/ZNRjhxB/fUmXNNTgX2qhmvoVWCy1X7FOB0G/zGwQ+08vdduFmt+Xk1T9uAOeo5LDYehGfzJ5j+DM5aeQUkQQUOyKsQEgf00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=n0rXm39X; arc=fail smtp.client-ip=52.101.127.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="n0rXm39X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTXGC8zGqYHtr3QX1IJZdYXvHanHYCNasfACFth/gglF30+LKol5zF9A01gbtksTZJ+lXwvpRKK3Ls72xDtnttKe9aJTlNZSucxNJ6qlnv0oH0BlCx5hlmVaMr8gTB5Qy9xkjzJPkIBqt7AZHGS/3s4oQZmGfnDa5A7mw3Ln3+JKq5dEqRyoUL8fHaGbG6XzB5XCiRmFCyPc5TqEabn0xyrnvHanxa+CFWi5T8kzQSj73+9Ag7vr3ZDp0T2p2pyK3uyU7XILQsLjRpymPuQz5AHJR/oXR0LSxyUF7Ks86/WOgXByNUUN3gNlbyWkjhadccs6vtz0i/F2g5IhmXp0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yh8aT5Pe9fnP8UO6/Z47h7aE4Mopwb0oR0OeU9tx0fI=;
 b=WN+nO66qeBRa51QDKAPMcPjsWu7e95AYkdvDC73Ko9OxU8I0N2jMjw6mYtGN/kYHJLxDusd4BS975WbceO4gGKbf0HoCl9KUdjc+3Ln8f7JawzK7Z96isdni3EO+IPtMek7n08ffWIml7x3sby/v+osopF+TjWILe0L1yrC6WYsYJGWaJHDjgr9SasxZFC+SczqcOwVXCJAuNbjhzPIJ0jVSgNtLQ+4eE2EA8AplbymWHtVWb8m36Tba2klT5SEekxkwvjXFrRq1FSpG6GQEftYF71h+ZAHvPPyXDOfTF3cgCKA0RzNhcuvK9QdUIpL8KVuiPaOJJ24KBcY4/d4wtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yh8aT5Pe9fnP8UO6/Z47h7aE4Mopwb0oR0OeU9tx0fI=;
 b=n0rXm39XCCien8vFX8vn3PC8YgBzbiDxCflkrQJjbdRrECOxDGy3mOhIJcPP42uQfrWiWp1Ljfi1Eptnf59//59V8+QBd0Nv6jgwDHwWVJZAQseHIrhQZbFqIq1unS/ojm7EFzQE9eK/RXaf1U2dcw3pJlkL6cK6HaROdxisg4o7j5PG6+aizfXKXNCXXxDofn/JDyz5STnLVtwaxY4ZOUUHF2nNgSEhL+l/CwSY/IuQNTHiGTHJ21l/CicURpQyQGJWx1t5gvYgaM8VyqFGMbKe8qlMv1OogGbpr30Z9XYkLBG0UByYI0f0FLX8jF1kVwgyViW1DSLZ9fvMaoy2/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI3PR06MB8491.apcprd06.prod.outlook.com (2603:1096:4:2a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 06:38:03 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 06:38:03 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH v2 6/7] hwmon: (sht15) Remove redundant dev_err()
Date: Mon, 20 Jul 2026 14:37:40 +0800
Message-Id: <20260720063745.309331-7-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: df0822f5-6225-442f-add1-08dee629733a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|22082099003|18002099003|10067099003|56012099006|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info:
	FWnU8R6I1Nn9lVUFBH1FpxuakSMNQKr/yTgADhAGYB+ChPjUvysqZMeoXbL7RY44xK+GzM5A7FaWYybNebm218QZAvqT+uzCVjZWmHK7REqboTN97WVRFaBlI+D75sfZtoUA0qqYt0ZbqMjSETiwbtwQ85qO4wOZCMCCWH0tclU39Mgt66kVKxbwt07qVEdJkI1ZFj90zhyZ7V6UrNg4yyxt/82Y+hp1Wvn73rAQLvEUU+mWjpih36OdMMBBk35v5MzC8ZuiJPEyiBeHVzQjYU/qwECBfLFG1a1Iq90ec4OMkgfFRJOkJ3RJmbJnLy/ju6glg7pemIZ9qLdZszzBOCKYrdGp+yXVq1MArz5svoAMGMkCT8Ra75b2lnynpEJ4j7NrVJP122SXw8VimkjuR3VoiepwjNMjQtsKjX5lT1WEfENLjMD8NoV44RhU29HL+QearWZdJsfm3knrE4vDRu+trI3q2w566I+W/chyECt+uzlJwckIXD84ZK2k+fS63bXM07wdPVZ8YFyVcuREaVAUEdilM4BHuCGrPC32nN5xS+2fwI8fhIAQ014dI0sRlM1u9lKj5TVW4q3fC8mvx5OuWhECKncpTauTVNLBjfXoNXzUuiTQ85cs08u1S+9OroVXY4zM3BF+Ks45k07h5uRaqh+ctHn/buXuxHGTNbjeSVZZcaXBypsQcGMVeoEVsXI9dZqSbt6j4Erjdk9nfsqxbNxNFRco8nZmWIRAMr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7gfpEqHCK36xEJjbbZhXbXT6OvcomFcQNYDOTIjJwqL3rjfQMVsvkWZhOoSn?=
 =?us-ascii?Q?X2J6YkclWUAasHCqfh7FwrOnYsA3a4+1LOdUM/Z77lFb51j30KGPArqSWE8a?=
 =?us-ascii?Q?hjSq39ARQyB7lda+UA/E38T+Xe2gASiM1lacd7kFxzug6zVzMMayI4kuMWb6?=
 =?us-ascii?Q?WINSkIFx67w5MRuTv5pI2BoZWecNSjJvakQBXhmfqhY0YYzPLlkdzuGWMOwf?=
 =?us-ascii?Q?899im8txQER7w503jf/UXWMECRkTR2oNCB7EHiUrPY9Y9dLviOTXR4VrkX2T?=
 =?us-ascii?Q?cK93crk9QWbYnD/04O3taMJWgB6KtudhheXn3y97FR9YyZWawA1oj9PxS1zM?=
 =?us-ascii?Q?UeyaqJTILk3xcJMQ9Hyp9J6CtQgI+I+U7El28yapEx8sBWlo+Bey6IzofkCY?=
 =?us-ascii?Q?ueXLMIhyS84Hycel6iNTyHCBA6uyoOlVH0NQhUyCgf5foLbU14b8g0Ckr3VT?=
 =?us-ascii?Q?4F+D+TGB4GrdO1jKv9AISsl5szMff9HdWagvN4IK+eSYx2LaslSxw4/UZNUe?=
 =?us-ascii?Q?2GAO65S3Inhk8SmKaUkZ3eG4G8zWhrN+SjJPrpnMYs5RdB7uvDgLESjSzF6T?=
 =?us-ascii?Q?FtnTmA7/vEXgJWdvIK7ks5neNclUaJUlo7ekpCWG+8OOqEjgqQ7GPOz9CmmX?=
 =?us-ascii?Q?LkQHDq1osbcL0cUhh1lf+mSUQRjqOVy3SV0xkdDL3vrUBdZ+OXDpIab7kZ3i?=
 =?us-ascii?Q?g+rsp7CBsuIEGyITMXymzgrnLxu/7ShimSyKcmXUARiJisw190yV3FNgXSEA?=
 =?us-ascii?Q?Ml0WUpjBz2yTD08g1juyhcyhgWcNKx6WTMqS3QmiwbcOEp+tMTTuTo4cZ5n4?=
 =?us-ascii?Q?YqxcERGk/aZiZC+Jm9lS7wfxzOzVyXfefPhmoLDSoRlhtJ9hx445EwywNhm3?=
 =?us-ascii?Q?geEipp+ueMqTPtExgOI8lqtZbalvllv/jBbhgB8UjGjZbTuamuyGpyLivht0?=
 =?us-ascii?Q?VKRhtcWIRQxzsHBgydq6dks1NMtKA4Hr5BIVkkJz3V0MBEsQL29SorqvAAE1?=
 =?us-ascii?Q?Afr/9DkGZmXPcV/ui7Z5xBAEMroZQuduaygE/jjJHFGwvP1jAQx4RHLrxdNZ?=
 =?us-ascii?Q?3EPnyzsDpZLzpVVEZWjs2clih/PuJn1t9lIP+kcl69e3Jnu3EBaD5z7TOZl9?=
 =?us-ascii?Q?sxSSbHQyYismxjKLmx1b8o5D++xsLZOd/BI2K2AenysnBZ1aXxKiSrcJh9Z4?=
 =?us-ascii?Q?QySrhj48iw7DTDN0l4BQ79Zd1y59qNzWNYyUPnrpbyFcC3Q5shOMaov0ct8i?=
 =?us-ascii?Q?opMNiXrz+rW2R6eWQdgdBpkM0pqmEvHAfN59silGdZs+Rslh+LnCDxO7RgM5?=
 =?us-ascii?Q?uipjkl64qADpeamAz1Ll9/0h7cOJ8wxumyI6Hau7voK6duMMKbBEPJiqJ/0N?=
 =?us-ascii?Q?gQrbbJJdTr22Rls9S9i1UawBSVdCaNv5wMJVqE4JwHpUOSstdg2sVINth0Ue?=
 =?us-ascii?Q?FrLg/NuaE2+V/weX8q5BuJTYL3wrwKvgmQ5iZYlY+iyYlN8qeaySLQGCRLy1?=
 =?us-ascii?Q?VZ1RShkzmQ/RJBUhTDyUaAfniSZYMMz3bpRQtRVMi6VV6yY/HDILWrh/X0mG?=
 =?us-ascii?Q?yEFFxvbHGU2foDtoD0MR1vkwilYFoyqaloHLdcTBrU60UW9ILdquABzXYwSz?=
 =?us-ascii?Q?orDL0wQRDD8jh0rE8gSPyFsnWOERMU+YML9GicwPkwEjwCrod1280NiSEqch?=
 =?us-ascii?Q?TeVyWQR12pt5Jubs0oSDp6rg5lVzPRXIjKhUCi39neqNwQ9eA3Cg28IrzGYH?=
 =?us-ascii?Q?0BATY+GNVg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0822f5-6225-442f-add1-08dee629733a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:38:03.6578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYuRYovH2PHd6571M9YUOAk9A8qeK2N28H75/UDZN0oq9+dLga9J+m0Z2NBY1ygZXpvVLJUpkTcaRtNQDfP1yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8491

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs detailed
error messages on failure. Remove the now-redundant driver-specific
dev_err() call.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/hwmon/sht15.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 101cebbe68e4..7bb2105d1ae2 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -981,10 +981,8 @@ static int sht15_probe(struct platform_device *pdev)
 			       IRQF_TRIGGER_FALLING,
 			       "sht15 data",
 			       data);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to get irq for data line\n");
+	if (ret)
 		goto err_release_reg;
-	}
 	disable_irq_nosync(gpiod_to_irq(data->data));
 	ret = sht15_connection_reset(data);
 	if (ret)
-- 
2.34.1

