Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012062.outbound.protection.outlook.com [40.93.195.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A710633B6DB;
	Thu, 19 Feb 2026 13:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771506107; cv=fail; b=slylriVCDRq/1yNec8e4a6Xk4D0cexquqsfcviiObfuEsS7FDFVENx4RpA6YDOawTFGWjl6Yy+7cVG8t9+uxp2V0/Ap4jeT8ykPrWUy/2BpW+ziJUFNlnKwV0iWOzEbQ9x3plKlKT2e4hVaShJtLGCHdB7tk6r5Um5Hz/ByiQpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771506107; c=relaxed/simple;
	bh=YREasXtXXJ+7csvqQO3JXpWaUgbw+L7G4NhjGUANc5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uKQKHZVb5N9f6tjS2QbYmxStLjeVTDBdLWkX+uS6WW1Tf92f8Db8D9nIp48DunLiwG+CisLibRnZhR4xXfCd74xlQnQJdFneCtorgoc/R3ZZF+tiUPnZhnwPVf1G75D+uRTgc0DTpaNfdH49xiBqDSGTj3NF1hBcOaJFWjvziAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=uKe1mvby; arc=fail smtp.client-ip=40.93.195.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="uKe1mvby"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+Rn3h2hFF0JNOxlzdhRFR33GLZw0yWSwEnjh+2wqyLs4nbnebIBMBfi8yI6tNYS2fnufgLuJRKWLgYgYz9fS+u9udsAxgJCzqbdBXvoxlk/NGSQcJBOQ5iaY3RofxWTC4PFCQ+C4bdjbD0KOXP6FMUpqoGgYvj3uMXijytqr+vkgT8nxMd1jil0NSzQi4ID+Roqr4UXQf9PdAz+EOFChPDutLP4JUCv9jP9GzHNJnoF7ClSOJdLl6pcTyKC3bmA14x/hFLd2cUxYVaX2h/o/fV3/6QbfgoDT+w62HQdPFgXc+xFivktSSC/RXNnKM1sKuJBEAfRZKNGDhNrm1CKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ntETDDrBezkq34LPmDDy7dzNPrAvO6oAAKjS4bnaxY=;
 b=ySt68KewtBN3UwwiVGKFsA9/29LriQmZ7J3H0v8NfYNUfEUONRrCVWah0X1OSehbjn7zK0qpNtbVAoO7e0VywNp8EtvligaYMFMR8epH4+ZE5oCL8qfEx7g6VX7xajBt/9690HIZxYMaRQfHSzdhAZeXSiFZGMEx/fQKCqGF+tA77JuSwT/XDI/fg/6OBxldlie4Wa/TGwPOu1BES/eaTfql5UkPAjYqQFcLo7n7TL41DP3fck8RIBmWgZCAU7U7zFKt44PPnclqK6NjE81gAJUEgDMacTherTj4euAw2ztP1s4Ctq2rdw74SmB7FEAzOYJ37H+H2UdYGD/TrSmiAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ntETDDrBezkq34LPmDDy7dzNPrAvO6oAAKjS4bnaxY=;
 b=uKe1mvby1C+mXK1HnmnkmJoFo0UxCZk0xsvUGfIKEOBSBBtv9BDKOjR3CfUQziLHTqt0kZsRcyIXeYmCT3gn6Rs1FBSlnaAk+EosyRPQK6MIJvK35avYue4rMeNRep/qSLOqpfd11ovcUJSvX8ryU6vVTy8teQnYLCQQj0Lyrch7RqEd/dSsmQM/2oOQv8J27MYK/kzDnBOz5TqJM1LHNZNHWFxdwMfvHPJuX8JO9iT24ZAXrMreW90LlNH59dU/NQ/+nMoODTy9C0yHnUJMxPkSw2SqCCNxG9b+qCSIZqiAoa9LU8nVZ8ddXijqJCmv9htolNHNZ6BARwnDdaiZLA==
Received: from BN9PR03CA0414.namprd03.prod.outlook.com (2603:10b6:408:111::29)
 by PH7PR22MB5203.namprd22.prod.outlook.com (2603:10b6:510:31e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 13:01:32 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:111:cafe::4b) by BN9PR03CA0414.outlook.office365.com
 (2603:10b6:408:111::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 13:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 13:01:32 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id F17C3E8F23;
	Thu, 19 Feb 2026 15:01:28 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
	=?UTF-8?q?Toma=C5=BE=20Zaman?= <tomaz@mono.si>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH V2 0/3] hwmon: INA234
Date: Thu, 19 Feb 2026 15:01:21 +0200
Message-ID: <20260219130127.87901-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|PH7PR22MB5203:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5e73635d-16f1-4b42-31e1-08de6fb70145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fhN4eUFa5NUhKYhUEseEha/M2xZKc+1fbpnXT8xNawnpKL13NCilU0pXB9zd?=
 =?us-ascii?Q?MqouPEEP0ujRsgTk9pkqQMAD9ZADZNdBIG/+JOX3Q3MSAU87xFohE0PJfaVp?=
 =?us-ascii?Q?JV+Q+2vk8aIjpjf022DovkBqd6dAIQvSouRjvL6qCi6CnrcJlY+oia4D5Y0T?=
 =?us-ascii?Q?RiI95mF5XcBKCZ20Yqe/XNO8RhuD9KqdJULYr/DJAuTjRGs2NRz2VysabCZ8?=
 =?us-ascii?Q?E0+SB/0LgM07jEKB4xusRk6IDxEluGYT3/NGGbxypPYeOP7zByMXGFYXTEpo?=
 =?us-ascii?Q?In4HaV8eYxFj2cNBlzJ/kLjtkp+abPWG3iIu8JlY2nksc7xDykHfnREZUY+S?=
 =?us-ascii?Q?LGKdYnHqCMJbZVXoztu3s+2XcBydnXo0+oD4ZdqO3ebZmMGslfSg5L0LgtI8?=
 =?us-ascii?Q?V9tLFobb5/5dB7nL9uYyx2zDGMwzERTf3m4XtOcURGrsoNaoaBlxCZie5/QQ?=
 =?us-ascii?Q?2H/crODdudYgJ917UWeSvBV/LWmJ5c3fuhNRXYtScHFPdKZsBvLzoLbOZm/Y?=
 =?us-ascii?Q?DFicmoVpQ/civN6JddvxqHHv4Ug/9qJ0hXHRnma8KpKPYidM6ArcTdskC2tk?=
 =?us-ascii?Q?v9pGOYV8j8dz0sVIcdFYlTk4FhjRlQ37/oFLjMa/kJXgyyi2WQQ3lqlNx60t?=
 =?us-ascii?Q?uOaPF2OPQcioJkOxfE3e2HsCHX2U8TJbDol7KDNRFZtDvc2iae4316/0tRNR?=
 =?us-ascii?Q?9CbRizdhsDVEadxlKVKUM1Ropt7BbIlZPuHHZoVDZ4K/GuQeybUhQn56DitR?=
 =?us-ascii?Q?9cuZySRu5nfKlw+MHCnYoiTJGseS11/iulg2mpwfnt9YqygjD5+BDymUY9lA?=
 =?us-ascii?Q?PrN3Kv7PrNF2ufILyYVVZ5MLUnz2HwD58YVsOgkqY1BGBbA6o57xvn6DaO2H?=
 =?us-ascii?Q?XQk+9IS3Zb7FD40/9Zs8mHZBtmUNGbgfHIBpo5fTSxcVeRhjw76fG1PFK229?=
 =?us-ascii?Q?1p7kVRppLRVUyBIFVOm2a5JRq26PwoB0JkuZLXjh/fA2w4Sd2t+qZLS5f+Ek?=
 =?us-ascii?Q?bAmuBpjNY/sEtqGHKrPpr7OilVcC6PRoz49z2gNswIAl3UhqpqGqX44IU89P?=
 =?us-ascii?Q?eq1Bucl4+Am1P3oijO6N5jGUZD52qj7cTVeDyPKW1M+f9zyrRix4EGhYQADu?=
 =?us-ascii?Q?rPhXhlRPIh5V2wiIYCXIBCuKW8dRwZ87z5wtnWLFdUhreK8FWCrrhW8EI8QI?=
 =?us-ascii?Q?Q/0eAiLTto21rr8rMesuJEYb1AuhrzN4KWq5DXjSw1cwKHykqlebg4jhqN7F?=
 =?us-ascii?Q?Pic5CczOL1cxEEVqAt5JJ3V4ZOLtu4omc28jWkhUaJvkEAkRMFpcr/H5rSCd?=
 =?us-ascii?Q?4CcKQ7yRby/T4mWeqUxPl5Dekf6wdYo+688QOFn1o0X5NtP7dcAbwpZv2h25?=
 =?us-ascii?Q?C3GanxuJ6Az7TS9h07or8AZhghVrQBi0HHaQ0o+Mb4s3iCKnLUCjYBDUz5jI?=
 =?us-ascii?Q?m4vSH8TxdoNm0C7wAyextncocADE/VEtWq/1D3T5tNp+mlpP4iaVIYB6MnOd?=
 =?us-ascii?Q?x3EuLQkmHvu7fwa8EI4v1OplEluhz7abh27A3TiKfSJnvJie0pjm4ZixIMn8?=
 =?us-ascii?Q?R1EVv0aFatZjbP+RhvhO61VjSao9A7hNz9FMLB5CJpeQk8A5+LUekhl1H2m8?=
 =?us-ascii?Q?8+yvkImkMw6yTuvmVLvmaJAXAT4rkL9y5xMYjB8kNkhef5WVJe0pKNjtw65X?=
 =?us-ascii?Q?shCS8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SQVkk1UnclFsKJohIp/brFwH+hAktXBiSGASYX7ZpsJyUQUxKEU1/dNcXCLt8gwheTP+Yz0g/eonXAvwz2AxmA0GZdt8j1H9ghBGx3gXxeiDkhGkU9iksdQs0zZHwh6facTSrYPWtpJ1QEeq8dH5vZV3ZD3oXOPSuwtKg3YE2jxeALXJSKJ5TAB6rP7uVUhhj+n8VAgHo2eCSnuHLvgbtw04BTmtHUHqWjWD1bhf+Aopf0DB7UuGLzF9N5TsC15rt8qQNyfQ4ZWi1QXbEZRNPjGcswpMeSyVQI1TP0zD0YgyuPIIDYmR1TAEDqLonrchXcJ/dfyqkNxq9BuuCHJis1/SBg6jf4W6tOIAQqYjHJUEowO+aNss3a3dSQjKpg238mrffyNjXH+EsKRWfPZcTONf0WZ554fHIswz+cTiN9Z1u3SRQ7dA+saxT3vqhBCr
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 13:01:32.0683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e73635d-16f1-4b42-31e1-08de6fb70145
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR22MB5203

Add support for INA234.

Changes since v1:
 - Include cover letter
 - Patch 1/3: No changes, kept Reviewed-by from v1
 - Patch 1/3: Commit message clarified
 - Patch 2/3: Tidy-up work identified in v1 review
 - Patch 2/3: Comment INA2xx register definitions
 - Patch 2/3: Drop INA234_CONFIG_DEFAULT
 - Patch 3/3: Initialize has_ishunt, has_power_average

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com> 
---
Ian Ray (3):
  dt-bindings: hwmon: ti,ina2xx: Add INA234 device
  hwmon: (ina2xx) Make it easier to add more devices
  hwmon: (ina2xx) Add support for INA234

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |  3 ++
 Documentation/hwmon/ina2xx.rst                | 25 +++++++++++++--
 drivers/hwmon/Kconfig                         |  2 +-
 drivers/hwmon/ina2xx.c                        | 32 ++++++++++++++++---
 4 files changed, 54 insertions(+), 8 deletions(-)

-- 
2.49.0

