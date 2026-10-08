Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2117.outbound.protection.partner.outlook.cn [139.219.17.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FEE471255;
	Thu,  8 Oct 2026 11:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459727; cv=fail; b=WbPP9ocNeGbUG8g9adHN3p/CCr/Yj3wBsYug7XFN+dwZZ1g4VKHZZoym3tcnkudZGt6RL7aHEoGb09+Vtxk3WtCAzBp2Jh80TvFdd2tX6FlNdKYDrc5MdGCsyS/+nGSVxZ3fu2WNAkHFu9rSigDMPrrqHlY6charcKyucWNP7ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459727; c=relaxed/simple;
	bh=1xMCmJtN//QRzIYl2agzUateDWLony8u1OfUiy4elFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zu+ZHiNWB1BlW36a4wF0FOe4QRwfgILDK/Z7MtP3/oOTnaxjJzcu8iWdHiSdYOUU/mr3fvhrBNXUdbqZ6794azUtAZCEB/Rni3StkkLj9e5UCpP7kJ2t9hvGjqF3P9iwmkgr9skD5+lCpXZqL9xlMdPldZmtzIhf67BFQnp2DUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6ihJlGTIk2liSd+3ILqaPVGodVvGcoklfFwdF6wAr2RTyS+E+zFzZ0wuydtJ66zkxGHXFDxLqfiTIwA/iqA5LrHAKFK9yYNz3zrqZ2G/m6ZXRlXACzuLnixxyXxnt5WmfKiTzguZo8VbiAn3HpNF3wiDO31P5Sml/fuM3Ed3992igGTpMEj/AcfdClVlq4jWK9rV+U0pnpD39PD/Kdo4xnqcVT7jmh6VGxJQO86l3mLuQS6dt9zMFrUqumAYth0eoBR32viFX0k5wcXJncnz3Rr31V5DjDHFpIl2CgukyzaQzwSnvN/xFNNH7ekUHqBhFYkhtN3QbB76A0XhT7Z0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbD+fCMQs9F2y9HugW87A9X0Dh2zoTW+5Jc0v84ex5c=;
 b=BLbRdzRrnPwuD4TwFMmqrq8FrEGppCu6ecX7KIx48uog+BlqRcMbfvuFWctI/zYfIoUrpBZOpOKt34AW1EZpo5z4HQqiHyEkzv+FoWD/PtcbBuIiSRbpcDOZA9sUjRuLSzMLmQVHTYRB+Mjrxj+Ftm24OOx0xThKrWbS1OQXOtgrxkgHPIITYXjsOuNfnpG24mA65+3OHaMpK2/2SbXJkwM2l0+cMk+7+XXJD56thPkyD+lbqfZJYQ0dA843PmZRvLq3p1r+1zyfpLm0GGgu1UhmjxTsyyMYmLnTOySAzgHjOeEYMRvS2gFQPxPzoL3ZygsFPkiZTmaIKPlS0guRuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 10:06:36 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 10:06:36 +0000
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
Subject: [PATCH v3 3/6] peci: Add support for PECI CC 0x83 retry condition
Date: Thu,  8 Oct 2026 03:06:20 -0700
Message-Id: <20261008100623.7085-4-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: bbf90cbc-5c5c-4a97-1898-08df2523d6c4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|52116014|1800799024|376014|366016|38350700014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AGOKN6NqEEriwAaxh8VUEspbOzb8p1T+DjuAR0f21bRUmMUX0EIQy3kjgQ19zqO+QeK8J/XxUhYczHDvdPwq/4FIxPJZ9UsaGoaXDvqeYdiz4MqdMmcUtnNJNhpnQC0MXC7G55LCukMWBv+li/PSS4Ee4Lw70hsfmOVTjli/Z2ZowO0aeghCPE0vC49lVhSA/oAJ6hwABOPRSGcurH6SNqjBl0LSonjaDpxgWhZ/VaTDiesO3GvYA3GJ/BOBwi4yhMsCGUm962yeIIAFoI5+L2thoVWWxUDshmd68crq3HXyq05zz3Im0yd1BYTJ0M9QXOYlNgEQeZbul4wdDqGvvXUayEVTci+cQCUaSOZNvdPPP+djzIQBX+OBsqoQHBP5aSMz5oW10XzvKUAyH6dibP51JV+LCH7E2P21SiFForcfzzNnfzgec1PKU2qDmJfqcLJbbod/Xh0ygcHN4J37lnJwpWFuj5PgCYKW3qW/8G3RvBwrhCwp6W6iMBQA0Ic0aa6s2ZlHz9hXJARamX/QXsW8qzHcd/VKHj8mqLWPQpm4f4sSQNc71njqyv0Ntjsu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(52116014)(1800799024)(376014)(366016)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ousZwFkeqaB6ESncpATIwNBzRjpp/0OIcBxUk2QE8aFbdCofZHJ3Ivx2XqF3?=
 =?us-ascii?Q?4NglyFxDUjwBaWsuXGqESNbcCMq+5g98gCYVCDyvUOye6L6mI3C3WBt+OMXE?=
 =?us-ascii?Q?z5Uo79EIitCcU1aTCUgv2AEu54IHfcXsl6+cDL3MJ/ix6CUpO44QvGxprBGI?=
 =?us-ascii?Q?dHcp2YvmgoBFfqsZRKdduF2TGP9G7PhGmYbHakXCUsNkFhsAMC7DIPG7Ovkl?=
 =?us-ascii?Q?Yrngkus6OXoQoOtKg+//K7dPZSBAU/9b/QDrEA14ONKbWND8C/pmb5tOR4eN?=
 =?us-ascii?Q?OIgvQS7vvQPFKCZ7t2vPyKa89n7Jz+LcUOApYeHml3tnL/i/bNn1u83I0dk6?=
 =?us-ascii?Q?XctgfsQpeO8UjQPHrH1Rr+ookWuDv60h6hMUeNj7i/trN71YjTV7GClOIRut?=
 =?us-ascii?Q?PBoEdqHAnK8EVG9Lso5WKp2nc71myeyf8E9yqSnePgAzB7FM4jRJGjyJ/kup?=
 =?us-ascii?Q?cB96ZeV31G1YyUNl3UzJ2e7IJHN2sqHbR/aEeI/6Newq3Ub+BzxBJ4mWpO04?=
 =?us-ascii?Q?zCXbH664rkUgy8XhANmsYOufhXt+ix3am12VlgxOujf0w+C3+CCQqcvmmZhs?=
 =?us-ascii?Q?rG3wDheP4BJAjQDNKmAcUHujHiKZSAOhCnVSORCwiZX7NEU76yk1x7dp0idG?=
 =?us-ascii?Q?HVzNbkm2UM1J+nRNHrEWnIcNZ3kjcXTfgTQaauHOjreRw58uxiKxhi8srZxG?=
 =?us-ascii?Q?LnuQulVEcVsNzZP/J4b6mA2hJSVOsZxBlv2XbA2AgCtafcvczVZy93aq8hTZ?=
 =?us-ascii?Q?GbzC4dVlHBz//8CI086H1PXflkuwpSyGjM0amfFw6EoF0mO2O1LtIgav+I/8?=
 =?us-ascii?Q?ILqQgKDKovNtDaH1gMSo2pyKDD572XcMPXKvxHK9h9i1Ydcq+Xo/VLWGPiLd?=
 =?us-ascii?Q?juFKhi/P9Q6DfujbmC3UDLmlTtz9low79J8Qub1iPqr3lWnc6a8wpukZqhFf?=
 =?us-ascii?Q?YKoGvyyvPM8Jjjdr3/jGCnpGuK4JcnH69LOe6p+ZnqKjHHoZ0GX8HqQt8s51?=
 =?us-ascii?Q?WXMQQptkI36YAMBUyuSB+4rkdc4iq2cig5gQcDcT25wepuAvlPglUkpwnqdl?=
 =?us-ascii?Q?z/PXRBkYTZEDk/RQIGUmgr9dI8vJFEmdealZtB2yZh5BjScXVXY1WRadUd/D?=
 =?us-ascii?Q?9V9ICk0A5rXcBzQT13TkU6CoSCkY9suQGPx4vWZpJa6ytbWDp+VuFlI6GGFY?=
 =?us-ascii?Q?UX6ksvPrnK2aJBkFTw2dWAjp7EDDi6U4070kj0jPEhRPnlFaeUMw9OeD2Dsl?=
 =?us-ascii?Q?uSkqbZXEvIzg83ZMn0XNUWNzSBs/IUw3Gi61iOWl1HdB8bkXnT6CYJb8R1wp?=
 =?us-ascii?Q?Yb/yTNmDdpgF2JvVJ3p+pcK1BIsbeIhzO8iIaympKbudegrVpLO2BNF0oQIS?=
 =?us-ascii?Q?GYNWIfr3ywIdFNN92d5pIDsBNzjRngdGVPs6TmRICaSwdtE73zXCCBXRm/ph?=
 =?us-ascii?Q?dUPSwoZA3OANGUnGZZ+iNQY1jKirnPGm1O8Fm13U1yKk7EoQVpSDXdNCF2yR?=
 =?us-ascii?Q?t7FMR10ZXHPfIPpR1G5+MK3b/cEuGEA8emlALGSVIJpbbytvgCSsZv62LWf0?=
 =?us-ascii?Q?3rvSBWjXxOBx75F2047R+5i2j0ceY8/JO6D+Qrt9wQf6mZOHzBshknS7v9zp?=
 =?us-ascii?Q?p2fTuhUa+rf58TDuP7M4xTVyDsSpGdX3NzGqmTx9s1sBi2a0Q8UvSGvQnVBS?=
 =?us-ascii?Q?LqJ+cANSS8ZxSuUyeg1WIVn1RqSsZf8c3qIxGj7KvFD0v/kub0hsUa2+Bm/4?=
 =?us-ascii?Q?/11JTt7I/l2FNuzF50fz4P7DIm0XSv72Eb7BIWHCKP5KKI2N4WDG?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf90cbc-5c5c-4a97-1898-08df2523d6c4
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:06:36.8318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KuYmYWBetpK/eenYAhlhkgZxTlWFcUjOIYxxkLHLBA/0A0+v5CuAQYg2OKpzN5D6uszl6OyW2Rqwl37PwOdf2Mpd7RlxZJ4cWvtS2EjIvqSpgbAGcQ2D7Go8dGOUJij8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Some PECI client devices may return completion code 0x83, this
completion code means that a command response is in progress, which
is not currently handled by the driver.

Add PECI_CC_RESP_IN_PROGRESS definition and map it to -EAGAIN so that
the request will be retried appropriately, similar to other retryable
completion codes (0x80, 0x81, 0x82).

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/peci/request.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/peci/request.c b/drivers/peci/request.c
index db2cc30a42a4..bf80bd205e60 100644
--- a/drivers/peci/request.c
+++ b/drivers/peci/request.c
@@ -71,6 +71,7 @@
 #define PECI_CC_NEED_RETRY			0x80
 #define PECI_CC_OUT_OF_RESOURCE			0x81
 #define PECI_CC_UNAVAIL_RESOURCE		0x82
+#define PECI_CC_RESP_IN_PROGRESS		0x83
 #define PECI_CC_INVALID_REQ			0x90
 #define PECI_CC_MCA_ERROR			0x91
 #define PECI_CC_CATASTROPHIC_MCA_ERROR		0x93
@@ -112,6 +113,7 @@ int peci_request_status(struct peci_request *req)
 	case PECI_CC_NEED_RETRY:
 	case PECI_CC_OUT_OF_RESOURCE:
 	case PECI_CC_UNAVAIL_RESOURCE:
+	case PECI_CC_RESP_IN_PROGRESS:
 		return -EAGAIN;
 	case PECI_CC_INVALID_REQ:
 		return -EINVAL;
-- 
2.25.1

