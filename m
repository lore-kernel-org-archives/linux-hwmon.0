Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013029.outbound.protection.outlook.com [40.93.196.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C639098C;
	Mon, 23 Mar 2026 11:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264129; cv=fail; b=B3Avu0Hg19LceotT+Mo6G/M3G2IF5uNSlKOUoetBiLAe6MoKBTPb+uX8/MJTgY44irbJiTdUBemuPbUiHn9ILGzmEApwCGwNAar9rlGFTCSl7vZkK6bIN30sIrj+gdDpvNdmp5oU14qvqKSEgu6GWuDs9RuUorhd9XUQPWqpqlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264129; c=relaxed/simple;
	bh=kb21sC1Aq8cMGv0iuzbcIlyuDLG3chxcOEv4oLWRDHs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PyeUoVAxwBX0YwMc5vflFzNdjUJFTjeZr+r6ZxJ8HLSkXFxU6Xy9YSnh66Sp82CmuWMu0xePf5rSKGGjiKMPGCeFI0M9jE5odSl9hGvQNMGu+dtfM2ecW3D4jc0M/yjdcBnSfE6FlhD/PLHm/uKq1lOVBQ9EEWc+1FCxumCEsM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iDTK1AuZ; arc=fail smtp.client-ip=40.93.196.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iDTK1AuZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMPXMTKUmnyILERrlTuVx818aMMkTWR1ERdrbggvhvp/yFl8MX1ycYhDGnErpRy5WheXS7pmDND/ZJJ74FOhutYva7xyiNV+RC7878UGqYF32bRlhUPxVgyMQMqllddgSnFuF/CySaXSOxh/SMlFf5PnwsfzeLdCrd5/7xGcmf6HLGkajP3hCMyX3oPIlHPrzT7KpfqNQOqsUeX5HVhNDbZKsUw8hhb/iN5qKA8osy5MsZ/pjT0+bldtNkWtmh2jkn3iqZl9GD7/IjOcw62/Lc0dPu+WwgpSpGMfBIfTAeYEYnvfvjzkJgqCNGew0pKPebWNRK/Z3vZmXo/tM6I9Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzdrJk4aJuLb+CSXHHjXhx+mfPoLj/WkV9aAK2PQKJU=;
 b=XD5UXz1iUnHYO6Ue5ZT+I0ymnfKAZ8Ee/1lMnYBnOB8lpbm5B0hBlN83DDAj9FzLCcV+QcEBKaCjT/ReEOQSCUX81EYuh+QGf/oyvd5Sdjcd3G4rOtQJYhWz7OBeNCBuF6DHqrjE478KP+QNMaSVeDoMgJrIjw4pmo6iKULd8+3kVk2tJ4lULPLOl5JiWNsiQgsc4+PU6Es4sV6KSNSSiyvc6Kgah9+Tkzm5dg8XICCZ3KYIqkocpyGBsoi+0/NwaaHFtN/4csuGvGtxZpVxii4zuf7KeDgViC4qgRpasabarxNQy7ffgZkdJpOuRchqoPCBNk/bxWFsY44mTzM5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzdrJk4aJuLb+CSXHHjXhx+mfPoLj/WkV9aAK2PQKJU=;
 b=iDTK1AuZS8Su6uLjBGbosEHrbyhwutYkygVVjY5WyG00geyfbRN8dSDpcXiTbvogso01cbnUREKFJZJx/1kDCG+K88CiXdqpF2tx2kgT5Ah5F8sI/F61BXW4QPGvr++Jr6Y5lC3Bk2/RYvm0k2hW4xDfYDCeML/+zDMDMaRc1bA=
Received: from MN2PR08CA0013.namprd08.prod.outlook.com (2603:10b6:208:239::18)
 by DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Mon, 23 Mar 2026 11:08:43 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::f) by MN2PR08CA0013.outlook.office365.com
 (2603:10b6:208:239::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 11:08:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 11:08:42 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 06:08:38 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<Prathima.Lk@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<Anand.Umarji@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <kunyi@google.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v1 1/6] hwmon/misc: amd-sbi: Move core SBTSI support from hwmon to misc
Date: Mon, 23 Mar 2026 16:38:06 +0530
Message-ID: <20260323110811.2898997-2-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
References: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|DM4PR12MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a184e87-3d23-4123-c5fa-08de88cc8b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BLOz5g1UD2t562gBXAPu+Eu8Y14Mz2DVb4601nAh9QpbUQMqzo4MhqUyvDsrZSGoBxMPYEGWNBA3T0P/wo5WPTm/6Jom5NJgcOawZXWV/H0cCN3egH2XtMZTiND4XZBfOltwtdcONLU6hfqpbCDOaSkltV9BJnTmdxr/9ly1ifmzl0zQhXG8AKYOcOvZ3USSrPHlf4vDhVtFueCtr5QUhlc+Z5bTgy39Vt6EDlDs13+amYOyJ4ehphGwbCO+haOZuqbDq/jC9wJxC/DDwqi/UXMzCBIjvCKrr1MhGt1o/mnpNtUvAxcRZnDmG3twr8SQTmpXdcd0rRqu/jKV6QiDKCUjLLKthJvCdoxwoYRWYnC7wbAQzkarpPCHjU3CPzwL4sn1hZQYKey/syabnnxdMpXoNHBwbAX7GyzetbbeNsHcxB2xkugc3mNHnvBnYD3XN+zxh/Yw32kYyOwZTAznnZ9SV/Ufiz2+JS8lGX3v2ouV2YaLSFU7UDm0ZWzNLnw3KEDCYCuxRf+zNWSJOBmHdDG4mzJt4mwPib73UvETovFwGLympE/h+494XyXcVbOqnIL2Y6nvFfJGn+j4UKHqZ73tDmrvF5h7FQ2gQVyWZAGXB/zpIAmmG82FwwbQwh302FOOffxIQdi+hf0PPDWq7OMLGpDcAkaxn9wjjKEKnPAUDGCNKlPGaAo515XGuqERKyVo78HFJCFlBAECsU526kjrmXdpEp8C3s+vCdG15lx0vxRNaiSzPPadjQZnkt/62z2w4E3XbfbbHauH85ssTw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4x4eALoKMh21jPbgzLPHtCxUJQibPGPn76tcxI96bXY/pJvyN89Xeq99d1E+NhwHXt2/kaFPwsou7CAYKl3rMHXrik42HjDy88H9uyzz6aJ4VEOjnpIesroWjk13l4eYy52F405cdYB89vHcmEFa2RIVt/WV9nhC5g3C6dpI4ckjY+RZnDqqcevgB9E1TIsBcToSG+HghnG29fNJRbEIBEhgiYphWzqqbUDHcCpGbmef0AUAEUVuh9XOrPoF6TTZJOlnoHSb+KPWPDd9ohU0lYMRcvyxWmO5vYr4YP2yTsvY8r1dNWh7P8V7oR/f6b5qKGEBTeOMa19sT+VCnxTwygrbBdmOJQ8LlQ/2sEbk17vYUnGsGXzsP9hiQzBMAkOlKKGsP/q7wMdUm8s5Xu82mOVRBrJ49OyBYW713GVK/E0tnKUAmkzq8tLRcoxOpB7H
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:08:42.7206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a184e87-3d23-4123-c5fa-08de88cc8b75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6448

From: Prathima <Prathima.Lk@amd.com>

Move SBTSI core functionality out of the hwmon-only path and into
drivers/misc/amd-sbi so it can be reused by non-hwmon consumers.

This split prepares the driver for additional interfaces while keeping
hwmon support as an optional layer on top of common SBTSI core logic.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
 drivers/hwmon/Kconfig                                | 10 ----------
 drivers/hwmon/Makefile                               |  1 -
 drivers/misc/amd-sbi/Kconfig                         | 11 +++++++++++
 drivers/misc/amd-sbi/Makefile                        |  2 ++
 drivers/{hwmon/sbtsi_temp.c => misc/amd-sbi/sbtsi.c} |  2 +-
 5 files changed, 14 insertions(+), 12 deletions(-)
 rename drivers/{hwmon/sbtsi_temp.c => misc/amd-sbi/sbtsi.c} (98%)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 328867242cb3..758f9c9f9e4f 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1936,16 +1936,6 @@ config SENSORS_SL28CPLD
 	  This driver can also be built as a module.  If so, the module
 	  will be called sl28cpld-hwmon.
 
-config SENSORS_SBTSI
-	tristate "Emulated SB-TSI temperature sensor"
-	depends on I2C
-	help
-	  If you say yes here you get support for emulated temperature
-	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
-
-	  This driver can also be built as a module. If so, the module will
-	  be called sbtsi_temp.
-
 config SENSORS_SHT15
 	tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
 	depends on GPIOLIB || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 5833c807c688..c9b6661cfc72 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -199,7 +199,6 @@ obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
-obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
 obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
index 30e7fad7356c..e6a422b4a371 100644
--- a/drivers/misc/amd-sbi/Kconfig
+++ b/drivers/misc/amd-sbi/Kconfig
@@ -20,3 +20,14 @@ config AMD_SBRMI_HWMON
 	  This provides support for RMI device hardware monitoring. If enabled,
 	  a hardware monitoring device will be created for each socket in
 	  the system.
+
+config SENSORS_SBTSI
+	tristate "Emulated SB-TSI temperature sensor"
+	depends on I2C
+	depends on HWMON
+	help
+	  If you say yes here you get support for emulated temperature
+	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called sbtsi.
diff --git a/drivers/misc/amd-sbi/Makefile b/drivers/misc/amd-sbi/Makefile
index 38eaaa651fd9..f04273c0d3ad 100644
--- a/drivers/misc/amd-sbi/Makefile
+++ b/drivers/misc/amd-sbi/Makefile
@@ -2,3 +2,5 @@
 sbrmi-i2c-objs  		+= rmi-i2c.o rmi-core.o
 sbrmi-i2c-$(CONFIG_AMD_SBRMI_HWMON)	+= rmi-hwmon.o
 obj-$(CONFIG_AMD_SBRMI_I2C)	+= sbrmi-i2c.o
+# SBTSI Configuration
+obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi.o
diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/misc/amd-sbi/sbtsi.c
similarity index 98%
rename from drivers/hwmon/sbtsi_temp.c
rename to drivers/misc/amd-sbi/sbtsi.c
index c5b2488c4c7f..e09b10c17771 100644
--- a/drivers/hwmon/sbtsi_temp.c
+++ b/drivers/misc/amd-sbi/sbtsi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * sbtsi_temp.c - hwmon driver for a SBI Temperature Sensor Interface (SB-TSI)
+ * sbtsi.c - hwmon driver for a SBI Temperature Sensor Interface (SB-TSI)
  *                compliant AMD SoC temperature device.
  *
  * Copyright (c) 2020, Google Inc.
-- 
2.34.1

