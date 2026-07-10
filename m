Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7933C52F;
	Fri, 10 Jul 2026 11:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682232; cv=fail; b=kX0//7tMGPVqFZU7kMcoJ1FY4LWBwZ2hgbzzyPz5F04LPI6dZY5HlZyV8UrQW7cOrKHlHjbGs+kFPSIib/L4FwkK6eu3cAyyJOaDzWlX/OEWaaHbBk8LYH+3wYEK8FEkYF9g/r/XHxkQDWWyUFTo+qL8YqrlcXy+ItgmjHZ4t9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682232; c=relaxed/simple;
	bh=l28jp3wauJDwClLq+tzTNHopcRVM5CyppI5eRrimdbA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V/niW962qkLeI3dIWYeevcMkIVgirHbw1CveE3aBfDpjy+YNuJCHyJU8q4FAEF+U9gjdYi0aYGDn7Hg6scI6Q4hZSABV/pHDZbqnylQEgypqJo5F/iDBY7jDRpGe9K3LeExclt6IwuUtCO/L+CcwRucl3ScX7DmRyYQbdgUyQrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4pPCAz4/; arc=fail smtp.client-ip=52.101.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4pPCAz4/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNZeyxFp/WNqAmmjpvnhbrPnM8nNUm4vRcheMxFNDuujIgZ6IX86GvypP3vWaacGRO5YGjUVwsVMul19JyegiUiqN0oMlahOBa7IGx1yDEYneJpoosu/Gb3Jmq2HKytAkUlAWPsOoHaLS2juYkW52cf6igjO7k+CG7p/j+frjJc2hiJfNZO4cSkMFsz9tOOiYDBfYzke+Y9L0VBvAa30ihrcFDe5XYa9GY7TR/rUK5frEDau9N8TFmA1ylomRwIIP9XFWkSmySyJ6GZx0TInc5aeYwbmkzF4Q9d9wOZqwP9pyleW7JFPQkgE/Ab95pSCogEWNxQbkC9kdCwmJ5CWow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ocuQbbTle4Mt89SR+N/y9OYm06RN6AQpWAGQm6082Y=;
 b=Bz/YI7OI4kRvsGsn4QhKQ5ywRga19/+yVZw8snttXKhKSM+JQSnIj4lQw5Z9/BVhN9/CsLFwU/M6KCSAPeNR3IDliuHRPrnA2z6gCIrP2D5h0gxSDMPhCL2v0+KJflnDSjVYXDHytLuYncmdjZbu4+O6VVBE81MXOSk5jICnEn3lEXwe75i3HWUPLST4WLdqz2zh/BO5x1O43yLxd1ci/yzq5Jq1zwc/6UdBdPP4lJSwKQ0fI4MFpw18j4CwD3lcV282czrtj2zwHV67YRT9lS8yytyQCzA14oXRZ1NMcUefeg+AaV9cfKusQXUw9adF/7AXHNFIMMwdDZQyh7+n1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ocuQbbTle4Mt89SR+N/y9OYm06RN6AQpWAGQm6082Y=;
 b=4pPCAz4/zpWGatVImy/E4dZXQ4IhQCCCypqeBE8aZkrLCPAK75tnOChIX4jbIuU6nvMFsnPC10EURAFNfIbNnwjrqeCwkjmiPKyYegAyx5yGjuP3eijWGfBBQtSyeSMO3eO0Ru59vqJgOuu98vJGEWAfbGnfjfAy1NtsH3vWN4I=
Received: from DS7PR03CA0120.namprd03.prod.outlook.com (2603:10b6:5:3b7::35)
 by DS7PR12MB6045.namprd12.prod.outlook.com (2603:10b6:8:86::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 11:17:05 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::9) by DS7PR03CA0120.outlook.office365.com
 (2603:10b6:5:3b7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 11:17:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 11:17:05 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 06:16:58 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v4 0/8] misc: amd-sbi: Refactor SBTSI driver with I3C support and ioctl interface
Date: Fri, 10 Jul 2026 16:46:34 +0530
Message-ID: <20260710111642.850022-1-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|DS7PR12MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 34aade14-2fe9-448c-605a-08dede74c5ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	P+Q91UFOpbkbcww9UrSEGnt4VcvQGDu/4mc4xPuMPM9rv3Gwuhw6zeAuomZqXOQQMu03rb4H1kBYiJkUEjS6RnZu0JAWZIxV1x1MyC92sjcm8rva7aMfb+dNfvYLwBzagtE8WJDJklA/qVdQSLTadhyCqHpG7WZJ4b6D7ht+5XfhjytNOn/lvGB0JBUHISaBAcGUY5RddQG0EMDozxyN0JL5/IdtS9VaylASSG/Bg89kwFkokJEIhB2IeNZyzpOGnaRJ3Xwdn4Q7MzaWwN5Ld+Nr1OFg+tEfypqIFvkis+/T47slzxMUuPBwftUwWYXVLa0GvGyXG7Rq/+1JCrvIOf5Bacj+NOV+0yrtBuZSdmwTnBnKMo/GpZ9h2BJ7aYlzN15zl5foYmDbV+GndVA292RHevmTDd4FEIhVq+1VFYtUX0qn4ktxrzQoePtrjksSpPXUATzw2hJVYKZF98fv4vrBnxpXhVyzEqAZNkbGyBzxthh1d57oA5W6ASaZSUhKLgLno5G/EwWnpSYLGh3RPXn34jEeqR+lmqjtm76t8lIj5HtRNF0W3sMByz63FX7Zocz+vhin3A+kckUTn/Ypt9qkxOYFpN2s3xnlgapJRqcWqFaGIvq+l/LpdsJImqiqrYjp30EE/Hkefl/hIvdlCvUYqwR3Lu44Ya416g6qfc+u+4lEzh0YHqYSmt7jqJdJOnFKakf94+Q6O1ktspwudQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H0fNgI84nQXs4ZTu98bBySVVLTPN53tMH4lcR16Cs1oC3IYbmM0RaArCWtuEwRnlZf6Q0jitqDzBG6TNkx4AetHBQkD4nlvEHz9Vi4y1uUZ9OZJfe9lbZY7v0c6EAsvsdLEwyf5JDYE7XEiD11S8vuwBgeEmRJYZJ0HpbH0fEYr216M+ySraZd7vqrSpbeVsSfNlIP+C84SD0ZGolpVw67IYmU9joHft5bU7+/eXQm7072TBuytXlpnhxx7MPRkyytYGbbbxFG07GB8Uz+dljahFLVAwscNfwEi+yl4I/shxSQjZlcidoj8CiPQBke/+ATk9hqJycNN78XMNBdvyUn+M5fbWinpQikuHMnxu5yhoGNjZqOnnUTCU5OLVh/4E0IyJGs6kjbyPVC0f3l/+OBdeRgkc1YTv+PkMgwq0vsL91YYOae1/vu9y4CAq7/GT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 11:17:05.0637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34aade14-2fe9-448c-605a-08dede74c5ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6045

This series refactors the AMD SB-TSI (Side-Band Temperature Sensor
Interface) driver by moving the core from the hwmon subsystem into the
drivers/misc/amd-sbi framework, alongside the existing SB-RMI driver.
Registers an auxiliary device keeping hwmon sensors functionality intact. 

Background:
The SB-TSI driver currently lives under drivers/hwmon/sbtsi_temp.c and
is limited to exposing temperature readings via the hwmon interface.
As AMD platforms evolve, SB-TSI access is required from multiple
consumers (hwmon, userspace via ioctl, I3C-attached devices), making
the hwmon-only placement insufficient.

This series restructures the driver into a layered design:

  - tsi-core.c   : core register access and ioctl/miscdevice support
  - tsi.c        : I2C/I3C probe and glue
  - sbtsi_temp.c : hwmon sensor layer built on top of the core using aux device

Changes in this series:
1. Move core SBTSI driver probe from drivers/hwmon into drivers/misc/amd-sbi,
   and registering an auxiliary device in core for hwmon subsystem probing

2. Register order follows the device ReadOrder bit so both parts latch atomically;
   limit registers (temp / temp1_max / temp1_min) use the same helpers instead of
   separate SMBus calls.

3. Move sbtsi register transfer to core abstraction to decouple the hwmon sensor
   driver from the underlying bus transport. Preparing for I3C support in a
   subsequent patch

4. Refactor I2C probe common functionality to new common helper function to prepare
   for I3C support

5. Extend the driver to support SB-TSI over I3C in addition to I2C.
   Both buses share the same core read/write path via sbtsi_xfer();
   the is_i3c flag selects the underlying transport at probe time.
   Backward compatibility with existing I2C deployments is maintained.

6. Add a miscdevice (/dev/sbtsi-<addr>) and an ioctl interface
   (SBTSI_IOCTL_REG_XFER_CMD) that allows root userspace to perform
   SB-TSI register read/write operations through the APML protocol,
   consistent with the existing SBRMI ioctl interface.

7. Add mutex for SBTSI read/write in hwmon to prevent race condition with IOCTL. 

8. Document the new SBTSI miscdevice and its ioctl in
   Documentation/misc-devices/amd-sbi.rst.

Testing:
Tested on AMD Genoa/Turin/Venice BMC platforms with both I2C and I3C-attached
SB-TSI targets. hwmon sysfs attributes (tempX_input, tempX_max, etc.)
and ioctl register transfers verified against hardware.

Prathima (8):
  hwmon/misc: amd-sbi: Move core sbtsi support from hwmon to misc
  hwmon: sbtsi_temp: Refactor temperature register access into helpers
  hwmon/misc: amd-sbi: Move sbtsi register transfer to core abstraction
  misc: amd-sbi: Consolidate Common SBTSI Probe Path
  misc: amd-sbi: Add support for SB-TSI over I3C
  misc: amd-sbi: Add SBTSI ioctl register transfer interface
  hwmon: Add mutex protecting for sbtsi read/write through hwmon
  docs: misc: amd-sbi: Document SBTSI userspace interface

 Documentation/misc-devices/amd-sbi.rst |  74 ++++++++
 drivers/hwmon/Kconfig                  |   2 +-
 drivers/hwmon/sbtsi_temp.c             | 152 ++++++++--------
 drivers/misc/amd-sbi/Kconfig           |  13 ++
 drivers/misc/amd-sbi/Makefile          |   3 +
 drivers/misc/amd-sbi/tsi-core.c        | 207 ++++++++++++++++++++++
 drivers/misc/amd-sbi/tsi-core.h        |  29 +++
 drivers/misc/amd-sbi/tsi.c             | 234 +++++++++++++++++++++++++
 include/linux/misc/tsi.h               |  72 ++++++++
 include/uapi/misc/amd-apml.h           |  23 +++
 10 files changed, 727 insertions(+), 82 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/tsi-core.c
 create mode 100644 drivers/misc/amd-sbi/tsi-core.h
 create mode 100644 drivers/misc/amd-sbi/tsi.c
 create mode 100644 include/linux/misc/tsi.h

-- 
2.34.1

