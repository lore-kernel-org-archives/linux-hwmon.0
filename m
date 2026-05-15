Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E9747F2CA;
	Fri, 15 May 2026 13:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852737; cv=fail; b=Xn74xsggSyEVmvWsoL3BiMvd0y1mlMFPK59uNm1WlRj+Hy4qgaOkz8y49YICnHPHpmlUozTZ6RzBITcCIDCL0HYO6l5CarI81YwVS+VPdOcLE1uKQw1TTO8pmYYWmrKWwi5fHfpGR5lHFmB1sn8AQVX0YWyweHqYHvnwIz7zp/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852737; c=relaxed/simple;
	bh=GAhuiNaMgdWJkc3MfLbXb8E+BKkC3SKavSZt0GPcvDc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QJgkc8YHI5UNLz1TQSQa6Pr3qjIq9MMnulIoJGaOP79C4wxORq2PRvlWLbZPzwzl2DLdhYkKteu+xafSNBaB/zGxExxzK/MPVYaTSsRNy3a/wyyS4wQboK8IgCuvlvZ317ks84THSmUIuVrqLen71nSmss433KdtnnBc6B4DBgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=d4w20+69; arc=fail smtp.client-ip=52.101.201.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="d4w20+69"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBQ73skNVX16eyJprEbhZLaFkYbYFyZnNalyXA2POQ4nkBx1mUEqkHQixiuMs5sqyXFOOcovREGBSagcS45SPdWJw5NecFjqF0SPbgwwtBQ722fkN2MMn7nh8WbLzq11eXKHeRAlNaHRMXUS2RDEvZLVEYmF8Rt14Dl+Iku3w8lKV8K3dylTzpMoYUwoEAMYRo7bWVsf3qddVyk1TNxwc57eTZmD/b7lW4niKnYqg29X24oYhyid88Fz8ImDcar8JszOBhL+tmRLtMPqFY2IqG+wOdFEdEblFRn5JvSyYQANT5O4XGzhqUFsxfJOQ4cRLM76samBc+IrYN7Nc6FVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9PhJI+uUggX4vTboLz2Cxvp5UvUmmgRkAG48d7trYM=;
 b=A8caRam+V3tRQAT7KrRgq5ABAvgB9KVs6uuE5n4U5/GRNiga/TalVYSkNiT2wQmfXfeJWbl5+rkSy73nSWtbRihB9atFLQsD874JQxys6LAX9bhljjCTBpLbhsmB+SLEudDL7NKX/8lSfV2Wf6ulKl3eXnwJLWyX6ACoeYBzo6bSXZFxk3wPau/nwNPbZVdBr47Ncpz65W1Y7Qpm7SBauzFjAUUOXDMBG9LB4JhvaRoLdNBGvX6Yosu0Mketha4NqT0X88TGDd2zQlH3QGTIbiK2iS08iKorSg8g5ekwigTm3ljaPrvjnc5cdl09B5CWaCaZeNZHw0r8sJS5Gxzb+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9PhJI+uUggX4vTboLz2Cxvp5UvUmmgRkAG48d7trYM=;
 b=d4w20+695jnGLVATXm2cPCHTaScwz8OV6FRZhYOifKJY2OswaxLAw0f3p7jgJ35b6nLgMWi824Mb4zEshrezEXbOgutMvd3aLj9OhDeY8da4wHLFGGXaciCoP9+s8rv7y7RPZKdS0M/QlrA6HIlhutDmXnruttm3ZKK3mBuiQfk=
Received: from BL1PR13CA0430.namprd13.prod.outlook.com (2603:10b6:208:2c3::15)
 by IA1PR12MB6483.namprd12.prod.outlook.com (2603:10b6:208:3a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 13:45:29 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::78) by BL1PR13CA0430.outlook.office365.com
 (2603:10b6:208:2c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Fri, 15
 May 2026 13:45:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 13:45:29 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 15 May
 2026 08:45:24 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<naveenkrishna.chatradhi@amd.com>, <Prathima.Lk@amd.com>,
	<Anand.Umarji@amd.com>, <Kevin.Tung@quantatw.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v2 0/6] misc: amd-sbi: Refactor SBTSI driver with I3C support and ioctl interface
Date: Fri, 15 May 2026 19:15:00 +0530
Message-ID: <20260515134506.397649-1-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|IA1PR12MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a0b482-f88d-46cb-9e5a-08deb2883a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	G8JRPqVK6igVjxOe+r2EYbjEXscNvldIx2dXjM4Zr64ipsvWZlBi2pV1xRKynXrUUUG6nWFAVbLxBLBBBfyzyZXPBCpPlFgOttpiEtCBkA/5Oxg3u0wY9AEv/Qz4DPfxSNHj4EVE8alGIvlYMVp5KxzsmGfNIdZBjsSLGmz5hYs4lWmhyXp4ofj3EescnS//r5Amka53tca9hXL5Hy5m6Y0HtS86fnBMuDsnfNsoP6zlmivCWm2Kd8Xup/bQUZhkK7iPNkxS0Am90yqIHjkxM0/CHOjgbLmoHJVp562a6JpY+SSmD/9I9OEBRD3E0MJ7/qh3/ttJynGJDD1d+HwG+1vNUkEs8qlpInRbtcG4Y6O2TuFlVAQPF55Ql9YeLcl3A3pazgOPdCQxFPjQttrtzUgQmvEWqJ6rc9St857lmPtKq71j4V+E6MACMceE7NwfjF0JeFJ16kgB9xLDv8ZUFQ9asq5pVOwu7tU55zRZTYO0DsUz07CAadPXaVhmhwGwl4cuY53BZ5ubwMIrVYVEALZyPTFph7v5HMOaiTE5dOt8dCXLm2j7hhrr8h/CmtFm5M45/DxEMuO7bnSqdz+gHYF+ODUPjNuPAhJ+iPzsfiv9La1Ol5AZI/ZeFe6VDWhyaYmMY9t+8trTxBq5vejdFHZ6porRmi/qRznKv3vWDgbIoWQ3TlB3FXcvyTBLNQKlH/o9LYSWVEbRJa3rR0uXioYmMOAgSFzACz4mWAFIeXs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mS0eOgl2WGkFrGeQ9vvIIJKViaceV51GTgyQCaRalTzi+dWu1trS/hmPe0+RMP/CplfRiI5hlz1obF9wzxsBK1scXnwz1yoLFqHGai4wx/wiJLqK4kAljeV9KaqFghsPZ4xCy9vGRCh1eYJ3/qVi2Vops6u5MgUKFO0oLURSH5mNTJrBVDV4+rvpKFRtO8/cfbQzjRkryTZatdfgPlavjYDx7zPVn37a6or1H2OoSq7aW9W5A0faW88CqfiWVCZXLutVEBMvqoEtI8OvMslyobiXVLVl2DudjxMtqqr8S6InXnxBdEldhOQIn04hBDDWLxSJEqkvqaGaW0lJRBtP1KW6OYZ8X9u+rPW4CtsRqzGonKNv4iCjJEDTRiCwN/SCAEMLjyZI1DmsarymDrJ7d3WvAdRPIynWH8F8PmAHuEzhFDYR7e2M5Q3B4IlpO8dz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:45:29.3731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a0b482-f88d-46cb-9e5a-08deb2883a27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6483

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

4. Extend the driver to support SB-TSI over I3C in addition to I2C.
   Both buses share the same core read/write path via sbtsi_xfer();
   the is_i3c flag selects the underlying transport at probe time.
   Backward compatibility with existing I2C deployments is maintained.

5. Add a miscdevice (/dev/sbtsi-<addr>) and an ioctl interface
   (SBTSI_IOCTL_REG_XFER_CMD) that allows root userspace to perform
   SB-TSI register read/write operations through the APML protocol,
   consistent with the existing SBRMI ioctl interface.

6. Document the new SBTSI miscdevice and its ioctl in
   Documentation/misc-devices/amd-sbi.rst.

Testing:
Tested on AMD Genoa/Turin/Venice BMC platforms with both I2C and I3C-attached
SB-TSI targets. hwmon sysfs attributes (tempX_input, tempX_max, etc.)
and ioctl register transfers verified against hardware.

Prathima (6):
  hwmon/misc: amd-sbi: Move core sbtsi support from hwmon to misc
  hwmon: sbtsi_temp: Refactor temperature register access into helpers
  hwmon/misc: amd-sbi: Move sbtsi register transfer to core abstraction
  misc: amd-sbi: Add support for SB-TSI over I3C
  misc: amd-sbi: Add SBTSI ioctl register transfer interface
  docs: misc: amd-sbi: Document SBTSI userspace interface

 Documentation/misc-devices/amd-sbi.rst |  64 ++++++++
 drivers/hwmon/Kconfig                  |   2 +-
 drivers/hwmon/sbtsi_temp.c             | 158 ++++++++++----------
 drivers/misc/amd-sbi/Kconfig           |  13 ++
 drivers/misc/amd-sbi/Makefile          |   3 +
 drivers/misc/amd-sbi/tsi-core.c        | 148 ++++++++++++++++++
 drivers/misc/amd-sbi/tsi-core.h        |  15 ++
 drivers/misc/amd-sbi/tsi.c             | 198 +++++++++++++++++++++++++
 include/linux/misc/tsi.h               |  63 ++++++++
 include/uapi/misc/amd-apml.h           |  23 +++
 10 files changed, 604 insertions(+), 83 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/tsi-core.c
 create mode 100644 drivers/misc/amd-sbi/tsi-core.h
 create mode 100644 drivers/misc/amd-sbi/tsi.c
 create mode 100644 include/linux/misc/tsi.h

-- 
2.34.1

