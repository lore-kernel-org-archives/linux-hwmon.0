Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2127.outbound.protection.partner.outlook.cn [139.219.17.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700154AC17B;
	Thu,  3 Sep 2026 13:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442580; cv=fail; b=SmtL1CAMIKh6ySZg3gqLRPBgjRF9pkmSu8Q1baXaKHSapNGlJmc8B2X0/hFgatDqqyvSgV6tQE5jHnEXENVxWdWiXd/9mzzHN8plPItkQkYxt0gqElurzNhjNv1Mao7UnwMqjUfxC9AyA95YvN5lCDPXTYQFOnPzHafoMlphm+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442580; c=relaxed/simple;
	bh=PiwgMmpUi/EGHTpdfYhPmuGQYhBB1PRpx63IcqiFI7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YhJciLYTTyyPalPv0S7gSatUH0yMNdu4mZD/nwtwNSx+TvbXfPd1pBnsccfVKdKpfGeFF+SnmH6vsvCO8Cp9j0/k8G4IEipMHIQR2pAptIdyBP84zgd4+v74hlRs3TudkFn2ka6PYg3FvV4vTuEW6eYqBjpLtAG6rLJZgSK4fsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5hQ5eKvZdyNnEEYc1q2F3UMJYPcUhTSbxMzb863nzW5TPsHXNU0jelYRB8dHveeX0wGc8SLUWi8J5nJzd4b22C08hyhdXNqiNbQbPufD5p/RxrywoqpOETJ5/S8SXkbeoD+8LWMJPbOJnZvEfsCnc0Px39DbJK3M3q1OxQTXE9JIdIMbajF37Yg1mopHiBB9ajkowROYx8I/pWiX5movAI0C3pgMG0BdL3CjfTWhpUKA6JXO1lxm/7IBzyuEffjUF6F94RlLLPca1gJmIXIFY5maEr6awq5mU6ovigCvkU2wAOYK3kg4fX4Bq2LCgkAiWbF/NvbGTBdTajplbS4Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6WGLVg2atutgee+geWMWe/BLChpjyBZqkv8I+JJ7eY=;
 b=AEAAdnZgRvlsJPyJO1AhWKzx4xC695fPZzL3dimg1QCzljciVKr7nu6gCn1EBTKcBmjt36Y1DdNy8rrm5LU8eAHfor/7sX37kgu3Huy/UuTpHSJ7JPzemEPASbVJKDkd55QHMAWU110F5CocQlbN6kRGNPKD2k+UCMznwcnFiHEWsrdV1gF3dwVUGfoSaX7amB3VGuzjtcVBqDQ/V/YhUdDJF4olswyDqk0t5lAThvvcXW6oo876cFQi/nH3LcYf3P4nDaps7zYDxXFXbttqABoF2Y0duP2Zbr9lTud1SNnYHW3Y0Th6RsbaEhQH8Zqe2ST5TzaDIylFk9TajkTAtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102) by
 ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn (10.2.1.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.12; Thu, 3 Sep 2026 13:35:31 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Thu, 3 Sep 2026 13:35:31 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 6/6] hwmon: (peci/dimmtemp) Add support for Granite Rapids (GNR)
Date: Thu,  3 Sep 2026 06:34:08 -0700
Message-Id: <20260903133408.110847-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::29) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1201:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1e50c2-3431-48e1-d75b-08df09c039ab
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|52116014|376014|22082099003|38350700014|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	FRlsmD9YAe2LzKMjR6lnc3HNI4jVH/WcjIsgMNO6XrATiszNwFiuTZUH1Dh0USn2jJeCIPOzx6BHYnNYwBFhbLu+Or4wEgVHwgsHQ3SwMFe1O3epfp99THsrRee56Jps2SZ6LTbu3QCegkH3yB6TLwxxX7FXPqeQSXhRigoVKe+v1KOXke9M9iJeb7VsAlNXZjQVSgQJBhiMzn485KG3FHrt/nhvaSQqgONXA/r2sRD2PEgBriZCHZcdNJPYLfNodniyN+yH7fKeczHyBDSZYZCxB8trepTw2gNe86kIpnefs8SxBf4+pI7cY7IvsKj2l9LK2pYtuOtgXWGBQcXkQfMINAnAy8K8OWqebF0Gyi03nn8dH5Y1IpS6k6TTN68nBpCURppQiTmoFpVlPXInofyE0+KVdyOlr1ltuAGyVThke7hfkCV508j6++LNHmt9HoRZNrwWBU+tLZYj4M4UWaTWr0OVU2pV0ND7Fn0cW1sidmCIkQO3OJFH2esxj2myNH/CbfY9iU6hopPUZLjMvozTAfsq3R1OUXgqKakQMC/yVQhRFfpWuZJyHUsdq0bX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(52116014)(376014)(22082099003)(38350700014)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kdTvqwovKNV8o8oLxKdbX+pSonI9TskLZq45LI37eqnm0emvvOkAXgwSryNK?=
 =?us-ascii?Q?vRHEfrkb/XiHIB6XIwawyi5YupPWyrVc6DhZJAYbJUY1mVBP+SqOsUyv5Nhq?=
 =?us-ascii?Q?nx5qB1MfkR+8tLXAk0rbFewpsiucACNgVPROrfA6iH7vodtmcXk6uIjCJcup?=
 =?us-ascii?Q?fIF2/luIstQNP+7g6rN1hUwvpVGWIt0EYq/p9XRG96Q/yJOq7VL2slSYDeVi?=
 =?us-ascii?Q?cvNgNfMjIfI4OWb4OdOeRd31dLNnS0MlKaAzr9QVf0AJXsJqjHFp4D1IKGKg?=
 =?us-ascii?Q?k6GwlElARupOo2MotJsFwSAwX5ooS6osKR6Y9EcuciWhI9ZsU6NdIGxyyyzY?=
 =?us-ascii?Q?hk5vKA0MPJ8VQBs/ewPbZOW3g4SK+eLNBBBoU6pDK+22ae6fETgbid0mXNYQ?=
 =?us-ascii?Q?V9Af2O5Fv4GLTO/UlaulCQdDuISBSnXzboO3WcCgF9Ub0FbNQTgJyw6F6BVB?=
 =?us-ascii?Q?CZTqZjFJd/WNgjHrbCkbErgy56pw008/uVG8TXlrs94xQyGcR1Qk32D5OB8L?=
 =?us-ascii?Q?beheyktB0e/puYk8uHoJhVSLm/MG+FRI42JMmcpenERzvhQFaZlyr6FL11CJ?=
 =?us-ascii?Q?FpO+bBV3QQx613CadF9DAdm7s9FDxXPQMYhBHYqSefS6pQVPGF2jg1XNUUKJ?=
 =?us-ascii?Q?4BVs4N01AZgWj4HH5bkpSVc/1MOHAAeWb202Z5S2PN/iL7A9HWVxmelE4dlO?=
 =?us-ascii?Q?TraCu6DFelmzYEMLz/wrKWet7eIGpMIJlsal/et1Xjf0ageOJKJvVwxkn9W0?=
 =?us-ascii?Q?Zs0CFNqvnw26Ot0KO3cJBHQpCT+/221vDA/X+p/QlOy09BDC6GZJA7+PvG5+?=
 =?us-ascii?Q?+pkSzrWFceUbMd1hpxxB5+fZoJc/quksLOUMZIbNCI1ogsbTQtxg8LiWgiye?=
 =?us-ascii?Q?UBaMFTc1Fl1Clv1AuvgYFpClHji4sqVc9ycLfVUmWsAEFGXEYEkgh+GcEiCi?=
 =?us-ascii?Q?YDKoWxpZDyTnsa++Kgvqs78NEQBB/6YBRCSnbFgOeAReINCc1KJJBVCdpkUQ?=
 =?us-ascii?Q?blmwji9v8EOP2rfEw92GEOUOdeXL8DjwS6Nh7E4xL9AYHayUvtp1TtJSV3df?=
 =?us-ascii?Q?JmZJlVg7wLJbttC4L0ju0KoTpSQgVYa3OnxDW77rdDINC3G9Sxi/Hg4Wvxvb?=
 =?us-ascii?Q?nY505IMzklh45xMpZ0NAPpA7mEwyvFVVBEyUBlLHLIaF+2xB5FyIRIuv9zYM?=
 =?us-ascii?Q?wXYWaZP0Syrmz1FYOqerwMSfBh7o4VmWd1w6b8NkAzaTDWJGqq0FZtkiURNV?=
 =?us-ascii?Q?cOtBYzd4oQHr/zEAu5Biis2EZmzEvgWmuAW9YAkbKo3JTTuTCLzcAOpiWrzC?=
 =?us-ascii?Q?Z8X15eS9n4AfBtHEU8VaPO1uZoxLemwUJFFvPaLM0Ix3htyXIo1m0mMpktg4?=
 =?us-ascii?Q?PvaHNJei/HfpifyRkhQdYp8u62yDgHnNlakPeh64SuLB9zBmZF1JiTAdxCz6?=
 =?us-ascii?Q?Tr+gQApY4b5P1f5mnyfskF+4OkZjiqFXni+Zv8WT+SokQrTpw3vK4gG6KlI7?=
 =?us-ascii?Q?Z+7qeGlzSlN910e5Gxk+q7yLvL0Dz4nLJeUIkTx1TSJqpAKz7e9XUrDfopiz?=
 =?us-ascii?Q?fq4bOzNcGbx8WSQx3W4uckF0VLY8Kwb5aqtkMs6xG08Ug3nm8oqfKlXmksff?=
 =?us-ascii?Q?6/LnK/cBe8IYgJwUCjuHiAjPzImQoOqvZfmmGfjHVHIA267sQmAZ+ycSQQXZ?=
 =?us-ascii?Q?AAFXICoS87/AT8zo0sOt9KkIz22mk/06qyofo/TPwQ882n5Pqgn2YRJ5vFft?=
 =?us-ascii?Q?+psHz/D6M6oa2wi0u7FXfl1HfLOj0lxglY236Fo7dMRjFBbda3uq?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1e50c2-3431-48e1-d75b-08df09c039ab
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 13:35:31.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyyi9Ql/AtnEWzx4TQ1K4AEaGSyCZmgPgVBJJ92T9Gi1WmOhvwl3h2GKs29hz2ZIma7UcR/HrPbgUrkjmo2NgZZt10nwW5Juz011JqOvRp3NDQGhUhkX2G22bHR4wdTB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201

Add support for Granite Rapids (GNR) platform in PECI DIMM temperature
monitoring driver.

The GNR platform has different DIMM topology from previous generations,
with 12 channel ranks (CHAN_RANK_MAX_ON_GNR) and 2 DIMM indexes per
channel. Define these new constants and update CHAN_RANK_MAX to use
the GNR value since it represents the maximum across all supported
platforms.

I am not sure whether it differs from previous models, but on GNR,
requests to read DIMM temperature thresholds (DIMM_TEMP_MAX/
DIMM_TEMP_CRIT) via PECI are rejected with completion code 0x90
(invalid request). To handle this, the read_thresholds callback is not
defined for GNR, and the visibility logic is updated to skip exposing
the max and crit temperature attributes when thresholds are not
supported.

The minimum PECI revision required for GNR is 0x40.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/hwmon/peci/dimmtemp.c | 36 +++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index bd3e8715dfec..9e98effeb928 100644
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
 
@@ -125,6 +127,9 @@ static int update_thresholds(struct peci_dimmtemp *priv, int dimm_no)
 	if (!peci_sensor_need_update(&priv->dimm[dimm_no].thresholds.state))
 		return 0;
 
+	if (!priv->gen_info->read_thresholds)
+		return -EOPNOTSUPP;
+
 	ret = priv->gen_info->read_thresholds(priv, dimm_order, chan_rank, &data);
 	if (ret)
 		return ret;
@@ -198,10 +203,18 @@ static umode_t dimmtemp_is_visible(const void *data, enum hwmon_sensor_types typ
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
@@ -626,6 +639,17 @@ static const struct dimm_info dimm_emr = {
 	.read_thresholds = &read_thresholds_emr,
 };
 
+static const struct dimm_info dimm_gnr = {
+	.chan_rank_max	= CHAN_RANK_MAX_ON_GNR,
+	.dimm_idx_max	= DIMM_IDX_MAX_ON_GNR,
+	.min_peci_revision = 0x40,
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
@@ -659,6 +683,10 @@ static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
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

