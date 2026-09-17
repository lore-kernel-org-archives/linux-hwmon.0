Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFB84DA9BE;
	Thu, 17 Sep 2026 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644848; cv=fail; b=D84MofctwcfOSv1y5eibM1O/XJyoxiod5VFrk4lZyNkgsPS7PXbi1nTx/vfhGtv5j2MswEyM58ckDno7umH2cuHO3y9yXzwmBfWRbnNN99ylvWkU0S0vltIhudcktUpySEYepGd5kzvo/DTaA1W6Eyl622eajdFkFZ6+0ZQafgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644848; c=relaxed/simple;
	bh=F06lQM0+A05PDbXETSgghul3irV3xuWxNG03dJmHXbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jRelh8gcN/GWnpi7lGt+z4v2C8r18/Hc1i/VdL+7ak2qxTbt/2OPXQN2AqeUdLWBJMTp63chW6MUJ4+ItDyVTvPDET5DvtIcEQMSTuJDxsdIgxf5tZ1298lSBuU9ktGJQSMII9t1WPB6hnhPmiFwgzmhjRlQLWFvgTzxdh5HwdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t8/s/xYt; arc=fail smtp.client-ip=52.101.56.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t8/s/xYt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kG7mX0Kz4oo4LO3d5HJ7OVt5EmBhO/DpA6w0rEBIWQ5J6ZXuQ9WYIhWlpCFyHaiMXP+RrRd6NKhDfjYSQIyUZx4JUOIumFNpsDnF+3cMgWnXbAGnHq8mHYY3iagmn/8R1nu786YcE5s0hPbDd8Z+cgOVqCoUJK7/4MJSpq+KFWZDNvVTycEf18N7b8EMYBVO60UePbzznHRGO5qvh36kF5V0dqTZwwFB/OrGrSB+Q0yUk/Pk+NvSxik/WNx6nGZMn7cYTBAtb0ynj/oq9ayaRLX+a+npnjrcYOyh04glebJ6hRW7+7sfGWf2WmsXs8NXnSQrkfhlrz4FGhvQN7ewuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1HHsCQJgjZgjU/XVOkQrVU9VRB87xolGHTD+JyTric=;
 b=gYpFtYjj4+U5+9R+T0KbOEA09/kunBl0S4/aF8KTCECD9fF0TvUxvuKWtgm0kroiHo5daZXkLfffERrbrmnq8SP40S59Cez4nKpo+4TIJRi20DFxAOiGK+YHW4FIj88rjc9MThJo3ydLnTNoROZWaOKZgfD7rJ7skHHVe00hn7LFaa6Civ46bborHm4mbh39ATCJkNm1SBz2X7SorPQdgJy7bNDB0LIXzMNoc7Parsa7NbDQk1S8W85Ga2uX9bjcJKReK2Y/Z1YVFEH+M4Bjqa90nd8in6quDb5yKoBs7ioPM/oosLb4HtcpWB9aYnqcd1Gcew0ibsJHRsE1ooIhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1HHsCQJgjZgjU/XVOkQrVU9VRB87xolGHTD+JyTric=;
 b=t8/s/xYtzqLdWoXc/t0xQne3j7ppQYRuN5z8cowhWX83OO8Z8M+R/3ebmhlRduJiAlQ2XG5G8iTojc34tVrlCCNrgFAZZ3LAyym/UqnOy+zwblY3X8RIUz+dzmfvu+eacZysUhWgP894NotAKhhOW9sq1QZTHyJjyPzDMwVNGxo=
Received: from BY3PR03CA0030.namprd03.prod.outlook.com (2603:10b6:a03:39a::35)
 by CH3PR12MB8258.namprd12.prod.outlook.com (2603:10b6:610:128::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 11:33:58 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:39a:cafe::29) by BY3PR03CA0030.outlook.office365.com
 (2603:10b6:a03:39a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 11:33:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 11:33:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 06:33:52 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 06:33:52 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 17 Sep 2026 06:33:50 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Thu, 17 Sep 2026 19:33:39 +0800
Subject: [PATCH v5 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260917-add-tda38740-and-tda38725-v5-1-7fc19668ada4@gmail.com>
References: <20260917-add-tda38740-and-tda38725-v5-0-7fc19668ada4@gmail.com>
In-Reply-To: <20260917-add-tda38740-and-tda38725-v5-0-7fc19668ada4@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>,
	<linux-doc@vger.kernel.org>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789644825; l=2005;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=R1ssmBrpneOOcBVWD/5uiubeCA6eoLBzB89Okx1mSic=;
 b=wiqJC+cqJH5XTrlGh5RSXvYL5pROfuuTYpth1vMhautAm9m/AdUPMTpYKbNxjU7ckSUrQF2lr
 T4zOV2CDmFQAO7dajzl2t486zUBr08Wa7m6D8Qj7otxpoZxCLtTVTx0
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|CH3PR12MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: fefa3543-c79d-411f-522b-08df14af9059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|18002099003|22082099003|13003099007|10067099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	sScGTBqBQ44Io15zRerNLa/yki+UtquZemxzRiAuw83XfSfVxazaBRVadZFGCLHzHLLI6oTEr+PGIyGFokXS06Ilc6RFcS6FGcto21TUKhNTBXSnXaZHvgWynFx8UGLFZi8Xmk7CGCagthghdXfobYgVV8G9CdwObWpkSbzMHDRo8rAw23wppQb6C+PRMVfi+h66/luPi87C3AtCcmUc5GWnn/66ELTh9QU3ujyEQSCJozrdCQX11vFK3RSM+bDRdjhp3eTm6V7dtLK6nYDi65h5l090hcK6tjtPKweenPWcriPkSJAYlMYuEqt3fIibomSMEDTVCpyC8JGz3urIH6+LtkIEZZCBEnaJB9l5EAJyS5zTyzcvHxhEdbl6ILQr5xU+yzStbzHMr4WhVLhpkwuPE8uG//PcSlGpVoijzRMkBE+FU6omtPckHjNsfEbrLpWhR8EPUuJL/JxJz8zwg8RdmZetBOgRjbPe4GQD2Ny23brdLb/8HXtDqltyUxPGwmGGN9w6Atgy40MwtOzXwSyxZEJf8+Zq7klnmhUBssUZRXS/kz3YK6+9x2aiXitqZIGGZqCBDN6Afka52yOrdixvmDLcWnqinLk/zczXGhKtoLO7fr7F3S9UTjPBt4fT4Y3Pe0g8yfhJ5lVxEcxN8Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(18002099003)(22082099003)(13003099007)(10067099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sWwlsvwh+x7dcPyPXoBO4NgWK258wvEjGWR8TzsPUVpBSuaEezmDnvme+X17FKO36XmCyhkRBzJ2wzm601rCti336lt7u3qBPltiF45lzWcEawOrRc8Y/ee5dmmuzHAdsIiRnNeBIicquuTgbbS6/zNGtlssKrVURgI8RI7GTfUeR8miXD38IwuQX6oklx2QPOVbk+vWGAYQlsI4shEzJjC9zXfn6YzSRGJmige034y1LXGmgVKXr9f11xrbF5R07oNxO3Z/hsaA+zFHv3lPia48a9js6P9LvEb4kOUMBh3EpvxLhWZ+Nrz4CU3ojerBLsrQ6m+cFhk+O75q1481lCmRHDKstubGcB3wld9PmM0DvxPbV0cl+72iWIfblPHq6Em4FlutpPkjqeX4oO2uXXbfPk0GUqE9x73QfirABnddTY4HtLmJHE/bNmulxFNv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 11:33:58.2475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fefa3543-c79d-411f-522b-08df14af9059
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8258

From: Colin Huang <u8813345@gmail.com>

Add devicetree bindings for the Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators with PMBus interface.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
new file mode 100644
index 000000000000..6733e44c37f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
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
+      - items:
+          - const: infineon,tda38725
+          - const: infineon,tda38740
+
+  reg:
+    maxItems: 1
+
+  interrupts:
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@40 {
+            compatible = "infineon,tda38725",
+                         "infineon,tda38740";
+            reg = <0x40>;
+
+            interrupt-parent = <&sgpiom0>;
+            interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
+

-- 
2.34.1

