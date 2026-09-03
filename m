Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2128.outbound.protection.partner.outlook.cn [139.219.146.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FA74AF15F;
	Thu,  3 Sep 2026 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442552; cv=fail; b=L9+Ono7BA0i33Gf1Bp9Q/Gb2j6AgHfsr+K1vH01r42NceZp4GEqBpYFvzBGf2gNlgM9YzJLL0Rkl2pBfzL4fObnQBxbst+QnC5J2FIduiQhvo4Cguua+Ftnbyuu8KjF11SN6ntTxZpfHWJd6sAvMXL/Je7MAju2R5Gq1iWnxMik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442552; c=relaxed/simple;
	bh=MoE4jXzDqqcdIIWZ3r+wxrpTfVpvL8Ij77V84urtwBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jid60GUYsZ3/T4Rapneb8hu/CuHOlALvuAWbZVdaKlJjM1hOz+aCKmU/sCTRogh2JmXbhvDr21iGATimA6MSDDfNikLh9CwOMLvV5sGniAbtMSFJMg8AznVoRp6aYXEAtaKjqkNaGcHYuVMb30d0Yr2hpecvCJgUJEzer/9DUmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9l+5xSpyplqmBoGQQC/w9wtzIXORHK7iUKtZZNIThET9Bqe8UQsahf52ZKuNRDrc9mUmWqPXJ1wxcC4axGkmsvgpE72GIesTGoy5K0cZY91bWJGSqslkP4eaQaR72EGh6nTCU7ucZARwY+U39wNthRwASH0yFsN2uolixsAnaHonG4egf+fTAyw5DV0xEJolv0Bq3t1ID81SgfSVRk2l5g2VksVTT8h2U1xkIOjgZIG8zNI0d4hZngbDL8AnubF0ck+MGxcO2oaoUL/Qh2flSBYTKZ/KOaDV5WVoZGPLjxGDib0S+EkUbyWGcX1SLOUhRtisNfdg2xISbH3VkD2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV6mc3gQMlM1k9J8uW+evKf4D/uq5HD/Qg8bfNL7ZW0=;
 b=F0JY6c5bMPRkcv6/In+FLYjKaR/E7NxPO4MR9rV5ultfMT6PzhafPAZYFgXYQspmANb2w7Uxtd8DMRVUQoUezBDYMGssfOhWZQpQY0miiFQZYmsKTfAQOYN53dtv/A2ewNuFhU8KnF06deJIwrkPK/6hK53t+ZDNn32RNQE4ta4GvWJ0fFoTQCPfSb4zmITdKtplGa8gAyKp0jMZwsZcjFEfHtKP9V2iHSUNDKkc8tEHRzGw0PCjySYUg7s6sF2Q4DAQEYY6ASVD3XMElZZT2g/OIZNuR1ND10V9ItkRDnhQqnM81Io56CfFpQ6Rfvoc55/Jqygw8MP33XlpE1rFuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102) by
 ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn (10.2.1.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.12; Thu, 3 Sep 2026 13:35:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Thu, 3 Sep 2026 13:35:19 +0000
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
Subject: [PATCH v1 1/6] dt-bindings: peci: Add StarFive JHB100 PECI controller
Date: Thu,  3 Sep 2026 06:34:03 -0700
Message-Id: <20260903133408.110847-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::29) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1201:EE_
X-MS-Office365-Filtering-Correlation-Id: 03311570-0b24-4269-852e-08df09c01bab
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|52116014|376014|22082099003|38350700014|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	k+fdysMow6nq6FssNiPlzKUwBifh5iXjgQR0Vt3nDHSMa9P0kqR9tn/FIZTag+qGrhN/XDvAEAbKYYzy3T/O+yDCf+QKr91Yrxx6YrPeDVetY0sWTaEqkfHTM011M6IHft3/qmNl8vwQnTH9JF3zf1EAz5NSTlNbJRIUp9ftemTmx5cwi/L8HFs7gwTKrwIvJu3OgilVpU8eoq5QBqjKlYg1c6v/PtCfzN/O7E+ivYXnzMJCWORGJkOh+AXLs5+R6k3ZrZwzMIWrLK3DleSTbcFVibpGnnN6f3W1gPIHNfYIqkG48tUk1TF9t3K8VHzj5aI1ZSLHJvbwBKDio5G22W64WIm24Vu3xd+DhcFO4ubQm9btxL0jbzn6lW6jSNT+Wj8l7681EWvQibVPAiszS41dP+hZnJbJ1d7XHel1tG1tAkdEkwOCHm0U37M8cBHIcQXJroA56l9e/bUAI9Zh6YqcvcX4AJnRAhfKqWpojXaePCIM4EBEcxNA3A/750esrxQ8E4UGf3rxBybwJWalJvGp0igMRkdAXWLkNlZwyPVGvcrxyQBbe95/PHLgkhoI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(52116014)(376014)(22082099003)(38350700014)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zpSdDetLbY7aEwobR+NmbUifg0Ie0l3NjKvVYvkZuKuaBlVfSFUugqLaP91+?=
 =?us-ascii?Q?ereT7LKE8e0FJ6txPWGvQgD6DxTMMV04TdnWUM9aPQ5FG4wv2aeP4MBFvC3K?=
 =?us-ascii?Q?ArZlOixRSqPufn0ORq3tCeXx3cKP9cFwAzw8vWPscE0i4PJPQ1sYXv9ioVX6?=
 =?us-ascii?Q?feWkmo6rqFRQJNPzjbAiF7IauVn/9gTwAxU0MCGwflDMYXcUdqpp7KwY1jI7?=
 =?us-ascii?Q?NXkz74hZa/F/DZK55F+f6AGLYaa1v9V2AU074HGrwBHwNNI4y6boPg7lsGkh?=
 =?us-ascii?Q?G3En0Kxna1qgL2isNRSeoe7ZUC6c5m8MtELuC9265kcNaolp0tbYOMdfp4s4?=
 =?us-ascii?Q?4RW33lDXcVkKadDnCMCW0SfLgzceJH9eaWvmaD16EzbtP1wEWnj+/9Drth9z?=
 =?us-ascii?Q?fVJRDtVev4iJyNEdIF2QZOHzmtxAQFThssGgwkl5xKbo8Qhdky2dBRZPaVOZ?=
 =?us-ascii?Q?c2VlWGWu2ubJss59TDORTo6x74rIS4OV79KzSEzu06XQjCzNRk8aoxDZKxbK?=
 =?us-ascii?Q?qaWi2h9RUmJmWkuSyRmhj4G4JYsg7c5pRkqBVAqoDv9QlcTw426diXAeC38O?=
 =?us-ascii?Q?7gqho98I2RNx20zBBHCm9cF/M2MfNXH+SgWZHdFUC6qoYSnpiVFKZStTACa4?=
 =?us-ascii?Q?XRmOFhbRabD9N1sn+BbLcIdqv+DdH/RsYNWFDbIR6cZL4C6J14M/Q0Fw1lbt?=
 =?us-ascii?Q?SSmteHwHsh4+JGortvfT4xOjNTnoxXK0o5u6Qno6tpXOzKRyRGYYTi4uvO1m?=
 =?us-ascii?Q?JuQ3mpBvrCIWuVj7GRh3vPFWWCjMljMhgSMJ1qUs+5nq/nAfsTtRsMzkRAz2?=
 =?us-ascii?Q?JBPEOKmOhwhnLzR+Vh8dVvjP1QbC+jqsLxQOcm+yWVWV3xu/a9OQZsDnUVfo?=
 =?us-ascii?Q?Q5YfOSM+KD/mTqeJS3RnkxtsT4rKHJ3vuvDSAi379xr3A/rxqRmx1UO4P2T0?=
 =?us-ascii?Q?qjIAwFwWpL0UO2L689OXF1kVbJcKkuJUaQ6EIyVZRm1FQyp6UsmAwMVXem0C?=
 =?us-ascii?Q?QouapPg7SynzCOAykOGJw7xbGicoPNSagYJxWSyMaoQeZntUjlop1AkWXO/C?=
 =?us-ascii?Q?vVw3BtVSOxLLmaC3EafUB0x/z/d27qUH8nIRF0pqA61z5mENlFBLNymR5Rcx?=
 =?us-ascii?Q?kdhkXQmPVR6RLdqBz3D9OkM69BVK+FwfSm1ihqPHI88aoW2IiWsdQ8+XPpvE?=
 =?us-ascii?Q?IRQ61VbSmCzKj4CVCprlb3ACebJM0H/JJpDhpFzXk92FNsBBvrFQ1p8RQLi0?=
 =?us-ascii?Q?n301wSJ2j5d76er9wN0LAUkKVGsNwRl3ZyaeujvP3oe78MVU/++//wiX7kmx?=
 =?us-ascii?Q?YiN5UyMIg2sIJe+fIDb8BtwmQQBPSRlbxkkIGPXx/82biDMFzhVIv/pjAZf2?=
 =?us-ascii?Q?jmUfiINSqV/JnLgXXxIOLWv4re67u+WCs8fYIublEoUCHfH4NvNmo6bP8arv?=
 =?us-ascii?Q?lNDcOm1uUHlwV9rs9FAVGzwemBHio5UZuk9nZ/dqZJPD4ZYCnyb114U2z6E1?=
 =?us-ascii?Q?9vm1dbI/vkmhptWK9TEN1azIv59v/GmJYV/jUq5NYbXnOZ/WPPhUSVjxCLH/?=
 =?us-ascii?Q?YbxmblZvaipmz6kIa620ckETC4DM/XwAMfGPESMZCvntLy67fsP+sAYMN6Iq?=
 =?us-ascii?Q?+u83eHnqgz+YJwHEufe3WF7OZCOME8FD5GoamzDooOw6RGy2R1WUsLVsYhkq?=
 =?us-ascii?Q?d8Jlp6XagvRY+iDrAY1wk35jWfNbmy7MYml9n6F4RiiR1MthAvOKqZ+Djl0e?=
 =?us-ascii?Q?jn8dA1lCQ6nGQodbSiGkTtAFITwSyzrdQvsJlAvYGhKVD8RVrMYK?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03311570-0b24-4269-852e-08df09c01bab
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 13:34:49.3034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vp1jIPqYYBW+jqHRVMbKz8F97YRwLPp6GPqMUpQTU7FieAxlQd/kPv64MwN2F0iUIMPjFLkFHwRIwBDuPqoCnrPHs1kQKHyD1Ta8FcGQN0eTA12suAVidPJ7nLt4iHY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201

Add device tree bindings for the Platform Environment Control Interface
(PECI) controller found on StarFive JHB100 SoC.

Co-developed-by: Mason Huo <mason.huo@starfivetech.com>
Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../bindings/peci/starfive,jhb100-peci.yaml   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/starfive,jhb100-peci.yaml

diff --git a/Documentation/devicetree/bindings/peci/starfive,jhb100-peci.yaml b/Documentation/devicetree/bindings/peci/starfive,jhb100-peci.yaml
new file mode 100644
index 000000000000..fd71a98b5584
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
