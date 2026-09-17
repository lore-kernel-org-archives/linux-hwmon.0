Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66584DA9A9;
	Thu, 17 Sep 2026 11:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644839; cv=fail; b=lWTK1WGiY8iZ/oeKbqGoKw3djIyL2PsORkXwVe9kXLVqAQ/MpjbK0a5iUP1X0Dl1k49oT0Yk+s+kTZJlLn3TjGQgllSqPdl4PGxNTEjjuQAmcdFyPwNYLrFAFkkVBSWRB57hLzRs/8XWhKQqyrePoN8vhVJEhjy/o9fu7djEQgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644839; c=relaxed/simple;
	bh=oG3MqnMsEa4KyeaeyK6+ndFQOLwehPbfEwzkV2jAZ50=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=NSexa8CyZDUnuSxm1BYS09rFd2NKO8gK0yZ3Cd7k0kVH63JKQCFj2oBRig/acXd6FkPawIX+IZCfsSsN4Ee1Zb1IjVRE5tr6lITEfsBw3/P7A3jtkhx6gRxpDBW24mUxr+DP+6sjC/ht8++crraNDCcelhFdRZaPi7khVHsTBx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IAjwloY5; arc=fail smtp.client-ip=40.107.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IAjwloY5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzolwkEzZcyDFa1YKtv4bvMD1BTDXGtyAFH1FDclw+Grg79ecOWmuTvCcUdCj3f+2qVnyyejplrtPAgO8OrO41Vl+H6EYj1Pml+/UJ5kcslEfcd75IaWkX3dOL1N/Z0FTAP/YZ6Tetl8DXBagxhOxesTjZka8mTVgbyq8s3SycuWT+pB0KoInDRNFsMKTUJ6greSHPWLSVvf6tg2CbjpLSbWc/yh4wpsoZ0tImT0yCK7PKffI9tYW46bIO/NcWPqD71BrIU/iuV8DCmgoaoRMv/y+bp1WEAGjD5wmJVGNw475FtQ9B1QLvPObq3uU3xmja/lNj8961ZDghcyGRecGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l45OccfLtCyOBm9Z3oYxBlDR2alT6z/a/cHXrtjNJL0=;
 b=R4B1spNv3Yffqm0Zg4knib8/IsfxRjg7/gXzxVPktvCVsqvdq/1expOp+3sBBETJjks0IGpG168+zjnyfKN59UhsbNQ0Fe/ZsP8Kz7w2oFrN5DwdXESbCeQW6i1LN2y4Vej5dCCadXRUwaXi3rBLf9oYzETASV/4b8ZOOubCzEASgSJtp7yKwu+4pucecsKF9SMTqTx1eiVWIitpjd1t6esoryfAmD55m8UqgFwq7z2PmqoguIFjN4qvj7dTFyqdzLXgAMcns9CqbYD3m9PPoan2ZJh37PPP4kQtDVkpb/PEoTYOzz9W18DgDbC8YpQl+ScgTSFwcrXpnyZk/q6umg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l45OccfLtCyOBm9Z3oYxBlDR2alT6z/a/cHXrtjNJL0=;
 b=IAjwloY5aAXLStzabbnO7UaV+l0hzEXTsl8S+mky0I1q5tu7d3t5HNLPvKYLmb75yACq9hu1r4t+j4kpx6XiR8tMr+L0wgTMEEI4yJjw9ETTRp8/GnjGOxBs8RI44MorsAnIsOEyULf9OP9j3JWX3PRLOyJ9tSWBwRlfWOlwVEU=
Received: from MW4PR03CA0238.namprd03.prod.outlook.com (2603:10b6:303:b9::33)
 by LV1PR12MB999281.namprd12.prod.outlook.com (2603:10b6:408:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Thu, 17 Sep
 2026 11:33:53 +0000
Received: from BN3PEPF00022BC5.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::87) by MW4PR03CA0238.outlook.office365.com
 (2603:10b6:303:b9::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 11:33:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BC5.mail.protection.outlook.com (10.167.248.217) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 11:33:52 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 06:33:49 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 06:33:49 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 17 Sep 2026 06:33:47 -0500
From: Colin Huang <colin.huang2@amd.com>
Subject: [PATCH v5 0/2] Add driver for Infineon TDA38740/TDA38725
Date: Thu, 17 Sep 2026 19:33:38 +0800
Message-ID: <20260917-add-tda38740-and-tda38725-v5-0-7fc19668ada4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABLQq2oC/43NQQrCMBCF4atI1kYmSZNYV95DXEw6Uw1oK20JS
 undTQWhKIjL/8F8M4qeu8i92K1G0XGKfWybHHa9EtUZmxPLSLmFBu2gBCORSA6EZusLkNi8Q1t
 pdAgBSk+FYpHvbx3X8f6yD8fc59gPbfd4vUpqXt+q/6EmJUGypqCCts4FtT9dMV42VXsVs5r03
 5LOkiKwipxBhC/JLCQFvySTJcNb74zPG7lPqfhbKrJEAdnXGCqGcilN0/QEl/D+zaABAAA=
X-Change-ID: 20260903-add-tda38740-and-tda38725-32bbb097d41e
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>,
	<linux-doc@vger.kernel.org>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789644825; l=2634;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=oG3MqnMsEa4KyeaeyK6+ndFQOLwehPbfEwzkV2jAZ50=;
 b=jWNBtCDl70W8Q4veWrf6kOwKgXAKes4GS/P8PZl0rMGRGwzcN8fzUI3BenNwi67PjkmxkpmXx
 oPQ8hhhFrxBDUD8LqYtgfZV0lcHocBy+Wi3y692M5arZ5aBWjKRYQaj
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC5:EE_|LV1PR12MB999281:EE_
X-MS-Office365-Filtering-Correlation-Id: 59971fc7-cf97-4f65-5118-08df14af8d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|7416014|23010399003|1800799024|10067099003|3023799007|18002099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	TrTbE3milphsqm2wSL2KTceh2ZlCKwMkIS1w4uumX8M6sKLoEZP7eqs75KyQ2fG3bOVLZZSuw0OD2lDWpdxzG/y37uJwDVYJzmsyMY0x7M+b0zRaDncSWOv63wfoj7GvbpEoWKY+LSkwMWw+E03B3vpK5rxDsWzdIV068zpV0fkQtmYiT2j/EVb9IFgYwYRITrelx3mt/S7Tnm8uNcb2pqQGoO+1l2Hjvfd7giaGjlha2d7HcOqS9J4m2rXN82ZQnPC5Zogd+XNNwVR/TEV0Rlr+z6ZuXOlrh8iWVTa7gCd3kuvWPrLLddch1un0kTGs+TP7VxHrjBHrgcTZAqWy4KqEmmHGjuhpvSpEf6xRMMsGplMRLUk2dm9x4qTLN7bSwQl+U9XL951+n31zcQAMMZ3XTxEodLkEeFD0z5qk91cCmSENt653mffVnynse+qwDt1/R3ZvfN6CKzKGqREtthbFQWRj8PGisPdHEfH2N21Cfx2UUiVjtCASKMPr7FpGiYbXbYJoximhuGlYM0y/57UE+MVfOja/7Sa0NrrHO+2TBoFg2OZ0irKUeHnwflOEeZYPLE5EcYXkAiq++6Ei4JfXAc0pFd8PM2jn6tCrRNLU2/rKVqTtG6kO+ZOQTbhTX84ZrV2aRA/CJi529Av+IHQVNZ0vkBLGi3RHh7iXnSVVASkckmD3bYiM4VOdRFB7U9NGPGnc0uBN9a79w9OFXg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(7416014)(23010399003)(1800799024)(10067099003)(3023799007)(18002099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EnQwty2zdP+Kk0pb0lkJc7w+qh02t1VPiStoQ+QaFEur9i7TgjUwtsksMfrqqYWv5TdJATF+0p8ekV32QPFpoDpaaNVtrr5ybXcMEwe76SiYzDOMyIUFc7r+PpDzrghkCdn9dcpUvYTKHWA39YqLXJ5MgMhiz7bGrFcjIGAZ0mVDm0I8TmlFhm/eAiUzq76N0otRTIxUHfjO5niFiO3W8WjAco4wf2e/aDL/cTmmGBoG0uwHsvEiA+bbcGcLjvUsbaT5zA/wHD8Mu/FMr/oD0th5gMD0YC2D7F1P9CZC4SHhze9GkYTGS/nOVtGXoFygszd5FGUySJTiKC9ELu8yFgguDYB0q36sSPqCpMfMVjk8a4wabsa92BnBwEglHoJMp41FenpOFYc+k8yx1QdYHiOn3WGWyACj3oZXrLif4meB9stDBx+7fpYxf/B8cl75
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 11:33:52.9862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59971fc7-cf97-4f65-5118-08df14af8d2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB999281

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Changes in v5:
- Remove blank line in yaml header.
- Add interrupts property in yaml file.
- Uses a fallback compatible: infineon,tda38725 can be listed as a fallback for infineon,tda38740.
- Removed the driver-local identify callback and its duplicate VOUT_MODE check.
  and set format[PSC_VOLTAGE_OUT] = linear in the static driver info.
- Dropped the per-device tda38740_data allocation/copy path, since there is no longer any runtime mutation of driver info.
  Probe now passes the static tda38740_info directly to pmbus_do_probe().
- Link to v4: https://lore.kernel.org/r/20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com

Changes in v4:
- Fix the DT binding so that compatible only enumerates the valid
  hardware variants and does not imply a preferred or fallback
  selection policy.
- Remove the vout-scale-micro property and related code.
- Rename the example node to reflect the regulator function.
- Link to v3: https://lore.kernel.org/r/20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com

Changes in v3:
- Clarify that TDA38725 and TDA38740 share the same PMBus programming
  model, with infineon,tda38740 as the preferred compatible string and
  infineon,tda38725 as a compatibility alias.
- The optional VOUT scaling property with a documented default
  value of 1.0 to support devices that require output-voltage scaling.
- Update the driver to apply the scaling for READ_VOUT.
- Link to v2: https://lore.kernel.org/r/20260907-add-tda38740-and-tda38725-v2-0-1d051d63aa01@gmail.com

Changes in v2:
- Use standard http:// URIs for $id and $schema
- Add maintainers section.
- Use C99 named initializers.
- Link to v1: https://lore.kernel.org/r/20260907-add-tda38740-and-tda38725-v1-0-e2db1b2566b1@gmail.com

---
Colin Huang (2):
      dt-bindings: hwmon: pmbus: Add Infineon tda38740 and tda38725
      hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725

 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 55 ++++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 Documentation/hwmon/tda38740.rst                   | 65 ++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig                        |  9 +++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/tda38740.c                     | 64 +++++++++++++++++++++
 6 files changed, 195 insertions(+)
---
base-commit: ba08432bda66a7889d8f3d1581dabf10f59b25eb
change-id: 20260903-add-tda38740-and-tda38725-32bbb097d41e

Best regards,
-- 
Colin Huang <u8813345@gmail.com>

