Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60019488218;
	Thu, 10 Sep 2026 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043772; cv=fail; b=M7A26hRBnrz0MNCtSkBP9Jxn7CK9vU5KRe7ii+AQhZyRm79Z2k+JIB/oo2ceK5c0F7axEW5/2m+MqfCEOZ+VjQfMKUF7T7wh9dr01nvaM+hVMrVhgUknbr8ZcG9zzp9aj+s7nXg3+/X6V/zWD4usAej9DcCZ5K8q0Nh0i6Mi65E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043772; c=relaxed/simple;
	bh=uavPwD3zMo4ZwYY8e9AUZ1X6WybokeoCszsumy0fARM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=exf+wvDxid0tv8QuzRxVHYShdbL2rx7ca3eJoyhr4v61mhqM9cTrpzosh9M+6nnvmWfL2f6LpTik8+dQblZ/NE1d+1OJews/3TJSNxZSjdAZePWuF/Iz3t2oXTdBEaaiXImZM4TaBsHhQ3yqf0jQy6jmA4rgnEFLafejiVV49Y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hVfx2E9e; arc=fail smtp.client-ip=52.101.48.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hVfx2E9e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYduJo6gCjDv9OCjbmilTpyT7ZsGSi1kReGAisTj+z3xViqjeiNiK29p/1GKPW13W0z+Nw+iQZuGLf6ciH28qhQqgnlLjQc5jm8mWverlskFBfUPuKqEdjTqM7+4J0N9/YaNtTcU6EOmooO3m1/LsI9sc52OL2a4xEhmG0tVhBRSghdUz9IZGb3ZFyrxcNkLFtN/ElHcmIHtriLunxVOBZo26vhqbIOcmrLK3L8YFhJagDvyQfpFrm5E7kxx0h2qCardXyfvhylHJ3bJRDaZefMrDeOdnOj/BDNG99C5vL0Te1ZKUyKXc8eKZ5icMWJLBgZI4y1uXcEeJCcgr99sfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ns0R8nkcDtZ1PhT4AQPM3K/VaxYuvbnyZMMYsPZUWc0=;
 b=C4jF1AvNIuACuNpEquQwdHg6Mcs/SZN76z+8F+pZZD3eX+9C+z6Nh+lorAmIzfvgvfkYCXWhXAmlAbiqvOEXuDgwLySO6x/5FVmcQwUSvWYxcwjN2joQMA8le4AI81oyoXRyOrtOExQ2Zu+Qo1zo6mbIahTJdo01u+Wu1oX3v5Mhfl70CH+o5cg6PSrgcH2h4vNoc3DPxgXpU80yHcR11GmmFz7Em5axTnfH1lSkcMKeeyvqOl/O4QgDKCSsNn37F9AFaRI58Z4JfX8iLHSJlTWwQ3b8zG+Vg9AtnBvxcGF1gcXrDgQrsftf3nWi49nfrOZlLa/nRpoTtntzunoraQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ns0R8nkcDtZ1PhT4AQPM3K/VaxYuvbnyZMMYsPZUWc0=;
 b=hVfx2E9eNfGpqMgmbZd97ZeUXagoMbc6AbWDKzxHS3ak8MyRirA4SEqRVSJc3xFn8hiUTWYjX9+hD6qqHXb57T6ztg/++XJykyf0q8VlE5QtNlNfsUxpR/9tuzkEDw65FYPCta2HNdGd9W89rvxJqzvWCDz0t6TMUFOEf6k/W5Y=
Received: from BN9PR03CA0229.namprd03.prod.outlook.com (2603:10b6:408:f8::24)
 by DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 12:36:02 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::75) by BN9PR03CA0229.outlook.office365.com
 (2603:10b6:408:f8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 12:36:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 12:36:02 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 07:36:02 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 07:36:02 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 07:35:59 -0500
From: Colin Huang <colin.huang2@amd.com>
Subject: [PATCH v4 0/2] Add driver for Infineon TDA38740/TDA38725
Date: Thu, 10 Sep 2026 20:35:49 +0800
Message-ID: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACWkomoC/43N0QqDIBTG8VcJr+c4amntau8xdqEdV8KqoSEb0
 bvPgiAYxC7/H5zfmUiw3tlALtlEvI0uuKFPkZ8yUre6byx1mJpw4BIqEFQj0hG1KFUOVPdb8II
 KboyBSmHOLEn3L28f7r3at3vq1oVx8J/1VWTLuqnqQI2MArUcDTO8kNKwa9Np9zzXQ0cWNfK/J
 Z4khlAwlEJr+JHETmJwJIkkCVsqKVTaUO6leZ6/TGzIO1YBAAA=
X-Change-ID: 20260903-add-tda38740-and-tda38725-32bbb097d41e
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>,
	<linux-doc@vger.kernel.org>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789043754; l=1970;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=uavPwD3zMo4ZwYY8e9AUZ1X6WybokeoCszsumy0fARM=;
 b=hj8J1463wAoBiZowdQHBXMYhMgXF07/iTlki6CTgPMFot+zBKR6Qj/2vzWJckjPwcUg0zs2vK
 ifGvD1P5HNnD15eyPjoZ3ZcvAyK1EUxrbvAc4/hHTY1fA7ZMV3Mxmpm
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|DS0PR12MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 635d64b6-5e5c-4d1b-ff88-08df0f381362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|7416014|10067099003|3023799007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Q/cck4VNzrnPHZLxEMWkyN+QzMY17V3A7s8oSIPaeJuVpJgz3swoRulbKi6Iwe3GFRxiUw5Ko2ECt3Xx9MJ6RZFWWB1rjYJhjciyAOJxFCRrgRlgMF2cA4sBVgXwbg0ElG4kaYZ1qCUT1dkX0+4oL3kYz82OcPVPsbBgmBFefZ4W59/rbOz3Ot9OF7MN4jObrRXgj3dG93fKLNY81sgKO47c+HTOOjHKlgWXDigPj5vlbRzsW8VaRwQB2ueZ4wlQBjC9u7ccoUWgRNhk7pR0WXaCCyfU5lSr3BLVeYLhW6kNkHrXr9t4ExebnAz2ZmxnxaVke4n0EE2fq9t1YK52HgmJXN+xLvYpmo5DEYdeWynl/2wxcEMybEdGbLNDIZa7TrFo6815zxHam+xSoiHwgXouoOmYMgRumNwEvmKqyot44+7yNQYeo7WzD65K7MEiNqd01SLAPRna2uxT+SlbIhwcurTS1Jw/AooRVTWle+NpK2uG0DY2URtViVJC4E/vrRl39Lb9LV+nweeNUyG+LvAAkfpQ8kLNCBRcXvAi/dOta3Pf2hJjkor0TQ7e6mfa2CyTY2cwqTpxWtVDVewpvZye3QFxMe1cGt1iIuZ6jp1JwCSbVqvxxgMuaUJbMARXF1p0P2jXoybVmXS8ga85lX17qMk0Vwhg92QfnKbe4IVMUVygJvUOWkUEeVrj1cq2pE8JcGZ1EKnjH/aD6pACNQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(7416014)(10067099003)(3023799007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mLygEkSs4w2NX3N+FTPt5KPJGwbyg42Sx/P4Lohwcttpr6ZfYNcQI4BpJwIlrIhBmvOKK5i8TK2fPPXHoRY0t1UrlCWkwVywbUPfpcnPNvE4LkC2c9/EdaV0Y0t0a3W2mASFG5XZdd3HFkr0AHQe2P0KVwiqJ5RnGZTWmctKJ6MjAvx3gff5M70FovRdhaQqhEUCjeCV2iArO9epQ12PwGZnVov1GhzwhfBDfJuSo6isUXgrEOyZn13fxOwI20RytoWG90g8/o465fzSJ3AGgiRjDnniqwcPuxq0tVWSRbXPDWLlDy24CeAJ1PYqHcy8h123DszoU8L1t7BLgm5iswFt7PdaJFPdhx40du9JB4ITq+hDnjtkmYeg66RZ686KTBNbXs6B0QtvRkq+IQZ8X55ox2Tumn1Z3VM8i6V6Yb6qTIp+1REHEB4c5zXtDWyU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 12:36:02.7303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 635d64b6-5e5c-4d1b-ff88-08df0f381362
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7747

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
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

 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 46 +++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 Documentation/hwmon/tda38740.rst                   | 65 +++++++++++++++
 drivers/hwmon/pmbus/Kconfig                        |  9 +++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/tda38740.c                     | 94 ++++++++++++++++++++++
 6 files changed, 216 insertions(+)
---
base-commit: ba08432bda66a7889d8f3d1581dabf10f59b25eb
change-id: 20260903-add-tda38740-and-tda38725-32bbb097d41e

Best regards,
-- 
Colin Huang <u8813345@gmail.com>

