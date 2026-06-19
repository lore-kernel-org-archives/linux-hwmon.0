Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D673655F5;
	Fri, 19 Jun 2026 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781861946; cv=fail; b=LIRnpf/Si0ZdYEgmbnMcSLBal9s9qTHve8gd1OWwkggnKAMAbYRcXvvFTIcL6oh/Uax7T1XQns6Greo9m5YZbghTKQuGi9n/gegyM+y7pG5jLChl6Q1PaZEBxvPUeKa4XLhLNWhZjWPIfAxBKzTq+UqSXrfu2m0LUsFCH+S4hG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781861946; c=relaxed/simple;
	bh=byoV2jZyuM0GkZjyUiDb5W4pgMy24wEhdlki7VgzZAE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KE+vr5wRNDTCP2Fi45n1FXSAmz0VgSubN1yccihH3x9NKWUvcV7Xg3ldpXii8JlD+h1HIx4NflrMMKywfVY8LvYZCTqDfzK0+6xT6yiUg6hm6ibXUPNaZfR5BCxyxgsLtA8isB4HxsynOIW/mcHopWxpJEwXYzLbSbBb0iDihaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=tqDy5SCz; arc=fail smtp.client-ip=52.101.52.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="tqDy5SCz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNgta+o2pl73a0m3iuPq0JIrzy83cTIW2mAjuS+f9Q1lJ+PRBxu7TXC+gV1zamutawtgsKRN++HQ4RPgZKZPTLEKidOZJNEy/Nw8PPVnLiOjC7lb+8jd7b2WpRZz3KFE6/ZJsToAOdK4kWJ+v1yTm6CpSSUmIOW975uvuELu1YWqsM4hQt2CfL6gRsMAcZNW24SSZyJod/ULcZFGdOpUiLcQMFZ2RK1+Oogf/ae999HUiarkkdP9yp1AiHIzDk/49oKpL5gS19GuvrXlW1oPU/kukBEmmuEMoKC4hkvpriRYeY8VYhZH/xZK9z8a+uVOPPa6MjB8X8wBEQgr0JbPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhLTCsoYIs5FdJ26Xgt5A9OnzlkNogl8nGCSko8wSuI=;
 b=HMHPKdfOJHyIJfJpSK63wQ7Ct9AI2zkCFaL4RGsnkijedR9WJys/VuCwkbgHShtyNzZZnDrqp6rKnb5uf0BOEkH7+Tyj77ybNjOUy2n+CtV/FNwLGbF2MmIsV9BFBuC8aUwMwHBp0G+E8ZIXOHvsFB03ywvQYRsqQAyybVMDl8AbZZ+LASkX4EJo2qVOI7KScz1sWGvckRg/2uCSUqbk/WCZLERLOoLI425qnEo57PAl/nOuJGfUSNkLvf9n4711zD8FTw9Sfx3VHDBDWgSi+G4tIvbFgg9PwqdZY31acmVFp/tVQcgIGZFOazG+Puac8pStkpZE8/WmGCeYz7kA9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhLTCsoYIs5FdJ26Xgt5A9OnzlkNogl8nGCSko8wSuI=;
 b=tqDy5SCzI14R0IvQB+BLxRTGPbEnj/CCOO7B5GIWIYajizMqkax29VVmJFTbA65MqkNhHFnVo55nOoJ3DrhieydsUX5YS7p5TlcwhOkBLwNfV9XtSjpwQuThiFfozrWJfU8t0IJpDEqixmz3b3+BdUs+5+DBvGa3f73KexImrB8CzUz5b4yn+RzTrFX6ZwtqiwupgG2IB7Kb/HtZOT/tNdKoI5ICgaW5YZLVflut/N/JWvk2LJqP4POyXy90Yboaegnw8puhBZqTkLhq/ej/IuE21k39Vaam4plS68UHK/uYvp2exVRH3uQF3OQDThul1el1qunIApBkKEk5grlplQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV3PR03MB7562.namprd03.prod.outlook.com (2603:10b6:408:28f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 19 Jun
 2026 09:39:00 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 09:39:00 +0000
From: tze.yee.ng@altera.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: firmware: svc: add hwmon property
Date: Fri, 19 Jun 2026 02:38:53 -0700
Message-ID: <be798fdfb7ec76e1f7d04c1fd00126c88c8a2e31.1781861409.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1781861409.git.tze.yee.ng@altera.com>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|LV3PR03MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 88cd8d87-a419-48b2-47f4-08decde697bf
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|7416014|56012099006|55112099003|3023799007|11063799006|22082099003|6133799003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	L31wRNC/pHYCW/vczVhk/0DCFF6/9jntNbxDJSfgkkScTNfbTO08Lt8HOgUzPd4VI0EIzIYxz97kKrHdIwP7hTvRnbGXQjTecRGXb6I5ZaiUVNKW1DzcUQCuzqjYxsTDQvtZ+DCmJQrGNwSxOnNdWXfccooKQMwIiGTOAGrexAQ5Ye0DD0LRQ+FFT77uC20w5xPYAQ1JOfBBhdsNK8WfwQvBXlHHv5bcasrp7gMcok0gB7chev+SvaITpe9yjZhvumVH+1h1+/5VbCXtrjpP6YwhXS+tOfchKx/mOGgyMRVWwjNL9xQjnY0SH8qMuELVHs/17abw6t67Mo0FcADhxtfz4IT3V7l6wQnXTIarm6uHDToTe+X/pG9ME9Gz+UyvWvjQzlM2CgipL6Kdcu60oQtzf/XwijiIJ0uosMHyJGX+6M5sKdmT5zA8fipqDRyIQ7AlQ4MlVCHz7113jpulDXWT1D4oZyQDkm3IvRGjL1+pDC0yMI0aNcceMyp4jTFgStT17YdmdyeL/n4BTi/fkXoSDVBUXklztErkuTsn9n2ubEoqXoUm46gvNeo6NqHLiPGjt5mUem08SWu6cdkcHOnt5sS8Yl/mXFs54BicZYR8r6AB6vEJLI7uW/wjsapI9etmXpNlGvjImuV6ci2xD43Mu/YexH/R7L/QaNNXzksCx8saT9HJLnJInRWFfV6KAvs9wUHaP6U4MLajKCCCcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(7416014)(56012099006)(55112099003)(3023799007)(11063799006)(22082099003)(6133799003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FrbTf5UAlHckQnbsPz6yrOTxv/sb2H40OxJhSkzkr5R4gBnrbGbOF2ME57xw?=
 =?us-ascii?Q?hNGCDKNEI5qsgETQAaUrFeD5Wszy5yTAjl59pkLc2Jk71vzlLH6j8FBE3iRV?=
 =?us-ascii?Q?vHyv6UnY0vh4LcnCaaQ1HhLvF8NjqPcTsXA2wAShaZv7ZrzdvlSzK31NEuMM?=
 =?us-ascii?Q?cgwG9rEbhokgwacCvEFZMYttc/yrBjJoAUpZJGHMJqRAZtyjdM9i3y+j1yPH?=
 =?us-ascii?Q?VwsXw8gIZDjfAiMSrBLGrGK5X87yJ+vohPvjz2gtcG6XBneM9YJ7ld0M221T?=
 =?us-ascii?Q?zEp/0Yp7kiIXYkoOm8oR1yIFJtbPrSUeV5n4MfTAG2j262XBjs5T/hJZkX+x?=
 =?us-ascii?Q?6a1eDs4txFNSVBAKj2wvf+jmForX4N9J0SZ6K5fAtp/CjJjBTxDyQa45JoUc?=
 =?us-ascii?Q?rHpJT7nlCSGMuYdHWhHj9CCuQJCwYOJuFZMjVssf/yVv86qD7Pr+LUT3SYTH?=
 =?us-ascii?Q?zo/p+LkxTNTfYdF7Gpnx8tPhUuLKikufwTeRpcHYvR4ccr6TbSr3Fz0rGA49?=
 =?us-ascii?Q?YQoNGrDPBW3Fyd7bR9BEzE3uXKrjMJkrFVxEheNgNfuxPBU3cZEhpGQqiffX?=
 =?us-ascii?Q?e09Rq37tzdTZva9vsq1/WXd/bdH80rLLh1zsu1l0jP61lodRGcSvfA2zWG5p?=
 =?us-ascii?Q?e3y/bhJvFPl4ojpnF1pyctEhqnmNwJp6gLieFH2BBbJdiE2ROuR3v4os1B/G?=
 =?us-ascii?Q?k9p1KpROA7X9ikDLocos7ei6LdCcKYl9ykZ8IJmmLhG5QEbIeuBkYsbeJ/yj?=
 =?us-ascii?Q?9GMXXN33OjBfaCY7aks1fQgXVDvev2QFsIyediEQXZvp3e1zJbYoXvGx+xQG?=
 =?us-ascii?Q?3g31P7O+jru2dOQXqHYPoIevo0cSj4iWKWBUfvGSnAlY1fBs0CehapgihA8Q?=
 =?us-ascii?Q?RfxBAXzuwJPXZCe3l8ov0BIk67pyKTrJHkxK23r7v73RZh4Fp2Oh1uGKDu2B?=
 =?us-ascii?Q?8qC5ZVDU/HX8ISy/KsprzOMqNntsM7+nuJ2fPyCptK+UjgJvvgaHuGFyZmEh?=
 =?us-ascii?Q?+DGbc4aDEKRUCGiPILKknMI2eYdbsfI4TnXp/IbQZyp6HzdCu108TWgsqlBh?=
 =?us-ascii?Q?zpxKuz/fivY6/urJCWeblhk9brzMpXNn++JWoIqGxA2t0Yi1DGtqR8DXX5BG?=
 =?us-ascii?Q?aU4prmlgPevTyQ43JJ1wYnjTzGmNsPyzD8lCW1U1wutNJnIPpdpt1RZHd64j?=
 =?us-ascii?Q?MG5K+sW6ZdbVc+zrTY90peCefsa0HHvGWzbEqo/0aaJUrQQlyFgkkpeihe00?=
 =?us-ascii?Q?VPxsHoPNW6iDPTo6F/3uRZhEOhU0anZJOb9ioxOlCdflYvT+gzeAsnrDAuyF?=
 =?us-ascii?Q?CbvLk0WEg7F277/ImQfVNBZqNH+TT5jiOuu9fYat7AhydveZU6pQ/fQXF2/N?=
 =?us-ascii?Q?BFG8PQw1Cp2UuGCu7eScWi8smLfHk1i9FzDVOxiWYjRsyYDdQIKRo6yznHUu?=
 =?us-ascii?Q?r5Sq+lWb/XiIJV/RBulm1s5vjLlYxhTLKmdS+aVfeZflJKhvdonmasjkJYbj?=
 =?us-ascii?Q?x1fkE4pAxvGthwJOxUGPYGMGTXXfNojau/Sa0+kHX2toB9ca1goGE9pG44y4?=
 =?us-ascii?Q?1eIurN18UO/BKo2mW8HFKn6L3gtBHa1LWFGPtK4diV4ASNPvxl571q2g37RK?=
 =?us-ascii?Q?jhRniYr7bGxqXMkFHbBZFZ3IcIEbYnKTYxS3ymxRH7Q6RkJilPIF+u5SVzNS?=
 =?us-ascii?Q?/iUvlNtBXRniA4TJcotLf85UHc9Q3dZGMt1xec9xjPF/BqIaXW3n8xlDbwic?=
 =?us-ascii?Q?JyBw4DQAFg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cd8d87-a419-48b2-47f4-08decde697bf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:39:00.6792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAMkjbYdrlpPlO3HgIG5fS1VkjtmAThp967F6qDd3X4YGuAbQO0OQUeEjNX3p8Tb5xFxgB3zDJDgMKiskWS4PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7562

From: Tze Yee Ng <tze.yee.ng@altera.com>

Altera Stratix 10 SoCFPGA supports hardware monitor access through the
service layer mailbox. Add an optional hwmon child node to the service
layer binding so device trees can describe the hardware monitor.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 .../devicetree/bindings/firmware/intel,stratix10-svc.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
index b42cfa78b28b..86ffdb10132f 100644
--- a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
+++ b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
@@ -62,6 +62,10 @@ properties:
     $ref: /schemas/fpga/intel,stratix10-soc-fpga-mgr.yaml
     description: Optional child node for fpga manager to perform fabric configuration.
 
+  hwmon:
+    $ref: /schemas/hwmon/altr,stratix10-hwmon.yaml
+    description: Optional child node for Stratix 10 hardware monitor.
+
 required:
   - compatible
   - method
-- 
2.43.7

