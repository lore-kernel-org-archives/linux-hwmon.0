Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013028.outbound.protection.outlook.com [40.93.196.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A235C4EB85F;
	Fri, 18 Sep 2026 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727063; cv=fail; b=t3aid3yNSRdQrcaJK6x2nRogJkRkzWJIA/yvX8qrZo4kWyZl79JJVKd4vlYCcOvC+Tg31M+BVcaybLYz1MSwGJc4WDWHL233HrBUIzdq7QV8XXPNzlL2P42EyyK5E6gsrqHaa0I0carrm7lNL6o9AoLaC231IGOukfBLrH0q81w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727063; c=relaxed/simple;
	bh=R1ssmBrpneOOcBVWD/5uiubeCA6eoLBzB89Okx1mSic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AzymasUZ5FE5jiYj6ai8pGJ2BO+FUs36RDrg+Hj9Vu8vfd2AN0E4shHIsBBNOym/RVoo/qc4hSiv0V7+dFpMnH9veTPTWj/B7xRjLuU5nI+GrEOIhbgoLU20q3xDy/YNb4JPAGAkn4T3h8RIN4NzT6U0M4viHTGV51737/9y2C0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com; dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b=wps/h390; arc=fail smtp.client-ip=40.93.196.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="wps/h390"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTIx0vJZMb9N2USpqoQsgJT2Ww/i20nlBO1TzKV9GSjrO2aSW0dZukhKRHJvuS54GF3QdnfTszFhotqPUYpbF71o+kGUhcE48JIYxF7m+9Mmw+DXoAlRnlIq3qYYOZEI5YEOtYbPc55vtZe/TS7/+QU1PAF8bo5rabRez268IToUhqFgwnPIipv739UKjav/nfRNtvIb182XoupyR18sLXqDVBVYr4VH8Ca4nfH4Ii08U6CU4X6bVHqiYnXd5zn5sdJt3sLC0Z08m6h4iWT4kwad6le8pABilEviPjOWR/gOksc76vHijFcveLo2NsjO8m/szShReW8NabY+2lLPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWfZUXPpUo/gj1XD/WtDLHzwvoQAdxPeHbukxIwahEE=;
 b=NmWI3P0vszA/S3QTLDlJzANqKirn0rprl6fg00KsuH/0yEEqC08nAmZRx2HdrhKUXU+4YWYp//BiZy0Z0WLxl7y8QeET1x/3OyD36+bjjolPHjGM+ox6kYebMH3pFBA3HkNfiKIfSD7jN+GMQ+UafO+LpD0911fajqYMKkLesDMTt+bELmv6ThFgw4QDGG0dtwaUxXfeWTyWAsVEfL/Hk8Fs8uMEVaFtkzXjyj3FoWZBBvgwrMD0A11I+uhgs07IWSUBnwvWlT0NugUa4ykebiqY+TiMzu2TlavZ1Q+40l1z3p9cWHWu4QfHoxLFUrYuJTlnmNUvj3DDQtTZ+RWq+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWfZUXPpUo/gj1XD/WtDLHzwvoQAdxPeHbukxIwahEE=;
 b=wps/h390BE5RkDK/o1K1JW21HRTmvs/4ohhfakv1+TOu1e75iLaBeXrPDxD5CZ8s3/vA39tKPxqolX2HOD4lm82KEWCLEsDGJLXNQ6niCtFIcXW9YGJahUIYqmqdaYIr4hJBRmrqk5OXNOW6w4D/xS9wFxQUfQdgp2g4nzqUzl6XIzbGWAzLGD/FUb7xhhWSqX/bbd1DQ+lsSOsXS5lbnaODoo7ZkLsjJmaCA6cmq5xVwyW64bOs+A/0NwDVQdOugWc561GZWx33ROVnhqQMH/gd1WAAp1XQ4N2oBRdZnqEVqIzH0a/jF7ivlEPy6bTy2H0pU0qkM84f0xXN/5YHBA==
Received: from BY3PR05CA0016.namprd05.prod.outlook.com (2603:10b6:a03:254::21)
 by LV2PR12MB999098.namprd12.prod.outlook.com (2603:10b6:408:353::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 10:24:18 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:a03:254:cafe::5c) by BY3PR05CA0016.outlook.office365.com
 (2603:10b6:a03:254::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Fri, 18
 Sep 2026 10:24:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Fri, 18 Sep 2026 10:24:18 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 05:24:17 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 18 Sep 2026 05:24:15 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Fri, 18 Sep 2026 18:23:54 +0800
Subject: [PATCH v6 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260918-add-tda38740-and-tda38725-v6-1-a8b11018d850@gmail.com>
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
In-Reply-To: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>,
	<linux-doc@vger.kernel.org>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789727051; l=2005;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=R1ssmBrpneOOcBVWD/5uiubeCA6eoLBzB89Okx1mSic=;
 b=c2tSHniHKpYvhMtVERYKcD+8z6joiK3JlXgi05mLEXQvD9mI8IP9I/EfW0pHf+37hX6ttGugd
 6g5n3StxG/8AF9Z+20NWjJ14MlBBlEhEzgl7BM22RXEbsvp5+G840BT
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|LV2PR12MB999098:EE_
X-MS-Office365-Filtering-Correlation-Id: 966b198f-0e1b-40b6-fef4-08df156eff23
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|48200799018|7093399015|82310400026|61400799027|35950700016|7416014|56012099006|18002099003|16102099003|22082099003|3023799007|13003099007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	j7sxfCEFkcL3aF7JP3ACofYNFdB9OZtaWyuh6G1WCF4TbzvmX7UqFcgwNCxVo9vT79TfmMsXmYWEYtbAXA/TWR6Z04yc9R0wWWsf7y/PVJchJnmt5JfFX+mNOu+/nk9qYblOTAq4JRnFQZCaCjrvgtw0v7eXJzYrBaAKUQjeAn+w3Zph3CJCIxdY1E07qFxhYK7tYc3cvdxggo+vqU47e9bGBIfJsBVEBGckRA1VpUkEHox8mG7B8oaPBMP0q/ho6KcGl3Zn2SiTTNxz3IjV9QDexQ9/bOlTJfsM/opMaopQxGCiKBCB11kBmuPAUtUIVh0QuNqpQV2Ii+/l2wRTkdBVOQO3pV3SFH8hQrU7gn6MdbGK1k/82TzBBQi0SUlg4JRSEqjoqXoVzTaNJlepmOP471F8lA4XpoQLPViUfc7SXBZh2miDmoW64/KMRHHLhk12mMR9Dt/kic+tkKI1WS5CG9eZeZf9eFNX7TAutOn+8Sxdj40YgIqkzfbaunXd0cLJk7Q0LjU7q7itX8meab0OKoXmbK87DAQPqEIWZlnm2SpGkCGyCfjJBm5tNNlIMeTLRKQmTmHIImj2MlnZ4Vn4sfHubsq+08M7+NlI5x5R+Xh10n3mR/qwjh1MllpB82PtP4EtWwGKsaw4UbBURg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(48200799018)(7093399015)(82310400026)(61400799027)(35950700016)(7416014)(56012099006)(18002099003)(16102099003)(22082099003)(3023799007)(13003099007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XQCA87omm/fxj5SKIpQDBlC+fLGalhNFibs5RzTveQSKUQMDCmm7CVRTQfcB8A+bk8vWNpM85IUZMtd2xNHGxihGrfbvyrNUhLJRgZzZDLcE19tlWX4NDTQmBXxkhkkSJALiFLLy2KKoJ85m3Iy83IFl0Zrf6U1Y1cpB8y8D0jlgAZCMEVxpI7V70DGLqCFbz8zh5824z61uT9MB51wCcIlrgYVdGVFas0o05cuIpq/AY10X3UOB/qR0iCjs02wBm3on9GLC+DDVTA8k37kPDDfF5yOoDpECMt3ZDsYEHBqWw1TpHZ2h1XXBagXUVAXte8yN1W3WtLYyKHuLQXrZigxtxhM4NlPYHvYH8rryaTleACUPiPeRQreJckN3ZCB0Zd2hvEDHjgL+mu3SpHOvlX2G6InyVQ1lsFwlpmNuSrA4Va4TRUKZVI/UBRuR6hFo
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 10:24:18.0206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 966b198f-0e1b-40b6-fef4-08df156eff23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999098

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

