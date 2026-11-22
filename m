Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795367434;
	b=5Sfgdm61CqDED9T2dDXJ9XFK5NxtlSa9tYkmH5W62984riPWEa0TTYdq6BsjO0MZcnf7
	 ZoRIeobHLtfFmqTn2oXCKOCwTJcsKHvcXtQUWK7O9sTB6puVYKHePT5OxVHIEOrfk8qNm
	 fXu4jA2oZcMJhojbtmGlnovEMnzwY9R31iGVE5eLWCXas9pzgpp3M3niCaetm49iDvXw2
	 /9jYb/lhs9Uy4L86l36jdkSc0GKkihcNOC4lwtUZ3dtA1wiVPSfOgJSm99WGYOonyJPSq
	 ntZMn4lE3O8NC5VKEDQOtynhF2m7QkZ1bMfkbqvSH8408AkT9HviUzxD2fR3MkmN7+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367434;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=nIH6kD1r6V+Did0lvvxAvP5QyQYE510t5ghqDcli37Q=;
	b=xMc5hgLT81j49nUZjNnkyoq7YdRljOl7ZyGpPcrPUYMmiDH6nGz+ABZQKJsu/fjnIKj1
	 cM7JwL8MKAOlzxNkzA7WuLDu2e2YIyWNVxQ+FumQ5rOlLRlCKgzUqr87DZLzy8j9G/g/c
	 00pyCTiwnCjk2Ah8Plr45AiJas5aVM1T9nqisEorpgM2lXAOSmqvF7bqpB28wlRSbccE0
	 yD51K5SLg38EDyWmeD/LnWNahUCd3eg6RBu5rKVI1iPI1nxZYTTsNPO1jS6E/kgGRSucM
	 BXJqfLhepJUPHL9VrhdbmCKqBtqxl0w19sZ7qmbnh7ZVzXjZxmnWbyicjNluGqoucSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UEvgkqI5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.61
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FF3606A320;
	Sun, 22 Nov 2026 17:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32FF3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UEvgkqI5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7N2GoPmGFSPabIgMCnIjszVXiqszAJ7HqubtyyBRGSHFjn3wVa4Z0d0NE8JUBgF0fYCcsg4RyjP6LEQAhbaeDhUJzajiauGQTkqwtk8wCd3mgUeM6gz65kjWrJWCBoQYRwMS45DlznPza6hnRb0AKOTkd90EqGsCe8UIhUpQVFsTndlLbiW8Y4d7mUHRHgHkdaOHnsajyHkHsLIZ6YOMX3GhYiQple/KANZpCmkKB8GBI3R+87iPay3yP4GlBrr+Kshz+caJOhohNj+P9oNrmqoKHIC3ZwxjlS5yT2CKPlEDAHEmGWJccBk+mkcphKflA4nl5+hU+59z4aAdeXS5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIH6kD1r6V+Did0lvvxAvP5QyQYE510t5ghqDcli37Q=;
 b=DPXaNcXODSRfnf51n/QrCM8pvmk/l4XPUAx3YQbMccwuAVr5/+vvQ6MbuuninBYg4Fffilaz3nlvaUqpyuJUoFRdtL/4DJOImvofgx6TM7ij7cLa76JX0dzLa1F8AEBzD8L7HgejRc8bXlLSHr6trt3XBVRVPYNnJ/37xpAljqrMW55QmLV7+lqty/SPTTPj/EE7RmkbQCePPPYmiFRUbaMnv3K5XHaSiQr4dqc4ACNIs0CBF24w4v+s+4rNhMN4kp8NmV3FqWK+4Ay0a+MEi5MdsvoKSpjrZOJYbZ0pSsJ9Wovv6BrLGh2ZfJRxm21bhB+fW0lIthVGHiP/IjuvaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIH6kD1r6V+Did0lvvxAvP5QyQYE510t5ghqDcli37Q=;
 b=UEvgkqI52KoumqZf7RxAUVlpSz70EfnaNX0jpuIGX1VXjN4+YTxH4rjYAQzu4apI9jxk9hlmuT4+1fo70JyOWlQcjlDB8+ghm47iA/kW2+S+JyMfsz03Kq780XaxNtvwvsPmFlcDqoNlgyAdWhCB8LUVSP97nint9yrxEM4M38iV/YPtwOR++/8hU/pjH75aBcP9DHU/HZD5pFtWKAzWc/f43I3BxG+sj6/NklMrIYqhKi/TQnWZOg/tONMl5KpUQapnbY96havuQW01KOGZ/bBMgpNwc5Bh7i49ZvfoYekbpkkDb0YUIJpg6MwWQQZkkYthmq8XxRAdCsD0ZX2NSw==
Received: from CH0PR07CA0025.namprd07.prod.outlook.com (2603:10b6:610:32::30)
 by SA1PR12MB7295.namprd12.prod.outlook.com (2603:10b6:806:2b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 17:10:27 +0000
Received: from MN1PEPF000793FD.namprd05.prod.outlook.com
 (2603:10b6:610:32:cafe::29) by CH0PR07CA0025.outlook.office365.com
 (2603:10b6:610:32::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Sun,
 22 Nov 2026 17:10:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF000793FD.mail.protection.outlook.com (10.167.249.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 17:10:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 22 Nov
 2026 09:10:06 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 09:10:04 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>, Felix Radensky
	<fradensky@nvidia.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: [PATCH v2 0/3] hwmon: (pmbus) Add PMBUS_FORCE_PAGE_CHANGE flag
Date: Sun, 22 Nov 2026 19:09:46 +0200
Message-ID: <20261122170949.3059743-1-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FD:EE_|SA1PR12MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 37354e1d-efb1-4806-be72-08df48bb809f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|261021121427099003|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261102123227099003|261009223027099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	tRz0KSnx1HEah3R1DxGQ5A1x+FXiujs759PH9sk2qBcBtvRN/QkxhUo6TF4BUFh7lO47YSxPSH8ZjzRQ2eLNQYCYlhNSZL/uY6Cl4xqyJExPXSlrCMTrXqZjovJhS4wnAFdCQ1InZIsSR/B/oUKUngIxv/nVDmePEyj9JmS9SFhDinq08kY01c2hFT1U5IttLTNk/tMwRFkxzcT/dKKBk3TluZsbJZn/TGVWqL97A0OvvjbNcmddOmgav5AyClhHLNsCG5hEDD+t3BneuobeKb0msXIWAyWNGZLqSdv9E3XrrIpunfjdMmA+grpHWl/uijsQNTGXEqMaiDV35Pa9GGeih3KVgfyIeCcpZLKzCoBxiYNw2/hvpzpTUe1FKTdnGklhBJblst76Iju5VJDQtDrYRtouHTLOvSqy/IgI2X+JNFhvFbuIWPbMPfbl9so/zpLFEp0hsKPOVBwOL8S28tYBIRlmUZ9SQCV2KgIjAeQaBTa6izD1AFUKvaJmNzl8PBJETpDVPxSmj5T4z6AnXyWu7DeqygJdN8olEMOyc6rQs7wPYpQsT0VXUSPvbciemOQ1hv3qC66Y0GyPQhn0XFPZYfATPIpxEX9QMTme8ogtxS9yRqEhwTlI/i07bfYYp/1ZzV/Zp65Tg7BBeaFSVf6jr3H1mURPBrCzEQG/E2h97PaeORd0UEKFoeHoI1lAT8/vvthfy9qn5Uo/4+NmNw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(261021121427099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Hxfr4+R2SYWOm96Okc1YdpsriPqgJJa50RumpoyKRNFzUXKwf2wNPTXaunlmjlWpl1Yl08UlMWqAkJj+G+ih0Ypc1lPiS16KOkEmDdMjImJOF8IiVFsgy9Fl/Ipajb6+IILUthOHI7lApMbovaf7lN7iRLvZ8PivwNVOXkNwZ/ftbE/dR2uu2nshjkpTFECY42ms3rA11gVelPGk1qoiC6V0Uby/RrCpUqUagSIoe6a2JZ8+IlKqCbk36a9KSHJyF5/NFJxpNP9WzLvsitmCRmqAYbQ87Lj73hopcGUM1SZOjMya9ul2uNSpFWIMK4isTVs94hObU8wvNpPPRJzNs+RaOaND9HWGXmjfIVGC2mcp48Wfe9i4whXY2mCLqXZ3MICpLaGqPbUz/Sk2vktKg3ItM7mgVEbLmefijQV9+c8mza2vVvJyGj0Fp+9cvY8A
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 17:10:26.2256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37354e1d-efb1-4806-be72-08df48bb809f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7295

As discussed in [1], this series adds the PMBUS_FORCE_PAGE_CHANGE device
flag, which makes pmbus_set_page() change the page of a chip with a
single page as well, and converts mp2975 to it. The mp2975 driver then
accesses the page 3 voltage reference with pmbus_set_page() also in a
single rail configuration, instead of writing PAGE directly.

Patch 1 keeps the page and phase cached by pmbus_set_page() in sync
with the chip. It invalidates them when changing them fails, so that the
next access sends PAGE and PHASE again, and updates them only when the
respective command is sent. Without it, a PAGE or PHASE write accepted
by the chip, but reported as failed, or a failed or mismatched PAGE
read-back, leaves the chip on a value other than the cached one, and an
access to a page without phases updates the cached phase without
sending PHASE. This already applies to chips with multiple pages or
phases, and would apply to chips using the new flag as well.

Patch 3 depends on commit 00944852275e ("hwmon: (pmbus/mp2975) Get vout
fault limits dynamically"), which is in v7.4-rc3, but not in hwmon-next
yet. The series is based on v7.4-rc3, and applies to hwmon-next with
that commit on top.

Tested on a switch platform carrying twelve MP2975 devices, twenty one
rails in total. On a single rail device, the change to page 3 is now
issued by the core and read back, while reading a sensor of the rail
issues no PAGE command. 400 page 3 excursions on a single rail device,
and 800 on a dual rail device, each followed by a read of the other
rail, showed no page 3 or other rail register value in place of a sensor
value. The limits of all rails matched those reported before the series,
and in2_crit of the rail supplying the CPU core voltage followed the CPU
between 1145mV and 1725mV. On this platform, patch 1 changes the bus
traffic only after a failed transfer, which was not exercised.

Changes in v2:
- Patch 1: update the cached page and phase only once the PAGE or PHASE
  command succeeded, not also when no command is sent, that is for a
  virtual page, and for a page without phases or with virtual phases
  (Sashiko)

v1: https://lore.kernel.org/linux-hwmon/20261122073322.1712843-1-fradensky@nvidia.com/

[1] https://lore.kernel.org/linux-hwmon/8e4410db-66df-44b8-9617-1013545d7b43@roeck-us.net/

Felix Radensky (3):
  hwmon: (pmbus/core) Keep cached page and phase in sync with the chip
  hwmon: (pmbus/core) Add PMBUS_FORCE_PAGE_CHANGE flag
  hwmon: (pmbus/mp2975) Use PMBUS_FORCE_PAGE_CHANGE

 Documentation/hwmon/pmbus-core.rst | 12 +++++++++++-
 drivers/hwmon/pmbus/mp2975.c       | 29 +++++++++--------------------
 drivers/hwmon/pmbus/pmbus_core.c   | 15 ++++++++++++---
 include/linux/pmbus.h              | 11 +++++++++++
 4 files changed, 43 insertions(+), 24 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1

