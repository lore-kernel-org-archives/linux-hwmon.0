Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC39B233120
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jan 2025 08:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758180; cv=fail; b=WCQtoUC6e487B7q4CsyfaxESqAz66IpThseHU4troWwa+ZSwOnbA1AFLl7N0m5AT5berrGl0FcXOEv1mgqwfAI2vD4k83kpVN4YcUK/U4/NApewGA76eK55FJP1+eWHuPqjCUH9DVVVX2rvnzWbjVrSFXjOMaGO0lboDynD3E8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758180; c=relaxed/simple;
	bh=JanmRhnsL7z5Pyg/pMjC5uIBfO/BawdxBp219s/82pc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c1f6c/dZZy2E7T0C4VvQ9jh+DsFrUruwR6h79OSXaZPi9LbVglbKWycV4ZkYPuP4ZgtROOc3PpQs6+kxeSxANXsAfvPdEzgzAlE8fiOdpktDml0dq0EGGwxKgfa4taVfl+9gU3Y4H3jRcHxIeloPFbGuBSNxuugW0MdohB4ljp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Lgp4e6qR; arc=fail smtp.client-ip=40.107.100.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lgp4e6qR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=em3sNnHGLTs9CGz0vnKfzVpYCfFx4W2NiRpN4wyHm0GycZURH3OVyQGVetzKalytWGgvT1ccKY7IaRFTDr1ImRrvTNSFZHifRLGK0c4jqWNZ6KfVkF8/Zn04yYNdzQ4M25drTuYDNtkeVa8jk4H0ckk/Gt2lYb+y6qQO2nTOFOfshT6bBhEWROvgrb1ePHUQopvRhUtjqTM7UvBNlTfPc6GKoHMNFaJKQWRIYk2TJh6zCkwfNBqxPhGuGUa5t9aXAQsfiolbUxEHudsfsQK5POHKkSpxY+4OGj4+EvMMMCPxpi+JtAMd/3V3VbobFjBSYKm+Lmz9Sp9pfaWRJa1Aug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJknG2q0XrXSZvzlWeouGWElid1C1M/JnZZoQl9sGZo=;
 b=oXiVuLaGRneRd0LInTEsy45ccchQ/mJQ99VvwhMIheC1b6U6xk7xcmPtX0ZChPKkKF+NO6PdiA0X/2MmWqO814wAX72kfX+OX2lakLS+6ERGVm9hfP8wLpVGXPdmy7O/aFuZRisMj6OCsAsQPvM6y2cE/NPDyc+zSrL4fE2SLUAdSfxvd/JK2Dkjh8tPVDp516+6DObqSqA6B5Z38nD7h5uP8Ek31FIN14O1nH3ZynObHr3oEXIYhgKFrDa12XGaVhyw7PCYz7n0mBlVIoGCHZwuVXS+hr78rtyIoZHaVpcSiUd3oxMmuc8CKsupBgUIbLyJR1tIbkVv+cPykO4YMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJknG2q0XrXSZvzlWeouGWElid1C1M/JnZZoQl9sGZo=;
 b=Lgp4e6qRrRTzvUtAa6+eDjwR1QVDLNVBv1I/rjSAYXrXrZ+DRuzK0wRzWxIaWR0DLjWPdw0taq1iM+pdqv8I2rro5tzA0uUWh5RZKL2aaDpMN1tMWYdwStLNiBuGOK4TLvOfHFxeoiv+6W2dT0y+u8S/PUFHwd4RvM+rExDKgmZw68usvIaHUGQ1qXRCezUqppid1ED9JrL3BwwyHe13y8QUtgF5HBARObqoFK1lKvNREOsB7sr3m3iS8Vznwap/oeeh3hq4Qca1Xkj/cXSxm0ZrVFetMyC70XF7JX/1LttLXGfaTkE8uiwz4eMOdwRnO//lvrBec8Yz62KWj8RVMA==
Received: from BN0PR02CA0043.namprd02.prod.outlook.com (2603:10b6:408:e5::18)
 by MN2PR12MB4486.namprd12.prod.outlook.com (2603:10b6:208:263::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:49:36 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::74) by BN0PR02CA0043.outlook.office365.com
 (2603:10b6:408:e5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 08:49:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 08:49:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 00:49:23 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 00:49:22 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon 0/2] hwmon: (mlxreg-fan): Add bugfix and introduce new feature
Date: Mon, 13 Jan 2025 10:48:57 +0200
Message-ID: <20250113084859.27064-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|MN2PR12MB4486:EE_
X-MS-Office365-Filtering-Correlation-Id: 35462007-8667-4ea0-6173-08dd33af34f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xqExN1nHPy7Cu2ynk1a0hEBlZOZmkK0LTzZIidFe/2bnxZJU1kH5Z1Q7Kg3C?=
 =?us-ascii?Q?ueIP+Da2PEfj5EPeTP/NFhaW76OPsCsRK8YsB8RiXE1YVrlK8oJNt0bahGFD?=
 =?us-ascii?Q?xhD+pRua/rLDXRoL/KHI+pB45Bxthz7tNmEuirmbBbHOQckhYKTYd+0Zja+N?=
 =?us-ascii?Q?6rMrN3mTe26LN3iFqmCjBsl/umK7szj6Y0qjfQnMi/h0csDtShNLsduTZu4x?=
 =?us-ascii?Q?N6QQ4ry8wIR7Tip/f1gJLspVZJBCaQFq6b4S1kISu3pxwA6h8LN/cFpxve3v?=
 =?us-ascii?Q?FndxAYxPRYWZzddwulxNRx8u/I7O/noG0X9RdVeAge+q6DH+JZvEq0hGkYNy?=
 =?us-ascii?Q?/baBzK9f0dG+H6uR089G/8WFkj2+w10uBTQEW8/ELTYwnqTEcH0aE1D+SJmO?=
 =?us-ascii?Q?q3UYQ2e3Gks1ZlIzBLEBwFuGnMG8greByUMGawClZbYSkAhGuA5omSJOAG/A?=
 =?us-ascii?Q?4MPbjZe8UQJZ/s+CiZDrHM6yvCTdFI2k97XsmArreQKKI4dy17ZTif9phV78?=
 =?us-ascii?Q?7fojwQS/TQWTFx3uGsIUwLvCfV2vezzm1a4uLJL3C5J+VMZUveH5NMSBKhqB?=
 =?us-ascii?Q?KhhMnvkjGckZsY54elAJy9kpKvURrJhLzCgY6F6o7s55isWi7ublu+eEgewT?=
 =?us-ascii?Q?RLnaMektrBtVsryesehaM8pmXta0Tl2tyuK7KYYszlJDLh+JYLfvirOyLsny?=
 =?us-ascii?Q?CvEQajeKDNNru/bg14l2W+Qi/ZuRtNv+u4iifPlOifdaOhZZzmL/9cg9nYAK?=
 =?us-ascii?Q?e2ELrSY9Yl/MgvomlFASnrDLhnfbYdJkreludxQVei5tkAhbNEonXhS1twc+?=
 =?us-ascii?Q?P/Mkd9P8YerSj+cLSYd05qj0Ix/D0ePSMQeP5bMzt3kP1vULy9whvr7XZwsO?=
 =?us-ascii?Q?dbIFFTbLA/KcWOQAyLSVK08zsBS3wXHeF2qSrqqEcsgWZLzqWBhQfGe4HgQr?=
 =?us-ascii?Q?QTa/3WOVO8XqLuaFmzIvM+q/NN43ltruAF6D7KMUZ0V6Kzi5YgE9GhaTm1Uz?=
 =?us-ascii?Q?pzwcx5EiIPkTrq2c2FpKJrT0YGxB7l1316O26KL98xrMfyftAtRIaMMcc8ex?=
 =?us-ascii?Q?jZ33wC5VyMQOh9X/E312AcgPnqdPS39hqcVdllfgVpcxy0za3g4K3y8vIUN3?=
 =?us-ascii?Q?WL6KJ3YSvnQNUPXAgWdkiTzfvujYeGKReT53kQWBXrLQ27iriLi02YCXH/cr?=
 =?us-ascii?Q?Mi0UTl2LAis6JIoyndaHC++LpENN3NE9oEDa/o2HkhdFKpppR180b9wid/Pd?=
 =?us-ascii?Q?57iSd8jgUawcpL1UnFrlf8ullWuc5WJ3wJPHVuO8ln5OZR1c4stXr2utpTqO?=
 =?us-ascii?Q?US8mj4v6N2pyVE8BpqmsIAm3/304ylkvJ+q/5/W9CiyQcpvcIDiZgqFCTyxj?=
 =?us-ascii?Q?Wp3QLaK/Z8fqBpK7iK0hyZUkoa3VV8+t+2oeF+xzMCI+Vca/iKxOXMFb7pgR?=
 =?us-ascii?Q?ZKVryTXNqldfw7XZw+6hO2OG6Xfpf7UAeOKEZwCGawZlzEI1tiQq2ZGq0nO8?=
 =?us-ascii?Q?orMTyYl+4WXUQDE=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:49:35.5433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35462007-8667-4ea0-6173-08dd33af34f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4486

The patchset contains:
Parch #1 - bugfix for separation methods of fan setting through hwmon
	and thermal subsystems.
Patch #2 - add support for new flavour of capability.

Vadim Pasternak (2):
  hwmon: (mlxreg-fan) Separate methods of fan setting coming from
    different subsystems
  hwmon: (mlxreg-fan) Add support for new flavour of capability register

 drivers/hwmon/mlxreg-fan.c | 42 ++++++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 11 deletions(-)

-- 
2.44.0

