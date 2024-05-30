Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8AF16F830
	for <linux-hwmon@vger.kernel.org>; Thu, 30 May 2024 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068209; cv=fail; b=Ft9muu/W8G3ekfZ+ltGjtSIIAMO9xuSM/ZMeR1kxj5CtsVnpY9iy4jwN36f1NFjtMtTdMtICOABGdXqevW3SPP9olElFiq/9NOt2ECEkW3F2G/BLF3erXIc+Sjk85H6v5wgInFwWeaNpUJd7AGWw6SCgi70LVsU1tKuVA3tvSMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068209; c=relaxed/simple;
	bh=LT4J7kqhQFJnWAiKU+Uug3kreuyITuGN4yVYW1PlHqg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=svpgtEUJkX9Nnz5wX1Xh+bsVqZFsNj0OWo4f8uRK23Q+roNt3cqcwRC+aqZ/1jsr1VtlTwdRObA2gmWxOz8H7HWky29nSJ293ToXcZ0ES9/GcCPW/98mzQP91js8mMzFrb4I8d5DmGWq5k1Vy+RhC8gqCSM55tc602yet6+Z2JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GzIvZYIt; arc=fail smtp.client-ip=40.107.220.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GzIvZYIt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHtTPv6FjLei82xp9aWlpiiDJtqZdryYFQjXDxIL2cvPSUpVp+IqTMdjSZTpJKgN05gwbiN3OXTn/Imtqafcv5LJhx6UTwdV6gGHo09qzakzl3AhHZJpAiMJfrqGsjNSrJ7eQ/hvWNYNLD67p3r7oc6zKxlnK6Sd5/uKGNcTfa1MkMdvg785BOszKRPXGsG0YEbjGd6YcRunZSdWuEwFBSCWFxJahM1+fFj3LpiwdSz11JJE04t5ws/KvlZjTB0P/xjHhsibXtlj8Oc4mKAJpPLU9CINIypBv4U3mgpWrCIEoSFsXUY5Kd3kgj//SpSk6RFetAcom21P1qU6WgKHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVJcuzMT8FdFywKXwePw6C5/4QB3WqaS3XVbBW+LntQ=;
 b=LhYwbvNMzVDslmJupdR+txLN1F4j3GXBlhL1sSR4ns0NYNgHXctkFkN5O+aO/i+3vQXX5/YiDFFuE2aOByOQ1FbII12cTqcFu3FU8d2UAFvPXHKzBsKvNwteWT3BpIkG5DNFcVjBa6CtouOAfL0J8B3tB7XgX16q2ahri3krNSTM5B34xbsh/S065cBPv+i4Xh1HBtXtwFGS8Qrv0X00FSdWF2EAzVylmmAB1/pzPNkLSFw+opIk94bCLQHOxB5cm0Xi6i+ulDXn3IxdmGnTf7sHV+F7zIlzTb0QIfy6GRM5wFivg//8NJwTV35qNxfYE+TWzDAWBrgeEJ1vnAQ3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVJcuzMT8FdFywKXwePw6C5/4QB3WqaS3XVbBW+LntQ=;
 b=GzIvZYItKDJLcWdHWmGzciHP/utNHRvI3ksUHSQ20rl4GkxWqvhuOpzf3eWkv1FFAR5VT5mHLeC5rJX2mUymLq4FrsC/mOtxSs0rZaG0HQlKmcdzfU+n8zWe91AdlJBsn4oNcyMqPqv8RC5ohkVcJSCsWCE60KpIU7Vm+n5Q4Io=
Received: from MN2PR17CA0023.namprd17.prod.outlook.com (2603:10b6:208:15e::36)
 by CH3PR12MB9249.namprd12.prod.outlook.com (2603:10b6:610:1bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 11:23:24 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::11) by MN2PR17CA0023.outlook.office365.com
 (2603:10b6:208:15e::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29 via Frontend
 Transport; Thu, 30 May 2024 11:23:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 30 May 2024 11:23:23 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 May
 2024 06:23:21 -0500
From: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <lee@kernel.org>, <gregkh@linuxfoundation.org>,
	<arnd@arndb.de>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH 0/5] mfd: add amd side-band functionality
Date: Thu, 30 May 2024 11:23:02 +0000
Message-ID: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|CH3PR12MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: f9706365-0872-4b5c-8cb8-08dc809aeb1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WemmhZNACH6AFbvnrF4MGaPd3LpiU75BuqonLm7avmd5Bn7CmTJa1B+hecDZ?=
 =?us-ascii?Q?M0/3lR/4qP8RfNg0hZuV1kONKFv9t7BMeAFChHg3lJf0YsGRPenh5pYuRkLD?=
 =?us-ascii?Q?x58gKxR+JE+nrQZgcl9iV/jrOghAk4z4r1h6NMv2I3Q3QHIYPN6uQouRYD+v?=
 =?us-ascii?Q?4MU69uz4ah/0NvW3AIyvEE1R30TC1rDirNDQi4JijVk7aG5Jr8mmPeDdAHTN?=
 =?us-ascii?Q?twI4CUZv3uyYMJYeAKTpJR83vx0Z1dkb5xDk35g/5+yAwBNIp+80+MtcExoj?=
 =?us-ascii?Q?ttifrKzix6Wg59fZXiW5c1pxStI9+iBRdRRLnUk3EiL3Ln6Appe11WZxsnzp?=
 =?us-ascii?Q?B1QD9Tz5lWR8N+GQfLZlzaWIR5DK07SQGUHqGn+u2NnStUHzcubvuk++EQNe?=
 =?us-ascii?Q?DnigqaiPmJsj/P5vSeT89UMCtxU350AuwBx/9ZJfA2nTcahEoFMrvwvoL3Uv?=
 =?us-ascii?Q?MEiv4GmzWpBcctuqKhgtQu9P/PN1HooPaagtk3MFPi6r4OGwbW1BJUp651sq?=
 =?us-ascii?Q?FV5mKZ3k6keM0h6D09U95DEOG76zHiBCWcP9eybwn3dkScKN0COQxZGOWYU2?=
 =?us-ascii?Q?/C0r51u3pwHZSLVrvl5A4JDxQsmU50TixwsNXYseoFKdRyFN7+a1TA54NihX?=
 =?us-ascii?Q?uFoIjm35HDhjb3RCW1a5nZncPMskAg0Go3LJRxDAUQXF7iHFKubaRIZrzqQT?=
 =?us-ascii?Q?tLCRNGEhrJ7TiyJILXTBLErppMjpm9aFTPcvOXg66qL5I1FdiX8nCehuGhjf?=
 =?us-ascii?Q?jod8vhfODfJRM2LWHnjMVnXOTkZNUBuVjcWga9zwhG0zzFydpmBqT80/2vdV?=
 =?us-ascii?Q?j9sS1qfLQDRcTZPaXaIEp9KvnGwp6CwPd/EJpzjXlkfRkWdnleGa9GEoUG5v?=
 =?us-ascii?Q?AGT0HXdzr0JRiWEHv2/7GaWJ5Kl4E34dPEuTWgQC+hlZyI/ggZvwokgviZul?=
 =?us-ascii?Q?XDpvD6FwyYXPw3Cs9ikLzTCF+84G0YvVhVcVcyn1iRVfEgoNvK225hkzHya3?=
 =?us-ascii?Q?kr2u1dCTkWQE10wuq7ygLhgZzd7/5zmhDIyXXgo37ysBqQIJPTG3yusJZnMx?=
 =?us-ascii?Q?vlnmpwBGSjKGIy19e/EcOh6v/OAWPkrNd4m8uqrbjOr/oUpJMGheBecNAPcF?=
 =?us-ascii?Q?ao1V7C5NrXkoopATB0YADWduNzYlx5oRBF/8DPyKXP+Yi13DprKMqngOcUNj?=
 =?us-ascii?Q?jHiNceprvJ8yfIYhsf/9Jsn72j7kDNrPbaZNgYVO1+Wvfm/8oSinndcF+TJv?=
 =?us-ascii?Q?zGY0+jEP2JTjCF7SKOUp7bSx6ONYv+TkZIcMgkaxvHrb+0GM4xYUV3T4tv21?=
 =?us-ascii?Q?UEZfQgFuqQbaTnLw50vtl7vJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 11:23:23.7200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9706365-0872-4b5c-8cb8-08dc809aeb1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9249

From: Akshay Gupta <akshay.gupta@amd.com>

At present, sbrmi under hwmon subsystem is probed as an i2c 
driver and reports power.

However, APML interface defines few other protocols to support
OOB system management functionality.

This patchset the following
1. Based on hwmon maintainers feedback, move the i2c client
   probe and sbrmi core functionality to drivers/mfd/
2. Add an MFD cell, which probes the hwmon/sbrmi and continues to
   report power using the symbol exported by the mfd/sbrmi-core.
3. Convert i2c to regmap which provides multiple benefits
   over direct smbus APIs.
4. Register a misc device which provides 
    a. An ioctl interface through node /dev/sbrmiX
    b. Open-sourced and widely used https://github.com/amd/esmi_oob_library
       will continue to provide user-space programmable API for the following
      - Mailbox xfer (already defined in sbrmi_mailbox_xfer())
      - CPUID access
      - MCAMSR access

Akshay Gupta (5):
  hwmon/mfd sbrmi: Move core sbrmi from hwmon to MFD
  mfd: sbrmi: Add mfd cell to I2C probe to be used by hwmon
  mfd/hwmon sbrmi: Use regmap subsystem
  mfd: sbrmi: Clear sbrmi status register bit SwAlertSts
  mfd/hwmon: sbrmi: Add support for APML protocols

 drivers/hwmon/Kconfig         |   1 +
 drivers/hwmon/sbrmi.c         | 284 +++-----------------
 drivers/mfd/Kconfig           |   9 +-
 drivers/mfd/Makefile          |   2 +
 drivers/mfd/sbrmi-core.c      | 490 ++++++++++++++++++++++++++++++++++
 drivers/mfd/sbrmi-core.h      |  37 +++
 drivers/mfd/sbrmi-i2c.c       | 165 ++++++++++++
 include/linux/mfd/amd-sb.h    |  55 ++++
 include/uapi/linux/amd-apml.h |  74 +++++
 9 files changed, 871 insertions(+), 246 deletions(-)
 create mode 100644 drivers/mfd/sbrmi-core.c
 create mode 100644 drivers/mfd/sbrmi-core.h
 create mode 100644 drivers/mfd/sbrmi-i2c.c
 create mode 100644 include/linux/mfd/amd-sb.h
 create mode 100644 include/uapi/linux/amd-apml.h

-- 
2.25.1

