Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96357187866
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2024 07:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726124954; cv=fail; b=UCnxFYOMkuuEtzlchkHiz603FyJZdi1/btFHdwAn7JDacwId7FzdEguw3o6sIPvGCwWC89OgXIGECD9yy/mrnH7KLRQYm/pu4foqnEUXveKxYH1WREXt67UDCZOQelxL++jAm5vq0VZWdJ3QKq3JcK+942aB4auWXr19O940q5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726124954; c=relaxed/simple;
	bh=2xph8UGRIWF3O4IhlJqMmHD+BLPycU5PIS1Qz+s5Eag=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iqz3PEq5ifka2EOschcd0a+V9EDSNMulW7P/gHhedUY01ysrxfiWzA+m02cnDDMvzT6aSYIZfSUsY3oUI5ausfSMNIlznm709que8kk2l5hyxKYDM9BisJQmsP2jehceHXmPMEO9IA9pk/9R9KN/40AtR2v+Tc8Y1C+rN1W/gTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xAoBbRUV; arc=fail smtp.client-ip=40.107.223.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xAoBbRUV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdWRVrwBnMtnvY5xsA9pJE6o/pTiWthtpM3AImwAGNJAxdnZnYAODhMgVemQK5lKwxbpx/UvFBHcTAQYDoyErr3wQgekm0PMcOyzR3fzc0HSkyqlnkwZC1ZFE/ryNPWBTYY7Oqe3e2IxlBQfFyUHowNqXoBr2BUzQLvr2PBGIJ54UA6TQ+2Bx6VCa9rLZbKzIo+UPU7CGmDh8FENBn9VtCsAy6/6s0bkOVUVkpUcxtCu5GzsKg9cJ7NGgaVAdSWHFWSeIMl0fA9Hdu4hcaVbCnONfUPH3K8MXq0mp6Rl3wVRlSIETBIqNmQMWwHv5hJGnQHjw28OF+TXRM1AkbVgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4DxOb0LYVX7FhcTgGwhKYild4t5rHRoV/imQJTDYjg=;
 b=BDGgAnq1i2qFUIoo+Z9F509M/FBOQ4JfDeNZD/KYdYnTc2Lm01QyQFrInbHliAYUC9dmxI0ZTsdkE5o5KzURPT5GlYc4tC2Zwl5khXt4xb19w62CIraQpfzYSAesa7jyZPln2UQ+A8T8mNMgtQn69hRlQ2XTghv8H/6e3uLuIvN9zrPfibIn0B4xmkOAGdrM5HDwYRFRDnXWxXwBpTkuHf+2ecHxQzgVrYebwhi8oPFXlPJlo2W6TXXOjhdFA8fkDwvZtQgrBdf5vGs4elCZ4XB8426rVh1kw3b+4MuSlaC1Amh02erKsmC+nCOToRZbQAyscJFTouKw3PulNGt7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4DxOb0LYVX7FhcTgGwhKYild4t5rHRoV/imQJTDYjg=;
 b=xAoBbRUVRQYV2x6dpg7FGHygRnqBIqcXDJUBRG+q5CndkhroO85kiD9TREm1uNaxnpb24vgE7zlWizhjkzB3hK4GNyA4qyA0x/zhDpqQKac8l2kwCkzlSMXoa9nqiLGEZQGP54ZsvjeeLGOoDKbSnuMTs+9TRvufbbUAELfUbdI=
Received: from BY3PR03CA0009.namprd03.prod.outlook.com (2603:10b6:a03:39a::14)
 by BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 07:09:08 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::9b) by BY3PR03CA0009.outlook.office365.com
 (2603:10b6:a03:39a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Thu, 12 Sep 2024 07:09:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 12 Sep 2024 07:09:08 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Sep
 2024 02:09:03 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<naveenkrishna.chatradhi@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v4 9/9] misc: amd-sbi: Add document for AMD SB IOCTL description
Date: Thu, 12 Sep 2024 07:08:10 +0000
Message-ID: <20240912070810.1644621-10-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912070810.1644621-1-akshay.gupta@amd.com>
References: <20240912070810.1644621-1-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|BY5PR12MB4130:EE_
X-MS-Office365-Filtering-Correlation-Id: 383daf75-47d5-4ab2-8501-08dcd2f9cbbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZCOEzLO+6shFbOm2eYBi1Vj+vn4+CfXrGJVDIw7mYkWzdd5cCmJv5aozXO+Z?=
 =?us-ascii?Q?WLvP/9NQ7Xw5d9Wqr2wIJbzR2sGqy/+hLpN1FRkjLZS9U4xzb0k0HO9eBF7E?=
 =?us-ascii?Q?Wo2X9z0PuereYe6Xtha8obXkUmipMOHo0plDctQJlfGCnsjHiz4cH9FHe68U?=
 =?us-ascii?Q?aaBrVi+QA30bZokh7QwVMkJC4gaV3As064pgmP1FR1AZ7KFZxSmA0Np6gkkO?=
 =?us-ascii?Q?Qap1veWs0QgicMUcuZr9BUFa5RpRs90WZG6ujdLRUT62lQ0bGIlQxSICMp6R?=
 =?us-ascii?Q?2iTz+D7bPGH11zcfAQ+KajmTqJIbKmLSSHSEBr2Cwwz1WFikfoB+ghgv1qbk?=
 =?us-ascii?Q?jGike9CVwNqTtysRQEPTEz6M5q0OmWm3Ri+Wa/pwEYiuV/+hyxgjJjmqw+pF?=
 =?us-ascii?Q?7WTDTmi5QDoHLbH2QF3ZNs0eVn7MxPdC4usLe1lpDoI++CpTroMo/QMAExNO?=
 =?us-ascii?Q?xzetqDKTV0U6cldsyC3uXystAratgMX80Kvk+HSaw928T5OkO+Vpp8aC2lGe?=
 =?us-ascii?Q?i/Q6XUqJVWn2DObHQzIuYqPpdoLAQCW3r6fE9z7g1CEN9xE91DaYxEcBFbBk?=
 =?us-ascii?Q?/Khs6dYxCA+4LhlvE+sivXLmoZDrwrq4huwGuu7M79UqP8GBk5ivLcmUhyX4?=
 =?us-ascii?Q?G7vGNDQwFSTVUvuaHQEtMczPNNvlOOppVEqjKKmA2X/k6vVBaxFR13aO+P6T?=
 =?us-ascii?Q?A/qDw/upLlnqiL9kAOoLfB8v91f5Uzo6LOHLoWVjz2ad9Vfxkfy7QfporT3P?=
 =?us-ascii?Q?nwW/7CZAlEbPDQiMRk4K54Tnb6p/0XcR+RQ+cKZuYI86FdviZBhUZ2jFlrHn?=
 =?us-ascii?Q?xb9A9L51/5t09VQBlFOmKjqed0NrCLRfeUxJQrzj+etS27R1CVktWML7j0uu?=
 =?us-ascii?Q?U9XLJicnBoUmqy5TSgUGGyfRXOhemSWzA8BIQ2zVabgmfKEqwtSvY6YzDeDu?=
 =?us-ascii?Q?nVR5hC/Aqclg8qP+c4HQr8WPKlui54Ujglpjy621oFBuDeMhXUceDbHznmsG?=
 =?us-ascii?Q?+U5iXh4aPeim252cqZ+aQOZF3a5o2mGvKBZgwseH/NyoZH+O1uXP7J/IuUnn?=
 =?us-ascii?Q?UiKJdSypwuE1Gr3kWsFYCLoC8ul9A6irfvVQcaFjRMMhziibaId0EToXQkLW?=
 =?us-ascii?Q?jpeqmOviGgoc7sok8Ph07QWxJ/pYYUHaF9LP/BqrsWH3oKpsELukPABeYSeJ?=
 =?us-ascii?Q?VAeJfvKAW5KAYnBxKuPlQub3I2tF//JUjcbD/n31u627O7p1EA19NZqaI/ER?=
 =?us-ascii?Q?NKbE6q1oyQpARbmNbV1eybNVXsuRCPOTzM58lb+2Hxc7ZzgGYCdPTL6MYQp+?=
 =?us-ascii?Q?9hPSfP3cPveF4ANLdDAirRBL/2KaXxR+D0vv7d7olhtuEx59VfGwsyMusc7l?=
 =?us-ascii?Q?gAPyoLJ1V8AEKKDSMu7qTIoav4FKS2Tr3+jE5TNkHEMfnSFvjQXjqZ7qgV4v?=
 =?us-ascii?Q?aVvN3E4m1JGrYA0v3LUFyXigAS0qynEYLPmIWWeDvpJNTY8p49miDA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 07:09:08.5065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 383daf75-47d5-4ab2-8501-08dcd2f9cbbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4130

- This document provide AMD side band IOCTL description defined
  for APML and its usage.
  Multiple AMD custom protocols defined for side band system
  management uses this IOCTL.
  User space C-APIs are made available by esmi_oob_library, hosted at
  https://github.com/amd/esmi_oob_library which is provided by the E-SMS
  project https://www.amd.com/en/developer/e-sms.html.

Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v2:
- Address the review comments 

Changes since v2:
- update the MACROS name as per feedback

Changes since v1:
- New patch

 Documentation/misc-devices/amd-sbi.rst | 84 ++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/misc-devices/amd-sbi.rst

diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-devices/amd-sbi.rst
new file mode 100644
index 000000000000..6e2ba6fa323a
--- /dev/null
+++ b/Documentation/misc-devices/amd-sbi.rst
@@ -0,0 +1,84 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
+AMD SIDE BAND interface
+=======================
+
+AMD server line of processors supports system management
+functionality via side-band interface (SBI) called
+Advanced Platform Management Link (APML). APML is an I2C/I3C
+based 2-wire processor target interface. APML is used to
+communicate with the Remote Management Interface
+(SB Remote Management Interface (SB-RMI)
+and SB Temperature Sensor Interface (SB-TSI)).
+
+More details on the interface can be found in chapter
+"5 Advanced Platform Management Link (APML)" of the family/model PPR
+Eg: https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/programmer-references/55898_B1_pub_0_50.zip
+
+
+SBRMI device
+============
+
+apml_sbrmi driver under the drivers/misc/amd-sbi creates miscdevice
+/dev/sbrmi-* to let user space programs run APML mailbox, CPUID,
+MCAMSR and register xfer commands.
+
+Register sets is common across APML protocols. IOCTL is providing synchronization
+among protocols as transactions may create race condition.
+
+$ ls -al /dev/sbrmi-3c
+crw-------    1 root     root       10,  53 Jul 10 11:13 /dev/sbrmi-3c
+
+apml_sbrmi driver registers hwmon sensors for monitoring power_cap_max,
+current power consumption and managing power_cap.
+
+Characteristics of the dev node:
+ * message ids are defined to run differnet xfer protocols:
+	* Mailbox:		0x0 ... 0x999
+	* CPUID:		0x1000
+	* MCA_MSR:		0x1001
+	* Register xfer:	0x1002
+
+Access restrictions:
+ * Only root user is allowed to open the file.
+ * APML Mailbox messages and Register xfer access are read-write,
+ * CPUID and MCA_MSR access is read-only.
+
+Driver IOCTLs
+=============
+
+.. c:macro:: SBRMI_IOCTL_CMD
+.. kernel-dec:: include/uapi/misc/amd-apml.h
+   :doc: SBRMI_IOCTL_CMD
+
+User-space usage
+================
+
+To access side band interface from a C program.
+First, user need to include the headers::
+
+  #include <uapi/misc/amd-apml.h>
+
+Which defines the supported IOCTL and data structure to be passed
+from the user space.
+
+Next thing, open the device file, as follows::
+
+  int file;
+
+  file = open("/dev/sbrmi-*", O_RDWR);
+  if (file < 0) {
+    /* ERROR HANDLING */
+    exit(1);
+  }
+
+The following IOCTL is defined:
+
+``#define SB_BASE_IOCTL_NR      0xF9``
+``#define SBRMI_IOCTL_CMD          _IOWR(SB_BASE_IOCTL_NR, 0, struct apml_message)``
+
+
+User space C-APIs are made available by esmi_oob_library, hosted at
+https://github.com/amd/esmi_oob_library which is provided by the E-SMS
+project https://www.amd.com/en/developer/e-sms.html.
-- 
2.25.1

