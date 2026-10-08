Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2135.outbound.protection.partner.outlook.cn [139.219.17.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0257E49481B;
	Thu,  8 Oct 2026 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454083; cv=fail; b=oC0Z3C6zoO3LBrdtCt1MuQf8Mwt0Zmd7olDxuSbHklJyF6Rp5Bl4fnXCnwaraXe6itsnDrndBTBEAuNKWFSolWOju/fe3o1jdqC56/QUV547l7zFNi/Umdv+YZiukTIPsaYLy0f1bRQZY7jLrm0cc8BtEyZ/HkS5ngc5x8+jbYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454083; c=relaxed/simple;
	bh=Q9T6D9Rab9h8Uurtt8s9Nrus3nMbKN2fndEcnCEdrbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a9Bi/UWcJ+KGht86ieNzyCWKFcMvevmo8tHovrp3s+Oap93JSyp7jr0MfPv+OEFx00VfC09hm2abX21r6XmwcpPQiQvmfB6NpDuAY4ONEmguBK4Wt/CuL8w69XFxBmKAjyES63Rt7ZqRBZj9lJ4ssZ3Q/AEuWpk3NxLxIPLo+QQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kh4Qe+ur813SbQXDayKXkXCnkp+i9eJGB3uTDxtGjMKaFsQrsX/o8M2TxQfxMTFDLeK717S4xDhajCsmjHq2lCWlBChm0oudu9b8ok2LPCKB+drWIhqyULpHFgA6AO+5XuAbUc+IBwl9cjH7jJb2IeBk8ZeIqU71TrlJiSrz05LjrpMTBgv2aF5TkSkTAGMKKNilD/+uWBLdJluzHPUYdf4+s8pf2zt6eJsorzZavBvIMyVurSKkKqo7NwTlFoouOah4fli36zJs1RtE/OOhvhZ8SML26NQ8527SH22l7167Nxgx8JrhtInWswbOeynLilcYScLkhuOIAhHqnkFDaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbSQynd2eVRtGbUq+7pHmhfyZe3wjneG+h20hqZ6PDw=;
 b=aD4Xvj8P6n4rEBC3GPjO7X4LWLIQYvvcOYZgOfDLvF9UAKZeGGHMR9UoVqe3ZUZaVlbENHSMVF1emp6LXzjcqgNl/J7YJ/EeLNiKkOk51YeFA8+7VI7z3wK6IvmpFrKE1+qje6S/oD/nH8qXD3Y0seSQPtVQdlf12caMjdkaE5iEMg9FZwf4xQofk7lb2ciKiKcavXo2Ejicf86JoMr2dXZx5Yy955vrRxtOUAG1yaAE1jy0Nz3TmUK25meV4QwX+LtTwuIrajpiFGznolGZgtYr9zc4yP79PuMTmypP8R0Jft4rOY4VHcTzs8KY1u3sjYp1rsPMoVi0OoepaiBmjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 10:06:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 10:06:37 +0000
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
Subject: [PATCH v3 4/6] peci: cpu: Add Intel Granite Rapids support
Date: Thu,  8 Oct 2026 03:06:21 -0700
Message-Id: <20261008100623.7085-5-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1f94467d-0a5e-4a4a-72c4-08df2523d75b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|52116014|1800799024|376014|366016|38350700014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cP+7c/4DaD57SEs5Kvssof9XZ4FTj3lgffXRWO9cUy0q127152VhhAVrTSAVHeE0uMTGenSfGINZUSEY0mJ/rc4Dr2GRUPMA8L4vteM8rUwAQ/+L9Tb94om67ZMZiRGFgpgElbMHIcmKTqMr/7nox0XA6arkz82R4EjYnwQPOwWR4nokZab23TQ28vwR3eVwVyt6P0mqYZ6b04wxLhc+fJnLCLfitgY7t8KDa0NsAdeT2nY/RtyfODf0Aifv/xcu4+1Z1WPRTQvCJLNGCMlIRjPl9X/QZdVjzDgyxeaUhJKi0u02eIjo77ynyn5IKDSKorBtCQWKjxPo8jLFs8vZk7XNeFNUkIQO5SGyRj6xJIIUGTwPy8HPHQIm0FS7xSn9YsCA/OLJ5zSiXg3ox+v16k844T8U7V7NcdOm77TAiGx/tQz0X/FN7W2YHnRIKIwCfo54PkmV2c4/Bxofaxew5SucQHUq7V5cs8VHCAgg1thZP4K39JhR32dDUQ7uNWPwL1zV5F5AIYBDXKYtLxfcZT6sZvddGDz9PKU1i6CT1rhJPwlX/qLx88+SYvCAmCwW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(52116014)(1800799024)(376014)(366016)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?92yrWz93LOjh3XnNERT2fjyrpQoN5/a3dsAYurkOR3pHF4zTpRThD85GimqN?=
 =?us-ascii?Q?vCF49DWbvKIN72eMLpOkf5PINsa+h9wHoaBKE4OGzrYjHupuOzqxeRHDTZys?=
 =?us-ascii?Q?gajMU18PtFDGP/UepxB90sRZpWsiU6xgHNDxyjxR4+w56M4Xz1ZeZUz27rbK?=
 =?us-ascii?Q?/k8YeCq6lci1TB0QX2gUbc7Aeh3HW+B6ifJ+m9gW3kMLmyVXREsSgp4W/ZI8?=
 =?us-ascii?Q?eYLdpFHYACYFsTxwe7WH33kputfxIaZlkVUqXxzEqJEKLdfX5RvNGS6R9TQ+?=
 =?us-ascii?Q?1ekVsXl0w6l4VKr0LV0pdtn1tNov2kxYX7EABcAqbMPmxfTU0AbbITFPl+Pt?=
 =?us-ascii?Q?3fz6x18u1bnVDEylpDWIATIvWGiBGmd4UfnE8y4MTcZ/bOLtjuf555w6CiqP?=
 =?us-ascii?Q?zVpd0LgaxEaE/nV/7/O/zs9o/oVPkIRWH0OfXcZ5+Q1o/ksTu8r9IUnIE2XO?=
 =?us-ascii?Q?bejjKPgv7KD5gBHEKQFbl/9rkdoJVUGxLFsWPKKJoFvV4YOFV+36pYL1O4iW?=
 =?us-ascii?Q?9rI+6B1i2l95YUzbdljjuVTiNjW9qP8PGTIKSwwfe3Vd/2K16JB6COOcfV5K?=
 =?us-ascii?Q?lEyfBdg6xxpBolH4UCAl5/35tlwAi/M2wzzp2ixA0wtrIW2BdTVuUsmW+zf2?=
 =?us-ascii?Q?DJdMYqb0i6e/IPmhlRq4Be5DyqLQwY3V3Fi1KhFPZI2koV2P+r9yEYZxj/zZ?=
 =?us-ascii?Q?WjXkioYID3y54LOnLKTOI6dNQBCpXKmKzfFA1gzXMrCWcYBBVDM3JP4aA/Gn?=
 =?us-ascii?Q?ZYT6E1B+xhIhXiqB9oEGqbEtzWHkiRaXZ5VGBEychmVxVDT1LnbxxbboN4Zx?=
 =?us-ascii?Q?/IPkhmDpAevR2jLmu+aO/sdFgGtJGaAtrvZHsawU93aHbbxXGPJQsQQjau98?=
 =?us-ascii?Q?zsXmob1qjnUz44M9z0emoGcbVfTfSK5pBMwVuOnzxdzHbfkttYU9oPxskIox?=
 =?us-ascii?Q?hbvew1ohXpSRSWPTPq9iYAtte+wcU7phINS35XML3JhgnJooDNrnqHsMWa1f?=
 =?us-ascii?Q?3p2QcgeJz7yRvgmqAjn7n9HzGL8XL9fjKGz3BdrdZepdMbpCh7VLDULcHdgM?=
 =?us-ascii?Q?NzF918eFB1y6F3WB7rfT7W8f0KibBzf1lkBufsG0JO0Ey62VD33wmIW7OsQ7?=
 =?us-ascii?Q?E+6kwoqt6Y9beQAwt6L3n+7yHVPe75S83iuhBhaKU695qtOTPIB9A8cJNNs7?=
 =?us-ascii?Q?xRA63VoGBpyhA2iKE0p47a5LTHVLVU+wZr5+iZ8wfVkrUgqIzh677a+Afohv?=
 =?us-ascii?Q?A3tJ8hezoGn7k9eVHT0scTmRdZ8Wqvvk4omc1h6m6xbsjkaRXrpMNsHIq84k?=
 =?us-ascii?Q?eAgT5MhVAGD/B90PgNwvRwyKB45ZW0Eha1+jfbOOMmdmH+1tR80dYbtmhu3k?=
 =?us-ascii?Q?FasJHaR2RKVDzfnOQbqv6JU43O0vSniZ0B8EyHgXXKW/CUnLvyqLSDWjNHtw?=
 =?us-ascii?Q?4KjgBTkvHZNatjX0WHKW0Hks/KVJAzprNiEKCf9CGGQQTaWbjwmijwKAhP6d?=
 =?us-ascii?Q?hqIoh+ItmZIoyE4J5tFTIsLRcB2xoimvDvUwEj4Z7Q90y70JcAdrzQqIQlHs?=
 =?us-ascii?Q?g4dR3BxJ+DmNQLeJJwIoc0csa4afuPRCZFdCwzDmmfeKfbOIMCK25I82jCE5?=
 =?us-ascii?Q?7zX4hukPPDrn72D5NAQiQnNSjg+O78M2G9cUoRHMH0yqmPwjplEg/4ZWNPtD?=
 =?us-ascii?Q?q23vnYcESpNtED3iwXkaFn1PAYodeRP13nmz+gLBjxpSk4X/85nXYajloSvW?=
 =?us-ascii?Q?cvLvGsXat7+Yt+K71CzIzjEdHrOGCAEVRkptqodD2PdD+AnkrN9U?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f94467d-0a5e-4a4a-72c4-08df2523d75b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:06:37.8286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Z9LFhCOCdCj84MSDz3w236S2gPWvr5gUhvxej6wt2QGu4VEW16t0ioen3Li/zEsrhKcuhy6/U5wTPehGpr+z/u1FH5XW2cIe0DNXndJAheUQPHwYIbcvBHAxb1hr8ny
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Add support for detection of Intel Granite Rapids processor based on
CPU model.

Granite Rapids processors with the model set to INTEL_GRANITERAPIDS_X.
The data field for this entry is "gnr".

Tested on JHB100 BMC with Intel Granite Rapids processors.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/peci/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
index c9fc06c9ff53..abf004637949 100644
--- a/drivers/peci/cpu.c
+++ b/drivers/peci/cpu.c
@@ -325,6 +325,10 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
 		.x86_vfm  = INTEL_EMERALDRAPIDS_X,
 		.data  = "emr",
 	},
+	{ /* Granite Rapids */
+		.x86_vfm = INTEL_GRANITERAPIDS_X,
+		.data	= "gnr",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(peci, peci_cpu_device_ids);
-- 
2.25.1

