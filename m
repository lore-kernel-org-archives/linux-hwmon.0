Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0E44052C7;
	Mon,  7 Sep 2026 06:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763965; cv=fail; b=ZeoZgkvbbJ6RfeeTQht3ZN8ZtzL4Agh96g0aWz/bQ5jTfE/RO7m0Ppxj5UZhzUmgPCngkxZJ5WxR2lYiplXN47UC3xyGwSHhBXiUSvWgSE1Se6r6ku/seTZ0L4Mu42tJ7jT2wAp3+aN7ZX/o30Yii7UBIRO8mdThQwOHGaBqGmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763965; c=relaxed/simple;
	bh=xR56O0zXFnmW34yayrLlp2ZiSqMMS9x09rhl3EfXjzg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=q4vf2zisKAdZlTd/gf1GXhJZf/VKjRq6FC9Yi80MYhooxyy2jW94sljZD4khbMuXd3ELYMpylK2a5U+TMnWZ1ITnTlNem3vwwPe/+pPDN1peyye5OlF0gPbea7sHQWRtQ01q4uqNC/jRo0r3WR9KbOWqofXgnyYx3/3+pnB19cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4OWQ2cyh; arc=fail smtp.client-ip=52.101.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4OWQ2cyh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRW586aomQBWV8JuvzzeE6f5sr+/Ll0ZYpYRrrOChL5e5eB/6XgY1AHEda4x/+xRN6hktktPXso6Q09d9nQWypqY4s1D1Cl2GHjpRUAZWYP4H87QKwlk6RdceUCaSyzQnxoWIVvIsf92bkWkoFgVJhhhEOvZ/KQKhuYwRnGyHGnmSixpviZmFMtKUQqGp67GMK7424Q+ZPhNNgFM7DRT4SIwsVvlugrcqZy3xIDkXpe/ZD4M1z/Y9z/hk7m55e+VAO3T+LhHGhrssCovYeh7LDfzmfVrViSqEhWr08gU9EgkZnT72vFFdjKQ551C1PJkOOAaMI33qqRlb9QyET6ZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIhnX8RFnvmgJ/eBkJCHs1NogL1JGvjv7kgKqkdU3UM=;
 b=jxCZW/uDsowZ1LuOETs+8b7YSV26Tbrz60QHQjGovEvk9G3uCc9b76FvCMt2TJJufDH7JJ8HXWgzPUMTgHqv6KZVE2oeJ2P+371GMUcHhc5zIM3k3OSo8M5aupqs4E9Cr63gOsIt6GvDpCtd3QeVUHsO+2v+ofYY+ZqowBLOjwIXGZugWAqUmAn3uIkVu+KNJzn4nXK77rQlo24diwZHzUKCk/lsKvAaSYrbCi0beCTmZkJAYeVUUmc2+EoPA8zCHRQej9ph9tEsIuYUctzUOpsqV4+ZFpycaHNTzDkslBgC4N3Tksl78CUkkfWGS2whke4th0cj2NsXYjNchFl/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIhnX8RFnvmgJ/eBkJCHs1NogL1JGvjv7kgKqkdU3UM=;
 b=4OWQ2cyhvwlTuKGvwYpYIlOiLs6IAQoW6/uyFMb9/KdIGzvYr/LhrP8JhqnMhb3uPMO0E6NH0hsRXUkVxugs091C0+4B5ToMfqvASmZLVCZZs8THjh+XeF3U3XvqINN6XENQK6Pz/93XtVFkwoMromH7VXqZaAcIOb4VTiKX7s4=
Received: from CH2PR12CA0011.namprd12.prod.outlook.com (2603:10b6:610:57::21)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 06:52:40 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::80) by CH2PR12CA0011.outlook.office365.com
 (2603:10b6:610:57::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 06:52:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 06:52:40 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 01:52:39 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 7 Sep 2026 01:52:38 -0500
From: Colin Huang <colin.huang2@amd.com>
Subject: [PATCH v2 0/2] Add driver for Infineon TDA38740/TDA38725
Date: Mon, 7 Sep 2026 14:52:28 +0800
Message-ID: <20260907-add-tda38740-and-tda38725-v2-0-1d051d63aa01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACxfnmoC/33NTQ6CMBCG4auQWTumHf7ElfcwLFo6wiRCTUuIh
 nB3Kwlbl8+XzDsrRA7CEa7ZCoEXieKnBDpl0A1m6hnFJQMpqlSjcjTO4exMfqkLhWY6QCXmZK1
 VTe0KzZDuX4Ef8t7b9zZ5kDj78NlfLfq3HtX6T3XRqJDJWW2prCqrb/1o5Hnu/Ajttm1fFlX6o
 sIAAAA=
X-Change-ID: 20260903-add-tda38740-and-tda38725-32bbb097d41e
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788763951; l=943;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=xR56O0zXFnmW34yayrLlp2ZiSqMMS9x09rhl3EfXjzg=;
 b=S1pQdpPUR5fCNIQ6I1KCyHpfph5UzUB+Uh++1geT1IAqRI7xUQo1/rbElx7xVur11We03QBBp
 +0IYRwvJlTSA8xg1APF9RJlnEQnzopeevVsL6QQFp/1XLAd2hnNmIV2
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2c4096-e974-482b-5665-08df0cac9c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|56012099006|11063799006|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	f2hueU/Mz+X7w90iuj7mZIvBY1O3WxiBn9Z2Zk2ZSoPbdTJeD5g4We5uXDPGuG2csMec0OZNwg3M7czQeCXekjEy4692OY5cG55porxO6QgIdHxfmBW/Aa0U/7nyQhRyVf37DB7qVV/I3q4f6A+y62HLIr8nazOlc8WhQs35S0llq1oNz4uEezTtSMfdNaZNhyixM+i5ilnvYch3inQSxRgMoouRH2JcFV5xn72lHsJheRDkiZgPGrsMZtMi4GNE3tlOvDDOuxnuq2jEKZPIGXKu8VL4hW4ep6Yup4+NodqD91aqhlD50QgJC2MMhX7QAVonB1J+8fNoYL0qT8pvDg1NIzWOBZjHQyaFo79cDuCY1V/AWNfo1roTZHf9oZWtoWq9r2N3741jch4hoBUOZcj9dDqJPQRjo5s0eEkbYZGrzgXNmMRwzOr/85oSc+lJ0TbXpOz/GtZviyqGMrZp8iM17BHw+ZzzAA4grkWRGi1IuTJN8rYgM35ImwELZSppWZiDflgtIS9VAXKIYkuJAKQLY8F/+DNLNAPdyX3JQCyOnM79guGGsPNmH52jx3lU6+/+GJgLTET1CpyYcPsUe6uUASiL0b+z9idch61ENFrcdix/5Tt5NTuIvVLNRwfQTxrbgo/nJi3Q8nT+F1QFengdhGtlgzlsWeuyl4wJzaVz/m03YuVCHqrvoOKu03Ok24w6VXbEAMoTfsyufm30yg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ovn/g3u8kzpSjXGT67Y0AvlpKCMUg7hAd79kW+/qQAQ5h8XUHgiduXcfMXpM6Qy8zjNJPrdAvqu73LaBO6Ptna1mOXWbgPqa9hLfwWyOFflw8HX8ItY2jbc2g5twIQB84QGhq0J8Rl+OktZ5psGVqADjcjkhvVPfVghSLfHeJbsdcMZOzuavxtsmyRC+qT5lv0gGACkcT0ZJzRbSfCNFuHVkZLSUDEQOBQnzdhlIR4/Dm5c+ANPypLKnDoC0C4Ec9Vnqwpw/wHImtiefsZRyxZirahDNJaAQQpr22GnFSjR2Hf2E9sX4MXbDLOcwkWwrbMggvfX4RxVZ74BaDWa5S07KZLlHiFot2kUmDYruX9Z3wfjHyvk1WCpKwFuAweccwAgrDgft7ncznLuF1TcUCnmVOfdE1MZbnZv9A80kYIZchQJLEF51/XrLw7QHgvUl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 06:52:40.3788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2c4096-e974-482b-5665-08df0cac9c32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Changes in v2:
- Use standard http:// URIs for $id and $schema
- Add maintainers section.
- Use C99 named initializers.
- Link to v1: https://lore.kernel.org/r/20260907-add-tda38740-and-tda38725-v1-0-e2db1b2566b1@gmail.com

---
Colin Huang (2):
      dt-bindings: hwmon: pmbus: Add Infineon tda38740 and tda38725
      hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725

 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 82 ++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig                        |  9 ++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/tda38740.c                     | 98 ++++++++++++++++++++++
 4 files changed, 190 insertions(+)
---
base-commit: ba08432bda66a7889d8f3d1581dabf10f59b25eb
change-id: 20260903-add-tda38740-and-tda38725-32bbb097d41e

Best regards,
-- 
Colin Huang <u8813345@gmail.com>

