Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE573C1F5B;
	Thu, 10 Sep 2026 06:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021173; cv=fail; b=WMBHMFLkw06/8A8v8FIX3O/nUH3o9xnStwUAbLgVY3khBfBk2Av96cba7PELn4XZ128RBp9rvqjFIkXe0UvTRNlxPS+soHSemKE/O+FaX8gPnZMuaWfIFdjNb/zrDPgEaDYhGWg0/SAWyKUf7gLR2bSGv7+DIa/dSiuGOiGNuRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021173; c=relaxed/simple;
	bh=27dYCZwnAvQ5huVJMi9KjQO0xrYQppj620GuBsfpATw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=C3vt1WclWWCN7YZ7brXxFvlsZk22cH5N5VJ9Lvwybc+S+5MfCFPiCpTdR9mPInz3dPQOno1j9vK87cTQ8XNwLYzt/7UbghySQt8fVcFtSCS4brd0NATrH6U8K0pkb06Bv2WD7rQHYSo7jX1G6uyWoNUEhNYHTHLglS2NIJHdrLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JjsRwVkh; arc=fail smtp.client-ip=52.101.48.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JjsRwVkh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXlHFuE3lUn4Uw3EDmudZQSpns64rzAU21pgw5abXmBRFuB3BKd2gsb4lmqkKb3k+uPqAROp0qwibYU+WwX9sdRgFB5r5YvCJvOHW0OVo10Avvt4UfyA2VCVcORTCoBOrWv59EXbXH5HJVrce4+aWetH+5bIo9nWn46mBFLAmdoy/QWMJ4pZRnLCHxGZZ8vIfmhmF/fa/HGxvyeZ9PC3qfAQeOAgms5+o9s+13M9D6yqUWQ4g9Wia16oQA5s8Zo4f45Ppe4vHIID1hAolfOD6U2qPeH4GRdyOksZT9hXnNKofIvte4rN0XvIppNnmDIX74S6HKOl0XjnkPUnaQ35xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWajy3WPo/0cg2I8SomyxSJX7MydCtTnHQVKZGOyTA8=;
 b=fC2RponLNnB4ciHGlFZDXyw0zJeBAy6cXEMW7ylkdtRoruF7XpxGJ7B8PmByjh1YdaU0WW4SOpQK2GT2/Nfyc1vYWqjdRTmvdGhvaxtJqA8qFfkhsDvm3Qi2tRFwOkiF1XVwX5H1QIc3HUVfHD2tIIJkSQL57OJtssc5GO4xkZG8+ZMOIeeKxfKrzqrENxIjlOWyIZTLQn1aICWDt3ATrwWlsDaZIVeAMoFHwhjMv9e54qsLofwD2NJbfV1n2XAKJ82kPNbhjJssMt/otRyFRu9lFCJdA6ZACLmuqFR8aeF9CurnvQq3FG0CSb1sFkb6xOj9olIV5WeEGkkdCP7HZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWajy3WPo/0cg2I8SomyxSJX7MydCtTnHQVKZGOyTA8=;
 b=JjsRwVkht33EyB1364nJRAyDjCdA3kGLEiskHHnsi8J5GkogsqznZ7+yQ3C1T9PjBdRk9mZrCnqYEajfAFXREYgM57OywY9o6aK8njyVH6eiuw3Y3eq73/m5z0OewyWyiFlmNlMWrTNyaeP1ap1ph6FOs3MT7hFmcUZEoYx1lFs=
Received: from BN9PR03CA0077.namprd03.prod.outlook.com (2603:10b6:408:fc::22)
 by SN7PR12MB6742.namprd12.prod.outlook.com (2603:10b6:806:26e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 06:19:12 +0000
Received: from BN2PEPF0000A88E.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::c) by BN9PR03CA0077.outlook.office365.com
 (2603:10b6:408:fc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Thu,
 10 Sep 2026 06:19:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A88E.mail.protection.outlook.com (10.167.248.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 06:19:11 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 01:19:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 01:19:11 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 01:19:09 -0500
From: Colin Huang <colin.huang2@amd.com>
Subject: [PATCH v3 0/2] Add driver for Infineon TDA38740/TDA38725
Date: Thu, 10 Sep 2026 14:18:54 +0800
Message-ID: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM9LomoC/43NQQ6CMBCF4auQrq2ZTqGIK+9hXLRMhSZCTUsaD
 eHuFhIWbozL/yXzzcyiDc5Gdi5mFmxy0fkxhzwUrO312FnuKDdDQAUNSK6J+ERanuoSuB73wIp
 LNMZAU1MpLMv3z2Dv7rXZ11vu3sXJh/f2Kol13dX6h5oEB26RjDBYKWXEpRu0exxbP7BVTfi3h
 FkSBJUgJbWGL2lZlg+Qf36YDAEAAA==
X-Change-ID: 20260903-add-tda38740-and-tda38725-32bbb097d41e
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789021144; l=1445;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=27dYCZwnAvQ5huVJMi9KjQO0xrYQppj620GuBsfpATw=;
 b=H7lHJf74doh4+VuTSVoYdTHt8y7tY0Cf+VaToD+WE8JYxytKuhIEw8NB3PAugsgsKEv3SFmfb
 zFuhkyQA2/WAKBjGrERsVgNljlsDANMhTDtsp0maZ/ICrq2CDpXCx8w
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A88E:EE_|SN7PR12MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 04f0678d-fbdd-4c6d-db81-08df0f036e4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|56012099006|11063799006|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	g/Tv6cHivB7I95rF+KqMTsjb64kGOXcr4sNIRvD+YVKofz32Ni2NazLNu+wN/l8EBwr/MAL0izdyJlqCMGSG5dyrXIiKN5zTndv5S519jBEjDHQGl8TQUoFKf3I4ZZIOw4SXAdlrgGHkLQ1IMTlSeeuanVPs8qNscs3YDu+fv+SQME5jQtwmqxLiapcWu6/H7mh5KPdEgMm41HKmwOAgv6QywXqYb6+rkzkCwG7Fsekbjbn7BgngGS39m2+wD0WYGia3VE7RnSjBwAe+TVH0tx1mwrRD5H3xsz3U8STCKPK4uI9Ai65SkCz5EhPpTptYypgXo+WGf+1nRB4oHYLdW/n0avC+rGOjcBlGccQTR01xdh0aLEvhtKcMxO3jQ3lMaREc0vIC6uVUvzNxNycQAFDhkS/mQCq8SW9ATEGPM4qL46AqK2PI+f+mfXMQ4l3Ksez/DkOQUGTHyVxtdnyVkxXuM2Mog+xFvPv6FF3d9mPwx8+gyu7sgc1Hgu6UXfrrOrAo66PvP+Nm6baGeHo2c4jcxBUivKQmOAU0gF6OsT6SRe3TX5MJk1qy09x2Qs5S2bZRbPPpnFGP8H20+cjAYH8vtPr9UKHaTwH2uz+Cy5FHhD/medzOvrHlsL16p3R59G5XRsGtiNRYScmOnOfqJAFiZwTCXDj30b/HfkxJ58vuEnkAoAtuk2vOkcjACi1VtpnQ1Xeo7a69RnVlF/goew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Mf9vS5Au8nqgyBtS50o8lKGmvFcOInMTO6la3bLMu8+KCDR6qBQGX7xgXtzCFNAr9lmXOodjnU83Gt3RKbfCHicpAC7Mt1iWXng8DOMBZ2owaqMq7KLEIXf3DqW+GVUtodTH1lE9x7/ds4JdbuDpkYpXTiB42+ActTcLN54xl1WrjQKZOhebo4U7L1GV8F9w98XW8mAsEVWGBLiG1nbkpK1OkD9eIhQYUaM+vjWqmNV51pQS/AtaqTxOo3PtyO+TtqThg7RlJNK+dQTwFE030DgFupuW/p1bOtqWs8y+z6sYmffRCYw4rNjJSY7ijKcvyPdGI1SqAvdHBfZZE2TowOhK5eAMFvqcwFjkihNAJX5/oxTf4D073j9oQ8MI6aGSdmzE/7kxox4dTTynXcZ6kNnM1WF9GAW0VBP1KYDp4f10xo44Tv/XkY8cF/UW7OgA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 06:19:11.9182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f0678d-fbdd-4c6d-db81-08df0f036e4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A88E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6742

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
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

 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    |  87 ++++++++++++
 drivers/hwmon/pmbus/Kconfig                        |   9 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/tda38740.c                     | 150 +++++++++++++++++++++
 4 files changed, 247 insertions(+)
---
base-commit: ba08432bda66a7889d8f3d1581dabf10f59b25eb
change-id: 20260903-add-tda38740-and-tda38725-32bbb097d41e

Best regards,
-- 
Colin Huang <u8813345@gmail.com>

