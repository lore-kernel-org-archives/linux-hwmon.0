Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F59397E87;
	Mon, 23 Mar 2026 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264135; cv=fail; b=Eqg5ncjDF+Qv4lASc6bFBH1rRjb99zRwqnskk8Mvtf/Ck/VWt9ZE256WU4PAbNlNfLYnpzXPa+tGZt6KGddf45BvjuMekVac/pI210bFF1sv3x1o5DknVf3d2dMaJTcrw97k46cQRg+ZaYT7/lhnhmqvFHsn0obBg7Ir7qpF1MQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264135; c=relaxed/simple;
	bh=PWzKz/IFRloa3wDMR6tKx0MUrOmVJYoOkglIhT+7ngc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UMzVvQKF09LIJE5Q0jzys4OVkDRvLBNyMZisHCVQfCco0WTHAlv2EtkWGIW+NSmo+StowNsdBu9lXDK+RVpDvX2elc+7Kaqd0GRYFNzjZ2hgpfH2fOuGSuqF7UTnjsXHmy5CpeoXcYXkWfxl0i9v6snS7f1E483EVqkaBFidZTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=au3UlWgc; arc=fail smtp.client-ip=52.101.46.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="au3UlWgc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbvYJissc7DguYcCcpQpORrZ4i3QFu68cvKZ8rMrG9Zc6dRPp3o1KHvF3X12s9KycXdRYpp/1ARkgAjoxpelgTzWCMfFAJGBA8NnjEOltZ7ffLFxAqGgPdE/3DfStVaOw6IVElc3xzmhM6FV+3a0gVlJr3M0ch2mGoqDgo3Dm8resGX4TQJZwWpuj0BEHdXYwTibwG+99qn3cIV/c8w86sBGhiHleZ9nenWGyTw096RR8ULPYjatXj67IjWFBj/rUxIGBgvglTYHXkZoq0xu5GD3b6bslVNPz8jaoP7Ux4jh5eQcLAZGWn4/1VqPh3YAhJotZTqoSc3PqiBFscn4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uy00Wzm2NOBxJ643g/rnFSZkw8bAZgisZZKe1nrHytU=;
 b=ejCWLZe6bgzvjSuZhacn6px+FVdiEBTuP+H1EiwkeGjJKkuZUsF7KwoC9FEvuAo699wYlwmDyi0KjszqzHLKpNv4tkDFQCLx9Wj6Os8de8c9Xl6JrjH9r+XMFcjKw5QKgu+gL3uH+ykiR0H/OWQC1i8n/L1Bxj92yxLCq49TxtiRw7ByW2wP+RJ22YSIKlMcvgObx3XYQDM+d333uWoeOSHF9dMosqMcUsNk+vLT7hegqFFCU0vUABj1/GZu1aB16hEf/R8DszteYr8iMaz+CoqWuCI62RVxj6WkMV0aWhuveTbsx5+A26ExfrAPVfCf5kDA1SCo24ndHcAKCH7+vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uy00Wzm2NOBxJ643g/rnFSZkw8bAZgisZZKe1nrHytU=;
 b=au3UlWgcFfUqdUX5txSYEwITvykUDVtPyK4niXTyytigGDuSRGfg0hrq2NO3UpnGS0zLfaPqDJz2JMzYlT2N2iDDpe6SnWEIIX3l6g2lXTfQt4ashTUWp97k3vmx+ezWAwxEx9J4XUVvwQGfMcdGvDC2mUKv+wORWJ8DmODbjcs=
Received: from BN0PR08CA0006.namprd08.prod.outlook.com (2603:10b6:408:142::26)
 by DS7PR12MB9504.namprd12.prod.outlook.com (2603:10b6:8:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 23 Mar
 2026 11:08:47 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::15) by BN0PR08CA0006.outlook.office365.com
 (2603:10b6:408:142::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 11:08:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 11:08:47 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 06:08:43 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<Prathima.Lk@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<Anand.Umarji@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <kunyi@google.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v1 2/6] misc: amd-sbi: Update SBTSI Kconfig to clarify this is BMC driver
Date: Mon, 23 Mar 2026 16:38:07 +0530
Message-ID: <20260323110811.2898997-3-Akshay.Gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|DS7PR12MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 73b854c3-c4d6-433d-1d13-08de88cc8e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Smk8cpl3Q1SZFMqBKGWzjjpJxeG/Fs/yUqqeSjLQf6g/mVVZ1kAju5tSjupFjNdSF/ViSqWwRAgtAd3hTBxTv48qznadZIrBRa86Xqy64O3O49m87GM7LpjgJe7dmQU7fgYfE7coEYMTJkC2ZkDYXEWgkBsnmuEQob6TWatIissg8asKWAMX/leElJ5aihISXvIE1wN17Sb38fQpJNifGP7aqs2QeRkrD2TJU5bf/m09Qqm4ntV5mfkufX7ttMjB45bWCt6/Qzp585YH0vrAmY3MYccbULV3+zlt91nMQA1yhOM/MMMTRUel0fEmHYanFK7xukp2GjvaCiOETY2eu51yXkTbRpGPQG8eKelzujl1C1KSdEC7cXgbOcTjrtj6UAnOjfMZFZkLYAXc85ozFlmS+eYo9k5txXtQcI6kQrcKMIeMrZtM41zoWjnjSYlEYSed+bW82ui+eEiMwim0bzGt0OVH4haFkfP46eYQWEHNymPGxazGAsqGS6Oi0aeWwdyZPGjFkznqEko8qPsreF8rNYvjBuEn6I98HJ2JUy+e+TBwi1BgrCcFzwQKMlQFQpVEvaKuSB/2oM6VQxc0jlKTJd3QOwlNySHDBGk1z8oYzTTATQwQT8ed2lBQiALSN1x5IxtbZhBIH0sqVSyAM1cSYHczHHVu1vS0+EP4g4Lx50l5SM5Vv+ak05R8/CyipWWUjChv323wMDt9hpSzmMNLCz4Fz/aZMfLEsHiwqKFtqrjqcLAHwOqQuMrD0j0H0AxkhTn376Bgzw580jpxmQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rvWdpkgvshFD8Js3c8Ti4NGF48NVInCkVaNfr0VUo/3FewXh9CYK9Yx9jqHOpsnfoArLaz3rfwu+0K37JUeFOUZmFfr5g0ZjkYq8krt4qlF7DaABaLYEp2VfBYAmMeVB0JjhIm9AY82EQ8paZ2Fhbv+94iL/Th7qg35ebb0ABsbiXU/tGVaVMm/C0/P3N7kVohokwbMKycRcZzhE5cZfrnCPZwrIfPVbBToI45HyfhXXUL11xILvGf1LFVTic7tCLgeSH8obDFuix7rydgrOBvPnGta9X5gkZqKZ59AZaoo/QkZ8P092wvteZwAQx2nM2dJ8/T1WdhcF3Q1PioIMgK+K0eVza6SDUWJ0Pa3BQmFs3QI0Lvl1GmkLUWJQ9uxOfST8klcCwEVv+Z4PE1B4ohXPc93SxlZfZk43n2RCxZEZanM3DoB894FOVHjoH3Qs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:08:47.0460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b854c3-c4d6-433d-1d13-08de88cc8e09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9504

Add an architecture dependency to the SBTSI Kconfig
This limits enablement to supported targets

Also clarify in the help text that the SBTSI driver is
intended to run on the BMC, not on the managed host node.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
---
 drivers/misc/amd-sbi/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
index e6a422b4a371..19a8d596e8f5 100644
--- a/drivers/misc/amd-sbi/Kconfig
+++ b/drivers/misc/amd-sbi/Kconfig
@@ -24,10 +24,12 @@ config AMD_SBRMI_HWMON
 config SENSORS_SBTSI
 	tristate "Emulated SB-TSI temperature sensor"
 	depends on I2C
+	depends on ARM || ARM64 || COMPILE_TEST
 	depends on HWMON
 	help
 	  If you say yes here you get support for emulated temperature
 	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
+	  This driver is intended to run on the BMC, not the managed node.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called sbtsi.
-- 
2.34.1

