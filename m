Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2123.outbound.protection.partner.outlook.cn [139.219.146.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D683F104C;
	Sun, 30 Aug 2026 03:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788061898; cv=fail; b=FjtlvVaMqRpkg/D9is8+0B/1JgYu5ecS1MyQG8AQohmLW5ghm8GEovUhwEOb+PepYGOJHzzMZ3mMiYqcV3gYsSACz9arX7dIYWx8M3F630XiVxorsuOwGjGpCYfo0C52xRUHLyf+FTCy5RPAzw4UmtwyiRG7AdT3Jrx4HfBhGdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788061898; c=relaxed/simple;
	bh=1eLZEB4a4IAZMMPjhTuE4sUjEq8gUpCmzdNZOHTNtq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BU8uteYy+dSOFjxHiTFOjJz34+MZZYS8kUlH4BgzY4DRzkuPKfwcW7i36YE14mMxGGrVefsp5X4s1mwnuqkUZQhuLj5i6JRtULdLPkSNEJty5rKjVBkPNy/+9Yyy0eRYgve2GpxGOWe0HhJwLFRlRulj3rxiC7HYTJPiPecmbjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6vEFGPKUYXhcrAR0cfdYoxOW4Y4Rqi03gC9CC9JMZuj3WBbkHZpy/d7fF5nRCeAnfEpu4eTiKjH9T/0aJWWVixFEM6OulE57tWWMGF1ianMr8eofVx38K0qSDhkQDl5TaSDYWbo/eVTKPcvaOwqI3PnWtJz6vIRItJBCTdrGOvcT/qIN+ZOUykyeIrv7zgG1vewBRIyRzYCT7GdIuGhaLCi6/x1iymrBg8oF1uAhKL3FQ/2HiCy0QmbVVS/l6oOmD0/056KhKilCp6W3Wp8AxJi07DuyBt+hxLnKh8+jkAGLgb9eT1nRZJNMbEPsUlUomM6WB8w5lDaaLUbs+vsdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUyexECDbdqa6I25zk9joFLW+LVm1XRvwnA0hMyQU+Q=;
 b=HjmlvTXcCBJQSplImqzWHYRuikoleYdiLKq4U3fnAKdWQvD3jHKTJLx7Xi/qQlmz0SrnFgJQoOUj/Jw5ghNckpJqgVlmDOz3Hzhm73xjonzMffzw0b95s2qs/4ljhE5yb83HB8sJDrZJnqkQf19JqYOkGPbDcXnw8r0XoWTo0LyLUVya6SQ6BrfW/oociFWqzT5DeDq/aPNxqXOokO26LeTmPsIfNksQu27cjk+7a2yET4dvX1OvzY9Sl46wSS0xIyW6qbmCC/rTYFgF6Chl7RYapkRFpl5cL2kMH3ZBX6ud6ZRO2s9F+peiNZZMl1JpDf/cpM4eJBlB58sJTf8aQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Sun, 30 Aug
 2026 01:19:54 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sun, 30 Aug 2026 01:19:54 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Date: Sat, 29 Aug 2026 18:19:40 -0700
Message-Id: <20260830011941.40199-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
References: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::15) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5f265d-db61-4c57-5978-08df0634cc05
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|56012099006|10067099003|22082099003|3023799007|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	CdfI2kvGBf8WtuD0oEo8pAt8KsFeokxa1nyrvptlrq10IVK1y333njXkeAQMNkFrt93AwS7atEgVxdwya0fI0+mbVgHXdqHERkbEfPSelx5heo9ql9g1XmoADQFGtjE3I3i7ntOXiPeI0JqTf5sKcg1zUd2TdJeHR1IdmPC02QPmmKPr46HgIu6Eu1S3E2zVLw/TSFiO1hcTJfOh8JYDMLsMrh7UuoDrOZiasuwSXSgWC9VJAE1IqdvADhm4wkiKTQBK87qJjPxzmalmd+wvhspV2gEmmPJFv35HjNt/c/HucLPRaMN1Li4OHlxiKXsaSKxqeyK6yyQUk1XT9goDhmP8JL8y6sRLkXQ8pB7yHBuqyLcgq1M0lkSgElTkAtUlhyBqk/INRC1oUGz3Sc6h7QEKgs3mLWPA544FTICa4ZwwoV/dZeeKPGA2HQQpQCgTlgNxxTFqdENYu6hLySfcM9q3hDCRg8uXdrh/eUD14a34muxPKuiY7Ml96QrJJY0DJCV/ik1zTTH4TnaZFoMyiw3Ljz+8TYzhBVmMvx7KwUEWINMapZmWpTm0V4A0Z+wm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(56012099006)(10067099003)(22082099003)(3023799007)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T5kjPzJNZ5ghKFZtNqGuaaatH97deR6+j+b4oBFGOMTuLEl+f3eAc/KHVkxz?=
 =?us-ascii?Q?dlJxtl2fc0XFZrCLe3lltnzMqyxIdo0xAqhvWIz1zisfCdqX9KTi25a+izgU?=
 =?us-ascii?Q?Zd3/cU28YT/4NyBbS8fIGxA8Z2wG/eTU3P3BzswOKGfJy+cIlReuciTFFw1T?=
 =?us-ascii?Q?ktgus7VBGGnniFJT2PuaRBz3O3PTbIgb/qFbXHKvoY00J1TjL0u5xPgHA7qj?=
 =?us-ascii?Q?YJAGjfI4X2RAuhW96hmTLJ76hkWaDvd0SU9cznmLMURg4ERQpX9smCv65y+p?=
 =?us-ascii?Q?JZDztOlJVbVXh9TQzXvixe+5IS7HmjH5haDY9ty7lUaoN68feHMVWMJiROak?=
 =?us-ascii?Q?+5pLQneP48dkq5RKQv1TSgSHkIqrOzspBrJPMfa+KivtZ/FvPTBW8cnvpkjF?=
 =?us-ascii?Q?q/+NR0eMEp8+EhoK3DnjtkZ9xhhnS1AYnsKjmusN+51945frlKDIPVZo2E0d?=
 =?us-ascii?Q?aj5zbh7w5WEjfqCkqWTPdir/nJrTNkmNr6SYLYKrNY3jY41YU79n6ZDwZsjp?=
 =?us-ascii?Q?kPNzPnMEFWOquXjAScL8iDKv4JNyrBfFOyiJRBfN1VSjROZSVHK4X1NqBNke?=
 =?us-ascii?Q?GQmrACmTqopL3xofx+lZX1vGAEEEJ84Q7Ve91qIHrjQeCB2kvUPEIO+8uTdI?=
 =?us-ascii?Q?t0LVKomHUP6DaH6vBA4/AJ5ZLdI5k+IQpluY5H1R9DV2c/AZQip5M9iKrXPk?=
 =?us-ascii?Q?glcEyMZLy53hKLL7DUWpzTRoQcC9H5/W0s5KJ6S+L5dvtgte5WvFidSG0ukl?=
 =?us-ascii?Q?7rl+UPgot1kMo2w22KZGIhAtBJy/16+Q8A5KDSfjOoaxpTjnR9NQPdukjGMz?=
 =?us-ascii?Q?pR5WAjUJxbIbShI05yf/umGVZGDfz8eIQtyB7VNIoDtEvTGKruuhFlfLRfy+?=
 =?us-ascii?Q?cb5M6cI0ttT4qJ5PaAW5aKthAyOS256DBwj76jXoUPQxeuyzyaicTM8mQ+jj?=
 =?us-ascii?Q?58j7Qdi26iNATwwC7rPFuZhVU6eH2E0zovVkgVnGFNxh3tdrW51icRyMhF4x?=
 =?us-ascii?Q?Ccd8dSjJzwxrRqeZhbRUr5fRzT/JeHsuHHqOzdzAMI+ttWZezUq2J4B3ktgX?=
 =?us-ascii?Q?WdD+STMdz2TwtHey4m3C6wUaEWMAbsgp6YDQdYV+yHP++nVYUoSHQV1iGIJ3?=
 =?us-ascii?Q?9HkXAOXe3tqb/faB1jKHXVBi//xduSJZTPHO5ElNoWBLxNByHAhp9MvVomxW?=
 =?us-ascii?Q?p/3q5Fsd7/D4Yjj3YMnsEis5qfXcxgoStENwzEuWWQavHvN1GL8keVQz3mD3?=
 =?us-ascii?Q?kBazMEx3tC4AgtDTEMxU2NMVsJiNBCVxoyVUfbpIsZnsn+LETU3CmnGijb9m?=
 =?us-ascii?Q?ttf9S4dboqW/Pae1ird7WdUpZLiOBvbjvrHmn/PycVI3P10evc0EVulkJElG?=
 =?us-ascii?Q?Jeo/7FPT5BCmv3B2KwM4mw7eAgCtFbGrXN/AhRqj3sk3cCDaIQ7zDUTLMOs1?=
 =?us-ascii?Q?uFDMEHSAysHBZwwC9m/tnDmdS024lEh4/5LzeifRZdvdOMmOfybS/tSvZ8R0?=
 =?us-ascii?Q?SJKdQlNnlxP3PkdWcUgMHXksjPR0nZhYXMqM6uvT4B9KaRbTI4bTXFonbUGr?=
 =?us-ascii?Q?zifDL5Pg7UKecrZ0GVG4wvoknAc1GgaKloRqjiTsQ6qBkWyQt1Hb0maYRxxt?=
 =?us-ascii?Q?aJeTQ5Ot0HASe4fzs1BwPr4MxBN4OnkVkIEKLY07ogf8gRTYldF0QJ/ooPLS?=
 =?us-ascii?Q?e0NVsA6a/fCjiQY/o5/j0c/+PBw9uXgdYrm7Yo8JRylzihecGQ3edZ9HwXWx?=
 =?us-ascii?Q?vuswDceJNWMYKsZf1/63vOk8CXNyPylWv7WThBNt7C0GJQ5sWUog?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5f265d-db61-4c57-5978-08df0634cc05
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 01:19:54.1581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SO7S4dv8Ysl71JSGClgaVB61duwGDN8NV26mfU+t2hELzAEnMbzGYDKs199c1wwrVeYWarnOGz/ZK6uU0pEiHhZnU12R2dBGlR36AdpumR8AI8g2amGXqMZpNbwuJPJB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

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

