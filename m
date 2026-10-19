Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2126.outbound.protection.partner.outlook.cn [139.219.146.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BF04DA9BF;
	Mon, 19 Oct 2026 11:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410327; cv=fail; b=W4wULvYy0tjySeqEtmzJn654D6t5DJVEa8L8QZSdlULDKI4IpZAyyxAUoFD6aTVR4dwFwNohGcYCurjXoatt1/B83pol+hzlCvfj2A+ci9OyFxSnZhN/EuXtiNVpTpH5yEDZE3hcmuqQUHG6awbKcSv2Ss1dWi+mVy+s54A/9C0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410327; c=relaxed/simple;
	bh=O8JiSBZjHbnjSqEiOOCUQ+Yxo0tQWmaSv5E6Qf1gzF8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZPwMrfHf/GYENBiynw7oly+m6IPOFDCRU3/daqFHJl7K/oSF/hxqy8G5PgISIbRwM0ckdjUMILYG79s+sXizwqWDe/wb/ahTNP8zzE5kTWj3dhJYfz3cFG6rHNHVewB4meXfQ4WrPytV6nQCN2bCeLf//rRQ2nNvJogtdi6Et1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0bOAwcIQu3NAlfdBtV9PEYezcmUSbUlfbT+aZAIbIlrj5MjHsoTZt2qaPJHIRARKi3qIiuq0JKWa+NUAHEIfdYLHvY97TzK52xagKi99rMyjolQudXYzaJ0/nxCvwAmfrb8mbnZKIRxaskkAWjZevMgoqPxsrw+FbD/vXVXArUcQhIsSNSMZxdZcnUgwCXi0VLhdrtgduiDBX7qVXlqq1nIAd9RzrEd4DS9aQSt/59s/CGPIYWf0eZ4OQgXtRf05G60kr6UcXblOrUcmT4Wd4bJwnAcKAI5BuVzJif6N0IQ2m26Kx70KcWsgsl5Dk9tQ+tJjGk4kNuOCCSiG6ZUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55iiIP2ki936Z1dsBDczs07EfFD4EWLH8r0Ei/jZu4M=;
 b=W0YT3AivO8QrHmm70Ka6YUekqzrj2t7dswFttPWqOkZVwsFTvlb9UxhWcHSwj+6i23sO2gTfXxrH4xRjA1V9dUaYe+KZ2KsCo1Ns17TWF2RI+fZwVoGBKjK08oijHw/bg+G9SS6pS8r+Xsk1ZcPMBtVjAGKws8HBwtZ8/3TGcl38+vhP/k5i7Cs8VewhSvnd/kCFxCRPB0voI2dQ2sBx1hn/htqcK67jRNKj6Eu0udetY83pOhWHVUMzOKWiRqZ3bREtxKFbJGEakC+0xF78ZgmC5aNiViDhwJAo9OS8HB/MLWNkmEdbQDpeVTGmcAnXKewgO2DOrB19W1xbvZjnpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1316.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:45:13 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.017; Mon, 19 Oct 2026 11:45:13 +0000
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
Subject: [PATCH v4 1/6] dt-bindings: peci: Add StarFive JHB100 PECI controller
Date: Mon, 19 Oct 2026 04:44:57 -0700
Message-Id: <20261019114502.55307-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0010.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::17) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1316:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f0f059a-fabd-48de-b171-08df2dd66fca
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|52116014|18002099003|10067099003|22082099003|3023799007|38350700014|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	UDjyWydAXANpZxjSewUWdbuud1H0R4dm54FTZCWCDfzK7UrJIUcXD1jMl0M/hewHjTT9zAEGejDylYwVGO/ZxuEr52U7bIpULU0TySigRBzBTpMZS4cFvl3ieZlPfUf0CdaPnEv14YZz7tLPpGlF2c39G70aI0OcBHs8OXfbDCEgNraq+EzWt1FTXYfaIUJfK6kmNBkDMVeZhRrrq3IFGtAWzDW9j5Ah9UY4/nejoG+YMJqmXJdN5+eyDlnpiBKUlxMuXmBmrclASn91ZeMkbAM5DXmn9cRatZsGe34OLkrt8oSxuJyvjz5TZnnI8oE7DG4sR8KYNlm74QaszF9kiFD2BXXJeYiKfg5UiJH0uEGoE0PgnQu4N0Jx7XmwERV8oQft4p0MtIzQBTbvm1h/2yAVfiEEFZzJpStrGN6NeClTrBLXKeqrw11fDNPHviJc8aHfQ/xYQM5smvdkZqsoRfTVyotoEYFpWL23xhCfTizQrhLwxTGXBJbFeyn/RGEQVhujoInnQhV1uB2Aq1ZvhY7MLaacjThJGpihRK9VWFJ1PiEvsgP7KW582BMAZiYs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(52116014)(18002099003)(10067099003)(22082099003)(3023799007)(38350700014)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?esUnI5t3MIkQynVNCIfzzp/P61BMx6PS3kvx/3hE0SNgSrBYQiQOgVgh4Jvn?=
 =?us-ascii?Q?fQJsOlF4cg0BnS/CphPANK4Sab8/VLYUIN81By724kOBc3T4nrIShT1IhLVw?=
 =?us-ascii?Q?9X4k1VyRfHgZujSp/dAnrz1NB6NqaSASlT1j3VIZl63vO5oRRmJtRbTCJ0f3?=
 =?us-ascii?Q?Lkw9GuJbqlmre0uefRNTwO0w62f0tyqgAqUyse8jKxT4qSlGLdajx2xjHV+D?=
 =?us-ascii?Q?PBNhurFNYjF3bh8zzlT4lkvjB925zzpEFeL5sR944UtfBh1hfeHtvUCTIN5G?=
 =?us-ascii?Q?HtmhC7gganZwy/lbYBcD/W0XxP+WlY/QVRJz9uLGWYVYtS3YGHhpJv7WpIax?=
 =?us-ascii?Q?FFXd0Qo7mJNMAXmCycGF3mZBCVj0n6/sMMNFjQXRir9fIWbQnojJsvhql61O?=
 =?us-ascii?Q?E6tE8CWvey7VtLjhpsbbKl5Y9NGX4HZM7TWyMaQLTsc4L6nyKKqz0VFrscQD?=
 =?us-ascii?Q?Ccl0Gy58GdhBXelOFBI/dS/cDi+1AKoGS+/pWpPZSNJuV/p10S4C4t7RVxZc?=
 =?us-ascii?Q?L3/UQn4O5iD5qLe/vh9cEoIPWqEo/SbmzEs+qeCTneXW0jj6DKAxe8cx9KNR?=
 =?us-ascii?Q?8uktCQbPtIERXdlHhfxkWsGyZa+03md2WZexPn6U2o2V84j5W+Qme8NniTGZ?=
 =?us-ascii?Q?fWH1g5j9NOuvZLODd+jJhHbsZl3wSJpvLYX6atc0Kuwl1vmnozllUjSkMICU?=
 =?us-ascii?Q?pUeeFQWzdoGQqNCXxlnGMH45eVEelxDGybfiZTzB5iQYbcwDOiDOPJt9mQIm?=
 =?us-ascii?Q?NQKFYFPpbuXW+BGy08rCPqLEo6hWJwgOrl7QUIN+CVmCpMyuXlnYHoDiqaYL?=
 =?us-ascii?Q?ziRDbUUV7GA90tddkHINwoMyFA8r+lcoP2wwlGViVgDa0G7304zKX+cj3E50?=
 =?us-ascii?Q?w9Blc54WY6RpFChXf2Mg8RJGYiMCHk3M90NMSbSr2HqNQgYFt+eQhPWOfFCB?=
 =?us-ascii?Q?tE70HPH6WkzL9uGMo9yPBh7ZCTwaTe9xAWu/1e1PfInC9qLMLzkjwzS9dptU?=
 =?us-ascii?Q?3wSZqgPvMz2nXQhgwJ8UUOLmmIuX28iI4NODzcqvUcJnNRKu7vOg6AecXMjE?=
 =?us-ascii?Q?bY601l2TyNiZwYjOZpoZrTNWQNKHs0QPhEy0DQIgGMYXGTO/dB28p+558LDC?=
 =?us-ascii?Q?xDxeQJULxDRL2OCbkd3A26rzK9oMdI8sGjQmh+zrXWsdJ730aYlS3N+cmvxS?=
 =?us-ascii?Q?wWcs8+rQazupOAx84jsfWoNjFuG5H9mmZKsk48jOP5cKAUfag2bk/JUrXnqp?=
 =?us-ascii?Q?rnShmItzas5FE29bdcfVouDI5WvDjVHAjnwf4A3qPNFUHdVtHWN2YPq5D/W0?=
 =?us-ascii?Q?ReSVKyy8RSvvoqalS9vlj8T5+TekqxJpnXnoz0iw+Fygb4lKQOJW9Z7hfwyn?=
 =?us-ascii?Q?bhSKPB+moXysq6j9Nr9dqVcjDxI2hVMmHZbEwStCQCB0SEmzonzgLbve9wNj?=
 =?us-ascii?Q?JASLFauCc6WojOYm/DNiuO4qRNgZEF7+6Hkv1ycsHK9Fs0Opohrm5zZ/ajAE?=
 =?us-ascii?Q?kpvbUIahRXfKHEZ+CfIm4VFadO6ZsOJMacGFgbKGGa2T/b3ueazx9X1kLjby?=
 =?us-ascii?Q?wAuceZQz4mFFhP/cLaLmlJcyxDrsAA4Sp52q/kPV0f0s5CfnXkd1dBGNNmEm?=
 =?us-ascii?Q?5sOW8BpfiGJgTDVD7lkf0EXbcKFFKw01wBeRX8HtswCMVNk9Z5BMQgBzsMok?=
 =?us-ascii?Q?yJidg32PgJ2Jnfkyk1kYoqeu9OCO6Uw+7fq9vDuH9whKYrj2nAwhU3YFuL/o?=
 =?us-ascii?Q?PwJfwuGlogTLeuaCo8Ak4esR4/cR/OoBsExX501zg2D2wsB1QCt5?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0f059a-fabd-48de-b171-08df2dd66fca
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:45:13.2924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajPcJbYsOgaPFuS3jdln0AJ/Tg8SudzU3Zsem8ehiwB2BYcYH4R3XmBa/smcyV+HHPx8qHP6qWm7s9yUiU+9uZwMjLEUVxNfz+pkmpKZEv7TiIYnJFALvJkTWxOY9vdW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1316

Add device tree bindings for the Platform Environment Control Interface
(PECI) controller found on StarFive JHB100 SoC.

Co-developed-by: Mason Huo <mason.huo@starfivetech.com>
Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>
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

