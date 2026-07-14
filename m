Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013029.outbound.protection.outlook.com [52.101.127.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317AB38CFFE;
	Tue, 14 Jul 2026 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034221; cv=fail; b=QR/JbWq8xg/wEQxpdccXnv+W4sq5fAGkYkNWPPKe5IaZN5YTeSaPOzMjnxy7Ed3748Cauk4PtYwad5HSbs0Bm+WTWA4gxxdhTbz5YXMpr7pvlNUfpBOnyQjWiHNWm46c5PRkqjTm+OCrJjwTN0GWz2sZtSef8JvTg9y9TdK+yaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034221; c=relaxed/simple;
	bh=wRtMfp0SwVRBiMpoqIdnnT7C6nxVB98yEHSGnNSNNuE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YTqRS0OQJqtOvZeuUHBZWcod38HcL2b6txEbiacz1kUYeObeDV6EvW8rJ4nYsb7eQI6DELYOcP29krJOpUbwfKplzSxkbxjgDj7Sizvf/ife8aUVprdnkCH1tgA7E2Czm+sgPRCNvXywC+k0SRYug32Bz8lelPSrgfNi9RlWzH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=RqAevoxE; arc=fail smtp.client-ip=52.101.127.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="RqAevoxE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMIFTLwzowJhWN3B/2RzU40DY6fJnsGT/nOfQxvbPV3P8cKil1ZDfllNVjiO1uBZc4WfBPgL3CBJizliZiQAuGCYOBcIARlla07DNLeKhxKsre86F/MU5/SqQR1kWgQcx3P49gCXBIDKPcRSEwcBL9cGNbaG5Y63+OpBRs6jJ/VBZdYkMqZRfR8CeNjN5I8QRWJAsJKlgdX1d4Ppjv3Y711NPuetwxkWeNBvNwOfjkAa/OVtp1FV2JgS1jXdwPNP5UBYShv/kPIanmjKQmdp1gjBePs2f+K9aDIp14vf5946oaQeEbDglIa3VwVPlBdUaaLdt4EXlnrO/f1i3oR0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKS8AdBGqx4Hg4PouSq9poRjjvRaIMtOEV6E2TvcGrg=;
 b=RXaWJxZNs79tm31ZeAf2ZWZG4U2TYa1EcoWKRKu7ae2zHYtFhiuGPYn9Y1L+mmff/iRyBwJwA9sEwXsfbGk12S/KgTbLjgAscybpWU9+KIDT2/4Z+E+Ks9tTCWAjTizCJPTVjWwVrcZWegTQLfyBktSdhCi1Azww7lgqoEmkEsZr0z9hXBMAf8jt2V4UfC2vUk3RtMrSIm8ukHHZi3/3RKn+WngKdV2P1czt1TQuFXI7rJ+IugF9G51x6pJzPffx2WpaOarVfS9TIXn/fM5eu3gXYajgNBLsFGCkQ9UdlxhHeVSL/awztFV85k21d7/iwhLi6+3SSlyaxoKfhtVFXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKS8AdBGqx4Hg4PouSq9poRjjvRaIMtOEV6E2TvcGrg=;
 b=RqAevoxEpxioBJrJkUGcocBf7aUU0fkGtTy8QXmWkhFFKwaJolVbpTkiakGbM8ScglVOp8o+W3IYoQF6a5VP9oWG9O5NwDyIT8Wu1hDKLLD6TBZXmizRqg4jdocLsbS3b7sbwUSOcF7MN5iIGmus/vWFnQYhJmPGXpxu8cwPQ5WxjMy9rcyHU9lXxFOUQ3fTjuOqTpX/lh4ue70yVMq23eCw929fk7VnoB2tDd/t20mHBSdU87S2JrrqnCK/zfxHrx/g1KmIijsECZ6yLsOiBiDuYWdxOAhlAaqQCZQYaZR+pFpebLcetCztsSnfgKK6QY5Nr981hp+WhvznqwIk+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEZPR06MB6666.apcprd06.prod.outlook.com (2603:1096:101:17b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 13:03:30 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 13:03:30 +0000
From: Pan Chuang <panchuang@vivo.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	linux-hwmon@vger.kernel.org (open list:AXI-FAN-CONTROL HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list),
	openbmc@lists.ozlabs.org (moderated list:ARM/NUVOTON NPCM ARCHITECTURE)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 1/2] hwmon: Remove redundant dev_err()/dev_err_probe()
Date: Tue, 14 Jul 2026 21:02:24 +0800
Message-Id: <20260714130228.449233-2-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714130228.449233-1-panchuang@vivo.com>
References: <20260714130228.449233-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::16) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEZPR06MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa1b259-a059-4463-6efb-08dee1a84d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|7416014|376014|11063799006|56012099006|22082099003|18002099003|6133799003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	/DnQ2iicpMsWS88kJv+OejiZr8PhGRX2bd1hucMcXUp4Gd1YEKLfXqqIZKpNrnUgWToqDCROzt56NOcwloXvxv/WIcXMvPv31qW8VFKle00SryN5IZWDPtlk1QpLtdn0xuhoq8AgU3aPLfIDNTfq1Vucdv0P5jXxytQOTMdIwzC6mV4m2N24bJIXLwyJNLkrYEUo3gLlY6vZW1kZtaGDycc52PLuUMf2xwVSiWa8L0jkYxmPouYRwcDDuHhNqZ4eEDg8mLfccbghzY2sFrbGHFSXyVXbRtzpUFbyt3E9E3UJ9vESwaOmLuDNg2CxAsRtDc2d4naQIMG1AYSSILjYaoi8vPFkD5oyPLxEmOBe1gkhwLF3dyKR0DtEwfi8I2Yfp7WlUtjq0qYe0Fk9mc8hND/+aWdtggdJMNVeii5Wor47VunAPS7V/kzla7zw4hB7VD7ClETzCQniYDD89vr5CIDN/UPuK7jNRsueiZOtzaWGpHIVD102TlLKGNsGiM9A0OxvSK4Cp/rgStuIBTwaxK2ycH9wlhxkrNMXUrz0FnrMuJ7ojeOydBnHrSKvtvufEV7gtwfiA5Ki9r5ii4jg4fWHPV31vwvOeAvYXvOmncXvm/igtcIl81mBewJ+5xBGw1PJqlYjZH91LEUEUvoQW+y1Z8foptQ5QTYeqLqVE113RlXE++L0AD0jDATmzCknqrjwMBqyzJF0ZdOm1GNf9s5ekmtWgvpOSn5cM9uoS9L6Cp3ZIVVVyQ1H9f6ad9nz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(7416014)(376014)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KpF/fYA8HJM3Dms+M0t2a6SPEU0qAM8sfd4QPR8+gimiGxzIca3rn3HXggcV?=
 =?us-ascii?Q?oYKE3urEiBt/6YoJICSSThhpMgftoi9x8BPHE+9vGfHZMp+aYKzqFBde8R2U?=
 =?us-ascii?Q?Gorp/Pz1q5Vfu6B2TFmz4Vp/2+CALgqffw5+CEiJyuy7nr/jsRIW/O97ENd0?=
 =?us-ascii?Q?pqO/PKBwVxGihGhmU9xlHcCVzlgkOAmlGgcDqQP9Za5UDm+42YEpXerqSFXM?=
 =?us-ascii?Q?jUOfZXR38RrsiBv9SlbP1I1fS3lY6f19jfVkNHeFacWZ3/cO4fO12B61OaVa?=
 =?us-ascii?Q?8qNuFIUbF3y0Y6WsXvxHsHHokccnUY9XD3R1BzIz62cq2prwm2nk5aVuUDsc?=
 =?us-ascii?Q?sh5+yiRKpOqB7ygZH1LSGGSVGuvvds0H2Xnfmw+fCnlyfuUKo22x6xtHRYCY?=
 =?us-ascii?Q?SD+waIon/H3Z0GgKi2K7t4AsqRf/YiMfrvThTORfP3465NEjW2VBrOKCWgaC?=
 =?us-ascii?Q?j+qjvQOmsjuyMjlHNn9qs2qvKwXXDqSdwVzc1eJu7b3Cf1/1m1N9T+JqoGpI?=
 =?us-ascii?Q?0772Q0xmxVdssDtXR3s75XCaHsGnpmW2aw+ay7eLs0tb5BprEavDgz/JasT3?=
 =?us-ascii?Q?5gRXuNZ+gjT0Tq+/uAuLOkkseQjacIw00IQ5Q+7vzoMkqOfzGwk1fd0I1TJ0?=
 =?us-ascii?Q?EiCwvcDDZoy4bSashBI6zSqGCgvJ1RAo3QlwaGxTWph+yJQybRDjgfF8HWRp?=
 =?us-ascii?Q?SKW4zMFtLhw3nlxgt9Vi1mKFQugHdteEk+RDwoxvSLtGKfD69yB9oZPDmg7a?=
 =?us-ascii?Q?4dnQidOCwaAykZQ8laNqih6m6UyHjpviHptU1ULsqkgFRpEs/CWdwvtAtI8v?=
 =?us-ascii?Q?MGlA0tMHZ6DuIQzdx+9h/slyZeOqegf3NbGEMV5kp962t3zJB5PyKtmkIUZa?=
 =?us-ascii?Q?mUf0TqWlGPENiJA11CBhQbu+LxwJ0eVX3hycqG40satu62Hb3uGdCy+DUA/T?=
 =?us-ascii?Q?usRRaZHPkQnepgYBr1YofwA5yrKFFCyCqH3HT3hnpLOJ+LO39dRaAzvdY4hP?=
 =?us-ascii?Q?KQxaK9MVpxpwWDL+FqR/yrq8gsfk7i0XYI7IvvcMfvscUL3Ee7iy6vrjdmyL?=
 =?us-ascii?Q?f2FIV+ykPG6/maiGKA/y07i2RqStVUcqdwl1JpNtyi8lcBP5Asad35ILZqin?=
 =?us-ascii?Q?PVvcCpfiuUvndjfuf1fAS8kF+wBvUqmxdf77ziPZJw/vs8A7YxQnzyHvIEQo?=
 =?us-ascii?Q?doq39LEeXGKHKQewQxyAGf/oauAzmRSukb/kY7rG0CvlcBAQq+fq10AGoA2k?=
 =?us-ascii?Q?1GB4PeCQzgJ5gfoLxwCEkG4ibEw7wiPjgb/cctGp0xXH/YjTt3cCZ2+WYJUh?=
 =?us-ascii?Q?8mA2u+9DdPTnE8gv918kC9lHRRIn60o4PCqQGooRE2BL4J0QIyAPGxlCvfba?=
 =?us-ascii?Q?IlnYLN3XwJ7xk7HcUkMiWjrgKjY2684j4SaJ1Wz20onCN7FsGR6HUvX2JdE0?=
 =?us-ascii?Q?4HzhxVflTdmLtbVV3zK16zyz3jMJBdX+He0YA0CehIQJyKdC68/zTrBbzWyW?=
 =?us-ascii?Q?G0lVhtgQeMgihMFYeWeYzRBrCRyjBj9fpPP4zcJ45d1kN4PEKG4fyMNvGsup?=
 =?us-ascii?Q?9jQIwKn+qDls4ZUJsmVwBaAaB0jtE28nDSsvCiNwRAUsaARI2D4T7BKNGhLN?=
 =?us-ascii?Q?eL88IDrZu98BzJHt53x6fixD89MzjB066jtJTLRYeJVNd87maJGRLOUxdisu?=
 =?us-ascii?Q?W5etCa8bUHp2EEh+mSUDaTS+AOXPwg6kxpKShFyT2J9iVNmkXnEAseNHn1TI?=
 =?us-ascii?Q?mBzBKWZzwQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa1b259-a059-4463-6efb-08dee1a84d04
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 13:03:29.8203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u77HoFae9dvgxntUHMQnDLp2XqoZzo5lEw8JCTOjAlMafICy4TWxDTPK0Z5G/T5wbpwUIuT30KeEOqGYIAxZiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6666

The devm_request_irq() and devm_request_threaded_irq() automatically
log detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() and dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/hwmon/axi-fan-control.c | 3 +--
 drivers/hwmon/da9055-hwmon.c    | 5 +----
 drivers/hwmon/lm90.c            | 4 +---
 drivers/hwmon/npcm750-pwm-fan.c | 4 +---
 drivers/hwmon/pwm-fan.c         | 6 +-----
 drivers/hwmon/sht15.c           | 4 +---
 6 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
index 1cb481a1ad26..04a767d762b3 100644
--- a/drivers/hwmon/axi-fan-control.c
+++ b/drivers/hwmon/axi-fan-control.c
@@ -508,8 +508,7 @@ static int axi_fan_control_probe(struct platform_device *pdev)
 					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
 					NULL, ctl);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to request an irq\n");
+		return ret;
 
 	return 0;
 }
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
diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index aea0b8659f5f..df24dec78e77 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -991,10 +991,8 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 		sprintf(name, "NPCM7XX-FAN-MD%d", i);
 		ret = devm_request_irq(dev, data->fan_irq[i], npcm7xx_fan_isr,
 				       0, name, (void *)data);
-		if (ret) {
-			dev_err(dev, "register IRQ fan%d failed\n", i);
+		if (ret)
 			return ret;
-		}
 	}
 
 	for_each_child_of_node_scoped(np, child) {
diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 37f37813ea51..3b87f65bae05 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -628,12 +628,8 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		if (tach->irq > 0) {
 			ret = devm_request_irq(dev, tach->irq, pulse_handler,
 					       IRQF_NO_THREAD, pdev->name, tach);
-			if (ret) {
-				dev_err(dev,
-					"Failed to request interrupt: %d\n",
-					ret);
+			if (ret)
 				return ret;
-			}
 		}
 
 		if (!ctx->pulses_per_revolution[i]) {
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

