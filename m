Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830581;
	b=duFqoOMzsDbsISyJXXuw5MoHzohGnQ08MdgQ9lb3m9LKiSfiFheEHWkEoiFLMU7W/4zH
	 7XU0v9Pu9fJ5ZwKiNnMtyF7N9In/TUKbQFGTl/w9eclF6lV/NMQTF5EKgCjvaQVtPAgzC
	 IIcn88igYqf6OGXF2wL8ymncyBTUrGJuN/kMf0igrKsaGtQYhiCcEG3LB6PJLydikNU+z
	 HzgfjMlUhVIRH5KSTImCRshBEoKzSzbosZN0KMBe8jsasDsNNR5CK3Kn7xRcFPqyTcaNl
	 5rK4RNbxzhSBiTVveeUlRF7Zea1T2YFR9ILIfehpWBoTvQWKJIuN2OE2+1/IFW7HV5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830581;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wuWcbgNYSVDsqxjdAEqiEl8CO4l3cmA/8WN86nGSZOw=;
	b=lKjkX2cc3fjF6639o0XSpqRdwZn0FuMPjyrvPySx9dR31rlV5tbv2vKuOinuTdt6EI5Z
	 ke1vt/v2C8LDSzHViyXok16WhYXDtrASklLUY/OmpPtxjFJhaE1D5s9odpFy8Ck99UOFT
	 NG5rMz7vdv+GFdsfs4fxkq1VNsRxJloKtR8znTCEIAxTpIcRkNpGujm8MQVdmfjiBR3v3
	 jaeI+cvvggbr7CdHa89wIqb8+UXdXMp98gHH9vzrOQ4tp6BsYTBHWaVGPgI96Kz3T8ydw
	 DMbBBYUcCJL15WvfR747lGIEahpl2w9neZknBKmEmCUTjGTtAxA9caRBPfr+Vx9QwhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2iGuH0Z3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.56
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011056.outbound.protection.outlook.com [40.107.208.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47662606A33E;
	Mon, 16 Nov 2026 12:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47662606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2iGuH0Z3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4/QUut+SfAkbNarQczxvLYVXlfbD5mxexgX4zrQrsPw4UqovW3CWoehT9l4HKHC6fMCSvfA88ZI1B1W7L8oM9HgD61EdYEmej4T+BSrBgdrZbIvMn9tXGA9iZJyKgDwtm8mrrbLWI2xCvzaS4bnEBsWxnoexb4/anE9DrYsChy8ROiqwQF7ocP0TR6Q1zZfhPNr1nOMNcasScCDqOz3Th9uGElUVZ4XY4PzrSY+j3ojyNVu8c+l76MdMUfd0JTvNWiY3Q6t6vnv6MukwUVwIRetIxzxCLjtsleVRhtV5Kpfq6xa20xhYIjaOsrCtHOiNwl+qyPN5BXLLU6cVxJqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuWcbgNYSVDsqxjdAEqiEl8CO4l3cmA/8WN86nGSZOw=;
 b=SRQR/cnqEaPA9ynt9YrVxZfwX/ckEq+w9TfWSGZu7RM8cSTk0VY8CdPk6lfsd2xJRcpByHjxghzYCn/hKJQCyVL0hkperboyntSHJvSjdYt4ZA9wBZWQD8MuXpCzJde+wqEwIswmj15rC0OEmT76hA4zBQYvQ3M7MCxFDI9s5p5nyo+t3gxrCvhH5un2uS9l/8C/mE5VBRAiggr+aixlKgPPvnJpIemo/2muzLPUStvIGivzvQ4TpCxmHT17zYO/vo5/soY2LNBpQ1qpyvDuCxESflf71sDg4H7AOOP5+mSWvfPWJfYfzT4b50vgi1GltmA5Yl+i8yIJm6h5DUp+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuWcbgNYSVDsqxjdAEqiEl8CO4l3cmA/8WN86nGSZOw=;
 b=2iGuH0Z3HqB50tFMQ9kdiuJ9Pxd9c4kY4TeSC/IeSiRSu+v0XHUUJ5j5prPr/0KSlNMIiOdwxN86RshB23vj6VkajlgS36OiV2CdPYBjuxkcb300OmCbs+grXkYw7Z/M7LCAE/LbX+c+B/zu8SlGvgXj6JI/GuOKQO7YUqk3+L0=
Received: from DS7PR03CA0209.namprd03.prod.outlook.com (2603:10b6:5:3b6::34)
 by CH3PR12MB8712.namprd12.prod.outlook.com (2603:10b6:610:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Mon, 16 Nov
 2026 12:02:55 +0000
Received: from CY5PEPF00000E7A.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::6d) by DS7PR03CA0209.outlook.office365.com
 (2603:10b6:5:3b6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 12:02:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E7A.mail.protection.outlook.com (10.167.247.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 12:02:54 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 06:02:49 -0600
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <linux@roeck-us.net>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<naveenkrishna.chatradhi@amd.com>, <Anand.Umarji@amd.com>, Prathima Lk
	<Prathima.Lk@amd.com>, Akshay Gupta <Akshay.Gupta@amd.com>
Subject: [PATCH v1 1/4] misc: amd-sbi: use guard() for data->lock mutex
Date: Mon, 16 Nov 2026 17:32:25 +0530
Message-ID: <20261116120228.865196-2-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116120228.865196-1-Akshay.Gupta@amd.com>
References: <20261116120228.865196-1-Akshay.Gupta@amd.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E7A:EE_|CH3PR12MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: b2b24602-488e-44e4-699b-08df43d98c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|7416014|6133799003|22082099003|18002099003|3023799007|10067099003|56012099006|261026140227099003|11063799006|261021123027099003|261028144727099003|261026121527099003|261102123227099003|261022105027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	FE61kGIsKc6XDAYXxeZoIl/uHB6EAy1tAY8ob89st+3O8B4nGs6KRa/smrqSOg60CXPdfd3pLJqYh+yQZB8CHmW4eaTHtXka9FHffnLWxbCxjhFvfUWMy2XO8wKPE2v72SfXSK423lxcMfoTB25gwMP6RzN/+2N5Ib2EVyGaq2hBpNYHKM06/O738tMDNee/YiurVWbCBN/D9AwU+HLUO29DzBrVCO5dTpaQuq3kjABYwdOrTTUhjkAmT+2Z9LW7mMQovDboG3/XS8glpqhJCrWH5gkUoprvWha/+L/xkdgC9UOwMbCj19d1Yu0dqDuq8bey5toBo4YCqQEEIBeAZfB9w+Xz/wzOhAOjmxD8LB7eaWEga5B2N9hnkVvUhn57skfqjSYnqqQ1wOZO7i2i74lzTa0taylELzO+jNTNi7GYQOsEYJeYhpzfqj+3QmJpwwWPQpiZ1UPHrY8L1BYbxd31DmGbg0hhy3f/UQsnS3wpldiitqFgOZebF5t60pZAHNuwEA2bDc2M3fGnJz5vBQ7iTj8nCV/Wnewq653TJtBklHvBiXNNGQXxmGoHFXP5FFtSwAc/t6q086kfKFSEoefXbEd3NFXc5Bdb8seLa7uxI3CUVCCqJfI7USgv0xaQt3OICQEnA2seeKM/gjT+EfgQIfFeTW5bCoV9jv2hncVVfWdshFKwdAjqVi2nC0za9qXThavxI2jwwolMla5WGA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(7416014)(6133799003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(261026140227099003)(11063799006)(261021123027099003)(261028144727099003)(261026121527099003)(261102123227099003)(261022105027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IDDdouFlPAmR8UYiidq5Vs1949ooRMoz7bsk4MrGphdHp+v3oUBkmEm8Adb+RBU5aE4HF0bcUkFDcsXWwoLFJMr2R0CSmginBmHYwfBGk0tIzLxjsHcECwTEr/PZzbjTxW2kndSEAetGzS/w5wHe9CgMpHW3pX1esyDi0yQ9MbXbxb5q7jGvT2Arcb6k2eNkPJBq3DQV7zczl8Tk6GoOFUtKvoZTgFtynmQzAdzvl6msDcCNDBpDlIO/O6WrE3KRpgCCqV6jxCF0Hjxq28xtglwIbNYBKLbPxdsitXLR01n8rAXWaVsGNBWNoIYACUrnRmNwmJuLQo72I/u3bhsOC7rQHWWuQzZyNM7IYleu5EGqx3bwXQoGDRiEkLBxbHET+bUEgH95zAIddEx+v0fdVy/CjHOkSFdtlrlO7DVrm8aOA+qK1biwf/t9pHz2fRW1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:02:54.7798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b24602-488e-44e4-699b-08df43d98c2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E7A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8712

From: Prathima Lk <Prathima.Lk@amd.com>

Convert the manual mutex_lock()/mutex_unlock() pairs protecting
sbrmi_data->lock to guard() from <linux/cleanup.h>. The lock is released
automatically on return, so the exit_unlock labels and their trailing
mutex_unlock() calls are removed and error paths return directly.

rmi_cpuid_read() clears msg->cpu_in_out on every error path, which the
exit_unlock label used to do. Move the body into __rmi_cpuid_read() and
keep the clearing in the locked wrapper. In rmi_mailbox_xfer(), the goto
to exit_clear_alert becomes an if block.

No functional change intended.

Signed-off-by: Prathima Lk <Prathima.Lk@amd.com>
Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
---
 drivers/misc/amd-sbi/rmi-core.c | 148 ++++++++++++++++----------------
 1 file changed, 72 insertions(+), 76 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 95c9109101b5..277f12140972 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -5,6 +5,7 @@
  *
  * Copyright (C) 2025 Advanced Micro Devices, Inc.
  */
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/fs.h>
@@ -185,19 +186,18 @@ static int rmi_cpuid_input_ext(struct sbrmi_data *data, struct apml_cpuid_msg *m
 }
 
 /* Read CPUID function protocol */
-static int rmi_cpuid_read(struct sbrmi_data *data,
-			  struct apml_cpuid_msg *msg)
+static int __rmi_cpuid_read(struct sbrmi_data *data,
+			    struct apml_cpuid_msg *msg)
 {
 	struct cpu_msr_outdata output = {0};
 	int ret, hw_status;
 	u16 thread;
 
-	mutex_lock(&data->lock);
 	/* cache the rev value to identify if protocol is supported or not */
 	if (!data->rev) {
 		ret = sbrmi_get_rev(data);
 		if (ret < 0)
-			goto exit_unlock;
+			return ret;
 	}
 
 	/* Extract thread from the input msg structure */
@@ -206,22 +206,20 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
 	switch (data->rev) {
 	case 0x10:
 		/* CPUID protocol for REV 0x10 is not supported*/
-		ret = -EOPNOTSUPP;
-		goto exit_unlock;
+		return -EOPNOTSUPP;
 	case 0x20:
 		ret = rmi_cpuid_input(data, msg, thread);
 		if (ret)
-			goto exit_unlock;
+			return ret;
 		break;
 	case 0x21:
 	case 0x31:
 		ret = rmi_cpuid_input_ext(data, msg, thread);
 		if (ret)
-			goto exit_unlock;
+			return ret;
 		break;
 	default:
-		ret = -EOPNOTSUPP;
-		goto exit_unlock;
+		return -EOPNOTSUPP;
 	}
 
 	/*
@@ -233,32 +231,40 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
 	ret = regmap_read_poll_timeout(data->regmap, SBRMI_STATUS, hw_status,
 				       hw_status & HW_ALERT_MASK, 500, 2000000);
 	if (ret)
-		goto exit_unlock;
+		return ret;
 
 	ret = regmap_bulk_read(data->regmap, CPUID_MCA_CMD,
 			       &output, CPUID_RD_REG_LEN);
 	if (ret < 0)
-		goto exit_unlock;
+		return ret;
 
 	ret = regmap_write(data->regmap, SBRMI_STATUS,
 			   HW_ALERT_MASK);
 	if (ret < 0)
-		goto exit_unlock;
+		return ret;
 
-	if (output.num_bytes != CPUID_RD_REG_LEN - 1) {
-		ret = -EMSGSIZE;
-		goto exit_unlock;
-	}
+	if (output.num_bytes != CPUID_RD_REG_LEN - 1)
+		return -EMSGSIZE;
 	if (output.status) {
-		ret = -EPROTOTYPE;
 		msg->fw_ret_code = output.status;
-		goto exit_unlock;
+		return -EPROTOTYPE;
 	}
 	msg->cpu_in_out = output.value;
-exit_unlock:
+
+	return 0;
+}
+
+static int rmi_cpuid_read(struct sbrmi_data *data,
+			  struct apml_cpuid_msg *msg)
+{
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = __rmi_cpuid_read(data, msg);
 	if (ret < 0)
 		msg->cpu_in_out = 0;
-	mutex_unlock(&data->lock);
+
 	return ret;
 }
 
@@ -306,12 +312,13 @@ static int rmi_mca_msr_read(struct sbrmi_data *data,
 	int hw_status;
 	u16 thread;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
+
 	/* cache the rev value to identify if protocol is supported or not */
 	if (!data->rev) {
 		ret = sbrmi_get_rev(data);
 		if (ret < 0)
-			goto exit_unlock;
+			return ret;
 	}
 
 	/* Extract thread from the input msg structure */
@@ -320,22 +327,20 @@ static int rmi_mca_msr_read(struct sbrmi_data *data,
 	switch (data->rev) {
 	case 0x10:
 		/* MCAMSR protocol for REV 0x10 is not supported*/
-		ret = -EOPNOTSUPP;
-		goto exit_unlock;
+		return -EOPNOTSUPP;
 	case 0x20:
 		ret = rmi_mcamsr_input(data, msg, thread);
 		if (ret)
-			goto exit_unlock;
+			return ret;
 		break;
 	case 0x21:
 	case 0x31:
 		ret = rmi_mcamsr_input_ext(data, msg, thread);
 		if (ret)
-			goto exit_unlock;
+			return ret;
 		break;
 	default:
-		ret = -EOPNOTSUPP;
-		goto exit_unlock;
+		return -EOPNOTSUPP;
 	}
 
 	/*
@@ -347,32 +352,27 @@ static int rmi_mca_msr_read(struct sbrmi_data *data,
 	ret = regmap_read_poll_timeout(data->regmap, SBRMI_STATUS, hw_status,
 				       hw_status & HW_ALERT_MASK, 500, 2000000);
 	if (ret)
-		goto exit_unlock;
+		return ret;
 
 	ret = regmap_bulk_read(data->regmap, CPUID_MCA_CMD,
 			       &output, MSR_RD_REG_LEN);
 	if (ret < 0)
-		goto exit_unlock;
+		return ret;
 
 	ret = regmap_write(data->regmap, SBRMI_STATUS,
 			   HW_ALERT_MASK);
 	if (ret < 0)
-		goto exit_unlock;
+		return ret;
 
-	if (output.num_bytes != MSR_RD_REG_LEN - 1) {
-		ret = -EMSGSIZE;
-		goto exit_unlock;
-	}
+	if (output.num_bytes != MSR_RD_REG_LEN - 1)
+		return -EMSGSIZE;
 	if (output.status) {
-		ret = -EPROTOTYPE;
 		msg->fw_ret_code = output.status;
-		goto exit_unlock;
+		return -EPROTOTYPE;
 	}
 	msg->mcamsr_in_out = output.value;
 
-exit_unlock:
-	mutex_unlock(&data->lock);
-	return ret;
+	return 0;
 }
 
 int rmi_mailbox_xfer(struct sbrmi_data *data,
@@ -383,19 +383,19 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	int sw_status;
 	u8 byte;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 
 	msg->fw_ret_code = 0;
 
 	/* Indicate firmware a command is to be serviced */
 	ret = regmap_write(data->regmap, SBRMI_INBNDMSG7, START_CMD);
 	if (ret < 0)
-		goto exit_unlock;
+		return ret;
 
 	/* Write the command to SBRMI::InBndMsg_inst0 */
 	ret = regmap_write(data->regmap, SBRMI_INBNDMSG0, msg->cmd);
 	if (ret < 0)
-		goto exit_unlock;
+		return ret;
 
 	/*
 	 * For both read and write the initiator (BMC) writes
@@ -406,7 +406,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 		byte = (msg->mb_in_out >> i * 8) & 0xff;
 		ret = regmap_write(data->regmap, SBRMI_INBNDMSG1 + i, byte);
 		if (ret < 0)
-			goto exit_unlock;
+			return ret;
 	}
 
 	/*
@@ -415,7 +415,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 */
 	ret = regmap_write(data->regmap, SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
 	if (ret < 0)
-		goto exit_unlock;
+		return ret;
 
 	/*
 	 * Firmware will write SBRMI::Status[SwAlertSts]=1 to generate
@@ -425,29 +425,27 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	ret = regmap_read_poll_timeout(data->regmap, SBRMI_STATUS, sw_status,
 				       sw_status & SW_ALERT_MASK, 500, 2000000);
 	if (ret)
-		goto exit_unlock;
+		return ret;
 
 	ret = regmap_read(data->regmap, SBRMI_OUTBNDMSG7, &ec);
-	if (ret || ec)
-		goto exit_clear_alert;
-
-	/* Clear the input value before updating the output data */
-	msg->mb_in_out = 0;
-
-	/*
-	 * For a read operation, the initiator (BMC) reads the firmware
-	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
-	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
-	 */
-	for (i = 0; i < AMD_SBI_MB_DATA_SIZE; i++) {
-		ret = regmap_read(data->regmap,
-				  SBRMI_OUTBNDMSG1 + i, &bytes);
-		if (ret < 0)
-			break;
-		msg->mb_in_out |= bytes << i * 8;
+	if (!ret && !ec) {
+		/* Clear the input value before updating the output data */
+		msg->mb_in_out = 0;
+
+		/*
+		 * For a read operation, the initiator (BMC) reads the firmware
+		 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
+		 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
+		 */
+		for (i = 0; i < AMD_SBI_MB_DATA_SIZE; i++) {
+			ret = regmap_read(data->regmap,
+					  SBRMI_OUTBNDMSG1 + i, &bytes);
+			if (ret < 0)
+				break;
+			msg->mb_in_out |= bytes << i * 8;
+		}
 	}
 
-exit_clear_alert:
 	/*
 	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
 	 * ALERT to initiator
@@ -458,8 +456,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 		ret = -EPROTOTYPE;
 		msg->fw_ret_code = ec;
 	}
-exit_unlock:
-	mutex_unlock(&data->lock);
+
 	return ret;
 }
 
@@ -474,17 +471,16 @@ static int apml_rmi_reg_xfer(struct sbrmi_data *data,
 	if (copy_from_user(&msg, arg, sizeof(struct apml_reg_xfer_msg)))
 		return -EFAULT;
 
-	mutex_lock(&data->lock);
-	if (msg.rflag) {
-		ret = regmap_read(data->regmap, msg.reg_addr, &data_read);
-		if (!ret)
-			msg.data_in_out = data_read;
-	} else {
-		ret = regmap_write(data->regmap, msg.reg_addr, msg.data_in_out);
+	scoped_guard(mutex, &data->lock) {
+		if (msg.rflag) {
+			ret = regmap_read(data->regmap, msg.reg_addr, &data_read);
+			if (!ret)
+				msg.data_in_out = data_read;
+		} else {
+			ret = regmap_write(data->regmap, msg.reg_addr, msg.data_in_out);
+		}
 	}
 
-	mutex_unlock(&data->lock);
-
 	if (msg.rflag && !ret)
 		if (copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg)))
 			return -EFAULT;
-- 
2.34.1

