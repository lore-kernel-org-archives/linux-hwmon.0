Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2055.outbound.protection.outlook.com [40.107.96.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862A518BBA7
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2024 07:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726124948; cv=fail; b=Qj+eqP+8MqaSKuc0P93z8pO3NtDoGeZbfLK8zLZnu82LQAUl8f6gVuaGPO4t+E9I7WxXS+QlRPDsMxQuVqtjiSMhqb7o0NYgXIdp6/8LiG4L6uEvqsOCExD9D9OM10BKs42BBlXs5Kd/ytB7U9XiECX0EYjm4crDViRX99b8OEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726124948; c=relaxed/simple;
	bh=uW5dOgPQm/D8CNLVBAQDoXHSnykIB3661jOBMayFIHU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NRtqQiTq9nWQ+OHTIyOxUgGXZkChQGxGU1H8xo+K2hHN3ZcAy+qlnz9f+kFhdM3PVnwgK9ooA65F6KkhKD+/Dl7mA9pUI9nhPoqkC6B8zubpdfKCf/k4scJ9TfTueCxLiI2atdlNv5NHgdcynsba1f3sX4WC8wndsplfsW4hH9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gO6uKw4k; arc=fail smtp.client-ip=40.107.96.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gO6uKw4k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SingobMDMFPQHOWMCfGYCG0Z1wtF9p5QRqSjphUT2m7p9TzDs1gTGMKhxUCW+SHqJMySdB7U1UeCot0BKoGL16feQamtvA8H8MgS6DmbAFcEOmfx8JQ+FEFcq2uDNhZwI3ERQg+IJRRgX2PJQMK+ZP7obIZ42gi0k1UQIlsLvEoruyzrymwnawwvYji6hHuctqiEmnGJa7pZ0R8NcCdZz+L2Urp/2+Z15TY8DBsnCS2icoqbXNj5OMuOz/lk287Zh60FJ/lRz/mA8kG8YPLoOrjQ6wN2qGCchszg1vbwnpRsyeWJORLbqlAoBeTrbblWx+WAxQjdjIvZm1gehX+tlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nXpne9a8ESiuP/GQb/yNxlPpXPTUY4kaPpgK4DmRKY=;
 b=Ewg0xPsbl6GM6mTGNl9uS+hbztStMLQY1KFezetGb0M7vP2DUtt7cCwHfKqWs1X9ccyp8BZKVI55OCU7Fj9fcAHqOgTwIGD1sprb22nMkzTkXZwkSjH97Ph68ZUIhDTs4CYBwm+yfe0u/uKWlw7fL9YfPPWryDF9jUTc1d/lGde8uxZJvOnhUUkmXyV/0YstVcVcrYelb//P3U7QzxaZf+FYqcizUYVWB/V4m3i7pDviogimp91pEh9JxNqbzls3vAKfaSx3Y9tbjNvXGymKbNekngv5CX9jg6s3o3LLUBt0d+WfE8DXE5s97U2un9TB3JTRcWCr56M/u2Hyj2egKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nXpne9a8ESiuP/GQb/yNxlPpXPTUY4kaPpgK4DmRKY=;
 b=gO6uKw4kwofSXg7xC192gKCnE4h7G2lKepZPmqaBwkQCpDLiQUl+hsLpxbWqifh/JMSp2M1xJL4lepUXYnUuzFF0NgEA97Pe+FO59TTrITvTLnhhzMu/MGmODVD46oZ0WZxC+YYbSkZbFGPP3VIEmtVD39Xa2v5CzQDUd8DT+Vc=
Received: from SJ0PR03CA0097.namprd03.prod.outlook.com (2603:10b6:a03:333::12)
 by PH8PR12MB6987.namprd12.prod.outlook.com (2603:10b6:510:1be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 07:09:01 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::14) by SJ0PR03CA0097.outlook.office365.com
 (2603:10b6:a03:333::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Thu, 12 Sep 2024 07:09:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 12 Sep 2024 07:09:00 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Sep
 2024 02:08:56 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<naveenkrishna.chatradhi@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v4 7/9] misc: amd-sbi: Add support for MCA register protocol
Date: Thu, 12 Sep 2024 07:08:08 +0000
Message-ID: <20240912070810.1644621-8-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|PH8PR12MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: f45032e6-66f6-49aa-3784-08dcd2f9c6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LGxOq5Agx64nnPmb50aG3HVOKNYVbdAku3WIZfyH2sHUp7ASy+zZuS98sUTJ?=
 =?us-ascii?Q?XW2zM1C1YVTdej+WE5nmmg48u4X7kB2Lxi1HwCt7RH8EktfTJIy/XqflEKAa?=
 =?us-ascii?Q?gn8XlrEfpaO3jMUwtZ0Ni3X7j8nx9y0xWQQR62Y9itvnhW4wVEGIJHr1UV3c?=
 =?us-ascii?Q?+RGtn7xta2T0T2KjW0I28rPIPxWgYXm5CgtRhMT6LifLx7+11AeQNcXB8FvC?=
 =?us-ascii?Q?8M7rzZ5p88yqXhHcmJZwZnf/9SuxcsWWu2AUlfNhJjGVKyNysatUvUVcxz79?=
 =?us-ascii?Q?8ik1Kzz0sWYFemIuOt2GhH93xUb0CXEzVPcbs4ig5sAWyO+QzHzb+0sdfAn1?=
 =?us-ascii?Q?L1uqwT7NCAPZK/tXPXUwFHZIQNAI/b4WkkWGmmE1HollnpFl3acIlFogT7R4?=
 =?us-ascii?Q?8UDXgq0E8FBr3Dd9qTAzqYOb9onjYmJa74uQ/ZMQXFLYHWUiBGWstjMqi6zE?=
 =?us-ascii?Q?aWNbICYjgriM/X80cBhA1wPbNqaPs+KmubD69n3+0sGawR5IfPcV4hvV3EOs?=
 =?us-ascii?Q?4dNe+MMwnc7DdYzgnXzb1OBHSNi+rLXE70yQRE+vXqhvF8u/e582gGhnUZuQ?=
 =?us-ascii?Q?khQAZeQIp6EBZXilXalB4nnFidTqInhlYRSEoJd2q014F4gmlBaNzXA6idE3?=
 =?us-ascii?Q?vTv/VSmzzobRIcA2y6f0FR+25bClg2TUitmc8TxUGModgTv61SWeVJ5tRRj/?=
 =?us-ascii?Q?hEraozhHH7GXWGotVsEW+/YppbhfvKZIr1DCYwS7Zdl7ClJiAOteIKt5mFc+?=
 =?us-ascii?Q?pZ6wnJSFxgoA43EDZSQ2snMhNF9z250Itkgf8Zoja3hWK7yoFZwjobJyJYkJ?=
 =?us-ascii?Q?sKBT8ExP3NvTakuhrb+gNveUQ6goOHQtrGxHGEVTStMT5+ZMNmgC/PcxeJ5F?=
 =?us-ascii?Q?SiMSGq2MMAnpOIeTwBKBpaAChl4maOnR0yvV/rJ4BeWrgxFCKuka+dcQktkp?=
 =?us-ascii?Q?/t+m51fR7Nsl0fA/OypRHoMOmXMq4dgByFLaQJCsloFvo8yy9GQOSu8rvPBj?=
 =?us-ascii?Q?y7hkGBh/9MRyBxe8Lw5r3vtwZkCTYmeEVjWpMRZT+MZIy755kdP1tSDKuSzF?=
 =?us-ascii?Q?O2SgdT6il+7lpDXGGD3ZaCMN01xbd8SepuHvHj37HUmf9xDRiJF1UEkXM46A?=
 =?us-ascii?Q?V7bnle2kMLhAoZ4Lz06EPXCnqOEMjeZeR5/WgX8AtF9rjmSqeHgCoepetZcz?=
 =?us-ascii?Q?NMDx/aOHaVBcezZ334Gxg4pDIQoEzl+CJOYPdCXsz7EAouAzhphKieiuZbK5?=
 =?us-ascii?Q?SHqXX6HI41/40svTo65VIE73LHT1GQLth63W5tPhmESl9ZoebLwc0KlAICOL?=
 =?us-ascii?Q?FOBdhlSMORKBFLPtkSvfmR4zOpnjStf6LfVu2QOvWzviwV+GOJrRMKQGK80P?=
 =?us-ascii?Q?rK7k3dyBWW3+AFZ1w8djRdGZmDzIpf4KSqr0LM/7Lll1cr+4Rt7y3T89u7zF?=
 =?us-ascii?Q?zscgXDtx6tJDXXH5cpWgLzV9v2YGLZQt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 07:09:00.0659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f45032e6-66f6-49aa-3784-08dcd2f9c6b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6987

- AMD provides custom protocol to read Machine Check Architecture(MCA)
  registers over sideband. The inforamtion is accessed for range of
  MCA registers by passing register address and thread ID to the protocol.
  Access is read-only

Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v3:
- Address review comments:
  - update the #define to inline function
  - pack the union inside the structure

Changes since v2:
- update the MACROS name as per feedback

Changes since v1:
- bifurcated from previous patch 5

 drivers/misc/amd-sbi/rmi-core.c | 100 ++++++++++++++++++++++++++++++++
 include/uapi/misc/amd-apml.h    |  18 ++++--
 2 files changed, 112 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 3efb11ac2910..0ec7fcd1f73e 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -32,10 +32,16 @@
 #define CPUID_WR_DATA_LEN	0x8
 #define CPUID_RD_REG_LEN	0xa
 #define CPUID_WR_REG_LEN	0x9
+/* MSR */
+#define MSR_RD_REG_LEN		0xa
+#define MSR_WR_REG_LEN		0x8
+#define MSR_RD_DATA_LEN		0x8
+#define MSR_WR_DATA_LEN		0x7
 
 /* CPUID MSR Command Ids */
 #define CPUID_MCA_CMD	0x73
 #define RD_CPUID_CMD	0x91
+#define RD_MCA_CMD	0x86
 
 /* input for bulk write to CPUID protocol */
 struct cpu_msr_indata {
@@ -72,6 +78,16 @@ static inline void prepare_cpuid_input_message(struct cpu_msr_indata *input,
 	input->ext		= ext_func;
 }
 
+static inline void prepare_mca_msr_input_message(struct cpu_msr_indata *input,
+						 u8 thread_id, u32 data_in)
+{
+	input->rd_len		= MSR_RD_DATA_LEN;
+	input->wr_len		= MSR_WR_DATA_LEN;
+	input->proto_cmd	= RD_MCA_CMD;
+	input->thread		= thread_id << 1;
+	input->value		= data_in;
+}
+
 static int sbrmi_get_rev(struct sbrmi_data *data)
 {
 	struct apml_message msg = { 0 };
@@ -169,6 +185,86 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
 	return ret;
 }
 
+/* MCA MSR protocol */
+static int rmi_mca_msr_read(struct sbrmi_data *data,
+			    struct apml_message *msg)
+{
+	struct cpu_msr_outdata output = {0};
+	struct cpu_msr_indata input = {0};
+	int ret, val = 0;
+	int hw_status;
+	u16 thread;
+
+	mutex_lock(&data->lock);
+	/* cache the rev value to identify if protocol is supported or not */
+	if (!data->rev) {
+		ret = sbrmi_get_rev(data);
+		if (ret < 0)
+			goto exit_unlock;
+	}
+	/* MCA MSR protocol for REV 0x10 is not supported*/
+	if (data->rev == 0x10) {
+		ret = -EOPNOTSUPP;
+		goto exit_unlock;
+	}
+
+	thread = msg->data_in.reg_in[AMD_SBI_THREAD_LOW_INDEX] |
+		 msg->data_in.reg_in[AMD_SBI_THREAD_HI_INDEX] << 8;
+
+	/* Thread > 127, Thread128 CS register, 1'b1 needs to be set to 1 */
+	if (thread > 127) {
+		thread -= 128;
+		val = 1;
+	}
+	ret = regmap_write(data->regmap, SBRMI_THREAD128CS, val);
+	if (ret < 0)
+		goto exit_unlock;
+
+	prepare_mca_msr_input_message(&input, thread,
+				      msg->data_in.mb_in[AMD_SBI_RD_WR_DATA_INDEX]);
+
+	ret = regmap_bulk_write(data->regmap, CPUID_MCA_CMD,
+				&input, MSR_WR_REG_LEN);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/*
+	 * For RMI Rev 0x20, new h/w status bit is introduced. which is used
+	 * by firmware to indicate completion of commands (0x71, 0x72, 0x73).
+	 * wait for the status bit to be set by the hardware before
+	 * reading the data out.
+	 */
+	ret = regmap_read_poll_timeout(data->regmap, SBRMI_STATUS, hw_status,
+				       hw_status & HW_ALERT_MASK, 500, 2000000);
+	if (ret)
+		goto exit_unlock;
+
+	ret = regmap_bulk_read(data->regmap, CPUID_MCA_CMD,
+			       &output, MSR_RD_REG_LEN);
+	if (ret < 0)
+		goto exit_unlock;
+
+	ret = regmap_write(data->regmap, SBRMI_STATUS,
+			   HW_ALERT_MASK);
+	if (ret < 0)
+		goto exit_unlock;
+
+	if (output.num_bytes != MSR_RD_REG_LEN - 1) {
+		ret = -EMSGSIZE;
+		goto exit_unlock;
+	}
+	if (output.status) {
+		ret = -EPROTOTYPE;
+		msg->fw_ret_code = output.status;
+		goto exit_unlock;
+	}
+	msg->data_out.cpu_msr_out = output.value;
+
+exit_unlock:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
 int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct apml_message *msg)
 {
@@ -284,6 +380,10 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	case APML_CPUID:
 		ret = rmi_cpuid_read(data, &msg);
 		break;
+	case APML_MCA_MSR:
+		/* MCAMSR protocol */
+		ret = rmi_mca_msr_read(data, &msg);
+		break;
 	default:
 		pr_err("Command:0x%x not recognized\n", msg.cmd);
 		break;
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
index 293532500450..f26b83b933de 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -7,8 +7,11 @@
 
 #include <linux/types.h>
 
-/* command ID to identify CPUID protocol */
-#define APML_CPUID	0x1000
+enum apml_protocol {
+	APML_CPUID	= 0x1000,
+	APML_MCA_MSR,
+};
+
 /* These are byte indexes into data_in and data_out arrays */
 #define AMD_SBI_RD_WR_DATA_INDEX	0
 #define AMD_SBI_REG_OFF_INDEX		0
@@ -24,13 +27,14 @@ struct apml_message {
 	/* message ids:
 	 * Mailbox Messages:	0x0 ... 0x999
 	 * APML_CPUID:		0x1000
+	 * APML_MCA_MSR:	0x1001
 	 */
 	__u32 cmd;
 
 	/*
 	 * 8 bit data for reg read,
 	 * 32 bit data in case of mailbox,
-	 * up to 64 bit in case of cpuid
+	 * up to 64 bit in case of cpuid and mca msr
 	 */
 	union {
 		__u64 cpu_msr_out;
@@ -40,8 +44,9 @@ struct apml_message {
 
 	/*
 	 * [0]...[3] mailbox 32bit input
-	 *	     cpuid,
-	 * [4][5] cpuid: thread
+	 *	     cpuid & mca msr,
+	 * [4][5] cpuid & mca msr: thread
+	 * [4] rmi reg wr: value
 	 * [6] cpuid: ext function & read eax/ebx or ecx/edx
 	 *	[7:0] -> bits [7:4] -> ext function &
 	 *	bit [0] read eax/ebx or ecx/edx
@@ -53,7 +58,7 @@ struct apml_message {
 		__u8 reg_in[8];
 	} data_in;
 	/*
-	 * Status code is returned in case of CPUID access
+	 * Status code is returned in case of CPUID/MCA access
 	 * Error code is returned in case of soft mailbox
 	 */
 	__u32 fw_ret_code;
@@ -79,6 +84,7 @@ struct apml_message {
  * The APML RMI module checks whether the cmd is
  *  - Mailbox message read/write(0x0~0x999)
  *  - CPUID read(0x1000)
+ *  - MCAMSR read(0x1001)
  *  - returning "-EFAULT" if none of the above
  * "-EPROTOTYPE" error is returned to provide additional error details
  */
-- 
2.25.1

