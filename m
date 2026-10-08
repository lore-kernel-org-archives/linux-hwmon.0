Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2135.outbound.protection.partner.outlook.cn [139.219.17.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1652394EB0;
	Thu,  8 Oct 2026 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454089; cv=fail; b=qs5+lxl2Or77fdOaLmz6TqN3Uss7hNGyioDMfcCNiYylzKEUKOYJhnit4WyUiJk4jTJBmF+s/URePly1OJEltOWgy5kMVhln8gsQW0JDBuoK84GzgCucVOFBRA+26A07ocnEso9Zob39MjQAXzEUW+yrRCg8EADlaljYomA86cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454089; c=relaxed/simple;
	bh=/0d0e+ZRiw2zbtw9/eUE8/TFZcjiRtQh/oJjcSUljkI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FY0//A89+MdlJBMmew2EXNX3V9QhozbHXOUMjQXyaI3un3yMNrSRaLbOaGgFaSCUl7c/NBvQlwFykEIFS+M+Mj0Fh2bNpZ/NuOLnl4C/Flmd04q6zDOFBkObCJEx3gIEyd1r1HuMHQwYkv5tZnRC6V69Jz7Hwfzbmbr5DTh2HR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+zoxbQQ101Xp5nKs0ToqYedC88HTn6LuhDhj9DY8hrQlpIRMUFzS6WhYGT9hYHHJZtvMS5syXShOqkY1r485EtsccfDMzPq8dqulzbGQrXyqYjh4AHjlC88bsJb8q2emuPc7xrDHWYGobt00L5NYrPf2Ni52w24J7pYeMWu4X5E6g7lk737UaSdURa0k+oK5PTZ52MNuXqUKid7xxAshtGNi+QwqvhV0IVmmZrv7TAHHCTOtCx/pp0YHY/nBj2ZaW8xfzv9W7X5DNtJropcW2BzC7Gn117wnmPbkABiDVhQ08ieFlsEnoPqKdSILXVMVipwbvRsP9rm68OT+ZwGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eliiCfz7jA1y3//f0Mcd0ap9PofRfqXBxftJ61Z8wlI=;
 b=NykbhKG1Llztm4xEB7Tp9dUXRbDXbNOcEshNjYH92gqhN6o0eNDaD/Rg6+2lKocUWhqC+bCLUNNPMwS0z2xWio4w+foUpwJ7bCw3VblC7G/+VVjcvJ+lGVUc9Aoiugok8vtxFy3OHsBKigRSCs/CazCTyXPi+9ZGL32a7YVEdLEduKx0bO8jvWQ+CE4BvixWStIIKe+Tq4dMD56TNYWMaDIiuKn/FXkYSa5oBzhzTqQqjXXVgszkjM4NCSqiiInkpGpxqtx9z1nam5Xbil4oZaC8YKcRCcgYtWA6BJffH1sCSR8aIDnUrJ5eeeUNGO+ZNneTQ2fIn1HXMUEiIsC7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 10:06:38 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 10:06:38 +0000
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
Subject: [PATCH v3 5/6] hwmon: (peci/cputemp) Add support for Granite Rapids (GNR)
Date: Thu,  8 Oct 2026 03:06:22 -0700
Message-Id: <20261008100623.7085-6-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 087b90d7-36c1-4a2b-9903-08df2523d7f2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|52116014|1800799024|376014|366016|38350700014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	isF7as9aHqzcYuvPU5jyDnWgSog6pqc8Nrx+u8noOvT9YU65nvGNS6QgRB8iqHHF/6bFwdIj80erx1lMVQyec9fs9ZBnzEjXizolUxk4crkM8xDYytAAGAdPyP3OGKB8IjtDVkeIv3R/TNKIBX/iRJfGoWrQpmfqIQ5I8hA9fda7VloCdAORODtdXayjcy/fvAbrE9D/kNXqYb0WcINLT1iq4M6GX1oK7tYAuCTaj2cVvfW6aWcom9xo83pxUAjqwsZ8aPDXVzfazOxdY1lq3uVboQgZzf9/8rII5lCai3lDWbaax3FXSiCFjYIGNnOoLhxIvvMT2rwKDcqSAvq0+unw4sjWqS4Cid0ZwvuDU7CFOPAmcn6UlcSguwEzq6zr62YMrV+lmyVjY/wrbSlx9EcZlSVxNrC1OdgHz8MogQ7b07p7BiTgiCRe9A4hEtryCovBLvdEibY7qVA4ZbuXCnAO4GY2eP+8A8NFLvmRWOPRLIHCIZmIKmSjJTZPs2NSGvuj7E/jKWHxBB6eX0nTF2j+Tj/p5qhSgtAejWj+Wt2WXxWgJRDLQgWhisgThByz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(52116014)(1800799024)(376014)(366016)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CzQ4nIfTPYG0WYH6up2PjgdUktwtxArhTS+ttxJwQ/p3I3lTcZFob1Y2mkTB?=
 =?us-ascii?Q?cuOzpihW0iwmIZY49phhXmMLnkXq1D2GPOpyqtEddxMSKU79RyJmskO6gnEi?=
 =?us-ascii?Q?oxlllZR3jdxB/zAB0noOTlHopRH/6YRqUiIaFm9YPkv6A55O498Zq77YjJVd?=
 =?us-ascii?Q?3fq+FVBRsvuekatvhVQzYSrfe0enV+7Y8vrpsbN1TTr+fn5WP4aO3w2bmZWK?=
 =?us-ascii?Q?MnUcTyiCcbzhsR7jGvIeTuxfos1wmTgtZ8nLtIbwPAqv1V7EogFAASpqBrIz?=
 =?us-ascii?Q?yZi5KWI+5Qe1wECpjBLViReipsOtClKadhSdvtwGyWpmwUqLwlXofcMi6uIY?=
 =?us-ascii?Q?Fq9SUYS7+VRrkCEyryn9HDX70S2mlkj6mMcOmwzQ//nqsJJ3bk4q8b7ymP1K?=
 =?us-ascii?Q?At6F9EkDoi6FnoZqqPs4/5Id+Tm5BcptBy/xe7GsSjNor7Tk6VaY9762vP+8?=
 =?us-ascii?Q?8LR4y/MyJEAK+4WVryy+5Ss13mIrXdxJUkrPphbbInRMTlvV7DmzGKxROW7K?=
 =?us-ascii?Q?Y64vN3X/UbMCLNTngOMSZQeh3/vk+T/yXFSZOnhIPQT074iyYwD/Bq+WcsRo?=
 =?us-ascii?Q?WNJBeefFqhJWwXqt4uZ+CnOql+WLTu+8iGVWjTlvwe/hJK00fGxJtxtywcEB?=
 =?us-ascii?Q?yRX5e9oRmxuhhwMitni0C0j/leqG04qy72aPDKS0P45B+MM42Ty+T/43l4cd?=
 =?us-ascii?Q?jQrS9LfgPDqKOSgj+j86d3Yx1w/mlIIVIjFAeghkoCVDy+tniQmIt79SHE7N?=
 =?us-ascii?Q?RTjLucwEdFNrCKM5wsVVoCvZXCRkjj+SBv7t+I2UMCzp8BlPY6a4UnvrkhWN?=
 =?us-ascii?Q?8bT/DuddTbgyrsnOgOo8m2/KzieLTWXsKDa6BLWvDCp63roX9y2JxtM1ypl3?=
 =?us-ascii?Q?KJ46mjokZHdieGps3FeK/3srCyZM3yPSZDL03RST4cvDpp4GrzM5xBIm5i9q?=
 =?us-ascii?Q?mRGhG4Pexw+w++imJUiCHsM0rRdhatI3rmY0/44i288JdfLOuQBMiXIGWEKr?=
 =?us-ascii?Q?jokPq5MCQ/9A4xn7k1t/MAE2XjzWrLwwoXB8zpQ58JluXdiqwZHSoyKVnczO?=
 =?us-ascii?Q?Erio5WmljF/C0qJgmBV9XWLMalWEVEOypf8zYudCp7ial55CIEK9DQK+SyPg?=
 =?us-ascii?Q?bQVEvLUekxXc08SwNFkeVYfZkW+PS2wtbxqQvwh5Z3B/NODcCH+lk0s8UBbt?=
 =?us-ascii?Q?FEAdYGmtE3C3F/SSEXoVGjcflHgTFl0u5vMPPhmOI5+yKRIioIDaWuRYt58v?=
 =?us-ascii?Q?ELDyg+OjZ2yyFIyhm3waaWYJedRExN6iVheSPHy/iyxp4B8zyVeelccRPmV/?=
 =?us-ascii?Q?RoehMogz21C3z7npHzsTMi5azUBXnInA3/rIxdChqC0ZOD2oVcFwSdm5N16b?=
 =?us-ascii?Q?kUDRX762A9Lke+l+sudGE5ztIrmfUzWip2S5bTShTMOfl3eSH3+SMHnIekH0?=
 =?us-ascii?Q?2tUQZ6DDSosoSRG6Dm326psMskMoaQGhD6iBF+cmOwlYU7uFhZbTbH/tKQvQ?=
 =?us-ascii?Q?sPIaHcR+25GDNRQ21EjrH1DSwRBkdprQxHTKvohNvO3bED4uXzcb+FaMYKlj?=
 =?us-ascii?Q?aETqDAdPRLbbDksVCTYWPXpPu2fcxxylE1EbK0/zI/jHINaQRtpELLtbe3/M?=
 =?us-ascii?Q?w77llnWTscqi640HyOC6SW4Jm6dM/qNOqEFV4+1J8HMzhMwIIKFBRnryAofP?=
 =?us-ascii?Q?Rq/bNRXpmW82mPXE4XMhTfyt1tn+Tv/bmgmLxQdK/Za2mvz18x4CfT5JIKNV?=
 =?us-ascii?Q?wE02IQrZV0kCv4WMrzaFDz0JPJ3HvIUwcybObNi2KX5E37Vcu/1t?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087b90d7-36c1-4a2b-9903-08df2523d7f2
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:06:38.7877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0JRrNYIT+K9ImujUt/dG2WDJMYTkUL9CDeiWDiaLao70TGZe8bUxCvsxs4FmPXVxW6Z3+8ccD1B0BlkA8Q77GAbGtZL3vZ7vffzbzWAPzXfNQh+BxyWMej5T1bu584T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Add Granite Rapids (GNR) CPU support to the PECI cputemp driver.

For Granite Rapids, the resolved cores mask must be collected from each
compute core. This implementation is relatively complex. Since we do not
use the resolved cores information for these CPUs, we can explicitly
state in the driver that the core mask is not supported for this model.

Define new cpu_info structure for GNR with minimum PECI revision 0x42 and
the thermal margin conversion function dts_ten_dot_six_to_millidegree().

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/hwmon/peci/cputemp.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index 457089c561b4..69c4a07b99f7 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -339,6 +339,18 @@ static int init_core_mask(struct peci_cputemp *priv)
 	u32 data;
 	int ret;
 
+	/*
+	 * For Granite Rapids, the resolved cores mask is relatively complex to implement.
+	 * Since we do not use the resolved cores information for this CPU, the driver
+	 * explicitly does not support the core mask for this model.
+	 */
+	if (!reg) {
+		dev_dbg(priv->dev,
+			"resolved cores scan is not supported on vendor-family-model 0x%x\n",
+			peci_dev->info.x86_vfm);
+		return -EOPNOTSUPP;
+	}
+
 	/* Get the RESOLVED_CORES register value */
 	switch (peci_dev->info.x86_vfm) {
 	case INTEL_ICELAKE_X:
@@ -543,6 +555,11 @@ static const struct cpu_info cpu_emr = {
 	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
 };
 
+static const struct cpu_info cpu_gnr = {
+	.min_peci_revision = 0x42,
+	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
+};
+
 static const struct auxiliary_device_id peci_cputemp_ids[] = {
 	{
 		.name = "peci_cpu.cputemp.hsx",
@@ -576,6 +593,10 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
 		.name = "peci_cpu.cputemp.emr",
 		.driver_data = (kernel_ulong_t)&cpu_emr,
 	},
+	{
+		.name = "peci_cpu.cputemp.gnr",
+		.driver_data = (kernel_ulong_t)&cpu_gnr,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
-- 
2.25.1

