Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2097.outbound.protection.partner.outlook.cn [139.219.17.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5174E8E14;
	Mon, 19 Oct 2026 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410333; cv=fail; b=kIZO+idOKRPV1omMngxJbcJl+nxEQvMIxtq1tKSqClYNgM216pVIEPBB8UTxQIZqDtsndXv8c3iRSD26/6dgRdOjT+OZCTAvIDkzkJ7jWQDlQCYJCjeeygv+vjMuaYTduiCRT3hKGiFRK66uN8K+dT+ItMdims6ddg6ya6OKInc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410333; c=relaxed/simple;
	bh=80rvrA2o/Uvqako+DvsAFWUYMFuLnIA//CDIn501eJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DsEN75k8AkS3WijIpcXuL+bfm/zrOs6kVEnjy9rUsJwt4NgBHptKNGD4Xvz/vR6RAIxXVP1mdwVdEQdaQtKrdaqK1FE9fYbunc0zAJH8puaDXorYRuqoSv+0SZesv4Wm6A/FwMuV02/nwvMwx1ajpcAoCmqZXKlAEIzbl/wG9lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1IZG6WzssSqY2woZInrVX6r6Yaj4A1bf1WFUwibVawqlEIAsvcyrGj/wO9IOcirU0FbnrFmXnZe1xQXgb79G8cNqT1ub6I6M3/TVbgGmvp+Lxfm1EK0jIpPMm/8bYxoxsFpFw1wJa185x1xjDAR4k19+XfUWSSB6mTqsGpzJE17HuDthqj7gPZH/YhQYP4cKj8qoHdzpYyMswiacvd6L+s1sHopRksr4+R8AdbNJXnt+HkIbUtZhM6tde9tB2Y4CdBHXIv4fEvglSG7DqqrLpGHD8Vm3cLpi/fqMOuGX2Ey4ekLy48wR/o6h9GSNy8DVIbTfOybsQe1nByCbHh6sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bRWVX4xxu07vYbCSUpE6xxxstoNOTwwBCWWr0/g6iE=;
 b=fI3tplBHwfwykcJNh2i+1pMyY14rALZXXLBAfE5RrCbf9uGcIDGo8tSqxwdxD0e3KIkmH50HNKXWxnU8JVkiwStiyea+U7SYfZ66ZUY1izMNywn0lY1b5aQhWVnKwk9FxqoosT6+IZ+k3mmkUqGyT/P58pPP2n6D/u9QHjLVsQbgagBp/hy05LODrmNCxq7SdCOcdd+whpXtEIOxqkzVhNU6tsyh5TY+9xdOagIJmgwjm64dDQho3RLzT+KsbM5yER+mNF5gM/JKgO2RNfD8I750zA1Y6ANU3Fnnxp5xgIHe9HLU6H3OK/delCrtbXuSoXjYSjOAYselV8oTxglazw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1298.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:45:18 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.017; Mon, 19 Oct 2026 11:45:18 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v4 6/6] hwmon: (peci/dimmtemp) Add support for Granite Rapids (GNR)
Date: Mon, 19 Oct 2026 04:45:02 -0700
Message-Id: <20261019114502.55307-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0010.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::17) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1298:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c175995-1685-48e1-d4b7-08df2dd672bb
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|7416014|38350700014|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	9ILtE6IY7L9MwPi0TMii75FqI7yNFBujXbk/MmLo6JgR2iWErhiec/WtRtbjFR7ECaJnBX1I/In72bJYT0/bH4j/CQzS28M5PXyVLo+FNvuRuaMrFESCngDYy++rB1k1WWhWS0Qy1MTk4qd77pM+AYvfkCMFKkjVYcsNXQmFIAWEhdaFXBnC8i4tscSHHqhfH6k8tjRtgwdu+7QwZulqIaLGJ0UYqqqHOTwmRIhtnBH6FxYsLs3QZGpWkewE9Zfww6iKXm4Nb1X/WYAJf5+PXwukouuDHM+1Vb+fjryBEdEknT9JiyBtp38UfHvzsk/wtEqOEVEPpAtl8aGlaTUm6R4YGclVom9eFzOXLC4ocfAGsTP0JPpn6zjEt9hnePEI3wkDBlQo/bMeDcMtEsuvbLDYefzFbx0xMO93jCKqZsUhSUBlWcKiyiAh5ko2cOFs670KsP+QAiI5iW63UuPuU+4E9GsLjcsE/qYe62Nk1sti7Xz+Eox5ODtsrkfe6x/iPU45zKPzpNunwDshaki2UFSZr3VRPXLAo4DT+QCSvmfMVuZC5wYWsSvkD+fWNGkl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?afTXwoYQBtrWhVhIi+7U2Q+RL4Bwm2LXtlFNX2/+OOV7WvP8gqdDfU5KWAbZ?=
 =?us-ascii?Q?twllgV5BZw0QEZZf5Fruv/5MPU1v+bClcY++ucvVioBBYkS9NBcSb/67CoHX?=
 =?us-ascii?Q?QDMslT6MH1cG6wgJ7v07DV80YoZ8U77s838a9f5G02vjdxu2sbBkPyTVLz+r?=
 =?us-ascii?Q?1bxyjgloXG+ym9h0JVcjkJDxU5dQXCEW2gNBvMJbCeL4Q2Uzz1rGvgf5cxNv?=
 =?us-ascii?Q?hu0+Feoj4rYbb8dPVKNe2+ixO1a/aaXG8EtEJr0l/nx3XsZjV4zYstjvmd+F?=
 =?us-ascii?Q?hZfEoczkfI0XUQOgMBTbRyZloSsDJHzBnxcFEZyPx64H8zu6SntH9QhOsjJ1?=
 =?us-ascii?Q?kw4QOq5SfYVZF3RDYAGDYi+i3b8mTVRDJb92Bh0u98WOMwX7In6ojqzauFjm?=
 =?us-ascii?Q?oYwxu2j/4zlH2alK6YkRkum5gIydCZ+Ux4i01GdDt9d3eLQU7vgQkYWUaAw/?=
 =?us-ascii?Q?2Ej0pamRXOTF6XJx23OlSKL1AcIanmRO3PKwXsBMx0DR/SlgoaAjq4RSZ02f?=
 =?us-ascii?Q?l+Ok10eN9sQKN0fsFCQH/MilXAxFJ18F8zOKuXPQsZqexvBnTo/Zcsb+sz0h?=
 =?us-ascii?Q?lGvIX2jqOOt1hvZb0m3vr2PIkX0ezXRP7NawhAiiWjtZSRk544xZUZfGFfZL?=
 =?us-ascii?Q?QOWTMAc/5Z36k07yD2DBxr6qAMSw3UonSxnVs422NCwZvKxbXX9LEQLaEkBT?=
 =?us-ascii?Q?6IMZYKC1v+PgYrDNhB6KPyrcfhZJ2h42ECBh7Qy8qXIBODff+xr2+2XpVWHg?=
 =?us-ascii?Q?/9jkH3RUWJfuDN6jmUsqkapaij3ZyFERk9VbasIAnVMwE1vx3WTV69YflT74?=
 =?us-ascii?Q?wK4Z85zzANNM1GuKLPxzTOnHPCZ3EPTuF/4VNJf3YytzlQA2/EJ0TjPlfy1F?=
 =?us-ascii?Q?rcBal0Y+COfXCXBOXk12fjJvENH1NfetAtQQrPf5nbSH5FjpPe8qnb2PZZet?=
 =?us-ascii?Q?u19HOT4eXlbjhDggCUYolX5NEHkEj5epQ/pkMcrP49UMa1KW628iucgzS7v5?=
 =?us-ascii?Q?XfAGkr8y2hFB+uzqm6XusR13f4namwEWN0xwuu4ZB1CaOQ91lHXDPc6wNV6i?=
 =?us-ascii?Q?5mBKzqHA3zsHeTw18il3F3a2YqX5cLYLNlhRIpupBcdfQChpSc+hVML5WbCK?=
 =?us-ascii?Q?rBtVel365vkDzyyR6opAV6uveAM/4EsfrrEgtHW866OdlqKlqmYx7ppNew4m?=
 =?us-ascii?Q?MqDVVoQi8LwglcVRuHO07znsp1v6mh14nmOUgrSqd3od8B4auoJCAYk8W61r?=
 =?us-ascii?Q?t7tpLC5P9kTUI7lThc71aRRDepjDV7lseQVpJkkflXTz1SVBPn8NTUAjiotK?=
 =?us-ascii?Q?edbYcTUpZHPn1MNYeXym71iYu7oBK+yZmRjbTfvtfWOkAZByeRdxAoCwfN2v?=
 =?us-ascii?Q?J0DRB0o38WuqpMnQKaegwXSUKyQNbiDKzMB+wEcy+Mn/sbyHqFQbNaT6/s1d?=
 =?us-ascii?Q?pQBxZteGPSaGptL6PgA9+kI8ZMaoKDe8QzHEnIKnf+XGCvswq+9Zxs9Lx2I5?=
 =?us-ascii?Q?02luOoQ5+6kDwjSR051VkGnTTj8rKmTiQ0DaG8dcBpt9OgR0O5sR9Cche3pY?=
 =?us-ascii?Q?sBMilIw4HjKelv05zHkUTjYmeA70bnhAzvGjzK8pQCczfzp8rqixLYz3FNdo?=
 =?us-ascii?Q?09sS7WDU92v+Zu01pnoTMFSSUCOlca4rd4cKjRfvIEXgOViqN+LnJqg4XBUC?=
 =?us-ascii?Q?h9Sz6EFSTlPipdSM9rfKWuMhuEOkVagyZ5L+w4D78apg2NsbDYa69PgDJ15u?=
 =?us-ascii?Q?vUvnonUXG/b5IiktJSCMcEXvMuCHcLM7NzwohYB2bBe6icJlsJfU?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c175995-1685-48e1-d4b7-08df2dd672bb
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:45:18.2443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfaWpXowNh/ZcC3tLwEX//Dq/80qDDplwt/aI2bNmdacrJprPGLlNfn5Sngn62591O8A3JA42xl80rLti377uf4zW0UDcIRT1g1ffUbtXgSoG3ZAowWqNFBWxIm4iwms
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1298

Add support for Granite Rapids (GNR) platform in PECI DIMM temperature
monitoring driver.

The GNR platform has different DIMM topology from previous generations,
with 12 channel ranks (CHAN_RANK_MAX_ON_GNR) and 2 DIMM indexes per
channel. Define these new constants and update CHAN_RANK_MAX to use
the GNR value since it represents the maximum across all supported
platforms.

Since the current peci core does not support domains, accessing GNR's
DIMM_TEMP_MAX and DIMM_TEMP_CRIT via PECI commands will be rejected
and return completion code 0x90 (invalid request). To handle this, the
read_thresholds callback is not defined for GNR, and the visibility
logic is updated to skip exposing the max and crit temperature
attributes.

The minimum PECI revision required for GNR is 0x42.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 drivers/hwmon/peci/dimmtemp.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index bd3e8715dfec..791a8e866081 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -34,8 +34,10 @@
 #define DIMM_IDX_MAX_ON_SPR	2
 #define CHAN_RANK_MAX_ON_EMR	8
 #define DIMM_IDX_MAX_ON_EMR	2
+#define CHAN_RANK_MAX_ON_GNR	12
+#define DIMM_IDX_MAX_ON_GNR	2
 
-#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_HSX
+#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_GNR
 #define DIMM_IDX_MAX		DIMM_IDX_MAX_ON_HSX
 #define DIMM_NUMS_MAX		(CHAN_RANK_MAX * DIMM_IDX_MAX)
 
@@ -198,10 +200,18 @@ static umode_t dimmtemp_is_visible(const void *data, enum hwmon_sensor_types typ
 {
 	const struct peci_dimmtemp *priv = data;
 
-	if (test_bit(channel, priv->dimm_mask))
-		return 0444;
+	if (!test_bit(channel, priv->dimm_mask))
+		return 0;
 
-	return 0;
+	/*
+	 * Some platforms do not provide the DIMM temperature thresholds over
+	 * PECI - do not expose the corresponding attributes there.
+	 */
+	if ((attr == hwmon_temp_max || attr == hwmon_temp_crit) &&
+	    !priv->gen_info->read_thresholds)
+		return 0;
+
+	return 0444;
 }
 
 static const struct hwmon_ops peci_dimmtemp_ops = {
@@ -626,6 +636,17 @@ static const struct dimm_info dimm_emr = {
 	.read_thresholds = &read_thresholds_emr,
 };
 
+static const struct dimm_info dimm_gnr = {
+	.chan_rank_max	= CHAN_RANK_MAX_ON_GNR,
+	.dimm_idx_max	= DIMM_IDX_MAX_ON_GNR,
+	.min_peci_revision = 0x42,
+	/*
+	 * Reading DIMM_TEMP_MAX/DIMM_TEMP_CRIT over PECI is answered with
+	 * completion code 0x90 (invalid request) on Granite Rapids, so the
+	 * threshold attributes are not exposed on this platform.
+	 */
+};
+
 static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
 	{
 		.name = "peci_cpu.dimmtemp.hsx",
@@ -659,6 +680,10 @@ static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
 		.name = "peci_cpu.dimmtemp.emr",
 		.driver_data = (kernel_ulong_t)&dimm_emr,
 	},
+	{
+		.name = "peci_cpu.dimmtemp.gnr",
+		.driver_data = (kernel_ulong_t)&dimm_gnr,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, peci_dimmtemp_ids);
-- 
2.25.1

