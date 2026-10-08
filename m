Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2100.outbound.protection.partner.outlook.cn [139.219.146.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD6040862F;
	Thu,  8 Oct 2026 07:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444922; cv=fail; b=XXLlSH7LjlpP0XBdyHm4jzqmWa7GbVMhPl7APk7kHtjzzrGz016ZaVL7pxXudUC6i3T1/aSaAh4oW937xkafov2lg1PQOINnRpYtlnN6pUNmwaf181HCvSnJT7dgW0+9D9FGbvSaB1SDA7GqhYjOQ54xTKWZE9d/2pHA1qFUfNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444922; c=relaxed/simple;
	bh=D77Eh2bM6FTrLMWEP06+BZr0cxCIBQ5ZiOkbXnA3Ng8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SSeJQMXo/kRxJMtjZLwORhxWE6cUuFDeop7aRrQfOd3Xj+GLdw/Xaw4xgj3C+OnjufR2UyikKW4ZDW790XBmMruWv42eDE/0vJ5jkFDzk7jyqu+423Pl6XegN3EAB1FwfroMEzUpCSS/DNrmklyP92Y0afk0nVf+mkCPWigQS+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/mHfYe/gXcSkCibDb4C4x5N12Ojsxsj+ZFZewVQpESAev8n1fer7Hhmb9XBVIH0P0mq1fI8mlrDxb6hyt/bPRCC9E4ymc+qnRXEwZa4frD0IccmeoIf88UEa2b5FvicRMXbOzsgEDccanVexlftgYAh1vrFneK3rpGghfZ/ak8A9VvtQqKDUwFjOgIlp43P3x6sAXAaWmk39OqZx0XnqbUDqmAuy2mPPv1wdQCnp9k16hzmSZ9sehYQxSX0n2O+fFcBBiH+97etGeHSf5xPGKw8XZZrglGHZ+cVGaITINNzcp2F4apGb29R3jgyw+pu2AaCI7lp+pFedzq4/aasMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vwoPSExpKsE3lwtLO6vjGK1dDSo3BAz6C9vztgQAHw=;
 b=SlUyBUrI1k8geqoXJbTaVcZaCoGIuK2Zz4T/deAZKoY+JLcY5zxBbqbzJZ4P3P8BMZmVSXl1Z6Qo0cKGdonRROWCC6/aBNmaEvlkagZKvV9x1criD9rxhVgEaMCBNhTIrgyXw0+7N5/9PK5UVcoo60+st7RGPiVEx3dluOaeKs8br+ck2pRubVUk5aZzIfhCFYjrOOduTsR2CKIqfP40Kv7NCvA/CPe7Wl/1ZJwxkr+xkZm6B+o6Jfi/lfpMvJzbiBy1jKL49YNUUKt7tvC6HNOK2fOOTERkfyL1m/T3U+iZnoOSBv6lDoi9VAxsvhyx56VJGqtUmsWx04+D0fNvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 07:20:11 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 07:20:11 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v6 1/2] dt-bindings: hwmon: Add starfive,jhb100-pwm-fan
Date: Thu,  8 Oct 2026 00:19:49 -0700
Message-Id: <20261008071950.4772-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008071950.4772-1-changhuang.liang@starfivetech.com>
References: <20261008071950.4772-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::30) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce968c7-b018-486f-5f38-08df250c96cb
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	S0Ibt+9YGIxWdT9UZd0VL+fVpaqbBoZuMGjXXWdtSmgJXUQItmC935ei2gi3wnSPkTZgIgS0SvwRhMvnOXECmFKq/inQYu5wgqt6NT3dKr1QPYNJCoJGZrececcXMTNVfrP5qP1bdp8+g/cjKg35pewJ3c0QGJprELrTqO7r+8JuLXdfmyqbtC1HbtBXmGuQnlgYYn9YuBa8LfdlsFwvjjEZCvOzbXWNYhhTyxvknJMyAiO+Y1tThXQ4FnLz2JpeLnioWKx7+5R/DrmQNyEpwXLjBcHtL6PO2ueGH/nh/INV6krnSvnQxVZR8wegOoCbFIroKSxh6iVRt4z/MqjCfoZxuPEkY2A3/41lUJeHMAgIKv1rN2GOGucpGWc5mk8XxnkVB/p1QcT35bQS274nnJY7I+sy04RkcfbBS5M6E1ch0uIJRx0zD8Bq3wOtQzHuOgUyOkTjH6q1gg6CC4Evz2HoquwFccshN6t8YV8K2zP+9OhY5EbrPPiCUthvpVYD5fQKocdDN2KmFk2Q/e/Hhp9ZhCEGYywYQAJORVfeDUHKYtxFPKpjyHsZiWioxiME
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HNBT0r7FSe4zATzxqekZQ8Y7lbR5LCm5+2wS4UcmUSuY1DGANsuGFXBLhSpf?=
 =?us-ascii?Q?9gCz4qVrQrGIQXdE/hS636qVL8u0Rq1ZFPowaUPCBMHDsw/YTUZ8NEfGlYBA?=
 =?us-ascii?Q?VNOxdK/Ny3GMS99p5k+w2XuWlCzYu8oYEETFom1/yhOiUE21fz3F6hHxrT5y?=
 =?us-ascii?Q?08LWk/WDQWP61bVpbkj6HlKA5bFsrb78Q4Pof2Bizv1tdRSHBls992Cw2bhe?=
 =?us-ascii?Q?c+xPPrT8gLGgxNaTRWXfDTGst/uGTYc/VqPRiFaHj/5YUeM1zDT/ewZwtKqX?=
 =?us-ascii?Q?KMEbH3w56nEecV4vZQ8mI4uNvwENilEh/HFGFH8ZgfjKofTIWhXWLSXUz1VA?=
 =?us-ascii?Q?J/lXzw9Kf8oMA8I+J8Lb9DQ650PEhnq/Ea0X/kWI7h8pfwE0aA51oGO+ZPhb?=
 =?us-ascii?Q?N9bjhJBNkH3Mz9kSJlPyvBo0E6Q1GZx+Tq7iev4LV82JwKUGau19Z/7pEJ79?=
 =?us-ascii?Q?CM1ZbzL8laRXI8ocV2ikaEdDf6KZvsdnHAb1+w4mYuB+ADhfkZz47dKGYZM6?=
 =?us-ascii?Q?qweAzBGvZSQK5Aq+LQm/3mI308WR7thrJsC1uAby4cDB/enHLbxLE3Y/rD5i?=
 =?us-ascii?Q?zS+bcoweaFjXZg4glsrcGFcorJYyubST/++m0zZrAYIcpFvhJ77fiIrD6OIE?=
 =?us-ascii?Q?bFeES5tphy+JVguR3HDT2ffrMERrCYrL3uBaHIoG/JhjFdmpWDq+JpARLY2N?=
 =?us-ascii?Q?PtcJViuXQ+AVLCvXfWqDFP/PzXXeG0YRI0upk1hNbaYbIHFvLXNtHMG6chZX?=
 =?us-ascii?Q?WE6QkwkKJb40PESJDEdZoDTLFnMvY2s2+wkUUXJ1xagfqCQ3JJ8BtogwFm89?=
 =?us-ascii?Q?ekxad9DI1xQV8T59rjPys7u6GMIy4H3/CDTSLJ9Ma9M8Sw3hnSA/BufqyzC9?=
 =?us-ascii?Q?F1D1kLY068dMVlIyh1C0Ua8+Q1wZhkg3WPnRAeUVPqSt5MQBLlW9kLB8V3cL?=
 =?us-ascii?Q?k4sy9ziZhleTPkp9SKxxKr+vtRaBjq/DhDfU0jQo1dajfCmKS+/xWu0Z+ct/?=
 =?us-ascii?Q?/Kc0M1p6rvrE4UbjcEw19eXu6aZb42swVuzxLpwFUEp9MJwob2n1bUWGxdtA?=
 =?us-ascii?Q?YP1fAQScrmdoPOU54so6NtPtxL6BLBJvUHInEUmHdoYMFfmxY7He231iUjqX?=
 =?us-ascii?Q?AX+7daWKSTzIQhKS343lv78NhNj+zxyBKnU3Wo0Z7dtooei/rgV7HmG9RvVs?=
 =?us-ascii?Q?pOUPu/HSRY7Xi7AG3GqSV6pHur5rIJ+lnrRiUX/mqDoDnvEmJgckh702t4fZ?=
 =?us-ascii?Q?+PZ6KMGeA8x2dCG3GudxsFgPmpIv+C7XY/Xd/AxTuzipY5FRwqbKuV0miYAO?=
 =?us-ascii?Q?DHkmhtNYYzqQ3MabPk3Ol2vm5u6UMcw5Ya961Kxrxf4MXIW1eY1pWyvPQttF?=
 =?us-ascii?Q?OWRonZRgkGEDHpQtOXG/rAvbdJMj4vlR1tl0PeOr0F7T0kdLT9VSn41qDL4U?=
 =?us-ascii?Q?xs9+dD71i7tRJ68W4fJiVU9YfN1gfMFDX6cI/H5AwvFSqFrMhfsHp1al05JV?=
 =?us-ascii?Q?RvQDDEqn6F0W0IgBem6qZRoCoswDXhaKOWA2KDlcf4/x1yi7oFd6eYEaWJy1?=
 =?us-ascii?Q?xD94TFqu08g0jMjeTwcBJHG48/u/3VRc35kWykP104RveYRvDy6X1db3rCfc?=
 =?us-ascii?Q?BdctFqACts6MnEUHDOYWE4RL80XW3e5Du2z3mDBwCzX3CTN6NCjBVInwGlYT?=
 =?us-ascii?Q?tvhZNkILiSE0i8mRAOQjnx4CtApzX5XJNoD6xR5A4gFSZNE3BLseVkNEX2yo?=
 =?us-ascii?Q?3Mjp+0IhnpTSpBXirKBWk8icL5Dr7hud7vr1xacJ5bTQsqsZvgL+?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce968c7-b018-486f-5f38-08df250c96cb
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 07:20:11.0802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ev19sBId7ArKZFddo/7oSb15fCo6cNCL8am0DzPLPP9eB7SXqUtz48rdl8Cuo1bAEApOiHl3kWI+6uxOoXKXnApZskwTBb3XPVZDXtJb0dCObMASXju+2ytRyIlSpquZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

Add a binding for the StarFive JHB100 PWM fan controller. The controller
has a hardware tachometer block with 16 tachometer inputs, while fan
speed is controlled through 8 PWM channels supplied by an external PWM
controller.

One PWM channel can drive up to two fans, so each fan-N child node
references one PWM channel and lists the tachometer inputs wired to the
fans it drives.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../hwmon/starfive,jhb100-pwm-fan.yaml        | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jhb100-pwm-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jhb100-pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-pwm-fan.yaml
new file mode 100644
index 000000000000..b05789867c0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-pwm-fan.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/starfive,jhb100-pwm-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 PWM Fan Controller
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+description:
+  The StarFive JHB100 fan controller uses a hardware tachometer block with
+  16 tachometer inputs to measure fan speed. Fan speed is controlled through
+  8 PWM channels supplied by an external PWM controller, and one PWM channel
+  can drive up to two fans. Each fan child node references the PWM channel
+  driving the fan(s) and lists the tachometer inputs wired to them.
+
+properties:
+  compatible:
+    const: starfive,jhb100-pwm-fan
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+patternProperties:
+  "^fan-[0-7]$":
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      pulses-per-revolution:
+        minimum: 1
+        default: 2
+
+      tach-ch:
+        description:
+          The tachometer input(s) wired to the fan(s) driven by the PWM
+          channel. One PWM channel can drive up to two fans.
+        minItems: 1
+        maxItems: 2
+        items:
+          maximum: 15
+
+    required:
+      - pwms
+      - tach-ch
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    fan-controller@11be0000 {
+        compatible = "starfive,jhb100-pwm-fan";
+        reg = <0x11be0000 0x400>;
+        interrupts = <128>;
+        clocks = <&per2crg 33>;
+        resets = <&per2crg 5>;
+
+        fan-0 {
+            pwms = <&pwm0 0 40000 0>;
+            tach-ch = /bits/ 8 <0x0 0x8>;
+            pulses-per-revolution = <2>;
+        };
+
+        fan-1 {
+            pwms = <&pwm1 0 40000 0>;
+            tach-ch = /bits/ 8 <0x1 0x9>;
+        };
+    };
+...
-- 
2.25.1

