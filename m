Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011041.outbound.protection.outlook.com [52.101.57.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A8F3B6354;
	Mon, 22 Jun 2026 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136766; cv=fail; b=LYIkY5QTKI9R7spsREpY670bntg//k9OMIbyJ8COE3OXSCsxrIOQl/itvsjBZFMnphHLMqPANvM8VxVKzOh5DjV4+H12SqD0oqwxY31pWa16foC0ESpi8K+qSuafpevGo0MTkDvlt0VsEi+km99LGofndyl7KNW4A+oE9hDeY94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136766; c=relaxed/simple;
	bh=EWx4oX2c7ODgcDg/XEIFstTv4EOTuE7N/Vcx9Xe1J48=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EWZIFBFqBa+vidALFvM6eQkUn54raeUv4brMukcwlwxSpapziwJ0tqsMKMVm+O8FFkD8gaUKASchoFyZv04Iz3nXAqCLbyvTg5xTFi3u0o84I9bDkTK2Ocg27PPTJHMJPDMspMoMZms5apA0svnUopYA1YUBJOwxQaaBbQqZ+hM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YLUpqvas; arc=fail smtp.client-ip=52.101.57.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YLUpqvas"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIeCcKrOG4fiGlcp8rgfx0oNaX1jcLYc9pYI6Jo4gKS4CWGiKIXwf5iLEVueFqMpV9WbPQrfCEDV3AYhzFxTdUDsZ8ebj9E3//zgJUptavwoRGSRYt6IFxHHe3eLpuD9a907rrKScqzY8AWIqis9KeIQxCT/JapErlhOyw2pSAyIs+6IvEW/A4SaeBOmVfsD7RKSAfQgRe1mBbpHEL+G6PZCTAxCw562vHINRPFYjV7h/Gd54P9s39GwcFKTVbhrvKQXJLQxvmt50P+jaOwqwkDICTxRJjhvuD1YrJCMP47XLSZ0005sRs7PhHKrAviUfIYMVLU//Ki+OzxVJixbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EB6OPMNX5ZX2hTp32+AvWYAoHKDeqDqB1hgiTEgHZuY=;
 b=qBoVc79HYYA4/qMKeyfgzJYy59NokOaGgQ1BOVLsQ1Qu97KpK9Bh2a7Hvx9Xk6ZaYDW4TZBVo3Gxl9fXRJ8LJJidQ7KKwd3/cXtryRXyKgJ1Pd78GGWVQRpkFwIrII06nUCUUP+DldcbJ2qGpHsy/fo+0FCrAXEzIyszrL72bXWxuuEaP++Blq0eKTcY51nUY6mBFhn9eXnH2VdibWcVMbSH6PcjyUoDfy0lxVJE4bvDmylmeP51r1nb2TxZeQVj+oVwdbYKug5/IgU3wvNOOtvzcnK3UNlxzyHCN/6tZkwaKe57OWsr8YLiOwvm2iIpm98c+Y1zfLxPpcBtmgUs9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EB6OPMNX5ZX2hTp32+AvWYAoHKDeqDqB1hgiTEgHZuY=;
 b=YLUpqvas+LB3aYK0z2cZc1KEAsTRbmvSwRkDaS3s3ZRAWMmOedd1iFImPh02Ru7EXBqaMnKvY+ddYuhlPisLNTqI/ZefAKZVxuXRT46ddifpr3/+nYd4dcuWtIrPUiJ1e/LHQ4qAtA6slNVfkRtfDHTnShZFhQLvWdwJdQOjAys=
Received: from SJ0PR03CA0047.namprd03.prod.outlook.com (2603:10b6:a03:33e::22)
 by PH0PR12MB7931.namprd12.prod.outlook.com (2603:10b6:510:289::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 13:59:20 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::39) by SJ0PR03CA0047.outlook.office365.com
 (2603:10b6:a03:33e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 13:59:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 22 Jun 2026 13:59:19 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 08:59:16 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v3 8/8] docs: misc: amd-sbi: Document SBTSI userspace interface
Date: Mon, 22 Jun 2026 19:28:21 +0530
Message-ID: <20260622135821.2190260-9-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|PH0PR12MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 664791bb-d0e5-4be9-7a13-08ded06674f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|18002099003|11063799006|6133799003|3023799007|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	wnJmQUOIiaBHca7mg0HsM2cg/yJzilfO1hjZV1SHu8F7DrWLDZBXvai5RuBKImkKS+LdOOI+V5rcZjK8D4Ki33R2ptyIx70wz4EsbiPTlBe4ec7LpKUiW5HubcmypU4mLIUd7HCiW59j4oVy//pXROnCsbfCUNEllnea5rTSbvu7GDJOBz5Wk3rVnDAclBhPHi3aVEmuSjfwtYf5D1yILKLFY+D6mrj7cjIBHaBPiw1iQWK0cxxep+D08ih0FQZ2EOkdCspyUofVdGlXQfHniJ9q18UMCUAMSTNFh/1gmmbaxXZ938UTtrWkH6gdgrMLaFEL0n2aT0ZNG/muDXqO/tGxsQoPm7CT8kXyHRKUlipBckNcBaekokTkd8vRXzVHyhRZfJ2utyj37uuJ0Gid40IF9qjhH9p9FbzPvIyhZF+rKPRp/NI3ecV3TU2YFr+m/ALLeJlDtEIG7a9CR1per1vg+WcRboKtpsUcXt9YDeT0mZQpqQW1wgCG0z2cWS4xm5eq4bedfvUJJWoYgugXU39JqLEC9w5ZmBxnVR0raewPilZIrTgEDCMG9Otdb9b6q3IPDQRBGPnCer1jeFpml4gvf2hz9u9+fl7nmgOC6WtWdUnsCjQUzNt+XEOKd8Du7n7V+scCv8hLDnrdtiTOoAhifaSD2fPBHLx32yjw8u7gueRSO+1Fg2s1+4gO4qZ+JsTe5zJ9kcjV1mI01D/MGw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(11063799006)(6133799003)(3023799007)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8tZ5QvS1WDw3lFTvJsTY0v+zVY//ZhVCfCJrU6WOcMlYfKYoF0GHfceu6hTmipnx8VAMwF49WaXu9DVYm3AVP7xkCNd85HgtEBWdu3R6PMGyrs8qQUHq1fqjwU3Mp9t2m7qPjbKjLmAffhe0e7iEgcyd3NCG6zU/NscSJHPATRiTCGMnyOdzxh9glYajSbXgDUjxBtXBzfKQIFZaMXCHaPROL8+/uoo+XqdEWYwHOrRl3Q833JvhnwcTBqskBT+SiiWRxzFIjiEN0VPaKS6ue9pWgn7cSD/f8CRou9VFls6v2MV2a0H5CwtWMwPyMTT8GDb+bk5GxgDhENqaT8mBr+k7QE7Sr4v4G+VJTP8v7G4j3GJg2EN231S+9KCPYU8CIK7Z1xz3RxcBCb7ts4zQcZ+ufckOCt/J74Bp4xOTvLjbuXn2fNkZ6hplBT3rOfrc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:59:19.9572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 664791bb-d0e5-4be9-7a13-08ded06674f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7931

From: Prathima <Prathima.Lk@amd.com>

- Document AMD sideband IOCTL description defined
  for SBTSI and its usage.
  User space C-APIs are made available by esmi_oob_library [1],
  which is provided by the E-SMS project [2].

  Link: https://github.com/amd/esmi_oob_library [1]
  Link: https://www.amd.com/en/developer/e-sms.html [2]

Include a user-space open example for /dev/sbtsi-* and list auxiliary
bus sysfs paths.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
Changes since v2:
- Update misc node names info as per socket

Changes since v1:
- Elaborate the document
 Documentation/misc-devices/amd-sbi.rst | 68 ++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-devices/amd-sbi.rst
index f91ddadefe48..fbbbc504119f 100644
--- a/Documentation/misc-devices/amd-sbi.rst
+++ b/Documentation/misc-devices/amd-sbi.rst
@@ -48,6 +48,60 @@ Access restrictions:
  * APML Mailbox messages and Register xfer access are read-write,
  * CPUID and MCA_MSR access is read-only.
 
+SBTSI device
+============
+
+sbtsi driver under the drivers/misc/amd-sbi creates miscdevice
+/dev/sbtsi-* to let user space programs run APML TSI register xfer
+commands.
+
+The driver supports both I2C and I3C transports for SB-TSI targets.
+The transport is selected by the bus where the device is enumerated.
+
+Misc device:
+ * In 1P socket 0: /dev/sbtsi-4c
+ * In 2P socket 0: /dev/sbtsi-4c, socket 1: /dev/sbtsi-48
+
+.. code-block:: bash
+
+   $ ls -al /dev/sbtsi-4c
+   crw-------    1 root     root       10, 116 Apr  2 05:22 /dev/sbtsi-4c
+
+
+Access restrictions:
+ * Only root user is allowed to open the file.
+ * APML TSI Register xfer access is read-write.
+
+SBTSI hwmon interface
+=====================
+
+The sbtsi_temp auxiliary driver binds to the auxiliary device published
+by the core sbtsi driver on the auxiliary bus. The auxiliary device is
+named amd-sbtsi.temp-sensor.<addr> where <addr> is the device's dynamic
+address.
+
+It registers a hwmon device, providing a standard Linux hwmon interface
+for reading CPU temperature and managing temperature limits.
+
+The hwmon device appears under ``/sys/class/hwmon/`` when both ``sbtsi.ko``
+and ``sbtsi_temp.ko`` are loaded.
+
+Verify auxiliary bus device::
+
+  ls /sys/bus/auxiliary/devices/
+  # e.g. amd-sbtsi.temp-sensor.X
+
+Example usage::
+
+  # Read current temperature
+  cat /sys/class/hwmon/hwmon<N>/temp1_input
+
+  # Set high temperature limit to 70 °C
+  echo 70000 > /sys/class/hwmon/hwmon<N>/temp1_max
+
+  # Verify
+  cat /sys/class/hwmon/hwmon<N>/temp1_max
+
 Driver IOCTLs
 =============
 
@@ -63,6 +117,9 @@ Driver IOCTLs
 .. c:macro:: SBRMI_IOCTL_REG_XFER_CMD
 .. kernel-doc:: include/uapi/misc/amd-apml.h
    :doc: SBRMI_IOCTL_REG_XFER_CMD
+.. c:macro:: SBTSI_IOCTL_REG_XFER_CMD
+.. kernel-doc:: include/uapi/misc/amd-apml.h
+   :doc: SBTSI_IOCTL_REG_XFER_CMD
 
 User-space usage
 ================
@@ -85,6 +142,16 @@ Next thing, open the device file, as follows::
     exit(1);
   }
 
+To open SB-TSI device::
+
+  int file;
+
+  file = open("/dev/sbtsi-4c", O_RDWR);
+  if (file < 0) {
+    /* ERROR HANDLING */
+    exit(1);
+  }
+
 The following IOCTLs are defined:
 
 ``#define SB_BASE_IOCTL_NR      	0xF9``
@@ -92,6 +159,7 @@ The following IOCTLs are defined:
 ``#define SBRMI_IOCTL_CPUID_CMD		_IOWR(SB_BASE_IOCTL_NR, 1, struct apml_cpuid_msg)``
 ``#define SBRMI_IOCTL_MCAMSR_CMD	_IOWR(SB_BASE_IOCTL_NR, 2, struct apml_mcamsr_msg)``
 ``#define SBRMI_IOCTL_REG_XFER_CMD	_IOWR(SB_BASE_IOCTL_NR, 3, struct apml_reg_xfer_msg)``
+``#define SBTSI_IOCTL_REG_XFER_CMD      _IOWR(SB_BASE_IOCTL_NR, 4, struct apml_tsi_xfer_msg)``
 
 
 User space C-APIs are made available by esmi_oob_library, hosted at
-- 
2.34.1

