Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2093.outbound.protection.partner.outlook.cn [139.219.17.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D3B44C51F;
	Wed, 19 Aug 2026 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136480; cv=fail; b=nUkRgpIBHJZ9QHrgxCVZHeShPAp1ykUcT6I9wHcV4dPvk52de8VF3+u3LpK5qtkrtPIaNClhs+iwniP7ZkKfieCcGkvxDo7k0sFZ0oXbCjOwCKDB+9WET+2qPiVxFv+3NMEKwxsEjiDh21b1tDC3TiMy2WVTGOFqZ0QuHdq2Yos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136480; c=relaxed/simple;
	bh=1eLZEB4a4IAZMMPjhTuE4sUjEq8gUpCmzdNZOHTNtq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cvT8BDGco7aMi7rXJY954sBpPIGd1VLISMG0VoqVvUdrhqxVuXqZFnlqpLqpJarM0W9uGiZdKBUk5ZCg+i/Jfk+jAK5KrILI/DqdJg1bSFe1V/c7KqMzQJv1ygemcs51yZ8BarywldHfMzBO9pW2XTqWUQnI7TPkxnBhT2sqePI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLN+l7RcPy7vuSpw0cT6PctjkV2jhlZmGZ+EEs/5WmyJ38pXUurGTJKckCZAYNG1ddW4Bt7ej5+xKkHOjsGOw8FSppPxn0Y8gOt7YuAwjNtWMHkGp4Lsrh6d0uB/HdGpkG1Ypn1x1znVWUKBln2o77Gzr8U1dRHZbLD06hjdpyRW+g10BEwduDiO9BmTW6je6T9lnRBDw/vXvWacTZkBhjQd/COIHudoKTvmSVcz3pcIa8SX5Zq7o6n8B0EkLPYyyBycf92TLIs5wjkczcwWOXXF0vZrW7UXi7OaM3N0b+fdvFR81ErLXpQVXZWq61fDvAGJyZXwF0zdtJO/dFitMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUyexECDbdqa6I25zk9joFLW+LVm1XRvwnA0hMyQU+Q=;
 b=j66O6txAwpT6NtQjeDtyAQaIR8p8A+7iSBrYBdwsqCFmNIFbgzlFuWVF8mnSAoECsOSMvQYlO4hMBQVlmW83rExNRo1We5vhiL/RFTpzmN6SePUqLxKe+XYqaEuVSDdbp1MUJ2LKBpRyevInCBr1pGb2J4Oxq170CuAHd59X5h5Px91mVUimXpTUFRRqy9Fu1cDHWhITHrysncEdi+8wvkiHHqF8rt8klIx42wuMh2imreQnvzso25e1VYXp0sUVG/bbrbXqdWB9smtSCEjgpP4+mC5LS8Q5MZf5/BfESnjOG2KB2t4u51vU/ZHpBgO3W5SqcCDhbSBOJUALxJ/Tiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1283.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 19 Aug
 2026 09:16:14 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Wed, 19 Aug 2026 09:16:14 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Date: Wed, 19 Aug 2026 02:16:00 -0700
Message-Id: <20260819091601.41077-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260819091601.41077-1-changhuang.liang@starfivetech.com>
References: <20260819091601.41077-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0015.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::24) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1283:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d2551c6-c810-4785-8177-08defdd284b7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|38350700014|10067099003|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	faSLhYwRbftk291RBXdW9bLFGrKcwHj6DEYtp14r2M43fZDr/MkjGOfVZWIk55WuWryGB/XsoqmjG0W30QR622b+1EEis57+IABIswY4t3YbYLbSNmVgHJ701/37+IyT3WpgffiovOLFiHQzz1IP49pQviuOEAGAArctPPLkbFMgiuic36Z/ifVdPssjM0hge6f4PlP0FTFhlgEK34DV+Qi5jO2L5k8P7a0Su14XB2arS8u/ogNUd6aCdP8cKYXFKA9iyXC1f/n2iSZE/wKbJYsy5sLVJdy3leMTDyNxSrxW5ZCjxBBwtpH9phDxIF2g1BYbEiAjaq2jOERCTdJ7G85e7Igz/EXFWZ61mSGrtexcQU8xKYEHIe2Bsx3DOdCdPh40bMMpJ4We6AtHaO06b6j1YkWRpWWoDVJ5+Ai46fjk/8mkUSKdwBJtoypvhxkdFkmXcY9RSQAYlfmxTT0IlKbtFduLH2hK2ajvD/BaDk0eUYcw8eiPXawrPb7WhXnQvV/rmfV5TDHuyPv2JthTqNI8IIVeadkdCStt2W1zNmAVECOTYWIbvP82Wnb6W37u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(38350700014)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RdDGZAEpgEweRzRHP0yT+rz6vPazyC1CEN1un6SNoz/Iy8+V2r00SfW04BmL?=
 =?us-ascii?Q?Bt6lDgFmDUHwro1U7E0OflG+AudsyrU9FURGTXc5JYhueOdHNYJKkNfi1Owf?=
 =?us-ascii?Q?zUSrdxnwpB0YVV7sKCC+ahfWNvougePNZa7zg+KL+vFfIWvzE3f0d2g6yJO1?=
 =?us-ascii?Q?/u0CLQY4tsR12Y1Xuq+5OBqznK8Acc+2Gy9Jxdzsync6lquRuxYViUuqOOI8?=
 =?us-ascii?Q?dTS4PeYoGS3cN0bS0WD/0vXlwkKO5V3h8grPzKDJVFF40kYOCyIxpLIVb7qG?=
 =?us-ascii?Q?6lmHIomXgIK7bc00ZzxsVWvYD50IKqeXNvsZGSc31klf+hy6QXVf1+XlyFxg?=
 =?us-ascii?Q?5+OZrd8mg0v6VawQ5GU7DxbIqO3esCkhw4gu2IckgGXqe1vKoAs15scr84q9?=
 =?us-ascii?Q?eo/fsP+KAw1/G7PpK3O+Q5qiaoWo/S05lSOxvel8KmWDz59SGsGWpgAJLRbd?=
 =?us-ascii?Q?ZPqqJ76/UQW4SgalvF00l8tMxYy8sRcm17uf69unm+KzKFox+58/o2r6iO1W?=
 =?us-ascii?Q?6dLFEnKc0MD+roAc2V88r1ZhODOZz2PUeYu38HbHi5T/MzlBxSy5SAt3gJlS?=
 =?us-ascii?Q?O5VRn5VzItvq/yUaYwgxnbQ3z1NhPUxxotVdygZvfc4YWAFDQ8Yq286x/VRD?=
 =?us-ascii?Q?KwncNyULIaYYMbCojzz3ViDLxxrQonyp2RuSZsa4lXshPw9s9teUYhzYkP3O?=
 =?us-ascii?Q?+PP9QQFeBcCa1dhzVbmyLTpQLBgFYpKLzpcqtNXxijIxoQJ6wTWdH8pnoLUK?=
 =?us-ascii?Q?c3lACCIhyG2fL2ogKSPlgMwcQhU7ymtx43NNVgdF+soCjrZ9jm3+cPD9A9dq?=
 =?us-ascii?Q?rujbsE7lU70ZetjkAW51X3kW5R3srFrm7nakWfa5uP+o4k8jyW4ApLbjMiG/?=
 =?us-ascii?Q?y0vK9y0uVWV/wmlN8wlgxndPEwvW2rTeTRcMAzMgMnG1rtRFUgBtgGhK2aJR?=
 =?us-ascii?Q?X0c7dQ+hNGTUI7j2a7L8SrpjZ2RxEhagGpG/bkho9DJeBX05jozE/rTZx+4X?=
 =?us-ascii?Q?P4tISVvPTLuzQ8GlphlbzKlfRUwBfh79kv10W0q4bEq8wmPq7Wob+tkUK/m3?=
 =?us-ascii?Q?JJXH56xnAYP67v9YIi+qMuDb/DQL40cna3G3EhDbfgxDJliEmMEKGU02NySc?=
 =?us-ascii?Q?o+OekxbAbpfmqs0ljO7BIO5DD/iBMdAIfl749Q+U+KodZe4UWXIdFtwt9MEX?=
 =?us-ascii?Q?IDt2Y0Abzb1klIEKw9NcLm+SIPD2DON8CtQBfXYQ4TKyAU2l+v2zgCDcgA6m?=
 =?us-ascii?Q?PXm9qXVL32EnnazX6VXlKnaeN2egGPEAiwYm2+NmO6vCRRsCbMplxu6e7YFw?=
 =?us-ascii?Q?Isd2pf6MkaFEcqOjhR5ZOfCWN6EM4f8ZoYKOlXrV8ppb30lCOkrwHkJvEVq8?=
 =?us-ascii?Q?TvAF5fWRtpZ0wGior9Wb1gDAqN3WE2PhOBdnw6WGnNnM2b4aEo8S8sZt8oO6?=
 =?us-ascii?Q?aqBqYRNhbCbwCoA4bSCw11ay5bMUK8avxeCqFWxqwnYk7HlCru0Lg/Qwl82J?=
 =?us-ascii?Q?VS/6tCq3lLJIrX3/82hvP43deeEWIGCTlacjNqspyCAyKqlue9lhzJY3n+CF?=
 =?us-ascii?Q?oGRNRZ2h2/n4nrVRUjBPG9uGis3TrLPMSumT+/i8l1fpBBRieT6YPzD9oNTn?=
 =?us-ascii?Q?vzNqq88hjx+WeW31rEoP08toEZH5x0qLxLsPDAS9ANLGl5nEp/2CjLiWtdEL?=
 =?us-ascii?Q?tlE+0f2GBjaeTjWCW2LQWaGQVKGiwrvXy4UYiuzF034aNRTD9X8KBMjXM3Es?=
 =?us-ascii?Q?nSC4FH2I8vXWcIabkcZa8GH7GK2NqWZZu7PmtlWOIEyQiS3Ab244?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2551c6-c810-4785-8177-08defdd284b7
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 09:16:14.5754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoJm1FeTZNwZ9+WDIKCdIAKFOl8geQM1TeXrCzJkaPbW/WizMD+kAOkaRqqrT22p+9O1m/7kG2P5jQfZFmotawJMYflKm+abky97yCisNQw8etju6PQQHCABoQrgOx+G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1283

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

