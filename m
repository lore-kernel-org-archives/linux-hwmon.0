Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2094.outbound.protection.partner.outlook.cn [139.219.17.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145A5217F27;
	Mon, 24 Aug 2026 03:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787541528; cv=fail; b=nUNFigItTx5h6dHg782pB9PkrqJz3OXfxWZ2PR0BkpGO8T/EraWQYYKOO3TEyYbv+fD445JSnztNofcYL+dnXDniwEe+/9FhSwfMAFzc5SSj8plmmgYZ+ynQ4WqT0mBxRCW2/fhLbmQyB5ASnrLTJWi1K6qZmz+7U8bCOAqJwss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787541528; c=relaxed/simple;
	bh=1eLZEB4a4IAZMMPjhTuE4sUjEq8gUpCmzdNZOHTNtq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YKbGcNEuQNFjxzbOCFIW5pUNFxLNeu/Hka846facDtVCC9qB9xMSxGzYToXZpi55YnJd6wYPSk5MDrOc0gg5oyvzOB3HzoDbn2/+16MK+onCMMILLietoE/iqQHoKMXnODZh50qmo2saeM8W5/Fl8X800JNA+6uoADUYyN64dK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9zoaB/okyiKi+jKwyJjAPBfD17X6WEMyQrazckbdaDogf0695nE9ta7BtQp4M0AENjmVX9xcN9pIlRIl7aj5F3pKvntEynXZjxr+kzt4U+Ganud+vqPcgmnvzIoZrd2hDjITXNflj7LW0CLUEyQeOWBsxEt7jWnsZVMEiMnW9jP26GFS6Tf/KfG9C3miXQKUtJFGS/FnsH6milJz7+VIhHG+Vd85cQS+e9G4ycTGk99l3Fi3idCPdfWXKjHtMZNjE4pPXMCzuHrufQyqg9VlPNb+ZtaR4DyP1mJ7RF2iNLEK5Hs0RJepH4vDuWWFt7kXfbkC5rJkFx90xe0YIQaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUyexECDbdqa6I25zk9joFLW+LVm1XRvwnA0hMyQU+Q=;
 b=hTEJxqsAzqMEXWTBCOiwqMpVgCx61DELWYXEHMF8Fg2HTP2k6s5aC58h2MQXItRry7twNHreNhueVLpsgqcM9DWfThiUZ7Kj+5py9wTJBULB9Fxkw9Ul4NsNvIxepVNMGFmHUEvZ2MBRVz6Gz3xZgO8YUppy8XVlKNvmof6Ass8Wk6tF3WRz7rA3n5edbF3IQw2nK0jiMDp/YtNq3n1ZwxXYJ/mLTVUu1a18aNCKJDOErE4DEIeIs9OY7MtvxWerU7m52B7cAXBPp5mcu/zXNUztDvnsYor2UtvAnJLqhnaaENTSCTiqJBI+WnxDEeovakghsW7NypUL+bRp+yL4aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Mon, 24 Aug
 2026 03:02:45 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 24 Aug 2026 03:02:45 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v3 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Date: Sun, 23 Aug 2026 20:02:33 -0700
Message-Id: <20260824030234.9321-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260824030234.9321-1-changhuang.liang@starfivetech.com>
References: <20260824030234.9321-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::12) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1201:EE_
X-MS-Office365-Filtering-Correlation-Id: ba856227-dbd4-4db2-84be-08df018c2bd3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|56012099006|10067099003|18002099003|3023799007|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	oKsby1yqWZ4QJcC6T8IGSww1t8soJSHY8lvtKMrxn0C7fTJFy3dWbAu5HL6EU5q/ghkflt2TrNfpb/wODh852QOiPZHGIb5/evYzwN2Z+lztHD7mIgD0ATttOsKBaSw6ggyb24RfKCB2HNXfUwrWm1gTX8KxTmEdncanmvfppHFpbzGJvHIJYwn60GBGpIySEAbdfSHxbRXehGjIO+cJgsEaWe7ZoKy4ivJUfNlptYea3eGSiZEKujQWjbZE/emJ7ICeugwvcM2EkToTHCUc4g0k/qWYaneDW6dRVnY3u90Q+Zy/dVye/6AGolclBk1aW37Dnp0l4EK318tKZ8OAwRkdZQXRhDVTdJm5yUtfLYj368X5/qie2woVWNrsMJ8sEvWLtrPFJm1Wy0GEftRKvKDMz3rsz86UjsRdC3wyhy0DgqbVcQWgFgNr1V3MjDs41AJbDfda6cPwIiNNf+cGOaBR36bLw7gDHIkze/lARt+MipbXn5pMlxsjr6Y6+80SE37oaNdLnoCuTWH9QXtLdkx0Xl3l3LBxFX6981IPir+5UXAEW4Wb/Ox3alkexVLv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(56012099006)(10067099003)(18002099003)(3023799007)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u0VPNIckG+gwsmL3R6OZg8Y2bWL0heTv0eZs+ycg5f1cChNiDxrZdkLmF3rx?=
 =?us-ascii?Q?YpUMbHQiEiCRZFkoVGLUOsbbZUP6toJFYJGoaYRXGfQEQOZqfwOPbAonrLJd?=
 =?us-ascii?Q?zuhfvmxj+SXOdNjPVpBPghZ0h4hU2ltURIUq6RqlKjF4AoDjIcHF80TLJtjZ?=
 =?us-ascii?Q?XyxB+haWvm7nLVsEAkSKCnlJwbZwYkh3Hj99kvwl3X00Exuwxwuu0ioX7VMV?=
 =?us-ascii?Q?HG9P2wjSPUaqUgtccQYjYccvp4V5huW9PWd+f7pfZDg4aleo/pDT6AHVB3Cn?=
 =?us-ascii?Q?1GWENgltCTTMiMeC1Ao+vO1J8HPn/CgBIaaXcoiARNGX6mC7tXYR6+apt2rS?=
 =?us-ascii?Q?YQpLMfki4/CIaC+AZZg5lQUShu1wY5SvBH07bt2nC4eeEBvdfVgSlmHMNt8y?=
 =?us-ascii?Q?AERpjdkJ/fS5bAa0+aH/7oCkzP7ylcILk9xj+QpWUgWff/Z3QnM0OetG5WJ3?=
 =?us-ascii?Q?t6n9q9EXCGWB2Pl9kXZ1w1+ozuCE8YiklteJmj697Sm48//id3M2ZHNoO6Nq?=
 =?us-ascii?Q?aTbmippd2f9SGh9u6H470inR8OtxWaXLsXJZdEywBgbL9xqMkexrR8SGTxCf?=
 =?us-ascii?Q?cP7PS62Nu//SBIsROrIptzzMpaLvIFbdjJBUlBFoj+kp0ae1Zxw7PqrioDtc?=
 =?us-ascii?Q?e6gbGlpV2uI4XpOsTSEUqTbOTt7HeZis0MQ8BwIr2rcz9i7n+NI1Vn02cja2?=
 =?us-ascii?Q?E75Hhktxcgmlo1tJRqcF5fHTsReUHySHqtFuJ5LuDR+BWkHDnFCJvtI6830g?=
 =?us-ascii?Q?tiYWLGj4YsjDyVNFr648Eqiwu45nqCLCiruMAotbNxCEe6iom9ONZqv/Rcyz?=
 =?us-ascii?Q?10k4G72WpFhHkQ4l8NNtXaA3eCxuTEcxQjVSXZBIcZTqFsL52EYORoddOFrJ?=
 =?us-ascii?Q?BoQeAjMwWBNeLfn7S5ZMzBpQVnuiLsMA622svxv+dYlBhYQ8uAqEMxMZhc4S?=
 =?us-ascii?Q?Fto1H3UtAViwQBvFtjphd3U02i0mfmoc3ZV55Z0utxfI2tQ6hOQQr2DffR2A?=
 =?us-ascii?Q?7dtjsNr4aDFm3OP4hAVMhLxZebrnRScCSyarHQi+Mf6rfXPv1KeL+8z8esF1?=
 =?us-ascii?Q?AGVGCk+eaWDp0AgWMoPDSiJ8d7txJmJLoRlksXkyla7NFl4r4nGs0SMYBv8U?=
 =?us-ascii?Q?NAWQBoW442YxpGQ9exfKfXZjYCBksmnWEOVdiWzUcIEijFAeOqDg4ctktBSS?=
 =?us-ascii?Q?Rw2qVXqsqT+XaF1HvobYUXmEqOUdsKcVkGZ3Sy80mcwuaK22NUZXxcjVKlau?=
 =?us-ascii?Q?7ywE3zUiVngPVFYE+UNk5HgIcpZ1zQbBvM1aA7SfdODBM+2/HOybJZ89C7MS?=
 =?us-ascii?Q?3VPKiUhucEXYUl0g+GlvZUHFpCIOrEk9iZQGpry7nyScLv7JWMqsDT7XOBYk?=
 =?us-ascii?Q?52zDqk99DtyqzCH+aiZmH9K4FBsxzAyav6NKA90D1RbXJ3A45Y32Rk+SKdA9?=
 =?us-ascii?Q?mwSvfWIwWb2w2gNgyzacL1liKLeZIme3qZPYcffWDyb+oGfNvlEpITFdtJfE?=
 =?us-ascii?Q?TvXZViHm3HZEGluHN31IrYN0GkpLhYqWdZLiuFTSIMXHIKuIk9/4k39UDrN4?=
 =?us-ascii?Q?ucJGORYu8tGMOX4nTrzx5bB38p1NZI/DZ1EAFkcmmwd7oMHm4PW3ZlkAHpBz?=
 =?us-ascii?Q?4uzcVfJcaIHwC5yG2BfLBbL4mD3zlXSqleX5Vx7NOYms4fdj9Px+BbwtMTnL?=
 =?us-ascii?Q?PLpnOFqSBeDnQTxbygtkImlyocUxtiEhkBcK81hI8DZQM2z2C1cy7RutXWIl?=
 =?us-ascii?Q?muMpCn9L8IdQr4rSVyHZEHGr6gdZsNiydmpmv7hRXRta0/nGFMrK?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba856227-dbd4-4db2-84be-08df018c2bd3
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 03:02:45.3408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIPXKNtDbr5XE8pDdfxVSapjnIT/TJ+E6FZJD8Cimow52X/fyZIeDacocqLSgVts2C9knDUqtec4EF4ko2nHAzG8E1Wdg2lEZKDSRWm42zjrVhsSz48pzlH2jE24v1JO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201

Add compatible "starfive,jhb100-fan-tach" for StarFive JHB100 Fan-Tach
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../hwmon/starfive,jhb100-fan-tach.yaml       | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
new file mode 100644
index 000000000000..1dcd4932768f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/starfive,jhb100-fan-tach.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Fan-Tach controller
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+description:
+  The StarFive Fan-Tach controller can support up to 16 fan tach input.
+
+properties:
+  compatible:
+    enum:
+      - starfive,jhb100-fan-tach
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^fan@[0-9a-f]+$":
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description:
+          PWM channel index. The driver allows two fans to share the same
+          PWM channel, or each fan to use a dedicated channel.
+        maximum: 15
+
+      tach-ch:
+        description:
+          The tachometer channel(s) wired to the fan(s) driven by this PWM
+          channel. Integer values in the range 0-15.
+        minItems: 1
+        maxItems: 2
+        items:
+          maximum: 15
+
+    required:
+      - reg
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
+        compatible = "starfive,jhb100-fan-tach";
+        reg = <0x11be0000 0x400>;
+        interrupts = <128>;
+        clocks = <&per2crg 33>;
+        resets = <&per2crg 5>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan@0 {
+            reg = <0x0>;
+            tach-ch = /bits/ 8 <0x0 0x8>;
+            pulses-per-revolution = <2>;
+        };
+        fan@1 {
+            reg = <0x1>;
+            tach-ch = /bits/ 8 <0x1>;
+            pulses-per-revolution = <2>;
+        };
+    };
-- 
2.25.1

