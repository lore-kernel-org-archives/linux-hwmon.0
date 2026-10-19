Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2097.outbound.protection.partner.outlook.cn [139.219.17.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C665D4E0B91;
	Mon, 19 Oct 2026 11:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410329; cv=fail; b=H/p+YRJyNncFyrAy1lGgkDkGy0ptonSdCcKjWWZ2l9puublcSEGeieUDIyZpT2yychCg441gZzPpmsb6AVIRW8y04S+leoYC61/nXbJtfHHm+uEuWI4CV8wF632mH1kQLcUulsrV7Xl/0SQFojSr/OIPfOxFfqa8sb/d/YOOlZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410329; c=relaxed/simple;
	bh=hXazWRvXT4HBiaE4DBVXvKQgT89qJQyvlUrp8Xgx1Ys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c/hMq0b7dDjz8KFuDsq4Vs71oYo8SxEJBMcWsQZWXbkFPHR1TtqXHjygfwCm8k7ZwD+ohQ2FL2NaJhv56R3uAC3rg1b95mQquh80erLmNkJnHk3+y2zbRCIoC28m8RAXNv6LDxXU45vxkav5m1SWrpax2Y2LzXXxAw3OhKrT/9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dw3gCZYmb44AGH7w1a647rA0YfJJxB1mYwX+mD7YcG4LTpNKSvic/3EnefSw2+ZpOTtttp6odvpFROHSr9F53OLgU3PidIopSWeGE7GCEdhXk6kWLAS/7MwRNEmtYDyyjm4rUB4+QY4rriH+4bizguhsFCi4uT1065Wxe4OAAQorfHgOqExzlagfprft2Zgp2ZbNIl/0AxBhXiGbikNa2lOCoMIiyZncBnC4d4JYaj6HAsrBOq6ZvXiUZXx9EKKc4RHuwQmfV7sUCZBgGKDPmw2OJZf086DuL2v3HFS0qSf4yFUCe8uCasHcYWOoOclgLaq02q33a0ZY7suHBXwXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/HdGfTgGXxBvKaV3dhOC9g7A7uMuKkS1EmnG89jO6s=;
 b=oNvumhtm4P9DHjrSwyeIEPUMCU+z1Feg4tVnRhGU0wrpSgvUWhooVhz8qfFdlw+DaU7ai9AnaRq5+Fat8tzzSUppW+NmDs6ZiKS7kkpbTz3wIW3St1tzezWZz0ttxYTtWJUcUklvOxjeIxslzW6HGn5UaWxcjtPxPIlNSkWiS2p4R5h8VlklIt61XFSI9dqi90qPb5QM1Lcxn3VmcWbCja5sCoYNFqiYkn3lxUW08kcZzfrQMLn4rozdLNkdwpBQWb0a/IlvIWUvCJkwA0VWNLz9quSYCAJzhaMKhCAIio9+pgtokwgmlCa+r/Lr1LqjvnXXdQ3CMtDfcanTUAtwPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1298.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:45:16 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.017; Mon, 19 Oct 2026 11:45:16 +0000
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
Subject: [PATCH v4 4/6] peci: cpu: Add Intel Granite Rapids support
Date: Mon, 19 Oct 2026 04:45:00 -0700
Message-Id: <20261019114502.55307-5-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8e1f3e8f-1962-4b0c-b0d1-08df2dd67191
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|7416014|38350700014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GHYFwk+mWysyYVvO00hdcqUeHgwDRKo3ewJe3b/waQf520ITO8h1O5QLnHGrYtnpst98PnmpgAz49HMQNl2wRvgPqcXtohf7Z8YTV/S3nRQJBNPaQE7mnRsLf6/s8lm2fY3VKlD0XGw7R0cMfVtoqUH3NSEurOhRB5xFvfhkCqKXon/WVhnawY5CDU/rr3tcqBQGbl1RU+4SPq0P7S6fSxWI8CkWfl1dShmgxVq7a0yEdMddJy6/3Wb6A+ZkyDM4eYe8Fjr1RWseHJ2keRf6mXWBz3YbadlHd+PqKzfPPDlLkdnuERkA9IIhm8IfjcgF7V2VOKVryKgm7V9MLn2+yYpvtupS/Ya7EJhXeUSUlYz5mapTq5pSBfA0+7Xid9FM/CP1m2W0O1Fx2yjx4k61p5PxRUc+OzYxmnLxXlFQRgcG7bcFL87QB22cvIs6hz76l8//Ds/Jz7iXXLDEBCUXot1cyce2Eb/n14YwuQ/6X51PRAS4CHoM0EVnQmSMayk3IHDv7qbYql/pH+k5XmdMamY1v9il7DPGE0m6IARAZSAHEUYrG4YgWYJVC7bbhSi0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wegZTPl7L6f5gYXh/UQgHhs94/dj2t3yzOk+PyhLTBoLk4RGUnLcfA82jDse?=
 =?us-ascii?Q?9eb/Jg3lVJ2DC2w9XzcuAsY4yP9Fdt0VTIZAGIme7FRuJkQ1gRI/CGDBwpgM?=
 =?us-ascii?Q?/5X8+gr2f5yx6Rt4EKCKyYijfc/gjvlCR96OR/D78CqM5X7WFQmWlY1dQVhg?=
 =?us-ascii?Q?JwM0b3VxW3lIfBjN9REz8NNHiUEh3pdzO+1e+eEd748MIplLyP+uHjt6IESf?=
 =?us-ascii?Q?GHg2xjqQV/ynRunY3qSrAHgQhizkfemiXsmBMu9/54+H6CgaH0WTU4Xc9cT5?=
 =?us-ascii?Q?S/qChcjNXMHaO2cs2HFek88Dn3vrPRMYEfRJiMBEYFvu6yLssPm+PnuNbvKe?=
 =?us-ascii?Q?Q8j+Uj74PYtJd0xf97L1ivYrlcswSlTsWqTCnG+afCNLh7wFipeDI971WX6u?=
 =?us-ascii?Q?j/aJOyigs41xlin7DreIHMxKGJrcn9te883jfMcN6iOQQB6KPUnw2IB+6jAr?=
 =?us-ascii?Q?+x8t3hyg+o1D8gXr/mEz7T/2lP13NPbQ3nlRoXmJBWN4vaa+p3dCYpF3R1PC?=
 =?us-ascii?Q?y+kgtP4U0VM47SVikawUr+V2P5dU5EdIGuQHkJ4G4kfNP9Ff4s+0QyNQE6oS?=
 =?us-ascii?Q?RRn1sR1KY+9yvsUJFTdKjGtpCVKgw6qYGIN0knqTMxdVaLjKXqB/b3uhCbMa?=
 =?us-ascii?Q?wMzOALtvz0x0WuW66FO4Xu1+kqnWCooeMX/WyMUG0yJaKXx+ZpdU+4RBGv1r?=
 =?us-ascii?Q?apvx/vKRuB10zYG1meh5D3jbFHw1IkSfdBWN6PEOPUWvxBYdvrt6cFSK23H0?=
 =?us-ascii?Q?BaadKMa0W+u5f3Kdq4WGAYz0m6eAxTAisQ9e6oLLxNAPMs9UYWnGO04J+fWY?=
 =?us-ascii?Q?YLBVSjNSQmTLdhGFz0ryRFmniaLf6xPghhJHojamA5LXWsi9IVHzr5MVRkAo?=
 =?us-ascii?Q?f0rLpSgkyWowiXiNKl234p1Qq0kXJZFTfwzvY3+LMc/BvrVET56YAcnGENm+?=
 =?us-ascii?Q?Uu/ucqEfwdlC4WkIYEtJDj1spf6oy3KCSeVWZ/PfEs5OvQwkRz5LQJeo2SsM?=
 =?us-ascii?Q?LPlZIViLJGm1h/BKawJfKA/ZgNzPP5/4xDckptieMExQqh+jiDDPhmPoyDx9?=
 =?us-ascii?Q?SXex9NJ7/NIMe2HTXozr8t+EuS3QiWQFFPBoKOJKrQbjVSVaVR2Nm0tJ5yeJ?=
 =?us-ascii?Q?TrPjlz0fmRrcJja1NpDRLWo8OfFi/XnNf9LLwuC2h+Ur9P7eI+qlPhGK0zb8?=
 =?us-ascii?Q?tCRl2YBsp2Oc26EW1ZvKXdUyuBdOxwp2/VbBg6R3DS1ce5UcdEQ+dZA9f/VU?=
 =?us-ascii?Q?jjCp9vdrT57gum2NFmLw3OlbESVnTWens30iKV6Rhlc6ucvcYxCEbUyYx3NL?=
 =?us-ascii?Q?P/BlDE9Zfk4TuhCXBPbk/zryDsb/4xj9Bbe1P5WO2XOnmQKY0hNU3UBhTzNZ?=
 =?us-ascii?Q?jW7OOGyPDFKUw7nKYK9b/71fBRs5U8miTGZcPQWE5fMR3VfL4G9oAv4dWg9T?=
 =?us-ascii?Q?EqJS4P9MQ1h/zUmqcfoVElXblx0VJEaE/eZeX4kEgDBVJA2oJS5UYOgqRY7j?=
 =?us-ascii?Q?pZy27ntj4OrhPvOLX/2rOwFXhPN2V0DyM3Q9KAEhrn7R45u+hnE9Dnq/KaiP?=
 =?us-ascii?Q?o1pFDhBO7z5sIoiNxxuCxPY30SV3z9plEH7xVs9qZ9TOLaQZUvNkr0JzC7PL?=
 =?us-ascii?Q?CTdfFUEWvIBh6MBX+rBED1YMKWKac3HsI7RfkN1Y9SFNPrTD1Fbg/iPFU4zQ?=
 =?us-ascii?Q?bIL9fctbtfO/daZElPKwCwlEYVuMjBnL/gDLd6yiInBcOcMymGuLevP/12ds?=
 =?us-ascii?Q?RGM+6I9mLD4tjGgT8N51NPHDJ6zfdKefaB8Oj1XkF86UtGHVtOm/?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1f3e8f-1962-4b0c-b0d1-08df2dd67191
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:45:16.2664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETSPmk0lGdew8aNEFaK/vtWd5B0f2JD/dL2HZX3MjFj+30yQaLOONqWBlLJDwuLD+dS0kryYQUDRoCnrD2d47Uc9GKghjHYqpie/f/Brc7sYJT9Mm0bs5065SlzMFHSH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1298

Add support for detection of Intel Granite Rapids processor based on
CPU model.

Granite Rapids processors with the model set to INTEL_GRANITERAPIDS_X.
The data field for this entry is "gnr".

Tested on JHB100 BMC with Intel Granite Rapids processors.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>
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

