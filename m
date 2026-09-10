Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD56486659;
	Thu, 10 Sep 2026 12:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043776; cv=fail; b=sJJF5tToxvEhPf9y1t4WIWPPR9vFRlxinZlena0PMnLpCNdm1QIte8SH+E7gz4yubXeupC8lO7xsPHDumMWZ6Ky16yeriOK7qiWgiBfVVc92cKId+oD66d7t92v8+eWwJ7jBptDYs7aKnuqbwAqoWgWLrF9GsZiRj+I/S6eIkj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043776; c=relaxed/simple;
	bh=nxLi5DEPbbqL/AXpdJ43dRWq0aEYNtF15eH+vhzY2eI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Fj+mfj/8S6+nL+zLvgmURyBr71Q4k/tdl8FfAocBw+EZ6pMOx0zV6rBrPm7DPYpdTDr6T4jdYRcBV7regooQVckC1kyOvT2o7URTZTjrinx2cwTYFclGf9TY4+TuoXcwutMRPVvcjd12AUmJdbYIvn3IlHiaJ4zNMxrhgdcoIzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XnExInAZ; arc=fail smtp.client-ip=52.101.56.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XnExInAZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoV7eYeQAzU5DUDP74CcDsl1zNd7mwTGfAPbElWATLxMu9jtZoc6Yms+XdzuUGJgOf1cx/9oUwMPo4a8t67ax67HCBnNho0THXX4AXNu7+QwhPD12DzVS4aNHeKMjylu7nyjDqeDkgMDfri4hO3XfOE/x8nQBe8nB9iM7Nu3hFb8+qxt1aYHR5du95XsPtxD05WRwPk1q398UJZ8qnQKv3WQ2sZT/LI98hbly/7OJSI33NEyXxevjFg1i9SPbFm9RVFgXJNDg7oHhfY576DEQZQzPWb3JyVRSBhXjlRxfRJygjZpx1In/ZUxR4gEk5n4HM9nuu1qRT02WpZuGd3pAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdgQLX/Ut8iL9rZFBFGcwiuInX2gvAyR36Vqpz6K6CY=;
 b=lI1N6pV/kpyHjbJRSsS/1n1NEv5Bv8DMY45lUxhRAZpwX3SfH2knNalqUCSMt2248J88Fcs5A+e8ykq77abSXg6y/oY3ZNZQav9mFm4e/q/GiB5zVJ66YwmlJZ9S7nEetbJeVSl7SiCoBsjObs72yhm4spyb+DCPzF4EYUpVwieL90E85g+yRIUDV8/RPDbIL2x4tEWI4cBpYB5ypXxcvwS1kjVyLrczDOKL/xaX4ENED7VjcJBchj4L6vmpyUu2IM6rLo5Z5kRZ4+xOqOIlF2aXrizMdEfjswgVLirWWUEnFQI3zl7lHtuwY70x5Dz/neDGgJJF4Dmf/ItlD29BZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdgQLX/Ut8iL9rZFBFGcwiuInX2gvAyR36Vqpz6K6CY=;
 b=XnExInAZd2vAP/qkCAxsovt/v6UBU67q8H6wNw+XMskI+Par8/3ElZA4sCNVV4IH+aYRA4Mb4iy/RVyDoxhe6z/3fY4zvkFtAZ98QsEJ/no7u/74NstiIzugMKav6YfUwkyriSIrjpWeZ8gXIoOMY/kLnMreZJ5IiSuMMvS/p18=
Received: from BN9PR03CA0456.namprd03.prod.outlook.com (2603:10b6:408:139::11)
 by SA3PR12MB603307.namprd12.prod.outlook.com (2603:10b6:806:58b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 12:36:07 +0000
Received: from BN6PEPF00000075.namprd03.prod.outlook.com
 (2603:10b6:408:139:cafe::20) by BN9PR03CA0456.outlook.office365.com
 (2603:10b6:408:139::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Thu, 10
 Sep 2026 12:36:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000075.mail.protection.outlook.com (10.167.248.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 12:36:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 07:36:05 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 07:36:05 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 07:36:02 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Thu, 10 Sep 2026 20:35:50 +0800
Subject: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-add-tda38740-and-tda38725-v4-1-dbae7fabce09@gmail.com>
References: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
In-Reply-To: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>,
	<linux-doc@vger.kernel.org>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789043754; l=1692;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=xEyT8u+t/Vuu3DoKemRoVqDVAdS0jfmez/RyWd8Amfs=;
 b=AL5F1/ilTngwIzFFkhxlqaFe/1/Xn6PSO2rGuAxDcq3XdKn6lmiZ2quW4VLYBYve6XVs67vNA
 y7Qq127quB7D1iHCc3Lp4uNP/1HKb/43FwubEZ59Tfw41zqIogY8PAB
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000075:EE_|SA3PR12MB603307:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d4720a-3430-4178-5ff2-08df0f38152b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|23010399003|82310400026|3023799007|10067099003|11063799006|56012099006|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YbDJBfYU0uDBvCs64peLxe2oCPy3EHjzfr2IKh1AsIRIQiiE4RR/AV/LvfUSDBgSa17VkAi7kDxwDvi3IxECFyi1xQgMdHO7K4y2Y2l/gPAMWkldB/ChZ0D0EBgfvWlliR+OaKu1X4l8ZpURIXLTeIzQmUuXqapCxmEEgH/umklje+jZFup2aYwH2H/mKSykAj7PPWKfsNqNknOL024dwcs1AIBcfTjiYrs+Uexy6OCTw5GYMIj77hX1zf938MU7z51YXRJndNsLheUsLFjDq/nR55V6e+/EqxEPQpF3KEIt54IE0PWYCx6Y9gNeaK0CecqO8SKrPJ88o1HeF5rO3EikpRO6FqZcsffMqZRdAi/uL4Cbi9vjlEp3uZgf+YMgEP+iSAcF9nWYrslUNMbQ0Qs6GZ0nu17cSvd7hbPBtL5fgPbkG7XKJa/9TgV65/r2B0yANFBJAPSjx9SutC/5/9pgm8bOiKMmFzruF++00R0XYI3j083cs8fpHk7AYsqY1aG+uqZPAH4l20HePMF0NtDRABge9epkENURc+NGVdrhRVY0S9ylKkw3nKmLgdrsd5j0o7SO/aQ0OX0ndOgHVJbT1PK1po2zLixI2xjwLFQHGyL/Yk5n8NEamWiCrSfSh8Qnw9J+1nzLAOMzDq/2mw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(23010399003)(82310400026)(3023799007)(10067099003)(11063799006)(56012099006)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ysbxh6T2jE7enH8GtJQY4kDWu4qyt19+NFVlQdoMgMxNIziQwqIniieEcfnt/Aw9h3+8o8ALZV7cUjbwQUkJyZhP4AsT7hntf3zcjbm0czFUkG+k6Q9FMoSucpb27mNAEolcVKYvxFWsTHS+7ayBlkI8QsrEXOHbTTtz2R4Klym16ciwdnMpugTMukYTXnUfd/OrVdqpWRqso3wwnmVS0P23SFOyh4ZwWa6VyxMdr8nIUPS4i2oTc9fX8zJ3qQnwFt0EiUC8+uyQ6wnDWkViSplkp0o07vXztuNR8merhT1rfPDCVaQJ+RcqnTxDiuBZ2YSHA/T2uNdxhyHWuMLGXorn6MaaVxhTwW9eKDd/EUazUZ0UHhecj5oonHbTNodvW8HCdjBAmtfivbx390cmgp/ht9JSD1vzIbmBFx23JCQoq+gwnp/5g7r51GkWPeYE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 12:36:05.7220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d4720a-3430-4178-5ff2-08df0f38152b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000075.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB603307

From: Colin Huang <u8813345@gmail.com>

Add devicetree bindings for the Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators with PMBus interface.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
new file mode 100644
index 000000000000..28eeb85f13df
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
@@ -0,0 +1,46 @@
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
+        regulator@40 {
+            compatible = "infineon,tda38740";
+            reg = <0x40>;
+        };
+    };
+

-- 
2.34.1

