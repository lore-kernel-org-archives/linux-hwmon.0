Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20AF1B815
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2024 07:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726124915; cv=fail; b=q/tZnyl4nBht7rZTwtDa3FK+S6d7r+2vumFPUnt+8GGkoEOIdzSkR9vi41h8l3sqZWma7+B8YnZ8eEIjX3zQ688ehzYo7ierX+3yjcjwu4OE3PLxh5yJ5FzeXb/U898d2byq4BZSm+gg2xei8u+JkSpswyaLnu2SaENFucgHurA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726124915; c=relaxed/simple;
	bh=sOOaROT/R9tsKCnQB8dr9af5cgOaOvI78kxBiFeRb8U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tOJ53pLfPUQGwVV0J/VWXQwkSxPJ8x6MoUFW/0XheBlyNmPNxRde5HvjblQMwjEI1pqOs7yOkJG8kEz1KZryXUScwDjphgHuY/neVsSwCoFEo+BVRN+5/obJQh56NpQcaRMqJFm3aMKbVYYorEgLIB9SGV/lSUZTmoBQaQJMDfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tRfKh5dM; arc=fail smtp.client-ip=40.107.92.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tRfKh5dM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7ptnByvW1hHx37P4XIhSG8dldbhEPJ52P/9hbbrzYCvRKOZ0ZO9WkY16th40h6OG0Ud6iO2BNX2LCexFy3KwA0nl6waCNakl3M7jpRSbJlromhyUDh/VP6eQfVEJs4K8i2Y9DrA3eDymPgwtf1tZK4F8Oj3YKkfPg8hmYMDEMUy6CCXXTPeV+MW36lOORVz2znwSkrNmMbrdzxk1dV2cMHu2o9l+Z0/n0qNDX5tpWJm0rrUOHTzKgkefsVVsG4Yugqw+b7fm5RsqIMweLeDvnN6d8lHG0z4TdbZUtXzEsFmBLJFvslx2BWWVI3yT9o5gg6LiBhw53uX1dgy8Y+upg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvWWiaQ+0zfdu1+Udq6RO/B/xKozk2PQCJKDuz9f9Eo=;
 b=Lt6oa8XiKh7qs2CPn55JzrAU8+7Up6DhGuiQQ0bEW2CP6+LHi1Yvjoy1TagrnI/9YpjGRcs35NHtGhsQmZnoHKVLub2TyIA8xiaIwgjPSDKXT0i6B+nZQPj6J6NeAednf04nUAhF6TuM/XwZxVXJE4W2NyUFKDvUcKwwLak/gkc6eV9/TndL/BMz1/LqKFS9C2WKlb9Uec+L+Be1pjCt95Mhr4yvo827/EvHyIJyYYe8mf0rSBNZN46bI8KjDaNvxPJqnn9q4jqWrBAjb9JCsQ1VdmsOWd3rjq0r6MuH6lObAY8JdqG7ExDp/FyF5bDtEvlWQNUQn70oGs0odS5v9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvWWiaQ+0zfdu1+Udq6RO/B/xKozk2PQCJKDuz9f9Eo=;
 b=tRfKh5dMnjnOAXpsEDX6SFFxgsV6QWTN8DhCmG+kcPVQ7p9WfNIAcqF4Y5vx5IkizbwDbCdMJgddPzNZcz1w2GmSJIoZbPYaYQ/u0UGS4cQLRzzWbuDZ8h5eAfLTYV/GpjO/EDAATklbikXiHI3YnmN2FtRw2sRZS/OrzkThiwM=
Received: from CH5P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::23)
 by PH7PR12MB6955.namprd12.prod.outlook.com (2603:10b6:510:1b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Thu, 12 Sep
 2024 07:08:30 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::fe) by CH5P223CA0006.outlook.office365.com
 (2603:10b6:610:1f3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Thu, 12 Sep 2024 07:08:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 12 Sep 2024 07:08:29 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Sep
 2024 02:08:27 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<naveenkrishna.chatradhi@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v4 0/9] misc: Add AMD side band interface(SBI) functionality
Date: Thu, 12 Sep 2024 07:08:01 +0000
Message-ID: <20240912070810.1644621-1-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|PH7PR12MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: dfcc5cf6-65df-4c6a-0001-08dcd2f9b4b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UJRNr5jThBHFjszW/k/WB6ZruPkTAh7Q9dMCyKjqp1eMTjIwhjzXH6q3+n6S?=
 =?us-ascii?Q?wPHQ9X0ULvN3JA4gtSjFtH3aE9GyBnGBfkq0SELk0kN8KarOThuvw20D6cq7?=
 =?us-ascii?Q?+XwG42sIWIokmQnM2DJ5G30Z7ZOD6iLdTnG4jeWlH6Lq59Lr/4NaRLwbvS+z?=
 =?us-ascii?Q?Km4+J5SdSMsj3QFPaDZCC0KEDtM/jQ7MvorQdQFFTXZfzZHHwVX4DvvmZiPj?=
 =?us-ascii?Q?9IQ5rA4gwAo9X4bL90KqkEVfX2m4wzwWKTKWtsiqIVJ94bgxErjYNBZlv7UM?=
 =?us-ascii?Q?qkJ1gG6xBIU2cokX4dQ4ZgseYU95wTCaWcu4x/6yb3xbZ8RU6n+FtN6dUohK?=
 =?us-ascii?Q?wKRCt1L76LcRvmJOnns6CQRRkLhJAxGW/L8VC5k8oyv0R6nc6Ybr/TJjmrf7?=
 =?us-ascii?Q?k2LvGgVD8ZKyxKOqiOgdQah0x/LHuMyjVzmX/JglTxaFdeA9r9XgKu4Olvih?=
 =?us-ascii?Q?gERsz0dD8rVgtWTAY9huC9LV/6XRSjN1hu1GjGaC0BVzZHXowwykuUD1LHii?=
 =?us-ascii?Q?gffOIb7K21Lz/mHKYXhQ8Idbn3YHV1wzKB2HvX2kLF9X1PBapLyJd0JWbjuS?=
 =?us-ascii?Q?TnhwIx7j+EN1PfT+IdNGbAC9u+TegVcka1glo6gjOUqNpeM8dLVnGCRr8OZf?=
 =?us-ascii?Q?VkldtLK14E1d6htliFVnWjPyBaWxXRSUeh8Zrr5czZP9XW5TNmxQoqJlu7Fg?=
 =?us-ascii?Q?wFlZqYSshA5RCHgtSy52KmqOeLjTZsoomekrcRIj6tr460ZuxyyYbzBvmLmb?=
 =?us-ascii?Q?dpgJedBEYKQtgeqshptjmukw7sDLFFbI5IVJ5y/Sd5mwQ/ZSbD8PxFvADOAq?=
 =?us-ascii?Q?CLEyXUc5qPzqFIWkNCbF4LyvJN21IJ+oim/UiYrGryNjMqtiPlvNcHVnXBJF?=
 =?us-ascii?Q?N3qx8JV42oO6DpOo3I6K74AWZ0y6A95Q8IYttqCd7C0WMMtoEXatqHnFtMOl?=
 =?us-ascii?Q?hlXNc90zYVK6LLW091BWPRmwsFE9OpqVglubzVcnOWm1IKwTgBcB0ZDvMW3+?=
 =?us-ascii?Q?CCQl0OvESE3dpudG2O+C/WwZ3gRHxbsoQKjVdKi9hD4DBM3Q+4tfftRoY+LP?=
 =?us-ascii?Q?eh17AC+vNoL56Ff6ghuXcnX32rdF7CCq5Njv0Hi5u1O47ywaokd3x6zSR6Qv?=
 =?us-ascii?Q?BNt+JXa/r6i2ddX/S1te0CSEPYnYILLacZh5f4EiWN+bHo+ltXSM/4/FXUx0?=
 =?us-ascii?Q?AqnZCJU3fnFIeKObZB0/1ooVeTC/m29u1BAOvOwo3PpnXXh6Utd5PvI5yqvS?=
 =?us-ascii?Q?8avtKtZK86oURwRJVG+RHS6CQ02Py6XRTpNJlSvtBFJaOP6g/2aiSHd914Bf?=
 =?us-ascii?Q?ySHDmTFBegmQ7q7/aWzhcTQPa+1lQD5Q9Xw2BhC27LycxA40nxkCG825+90Z?=
 =?us-ascii?Q?+ZuZPxDNRrJUnV8MGyH9VKGv++3IsDM0/U24Y8WnnymiAzPIrE0w691+EI5A?=
 =?us-ascii?Q?hmX5jJR6SuCsNTTSQmXqo71CQ5bBMLWd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 07:08:29.9240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcc5cf6-65df-4c6a-0001-08dcd2f9b4b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6955

AMD's Advanced Platform Management Link (APML) interface provides system
management functionality accessed by the baseboard management controller (BMC).
sbrmi driver under hwmon subsystem, which is probed as an i2c driver and
reports power using APML specified protocol.
However, APML interface defines few other protocols to support
full system management functionality out-of-band.
Out-of-band management is term used for BMC talking to system management unit
(IP in the processor). AMD's documentation called this link as side band interface.

This patchset is an attempt to add all APML core functionality in one place
and provide hwmon and user space interface
1. [Patch 1] Move the i2c client probe, hwmon sensors and sbrmi core functionality
   from drivers/hwmon to drivers/misc/
2. [Patch 2] Convert i2c to regmap which provides multiple benefits
   over direct smbus APIs.
    a. i2c/i3c support and 
    b. 1 byte/2 byte RMI register size addressing
3. [Patch 3] Optimize wait condition with regmap API regmap_read_poll_timeout as per
   suggestion from Arnd
4. [Patch 4, 5] Register a misc device which provides
    a. An ioctl interface through node /dev/sbrmiX
    b. Register sets is common across APML protocols. IOCTL is providing
       synchronization among protocols as transactions may create
       race condition.
5. [Subsequent patches 6, 7 and 8] add support for AMD custom protocols
    a. CPUID
    b. MCAMSR
    c. Register xfer
6. [Patch 9] AMD side band description document

Open-sourced and widely used https://github.com/amd/esmi_oob_library
will continue to provide user-space programmable API.

Akshay Gupta (9):
  hwmon/misc: amd-sbi: Move core sbrmi from hwmon to misc
  misc: amd-sbi: Use regmap subsystem
  misc: amd-sbi: Optimize the wait condition for mailbox command
    completion
  misc: amd-sbi: Add support for AMD_SBI IOCTL
  misc: amd-sbi: Add support for mailbox error codes
  misc: amd-sbi: Add support for CPUID protocol
  misc: amd-sbi: Add support for MCA register protocol
  misc: amd-sbi: Add supoort for register xfer
  misc: amd-sbi: Add document for AMD SB IOCTL description

 Documentation/misc-devices/amd-sbi.rst        |  84 ++++
 Documentation/misc-devices/index.rst          |   1 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 drivers/hwmon/Kconfig                         |  10 -
 drivers/hwmon/sbrmi.c                         | 357 --------------
 drivers/misc/Kconfig                          |   1 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/amd-sbi/Kconfig                  |   9 +
 drivers/misc/amd-sbi/Makefile                 |   3 +
 drivers/misc/amd-sbi/rmi-core.c               | 452 ++++++++++++++++++
 drivers/misc/amd-sbi/rmi-core.h               |  67 +++
 drivers/misc/amd-sbi/rmi-hwmon.c              | 122 +++++
 drivers/misc/amd-sbi/rmi-i2c.c                | 135 ++++++
 include/uapi/misc/amd-apml.h                  |  97 ++++
 14 files changed, 974 insertions(+), 367 deletions(-)
 create mode 100644 Documentation/misc-devices/amd-sbi.rst
 delete mode 100644 drivers/hwmon/sbrmi.c
 create mode 100644 drivers/misc/amd-sbi/Kconfig
 create mode 100644 drivers/misc/amd-sbi/Makefile
 create mode 100644 drivers/misc/amd-sbi/rmi-core.c
 create mode 100644 drivers/misc/amd-sbi/rmi-core.h
 create mode 100644 drivers/misc/amd-sbi/rmi-hwmon.c
 create mode 100644 drivers/misc/amd-sbi/rmi-i2c.c
 create mode 100644 include/uapi/misc/amd-apml.h

-- 
2.25.1

