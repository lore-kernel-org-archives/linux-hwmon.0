Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2108.outbound.protection.partner.outlook.cn [139.219.146.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7A92F7F02;
	Mon, 28 Sep 2026 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584365; cv=fail; b=MYRrVYVcU1tVakmL3UFWRPCFVnNbfhoI6S0G68Jnh40fmx86XyhC+ALjJm+UTyANBpGZXt2Z3FGcH71ProfhyJCXpX5wsnaN+v+HiiyrKC2LTDFF07G/6vFozUifbxj+GS3ICmFPhS7MenueGuxI2bjZiKol6tKtZVIMACC0+nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584365; c=relaxed/simple;
	bh=LlT/MIC73/v0Qxezs6qD/QLOui9rTfBWsAC/KN7Xol0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IBemgQVbZQA4df9bCh6k76DC7vd83Zl6ExIrE4Lf6SUapVhIy0hvq/p0LxtMTYG5A06Z6W8pwBiZITzzittfwJePNQUv9FpzTuvaxW4IHfCuXKyDI5UdhmLd9XZRsSZ0DUXbJvodzt/DwrXMjXooIE8C2pKOi5ELqXsq2CrCjcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6BHHbjxAs++3q5omKIfD7S9jlEN5Bpo7x7mLzca0OGkelW+4Qa7K53XQx0OutY8AUOFWPOlJKPqWQP3Q5iezSSGRUgeTnYS4j03riDKNEU9X6iOsvW5cHeaUcneC+56VN5z1fhj/Q0P17xU8tVPAjjtxD7X9lP3FsytOdRwcqVZIBhzdNGfS078sKIKDMxM4snO4LzGtIwLOePuqsSNtuCOwnMIDVXpYn7Jx5IEa6OuPnWXZKvNdtH+nEk0faNcd4gwhAw11neCgj3xfbjFdHm4fi/J7fe3cFDVI3X4U8KMhxWZJVGo2b4u30PayVM89moTdZKZaXNcLbnZLRctqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tAXXHusuwSKwLJ7p+ySIvWx+VrLOwSAyv1EyC8Zl+M=;
 b=dr9q/ZKnqWpT409CdHP/sPSYE6NcId/mVYiVc89WuAnEei3qWWFRej8RwxoYSe/fDaMdXIcgBOnqnVSIsPv/UMFacBsynOI5SL/jOf8MXTYQ0fWO85NcTY+o7gXLCfdSDZlQSGbopO3jMFKNJkb2t+8cqX9efYNemrUS2MBMscQIqoybhCPTf4OlQf4KBF6GdDjHII51Naa59yolu8WV/IGeghL1Hpq68avoPH1btHwzoYrjXK5k2iwSjVfW7EcRT/NVtmffOLlvRR+kJaEB9jXYNjYNEkGD5ZbaK3+BVqEdx2cJ1LEM9K4Rus8JQD7X+TeGIbdQynt8tCZqXDExQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1236.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:00:36 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.022; Mon, 28 Sep 2026 08:00:36 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 1/6] dt-bindings: peci: Add StarFive JHB100 PECI controller
Date: Mon, 28 Sep 2026 00:59:51 -0700
Message-Id: <20260928075956.62298-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260928075956.62298-1-changhuang.liang@starfivetech.com>
References: <20260928075956.62298-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0022.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1236:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c927467-dbc9-405a-39d9-08df1d36945a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|7416014|366016|376014|38350700014|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	2g4vJzbxw2Ff27y7om/o0GK2x59ka04UGm+6XhEXr4C1IkIqcTCSnZLIKnG4eAxnPp6OyKp0Ak5Cjb7+v5ZAIBijLU3Zw96qTOTX1BQaIIPZs8xo9vsZ/zcfTfefqG0UTNoiRSod2Dbrd7iyvG3UQMq9/LVc5Y3O/a7qLnOUIVymQvNjVYRK3oyM7hdXtsTIFVAl0+SfUmsZsdaXeBl9bB2ww74EJJ4+S+RsiqWFxwssL9HFi/OMHIex7bRSyQN7z3wOzhO29BaiW8fGRpeVY/PhAtiD9Kh00LuBhen30E8KnObg83y384XwjuWrfd4sT6YLO2Q2mri84GQFIf9ScMnp9OTorBQeMVHS7X9yji+hu7MhZTKUX2s0jATR/IouTCdMjuHc0f25yyHk/Z0RX3jlN6/qWPZtq5qE+3Hyc0QBlFpXjl/S7i+jLdRoNvCSdSpMfnUjDsDJ+jDswubYdsek229GGgzHJnxAK9IXtkG0cqXzlQg99CceLz3U2zX7XxvS2jDDZpfUc6fuEzBc2io/za2M7Tnex/NFQTCNBz5rB7Di7XIyjK6Uw7YemJFs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(7416014)(366016)(376014)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ZOs7l8JkS7tpmpia4JxMdHWFXSP9AHyKGYSuO+4i4P84KDcJ8KwSAe5MBDM?=
 =?us-ascii?Q?p+y0A3xjdIoQ70cZsYhE06mXiyFwSKuHRzn+2EGXnAbHk+r27GIny/BWbg/1?=
 =?us-ascii?Q?+A+N9aXrFQ1UHGUuU8oEzN0B1JPRQo0YgnFtVHJWwzSOrNwyV1rTrnkNlAmX?=
 =?us-ascii?Q?oAW6j+DSLyagm3wJobeGdds7+fAlPc5G0dukRQNczdthIp114Ul1oIdgBbY4?=
 =?us-ascii?Q?6fQNKOMrFhF8CqduHYsvZyiZvEfLC0lMnY4dv5tIRYwnRpQCZYiwKxH0886m?=
 =?us-ascii?Q?xAZMknZ9Ut4iDhqmvm2pn1P5jjQqRJm8vL4JS9UyL4It/6wotBleW64qd3CB?=
 =?us-ascii?Q?JzJzw4ndF28khn8/9hHP7HG/k2IotcV0jUoE6XB1wbxMiKxH88JR8oiNYB9e?=
 =?us-ascii?Q?ldznxuVv6zWbvWooiQunOzBKKcsMq/y1fUKoSdcTvIk5UFaor7hiQmUMehDd?=
 =?us-ascii?Q?DAdezE4HuffUYeAa03lNv1L1MalkbalweoYUtrbSlrg4h1vQnvyLUM1BH+qO?=
 =?us-ascii?Q?8+L8YZa3SMp8K2OJ7cup7JaJHx5n7xwA+3f2dkPpt+3SN7ycsG4GFZawpaZp?=
 =?us-ascii?Q?dNPX3QhuoU9S42PDyJGZslLJtjTX7p3T6tp6JLg8SYty/cslkXshgyGllpWq?=
 =?us-ascii?Q?luyfEvkEahZyeaF66cyv9jy4brAizoIpgMQAwfZZVd12Eq4nmLLNfA29icFB?=
 =?us-ascii?Q?YehMElWRKaUqRAUOGQX33YWi8dU5JLuoULzsVBdagiZqqruKVmB5GQ7lMebZ?=
 =?us-ascii?Q?IN+TgMFd+BlwYfzGpJK/tlXOrq2IhmsEdQ15wO/nKfL2vSu9wBmTbEh5XIEr?=
 =?us-ascii?Q?Vllkjq984X1Ms8SqK6ULGqbAdDzw6P/g0S7qvovPsTkWIDXK4IPixxKQSSey?=
 =?us-ascii?Q?0QfQuUmA+l1T4pc1SYaF7p3dTT5bkjIlKiB35sXoFXjjTtdFaCUUxHX4mBIF?=
 =?us-ascii?Q?0bz+gP/NMX0TCAQiK8jAoJ7THH5r4fGexAGfJqfFFgB5js14iv6A3Om9HkBe?=
 =?us-ascii?Q?43zb474E5kKoZWvdvXfQ0xXHCygsESiVQRO6Z9RyqF3XWx2+qDJ8+//AWTid?=
 =?us-ascii?Q?f4iMjHR6yTz0CFyo0earEINpYaAIYqePq6NifZpRlMGtzoCf7azubqJKiVSB?=
 =?us-ascii?Q?flKBvzcJCajZxRPH4CfQgeaz1CItkReSJypZpTbqQX4rAQ3R6Reu5Jf9e8UN?=
 =?us-ascii?Q?sfVyVuNiyKif/GJCFiuI02nEJy3aszm7niTF7OqwBi2Vz4+4SE+JHnb8lCkz?=
 =?us-ascii?Q?F1f2ySaDEToT0LcVJQ1Lj0isOgGV+aiD88WLBgz+pwvNgI9Romg5DhTx9t/W?=
 =?us-ascii?Q?IKjqxGvq3ktDKyFCPPHEi8B7kF1qkp94Sy1AvYutjPIDNxnKHQvyxipOwUr+?=
 =?us-ascii?Q?XAJQHNRb2RCkvdHLRXiQmhP2sETrrRoMvJUUx5XQ7w5vkHei15Mus8v3bcxZ?=
 =?us-ascii?Q?E7oJO3dd0i4LIo9A7+dcR4rkfbGcUf0WYWJAc3aykaYywb7JIwh2F6hyV4ls?=
 =?us-ascii?Q?QHtE5x79cTKN+a1n7KROBaR2Y2l5sUnIkqKc5bP+rt15mti2swOEc1FnL3gX?=
 =?us-ascii?Q?zF8JWoVl1Qwq+5eP56mU9yr6+wuUw7BZnj5GBzGJzAp+uP7Gyb426SPqDOXo?=
 =?us-ascii?Q?KtWdGlYhl/s0mrbzbqnrfJsqp5mQ8sK3i3s8GMeMj0nS9C9EheRgEJMZGIpL?=
 =?us-ascii?Q?7hD1fiFFsSVsmLnqY3sKvQewgZJKqURWNAnv5tHLiRA9tyEKi6ruemfwOMKA?=
 =?us-ascii?Q?2wqhbAlEM0or9oFL5bqpXAx+cVWB+e6RjhNZZqdTnOeATfbdmM6/?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c927467-dbc9-405a-39d9-08df1d36945a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:00:36.5153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O58rz/AqO9DJb5lprLLxol/GhyNeel6MAO6IEu7FrOwNXX8T9aI3/1hyFsZ81bL+nkvlBjCZwPv3X1cM9Y/+D42Az6aKXiK4zKI18vFkm8BxhNbTbsbYGg9eodWGpBQe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1236

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

