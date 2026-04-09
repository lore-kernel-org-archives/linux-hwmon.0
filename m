Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011032.outbound.protection.outlook.com [52.101.62.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C654D3BFE3B;
	Thu,  9 Apr 2026 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732429; cv=fail; b=GiUsHUYRyw/XN9+ATaEBAPZo9knoPBRV7p7ziElBs/6msgEqtCiuDn98EDTHZgJq7grAtdQCUy+6Ey0I72eUkD/JpT2PKvPpzZuhzQdoAYP2tyA7kmU23H+HRQhnPto4KYgAqNq+PxEZ1yyq70M3WMjB6r0y/35/EA9RmgUPbwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732429; c=relaxed/simple;
	bh=+sPF6sBQ8obY6R2iaJqnO7b5VgO7cc3d72sjbwImXF0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HWswUHxoNShUC/aIq6C0wUsxGn+QazvU7J1WO0o/2ncBtogM9CpoZaBBLZmLkwhgqw9fH/RcmozKwAWuVlWC1fhU9RvJ1eG0hjnMYnSCy6mWFiTp3nLKpZY9fFxSbnBySl/iwY/TUseb0pE9Alu2/ZFGGSy2SrX4FWJk2+hv4G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KOs3UKDe; arc=fail smtp.client-ip=52.101.62.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KOs3UKDe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWLtC3jcZDpXBeBY14HBnjAl21gFROHrU6GVvG2F1nnYvizTdULMmW4SgVphG/2gW13Ipuqb9CCI7Z3UY6Ek39bBeE9PNHw1Om/jvN3Dz7mwxFGMqo3flcx58DmvO6i1L9jKsfttQjLAdhmppFB57w0OzTZGfi4MHUPDvuJJw/wLFgT0nYdq+SYFNkAoENrDLaNsf7K/ao7eN63RnDXdSb+JMdunaTxAlknxPFNukV+DHpZX62U69Wx+Ut18PS7Wn8qvnfhAJJyi7muUAb9EQGzSthM5gcRtOdyBZ4zaKLTTsJkQZjsP0B8bWSX+rcV+XB+c/O5ptXKMHqJhdW1f/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRXWE1e2pNKSi1+bpBoKApDhc4BFtMSOrU3Aa1J6ytg=;
 b=Qzu4xE74QgKP3jl+jy9N8tcIKmdbfj2CbHRaww3s9RF0RrRS018riHhyoFj+S093KHL8c+KBGUOnNxC/MytfXTgDBp4YhNoNjB961YAkYnHrbzR8DgCwti/uvjUMC7RdmeqF/WCQMGDSTTJl82grR5f/1whF+qVKhX2GxaR5GybTiTRkMNBYKNFKKR9Qg6Y8A4xHEq48p2O2GaJxck1QZHLerIvrYK5rBkATQpbU6ehmbDDkMCQurx2Dj8oTfuJEsIEAemnWEdCfjea4arU9ersuvG1I8LQPFbFCHJoTzEjz6KcjqyHE9g93omBES5OwYSHd3ppJXmSdGfedynrzrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRXWE1e2pNKSi1+bpBoKApDhc4BFtMSOrU3Aa1J6ytg=;
 b=KOs3UKDeq7lb172MUttHKKP6Cm5GgBOcJEBU5HHGTkJ5UD+b4mjp/UV3tAvk+t8bPeQ/boMEBClOPTWfk11SJTeoyMqAZ+iLu1463DSEYu8jy1OYIhu4s7v8wQKntvn1WfAfYLs85YnFoij+OZLayyKAmWeu8kYREYHa6cnbd9vjH+35nlJRdPfwyFuhJzQbjiGU869JC1FMChdt8xpj4erkutYweenplGCnIF5rMN0NMP06mj9H7Ilf3b0Ut3xAzVkSZ3aLeHT5IScSIzu53dliZW5mHV6FPmSih6FzepT/bT98YN9YWCD/t9uI0jf2AZtsCdH7gRNppl77XpdmMg==
Received: from CH5PR05CA0023.namprd05.prod.outlook.com (2603:10b6:610:1f0::25)
 by DSWPR12MB999151.namprd12.prod.outlook.com (2603:10b6:8:36b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 11:00:23 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::67) by CH5PR05CA0023.outlook.office365.com
 (2603:10b6:610:1f0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 11:00:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 11:00:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:00:06 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 04:00:04 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 03:59:59 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 08/13] i3c: dw-i3c-master: Add SETAASA as supported CCC
Date: Thu, 9 Apr 2026 16:27:38 +0530
Message-ID: <20260409105747.48158-9-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260409105747.48158-1-akhilrajeev@nvidia.com>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DSWPR12MB999151:EE_
X-MS-Office365-Filtering-Correlation-Id: 15baec37-9d19-43cd-c12e-08de962732d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oKLxh6zvQDHeqXb5QhSzt8D4qfZLzo7PLWjg6XzXfWJ/w97ZUKDL8W3TkP40FBywXHH73aV3mCqVMikgP4DljZgnZv3izM3i6REF4/+Y5Br15eetu0VSHdf+F+scuPILEpxU+Eu1dll/SMvWTQX8FMuxMLb6mfPM31XQb0NaE6lP3xZx69ALH3y+fJSi/kRvF6WOZD5mPVTEknG43gOaUBxmw/u1DZXdz34d4cUXVaM3zdaiCWoFHMm0G/pUk0RFTxKt15mLHIg7n7o9nQ+DSf2IDlUvxw2wdhkAMl2HKm4oSsQG5X96i4agzYqBggz+Ap0FfNiJHshPkV3WuYUQQEpLPDbkYAibFLxcdGY4fx3bPeA02aBy6AtHEXQqvkAB57V5FQgM6/8M9CjmFfaU8tUS9mrIFH7teUKa+E+iYsPx1e8KV/RNMu6F5irWEGXEhl4ooZfeZ8EFnKtQuGeqNy8Qmvw+MECtPP4MUH38cleKJBGqs43sQpjyv1wR3CBOV2wemZ+rUMcvmlnKWwguQv4JMkNynnXYVgJntIWGqIy2rSnnVN9goaXyplA2lTRoIyaDSKZY3/RqDMid6MUYj5MXbWGAUC/0WZsPzzOaxldcR/yG83df4bMX9eh00j9J59CNv/tc828EQPDC9ci3xpp3yfO3EdkMG87IV5iWGPwkNya56KLnNCOZnhtd0yTmW0SVzVvzmbI4yWAw5G+ws5cy53+SX0WKONNkai+paYGsqLUzwY4VNVsRR1Bl1yS3fi3iXOxoEYlevR84JI9KfbC0uXKT9qBIElVwX34rUe8FRAH2t1iL0HDIsLE8sjDN
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hHFeMEA2SPhALxtSs7b3V/ndq/W/MhR9m7O1KI4N7MLrJujRO2pFe8Zx/syLwz6G4y4CEHrpQLyCAgKXzUOrGRjElDMULeSzGLMgHujyzEBgNo49wr4jyc1pjmxjvItCYekbLmthcDLtpdzyUySVW1e2C9F9WnGQB34wrsqxkrZB2AmbpbGSlkqt/zQPWlIMR/JGxggdSKRygnZClrSCpi1qEKu2n4NInO4dmFsOuVnt2m9QWKXr+br8OZNIxQ/NDkOmssH7NVywrdZg1BVjqbzZD+MrmNukJF0cjdxo1CdDeS+VOXaSNsfRakF/KZ+irUSC6JVBuwz1hP+ib/LwMgckr/JjMbPytYCYo5yf0WbLCOJLjhVzwuLdaEA90roaPiwE/2Tq0uWlhvTx/4mLexsi0BTdaxakWXSnyrTVhkouYryIpIl1s8SVNbtIJlNf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:00:23.2287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15baec37-9d19-43cd-c12e-08de962732d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999151

Add SETAASA and SETHID to the supported list of CCC commands for
DesignWare I3C host controller.

SETAASA is a broadcast command that assigns predefined static
addresses to all I3C devices on the bus. SETHID is to stop HID
bit flipping by the SPD Hub on which the SPD devices are connected.
It is a prerequisite command to be sent before SETAASA as recommended
by JESD300-5 and JESD403 sideband bus specifications.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d6bdb32397fb..05ccdf177b6d 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -308,6 +308,8 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 	case I3C_CCC_GETSTATUS:
 	case I3C_CCC_GETMXDS:
 	case I3C_CCC_GETHDRCAP:
+	case I3C_CCC_SETAASA:
+	case I3C_CCC_VENDOR(0, true): /* SETHID */
 		return true;
 	default:
 		return false;
-- 
2.50.1

