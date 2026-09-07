Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011046.outbound.protection.outlook.com [52.101.52.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EA0411F8D;
	Mon,  7 Sep 2026 07:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764652; cv=fail; b=E2tw8JBdSGU2dUiLfu9cZzcSbkWtR/TpUkZPPYzAxQVXhh6YfW7nb58jVhtR2oEEORQsCvCyGfb5aWAHGmHDBj/k0yBp8llffy1SUm91JImJlasWcQMnGo7N3/H06Js7AJlDmoV7nbRzIm4c8GggCUlLsaJbqeeWLGu8o2HJCFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764652; c=relaxed/simple;
	bh=U0MndHQQObPsG6j2TLvkrH3ZubnMyjXYPmkTXu/eebA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DFU2WeoeVTMilX17hd/UVtD9sBmZsuRahIAH2AOvalSlOLaRKAGqx91WbStTEEMeRoU+KgtLFjq2cSshnT9uvaMPesb7z0GGUuApF/2pykolbevPyiAHV4+lcOSMkc6+ubBC8oaCX7CxHJ95mOSgSxuPwHqcsc2ZbfOnuu5fbc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3PV/Ryqu; arc=fail smtp.client-ip=52.101.52.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3PV/Ryqu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIC15swrjQkdeYuWWiqNLCCd7uif+5QPWomPv7vskqsCCrlj2TEEqqL3MDqOm/ZD1WWJOf5p+cJL7NWCJmSKSKzdWnvOWigI1hODwtzRuF4F8ZNAupvmkeDIPuM4vHJHHOVjDiscboOTH8uPoLnuapBcVi/5KDeJ/cgxEnVhhaPZi/P9/TFtdSRbxjGcobilU/dABwnG2IL8cTY5eGLNYxNIqJL3aM14PEY67NX7Om0+pIymDOZYbGSPByaN10SMXEh9wawSiYzphWQ+IM/pMR13sQxxzGQT4KeQzUzjPvOZSeIA3bZAE14gkmDO6KNanO2p8IOv7IJ9BlSK3qLjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIuszyuK0LJkWULGLZGrcf+ZaXwP6KGyCNgZSQUHhX0=;
 b=gyMcjHZEjAnRaVGU35TLrkm/TEB7RbakpljExypTV9svJOH8HzoqnEqrMaW+Tb/OdtjnNna7FwTUO/Jk4RYOABudCnzlqrYk+L4fHLH7JgGltgUNrm9wSjRN6G+0I2oiZUYAgAfrcsReR39Z5NoNuBWx/aR7UCoAupBgnrzTp6+HnfxzdNHTI2LoH0ql0SbB/1X7/GLFpQfQUR1QeSqXbR1N0/HHYgsthbSfrBTFqVZ3AGYA4cXio3zxZEePQ1ko0s/sFtgNBI4VNFfCRswrEK1jNFVR3FD2UAxc27UytrMPDLnaXYE8/A4dgPEMdEdHjWwmoNkqmco4QSSMRk5Keg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=glider.be smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIuszyuK0LJkWULGLZGrcf+ZaXwP6KGyCNgZSQUHhX0=;
 b=3PV/RyquB1dJG7zCpSPqgIjDIbLJj+BQUNjPfmD2TZp950Y/OaRVzZ6pjoDv5pVZ0VN4z1phkA+INibttCrwm/GmmRPMuNjTq0pW1jhfe6ZBdBC3LbV6GF5XX3D2a4QVYEqMby3ToI6cHWwcsNMTxTh/HYDlf+TLC4q5d3dS4Dk=
Received: from DS7PR05CA0003.namprd05.prod.outlook.com (2603:10b6:5:3b9::8) by
 PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 07:04:04 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::4a) by DS7PR05CA0003.outlook.office365.com
 (2603:10b6:5:3b9::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Mon, 7
 Sep 2026 07:04:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 07:04:03 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 02:04:01 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 7 Sep 2026 02:03:58 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Mon, 7 Sep 2026 15:03:29 +0800
Subject: [PATCH 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
In-Reply-To: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Grant Peltier <grant.peltier.jg@renesas.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788764629; l=831;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=i6vTahxCdM6uD5Wu/bFFFPP4p9o2grtttbn5WXmfAKU=;
 b=d/co5Q0MiKL57wZzYLm2r3F1snad4b0skjZvBKZIpzK+/PHy3SKoOwOUm5iO+f3TYbx3caPSP
 GKE1TOjFXHJAqM1GaB/PqSoYaY6sDBjTOPoPNDYdcxQy2h1uM39fprr
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e930cd-c01a-480e-bcd1-08df0cae33a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aptzZmez2flZegdkoYlmDA5ZYRR20KsGrjadoIx3PtnSP6VRizI+SZrLFxuYmGhxzBN/87pyWokhrrRSy9uXxU67o5MIf9yg9aKAvKQKTs2UmxOItZVzEcgjyuRDfEhaaaj3LkbHxRxL6gmR8330z40wmu0Q2fCfEX1kzWPgBbAj+CiBGVjnSGXg3Ic5hUD2GrJbOU1m4WEyOoJQnaZc47MWHtGuCN/BOZaDC2ShIdYSlAxUnZElvCRMcyHQ4ivMcNKZj3nHU5mgtMA6JjbdZ2q+ebQxtR3Lcu66n+IAvYda+5XstJRULAh9Nk4KNVb1q/B+IDu1reH/G1hLWjnZTy8fETktyc/PVt5qnjxsAFkClJrTOUZ7wVpTtwN2lPHr0mS1s5Eb2lrYQTCfIjXs5pG2OT7l26pofhYgdCiBL1ucJrUpb+Bgy6hxvT2A42jiMu5VQc19zQeVzQo5HzOb8k62ZLcoS/SQyuMutjCu68+gLQnnwUn58tX7n4gALXPoLA+xbYZKIzmGWEtpHRF7OgTFgRwgoz8glj9lxROUqN6mFU/SnB88BDGcKbMaOPwC8JUClFyrfJDeASh8BJCpjyhmLrDorETESbfa6zwEbj41DxLNRXFHn5DR6X1CMtNOICQl/F3AIcyqU3VCJz9EIhFkg/nB7eUMRYuems466BDZAowVGBaH93RLNhSUZNJhJiUGtrJLTKSeFLqJ8Lksww==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WWukcKQG1A4UQVdzfFg1e4EvZzJLYcZVdDTk+TyEe+UE4sEls20C6ADtYhvpkG5mrQfdjRvqCF5j00S8gPt5h9bYGaldorxbQsBw9fbXIVldCntLN8KqJGr2JuMS6nEBwlcgFWpYiaZhX9a1IkZ/dMKW/oNS34TUAM7cztUuHJTPWyXY2pkN9WOFlYsfsxbY6E5Ai31V5LOyK/pNYun1r2+hdJbBOaaB6CB4N67O93Yi3xelAKUSYF/oMRyxHMUP60vZIBJYi/4MhQ0MjRkyCzVkdsfJ2iAW9zPmteqFpifw5iYNf+/OH52i6slahQmw2lm3dpTweYFnlkSgAVo2bZtp2mUjCCBrBC4RQdMKdOOvZ5AxHKkd/psvSOhfcPtAdcIaSCPFyPU6weeJ6FWcE6feznaIQyJQ8OXpQYg28HaPSnXl22N6Pe8NAR3+N0is
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 07:04:03.9891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e930cd-c01a-480e-bcd1-08df0cae33a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373

From: Colin Huang <u8813345@gmail.com>

Add Device Tree compatible strings for Renesas RAA229639 and
RAA229640 PMBus devices.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index 8216cdf758d8..3537c7ddfb09 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -60,6 +60,8 @@ properties:
           - renesas,raa229001
           - renesas,raa229004
           - renesas,raa229621
+          - renesas,raa229639
+          - renesas,raa229640
 
       - items:
           - enum:

-- 
2.34.1

