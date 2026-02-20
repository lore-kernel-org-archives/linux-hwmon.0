Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012030.outbound.protection.outlook.com [52.101.48.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D7832F74F;
	Fri, 20 Feb 2026 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771586435; cv=fail; b=e2FzcKviOFN1XJqAROnkb06bKrGYjBm4xd6xQ7oWOAmg/TLgYZYcoaXat22MFv9Zw/PXo20ekA9VVZi8ynhOSLktTBEsfwgDBA0F3aSDmiYhLeQc2E1Of6KrP0JGkyrTzndOdlBmmguh6KDS0+GqXC7KL7oTHq3hNXN54uoyocg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771586435; c=relaxed/simple;
	bh=pR0u24SehuLTZb6walfYDgyg2GubQCIt+bMlH7NNwGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DHmJY3/z+3RRfIfPCUpn0m7Xs04YBJCM5Mj2ji5zUWPXSaooD6h9MG4QwqUi0WSPs1tf5h2cWu83iovnmpJQyQuboE1LjV5/Ix7Ms+qVd/oB1vrM+trlfwdyguKd0dCpAkwxvzoLJH2Ff/t/Rww+Hc34IdhtQG++NdYHpz3wY9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=AspplcGz; arc=fail smtp.client-ip=52.101.48.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="AspplcGz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdlK1p7m2AcvBkaXCg+bLj5qrwj6ueedqNZfcQbd40h2ZKEF+k7f5KVPN9XSH6/cM+MAuVxMySUapTsyCJ3OOv2Ez8HSpX7FW3xg5GYhOBTJWJEL5jNUTCbTpa7LStAprhbrc/kNb4n8TGT8xBDNX5tWloMQ4ty6XAvq1vsVZCJCbz6PJhpstL/QcC+DFwOLrXCGMYR1AldFbTCoA+c0W7d2yA9yJ6f6pfLJ+81LAJBLmSdVsIyCdKenkfWoMFXJaf349MXSjRO+qSuwLDMdff4q9M+DH4xp0Wn1zL7mJFxt1ecLYk2pbcrGvYWf1taP3nSGhD42MnQhHsUDnnIDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8bjoRV+XDWxlDW9CF118H0oYCw8YEx/qwr76zvcFaw=;
 b=lGLA88Z7voJyECt4PJAcVMMky2QzlVpD857OFTlyRDrlOdiKSvRVNHr3pJe84dh5IQIjx2Jv4awnoQi4qZiFxzSVO27zvURa1N2CGd+jsWwQ/1vMEePbElg2aSgNip6/I/CBl5db1Bix4XB68PyyC/jhowr6MR9RtRHrODa7/PZWLu1BqiN7PWpaCffRfZpxYXk4MxoNrjm6H8E22F6JN7zM9AWeZX/ZiREltXuAO8JkxnulC2d+t26NRXZZwq6+Wx42FbtDaYtT6V7sOr1AI6euzLw/2nh7dvBwNyc3Q2RYkZYElLaexOMTEpBR1eTtxaNK0vmUq2r0240L0kvPGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8bjoRV+XDWxlDW9CF118H0oYCw8YEx/qwr76zvcFaw=;
 b=AspplcGzd4T08pPtH6UGF5VPay4Fn9+rb1vy4AzW/tlA5HtovW2X4Hif8twmCzXbSf6Ae1S9mFc5t3nqpUkArsFMZprACGLvQsyMoB5jn1UNu0tWAxJpdosT9FHUlsmWg7obFm2FAtMshFky3OwtrxKIyW5mw2AzxRN5fc7bvAXF01oRrcTwReAh4XefG1JJhCLpWmrWrJf3fb2yaiTsYdWzM8r6JutrJtMhfb+v+ofMKvrKM/uyNH9hKsCVCJTdBeV2q4bIDmzuCIQShrcTL8HTqU7TwHVX3V68tll+vy+npN+62OJHx3B1xAEOxUz5OXGMjHIAe1c5GIGVMQOQsw==
Received: from PH7PR17CA0050.namprd17.prod.outlook.com (2603:10b6:510:325::22)
 by DM3PPF244ECF754.namprd22.prod.outlook.com (2603:10b6:f:fc00::e11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 20 Feb
 2026 11:20:30 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:510:325:cafe::4e) by PH7PR17CA0050.outlook.office365.com
 (2603:10b6:510:325::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 11:20:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 11:20:29 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 6F17CF885C;
	Fri, 20 Feb 2026 13:20:26 +0200 (EET)
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
Subject: [PATCH V3 1/3] dt-bindings: hwmon: ti,ina2xx: Add INA234 device
Date: Fri, 20 Feb 2026 13:20:20 +0200
Message-ID: <20260220112024.97446-2-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260220112024.97446-1-ian.ray@gehealthcare.com>
References: <20260220112024.97446-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|DM3PPF244ECF754:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 81bc48bd-df27-4345-7d20-08de70720e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qxr6s3qV3x2HXoFSVVf0hM13TJDAvMGNQpuZgZfRVde86MYOXIIhJHZRJqDr?=
 =?us-ascii?Q?BByiI/qvE6v93d8AEc1coOmOqax57Vxhg8x0TWjhMKXQEkiBa2d1dXbgcrcy?=
 =?us-ascii?Q?bovCkeC4LRp20/c0Gf74D/HC+nsG6nuIEH3ParGLoCCRMgT3ttPYA/EXeMJj?=
 =?us-ascii?Q?mq0HdJlqWdUq6eY9BmS0QOFlT/6PFcRJMLkRpBz21LQ8qypqg4H145OvFjOs?=
 =?us-ascii?Q?JHvUcMaMeW0DmQIvS4+9JtR7ws0VkSU+AZYeBLQv8+NOcpDJNJLm4c9k3ZTD?=
 =?us-ascii?Q?bAFf5la3wbXNH2/+qYA+NjQa8kW/jDv0pCXfbmLrCQ7zZSlQ0DKKCc5eYh+a?=
 =?us-ascii?Q?TytpHU3PnCQ7YqYOoD1HqB8SFMRTzr/0W8wLr/3bXujW5AWpf133eKcVEoZN?=
 =?us-ascii?Q?81CECjsWk7goHJl7l1a2wyWmqtFlxl8zoxHfn6wOqRizzbi+ApWkxU3FxS2I?=
 =?us-ascii?Q?mlhJaAI5oC/KJhkLI8iZMWkkIzIqD5uWRJs0pkN6d3ZEmzt/993GBn7Unvt5?=
 =?us-ascii?Q?YhXVv9FJUWyVdaF5IrwlUkcb4MkupA9wDEylD/blBVug1zAZYUocsKDZbM3R?=
 =?us-ascii?Q?9POKu7IGw6hM+5NZbfS+VOZ+daJG5MPBO1WqrAbHG178mIssxd09JoNuLIN0?=
 =?us-ascii?Q?cSBnZryHAfA3pRN2OJWKIYHWA0+HiBXXUpRJX8KLyijcck3gkpwNPnHj2LjP?=
 =?us-ascii?Q?RWEH2XU5697MmefiPmqJxn+zjn6zPQKkG0KI3zoYMgrMmZ/0beNk1jrua5eW?=
 =?us-ascii?Q?O+dpofqc87fOTTUQOkFvhgYJzWSAsNdeWtN3e5QIAzBRx9b6G3//7wqxmZjp?=
 =?us-ascii?Q?5JO8MFGWix15PU9Gm/kGlr5ScrbDYcZQ85SBCTN2rnj3e2WXexhEQGQK5xR5?=
 =?us-ascii?Q?P5kFyvRviZ1I5G1Pu240jQAOw72AZfu6TvqkspjAcJJNMwRsNCZpa8ZXUUoi?=
 =?us-ascii?Q?xAAMAsqGI+HLxzTYmNzEmXCIP1alERjge3Fk96IPNkifBlqZWicOUzGYXmbH?=
 =?us-ascii?Q?oPYRKwseACVmgeM2LPHFar8lKDhr1jqGjpp0Hb90lj5Xt/CGwlKfP2o3y2DV?=
 =?us-ascii?Q?BrDq5D1xFWArUcS7w3brHSyaiL1ppWUnm3Ta4NRoAf03n7mIdRKpgzYwyq+j?=
 =?us-ascii?Q?C4GjRoQ2S1UHzVhQBmbnkTyMbOAOQPekhOv8F3RKKTdLWrnTEuQfrVJWOGV8?=
 =?us-ascii?Q?DCPsx3QdO4tbDm06gshQcbEoUPsltV5lRpIiTzFGwgbi8QU7PJkWuzV4la6V?=
 =?us-ascii?Q?JOUl/6Gdcg01HuLQm4k33UBq6FkE7e0PSGNxhmJx0xElZzh8Vd60zE5P04+o?=
 =?us-ascii?Q?UIUcwQmCpgx+uY9MKzkK7/mdNR/KDvmXZG8xNg3Y3ZODliId8n9TpKmfNS0f?=
 =?us-ascii?Q?8YUjZIFifEJiVt2ymORg1n53emFJhW7FqsLp4rGPBuCPvNLfdg+m5txOOf4r?=
 =?us-ascii?Q?k+XbSeGFv8y0gOtX6Ir8YOO1UZXmxPh2jHFBYXbO2baiDJMvdzFMm3WsMHLd?=
 =?us-ascii?Q?6ZR4tqQj6QvrYQzKhNe5SG7H3Cw+fJt7kZ+xaaSZTE064gSk8XKeS4Q2E4Q3?=
 =?us-ascii?Q?NJSFz2/kT6EjY8d05ez9veOJbqYtKeOzuimRaFRu61bsLy7T5YFGapa+vkSB?=
 =?us-ascii?Q?kJj9jpiYjUp37+kFp+58zGzqSRXhvMcv0pnJ2aY3P64ubfLTHOWP9OK2L0P3?=
 =?us-ascii?Q?6lbYbQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sFSodFeasUFEM7Hi4wsY7azQ0pk4OMdnO3YtXIAGf5GzvKpgngKdr+D2+VfuzS6NZ0ck+spLImtH4HXaLrYyY87zinVDCbe+1b9RZTsKJ9Qq9W0WMHcPBG/W3QcPdzy4gdX9kWglQ42cPrSsPW7Bx78POZiFaD30u4JjWyB9SkrF1l5AsCYW8bmJQ6voQ/gi+Qf1ytBqos585od/QglZP792wu6PnYlIF+GU6UyPJHF9FrkKfOHZsr61BRfWJaJ34tWc/fYB9/5w5Mymuh01do++RyQUu9qIQgL53uLNvEFHpwGmyI83ZiW6tEQLdaRoNjWyYutiOZHEuOuDJeJt3gy+zw3pak3A4YsW7e6B5n+euhVUCBtARBtHbqUeB3L5UQJJ9kt3Jn7NhEthwxknLy+J98w62sSB0sZRhnO3XM/3E6qGqbl2FIR292aS7eAC
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 11:20:29.6825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bc48bd-df27-4345-7d20-08de70720e41
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF244ECF754

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

