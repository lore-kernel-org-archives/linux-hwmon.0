Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079F03B6BF5;
	Mon, 22 Jun 2026 13:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136729; cv=fail; b=AmBu5jm4/agP2ngiJ8iE4BVKspWPuEVO9PnR5x+GMvMvIrUowVa24c5n3JmNfhLx8ERjTSTn2kyx2UK2SIIS4GNiE2uu2YHhkWwwub1l14V1zKGSz54zcLA7EO1RzX0tf1Dz0CbMYyhnmJxzcse0wtwDXa9KLryXAqV73afQkbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136729; c=relaxed/simple;
	bh=JHtf8XGp+bQSP5yjOBeWbIANN3tT+QBmLnb3orNESK8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G6KpKEjc84vP7tyf5qrkcc3RK2+CM4rz0LcKxtuc08jpuxbVoCcx3JoLL3k4SSFXip5xga3vRMpd8uq7/bytxNO/l/B53XzPLwFDVaUqIDsbi2GK/Q7pJYzg/+CVcsye/KLZcFWFfBdr33DoNJ8jf2yjluorJffKzs/vSBJI/lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wadHv/TL; arc=fail smtp.client-ip=40.93.198.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wadHv/TL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+5u0xFiJalfsjrJ9r/CF16cCOuzTtA9VXx4lwVuoAtCwBxz+rwLzgis7xbEhu7r7aHMLuTbXZJ4A589kF6/vowXdb2T4mGJdj12mbLtXdFVeA2TXIppw/egLbCWCAXk3/pKd9s+FkDkMxSS1qAHRTkk/Q2Cwyc586HUGsm1E4WhD9SfdMnYxrYBjr0uVGcwM3lqfvvNwjVAA+J/pvQoLaMBr2IGjXxz67kTQ9/xUvVOMjK9lHKSuFUpGNWpryM5aoG2O3fZAnhD+WPGzYu3dtRiEhAPSWUT3SMZtr3ggjsBkXJnYYJcO3eB+x+IFniz4pQ4v8j36VIqt3wEzAG/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lb1ZNU3p0Gijk2u48W8vbNiY+Uf1PDA0Lu0jaHxwAk=;
 b=kB1TcrH7lPM2WHrX6fVZzCx0sNaXctcduhyWY0+6WkpJYVMSzosjNaKIhJH/Fr/pqM+MMZuKQ97ja1m23Lk7TAkzHzDjCV8cXxp+8gOwuUF8v5jQ4OoQZg5ywNFFKkgTF9R6VvpOCXyIWlA+a3VnfCeCfbxfBB/df1siL8vxXtOHMc4udd2tiqZeGyGOg8DqRyoSRtSwgpl3EeI2qKQn3zYFW2JG5yWCf1q04LMjp7qGhf+H5KSUtk+crLINcwUpzLGmEE/guBVEB+81bXuhh9QrYZeJASAhikkCg1T0z3tfvc63/1l0I+FR5b9jfToz78zgr3lLp5pRh8HaU9yc0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lb1ZNU3p0Gijk2u48W8vbNiY+Uf1PDA0Lu0jaHxwAk=;
 b=wadHv/TLaZ7n2TxNYAHgknh1F+0tNWqS9CXEIAUMc1ohvZnEr9Sc7NXsF+ga4UFlcctJU7pE5unzX/DslN7rxBwsNDaaE1l5QOt7ReFY+ysNFyDVv+o2j4honoNsglHidrPzplOYJxow7dJcOMDnhxNQSw4Vhtzc6LeC+flgXIA=
Received: from SJ0PR13CA0103.namprd13.prod.outlook.com (2603:10b6:a03:2c5::18)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Mon, 22 Jun
 2026 13:58:42 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::88) by SJ0PR13CA0103.outlook.office365.com
 (2603:10b6:a03:2c5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Mon,
 22 Jun 2026 13:58:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 13:58:42 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 08:58:38 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v3 0/8] misc: amd-sbi: Refactor SBTSI driver with I3C support and ioctl interface
Date: Mon, 22 Jun 2026 19:28:13 +0530
Message-ID: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f3e0a3-acf0-478e-11b1-08ded0665e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	g0SQQwP8Qv7zNfAbtgaScb809/QMQ6aPwZdhZwijC/uTRVaE577A00s2VV+HIqqz/p7MjLPCVYNu7LGFJnD3QFbmHZwvegjk9ebT6Xwq4Fp/gG/lcuOraafNA1mnM9355/MxyZvtsJsqEEFmFJIhMVhK1il7uUl/CJtKsyx260cWqTedBIGYbHodwQW5LW10seSfYvNNJchDQvHH7nNDqXl1yw4aPEYEqWZunnIhcvrM6x9rMUDwkNqNtTlOiOYhTQxrzTLDJm/jnXV3piC7UDYiGNZtlDhKuJ8OLycXIbf6U54xpE0qz5vBQNOmxIgy5PfkAAVPX+kaFGWOtODhUMolSE4F5ECKm4E3gH7eQXkGKbK96qBJ9n5TeGbSVTgQUuWHOYp2p9lklH1EbGCSH3+YnUFZJL6q9yzhCifdL0W5dHWpVqjRaGiHRGnSwaThCc9v0EGBhYp6v4va+XRzYkvQvF8Pk/0jwCRAFiMkXaaFLEqxnEWtmonUHcQQIarsqKmaU0jt9GxwgiA5iOr+R2gWguXsAGwEUmLm55T+QYygb69WMMMrocL1AbVcM/SX/p7qMxAmJciAO5KlPLTJ8IVesOG3w25O/HaolFkEt3lTxglHr7I3j2RxELDjrjsGtQI6rddqUjso2rkEJdWDt+r5wprB7anoDvOQa0QX+wFt3TdLrra8Qi/J/vQ3ZqLKUoymDjiIzVZdYdjhX4GCmA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KohR66J49Ne1MZeo+NOG6xBQxobw/aAp2PDB2U5dk/3BshnTzuDO2nyb0VN703r51JYQH8BDWn4llbvzUQh1jfCBTB5hJMErtr/921pRw0L6Qqy75554E130XunZyncPA3N5IEN2Ir+dP+9PGpErTTfaR956nET+2oU1HyLvaiWC+RA09po3bzpKHyFlp2kUJ5jB7aF0KFsPS1AtMGu6ZPYPcDfMaElYqktybn7zGKoGe2fd7Vz2pG1qKyZCe+PSvdO/k0ciszv6X1U8xv7Pb/ZiHVV2x35QpkIM6LjEYEbzL8JDJgfQ3HUpEqT+JZoBQbT+HVkleklJMjLtb0T92MRqFSK/zBLE+lbjJg5S0NZjFbZ1r1hybrqCjQDkU7Y+XsGJmqvw6A/cR00as538yeWXMksEmViIIiYJAwQqorQOPgnjzIigNGohK75yzCkh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:58:42.1144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f3e0a3-acf0-478e-11b1-08ded0665e61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442

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
  misc: amd-sbi: Consolidate Common SBTSI Probe Path for I2C and I3C
  misc: amd-sbi: Add support for SB-TSI over I3C
  misc: amd-sbi: Add SBTSI ioctl register transfer interface
  hwmon: Add mutex protecting for sbtsi read/write through hwmon
  docs: misc: amd-sbi: Document SBTSI userspace interface

 Documentation/misc-devices/amd-sbi.rst |  68 ++++++++
 drivers/hwmon/Kconfig                  |   2 +-
 drivers/hwmon/sbtsi_temp.c             | 152 ++++++++---------
 drivers/misc/amd-sbi/Kconfig           |  13 ++
 drivers/misc/amd-sbi/Makefile          |   3 +
 drivers/misc/amd-sbi/tsi-core.c        | 202 ++++++++++++++++++++++
 drivers/misc/amd-sbi/tsi-core.h        |  26 +++
 drivers/misc/amd-sbi/tsi.c             | 224 +++++++++++++++++++++++++
 include/linux/misc/tsi.h               |  71 ++++++++
 include/uapi/misc/amd-apml.h           |  23 +++
 10 files changed, 702 insertions(+), 82 deletions(-)
 create mode 100644 drivers/misc/amd-sbi/tsi-core.c
 create mode 100644 drivers/misc/amd-sbi/tsi-core.h
 create mode 100644 drivers/misc/amd-sbi/tsi.c
 create mode 100644 include/linux/misc/tsi.h

-- 
2.34.1

