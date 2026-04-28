Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2127.outbound.protection.partner.outlook.cn [139.219.17.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EFD235358;
	Tue, 28 Apr 2026 08:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365556; cv=fail; b=kOUEPXF5q9g0OcvYwVMmGdVnIXtci5q4cmgPtu0gTHGpXFQKfhPLb2Gnzy6vPn4gYODwvUPCgecf2SXJfoi3UOjZtE4KjgxHNPbvjtJtKm626G/SsW/NuoRn/hnEPa+5EPwt5wvmSru9bKpI4PyrFxyhJmyKjP+i9tbQxQJAuXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365556; c=relaxed/simple;
	bh=C1bk/HXnvlIF+R8T++O3LzPFijz3q5/8IXFUhZ9UpSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wtfa/zHxh2T2kpjD5/Ql9nlbehLbcn+877dhU2VYsdq59hXmPgSr1b1b/XqZl//8wVq2dnJr+wowzx4gpNhkSRy7VGXZBAiPCf+hFjZ116PNzRWjsRZH7CMPC+aq5g06a5cwAIkEd1HBNWWeg17DboWc3jp/zOswalLKf9f5jVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHi/1tHLZZ19fthOU8ZNmqE8i8SWTJ4+y8eoEQQl+x9/HUNVaDr0mOm22/v2yOEgvD3KHgzb0l0qnGKYTv9XL9EbOvBoZ1cX/YnOUhM/fY8q1Z+Pctmk7AffxBUaGNUvV2xv2DalWZxGvEOXf0AW/vl+zLqGc60iuInhye70F49yjb8X4C/p9QIzLgkog3dK+czaApMzfmXrerVi0eevJatTSrx9XRVmEI6cCTLrdjT8ennubm/1v7cRjozY6WE/fnCzMlbXAxueXgotC0xzLBJk6HgHsAtAfeloIbK9lET+wNsOGVdVOSxZZC5/lDoITqkmvoudRi3E5gmxP6cVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6IV9EjAnq6+Eu/KX+T7H8hydLcNhInsRS3gE8Agl2c=;
 b=EbqSOMghOaHD6xH9WItqsdf9FnlGa3sMCmDyGtWO2EPI7n0GoWhSczgDxVoyxVYgaHaPrEtWz+EX6mmxM3J4boLvD2KlvCV7tqO84Iz7cr30j3gpKw5JGGNynCHrshj6ZaCYG05LMc7fKj6FVBRXNdRj/9Ew0/rS6YJvK4OEm8iEh/0UOm+PXSB/cb7Heh6p6N/AZokiYwNW8xp1U5yrrpwSaS04PS4bR0r0+j4oXKaYmlUCvKurYDE4wPPQ/ons9fUz9dg/zS0wGfxMWn2sTQ8QWDmF2Ngvl9HSlNS6hE6EmPT52mN018y3kEB22lJZL7b2WXnJoxHxv1HhPh4Ipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:23:46 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.025; Tue, 28 Apr 2026 08:23:46 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Date: Tue, 28 Apr 2026 01:23:36 -0700
Message-Id: <20260428082337.743546-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260428082337.743546-1-changhuang.liang@starfivetech.com>
References: <20260428082337.743546-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0051.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1219:EE_
X-MS-Office365-Filtering-Correlation-Id: 4178844b-c623-44b1-3b63-08dea4ff7771
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iU8MohptkKLjtD28MoNt4RMQcO2XIlrSaaLwe1PfZXUbvJYghb9cinKjx+INKk0hj7+IZytkrA+a1n7mTa2261BENd+Ur65puhMeW4CTrJtKKjEWoLDadaLF7tURxxLYpkiiWa3SuiUKPXIRa9JvpN2wwxp6tiAuEq1yOW3Z9qCsEckYWvFVIsRiD0ymfPZIUdBYidI+0hp34ya1KtT/9GRCQbRdOKKcKIg7GFPtCxZ4oT78Uz6G+hwLPrHpEhDuyWf/cmohxDQUlxQdpG9jo4Lhwdy9ZgUGufbvUHFCJqjOCvCbenljaGJOPj2a8R2MvuZ1FQ0OALZ5jUV8Ohxpm6wBwMejsCThGTSt3gzx4Azfxf1Np038DkzkFmYLHofO7QPnhqgk03WSi5ywLz/IhlIEHf+lIWphwyUc+aY0cJiBduSEc+btA0BhNUVCG/oRC1jsquJmYw6hZtyb+EJzuZJdHegMFn0o1DoJ8gLmqOvQhxY8stnBujJYZ/aCgn439tskIYLSJzfBrCC5adbEpt/ObgH5unlXvXNblo3n9KchrhGTeGFwBydXgs+hjFsiKv/+zpnB2mFOJJd62EN3GZch3i0TY1lug606Slys5Cc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RRNF1wYqvIINxazIAi432R90akfeVjCcKjW4oqtDo1Yh/GWV5Bno3oMerLJG?=
 =?us-ascii?Q?5Yr4e/jqShp2eRUcX/UWFGYQeBmNzBo65AFByqcklaDIZURbdeusRU04c0L4?=
 =?us-ascii?Q?UY6eDQvvyAcP3VWwcMBw4FzhgYMgNbfvA9veshZMErwKO56ozJ9rPY4sV/sA?=
 =?us-ascii?Q?A+sGio/ugFG3JC26WJcy/4n1GPJ6RbrddTHa0yBJknHjvdxOn1SxJppGXZhM?=
 =?us-ascii?Q?aDLu6zrHzMUX6i63DjZpQLPFfRlAU4aXUBw6Hw4mhf2MdfzEceUrVaPzQb1h?=
 =?us-ascii?Q?16AHLlZ6STBwkJiuAoWV9XHCUrIiaHUWVmkvjXnXtcIwygZtp2GP5f63GNHa?=
 =?us-ascii?Q?7V1YKzumG0pOpGNL9pXVvZ5qzFJISEK066I2EC/h+X6EVVu8lpmUKFpAQj9i?=
 =?us-ascii?Q?Al9NEYRoW5Qpv2QVPph6IijDgF72tKbhWneqMgSEUqwKVkJD6PylIC8bbx1s?=
 =?us-ascii?Q?Ix5KhGRbUaeTdyKp5m0aJVQa89gUlrLSzU2xdYJ1Mt86xCvXqeKN89Etc1P5?=
 =?us-ascii?Q?zCapIjcGBdVpqeEsc+GzA6jBql7yB/75TEdsd9+ry88zJcFgfjD9MP1/SqOE?=
 =?us-ascii?Q?t3k5l2CF57/2iLZY21hF+lAQHH6IlWZA6XBbIjGOPP9+75sGi4mlTFvQchu1?=
 =?us-ascii?Q?EAMChacsERyQt/oKD10ydhs5p4Lt3XRZAMBPTSEKmVtiDtbJKLYsXDPbt4g6?=
 =?us-ascii?Q?hf28wBQAruI/KXtJapmq3/o6YcJ+Dd3zrAWR/YlLIXwiSBTQP9b9wHR3FUA7?=
 =?us-ascii?Q?wUsp9JMvxEeqJi+dlxDmRHVwJqy3H+075cEhhEvxpk0gDaDEftTR8i0hXed2?=
 =?us-ascii?Q?UiHvT4w2k+KPpaNGdVQgXbf/zAMOC7cWq2sacxa/LoyBl8/qdPjuD+WV+yOl?=
 =?us-ascii?Q?+5Ao1tsqHx4Gn4QGNIW4u2BFjSG+YqWueH6iDWfGNnpjKhlb2r9M9NjvJC89?=
 =?us-ascii?Q?MKEjj9k626zaiYrHzza4xdO/CxCtViGlXAGsR0VYnlofjSu+GocwHWY8bSpl?=
 =?us-ascii?Q?3gn5Fxj3TM13KyPYrv0VRHR/mAwkEflIE+84WK4B9DQQhmDiZ3saXAuNiQOd?=
 =?us-ascii?Q?B9tJLH7zEoZliXDne6vKR9CJ3LvICRldW8TkVYHsek693g47Vj5cPv7Jztfa?=
 =?us-ascii?Q?C978YuqrtLz2jcIccLB5x3fG4nlihl3yqOGWTRUFsMwnAS8JiiZD+QDGm3Uf?=
 =?us-ascii?Q?tpxBoXxToyHjk0VaSXvJYrHa0ERpjbKC30+YKf1Bgz6IQuKRYgrbxmHaELdQ?=
 =?us-ascii?Q?u1jbTJM/0Klg6l0oOm4LDg+UhZS6RUeLrdW2pfhtDoBHR/iaHfS4FtUp1cfN?=
 =?us-ascii?Q?DEttvGUvpzLG0XwRdCNMBdBz1H/4PR4K5Lg38TzgaULw3sCtjgR+wLiVz6uh?=
 =?us-ascii?Q?CnYs1grfCYi/cKY03xJTD3c0qzQn5ShE3ekyx989UzAIyPwicJy30kXLruM5?=
 =?us-ascii?Q?HAvq0+Wb2ySVFOS76xCc2chu1JrILPLG/WlJO+yc8Wt/d+pkgRevPoQlfBOD?=
 =?us-ascii?Q?2SviEyW8TnLLSUOiupRot47DPoGIQP7x7ntukK+YHeLx7/OyFKPXUr5I7+vg?=
 =?us-ascii?Q?1yeyewn9H2wwKdP6h5RVLUfzRxL6twcito6WCzYsSDDop9vhYBwMuEW/Jt4E?=
 =?us-ascii?Q?mcSV1ZPuCi3HFwf98sqW7ubCs0AwKcZFONkgu9cTGfjLswaBxzwMi0si3Kz2?=
 =?us-ascii?Q?DmXxsBXKXLM+kVSVJ/8IhC8pEz0QdQwIjy7JL9sIFoQNSU4IUi4sn9zTjT93?=
 =?us-ascii?Q?0lWmAAcn1DvDzGPzDwF+/S4kdz91Aok3gSpNda0hLXKsvvUH0gVL?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4178844b-c623-44b1-3b63-08dea4ff7771
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:23:46.1884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBkjogM0Am0LsQz69ylkwJcHAl++QNDLo1SZ4693pnev3lVBlh4jh9+NJ3R1SqHnzgFhXQz82K1ajLRUp7YkjQL8xhTe68YTYoeVWjQ3uDLu8ilkVTXgHDl96UT24fWG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219

Add compatible "starfive,jhb100-fan-tach" for StarFive JHB100 Fan-Tach
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../hwmon/starfive,jhb100-fan-tach.yaml       | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
new file mode 100644
index 000000000000..fdc8539ec804
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
@@ -0,0 +1,98 @@
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
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^fan@[0-9]+$":
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
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
+    fan-tach-controller@11be0000 {
+        compatible = "starfive,jhb100-fan-tach";
+        reg = <0x11be0000 0x400>;
+        interrupts = <128>;
+        clocks = <&per2crg 33>;
+        resets = <&per2crg 5>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan@0 {
+            reg = <0>;
+            tach-ch = /bits/ 8 <0x0>, <0x8>;
+        };
+        fan@1 {
+            reg = <1>;
+            tach-ch = /bits/ 8 <0x1>, <0x9>;
+        };
+        fan@2 {
+            reg = <2>;
+            tach-ch = /bits/ 8 <0x2>, <0xa>;
+        };
+        fan@3 {
+            reg = <3>;
+            tach-ch = /bits/ 8 <0x3>, <0xb>;
+        };
+        fan@4 {
+            reg = <4>;
+            tach-ch = /bits/ 8 <0x4>, <0xc>;
+        };
+        fan@5 {
+            reg = <5>;
+            tach-ch = /bits/ 8 <0x5>, <0xd>;
+        };
+        fan@6 {
+            reg = <6>;
+            tach-ch = /bits/ 8 <0x6>, <0xe>;
+        };
+        fan@7 {
+            reg = <7>;
+            tach-ch = /bits/ 8 <0x7>, <0xf>;
+        };
+    };
-- 
2.25.1

