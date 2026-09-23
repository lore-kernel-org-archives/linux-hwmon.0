Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2119.outbound.protection.partner.outlook.cn [139.219.17.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0876B5221DA;
	Wed, 23 Sep 2026 13:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168887; cv=fail; b=t5v414hRFmf+GrFk6Vxi8lYrD+iL2A2AK42KH80yi0flqhXUSzoFDvVZNVPSAR0E9ICLUMR1DE2G8//aRqU/YL/jipD/mhg/jbLx1bjPeY7d6RIW7CY/lT122n86w2XCwHWCUJ2K53BTcN/VvaDt8k3uGs9XxeXR9nGfhrbENQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168887; c=relaxed/simple;
	bh=yPzMdc5uSNQEZSJNj852M6K1tKqxqfOq1QcjYniR7ZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hZTCQcf7uEdJkQxybfskR9vHWP+N0Sw+UPaMmtY2r4oEwgXOS/Nnbdb3KQunFtQ6sYmrMp3uns8G6wWTXyh2I/Wep3RQ141q/4/+Wu+ql2zJUoDU6SxBypmPr2en6J7g42kWdIyh/BzKARumylLc3hvwUbszAQf3XnVT4Ywqx0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCevYzbM4voOiJ7hMzwN//+wuws5Al3sOpyg4ajDeGUgfg9c08BE6PUTKMs0qgsvJVLmJu5MOYa9sb9vpTpS5w00VLyuJ3MqhfQy9lxvhXgCjk/KX8tw8+VDRGyzdrXKED6hgoDm8x2D62AQWWDTzCeD+mh1creA0teyt3dauMNc3S1i4UPuootwGxjPBMxhqablf/E5JAuMRxkZDcUV8ln69v6NkHsig8EonYAZE7qzSDPQ+kba2FhjpWG/PvBMM+XrzjcFOvAb+QzjDHW8rg+F2vLgwRcsDq0ogpNulY3QMvD1tAqz35G9XUD7sKB2Gha9nkNsB3qNgiV6ObyaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43Crd11IEvXJtYYfC5+sgwMv9lfseyRASTLjKd34rpM=;
 b=YO9BzW6F7h3Rc9zHiMcAFCM9XSvdcuutjluAyyGdPakV++YA9mcVg9L3o3YXMDvwwFivPs68tnMCSDKcU4XOetW9mjwGvAzr3TeI4YtsMJ5vhmTY6KY7U22OpHm3JUytZ3fFG4z3TiFrwDe+yl/5keuQ4Bkbv8nPvb6zuJ/6/w2L7RpU+XUz8mHaNJewGGEtITJV5adaysMRiaDB3fzS/hi3MYZIVsKYOV65Iv3jWVhIqt1m9V9fuY7pyoC8oLjCiDG2UzWXx13FY1TIIymdgv0F4NiSXhoayHJQxe7QscwPumOdobsAdEl+Hg4fSJ7UlWuLMyR2zfuqwQpaZYa+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 13:07:50 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.014; Wed, 23 Sep 2026 13:07:50 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v5 1/2] dt-bindings: hwmon: Add starfive,jhb100-pwm-fan
Date: Wed, 23 Sep 2026 06:06:23 -0700
Message-Id: <20260923130624.239499-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260923130624.239499-1-changhuang.liang@starfivetech.com>
References: <20260923130624.239499-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0008.CHNPR01.prod.partner.outlook.cn
 (10.43.110.209) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: 45adf90b-0fee-4c26-fe95-08df1973ab96
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|38350700014|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4rWyg3Qw74voC7RXYNcs33nBkrKC+TaE0wh/W+0yVTolP3dDRi/xY93sUesNmvg2+RBJXUWQDfLQwNWqnksMQCT3ENy/n+ZoP3+dCxQqg3p6Y7AuuURdBjNVyjmOc8VACCBQRD1esbX7uHN7FLLAy3fX9i6RaGNnt7nPD+7c55tGJEaMtnmXTrBjwdtVodVIC9nWOh7unWvsTwXQlwtpfQKqTUwvNloYgcaWXDRfhMW2rFXZ/K9vvIEQd4pOEey/EEcgOBddoZnP3VlZIEhN7T3+Ad2PuryuL+lI6BnQmH6nPMK1G6+4T/9+sNN4ucAWR+jK11u/j5c3DeyO9QMgL3VJ5yU96ekauWRzSOCD2rT/A4e9yHcXrWpKMbPDgmp+7/Qb4x3FP6gpSdIFmfzqasOMiyo647mJf72Y4C7gHpQC/JPR0sUTT+oxgXmpLD3xepOJ9wr4XoTJou0evqYueRBQp8EMBWLzlnWRR94jzvmqyxcELxFrImBDfwaV3j/5xf+z8dYoVC2LUq9uGkFh5CqLmfKhNnbjzT0EF4teKzr6FiB3S6HToHAXD3O8XbdK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(38350700014)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7goZVt8E076ApF4pFjEv2lXi37c6ePBa/rnGN9a7p+SFH4lLO7yy2n9MhLlM?=
 =?us-ascii?Q?zT2UXtuvB2358Fc6PMUZ6kxDIIGl1t4EaS1P4rWIc8hb0XqMdO3yBpDt3Kxl?=
 =?us-ascii?Q?KcstIb0W4qytJ0IrUaNUcPwrbRft/0B/v3ciwxme7IqRCRZKV8EXZmjH4Sl7?=
 =?us-ascii?Q?Hkxry9TBwF1UqB3CTcAb2AMrRdaiKAXMm0+/3YSCQVLw7UsytAn7URBWEcIE?=
 =?us-ascii?Q?pEu4tcflfqY0nGGuz25SN4v4ivQzB1bmOcf+5pUCMjJsDnAS6ykdABbtvZlC?=
 =?us-ascii?Q?0g4II3DugbrwMqh0vJL3Wt4e/i6itr1IESO040KpfpNdmI9LOqR5pjUSLyzj?=
 =?us-ascii?Q?KkUKfy49nqlkLbJfpd9zyOmiMfWVVzL7oSf3CCRPwOGb7h9tkolvAZxz8P5D?=
 =?us-ascii?Q?+bwWLXj0GhiNGwZ8E7GeRKjxbzzmFdZc5Z/8MZtxtaed3DuiXRzbbU0bfiy7?=
 =?us-ascii?Q?gaKVJMoqF7Uhi1bmvlwUqXq98MomngSZuIGg67hy9QOuCD1a9i3G+s3OPQir?=
 =?us-ascii?Q?7yl9dHtOaCstaJlppNlyC4QdBmJ7wy2Hr3DD8DDi44V2S+o813C7QP7C/1FB?=
 =?us-ascii?Q?2KcNhjFUX2+HgvGXMfbUG7nNL6/UDIi5hcasUlS+yHFA+QR7HrHhGtEEaS0j?=
 =?us-ascii?Q?OW3Bl0LH1iYqj3Wu0THKk+6bqcPVt+fSM9X6YH67/uPCRfH81y6aRfa9Zs9U?=
 =?us-ascii?Q?OF4pRA04Mmmo6aeYHOfAPQtq9saq/yjiEzyiRWRQD60/pyA9Ri6XTKEKpk+j?=
 =?us-ascii?Q?9nbmceP7tVzG7IzseLSxToD83Rnn6XL7X6StUGV2ZBeEXpebIoycThWyO/eC?=
 =?us-ascii?Q?HgTrUFQdNivtiSUvk2MUMIwHqvsDxflb/t/wMDldMsgjJFPE/wY3OFAxn72e?=
 =?us-ascii?Q?HELzDMFjlpz6ZuS9JP6g0jJlK+4mYzQhemnzMcXQmGcSaHMLJWiT7Z5rU04d?=
 =?us-ascii?Q?9nDkVEe8IEZ1YxsC0dotxNKs+KE55bMipAW+h8mCJ32Vn3yG1M6Bvifgph0w?=
 =?us-ascii?Q?bY0Obp8P9n1wrUqB7O25ffb097E2liq9e1gsusNZZNnyMWJwJwfD/xWJb8yc?=
 =?us-ascii?Q?T4eaGq4YVknCy43toKU8arNvjozXWX2noVZr99vkBrYbxhYDhWYsSJlAeRoA?=
 =?us-ascii?Q?PDcsfkU+bnyrE4dElim2/8YbRN7M6WRbHNm+g7iPLRMJ4P9rv/aDOXzzavE8?=
 =?us-ascii?Q?xkEbxXSpZFOZDPTWDbUSWiiQOxmZEUbI/ce5L2ieDmXZYMxuGLb47OewzJtL?=
 =?us-ascii?Q?GowaGRxL6dvifOWi2BxmeBIRDItsQpoDnnlnsTDQFUwrVfaaL6N1LHbAzeEO?=
 =?us-ascii?Q?f8p/FpKp24wiBhnBbRWICqRDLipXHvTK0VGKmC6oqk9VIgvkGQ2XEsXpCJSA?=
 =?us-ascii?Q?7w/QlaCn1CDV7LUpZy3IEp+23VCuIPsoHL7Rlcu4QL916Y5gDYpfqk4efn3e?=
 =?us-ascii?Q?71GYi8VjJ+CnQqfROpWi3P/XZHRf59XdaLQFZTTfz1KGMoa9vIyBqzTRATeg?=
 =?us-ascii?Q?V1Nz0j/v9Gg2KPt4AhkE8C+BXv2t10yZsllTSW7vOPgbYlR66qqjsFmo4ljh?=
 =?us-ascii?Q?UgyBbIRj85Tfp4OiAdbXdjBDyGCFivkhxWHZiuxQE6EtQ7lqyPcln6cnom0Z?=
 =?us-ascii?Q?iljiMVftfcODBVf0061XqsXtzXLhP4EIv0T8gTAac4RCmzQ4l+dVeqz3ngUT?=
 =?us-ascii?Q?2+4Li3jZpe048FtXavRWSrlk68rn1XFSJ88+4GZ2tQvdJ+CbCvPLo9cZ2Kd/?=
 =?us-ascii?Q?on8bpTxeX1qgkRMrUZpAU8S1zKTTzNs6Mrak+VO5+NC2ufs/X1E9?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45adf90b-0fee-4c26-fe95-08df1973ab96
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 13:07:50.1853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Op9NU4tl0An94TKTPDswKKCmhL8pscYK/5PmvMMDQ2K8cRMPhs4Ml1RdZh/0sdY/Scl6s2TcsbTesrlvOQtg6pbsyolGVuqOa3zzbq3cod9ye/QKDQPxXCf5890aQFG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add a binding for the StarFive JHB100 PWM fan controller. The controller
has a hardware tachometer block with 16 tachometer inputs, while fan
speed is controlled through 8 PWM channels supplied by an external PWM
controller.

One PWM channel can drive up to two fans, so each fan-N child node
references one PWM channel and lists the tachometer inputs wired to the
fans it drives.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
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

