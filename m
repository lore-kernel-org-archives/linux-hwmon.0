Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013038.outbound.protection.outlook.com [40.107.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18D43B3C10;
	Mon, 21 Sep 2026 07:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975010; cv=fail; b=J5tCtJYQsgqY88tEBwnswD7IMl51CUmj9RYkKBMGmILBrx0QJP6njW3azbszwKAEpWvcdFeEtDUqFemB8/QF6AHq6I42l4ykbx+vkdN0xsKCRXFJ4WURS5uC9z8PYR65sBsKcoGbudY1BNYPn9v7MWF/S9vDu8AHtyI9K6TyEFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975010; c=relaxed/simple;
	bh=YuSdR4wIlcGg1GZxu+tFSk8yYZFGnErE1BHwXOZ6gBc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=JrHlzruifv1VpwQM5D4taHmT3WZWtwh8UcIaqJybV/wSakR7ROeIbcShER9aMmpuOf9huebJMgQIa+muwP0D+BF3zl3UO9t/diT2/anmbBMhWz27SNyWNwAglvi//rtTqPjAsv6wNQF/7eijazuGlt/31q/0sBbLTVPLMQ+PN14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com; dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b=ya+MOL4t; arc=fail smtp.client-ip=40.107.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="ya+MOL4t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYTLjsF3WwBRe/TCo6agdYkR5EGiU1Got1kHVF6VgAxPZxouuhOdQkDFQ5agzk4n3j3Ym4gbSORtCwASOQ6NfEhX1dzKerPH3Vx05Vd9qhBp/NfF5KEcMMr0U0MM5VFQ/sV+IAcGrg32cQ7nkagwvFXsRy974Ejwc6i5ElYaZNLWqNEMpB5GfoB0KdVQ7R3vggtgt8XGP6xeJ6dgTqZNVMcH40r6pTp0SYLYj9UHPwnhLNF08/RgrkWMtre3XDITFxVIdvFYTopYqVhswGDmWa3QWsT7hVmas1Zeeh1rEi+0RorXRVZPXISifurpsL9r0xODTBIeoQZ0yJ0+7PqirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pl0HNCUh+l6v/rXn+m8QshZ8hVHGMN91pooRN6c9Xnc=;
 b=WVCjd1mFkYR33j1fFGml8qhraiBn8B6lYFhVUdArLOcWzwdFtFlWcwDgKLNEskpoHgHPEMEXs5EGoErY5ZqDc8H7qGuvY979ryuARwyrA9hhhH4iHjxEUAuKeJZCqwZs6hBRFS0vGq1Ji0E9Lf7Gsv11mHW9VZBWKcx7iKzBG8y1+4sMlT7OqdvPOG/JQsewJudXN4Yr5dd9Yp8uGDRHAsic6HCU5OvRgg8J+Dp8gjhLm8cePbk8wDsD2Sf143q++8fwWxrj+AvkhAyNK12oIm/gbSJ1nsZscWKpFhRVpfLRyDMzF2RwWf6GvV5JXJ855w0H4o/2By82lbeTT7H22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pl0HNCUh+l6v/rXn+m8QshZ8hVHGMN91pooRN6c9Xnc=;
 b=ya+MOL4txou9X151gFD8EmRJTDSQD5l2FZ7xjFpa1vSfPwMSmDw1q6M+bjKkKo1kA/2Om1rPJU7To7etk6/ZeAEZ0W1Kofxz7s6npprbQHsetqB0lg3/3rZOmbatPVc7Nka2xBlhb3JgpllBj5smf8sNoSP121TiffzJyNim6PcU60t8Ni/2vEX5t8WCgaYtChrjzZErYOF81pwaJ2IVFTzkN86UaA2IklrodDI2NKJ39T6xNO/LTTl9QhTNAGdA7mT5S+JJEgSjBYxC2mPhJm2TWzAxeayYy0UWhj02xWqkDRzcFYrZPCtQNuXs3UJ19dkGPRk5iWHWW3TbGk35EA==
Received: from CH2PR18CA0024.namprd18.prod.outlook.com (2603:10b6:610:4f::34)
 by SN7PR12MB6984.namprd12.prod.outlook.com (2603:10b6:806:260::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 07:16:45 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::30) by CH2PR18CA0024.outlook.office365.com
 (2603:10b6:610:4f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 07:16:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 07:16:44 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 02:16:42 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 02:16:42 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 21 Sep 2026 02:16:39 -0500
From: Colin Huang <u8813345@gmail.com>
Subject: [PATCH v3 0/2] Support RAA229639 and RAA229640
Date: Mon, 21 Sep 2026 15:16:34 +0800
Message-ID: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANLZsGoC/33NSw7CIBSF4a0YxmLgYgs4ch/GwS2PlsS2BgzRN
 N27tIlGJx3+Z/CdiSQXg0vktJtIdDmkMA4lxH5HTIdD62iwpQkwqJlmQNFaGhEBdC00xeFbR0a
 NBI8cuPUKSBHu0fnwXPXLtXQX0mOMr/Us82X9uHLTzZwyqrwErkyDqrLntsdwO5ixJ4ub4ddS2
 xYsljCyamrOhf6z5nl+AxDZE70SAQAA
X-Change-ID: 20260902-add-raa229639-and-raa229640-c72fa121df82
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Grant Peltier <grant.peltier.jg@renesas.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789975000; l=1228;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=YuSdR4wIlcGg1GZxu+tFSk8yYZFGnErE1BHwXOZ6gBc=;
 b=tWy8I+Y2ffuZdYp4FNLFxf7zxc0UArQfKrXfbcxcAq7cMg0uj67dxNWovT4XLdje9Lf9LzTRu
 bsXapDz+3HfBxj/Eh1e/j0mwWwaAuFP8AEMLexoJtNAb/FtqWhsw8w0
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|SN7PR12MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffe9ab0-3d66-4ac1-d433-08df17b04aae
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7093399015|61400799027|48200799018|82310400026|35950700016|7416014|376014|10067099003|11063799006|16102099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	njzdauVQJQbnH7eZmRw8y7HBXkNpnHV96LEwyNZPj3RultNYsjhlpEXaZfe4SbkSwNfkTW/PndmO45IwuYEa2h6JPfuOWC2178vooHrdAnscEclsykwvhlOpCIhzX1F/HVKr3/8GKdxyok1A9ORw/d84HZm0xvKUxz6K4n8FAAStDPBbPaZFzTkB26jdpMokPjO3RH++/wr2WHD2hZNjErHcbTWPlBpkyLweNACYX3fOcLjq4gHuxNRimc9y1zXFGBJ9zutSrpLhHL7+faLUoUKZS7wM1k3zODGQL+qgl0KeQatdkoNCLAsQjvCLD7lhOdFlDi9ShLxgFD5Fw4bq8N8PCrePb8o6Jn6zzbSaWKHEA0ASICEARNopU1qLuK/cUUKtLAdZsoNUOrCE/MaonUqN2iDdtQxbFTUL35QFWa8XvsY+3IRWh7EgfsRFVRIoaYbdT0KsZKSLGHz/5n7bhsMaT6Jic2ARZDPqVTLU91Jhw9Y6QvkBHkeFMyP/tVAtul10XZ/sXJla4+TiC1d6rPwrI/G2YTlzSCTrxeuERbZoXnct3GsvMWXiJKmMwK1dHn0HbotXkHR0ardnfxLwg/yHA4LzidMx51jzxMSKQGYSP52Tz7pAu9/QboyGdSJ9fNdxdIO3nAs8Hd19msXOZw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7093399015)(61400799027)(48200799018)(82310400026)(35950700016)(7416014)(376014)(10067099003)(11063799006)(16102099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wcir4qgwHg7QiMO2qZ5oyVyvaDODty/dLtJttCiqcAq+SCw9ISyuholROVROptXcqbLIeMLjn6/ZNfRW80vBpx0QRc/wkUPRXNjRD7fsCBOJnDoCvNz9IOpjPqr07n9JDmAKZy85Ze8Pt5xI8UhEAdE6AwlTF3CLjGn851e9NHYFZe5zRQ6zyi9FeMdry6vOCdSWBbwF7Rt9woLSAZ/UeQc50D2SvravABZNliuzkP1wXtdIT2boymVQfcDe3MvBDCXZ/LAMeZ3BDwwakXN7NgUcK9gl62aL5Z5LuyHOa9sECOGY4SGULtvoNzQFp9CCedXcCadA2xqNVe+6yItaTbBE3RthX7eV4CXYyytYUDXDEQLnLjTYJN9V+jaWrgyqBS/27lnfJd9poD29A1NaISDRSMk92plPijs8rzqqcS3fLi8b4ZX6+FXXE6UgC7Tm
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 07:16:44.3740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffe9ab0-3d66-4ac1-d433-08df17b04aae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6984

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Changes in v3:
- Updated the OF match entries for renesas,raa229639 and renesas,raa229640 to use 
  raa_dmpvr2_2rail_nontc instead of raa_dmpvr2_2rail.
- Compatible with existing 2-rail non-TC controllers and use renesas,raa228244 
  as fallback compatible.
- Link to v2: https://lore.kernel.org/r/20260908-add-raa229639-and-raa229640-v2-0-83c75b61139d@gmail.com

Changes in v2:
- Clarify why fallback compatibles are not added in the DT binding.
- Reword driver commit message to avoid implying DT-level compatibility.
- Link to v1: https://lore.kernel.org/r/20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com

---
Colin Huang (2):
      dt-bindings: hwmon: pmbus: isl68137: Add Renesas RAA229639 and RAA229640
      hwmon: (pmbus/isl68137): Add Renesas RAA229639 and RAA229640

 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2 ++
 drivers/hwmon/pmbus/isl68137.c                                   | 4 ++++
 2 files changed, 6 insertions(+)
---
base-commit: f4c3b88983f342d6614cb11b53a0640ec8bc8fd2
change-id: 20260902-add-raa229639-and-raa229640-c72fa121df82

Best regards,
-- 
Colin Huang <u8813345@gmail.com>

