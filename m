Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012027.outbound.protection.outlook.com [52.101.53.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F8640BCBC;
	Mon,  7 Sep 2026 06:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763968; cv=fail; b=FFINPO4AMFtaJhGIxBlVG7U+edEennimPRqpooR42VeChnGHyKI/8oO/aY66HiltifSID+InF+iRa3TymQkxstJ7JPk+Lg8jPVPQoLb9uIhgDoDot4Vc8B4K8Nsk7wdkz9SZuMnql7YxULTNbroME7PttKbRQnt/n9SyIbpeqEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763968; c=relaxed/simple;
	bh=FSmk3SzmETKmXxQqMCkkg92HUXqmHyLJR2IS7n2kdZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dtDQOMqC+QPhZgod2jF/ZuSOxdLEJfxSY1rwPo4hqTQSbljZtfdP700WCmcSvLfXb6EU1cFkwNEbkwti1EYJh+gliOD6DtobgXwE7RozTaWMfnrfi7cP7Hnr/TS0oDREFOY34sNws9rFeWdMtfy5ElgrPfHTO1HgorwfVdnFiTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XZw1DUcr; arc=fail smtp.client-ip=52.101.53.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XZw1DUcr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfKu5KLKCwqjrMPQUGGfeFISMhXJCkvHbJNdQg+9wz+4n/Cmv/3tdhFw1aCAnZaoYzaTW9nrpOW8YjnY4k0ctiuuAqybgxLifENkelma3VDgPpCD2k8OypADMRuVKJj1HShdxjnQEgrTawGVxrcXlpVFgPacU/EuL+l/PArx7rHoNO7l1Yw0O4JsHskc2LrVnOdKDbefHW1MvH1GRZ03pyLsy2pJlyYIoGBSY23jH8kAOwbX5yfV2iClc8zuj6Nx6+mIiRdYoRBM/QG6km3NsQqKglnDDrNZmAidH4sdLn+YNakWcxkkvJt1m5IH6VA9q7/1dN9Acg9bArCufJjNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QQfNYlRBA2ZtHp4UlxxqokEZtUbXPg9G4IFL9/yZD4=;
 b=jgdM2U9I1VyRh7ikq47pUiZjAEt3T3nJL3vSgNsoWkTwFkz1CZg3OEbJSzPfHTLLPqVjHUYsmco3yBKAHHnhdwNgzJGGHJOXM/R1q7rhv11iX4G2JC6TKv76fAvGihmW0qoztktCKBZ5EkjgsMbTTE0d2ZxIijb/SW6OcEhQzFwDai+VR9XG6b6TmeanTSO8D03lMLn04E5KLceVpz9y3U0D3vKQ41QgY+HsGqsxE8DGfzr2xaJgUchnzjGCSHPouS+mAo9lOTW1MWATNuQpGevF6Rh2Hb8V4Eo30xqlaiIQRZgdjCTRNNCMMFwHxm/8z9moz8DBZVwLnRhOKzuhEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QQfNYlRBA2ZtHp4UlxxqokEZtUbXPg9G4IFL9/yZD4=;
 b=XZw1DUcr7XToWvQBpvJcH7zVUetvXYdSJPIYLQysY8jv/AlshBAXkbGFZWvHbWFgdI8oQC1RJInfsCfiLB378zmeu88Kc3N0zq9SQ8rAeh4W+E+qPg1YXISC9kIz4e0qtjUYxqzABZ1+qiinpjOcD1ehPot0ugejSux2Jx/FDGQ=
Received: from BLAPR05CA0012.namprd05.prod.outlook.com (2603:10b6:208:36e::21)
 by SA1PR12MB7269.namprd12.prod.outlook.com (2603:10b6:806:2be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 06:52:43 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::87) by BLAPR05CA0012.outlook.office365.com
 (2603:10b6:208:36e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Mon, 7
 Sep 2026 06:52:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 06:52:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 01:52:42 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 01:52:42 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 7 Sep 2026 01:52:40 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Mon, 7 Sep 2026 14:52:29 +0800
Subject: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260907-add-tda38740-and-tda38725-v2-1-1d051d63aa01@gmail.com>
References: <20260907-add-tda38740-and-tda38725-v2-0-1d051d63aa01@gmail.com>
In-Reply-To: <20260907-add-tda38740-and-tda38725-v2-0-1d051d63aa01@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788763951; l=3159;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=yJUSlD+iR1JmbsQDXZp6JI5ayImV0iL4dKTzOzpOFnI=;
 b=B3qZLjRI5q1OQy5lyDE8EFRGANThw8Ta0IcSYJWK/+sFvFj6mn3Wu+1p268pW8EPpWhYkkUQs
 F6pKoMIn7TCAL6lbVIod0D0mcRA28/wQFBpIkguovGCMRwZPq/WNms8
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|SA1PR12MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 0914ada3-4043-4af8-d72c-08df0cac9d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	znB3uKacqP8spK8SugxBHz/kc9+uCS8VHkWWMDkuIoiBGxc87/rk2qEd5ie+XiRRSavom/Ch8rrmtkKuhOrT3cTxpiLbHfXB8UppxhTN6BGDDLtiDbwGSz7yoPuOgSw41Wdy2yVIfiO5IGcizLJ7mzXUsDWm0eYtjCHYI8hEWnO9yDylMA/Afg6aKhxWtBySqVYK9C93/VNrj6IU/9zP8UjvqyE6t3Up3L0wDtMgEwjzj0sn1aALl5cNJvSbtGExFuzpGWZwGD2vV637BUquVB1AxDUuMFNCIWI0S8nwrB0MCalhGhcTj2t/fEiZkrqP4S/Wb6+EfAY2sENoNJ/jAAEs8Tm+haAjdvqGJgQsj2pmtC3SfS2LY4rjWxNRuKbds7dkXqXtO6D0ov0ADSl9cCWzhtA4QdOWp5rz+fY+mePkK8+VTz+m7ARO3v9gt9BrA85XUbPGxFqKmUo4OtF2ek3b808KC+9dVT25sz0ZQV2c3Mza5ssOSp4yBIpsuysQAvLol4Qjv8elvaYY3c/aP22ppQj5pPxhnnEYzw8G4eH6YE3WDXpjPekHkaKu8rLL9crwcwAit2fFeZSc7avtVK96GpLAmkuTg7/ovfI2V9ryLqb7Cif/rkdUypSgSxztHPxgYLRqrjH9CT1AJS9bWw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	grf6Qyuvzky5ILKjbySOnMhUJaRyprwtlgDQtjk4uFCg+F9qFQQc2Q0gtYE0i0wk3dHPvFTmYtKgFA1sWKwiqkUq7w54f/IipZNgDFafNk7Ha6/xLxxYk9GueCqfJuB2BKbnG3g135lMdlm7SVQEzZz1j3BeVi7a/iB1O7wy+CBsZAZixlwwWLMClqGvzO8QWtnpZV1dSOcT6e5IWC5xJoF1KfJ5lNW/I5qCSn777VlUqRk84Yjj7smKhDRpNSosKK2dEzS1q4253nxzNWfDJ7PsX96rJU+EruJdXgfuVCgG6psNLtqFoiPAV1LaO6huOnFX5yMXUH5A/Dkssk7OX5IptLY5WG046mLMYlgLT+TJxi32kY57uEdT1wa7q6k7f2zrLmxteHgti4qJ7dHWl5czgH24rkf+JzKvc9S/w982YEtGvNvJOg/nVR1PQVmt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 06:52:42.7033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0914ada3-4043-4af8-d72c-08df0cac9d92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7269

From: Colin Huang <u8813345@gmail.com>

Add devicetree bindings for the Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators with PMBus interface.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
new file mode 100644
index 000000000000..c9bf19902d3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon TDA38740 and TDA38725 PMBus Synchronous Buck Regulator
+
+maintainers:
+  - Colin Huang <u8813345@gmail.com>
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

