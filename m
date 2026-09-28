Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC4F46AA88;
	Mon, 28 Sep 2026 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583342; cv=fail; b=g12PCZrCdtWyQ2lpDN++5cvawbx2lpUvgBhkaCIfvvSJOdZMAzNphnYxUw+hy0SqKHnaJ9hOx1FgTUstBZfR/XMSFE6+4FyLsT+l1D8ZEkKDG6Ce4Cks+TWnGk8XsW/0odf+9gOFTN36wvKURjBaM2ixo2hcnhEmgY7JrIUqx4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583342; c=relaxed/simple;
	bh=Q9T6D9Rab9h8Uurtt8s9Nrus3nMbKN2fndEcnCEdrbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QyOfyStM4txDRtIJr12sd3Ob6e81QMraoO9wqGEtK/SJBe154ZRIcEetQw7IwBgWn/IsJ47kAb0lR2XB6cJyLsZha/zYM5zDWRjtO5vLK5tQjdjWD3BS/rzDrQfP3qz+0OFEmWMX2AC1sD7PfVYnSvba7Iyo/BT8qCSIkI/pdBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjIIWQrjcXXbNh73KejMQkxye2f1CliqV1RcbLWn8sUNWePxz5X4uP/7ORoIBPHrCMoUt8Rli4Sz8NRx0uzP2L9v12ZpzNH3cnGIOjlBZ5fjOSTrzhxW1Dt6wKEZyFbElAsJcIhtGWm53q+Wq8LhqtfOv5uEJrp4nMHMVO+HAOVbLYN/64T6yOVbElcXVVqhm2NCAxU0LnbkbW1JbiXLPHx8ZwA8aPW08vCBam2rDhtv9Ngqsg+PBxMuTYLd4axtjYhI0uMl358HXyc3huhMTdLkDY0AOb/X+ONSCronXHrMvICFqjs4zzSsHo8RGPW9whKhQgppAPYCJM+JTl+apA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbSQynd2eVRtGbUq+7pHmhfyZe3wjneG+h20hqZ6PDw=;
 b=Msz5xHt2OQjKTm2kqA2R2I0VUOMmdd1Z6h8gZ4biGOFtyEaxHWPnhtZB4yVTz/RArTHQtw2u19xLuCX8n5YKcb8cOD+tJVWRtTWoQFD/pGpOyOBpHPdc04s2FnfGImEYFV1SjJy+xP/UltnHsTQEw3ek39wZ9jCd2KaQY2Ro4iHoxxg8yWuDxmxOkySzrtCZ/abAT9/A5/fnI3jewJHCu29pznfRfU1zLQp2F0SwNEB7WBetZ64fI16BxkYFylZVLrEENF3lwjoqin2XmvowaWssNMN5KXkJ8Yelmoszij+Dlasf/DEYy1BKeUmtX9NQcpmC2R7sKr4dUEuRhj3P8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:00:39 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.022; Mon, 28 Sep 2026 08:00:39 +0000
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
Subject: [PATCH v2 4/6] peci: cpu: Add Intel Granite Rapids support
Date: Mon, 28 Sep 2026 00:59:54 -0700
Message-Id: <20260928075956.62298-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260928075956.62298-1-changhuang.liang@starfivetech.com>
References: <20260928075956.62298-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0022.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: 1467a54c-7721-4ad1-5d71-08df1d369628
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|7416014|366016|376014|38350700014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	627PpG9DekNjW1FvWvXAJ07vJokR/yN2UfYKRabr9FT4+Hwvg2OsIh9omPfJ4J8vUQIAAGkpzOIBnmjvmcKTfidjqOO3LGWcx+l86SxHn160dbG/RVDv+2MXB94Qe417cTfKFBInRooOIo2T3ufNaEZShSJ63SKx6gGtUUCcpYdRbmuDmMHkTCtzdNKXRB4Q0bm+FAUHCMQ6Qy8Ijr/HeIEsUhxGZqD18Wv9Sb/H9S2u1Y81ifDUanre1/iYZk6/gHpwrC2+niIGPH27d1SmVfqSZtUx93dp1Uqwsa6bFDdpDL3bG6gUvelm85Qushc+BpBvL03faui6OFvU90D5axz2ouMhWOkwIJukilHHM74g8Oq/FHHL0EgmlFTibmIbnFves7gHsVi/w3gsmgWTVBP/Z6EGbRWncO6n5Io+DWalvoeLqTBwJ7X6l6zUcb7J4R1rWdx88jhzpdiQI3Ny+vFbDbsNqV1RWQF8nz27/WJinRFtqYhtIHoe/OeFAE06dmaK34zkPWXg+JhrXLiOsa3S7SiPgWKZjqD2cputWUznwwVRJcf8WQEZbOtjAPzU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(7416014)(366016)(376014)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SnyYK/X1STq6qaJu51P69bOqERkFQD70OU729kBSd9V8U3z6E44GtAaFTmlc?=
 =?us-ascii?Q?6AVR2Zpt70B3klRixknYBLLl4zue+QXOUbnf0WtCUvENFBEOqNF81yN+RloM?=
 =?us-ascii?Q?3Zp5L5fa5fMd/ZeOOpviVY8wwbLxBkGg7RpWE+F+nXz1NQYM6aW758N/sKSi?=
 =?us-ascii?Q?ofoquNZl1sSQa7/LFVCtfZzWbZjWS+kTf4UuIwLsV70Vwfd2BGHvQsL7RKLn?=
 =?us-ascii?Q?5F5ok2p4PpN/n/Zi/6hcFbUp3Iyhc1KExdBNeH7XSd6h5adGdgkKowC/29fC?=
 =?us-ascii?Q?/6HVZ4S+qqO/t8LSXqR6acYyPKYV/p1f+Ok6WVCA6sm/f0687/O3tI/rp+Hn?=
 =?us-ascii?Q?P4jmBHE4IS4sDQbaNKu6Ij96kitXd1x8Hx48WlXueXLfOuc5ZC72xzafpvR4?=
 =?us-ascii?Q?jrLvm6dT74QtWAPxLMwlYLDcTvwMB1Mq5GqNdrZ+dihSP5K0KUg1jPxSQl2O?=
 =?us-ascii?Q?XjcfBuvUak5DbEJ7whbrhh74YjfzJsGf3wjhfQwJbxXGpCWowoAYlepXJzCJ?=
 =?us-ascii?Q?ekWQc4ReyN4Cr9sd9Mq5h7XkfxUowF5BzPBc7hJ7FubmDVg0QnCiA49eEPfd?=
 =?us-ascii?Q?rrHxf7skNghamX5efHBgcGdNvkz2z5Gn+RGdfe27Ok5cSemju44XzYr8fEv2?=
 =?us-ascii?Q?I6n03lsv8saHndMu1TOwnik3uTb0Wst6oCMHIsjlzuoB+H/eq2wdYJNfADIx?=
 =?us-ascii?Q?86iS28YDOpSP91kvkCj2jcDlq0sw4qOeor9RJ5HHcj7wMTePGK678N8SR6aO?=
 =?us-ascii?Q?7iEFqfAbOCpfyWPgi+YtS/RsRgEqsYFNMKiGLmZ66uF7YC005ly6P1lzgNbd?=
 =?us-ascii?Q?hgxaz/fgGC21MJycg4ok6ABAqTKm6nFM5tQzlrvUCfH3I+tIm7RaMbPDRndA?=
 =?us-ascii?Q?nnpK5azaXwHkdrCxEaSBHowyb+NDGZZfVjuDUS5DtpjfxAYFWCeo8LCOuQm8?=
 =?us-ascii?Q?UFxLwueqQy4+3FTgxrFS4Z9qnzCswIfxILeiz0ziTAdtdAgV8Ga/a3aThfAC?=
 =?us-ascii?Q?PGs/60YJZIg6/D1HZwbRnycn9qKwQ2Q5F7IY6CUA4O0zS+PzPIGhhYlRQg8k?=
 =?us-ascii?Q?SsH24EQ71GkJIqECoUXfywGfH3JYVWEOeNdDyeKVyhcfe3TvUYv2GmNoTuhe?=
 =?us-ascii?Q?PKsnxHgQIVZSEo5hH+0xlJMRszEgdpwjX++JRRxtSccSWY891bzE+t5Ozhme?=
 =?us-ascii?Q?F9cZBCbLtDN8eQIJj/JFA4Sg3IhuEIfMDhhDV5TyuMC/pYWvQ9xzTbwMUtnI?=
 =?us-ascii?Q?8w3KLjUd5K/o0fsPuGXK9a2OXBGGM8Tj8hGIJjaQyVed80CpFENkRhxpQT6S?=
 =?us-ascii?Q?zakodobIljFAV1CtBo/hzh/28zyVTnNaQg5HhoDD85yt9cItJCkeaQNOoPQS?=
 =?us-ascii?Q?tLG8HyxvAXcrXL96UF0rPfuvTXmdM4n59gD7Dhc5OimTaUcKQGTwgYgBeKHy?=
 =?us-ascii?Q?DPHZMLOC5rJnhLej9X6aIebfAipfMAx7IV9pKKAZCncJSjzXX7qEaViv1exm?=
 =?us-ascii?Q?VVYJ0VP7Gd+RRqD7qSiQFfDl0djtFOIVWBRnDeGSt/fJfBn8MdkMpbYguQqz?=
 =?us-ascii?Q?qiY2+OBgYQo5JyOkuonDoyZ4PFx8iapA2WdTFkOtuJAO71tHyTaMtd41T5N7?=
 =?us-ascii?Q?Cfi3ZbIg2c6K5WbEr48uI1jHtWpav/rOZWH1wkEaQ8Tsm9COiuyeZHc9qNO7?=
 =?us-ascii?Q?bZrM2wuw/HvZCi0qMqLAbNf4Mg9pVNfAQQzstFfhchwdXng2rc09aw9/ZHbS?=
 =?us-ascii?Q?EgsSy2iTUYRC6hRHB4/HWZl1IPVW4Ay0X7xOQqlmmKzbZnHfQfR5?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1467a54c-7721-4ad1-5d71-08df1d369628
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:00:39.5781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWgLRy7D/YivxKDiC3LPiKyA4ha9oHyRhtEfVXCC+F41YlnQ9Z9tL2rUm1W8B/0IFgmbUwvDCazMhZFiO7fmT/CrJbW+7EquoSibB0lEc+131GlD0BI00xUfeL4W6xiF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

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

