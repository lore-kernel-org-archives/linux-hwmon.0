Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330CC39DBE0;
	Mon, 23 Mar 2026 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264121; cv=fail; b=g5jKcXF8+GfQ9PMUOAfd2+bUZLkty0J4cMCgzG4cifygVg8azBYHGMWgE595O33KlOUPGc5WiObN4Ln8MN08aWyWtiRYkebxcvgaqBJx+a/0dRxy8uPS2YrQ+A8z6/Kkjge/YD4ptkRj5JtgOvHFP/BbABf11HABT/FNsBLTyLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264121; c=relaxed/simple;
	bh=bBfEOox3AOZexR2NTfifuwW5hpIcgfiIsJkKWtCxM/s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aivTUiB4F6CSZXgAE9cp/8MGsHyQGfTEWHnzC/0fSS4TZKc7PvQh7/rHX127C6/ERsjRW0lPVVID4JG8/zzCROqHWLD2ZDjGizxvNqzcHsLwqJIyKHWaYhtHkAsov0PoIsGY3InMX8d19SRRlzoRLBydUw/v4TF1qajcY7vJVEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uA/2N7V0; arc=fail smtp.client-ip=52.101.48.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uA/2N7V0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lmbpjo+AcPFDPvhwmBe7mYWLBlUVALZ4p03yf9RV1ald/Bc6qPwQFjFK5G12tBeRd3POGQIzueppLXp8hnWXMEYLGJmcU+gbXmDdUWSv9fY5d1DJAyHxXvNAXfcJSfdY+qQlv7LIVnFkiKNrBsJ5SON8L00ZboL5Z700A8WXzOoduvo2hipXUp0K205wfuqxezvmK36aNBQagk0gxJ6Fvwnmyf9wVXnngAxrkl05JZvBEmKYgQZaRBlK9RARKMb+0ExXM85a2qo/gXJDmK5VkMq1AUdvJR7hVYSQDss/oULbAbkn3UDKf656OStvUBGM6/wIxzeppiQ8U4PtYxUGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMXkDL3to6K0bIKqbg1bXf8Y9pSK6Bw0Bkde0wWXXNQ=;
 b=LP6Blq74fe+gDslPizM5ipj8aMYFWH11e8FlUF0DDUQe5eWpJyPeUySFLDTL+Urx6J/zRD5fqN1MFdKBEPPHA13CYa9vPOMLpblAB7zDQITrVGhVNHSPqWH9EQhhJoWLL5qFgJHOyvbUjGU84Ev0YmrMY4U6kAiwtjSheL0hxxpLrRSsGhxfsC9w4DyCtLnSVRW4Dusf0Wx8IzlSl0fiyhp/H4YvAxittunJxEVVt5PPcaMu/Xlf7dTkzk9Dy2oIoOLuaS/ConXY6CsAz3rRDQ9dpi0QUBizjEzvAlKgCUnZb5slHckzXE1AxRqchtuYEZZgvBRcGJ/ZUL8O5HV6Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMXkDL3to6K0bIKqbg1bXf8Y9pSK6Bw0Bkde0wWXXNQ=;
 b=uA/2N7V06yIyE2n9PC2kSh+gOlGFHh9YFfTQG1I5odDCiZj/K5wAVRYOt0Al+7BYbwfdKs9tLTC/I9rUZ8R5O5/RVC+jPlrrfRwmzZbv3bjQyy8gYcHJQaNrGbzKZdioMkg6pRlTUx6Y2M8g9r1w0W8Nj4R6YphPJLb6Tmy4DlU=
Received: from MN2PR08CA0023.namprd08.prod.outlook.com (2603:10b6:208:239::28)
 by SA3PR12MB7921.namprd12.prod.outlook.com (2603:10b6:806:320::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Mon, 23 Mar
 2026 11:08:37 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::45) by MN2PR08CA0023.outlook.office365.com
 (2603:10b6:208:239::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 11:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 11:08:36 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 06:08:32 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<Prathima.Lk@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<Anand.Umarji@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <kunyi@google.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v1 0/6] misc: amd-sbi: Refactor SBTSI driver with I3C support and ioctl interface
Date: Mon, 23 Mar 2026 16:38:05 +0530
Message-ID: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb08.amd.com
 (10.181.42.217)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|SA3PR12MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ccd610-7d68-4c0f-c45d-08de88cc87e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	DNmG52uK8gvj6w2Saa6dF91n8T03uyfiJ0IJu9DvKjG605rcfUy2IAqZ7pL4Q1aeCYvKSsqAPPUUmdpXLcF3tJ4S62neGZjI8rppXCyKJCDs/9mTaYjwvwUjSE9pWcdbPces2j0kW+qgfICp7a8HTBM/UfXbUdCMoVEY93dKiLZoXIa+Wer++NOkMRtBwPowM6ObN0ndIf0lKwxA50nzR1nzPk5mPz7qAMbr0nWQiUhpZIWXdzIJJfTWDRypxtpW6DtY6YxGSEBaE5ZvLfCEwtWIDataMOUaTbh4RX5DgqB0XKC/RFkQI/COtQ/UmQhfcSszwqLC4Flvc20Gx1oceMozod1UcPl4E629BZvUP4CiOe8I+9hZhR32rrKv5esGVsmvycb+rNPaV0M8S1p2RaLhCADs75qd6icamYVR3Cb0r2ckw2gt6UCylfGXCZLAuuNyiQNHWUTNE7A2C4ufCDSzSH4daUNS00HLMc1mD3lK8rymQxjzV6fVnZ25JYekTKsnNUTpdo8DCQevvg26ca2tDkrrH67MOQwmf6zWZSx9QhauEfRw3PzhDMsUETXwaUyPodTYHmTiEHQByEaAaGJMCcmEMNGwUD8sreVo+hNndOoN9kOELuPOOfPHVkM6rq9JCwAujTDLjlcxuqLN6hQjy/3EkctTVnKBt303T9QEfvZTGlOABnNuicsctcrRW2O1/swAUQxPk62JuiluVjVULAVj3ACFF9wy39QvL5wGHWFmt3e52eey6xR1mud+ecNCuBWWR1Ev+Vb+uu2tUg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	624zbFgaaohBlzNIwhKVDn2/lrWprxMFHTFGl1KCDTd2BfaJYRFPdjaG1oCPg6O9SplvIPDdMpbVJRtObYKpHaV7E9++2HWLk3Q846Y4EJvhBfcoteWYPxsLXnFLvW8BLSjCfLKZiC+qG5ubrmozmrhIhhaXQKbbaIkRFziKYxQjNzTJ7k+3Ez5QfVvLgLIhjjh9TFZkS9reN+xCwEmOpwAVH3WiKx8XQc2AQ0bExdEjPY3d+rsxK7TH12IG8oRyy2Ka6DdNiPZCTkTu2FjnS2utX7P+fQeG6ox+0Hgh39xfAKR4m7uwYfbfWK7AxRoI1Mh3SkA18TSnZYMn3J0LTlAUqdjWiOrwkyBEyrI7FzDGY7zNKGYYYpjjK6Z4LM3YIp2VqkJEACToKJoC+qjnrykQ2g/TKMa9XS/JxHzPk6KJor0ISMMsUq8WD6802TWm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:08:36.7455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ccd610-7d68-4c0f-c45d-08de88cc87e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7921

This series refactors the AMD SB-TSI (Side-Band Temperature Sensor
Interface) driver by moving it from the hwmon subsystem into the
drivers/misc/amd-sbi framework, alongside the existing SB-RMI driver.

Background:
The SB-TSI driver currently lives under drivers/hwmon/sbtsi_temp.c and
is limited to exposing temperature readings via the hwmon interface.
As AMD platforms evolve, SB-TSI access is required from multiple
consumers (hwmon, userspace via ioctl, I3C-attached devices), making
the hwmon-only placement insufficient.

This series restructures the driver into a layered design:

  - tsi-core.c  : core register access and ioctl/miscdevice support
  - tsi-hwmon.c : hwmon sensor layer built on top of the core
  - tsi.c       : I2C/I3C probe and glue

Changes in this series:
1. Move core SBTSI driver from drivers/hwmon into drivers/misc/amd-sbi,
   renaming sbtsi_temp.c -> sbtsi.c and wiring it into the amd-sbi
   Kconfig/Makefile. The hwmon probe entry point is preserved so
   existing device-tree bindings and hwmon consumers are unaffected.

2. Update the Kconfig entry to explicitly state that the driver targets
   BMC-side I2C/I3C controllers (ARM/ARM64), avoiding accidental
   enablement on non-BMC targets.

3. Split the hwmon sensor handling (sysfs attributes, hwmon_chip_info)
   into tsi-hwmon.c so the core transport layer is not entangled with
   hwmon internals, making future interface additions cleaner.

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

Akshay Gupta (1):
  misc: amd-sbi: Update SBTSI Kconfig to clarify this is BMC driver

Prathima (5):
  hwmon/misc: amd-sbi: Move core SBTSI support from hwmon to misc
  misc: amd-sbi: Split SBTSI hwmon sensor handling into a separate
    entity
  misc: amd-sbi: Add support for SB-TSI over I3C
  misc: amd-sbi: Add SBTSI ioctl register transfer interface
  docs: misc: amd-sbi: Document SBTSI userspace interface

 Documentation/misc-devices/amd-sbi.rst |  18 ++
 drivers/hwmon/Kconfig                  |  10 -
 drivers/hwmon/Makefile                 |   1 -
 drivers/hwmon/sbtsi_temp.c             | 250 -------------------------
 drivers/misc/amd-sbi/Kconfig           |  24 +++
 drivers/misc/amd-sbi/Makefile          |   4 +
 drivers/misc/amd-sbi/tsi-core.c        | 146 +++++++++++++++
 drivers/misc/amd-sbi/tsi-core.h        |  44 +++++
 drivers/misc/amd-sbi/tsi-hwmon.c       | 198 ++++++++++++++++++++
 drivers/misc/amd-sbi/tsi.c             | 162 ++++++++++++++++
 include/uapi/misc/amd-apml.h           |  23 +++
 11 files changed, 619 insertions(+), 261 deletions(-)
 delete mode 100644 drivers/hwmon/sbtsi_temp.c
 create mode 100644 drivers/misc/amd-sbi/tsi-core.c
 create mode 100644 drivers/misc/amd-sbi/tsi-core.h
 create mode 100644 drivers/misc/amd-sbi/tsi-hwmon.c
 create mode 100644 drivers/misc/amd-sbi/tsi.c

-- 
2.34.1

