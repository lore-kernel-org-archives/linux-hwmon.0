Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A226518B486
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2024 07:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726124955; cv=fail; b=kcCko1E7pGKJ7feF2f05aKg2sjD2Hhqc1PVZnL4JlEVt+mVxn9hOUiZBoQahRW9ZnNMG5Kw6Wv6JWSGjRovqxS6F6h4U9lJMhRRjc5CWS7sHeEc1j6Lw1gLIUakZsbCLNnoXCJWom9dvfoykXrBG5J5eWAlQxTIQZswYxn2KoYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726124955; c=relaxed/simple;
	bh=h3Lmnlz528S8/t6/xm+dJSUg5+rr407M+k/crDtJlVo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MBcpXFcKFB3t3L1zxaBUVG1DxFDXcSoGTxZK/neDA21Q5DPWCVFtvmnzm6W8Ys2yzBjpNC+jXbkIidAJlkTHbr0EYkgx4lrumj3A1M83d8o3RJkj3O0Ufay+1LtmvBX33YjuHZoC+yRrPPdNAKcqo9PFCawnUlNThvh58kui7CM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N3F5NU+e; arc=fail smtp.client-ip=40.107.236.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N3F5NU+e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9nQ0Wah4IjYLalSjizK6cXrbY39JgMbmoh4RUegeV2KV/t850dC5x8LTXf0EN7DY93AQeFPXmtkjFMutvI8Kq2XqqoPoSZef38Z+096yaBCLPb26k47Dk9ong7gICn1Fa3yC1CW3bbXnc54yUNwZv1wKIxo9UExi+Chyv3zQLDOXjX3DNUkiIGuwtY7nj5BDrVEj6na1scc4W5iGlD5s8vzwo66PLQE8vAcicLEtnu1LUhB8+XO4t1wscHcZxlYZCKxre9ajIvh2138mwnuZlmfCPFosGgBfQ/5FLghgePhr6XWeTvR+ftc1WYaiseMS02E64yWP499/9SJlgbIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+nsiPfouhBfLPHb7BsksuSNiZWqezRoxR/yOS4ZXVU=;
 b=mhXCY08KfwYj4ZiDDBaYt3OHQ43By5IQpX9+re1S9TT1aIHfkql6Pr5kVAtGXf9VtJcTHN/sz/+DV/N/+XmSnC6QCsX+1lGI6UwqrNjKYCIn5WdquQNiXV93pbv6NrL8++YLk3SJ4f/J7aXMMw8/jrpOqs/Oqo7E2ltWb9JcC+8v9AjLMdPy+LJFmgCmFw2fp1QS0l2NJU9SOXbBhrLLWq26M/2MSH+nR3g3KCG+V5BbFXlsI0Qm4lcq4D1hXU9ElNB1xtY89QUyQkUfrD2dSP1RIaJvSq0LLnNuECzRIQc9t2xAC+UN2z/J0RshMfDPiMOXYUTvBbva8RwHw4dw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+nsiPfouhBfLPHb7BsksuSNiZWqezRoxR/yOS4ZXVU=;
 b=N3F5NU+eNPI9kRx7xVyRxNNHA7S3fMhd4goAJdWrE6Pk5KTz4p0XHlo4nWjCgKLh9R10GoOn68YLgDXfP3R3jo74yNftWXRXAgJ2hxzMR8X9JgBW3iW8xvyeoxzWwnBYm7Knoj78zVZtuYsBP/i5vDRTd1AsJSfiNxYBLSZGOV0=
Received: from BY3PR03CA0021.namprd03.prod.outlook.com (2603:10b6:a03:39a::26)
 by CH2PR12MB4167.namprd12.prod.outlook.com (2603:10b6:610:7a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 07:09:08 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::bf) by BY3PR03CA0021.outlook.office365.com
 (2603:10b6:a03:39a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Thu, 12 Sep 2024 07:09:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 12 Sep 2024 07:09:07 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Sep
 2024 02:08:59 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<naveenkrishna.chatradhi@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v4 8/9] misc: amd-sbi: Add supoort for register xfer
Date: Thu, 12 Sep 2024 07:08:09 +0000
Message-ID: <20240912070810.1644621-9-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|CH2PR12MB4167:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d0beb2-0550-4140-7982-08dcd2f9cb11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lThCb/1XcgUbja1SDZEOYk8hqxv+s4va7csXsF3+JuZYlxF5bM3tBPg9NIcp?=
 =?us-ascii?Q?bG+Bw9yV+qxWoqvpiia2rT7Tfi+DY+agM6uPh2Xr+jQARWAVaFbuSOkX+M99?=
 =?us-ascii?Q?m+S402rgsrtIqii16QjM3IJz5V9U0/WWu6wqh8UVYObJmRUtRCBvy0uayMIP?=
 =?us-ascii?Q?SHdWQYM9kXaCowPeqqM+Cei5u8TrSxdw5qY1emQyG0l7mNvCi5kmokd2FXG1?=
 =?us-ascii?Q?cSQFINvHYOPRoyr+J9SBg5pw3B8vUNLS5Pa8+BOtqQhZ2OAHElQs/cbFshkb?=
 =?us-ascii?Q?Np41o+DSXL6czrQB5OW/6hMVkZhkYj+th+PvyPGNLvRTjlZIpPjI49ZDoh/7?=
 =?us-ascii?Q?k/9R1V6yHcPYLDcnqpmPahvX5nbFudMxiYAiMSAwL0rSsfSd49GCP46P1qC+?=
 =?us-ascii?Q?Lhyr8cN/gS0PmTGhl3bx8Oyur40H9HsrAxi0FlWnhQRcW+fMZK5Ct4dvAX2X?=
 =?us-ascii?Q?0agVEssB228CX0mY6VMp8Xc6uZ+AcSI/jav8bSXJqACX5Hgc1KSPVPiWxXGt?=
 =?us-ascii?Q?Xqy9qtqVGdp/yW3bYolfMJTRNFNOwOHcvDj1aV6dP2FxX0yShM4hJw5mFc2d?=
 =?us-ascii?Q?5QwKMg/i4u9zpA39M3gafHr4xLiRyEmW95ieweGk3Hg7499aM5PpShxvxvj4?=
 =?us-ascii?Q?BZxqMfnDUPl/IWQoM13D7nLlws1l5Gx8OBa2SxykFmFZ/RJSuZon23rNRjSg?=
 =?us-ascii?Q?2qHC1mPSDCCrVZf9UGM86rQzaytOMljx2oXEvSJQ5BHtb14ksD/e5d78ichb?=
 =?us-ascii?Q?/Iqt5VGDZS5j/XzfgnuU1X+nPBvYHwpgqefoQTGSDnYFOs1Vmjcj9VI74lNk?=
 =?us-ascii?Q?hOY90r6lrc5jxO7K1N7cuxkCYKdf8ACM2gXekdUsy+30dzC3tJEH55ShPgZg?=
 =?us-ascii?Q?VrB8Eu71XGALwW7shaMVxfb3Ab2B3HgjE0p6K/FEh/zI4fGC69kKfSvx9ra2?=
 =?us-ascii?Q?pFE+TNN0faT+sUg3326aVEZD1029XBBlA3FnBoi/F/bChe2jdIU9JXpNyHL9?=
 =?us-ascii?Q?pDn+yuPDgk9SO3Pqr+WWrZ+q8HW6Nqw0DNcDwoAmIQptcxwHB9YfTmX9i79q?=
 =?us-ascii?Q?bx33Hw8hCmAQcTPUNUoLrABJjNBbs2MZ/tfbXpPKddBi8gZpw7HGlOQoTKYE?=
 =?us-ascii?Q?+p4XnNg0ZHWKPjecPPWipVdY8q6BGWIG7KT00RjSvJD03NkhGYdpbDcSQmqp?=
 =?us-ascii?Q?s7dP9Jj1E/MIACpAZVrHFu3trLSznrK77dAH4Hy1ONW9uNw5iqJ0QbNWW0iE?=
 =?us-ascii?Q?VkRCI/8q6PZwULp/0pZtT6mYzdN2bXv1PHvq6siaEudTWn3wlrO0QqypfA1J?=
 =?us-ascii?Q?noa0qmns7ZD1F7bVhveYYovqGqF9XQL778TrUxmNOSEihc/4dGvHOVMEY8Dw?=
 =?us-ascii?Q?ReANkt8AL4/h9/9KbHQzMaf5sYiW7vqIMfzqwt4RDnKKRb7lN9RYVEYX131K?=
 =?us-ascii?Q?qpFJutZqpRqdI0I/jU06ztYFqWV/hLc7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 07:09:07.3658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d0beb2-0550-4140-7982-08dcd2f9cb11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167

- Provide user register access over IOCTL.
  Both register read and write are supported.
- APML interface does not provide a syncronysation method. By defining,
  a register access path, we use APML modules and library for
  all APML transactions. Without having to use external tools such as
  i2c-tools, which may cause race conditions.

Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v2:
- Add ioctl description comment

Changes since v2:
- update the MACROS name as per feedback

Changes since v1:
- bifurcated from previous patch 5

 drivers/misc/amd-sbi/rmi-core.c | 22 ++++++++++++++++++++++
 include/uapi/misc/amd-apml.h    |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 0ec7fcd1f73e..7907524909e2 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -351,6 +351,24 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	return ret;
 }
 
+static int rmi_register_xfer(struct sbrmi_data *data,
+			     struct apml_message *msg)
+{
+	int ret;
+
+	mutex_lock(&data->lock);
+	if (msg->data_in.reg_in[AMD_SBI_RD_FLAG_INDEX])
+		ret = regmap_read(data->regmap,
+				  msg->data_in.reg_in[AMD_SBI_REG_OFF_INDEX],
+				  &msg->data_out.mb_out[AMD_SBI_RD_WR_DATA_INDEX]);
+	else
+		ret = regmap_write(data->regmap,
+				   msg->data_in.reg_in[AMD_SBI_REG_OFF_INDEX],
+				   msg->data_in.reg_in[AMD_SBI_REG_VAL_INDEX]);
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
 static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
@@ -384,6 +402,10 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		/* MCAMSR protocol */
 		ret = rmi_mca_msr_read(data, &msg);
 		break;
+	case APML_REG:
+		/* REG R/W */
+		ret = rmi_register_xfer(data, &msg);
+		break;
 	default:
 		pr_err("Command:0x%x not recognized\n", msg.cmd);
 		break;
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
index f26b83b933de..ea8ebff495bf 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -10,6 +10,7 @@
 enum apml_protocol {
 	APML_CPUID	= 0x1000,
 	APML_MCA_MSR,
+	APML_REG,
 };
 
 /* These are byte indexes into data_in and data_out arrays */
@@ -28,6 +29,7 @@ struct apml_message {
 	 * Mailbox Messages:	0x0 ... 0x999
 	 * APML_CPUID:		0x1000
 	 * APML_MCA_MSR:	0x1001
+	 * APML_REG:		0x1002
 	 */
 	__u32 cmd;
 
@@ -45,6 +47,7 @@ struct apml_message {
 	/*
 	 * [0]...[3] mailbox 32bit input
 	 *	     cpuid & mca msr,
+	 *	     rmi rd/wr: reg_offset
 	 * [4][5] cpuid & mca msr: thread
 	 * [4] rmi reg wr: value
 	 * [6] cpuid: ext function & read eax/ebx or ecx/edx
@@ -85,6 +88,7 @@ struct apml_message {
  *  - Mailbox message read/write(0x0~0x999)
  *  - CPUID read(0x1000)
  *  - MCAMSR read(0x1001)
+ *  - Register read/write(0x1002)
  *  - returning "-EFAULT" if none of the above
  * "-EPROTOTYPE" error is returned to provide additional error details
  */
-- 
2.25.1

