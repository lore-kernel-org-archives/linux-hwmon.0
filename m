Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2135.outbound.protection.partner.outlook.cn [139.219.17.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E109F492E35;
	Thu,  8 Oct 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454079; cv=fail; b=kD2KE4QuYqCDHvV/08oGD/+VZB1FUfKbugrt49aril9BaJQIOMHUjstv14IeXXgwRvUWkeal6JpBju7WG9os1DDDT7wnEveFSIWb0wAtbCM19vX4EfBFzC5sHvIuUAvII0OKrh6EwUyTtWxxXsjBuq8XSeZXJ2qjm24cbZGuw+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454079; c=relaxed/simple;
	bh=Ih73J9UzpTBZeBhbljCDj4c1I1D1xtGxRnP+2J/UTtM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=skDf5wP9SfMsTyTLwQAxB3OLPNorfHXOF1/JWZcGW6HHlrBjpHyOSbStb5lc1Nh3dDL4cZFVGD69BUwpfRvxs42+umo4EKxdL4/1/cCD7rCB/u2NLVXK1Q9VrxjQSWPd1ZXrYcyU1R7oiqXALecE42rkLKzUxvKoBko9rSTqpGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXiMobwbYNixhBnVwNbSOGro8GSeil3PpJ6MgHNkcGbGYmbXgwD3b/Co4Uca+cjiPW8J3kXUzLChXeXDGbyj6e2cRglAa4FkQ3cKWbrc30U7DZMbcRbcFp6hfd2ErlFW/XsqohRnfd8jVO7NJJ0nEXns2f3uB1yNynusLsxwRLB7h/QLXk9pIPuz/pVu4QDma09R3jEYhtW9KRd6bw78mRY7K2pT04DrdDs9/c5OqJygUEQe3Q8XV42BAadzapHyIHadIA1xFrrbEpZ86LGIcX6dCNUNhJSRdrUUjr8OSUEpT9LYO3K9d5jb7q4yWeI1EJQsEeCAu62LObux8cwYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsZlNFElQBkfATT25y909k7hh0N7JQGguSlekbFosTw=;
 b=hV1XBC85KjtvYQsGL2IbVU+6we40ANsQsN9Uaf2cYKHka6HVR4bz/bynBkrmHGqlfYjp+rmGWLD3n5hIFqARwjXrfkBvhrNnH9Ze7Tg7H/mXhHxi7ez+dPsbA29cY2v64jLZh9jro6yVwIO6k5shSgAKgjsd7j9SwVXgUFmsy9VpJijA9FLP6THVFt0Hf+Nxa9AH2iNMv6bnnvkxnuo0XLHPFJINbG4DRf5eYrT0ThX9sheWIoUbpdW7k1wtXLXDxqonWiM68DUBLfqg9MRUEpCBdSZkF4d3/swTy5f8GQCEZ7b2MJr1O88Lydlo9FkBGT0o8i612qLUzIJqsYmWUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 10:06:40 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 10:06:40 +0000
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
Subject: [PATCH v3 6/6] hwmon: (peci/dimmtemp) Add support for Granite Rapids (GNR)
Date: Thu,  8 Oct 2026 03:06:23 -0700
Message-Id: <20261008100623.7085-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
References: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0026.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::35) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1332:EE_
X-MS-Office365-Filtering-Correlation-Id: 2924bc2b-bd50-45e4-0219-08df2523d8aa
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|52116014|1800799024|376014|366016|38350700014|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	FTDcztOCT7vYkcYpJQOSD9ZRZWJm2AtfYSHFg7LKNpm4qVAUqNfjPT2M5v4yg8+dDZcreIsMUfqVn9p4ekDk3TycKYtAAKqvq0ogCE4alC4m6ItkI7zg9khsN3LZQyBhFVwuXGHf7ru7zZwkHolGCWey79TdJEqVt7aq5PYFwzl/88gndEHELN3StEFHLv94d0J8BRsSF1moY0FVeZjf+FIMongcxMa86xflZ2vvFX+TbCOG2a4T2xNUTwIQvpezPsooYgEZ6W/ZN8+IRYCwNIGmuxoFkogjm43Un8FseG2yGtXWXyXQbaHbDXN1mqaVNVvFAh0A2fegm95d9gBDLPO0tL05Xz6jMM8d4pczl7fcsf/9i2LtiIhb/iVe5vyYiuwJk5MaFZWj4bq+SCS9j32zSC/HRKp+1qonaWHyONi8P77/gkwLmRcrfUjE/22iZNbFafZ8lRyIapdG1Ix3vJppir+emvlKLgqoDWoNdX9bfcqjrmZ6lQHq+2bqJ5jxh5DPtA+EtStDtU294GnaG6JCWJydXi1qmeFOR2Z1IiBY25BEnopIsWZFMW8MJZ/d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(52116014)(1800799024)(376014)(366016)(38350700014)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XPZmlysccMSnQo4fKtLx0YkXMwzG8e/h0UdQqkklnHHqfUajgsS70y41ezWa?=
 =?us-ascii?Q?+L5vbXpPqn8/tnTjAkCsfyEDuL9O1v3e0X0gq5PeBlp0U3+KzotwSeAuNxXd?=
 =?us-ascii?Q?zykypD1kP+tCzxpsqDyYD1N/5isemI/chzWki/FBPZet1oGZhkIHAP/Gu5Sk?=
 =?us-ascii?Q?q/iJJiQpqEU2U07eq0wAQD+kF5743+k7d3T+oFGA6ydvqcQrwKjcQSB7F5y/?=
 =?us-ascii?Q?CP1uLWdZC2vl0LfSI9Hn54iw72dyTmi8sVD/jkrcD8vXRBgyc979D+0zKoUq?=
 =?us-ascii?Q?qaHb9PiNV1HMu55oU6PN2vbnjCyk+jr17+9NTmFO1BVaPf2a20asQ/Pfk/zg?=
 =?us-ascii?Q?dfaqX/MrLZSxq5bN8T3Kxae9jfksFDqg/queaZZ+bGFnjiItv2eIyCe1TDfF?=
 =?us-ascii?Q?i2nU/g9D3lakMskf4/gSgEn+0LDXo/3VntoyDqenPp3OuxW01wSGIKE736su?=
 =?us-ascii?Q?0fyQHHpeQE2JkZiM6knyvaMSj0A1IXCtGDmkouSZRNEIJxHQHSIiI9H1TP4x?=
 =?us-ascii?Q?Vn6Ys4nMjUvv2f+7yJmP0QRFlgLGTX/0uSbTHci7a/GKuOln/tPoIgPnkGE6?=
 =?us-ascii?Q?uMdLZsioFLrm5T/cKIBGfaefBfZoP4C3CxZ/yVUVK15x3bkSCyfIcKyKehp0?=
 =?us-ascii?Q?XFxCrq1nkozR8zE1qUv8fG43R+a/60sXbu53Ww7qgai/BIl7pL9rztTLhGw5?=
 =?us-ascii?Q?z5QzbcLsCOdWIdo7LAgvnD9AeTs8ox3Tb3vr/jq9ctAF/g2CF/bnXPLD20XW?=
 =?us-ascii?Q?RJAzef1GQp284EhFd0eZUwSCgmqnewSAHtWQXc6Hoac5yRTNqITf2KsIlLQL?=
 =?us-ascii?Q?iPhGWsifVdlVicyA2gJZ4RTKrI7qOBRWySR8uOCW4zBZUphRu34onitQ/lyc?=
 =?us-ascii?Q?BtbAfh0zNKeUfNRJGVdKEEAg+hWoRS42DWjrC8rWZeOvQJJsvura8tkBzGWm?=
 =?us-ascii?Q?0Qdy+X4wdIg3tDcHAMC+FczaTj1Av+0DK2ndUGSwyk0rTNdfWUSXnIuMuLJE?=
 =?us-ascii?Q?fdEsvC42ONZv4cMbv39TYBRdupnfStrWRkIXlKzQcRAIgcA8Id4lMlNwXYZe?=
 =?us-ascii?Q?ryAbovXcddIcMKvY85oriideb2lC6PwZpw6fnP+Or1suxX4atjievJfDgZwU?=
 =?us-ascii?Q?1pdDqmxl5ZTFONzIYuEVJzGkOxjoNfuuCnE7wblV4Tqytq28JHMKr1causXm?=
 =?us-ascii?Q?qUK/fJihKjLrD2q+FZQl82egAOAxmPWjvy7sn1TQ6XLOo05pex0yYSEQgji3?=
 =?us-ascii?Q?26rHKUgK+jOE+z1haEaRr29QXF6r6YyVrZ9L6JqdoPY/rGCjJ9lGfJFJ1Zqa?=
 =?us-ascii?Q?SoiHcvzJy8REXsX0cGVgTSIMWURq5D0VwbcB0fLsC2BNa/R3R4c9MGw5oHgS?=
 =?us-ascii?Q?vJ+NEQtjeMpszY29OELhX5Fu3mfLAxvlRDXi0y8lE+Olj633KWbPrNdPLbj3?=
 =?us-ascii?Q?a5PhSFmvEoQ2qVeRQ94ZcAeV0Lra+6Yb+Qss1+S3DQpNnipqD1X95DdfGlZc?=
 =?us-ascii?Q?agvbyw/KAT8zlgY/Ompk0IXLDuO6pfkEbj4LfbjnLgWyLK0hjL84RFp58oN/?=
 =?us-ascii?Q?Xfv6RX5teREt0B9WYLJq2r+p2Saa4HeDhfZfnXsza1vyRBZUSA2MycvMUufQ?=
 =?us-ascii?Q?pKH5pCoeoHAjJbAxWDs+cU3/Y8pELTNIAMxxfsqAj4WnKRMJKMGD7rWpt8Po?=
 =?us-ascii?Q?OBzcC7XTDxXmgc/TvcXo1lBUyYQr6T2MHOPMDr2F62sMaj+BENqYHz+9gRTr?=
 =?us-ascii?Q?g9lbqbPbJVwYc57GXAH2b0PkE/r9TjkbiXDdEhdF/DsLc4YAH4Lk?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2924bc2b-bd50-45e4-0219-08df2523d8aa
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:06:39.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37Q1an/lDuvI+YqeG3wbouwYGivlNqgjCdi3VhpLXUUoeyZz1CIf5VSTFBd+XU1qTSigJI5tsGiI36JbMieSLKXjXZgeUFUWrbj/erqit1d+ARPHY0T0ZygzUT0QCdKL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

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

