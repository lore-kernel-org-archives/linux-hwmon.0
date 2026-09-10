Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012005.outbound.protection.outlook.com [52.101.53.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C93750CF;
	Thu, 10 Sep 2026 06:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021178; cv=fail; b=S1KNhZr29j7tzJWz3fF61lUqFXopt8X1pKjT97X/iuhJl8xPbfD52nSocb9MND6C8VrTZeYPqYtKfJMWhS7eCDtSYkV8HX1SVXWv34eH7ISMxQGhWHiGbl9roGlE9yX5QeztfdjEqEarEBeo+CoTHR/wRLDj2Q4JGBrQjYn9kSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021178; c=relaxed/simple;
	bh=HzC8OOWiWtcwAWNRVmFkFze9Fj8HexnZscOOJ3EzOgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MsMVCXnQNad4qhV+PiAHJWGfLBgmAW1zxHR/s/X5AVKWehuHTuyvfbhVIh1a89n7kLPlEtWPMFO/WR6k9VMvjwdz9o/DIVGHQFn5nKjiDomGpOpCx2DBWq+Geif4Xx8AuQhiRLj4nfHzvAE2rldenbaLYRdIMwgUZ5T28Scl1eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RNc886Y1; arc=fail smtp.client-ip=52.101.53.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RNc886Y1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHmmdnlsNPGnf+eFEhr36Iky76htILaewsWwa2ksIlrpKl4jMe47JaJcXXO0/AGYkUb9HeHh8JLDEkaiVZNgSvo4Qt8lZBdmGjLLQv2Am+QIpammSQ2kBPs60THZNo5Jnx+f67uAFTU+yiQfjOha7v3EpONxE1G2EK/LCOuLPnduNeSWjC4GstNUNMaOyG4ui0Z/vcLwW7TNCZxO4Yymrf/mGypqs/69RuBPwexWeo0rFsRsveFdcXItdlVnbSwtX9gEPJveNME+GZSYcGZDi0EnQADCqGC1WH2WlGLADSbag9STjJK0TqI7c8LPkYBkJEl5We9LHSaKo42FneXqZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YCDGLLtbXwScotGX0kgeUwf1qgoYtzFGrKMDFHjqyo=;
 b=sOgHVs9ZZwlJFfyBepPLi+yeXkaxKgIQJ7Z9V0KUMA2xqAZVIz5cbmyZWADci3yN10HuMzN2/DjWp+Y1OjKHXgLwO7SOx3izL8Gg3SZFZhLvzUjrc142FOpcrm1Bo/m5vo0kRlwQbLNuYMTWkukU175Ae446pRdcT71UhZU06HG2zfEZApbeZ9TrS3xt6jKY55z05j9zqAhYnRam5m+uBW4aWRmbZ/+wwPt7sX9zWbBpWwDAkyPBs7/VEXqUlB3K3C3coIjelcNq16mpeZw1Kpy9/qPtJystrz1wfS5LfkTbFWtuWn93In3uR4DjyrFnS6lXE4LZk0JPgTA92wCYmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YCDGLLtbXwScotGX0kgeUwf1qgoYtzFGrKMDFHjqyo=;
 b=RNc886Y15HyPNY8dRvnCMBRaY32wM9V3gig9LedVY5+zVkeFn4gVBTBzHOzc+gnoFSxyUOnrtEy3QHxOa0/3aTOaCABR9bEAjfw5rqYxcNrg/hE44IBkLcgiqfSoKrN+mEst5k8sfL3yqhZdCJNHZwF4eWiL7JzCz3XuB4Bz+bY=
Received: from BN9PR03CA0677.namprd03.prod.outlook.com (2603:10b6:408:10e::22)
 by IA1PR12MB7543.namprd12.prod.outlook.com (2603:10b6:208:42d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 06:19:14 +0000
Received: from BN1PEPF0001806E.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::83) by BN9PR03CA0677.outlook.office365.com
 (2603:10b6:408:10e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 06:19:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0001806E.mail.protection.outlook.com (10.167.245.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 06:19:13 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 01:19:13 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 01:19:11 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Thu, 10 Sep 2026 14:18:55 +0800
Subject: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-add-tda38740-and-tda38725-v3-1-3e87637da3d6@gmail.com>
References: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
In-Reply-To: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789021144; l=3427;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Rd7BMdMZMcvXuRAglajwrbAEQ9+eWt+Tmr52VCUjOek=;
 b=wBxuliKj0qfk6t3HITTMmc4y3MWS7jWiXxIC6KfNtqJt9s5rCbpSzdM+Sfcqv8+l/9LkQhEeY
 mb3MT4IZTYMAIgvDBNtcL/M/Qtt9gy9fpDXeSnSNvCqyYNfaGPtsnQN
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806E:EE_|IA1PR12MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f896e2c-80fa-4d3f-0e33-08df0f036f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|13003099007|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ksXU9lSKz415n1r60LSKIQ2qbF7FaK/xhrCm+86GKqbu96o5OEUb220xYg6CJ99JtFzQ8IQOFPu65FZ7Q3q8ePIuETPIjhDw1NjNuVocUynUSpAI9Dep/kF2i7T1W2b+HaZptlsIiKrzk92B+q39r5x2U9v6xLqTBKqdgJZsYCZcgxYudbz75FXR8qRsaM3hsppBKDOBO/BIljFJh2ysHl11wDTkeRCgY6UQ0lmtmZZgQoa6L4VFqQAALEzNH2iko5AFPdSdAHzhK5iTr4pXmhGlg4/oSMUclity9dvhWGsdybwc/ztUzvv7QDYrwDRVY222lAjYSJk3HA/7rK6lIAjR7sBuyJfneE5uFHGW+ZJ97N+lRpBrvwMsVdEnEgysE8gvhZo5VnDOmapr52ZigHdhGaakKxeGjJNOBa7vu21cd42LrUDW9ODzM9tnpY3adkBW9r7lUGeqkhQ9YJ5sp25Y6cfurDvKsLnH8JFJL7Z/NEGUm9xW6d/+TGDtNvP3818V4iV6cij/+aUlyOVbeVrkm4GM1x5tOGeQ4fdFwGzWFlMHEHvFnM3hdxCFwxnhE1bJH97i9nEbAajDGFDguneYfE3rcsg/7N2draoPBmj9mUqKPNU0aRzCXZkOjpAN1JKUtMj1Y2+HW++rvHOjtQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(13003099007)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mwD2OCqJvRxKxKCc+r5ONj2s422vKp/BccFKcdGpzKRbvpCFHtNR6ACk6YHRgodlVEVHr1eIUezns+hk8uX76nw1E9WxFmXMhbv+iaj3rPP/vv3PkYS2TMtenQnWfWjEunDxy0auPGlfHWD4ANDNW4xeDoIEwSa94p1XKKV1s66Hw0ulSGkiq6mhBLJvEYTTu3wa58U3r1BpyxGcH5hySVpEKTnAyncRA6EPalg8aEkdF38Sxv5izEvAaMmOVhQgtbctWj2zjJzYfhkK2k7ItzSNr8smi/C40WwwmBL91zGd9GdxC7MBgiADkQKy3Gh2B6xvGfhR1gH0I63hK3mURs3M3b6E2JMFkwJlZkKo5htu+H6T5Zhgx4RydTF4VF5drXVuGO1ELi/ydbFYmcYXQ2VNJxo9sVnil7mBpCockAXrnncU1fdGLyBWqUeedj4b
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 06:19:13.9372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f896e2c-80fa-4d3f-0e33-08df0f036f7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001806E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7543

From: Colin Huang <u8813345@gmail.com>

Add devicetree bindings for the Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators with PMBus interface.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
new file mode 100644
index 000000000000..28e6ff9d9d9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
@@ -0,0 +1,87 @@
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
+    oneOf:
+      - const: infineon,tda38740
+      - const: infineon,tda38725
+    description: |
+      The Infineon TDA38740 and TDA38725 share the same PMBus programming
+      model. Use infineon,tda38740 as the preferred compatible string;
+      infineon,tda38725 is kept as a compatibility alias.
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
+    default: 1000000
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

