Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2E8311971;
	Tue, 16 Dec 2025 06:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765867793; cv=fail; b=suvpfVxHbkJjI9QynbZRu3V0h0z8910YShYLbbPv2XS0QYEeYkUqq61o+EAa8wP4/aTcRMVptGVmCsmsDHykJlG4QWrpPbaRB6Aibu00Q1+yML0owy+Fh4Juz4OfbP5p5tBerNLxDQnk4erG7xteY33wGD6Nnxu5To6a6FNeMfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765867793; c=relaxed/simple;
	bh=JW3bXKLBJjhe7u9Bwlls9d+Fkk+Ayb0wzm4ZUVieMzY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q8dlWvZ68+uWX31OICJ8zOI2UNtYyuAk/L6I4kQ+g8OFSIx3wxoKZMu2Cyn0pcM5GfADTf+pBdWzBRp+nLarJ5M/EFU+e8L19d0yFhgOYfiBfpRyD7LrxuctNQv1ls2WWOuEm0TU+0d9ic0mWg8lE24AKYudqBcWbvgAFIao44U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Aq4F3JyC; arc=fail smtp.client-ip=52.101.46.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Aq4F3JyC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pttJK4nUlj1iU4KI8rVoJj5CQr2s9PU9lnZN8cgeGEV+nzdG6zB9Xt3xMNFgSGnj8l9wgC0FOPH99W7FAAZ/R79eWEngnvuy4ktFv35i2kF4+/+lBxXI7SusOY7dcyW+aBljAviT/Fg917cyjb75dxdepUdGmyAqOKEUnqmcO3zHiYDuNcw4WHJQYhnc7rVmjSDLupIDM1HBHwOObZrdHmPXgAn3CwXx/oM6Cg1ZlktB9rx/jIBoPi7jPVzNmleUYOiyj+G8vegomOReLanGzRzRNXo/OwP7v+WilS/2HmqmFuEE6eNnAfu27nSdcVKYQb/znQ4pGAP2TppC+BKHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KE0QteFmlnwQIEufoEcUem42TkpdJo0dY++5+stmHYE=;
 b=hSun7pu7JRj6o5DYk/ucv46+zGLSAsFynZ/IydrBSCEU54yAdclrUe9jDBuNXWrDtTNjO0+yeE8UqkK/GRPaj4g4TMGQvED36Yy7nWndXk9lsFu1WC5FzFgNWs+tuMNoNGDmC/NKDR3ck3adNVLRqUabiStiSSVAbMqCSRQ416zMXaJlZmqQUHtz6gZI+cGKXtn12W3GbpYC4e7DjVUKvLYRLwmXXmRm5tzzTvPvpAsUW56qj45bYsCtqOj/S8EzTFqCNuUkdTrn0HsIXLyicalVYPWOscyESjqf1TPpr54HmD/stdTiIhxa3DQLs4grF+t3Dtq5E6AKKs73aW6pRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KE0QteFmlnwQIEufoEcUem42TkpdJo0dY++5+stmHYE=;
 b=Aq4F3JyCeysWU5PwpgVu5Dpt/qJKIlGxjHnY0NeDnk7O8n3n0bDbg3m7CFubZ15rWr5C8Rb33q7A5t/1w0Hxn/jVVaTtNKfSsDHuRgaz/mCXmEjZN7ITLrZVLc/PvhEkbwMdQkWBHmPjyO1lIocLvXe8hg87qrVJiZ2LHwcHc0IMEiWITvZXkz5dHd0MTwVt3mrF5Lnf3DB9ddMcwgbkb9elhOAL+8NelGH09gJeHSzsqfgdrEuG9HYDl9n/N6Ola7+EZdHTWXu+rAUL2MxgDIJGyVfXnxPoaEvUZva2dH+HAC3r6DwkyE9ox/aMO1HJd/DwqJtTpo3BHuJukOvavQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BLAPR03MB5458.namprd03.prod.outlook.com (2603:10b6:208:29d::17)
 by DM4PR03MB6857.namprd03.prod.outlook.com (2603:10b6:8:40::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 06:49:31 +0000
Received: from BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656]) by BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 06:49:31 +0000
From: muhammadamirulasyraf.mohamadjamian@altera.com
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ang Tien Sung <tien.sung.ang@altera.com>,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Subject: [PATCH v1 2/5] dt-bindings: firmware: svc: add hwmon property
Date: Mon, 15 Dec 2025 22:49:23 -0800
Message-Id: <20251216064926.15817-3-muhammadamirulasyraf.mohamadjamian@altera.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20251216064926.15817-1-muhammadamirulasyraf.mohamadjamian@altera.com>
References: <20251216064926.15817-1-muhammadamirulasyraf.mohamadjamian@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:a03:100::21) To BLAPR03MB5458.namprd03.prod.outlook.com
 (2603:10b6:208:29d::17)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR03MB5458:EE_|DM4PR03MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef322e0-b61b-40d6-29c5-08de3c6f43f3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+FxrHoMCWwdDL/3jBGxkys68tbCVKL+fc69T0ExPYvTyY2LN1EXzbdCaj6al?=
 =?us-ascii?Q?Kc4t9W7pZJ0FToaG/w4qK6xISLuvx4LpDMtzs4c/egB4lntUaegbYfC5/g2D?=
 =?us-ascii?Q?R+CCcp8sl0TpZJid0E70Gcui+Xi5v/IXu3Cq7HXmM7pAXF+NazDhLRVJqgaK?=
 =?us-ascii?Q?wlu8mqTB1DuFuGZaAkcmccsyRn0nkOKUpzh0AeAfuS0aj0BuG01kGQeuBioK?=
 =?us-ascii?Q?AzEO23ZV7DyCgi2KKmwR6N6lyeVTRr5T0KfaGAaTP6/S1vkRLnmjx8F8fBtJ?=
 =?us-ascii?Q?oBuWVwRayLUpzleAY1pK9uKycdEfknJva04mKoY7g/bTfbkTSZ5Aui/O2dT9?=
 =?us-ascii?Q?Wk0qOFjn5lCZDTZgoG9Rj90T7yksLLJ1lj77Zm0UmYCGS5l9R795bdRpJNaU?=
 =?us-ascii?Q?d/DLULXX3IQxlFUv6I03jtj+r/boCWBI8wdHCEkIfJUcO0AHVvlsvApcirFP?=
 =?us-ascii?Q?Yl9aEjIU3u0+xJ5UoH0+of2vqzwh2pZ52PbNndpYjpd79eK1KuvM9YO+M+Qh?=
 =?us-ascii?Q?ZPsTQiV7PUKMtJ22cYhj88G0lw8g+ghz3rgJASW4pPxM7wUiQXVdKBRClcNj?=
 =?us-ascii?Q?YKX76yf7ZOBl793zQz74eWB+tpFtNttEO3AFRvr7ooZ9pMmYiV3LHsPj8PM7?=
 =?us-ascii?Q?9pNZDVA1dLdO75R1zMUtDz/eAbJ5LV1ZZ7iwzu7zs9zEbnRbdIXC4iqghfMS?=
 =?us-ascii?Q?yFvuwntI0Gk++bZ0IdwmYL1mQm+sq7jT/2iBQKP4zyzHnswiCm1PlQgoYAGW?=
 =?us-ascii?Q?7bipDBAmINbTZ8G0P+No53gyKTSaJLS6+Z9gNyKyig6IGgIGgbMSACzpUUc/?=
 =?us-ascii?Q?gnUZ0siQwkAwLN+zi1aUoZhRMLk0ih/kLbKc+EvXeopqx+yZB821upvmZqgs?=
 =?us-ascii?Q?o42+YuZcCra47fP115Nb2W8zRCuUWX6hREFVjtmwXWctnds0AojKdJduIzru?=
 =?us-ascii?Q?L205TOslPriJOwyM6RPjnmzIJsCG2yC8wCsnlZpRKijzyxXKe3pOnouYxlOz?=
 =?us-ascii?Q?p36tlaqRNjMP+WkCCX74OmtykfQic/klQInOu9KDBJggRLwxa0enGtphoOMD?=
 =?us-ascii?Q?3IFyPUVFMWYFtqfl5VR5tGHFdNFhKw/TdLBLes7d5qSRH4nrxRJWhhDedYkZ?=
 =?us-ascii?Q?ts+GXKDIOkauY4P72WsQ1y5a7SkGNKJBvuR5tXnH7efQv2jv51XWANR2Rit1?=
 =?us-ascii?Q?8MaV/L53vgXp/aXH8DQCIlBFd30ejphDv2JZdJK4/UB2Z04j8vdcp1JBBXOC?=
 =?us-ascii?Q?KEvFiy3JqB/UMld+PWd1qGrD54ccxSCaNn0mZGz6cgNsVb0MDkAewU28ykYM?=
 =?us-ascii?Q?XFG6ojczkzjhXH+DVPkGXpnTsSuqjYougJ0vyPyQNJ5OnGu8YDU/Nc0cunfD?=
 =?us-ascii?Q?Mk1u7+AbnxXaCTSQdNty9QxdD0waphCXq3Zi8KL36kruD3UL0AlMPqSk790i?=
 =?us-ascii?Q?OWHi8M1R9s7i+8htRG17m9eJ0SAyR/WfGAw8aSf6LpDNcc/J/9+ul3gl6N4o?=
 =?us-ascii?Q?HvYDCl3HutiOFgI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR03MB5458.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DtBpjsAE1vd+D+uLvBh7zSZEtDOXj02Vi5LzB8OPFX/QQQtITQWpWIMZLnJV?=
 =?us-ascii?Q?+hB0XnS2tdieWlkVJm50Lcq9+P4rr6iFxCSRrkMRpezO1RTWUjV3YlRgHjQh?=
 =?us-ascii?Q?l5+mTiEIulCtO42HNcaYp+HOMXcbfisx+AMFksZp+8UQqCU83KY58yRIFrBb?=
 =?us-ascii?Q?MWKNyT/sRUQTQ/zoFRpR5AcUoVelViOvfk5+bCMR4RuTQOewQsMIuXtp+W3s?=
 =?us-ascii?Q?ZxCdipwK8d/3hYiq5O4p52lGTtRwlJByqTvLX+pRhVoBOib6mruoNXH83Gpu?=
 =?us-ascii?Q?r2PSrNuObxyJpKiiP6RKsBEiBslBjT7MlrDWM16T3SouzIjLl/OfLrYIR1zS?=
 =?us-ascii?Q?JviiR4LPj0DwShCqp2OPMLjn0onbgmRKjLN6LyUd74T/BPzE5EC2/noCjOw1?=
 =?us-ascii?Q?4V97qCNkJHxMG2oAGgRMdktrvHrL4ZnYFCoUXPpBa+9+BcHTFQZO3UGYuKIf?=
 =?us-ascii?Q?joagfc2SDGbkw88+hrWJXKcf3MCihOpp8eE4O8kLaYJg0iG2y2UhPsxmqaPv?=
 =?us-ascii?Q?mx5BjW2FfYZ6pctsT9S/VXgVFyYdb+zmsKJs/tdNOhz58mEr3vM72iGUUr/0?=
 =?us-ascii?Q?EPe/fOlpzxGK5+bfBMbjxhoswa98xcnvIOfYxMoe6ZfzsBQPjX24Cl2aF7mU?=
 =?us-ascii?Q?fssQii08Rm+edOVwfEG3GSI8lTJWixiPqv5pstOTqRRCIf3h5V6ncBgXoSDx?=
 =?us-ascii?Q?c8QtQvYyMvc/XFdWpl2rYDityaXoiy2Er65bKDRDCPUYchOH80yvvF+pvuhW?=
 =?us-ascii?Q?Xv3Bsl+5nijGBD1wMugiO38+J/SqllydvKPpEpP2nm3+OSS2knGOe+paYWJT?=
 =?us-ascii?Q?zn/aPbYNxXidxU2BbsgLAbaNBV4l1KK60tNffojc11Zw2WdgNv7BN2FZM2LG?=
 =?us-ascii?Q?eV1CPji6SK9mpnwVGfJt8GiAwZLTU2tk280u2FDwOR1f4/tPfWsIxi0FQCvj?=
 =?us-ascii?Q?NRMy9aRYPKgPWbTrTHvTo9CpXWqRvuBGdRMZLWkYnB+5j/uX0Qb/Y7PQV7NU?=
 =?us-ascii?Q?auRXdfFZCTn4JcvGPchRNWjyjk7c0d71eMgdxshbQC85CCkvOt0xAq/v7NW5?=
 =?us-ascii?Q?EEae3e8WNTM5+SBAads7SYw2Kgqo2E50HT3mwxOgUhzNd+3jBToWnAPqT8R4?=
 =?us-ascii?Q?VkS1VEzw19+MsuvcbS0xgOno2HhI4agXGmip2OVt3YmWr+FG+P8XlhzrCgKx?=
 =?us-ascii?Q?BEmT34ahkuAQ2C3r4Ow0+DHDGJQ/jKWDX1Q1uAY+178z8eWXTTmQpbQMtGNo?=
 =?us-ascii?Q?NMIDjJ3ETK+zAf6lWnoQZgH1GOUyzGotMnG68mDX41SaQa1md7RYZFDYyQ+r?=
 =?us-ascii?Q?WrQ4uYvfmQZT2h5d5tVIXqljhY+bigtmfqQLLF6QChaVOWhwGuwRT/VjyNpz?=
 =?us-ascii?Q?dmaRPzlwdwjLerqBU89Yy1yfVVsE46+goNKNKrklm6m7HBD6g0k3XNH58w2X?=
 =?us-ascii?Q?F4MZ2aBhm1D2x8DhytU5cHfemt1ZeA/8wsK2QRoD/yK96l/LjuePS6ZM5JuB?=
 =?us-ascii?Q?XtiqmeXO4yPkEFTvRoV4HLpHWd21XKNKBDEunoeQnL2UPISdme4JTW9h9LJP?=
 =?us-ascii?Q?G9FIGiN3y0c70H20NeC2tuYGRKyCMOEObX1hmbGE9Xq5nE2FgwFtJajT68LJ?=
 =?us-ascii?Q?tx2A+3vnuCx02gUFQDVAfYePABHvdSHWDDmQ0mdwjusTgL9uuoeXfnnZlwWM?=
 =?us-ascii?Q?+ENkrPZ8p46OH5b9IB0y6tIJTBdz0EjdA86/nYOdQ8VABc1en/DRzWnl5jN1?=
 =?us-ascii?Q?v9AglCjlqiWH+xNNicU78AV45lFP6j/BUv/3HICy/p+uoPnYU1b4A9Unj9fx?=
X-MS-Exchange-AntiSpam-MessageData-1: UqksL3kYfVMwAw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef322e0-b61b-40d6-29c5-08de3c6f43f3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR03MB5458.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 06:49:31.4079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7/Zv6mx9JqGmJm8J0fuZrK+FQzJ/+1XVo4O95+DVlyD5eGw3nw/E7Vmi5LToJM/YMe4Y6Z8fd3I7NbUo+NyGjU8tBeIbZG+8BfzTYGs0wVwSGTiSfeGwTq5GaLc/Af1j/icbvSNJbPAFdBL4flxug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6857

From: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>

Altera SoCFPGA support hardware monitor feature through mailbox. Hence,
hwmon property has to be added to the DT to enable the feature beside the
hwmon bindings and driver.

Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Signed-off-by: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
---
 .../devicetree/bindings/firmware/intel,stratix10-svc.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
index b42cfa78b28b..4767904c7b76 100644
--- a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
+++ b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
@@ -62,6 +62,10 @@ properties:
     $ref: /schemas/fpga/intel,stratix10-soc-fpga-mgr.yaml
     description: Optional child node for fpga manager to perform fabric configuration.
 
+  hwmon:
+    $ref: /schemas/hwmon/altr,socfpga-hwmon.yaml
+    description: Optional child node for hardware monitor to altera socfpga.
+
 required:
   - compatible
   - method
-- 
2.43.7

