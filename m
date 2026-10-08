Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2111.outbound.protection.partner.outlook.cn [139.219.17.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40D94848AA;
	Thu,  8 Oct 2026 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454903; cv=fail; b=g9G4gEq8HFZKAcY/T1xVeeIQqUQsm0s8P5tw2SxBqBCB8BmixCzcsDm1/933Mn0i2pdD1zackHhZOpX0Jmw2rZ14gjJEVg8LrJAmDo96HRVvEy8haL4N8BcLnXivAUAQuN48zcHZjr3psVHffr0lL0RMVCA6u0Xp9wLMkkwBPDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454903; c=relaxed/simple;
	bh=LlT/MIC73/v0Qxezs6qD/QLOui9rTfBWsAC/KN7Xol0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oIC+DFL9ezcDapCG31SXDJIBU2LPtokuxsShIQsGfY/7S9FgC+t9m+O3jjhtVOoCG/ocMLJQPFhHnHWscB3uLI4MYpgNd6P6ZI9WUv1BOqxD5DYJ+WJP7B/o0r4VwRYWl3AESqhbwGoGVtCP0DddpzGv7oow6YDu0JcVcw2z9YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+PylyD3OYePLdBMb5bDLCuX5JR2IUx30Ne+xftKfcVVWacJ3YfHMF4sPjua3ff2QZ65QdV0wQ9BBCLAgPzUOf8+OSNXYJSU3DkRq0nnj96k7DzsuWRTqeIGwdH1mCxL+caqUVGll8/CDb5Vs6udHhviJYv3SId+iSSpi+nufABAETlbR/KE9T5KRYUkleVfw/94pfhtt3l4V0Uwdi0zzmePbWWMKhV81kSMSNhHMRl6Qh5VsC8c4jQXtJhrTCOEFxbjI7wXcOU6gcJ6V4ElgtkginjRl3mR4RR3Tx5I3QqeAp8HnIwKsMgVGcDBk0r5TsaAdOsoO1rodjjS98IkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tAXXHusuwSKwLJ7p+ySIvWx+VrLOwSAyv1EyC8Zl+M=;
 b=ZPSJq9hNGXqE/bse6wWgP1W9MXsOMsvuga4m+QofYs5h9DpGgWypxsIsZDTvJGpRKIEiaET3FXFfr+tWz+kxMoH4HF2l/mXRMJNAvoTnasNxnGRkYzsqulFPOwl6X9YVwiaxXlm+8h2cxcU6k633WtD2b3au1anYAM2LTe+CjHc8Mx6QW5u+fjZvHoVEZcuqUMvpj/98WHRWOCqOpcdNlv/uTQDkP9iXggup/giNArzUj2yDLSKCw+YZaJNzFzkY0gpeHPqdkXiu3gp8z5/ChWjWaIVFNqZ3B7wgA5i/n483ov8YCyBitN+WtNwRFD+QOe4O7pfjkYEZX6Cv3u5wdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 10:06:34 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 10:06:34 +0000
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
Subject: [PATCH v3 1/6] dt-bindings: peci: Add StarFive JHB100 PECI controller
Date: Thu,  8 Oct 2026 03:06:18 -0700
Message-Id: <20261008100623.7085-2-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: dfc5696b-e1dc-4e5c-38ad-08df2523d599
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|52116014|1800799024|376014|366016|38350700014|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	NEUcJiMLSGA3HXr/NqUBoTf9uDSOtmYy5Bsy7SRP3SGzQ8eW/AGMHlo59b290xgZRfxrjQUDmHh3BpC3hU8b/A72y2hMFG+o6RCwGbhKXfQjB3mQxrQxWizrE4APHWfRyjcZWLxfH41veLjjzvbdCKsnXSAp7mshgNU9wnETKPt1k3H+rcJx/JChrwmRTh6ctzlgwjnSp0kL0p//hU7RCJIX5diBFzUPMrC3zh2HMPFSJ4pZ4GNgDl8PiV8h0ghMwuuc+/aErXgzS53GHS5pjCmbDXW+zH6y8mrwCrMmvNITteidsKxjv8IlPL9dq/gURrwjqP/lg1ZLSMD5HHvt+hxqp2R5OcfwGib7Pw7Q7s2ortWgQhxzqZ0xFqIlvcrI1NeiRpDO7qygMEk3jAibOR5ksevXOf7fxEPlzPMl/IIFNOz707nkWvkVJ4Tpnw8CisAFEXXARVs38ZlggGsvCeq6Tx9mHWGmqnNydNDaEGDEzPgf3cqxpaI4Fpe4J7rQVB+ZBllfHMDtNwtX3oxDRsvtBd3M8tV92Qvo1vGPLD5l7YWzERqce8ZnKxl+Nvjm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(52116014)(1800799024)(376014)(366016)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AdlBvsVd82tpS3ynMQAUm3ij41LZDHcrV3SicMW8J70BI2RPynw7Z+YlLhpX?=
 =?us-ascii?Q?yJuikzCwB7GGLaECMdVoT4wkxd+myBZjjU4H8478wog2KkjfEgAFPcqUyk4L?=
 =?us-ascii?Q?Rs8a/jteTMVsspiA340GpPlb5ZsDy2wdcZxkxZmhGJlfrbmtyF6uiDTPFB1F?=
 =?us-ascii?Q?DkJPYwwsOgq3fLhgBjBFf00wTyeNZrVWmMi7xbSbM3mgU6XZltW1i7gqp/fs?=
 =?us-ascii?Q?wTKZ7fFUP3R6rZ2njNeUDK0uGy2rSmSD/tdSe9nKPjYQFgGZqKE1mqJgSBgi?=
 =?us-ascii?Q?sov/6QNt9wTVhnZjiB7SIpAJ/3HzDfl71yNN+xsnkKto2XVTjiqyFiuZDnWD?=
 =?us-ascii?Q?CQNwm3CL621NxI3cxZcP9mnB8Uot1IojRolkJ1KBLrCSEQX7GozuhoQwH2Wv?=
 =?us-ascii?Q?sRZdRmDbkJlgq9Ci3uKLm5nDiozBPqm03bmY4htTDA3QV3Pqq+iUczMBYfEa?=
 =?us-ascii?Q?0bXno+i9piAS3sKwkM7RtIcrkWAGD5x4jUYEPKruMtbqoBsB4fOLd96dh9gb?=
 =?us-ascii?Q?q1/b0yDgozoHipiWprTPUjamQM2EWCEJ+xA5NRnAOW54Gq7PiW0BtLnqm2G2?=
 =?us-ascii?Q?ICBVrsurs7Fri37soiLGWizqFYWxxgAmTLS0FvzOi7BROyJABrPjzELhubMP?=
 =?us-ascii?Q?ulXrfTl809V4UJv21bnGkTUnAoyJ2NOBAXIa4f0XIT+tf70U1epiric7XelD?=
 =?us-ascii?Q?5BFZR+8e40yB6dZHkyCxAcbsHsnZeA7vHj0zq+0uzruNfrtQj207Oqj/Tt1e?=
 =?us-ascii?Q?pwRGj7RY/O6MavCbU9lWV6uChuc/rt04BZGfVGthWAQxl3jEKl3FsiXAL+EF?=
 =?us-ascii?Q?CS6MLOiTPk2kN2nHCAOCev04ZQFmN4txxL3VvvRjrVsW5rRkCez1x3u5vSO5?=
 =?us-ascii?Q?qAhPPfXoNFyOs4dCAn1ScJ94s7BHfq3Jd+7v1VNdKOT6G7Ptggl0knvv6IHm?=
 =?us-ascii?Q?20rRDxVDsd5Vbii5sLRW8ai9UYjhwYuEehOD5Ltg69yVzG3gPudugjCT5QM3?=
 =?us-ascii?Q?zGBn/5wfekJgJWJ0NZPjUo+xKq5ru44VpLBAo1sQmr6d4ilWX+rJSYHpqiMd?=
 =?us-ascii?Q?KsnQbJLefH9rPQ6bo6yjfxSedoZNHcjXAWsccY4l5ff55A+V3LiL/ngtjO/g?=
 =?us-ascii?Q?pHFRHQLcepuLBEDX9ZPUwZI8mE1ABNslXZyV5D1MtVzNewxjIO2LcpNihxmi?=
 =?us-ascii?Q?7INPrlA+5zg6WnhF0hSYWZwbKwbjrdjs8inSIfA65z90tjMjonFevEhdIyU5?=
 =?us-ascii?Q?2UIoGJf6BNdWAt5RJXcncnPA9GFHZodDc9OPKvmQ8UEgbNrmRVmd9d6reB+H?=
 =?us-ascii?Q?4dvBiEQcTE786PxO3JxV5Yo7Htro+wZBEII/2mVOEETewf1rfQvVNYTYQnWl?=
 =?us-ascii?Q?8bfBtyQPH0hQoIKbFcw2MOqJ53niv2mAkzIXBxmxfnHZXAcPUPvA+ZgsuL1p?=
 =?us-ascii?Q?PRrPAtJxTOj1XvIobo4sd3PLIqBzJOP55TIWzuGhp2Kov05wmbdMzzeN58qW?=
 =?us-ascii?Q?mf6Uh8N6Hd+EYTHMle0JQHQq5mIQ2hE9LXi4JpeXmVxvlNzH9DLHtS7WVyKP?=
 =?us-ascii?Q?XHiWtRXzIZI+dN276RYgTyCryvPSWUsatvuMfeyUNbJ8pkmsk5smOMO/dAa9?=
 =?us-ascii?Q?NGiF4iDOlDNrJ2a1y9hpFYYmiRudqPBxb/Vye+/M0Z5ooXJ5O0ZvAYrJhOBK?=
 =?us-ascii?Q?NT/T00Pp6bosXLCkJkpiVY+GfvhfCswH9gszQAFJwcqIP986MRcoPPS37TTM?=
 =?us-ascii?Q?PE9zvvBCUluR+Pnl3sjV8ZMXp8FXjMdJ5NewX/QKrcxiS5SCGGBb?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc5696b-e1dc-4e5c-38ad-08df2523d599
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:06:34.8243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKa8EuYWmMXNEvwT6WXjFCtt2kvJfBYNBfFMKIX1/a49oi4ItMk4No+yMcpB9NQJiQGHmiXgcPzZPUUadci21ios6nOYrR4qoL/p+wHQVL5MXCgcvv0u86hwVPCDQH7D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Add device tree bindings for the Platform Environment Control Interface
(PECI) controller found on StarFive JHB100 SoC.

Co-developed-by: Mason Huo <mason.huo@starfivetech.com>
Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/peci/starfive,jhb100-peci.yaml   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/starfive,jhb100-peci.yaml

diff --git a/Documentation/devicetree/bindings/peci/starfive,jhb100-peci.yaml b/Documentation/devicetree/bindings/peci/starfive,jhb100-peci.yaml
new file mode 100644
index 000000000000..761eb9aa4adf
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/starfive,jhb100-peci.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/peci/starfive,jhb100-peci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 PECI Controller
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+  - Mason Huo <mason.huo@starfivetech.com>
+
+allOf:
+  - $ref: peci-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - starfive,jhb100-peci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  cmd-timeout-ms:
+    minimum: 1
+    maximum: 1000
+    default: 1000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    peci-controller@11c60000 {
+      compatible = "starfive,jhb100-peci";
+      reg = <0x11c60000 0x400>;
+      interrupts = <222>;
+      clocks = <&per3crg 34>;
+      resets = <&per3crg 3>;
+      cmd-timeout-ms = <1000>;
+    };
+...
-- 
2.25.1

