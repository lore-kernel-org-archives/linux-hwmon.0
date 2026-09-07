Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AB23EC812;
	Mon,  7 Sep 2026 03:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751713; cv=fail; b=DgWpeUzD24+aZedGnTJRLLGrK3TO6TAfJrlVuNHouYg6TB34MakYF7m96jJJnmB5/WRQjsWoHXs+nDurU3Q34vpQVr2/9TTNME5zWDiAtgC7bMiyMh7U1C+VGyiJhKW0SNi29rNKgkYtyzIXTg4g3VuA+18QunQe+CRQZ5vQ104=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751713; c=relaxed/simple;
	bh=mrD6FsrHOV0KgVQRENkSsJClr14vgL8tajisw12bO+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qID5PqkyPHh9zhAnAkZ468vRtyDWKrA0MHJix8dTVyL8F8EUb29M3/U4Wf1EqvZqLEjlFUu7Pr2M5k5BEX6AFD1oj73+XWkQGHjDflPGDXrNlhckP3OBId4BI/z2TwaNFRaeCsF6zoMmsztGJocC2HD1GKauPwdN4AovQim57QI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=um7Jn3KE; arc=fail smtp.client-ip=52.101.85.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="um7Jn3KE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKCBb60c2LSAGSDW1YlePEIsvk2PiTghB/ct5wtOH4htQW0tO5K+2kn3wLdM6iP9GvVwdoex+EPOYBbw5VZ8eMYO6Wqqr/36iOZM3MiDZXduVNK+vNdUlhWNX0w1jvvfn7KwPbOXEwptUJCyPF8neEyJzIZPzjC0VgvNLp534jEMKLv0BDu5IUQVjsOknDJu4wzRxd3fwuD2JJ2QmfRAI/3GbQghVffikE93PjAXl/K24TOJJ8depM0lFoIKtkZC6MurRzISoQeAf0DTOXeTKGLnYrAIaVZ7Pv5LtYBkQJZJsk1OLiGTOP/Be9xsgQ2lP4/KPCtmSCUhW+hDiG1R9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XA6GNwgQcyLwkVJyndblJZ9g/5psz8A+QpBKFwHqMA=;
 b=q7p0tqTpoDGnJR8DshER9SVRF+IdXwrOXb67vss6CrFj/bxLdXnRmPPGCNuERru0XtF0kksLukZbV7IxWx2tdVk/clBkx4ic/BrMwUkH66550M+tSU11+1dlg2BeWUQD/WvS+3CloNnYFrZmP2cznVhmiGoDg6fj55vS1rqI0bwU/+tEYCQYN4Ay+vihIJMsTPV21JYrbnSh5TKy/10CDT0AI++pr/E8ewb8piFvtewYLtZPygAiOL6cxd06cmaCl6KVZPxTYeUHZR/g78VkrNQDmdy72TByW/Y2yp8aJtUDrmA+0CuyuOczFZRPOA6kxc13XJGuB7mQqwRuV9628Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XA6GNwgQcyLwkVJyndblJZ9g/5psz8A+QpBKFwHqMA=;
 b=um7Jn3KE8EBnPEmOU0uZ5T8ZjOSXuMdN+7aQcC14ULG4dLBEcWPvv3WkNj/AUzJgaT+GvATGpiBIzpW6g63vxu8Dn9xK0kM+CGwXEVzanA01PlAFuZmMG9nf5A5uLC2LfaviooLyWePpQFa1Mb1SLV2SFuSnhEUdy/09szAA/YU=
Received: from SJ0PR03CA0219.namprd03.prod.outlook.com (2603:10b6:a03:39f::14)
 by MN6PR12MB8514.namprd12.prod.outlook.com (2603:10b6:208:474::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 03:28:28 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::9e) by SJ0PR03CA0219.outlook.office365.com
 (2603:10b6:a03:39f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 03:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 03:28:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 6 Sep
 2026 22:28:27 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 6 Sep
 2026 22:28:27 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Sun, 6 Sep 2026 22:28:25 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Mon, 7 Sep 2026 11:28:03 +0800
Subject: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740 and
 tda38725
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260907-add-tda38740-and-tda38725-v1-1-e2db1b2566b1@gmail.com>
References: <20260907-add-tda38740-and-tda38725-v1-0-e2db1b2566b1@gmail.com>
In-Reply-To: <20260907-add-tda38740-and-tda38725-v1-0-e2db1b2566b1@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788751696; l=3104;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=yUOQXGNBNd9Ljjv2nVUKQAeCIRrU+nMiPNNOjmpKg0o=;
 b=tZG+VfAZHrpq+0W3qPzfwe03LcVW74XqRLztoxwCP//pVi30Oy+jrqCBjJcTcgg0lFJof2DSf
 76oQTnDgiGQDoqsu86f0Kt5cgMxXCD3vIE7XHKu+0aB1uYgDXR73ieM
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|MN6PR12MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d50f7ab-b185-4632-9dc0-08df0c90156f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|56012099006|11063799006|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	MuT0bhszuG/HDjK8/7wqm97GCsViqFXCaKF9CyRq18TsC2Ad0fvBEpN8MeV3So3K2Bie2q3sly6BH4EZRuI9KndC7s2ZUyqOI0pa1FiaDQ3YCnD9NAI3RYO4FVUL5S9H5/dEv0ov6d8M8R41PotsRWoTkvedr0oeWlp/ERgwPDcQNkQthSKmJGLl/psrLOcBFN37Cf6QE8FYTHfWzqCA7eUQCnyZD3G4jvKqQKC4wFmiWGf40O0YV9iNd/2OSXajxjzqJ/YrAzftNdDkvn2NsCIGly3YFQ4yBr3Ds5tcf4q4t1dNUujnGmRUM3/5H3KeYWEt21Py9PJgMQlZX1UxSSdAoCcNcSp1C726DxtObqrNbBqbg7k0m3gXJItRvaQ9YJor2hLElv22QC1/Lnv5e4fSF9V7NaP52P0HP/uKbMT/FDW11PHEMrq6tS+Lkjg1C08E6vyA9WPjnp/UCWNWSk0R9OfesYLFYERIPTeIoQnVzKC3YaVqvcTGUxZ8Qj9L2zZ2GntmkiJppOo9qp5WSxCHWvicWDdBthPPWzPrgSSKbGWYw0kCJ1+AMBgOKSTy6Hrcw12AjScLjpgK6vdkcDtxVMcrPf+1nuXRrNwb749XzKPXr4eZNyoTU9C9hK49TeCOPxVGK8vLVAr7B+ma/w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wWPIFn3rGlt+wuixWi7dqrEoA6AbBofVJz6Sbdc9CCSCWjTIdjGtfn7q2i/gm9M/oZpXfcDknAUnbNbErxPEymNJISd2lw82LjtMtSaXv+MNOg0R0YVevTREwfC+XkD5mTLzjhdebj6QTxB5F6gi9B4bXa37v3aEMeQmb3qjWm4fXUjKAe8AaxjQX1I0nmBmJorHSGEs6tPJMiTs0pqfLgmIrJa+0cSV9ySiW195EOmwfhsdYo/YkD+IyddzMu4xTiOthaBZna/FQsh8t02491ATrEtiy/YUTkrpiMtaCp/VxHqNg2kbCvkemlOghHEbUee5k9KxudW49Gr0nrK+Sn6A5groJRDDj+PCNitnUxwqdSUN9QMbGmgiWmGERrl2CcdOW1V5vxM2cM++bo2KwRMg8w2jsFnWRn/p3cGxgE+ghYwgXsbdUmiQiIceS8nO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 03:28:28.3080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d50f7ab-b185-4632-9dc0-08df0c90156f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8514

From: Colin Huang <u8813345@gmail.com>

Add devicetree bindings for the Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators with PMBus interface.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
new file mode 100644
index 000000000000..02380c09c5f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: https://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740.yaml#
+$schema: https://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon TDA38740 and TDA38725 PMBus Synchronous Buck Regulator
+
+description: |
+  The Infineon TDA38740/TDA38725 is a 40A/25A single-voltage synchronous
+  buck regulator with a PMBus interface designed for industrial use.
+
+  Datasheet:
+  https://www.infineon.com/row/public/documents/24/49/infineon-tda38740-tda38725-datasheet-en.pdf
+
+properties:
+  compatible:
+    enum:
+      - infineon,tda38725
+      - infineon,tda38740
+
+  reg:
+    maxItems: 1
+
+  infineon,vout-scale-micro:
+    description: |
+      Scaling factor applied to READ_VOUT telemetry.
+
+      TDA38740/25 pin strap parts are available in two flavors of
+      VOUT_SCALE_LOOP: 1:1 and 1:2.
+
+      For the 1:1 VOUT_SCALE_LOOP version, output voltage sense pins are
+      directly connected to the output, and no resistor divider is used.
+
+      For the 1:2 version, a resistor divider is typically used (for example,
+      499 ohms for both top and bottom resistors).
+
+      In some designs, users intentionally modify the feedback divider ratio
+      to obtain an output voltage different from the internally configured
+      VBOOT or VOUT value.
+
+      In such cases, the device telemetry (READ_VOUT) continues to report
+      the internally programmed voltage and does not reflect the actual
+      externally adjusted output voltage.
+
+      This property provides a multiplier to scale the reported telemetry
+      value so that the monitoring system reflects the actual output voltage.
+
+      The value shall be expressed in micro units where 1,000,000 represents
+      a scaling factor of 1.0.
+
+      Example:
+        If actual Vout = 0.75V and READ_VOUT reports 0.7V:
+        scaling factor = 0.75 / 0.7 = 1.071
+        value = 1071000
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 100000
+    maximum: 2000000
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@40 {
+            compatible = "infineon,tda38740";
+            reg = <0x40>;
+            infineon,vout-scale-micro = <1071000>;
+        };
+    };
+

-- 
2.34.1

