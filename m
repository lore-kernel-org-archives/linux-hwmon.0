Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010057.outbound.protection.outlook.com [40.93.198.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF7A33A037;
	Thu, 19 Feb 2026 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771506098; cv=fail; b=aiCa4Qs63u1XPc2EYOu44NwKuccf7bHKokLcnvDtJhjoP8I5cb/wB3MzPMwLiFblKLRkIkOsikrDSvED6ge8ZwkU+u2zx5t/YNkjQYKVRolMfF3qrKqUCLJDRgG9T8tC/MeIMpDu5AYIeS4w+5gXiY/6AggLZYticvqgI3D4WKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771506098; c=relaxed/simple;
	bh=pR0u24SehuLTZb6walfYDgyg2GubQCIt+bMlH7NNwGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4X0NYBTwKiFAXVZUsHwXY5iy1mrotWbIJ9HwsX8zbcibvjWnDzH7TI6rJym+wqRc+p2FJsqXT+OKJB+Ls53o+RmMLhkBCLTW6EUBTGYIR1MC60c4fuYvlXDJV/LqIA89rd449W2q9HuOa17TloRSNfn46T8jDGWwWAeGfLdMIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=Zdo9LjUh; arc=fail smtp.client-ip=40.93.198.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="Zdo9LjUh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGgx4Bdo4IKjbe69FRTS4qhVEus2lCnMNVpzpWBD0a0q1EmhZmEALIhePu6Yjiz7HOyn0NbqF2A1dUj6Xs5opWlK6DXcZ6oEVsDAtSqXwbeKVKNkgU1jC0nS7P/l34MA3AHtKQbnIouNqAVNRbS5kP1h11k3zeQ4IPfaF0j9BEWMtzsa/TxzTqmSgpvHiaXCA6TuB7e3I3RnpMzfPfY4ZJOCqJO4CXkI18vOW7cQG1PtzNdKK7n9LjS7dmDBbsfM/GyDKBD4u7zyHFB1mDGI3bPIKAdofk3GUqYE4uNuyPC7pwMC/Y2e95rk95Wx0vqHrCgvgqnmReoGIDIphT+0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8bjoRV+XDWxlDW9CF118H0oYCw8YEx/qwr76zvcFaw=;
 b=bNmE/vZrwjiJMOk3FNG2spIl4CdobQTZvnkwEgd3p/FB8Vh/StWXh5u5gNWyXewaSo0WeDNyimyzMzNFLRd45QYS2b8TN9Up4f5z/zoxUyjegJZ/lh9vbrxZ2WV5yAYd9mog5oyG4lj9VLzfwJ4pFOfVrUUJIOouegfWpdoUvpoqfKXCKRdt7otvldszkY9Y43e3+pIfyJWC/9yvW3ua4nC/4T4fGgvCz7/cBfvRQfMdRy9Wylcv6wrQz3sZocWDVUiWNkNtvLIbFW/0bgDGQmbqraXixDyuAyr3kEiFInoOYge/kN6nL3VXPeUX5fb4hIIf3AgNv5pqSWCDi6EsuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8bjoRV+XDWxlDW9CF118H0oYCw8YEx/qwr76zvcFaw=;
 b=Zdo9LjUhqRMhjA2w02nHFnJ6VJSL4MC39d2tQ1CP3Ni2Vif7rKV2YIKnRqJHdoQX7iEsWuE7WmvMtNivD2ggzT7ujlOYRSsU7VORPE/ULzbHQ0GJbJIppuZDAXWCJRPUpDemCLN1ss8qv1fVa49n3EsGTi39UOZaLLeu1msa4UOylIpDtNvDsX4lFQa9xRSjKqYr7I4sZDLsB5f/FA4Ai8ZVIQCL7nJB3/leyuYeEkc1Uf4NKABCeGtMcdbUnLeObu5lerQUeejgzrBcHnJ0FLSdL6K8dfDs9lH/4XGshxYD6snPggVtMKK+PY045tPoeoYpbvAVCRk/psRht+JYSg==
Received: from BN9PR03CA0419.namprd03.prod.outlook.com (2603:10b6:408:111::34)
 by DM3PPF2655D16D8.namprd22.prod.outlook.com (2603:10b6:f:fc00::e13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 13:01:35 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:111:cafe::c1) by BN9PR03CA0419.outlook.office365.com
 (2603:10b6:408:111::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 13:01:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 13:01:34 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 62E1AF882E;
	Thu, 19 Feb 2026 15:01:31 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
	=?UTF-8?q?Toma=C5=BE=20Zaman?= <tomaz@mono.si>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V2 1/3] dt-bindings: hwmon: ti,ina2xx: Add INA234 device
Date: Thu, 19 Feb 2026 15:01:22 +0200
Message-ID: <20260219130127.87901-2-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260219130127.87901-1-ian.ray@gehealthcare.com>
References: <20260219130127.87901-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|DM3PPF2655D16D8:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 16a07830-d3c1-401e-7090-08de6fb7029f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zE974zx3mS9JW64geoTqPxiNLtmfBrxsmE8epnNPMGSs2XtvGaaG942IQROl?=
 =?us-ascii?Q?522lzD2/sW7nom8e3RGeZvQ85L5YDjFlKfC88L6+oQupBfg9HYCZYzyyUJ8u?=
 =?us-ascii?Q?My976hdFHBjGGWftRNRo0+lYtARRTFLR2qI8yE0qzSBi26gTl84PhAUo5TqM?=
 =?us-ascii?Q?HRsHzc8EkgPPLcwVmYS/43OzvS/mrCKtNtdLs2MCRMwQjbP7uecVOtSE81FT?=
 =?us-ascii?Q?I+KpDeB8e7y7vpGZjwiusUsqn2f0rXRgCS2wd8BszEk+y1IMzZEUAx9O03ko?=
 =?us-ascii?Q?aOxtthH3YXGtHqTaxcbFKGk2/45N8C15BDm3RWRErbadF1YfSExDy/qUTY5t?=
 =?us-ascii?Q?dH0npvDumRlcOWKDX1cIwMuN68IdUvlFTv9rma2071VNVRZOLvBxBW/FGkJ6?=
 =?us-ascii?Q?ZphyVlIq94s/4hwCbnnH+09EyKqTH7MXe5sVp9D1HfDhNHj8uncoIfL8Cg9T?=
 =?us-ascii?Q?j1tCdpCMfe3C84afibwGc9xUU6nqPyQ74sc+QlkhOQKhTv4nMbXaWWTQM8AD?=
 =?us-ascii?Q?LapKWbYReshn8lD6Rwq60ciXFBz95sGpkQRZBZaGT9rcRm8RXPFVCf0GTRtJ?=
 =?us-ascii?Q?I4p56jgz4VAJSoBrlciIQBdcVvE7rd4EYiwU7Y6cV2RMree7/hmuLZLrV3bW?=
 =?us-ascii?Q?SfWxEC1dLr+fkEqcV6RnZT4q86jeuyi/s5RGjCTY71LtWweX2TtONttNh1bo?=
 =?us-ascii?Q?JczcBt7SzskDfKtx75d4YdR+n2aAH1FJgEMqyIbl/p8Q4nMmKql3WYqwXM0/?=
 =?us-ascii?Q?vHv9wI93h19XvoH951OD1avypvUUXZXnYlYsQhYK4/EqLMJ90fQjPlIT8LGQ?=
 =?us-ascii?Q?abLO0vzSB3APWR/FsZwW+xXoCcbPkyE1ypJIHffaEoB9CK+UBJM0lG7u7brr?=
 =?us-ascii?Q?vMR6bqzRjQGCQA5sj8/ZxLNwaN6y3e90GHad6wskZ0NMMLJDkCM5XYzkCFYW?=
 =?us-ascii?Q?hov0cLfbHlXQlHfjwP2VKJn3P/7KtbJHODEWXuOiIM4RrLz2I7FfHvVNZXTW?=
 =?us-ascii?Q?Wcq+4UQPVBj8GZ5ZiPk4DBPi1ZYfasu0Apwbd1FUrjjczet0hfDmtJYrLU05?=
 =?us-ascii?Q?VMmc+f1gqHA46cRLQT2lIAiaElVG+qpILr3pyi4Xgk4Fm3rVtB6o6/Rxmlez?=
 =?us-ascii?Q?QkoXINuTJLRJOKcbzczMiFBIm52inWGPI16srgNo3p0CxHg7EnSB5aQvwWr9?=
 =?us-ascii?Q?TjEena66kKb2CWN7x4YIwFGvwYKiDnofcZ29xl88N47eF16TsXXIyk65n5pQ?=
 =?us-ascii?Q?59NX18Cu2Vg1eYz7uxaOpxwLUl2YXfzBg+aQYsYlZKot0xCM1g/cN/V+o3Q2?=
 =?us-ascii?Q?TQSSCVStBw0djzZJKqG1CPSnyTWYi3S2H6QTzU0KXlRDkC5xOfl7wZS49hKT?=
 =?us-ascii?Q?7zgSBqQeMDryMeoSrmDBjA4YdC7ducNDoCsEzJO9L1dwDJVox4DKZDfS8eTK?=
 =?us-ascii?Q?ir062hhvzWeQ76vsedms8clW3WaJc2FcPFzx4dLiZWI7dgr1zbiESW1hqREH?=
 =?us-ascii?Q?0GyQm/4fyy2I/Y21OcRskiaRQPZOq8+Z3HwwW7OCLZaB4S2Oc5y3IIUUMWsc?=
 =?us-ascii?Q?Tc3tso1GKyvc2uL6LLwUmaNAhXhJZohURwu5MOaX5YFdvkVJeP1qXIxwwfQn?=
 =?us-ascii?Q?HSSjMGL8gpd2AU/dy4sByUQvrOzdPKvIppIfnvMnV9IrF/FVnxwbJ+Kpuv0G?=
 =?us-ascii?Q?uB0vuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tITHWQsw77xaL8wPyBP87Fx43CJp3HhyQeZbLGmyV8BR7quo8yXpYfrehfzdSUrtj9WMgAerjqfFEjTQF/if9p4XV1nCdCFa53b6rbqnpq2ZrHE2ZWI/1AHYFyxSgTPABTjVJtR7GrXnm3OiqYRd2Kgiw4H9fjIE0I5ftibIw4epEELS1eyNtEovGdVWQC8gs7Gvb/FLQFSPC1nRKoks1jAgyqX8PcIzw+iXiTd4AoOtr4frfrWSzvENM8R8gaBh7zQr0+JQng2bxaOhPZuRCXIJFgXPps7ufYQic1TV/ebHA7P4L+PoK2IRhhpVC6JrIXe2ZKc0jINUnCMzHwRpsoweIYeyXGB8RyG1YLhvkrA8FmBQ2uNn3BPlOO9RfqJpNGYrvCoRxWYyScB4ZYQSNDSzi4HxsSm7zUsZ4B6pytrx6KRja9zjqDsp4NbEVbeB
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 13:01:34.3533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a07830-d3c1-401e-7090-08de6fb7029f
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2655D16D8

Add a compatible string for the INA234 device, which is like INA226 but
has different scaling.

Note that the device tree compatible must be different since the driver
uses the compatible to configure the scaling.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> # v1
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index d3cde8936686..009d78b30859 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -29,6 +29,7 @@ properties:
       - ti,ina230
       - ti,ina231
       - ti,ina233
+      - ti,ina234
       - ti,ina237
       - ti,ina238
       - ti,ina260
@@ -113,6 +114,7 @@ allOf:
               - ti,ina228
               - ti,ina230
               - ti,ina231
+              - ti,ina234
               - ti,ina237
               - ti,ina238
               - ti,ina260
@@ -134,6 +136,7 @@ allOf:
               - ti,ina226
               - ti,ina230
               - ti,ina231
+              - ti,ina234
               - ti,ina260
               - ti,ina700
               - ti,ina780
-- 
2.49.0

