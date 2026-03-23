Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013004.outbound.protection.outlook.com [40.107.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35C4399367;
	Mon, 23 Mar 2026 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264154; cv=fail; b=FBp5cDs9ZhDwy8C52w+5aw3lE5Sl4tCG+KY+KccCuzzMM6VW/5t6DPrryMq/zz2wsRFkbpi5HI5KAnOHZ/f201NE/c4zbgg8CLyokNc+J15uogXT2ZFfIgklK2gAtx3NULMyI6t3X38VhOimsNFeKxjvk46xjw0BUZfe7/sZE0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264154; c=relaxed/simple;
	bh=nLTY8k/s/mzofaL2s2ylizDcIq7OQbDEq1GQw4pR1Vs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXZKB7HQ446ssWQ3ZQLvcHd0VBxqBH+LhuTvHdt8dubogCJ2H0Z3OU6SikhctD+AWi55ttNUyT3VuRaa1UrCjiWtGE93RAQG0sb+qO8VCQH6h5OArj0TP7nMEDa+XMC0+5ZvEnRdAmAnXXEqGPjNkH2RM3cTM2eL+Ioiuo4BnRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=di43HHSW; arc=fail smtp.client-ip=40.107.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="di43HHSW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQYF8EOfpV1x3ducFLTvPMSVgh3csuwsBWD6c1jl125gvBXzBCaRVX1ulSwucNdsuGT9pNSNebmiLQJ2/QwXS/Tba2b3QsXvv8DVMdNMMEOeWm7BwtZvyVj9IhiL0Uk0DdpZEcNJfl+PU0Q/gZ8HYnv6S+J/8fpMSUO+tcmgUB2Qa0EUFR4ubZcn+UFtyRxJjNityjdUN2dnx0XpNycnJJPM82Cx3Sd1AZ+gtC3ZH+kj83QDxbv+9/zYtyzHqm8z3BHXgkdUNBnDzRDl4peJ6+GNo13lp40nPaGWQpVCrbaGRUES/A/Hz4bBlSBgnVDxju9nPmyHphUzZpmE3sPmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecelYwyFGdZfl0zRdrDcfqiLd1ould15Q4JP1mj9EVE=;
 b=CAFO806oA+B2qJ4tl0td3sgeB0TU68K8WGEW0p5x/hTY3qGefssbCsukNvjtirSg+2tsl6JGtra0RMk8dtcf0gmTdrEHiGT0PRdOr2nG6Hpv2iVSbFBrqVfrqT4Kky8drnv8aIt4sdUAoU6uGKnWtos++EkKQZ9ol2oZuXlVaiJx5frljNY2pdpGL/xhsM+hj8kjs5rUu2d3AHM8QW9o2r7+ftjSgBV8o/3Kbo9+Yy0N6r2lZA27nnsJpJUVq2EmPdu0h2XLTyFJhWTFfwJtGJgdrDn1Xh0M+LeHvpOOsYoRNV5NmXADBqA6vPDJX2ghIwwLdvMMS1rnYbWIIA4azQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecelYwyFGdZfl0zRdrDcfqiLd1ould15Q4JP1mj9EVE=;
 b=di43HHSWA5RJCoyrss6xfu4ngt+yu7CtXT3CMRsBooPENxj7I2cTBTKDVrsUorQyjv9Blsnt4EnP1KuN+1o0NwJmDUBb413xeigwZzn30ZRTKH99+cSgKaZ+vs+nU9wLO/C9AhLQTCT98qnEo2CFZgsKc4+weQd0cdkesdP25cs=
Received: from MN2PR08CA0004.namprd08.prod.outlook.com (2603:10b6:208:239::9)
 by CH1PPF68E8581EB.namprd12.prod.outlook.com (2603:10b6:61f:fc00::611) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Mon, 23 Mar
 2026 11:09:08 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::95) by MN2PR08CA0004.outlook.office365.com
 (2603:10b6:208:239::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 11:09:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 11:09:06 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 06:09:02 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<Prathima.Lk@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<Anand.Umarji@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <kunyi@google.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v1 6/6] docs: misc: amd-sbi: Document SBTSI userspace interface
Date: Mon, 23 Mar 2026 16:38:11 +0530
Message-ID: <20260323110811.2898997-7-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|CH1PPF68E8581EB:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8f21c4-c6a1-463f-b717-08de88cc999c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UNiPf0DnlPFZ5FHQLuzg7Z6plWdTAEMWVEILXAM19CBgL98tVA0fNrUEUuFr7OKI6t7LXAcYW9ZX5jxrj0Ad+E0geE/J05rLyMGwwHZNT1/dOe/p3tyjbe/fNQYgvShwtgsqFBIobOKlSS6kdb9tdWIpovPfSAskn3dGGg8fmETApW1iSbCih6rOmnrt+wtvdJvXCggoflTdb3NkMKAL8V6FZ0ObZzKQEofFW+R/rBEyBV25G2aK67NVBB4BkGEbo4G3Ss9f2rkyvi473qLZ77sYTEpHhZJkfcYMPZDhTsQH/aQgk6aEdc+kkjIbllMFSWnXAKd5aFoX4DT/2f5dVs+3C/5HsxsQUFHYmYycnP5rQFGx1bLiZnYcB/gZfVJdYkpXwB/Hb+Tr75gCmM168DCHTgUzvNYJNOp7bPsZ3W0EQGsW5XGkRZsb0SOEjwzMp5R07p2WMaSf4i9d2xVu7zNSbLK93A/3uABF65nPQk183y9l7x5MtzGAKRv+ca3G3UdmD9pqCQ2EZyMzlgtJdfvpVpKV8k3iLAUHh+6vA7wFobQx9kjNcmsAxgBGiR3HST8HP0Xy5YJIh0jRk3B6d0HjOYxz63fPLXd7Plkt9/JI/+jmIwsvT0V8I9Q+M66dyyoAbVEZSsT/Legc/pt/FT7xyieLb9dunTRi4XDTkbBlR/tl/ARxh5c7wr5R44TJTI37piHDxQGQ+1q4QfEcDeh1/iat2WUWgkUpgbPDanBj0pANzka4ezjfz1RGeet5KFOIqAUAxmJQkD25x/ifmM/IqLkZIHMNTW4fFso7mXU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LhTawAhz9vYwtzetjavn2yGcPKqwk8sGCLYvykevabQg6v3VYf84dh6gzaqZojjZxRdpQsO7jM7EKPxapwoKs6ZOfOHioWA2yXZIqjRDIDgvuZl/pN2U0rAtzQB8G7RD9rUilgdhQzDoBwGhcV2+m9wekeUPr2+PR5ls6ZQrT5e7tzC6AY5VKqvIfuXISE7ijKF/QYEwfMNOWcGnz29VnktU30jHpjxw92zfY/LT0wU9Kk3CcZoyb4CTjYDMPD4hzXKqbZWti3XtCgbS7h7gR9WG86RH1IHRrsAJtykqm3JG7cMXkQ1sVUWS7QTR4OREGvgstY6pYH5QRIkQ/ctcYj3VnJiERacjoAYa+o3j19Slm/IxduXXpCqX7msAaVG5AxjJIioAcLquSsLey/joCe4xTdRbxeIFpbW3ITOPe8OEf1H+axc3K1s2lcTeV9H4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:09:06.4688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8f21c4-c6a1-463f-b717-08de88cc999c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF68E8581EB

From: Prathima <Prathima.Lk@amd.com>

- Document AMD sideband IOCTL description defined
  for SBTSI and its usage.
  User space C-APIs are made available by esmi_oob_library [1],
  which is provided by the E-SMS project [2].

  Link: https://github.com/amd/esmi_oob_library [1]
  Link: https://www.amd.com/en/developer/e-sms.html [2]

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
 Documentation/misc-devices/amd-sbi.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-devices/amd-sbi.rst
index f91ddadefe48..ddff3cea8ed1 100644
--- a/Documentation/misc-devices/amd-sbi.rst
+++ b/Documentation/misc-devices/amd-sbi.rst
@@ -48,6 +48,20 @@ Access restrictions:
  * APML Mailbox messages and Register xfer access are read-write,
  * CPUID and MCA_MSR access is read-only.
 
+SBTSI device
+============
+
+apml_sbtsi driver under the drivers/misc/amd-sbi creates miscdevice
+/dev/sbtsi-* to let user space programs run APML TSI register xfer
+commands.
+
+The driver supports both I2C and I3C transports for SB-TSI targets.
+The transport is selected by the bus where the device is enumerated.
+
+Access restrictions:
+ * Only root user is allowed to open the file.
+ * APML TSI Register xfer access is read-write.
+
 Driver IOCTLs
 =============
 
@@ -63,6 +77,9 @@ Driver IOCTLs
 .. c:macro:: SBRMI_IOCTL_REG_XFER_CMD
 .. kernel-doc:: include/uapi/misc/amd-apml.h
    :doc: SBRMI_IOCTL_REG_XFER_CMD
+.. c:macro:: SBTSI_IOCTL_REG_XFER_CMD
+.. kernel-doc:: include/uapi/misc/amd-apml.h
+   :doc: SBTSI_IOCTL_REG_XFER_CMD
 
 User-space usage
 ================
@@ -92,6 +109,7 @@ The following IOCTLs are defined:
 ``#define SBRMI_IOCTL_CPUID_CMD		_IOWR(SB_BASE_IOCTL_NR, 1, struct apml_cpuid_msg)``
 ``#define SBRMI_IOCTL_MCAMSR_CMD	_IOWR(SB_BASE_IOCTL_NR, 2, struct apml_mcamsr_msg)``
 ``#define SBRMI_IOCTL_REG_XFER_CMD	_IOWR(SB_BASE_IOCTL_NR, 3, struct apml_reg_xfer_msg)``
+``#define SBTSI_IOCTL_REG_XFER_CMD      _IOWR(SB_BASE_IOCTL_NR, 4, struct apml_tsi_xfer_msg)``
 
 
 User space C-APIs are made available by esmi_oob_library, hosted at
-- 
2.34.1

