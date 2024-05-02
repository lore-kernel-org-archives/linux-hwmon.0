Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295C57C94
	for <linux-hwmon@vger.kernel.org>; Thu,  2 May 2024 22:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714687586; cv=fail; b=eqjaTqPb7IY5O+M19xEx72I9LPSKi7MIMXH84SK6ZkkeiNrmczj5BNwpAOHroKOX2tmFMnIfsa+w1m72czwckVq5DfrTxomC44upnJbbGnneJanmZNF1kIiqRmDxvr/YAI3LRItffSrsnJcOMo7gaGFwq3me646PcaZDgxrsVF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714687586; c=relaxed/simple;
	bh=s/It0QKpJ2o2KU0WoJNbQOLyq9vg/3shHpKEm77rPMk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mHsi9D8cZtd5cWd1wGnITWrFewEipXurseIl2i3cRgJTL+uxMZeEuUVQXVKHhZuJvzWekUEvP132/RFVZphfGlovLQ4XZW/5XjVimqrnDc8LDHiK+RRaPu2PiMQBpit2tDNfimQiI+9gw8fRNdB3Sogm+1sGYJ3nSg25LLtUXMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TBTt+yBt; arc=fail smtp.client-ip=40.107.93.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TBTt+yBt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTRKS9jyW/1Im1E9qrJUcvw0BBZOOFWggOjIZlSMMMhH9J0viTrcQpEF3m5WNL65YETNS8tAM70/OvypW4WLYSKKDBxRcryIk+71I+q9I8qhgQIWAlpI/gCA9ZMGBqiNfhXGbT94tfqzJXoYINaaLj8FFyKRjlJYFdQ15fc4WfsAeOX488IPbLsi8C39VIfXqPQzT2Dge0uplqEIButuWClDv8vgFU3ith4mG+EiLR1y3Hnq0/iAHImwLfQ/K/Bg4eLgzIPQcANWvD+fU+jQaNun4kn+G52INNaes2+UnBxYUeyfNnwqGHzgVm5ld02f4fcGT08O8Hi95+NgvSE9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qltmQXWnCr0hjanbHoR9ErP98ewSPlPqD6lRB1DK0ok=;
 b=eSoKAPbImIEEGQz7Apa+/ZLbvik1YJdTLLp6MoF7w97vz5PYTq+Y56X2ub7LSbiHQxFYfd+C92FqZd71mfWW4FRiW29Gt0jUaD5Wg3t/zpm+BcxsC9l49NaX2IPd/S1Wq5vXOsEtVs8PqD4BcGQXBBmiAQfsXxeqgIIA/ymSMPsnq1LACCM9AgLYtC5VaoMwXo06+3Ri/FXu0XKBuqGx3U2hC7iZYUgZQZK/LPLBUIxwabsgSPoyCSjDKlajNkIpGRVMsj0fa31cE1cOLOjHivrCO0H6bSfOwxmR9PXmfNREUtgK5XHg2czGiVEPslV8GA7qPhpbLhIop48KyoESPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qltmQXWnCr0hjanbHoR9ErP98ewSPlPqD6lRB1DK0ok=;
 b=TBTt+yBtLj4U/8JMhfxKmc6l9x59RVFajUT/46mh38yBHBU21slwmDQg/OWXVpXIokN4QzmHtWjHAvIUD/MDXzSIkuIHTYj+MFAS6ddT8cdRIMTQC146yHoRvVerFx5Q3fTFVkQHSqEcz9IJexQN5irFS6H4O4w1wHmS57Kvo+Q=
Received: from MW4P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::18)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Thu, 2 May
 2024 22:06:19 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:8b:cafe::ed) by MW4P221CA0013.outlook.office365.com
 (2603:10b6:303:8b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.27 via Frontend
 Transport; Thu, 2 May 2024 22:06:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.0 via Frontend Transport; Thu, 2 May 2024 22:06:19 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 2 May
 2024 17:06:14 -0500
From: Naveen Krishna Chatradhi <nchatrad@amd.com>
To: <linux-hwmon@vger.kernel.org>
CC: <linux@roeck-us.net>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>, Akshay Gupta <Akshay.Gupta@amd.com>
Subject: [PATCH 2/2] sbrmi: Add support for APML protocols
Date: Thu, 2 May 2024 22:05:54 +0000
Message-ID: <20240502220554.2768611-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240502220554.2768611-1-nchatrad@amd.com>
References: <20240502220554.2768611-1-nchatrad@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 43beaf03-0f3a-449e-0506-08dc6af41871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YpXNvkbv398QNW84sbr4+W8DQsEiQKQnGgVPS7qZhFonbG6lVq4ZCrmS0y6i?=
 =?us-ascii?Q?3J9sXphZdk9PGVYsRZh2zWCc98o+FhNczpGQKpv+USOzplDH4acfZqcCtEmz?=
 =?us-ascii?Q?oGhSHuF5Mhoxd9B0LCU104WnT8+aBgssqdie6agaVqZhqNKzll1EWdU2mGh9?=
 =?us-ascii?Q?Zl7uJKdz5tcXZ1CdTQhVX+DHbJgu0Z1mcN6o7AiSXGumgYyd6467qQpFIbP2?=
 =?us-ascii?Q?+IZAPcVVbP30UTtLkpyHJQRyApeVsZPvsl7CacP6VRHRURSN+jYk25LVXxB7?=
 =?us-ascii?Q?KlbBgN9wAXfJRMKAIRtnkS3g+K4qRH8fDaYOelGFCeimDZrbCxWSlrzAn338?=
 =?us-ascii?Q?ue53g0ysmtShDf7RwJZ4YiKfZC6YoNfgIuuySrCuymiZ6mGtU1lHWHKmRhpu?=
 =?us-ascii?Q?8uu2+SuR6FRXfIOf5SWaa1ltNS9rDWXu1fszU5yRC69n7/3AxaqQ+xolKtlf?=
 =?us-ascii?Q?efZYc5lWU9j5uzqUPUvRcDgE5OUs9rdHczG4V6+BHV+2cAfNJA+DdEth2mVk?=
 =?us-ascii?Q?IZ1YUuy34gLxcgRu0W4gUWdDbxiKXV6+74d0M97fT3TUT5/u11Opi9yNxVz9?=
 =?us-ascii?Q?DSobrD24/ogld8koIr/rO5am3MRTGs47Sk1koR7gWfMlLv4HkD9U5w94xX6P?=
 =?us-ascii?Q?OKUFbSx3gLQnQ/K0p1hdRYSAyioNibjqLzFYujTWzSejsrkXIP3mt7NcWsU7?=
 =?us-ascii?Q?G47nWK7KDgD5ML172Jj8rRGwiI1nMG5jpa+HaGbRn4RgF4mfamWqt3hFi9SK?=
 =?us-ascii?Q?Mk3dYdKnkP3+4nqSvwNrQAcrI0ntk3dUNANDzmILqDUp10dfMMP42fjgo0rZ?=
 =?us-ascii?Q?Qc5mNVWAZ0xkYDxe0J8I9A8CGlAvanbNbhevidZNSReXY126D2M2pJm6J7UE?=
 =?us-ascii?Q?9TzsZ8zy0DCSwkJwwSdP1O2US4nwrDfD22x+RYb/nlRa7fkLFRaUuV9cKiIT?=
 =?us-ascii?Q?dRnfxel5K0vuBEhZNDbbMC00mCwR3RnuFA1V266IuZ9IDeTXubOZ/A16YWtG?=
 =?us-ascii?Q?tG1XHZ4XkjrQUo8ECIPhGoB15S8q/NxgYtSyt5P101GlOp40wia04G7ZEsGW?=
 =?us-ascii?Q?mGgNMSUG1z49tj9x0Q+g4BABicUfGsW58cA87eNB7+PqvXJfBLiOJVaCvK2u?=
 =?us-ascii?Q?cPqn50jGNyMf/H4th2ybpcHof8Zw+/GIHcqDf+UDqhNKU+7hAKkFatvO9TTi?=
 =?us-ascii?Q?k1TKwtz+kzkUceo0FsnMcBAT5q3fNT4REhoPXqiF4+KJnxEo16tVlnLhyjZw?=
 =?us-ascii?Q?zC2ZU2AoZlHy9NVMcTSLz2/Qc6VngLAS7dRlPDhKDHLB5Mk1mV2X2nqF3oiT?=
 =?us-ascii?Q?AVBPTV0DdQvwT4TP2qsrOYgNZRduF6jT+qWfjCMnWiWRFpSNi0yUFyBVfhRO?=
 =?us-ascii?Q?7b8fHhY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 22:06:19.2829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43beaf03-0f3a-449e-0506-08dc6af41871
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154

From: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

The present sbrmi module only support reporting power. However, AMD data
center processors support various system management functionality
Out-of-band over Advanced Platform Management Link APML.

Register a miscdevice, which creates a device /dev/sbrmiX with an IOCTL
interface for the user space to invoke the following protocols.
  - Mailbox read/write (already defined in sbrmi_mailbox_xfer())
  - CPUID read
  - MCAMSR read

While at it, move caching of Max power limit from probe to hwmon_power_cap_max
- This will avoid sbrmi loading errors in the BMC, when the processors are down.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/hwmon/Makefile        |   3 +-
 drivers/hwmon/sbrmi-common.c  | 392 +++++++++++++++++++++++++++++++++
 drivers/hwmon/sbrmi-common.h  |  37 ++++
 drivers/hwmon/sbrmi.c         | 398 +++++++++++++++++-----------------
 include/uapi/linux/amd-apml.h |  74 +++++++
 5 files changed, 709 insertions(+), 195 deletions(-)
 create mode 100644 drivers/hwmon/sbrmi-common.c
 create mode 100644 drivers/hwmon/sbrmi-common.h
 create mode 100644 include/uapi/linux/amd-apml.h

diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 47be39af5c03..2a2833533e2d 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -183,7 +183,8 @@ obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
-obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
+apml_sbrmi-objs  = sbrmi.o sbrmi-common.o
+obj-$(CONFIG_SENSORS_SBRMI)	+= apml_sbrmi.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
 obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
diff --git a/drivers/hwmon/sbrmi-common.c b/drivers/hwmon/sbrmi-common.c
new file mode 100644
index 000000000000..2c205154af4d
--- /dev/null
+++ b/drivers/hwmon/sbrmi-common.c
@@ -0,0 +1,392 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * sbrmi-common.c - file defining SB-RMI protocols
+ *		    compliant AMD SoC device.
+ *
+ * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
+ */
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+
+#include "sbrmi-common.h"
+
+/* Mask for Status Register bit[1] */
+#define SW_ALERT_MASK	0x2
+/* Mask to check H/W Alert status bit */
+#define HW_ALERT_MASK	0x80
+
+/* Software Interrupt for triggering */
+#define START_CMD	0x80
+#define TRIGGER_MAILBOX	0x01
+
+/* Default message lengths as per APML command protocol */
+/* MSR */
+#define MSR_RD_REG_LEN		0xa
+#define MSR_WR_REG_LEN		0x8
+#define MSR_RD_DATA_LEN		0x8
+#define MSR_WR_DATA_LEN		0x7
+/* CPUID */
+#define CPUID_RD_DATA_LEN	0x8
+#define CPUID_WR_DATA_LEN	0x8
+#define CPUID_RD_REG_LEN	0xa
+#define CPUID_WR_REG_LEN	0x9
+
+/* CPUID MSR Command Ids */
+#define CPUID_MCA_CMD	0x73
+#define RD_CPUID_CMD	0x91
+#define RD_MCA_CMD	0x86
+
+/* SB-RMI registers */
+enum sbrmi_reg {
+	SBRMI_REV		= 0x0,
+	SBRMI_CTRL		= 0x01,
+	SBRMI_STATUS,
+	SBRMI_OUTBNDMSG0	= 0x30,
+	SBRMI_OUTBNDMSG1,
+	SBRMI_OUTBNDMSG2,
+	SBRMI_OUTBNDMSG3,
+	SBRMI_OUTBNDMSG4,
+	SBRMI_OUTBNDMSG5,
+	SBRMI_OUTBNDMSG6,
+	SBRMI_OUTBNDMSG7,
+	SBRMI_INBNDMSG0,
+	SBRMI_INBNDMSG1,
+	SBRMI_INBNDMSG2,
+	SBRMI_INBNDMSG3,
+	SBRMI_INBNDMSG4,
+	SBRMI_INBNDMSG5,
+	SBRMI_INBNDMSG6,
+	SBRMI_INBNDMSG7,
+	SBRMI_SW_INTERRUPT,
+	SBRMI_THREAD128CS	= 0x4b,
+};
+
+/* input for bulk write to CPUID and MSR protocol */
+struct cpu_msr_indata {
+	u8 wr_len;	/* const value */
+	u8 rd_len;	/* const value */
+	u8 proto_cmd;	/* const value */
+	u8 thread;	/* thread number */
+	union {
+		u8 reg_offset[4];	/* input value */
+		u32 value;
+	};
+	u8 ext; /* extended function */
+} __packed;
+
+/* output for bulk read from CPUID and MSR protocol */
+struct cpu_msr_outdata {
+	u8 num_bytes;	/* number of bytes return */
+	u8 status;	/* Protocol status code */
+	union {
+		u64 value;
+		u8 reg_data[8];
+	};
+} __packed;
+
+#define prepare_mca_msr_input_message(input, thread_id, data_in)	\
+	input.rd_len = MSR_RD_DATA_LEN,					\
+	input.wr_len = MSR_WR_DATA_LEN,					\
+	input.proto_cmd = RD_MCA_CMD,					\
+	input.thread = thread_id << 1,					\
+	input.value =  data_in
+
+#define prepare_cpuid_input_message(input, thread_id, func, ext_func)	\
+	input.rd_len = CPUID_RD_DATA_LEN,				\
+	input.wr_len = CPUID_WR_DATA_LEN,				\
+	input.proto_cmd = RD_CPUID_CMD,					\
+	input.thread = thread_id << 1,					\
+	input.value =  func,						\
+	input.ext =  ext_func
+
+static int sbrmi_get_rev(struct apml_sbrmi_device *rmi_dev)
+{
+	struct apml_message msg = { 0 };
+	int ret;
+
+	msg.data_in.reg_in[REG_OFF_INDEX] = SBRMI_REV;
+	msg.data_in.reg_in[RD_FLAG_INDEX] = 1;
+	ret = regmap_read(rmi_dev->regmap,
+			  msg.data_in.reg_in[REG_OFF_INDEX],
+			  &msg.data_out.mb_out[RD_WR_DATA_INDEX]);
+	if (ret < 0)
+		return ret;
+
+	rmi_dev->rev = msg.data_out.reg_out[RD_WR_DATA_INDEX];
+	return 0;
+}
+
+/*
+ * For Mailbox command software alert status bit is set by firmware
+ * to indicate command completion
+ * For RMI Rev 0x20, new h/w status bit is introduced. which is used
+ * by firmware to indicate completion of commands (0x71, 0x72, 0x73).
+ * wait for the status bit to be set by the firmware before
+ * reading the data out.
+ */
+static int sbrmi_wait_status(struct apml_sbrmi_device *rmi_dev,
+			     int *status, int mask)
+{
+	int ret, retry = 100;
+
+	do {
+		ret = regmap_read(rmi_dev->regmap, SBRMI_STATUS, status);
+		if (ret < 0)
+			return ret;
+
+		if (*status & mask)
+			break;
+
+		/* Wait 1~2 second for firmware to return data out */
+		if (retry > 95)
+			usleep_range(50, 100);
+		else
+			usleep_range(10000, 20000);
+	} while (retry--);
+
+	if (retry < 0)
+		ret = -ETIMEDOUT;
+	return ret;
+}
+
+/* MCA MSR protocol */
+int sbrmi_mca_msr_read(struct apml_sbrmi_device *rmi_dev,
+		     struct apml_message *msg)
+{
+	struct cpu_msr_outdata output = {0};
+	struct cpu_msr_indata input = {0};
+	int ret, val = 0;
+	int hw_status;
+	u16 thread;
+
+	/* cache the rev value to identify if protocol is supported or not */
+	if (!rmi_dev->rev) {
+		ret = sbrmi_get_rev(rmi_dev);
+		if (ret < 0)
+			return ret;
+	}
+	/* MCA MSR protocol for REV 0x10 is not supported*/
+	if (rmi_dev->rev == 0x10)
+		return -EOPNOTSUPP;
+
+	thread = msg->data_in.reg_in[THREAD_LOW_INDEX] |
+		 msg->data_in.reg_in[THREAD_HI_INDEX] << 8;
+
+	/* Thread > 127, Thread128 CS register, 1'b1 needs to be set to 1 */
+	if (thread > 127) {
+		thread -= 128;
+		val = 1;
+	}
+	ret = regmap_write(rmi_dev->regmap, SBRMI_THREAD128CS, val);
+	if (ret < 0)
+		goto exit_unlock;
+
+	prepare_mca_msr_input_message(input, thread,
+				      msg->data_in.mb_in[RD_WR_DATA_INDEX]);
+
+	ret = regmap_bulk_write(rmi_dev->regmap, CPUID_MCA_CMD,
+				&input, MSR_WR_REG_LEN);
+	if (ret < 0)
+		goto exit_unlock;
+
+	ret = sbrmi_wait_status(rmi_dev, &hw_status, HW_ALERT_MASK);
+	if (ret < 0)
+		goto exit_unlock;
+
+	ret = regmap_bulk_read(rmi_dev->regmap, CPUID_MCA_CMD,
+			       &output, MSR_RD_REG_LEN);
+	if (ret < 0)
+		goto exit_unlock;
+
+	ret = regmap_write(rmi_dev->regmap, SBRMI_STATUS,
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
+	return ret;
+}
+
+/* CPUID protocol for REV 0x20 */
+int sbrmi_cpuid_read(struct apml_sbrmi_device *rmi_dev,
+		       struct apml_message *msg)
+{
+	struct cpu_msr_indata input = {0};
+	struct cpu_msr_outdata output = {0};
+	int val = 0;
+	int ret, hw_status;
+	u16 thread;
+
+	/* cache the rev value to identify if protocol is supported or not */
+	if (!rmi_dev->rev) {
+		ret = sbrmi_get_rev(rmi_dev);
+		if (ret < 0)
+			return ret;
+	}
+	/* CPUID protocol for REV 0x10 is not supported*/
+	if (rmi_dev->rev == 0x10)
+		return -EOPNOTSUPP;
+
+	thread = msg->data_in.reg_in[THREAD_LOW_INDEX] |
+		 msg->data_in.reg_in[THREAD_HI_INDEX] << 8;
+
+	/* Thread > 127, Thread128 CS register, 1'b1 needs to be set to 1 */
+	if (thread > 127) {
+		thread -= 128;
+		val = 1;
+	}
+	ret = regmap_write(rmi_dev->regmap, SBRMI_THREAD128CS, val);
+	if (ret < 0)
+		goto exit_unlock;
+
+	prepare_cpuid_input_message(input, thread,
+				    msg->data_in.mb_in[RD_WR_DATA_INDEX],
+				    msg->data_in.reg_in[EXT_FUNC_INDEX]);
+
+	ret = regmap_bulk_write(rmi_dev->regmap, CPUID_MCA_CMD,
+				&input, CPUID_WR_REG_LEN);
+	if (ret < 0)
+		goto exit_unlock;
+
+	ret = sbrmi_wait_status(rmi_dev, &hw_status, HW_ALERT_MASK);
+	if (ret < 0)
+		goto exit_unlock;
+
+	ret = regmap_bulk_read(rmi_dev->regmap, CPUID_MCA_CMD,
+			       &output, CPUID_RD_REG_LEN);
+	if (ret < 0)
+		goto exit_unlock;
+
+	ret = regmap_write(rmi_dev->regmap, SBRMI_STATUS,
+			   HW_ALERT_MASK);
+	if (ret < 0)
+		goto exit_unlock;
+
+	if (output.num_bytes != CPUID_RD_REG_LEN - 1) {
+		ret = -EMSGSIZE;
+		goto exit_unlock;
+	}
+	if (output.status) {
+		ret = -EPROTOTYPE;
+		msg->fw_ret_code = output.status;
+		goto exit_unlock;
+	}
+	msg->data_out.cpu_msr_out = output.value;
+exit_unlock:
+	return ret;
+}
+
+static int sbrmi_clear_status_alert(struct apml_sbrmi_device *rmi_dev)
+{
+	int sw_status, ret;
+
+	ret = regmap_read(rmi_dev->regmap, SBRMI_STATUS,
+			  &sw_status);
+	if (ret < 0)
+		return ret;
+
+	if (!(sw_status & SW_ALERT_MASK))
+		return 0;
+
+	return regmap_write(rmi_dev->regmap, SBRMI_STATUS,
+			    SW_ALERT_MASK);
+}
+
+int sbrmi_mailbox_xfer(struct apml_sbrmi_device *rmi_dev,
+		     struct apml_message *msg)
+{
+	unsigned int bytes = 0, ec = 0;
+	int i, ret;
+	int sw_status;
+	u8 byte = 0;
+
+	msg->fw_ret_code = 0;
+
+	ret = sbrmi_clear_status_alert(rmi_dev);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/* Indicate firmware a command is to be serviced */
+	ret = regmap_write(rmi_dev->regmap, SBRMI_INBNDMSG7, START_CMD);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/* Write the command to SBRMI::InBndMsg_inst0 */
+	ret = regmap_write(rmi_dev->regmap, SBRMI_INBNDMSG0, msg->cmd);
+	if (ret < 0)
+		goto exit_unlock;
+
+	/*
+	 * For both read and write the initiator (BMC) writes
+	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
+	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
+	 */
+	for (i = 0; i < MB_DATA_SIZE; i++) {
+		byte = msg->data_in.reg_in[i];
+		ret = regmap_write(rmi_dev->regmap, SBRMI_INBNDMSG1 + i, byte);
+		if (ret < 0)
+			goto exit_unlock;
+	}
+
+	/*
+	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
+	 * perform the requested read or write command
+	 */
+	ret = regmap_write(rmi_dev->regmap, SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
+	if (ret)
+		goto exit_unlock;
+
+	/*
+	 * Firmware will write SBRMI::Status[SwAlertSts]=1 to generate
+	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
+	 * of the requested command
+	 */
+	ret = sbrmi_wait_status(rmi_dev, &sw_status, SW_ALERT_MASK);
+	if (ret)
+		goto exit_unlock;
+
+	ret = regmap_read(rmi_dev->regmap, SBRMI_OUTBNDMSG7, &ec);
+	if (ret || ec)
+		goto exit_clear_alert;
+
+	/*
+	 * For a read operation, the initiator (BMC) reads the firmware
+	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
+	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
+	 */
+	if (msg->data_in.reg_in[RD_FLAG_INDEX]) {
+		for (i = 0; i < MB_DATA_SIZE; i++) {
+			ret = regmap_read(rmi_dev->regmap,
+					  SBRMI_OUTBNDMSG1 + i, &bytes);
+			if (ret < 0)
+				break;
+			msg->data_out.reg_out[i] = bytes;
+		}
+	}
+exit_clear_alert:
+	/*
+	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
+	 * ALERT to initiator
+	 */
+	ret = regmap_write(rmi_dev->regmap, SBRMI_STATUS,
+			   SW_ALERT_MASK);
+	if (ec) {
+		ret = -EPROTOTYPE;
+		msg->fw_ret_code = ec;
+	}
+exit_unlock:
+	return ret;
+}
diff --git a/drivers/hwmon/sbrmi-common.h b/drivers/hwmon/sbrmi-common.h
new file mode 100644
index 000000000000..77ae2cf1d979
--- /dev/null
+++ b/drivers/hwmon/sbrmi-common.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AMD_APML_SBRMI_H_
+#define _AMD_APML_SBRMI_H_
+
+#include <linux/miscdevice.h>
+#include <uapi/linux/amd-apml.h>
+
+/* Each client has this additional data */
+/* in_progress: set during any transaction, mailbox/cpuid/mcamsr/readreg,
+ * to indicate a transaction is in progress.
+ * no_new_trans: set in rmmod/unbind path to indicate,
+ * not to accept new transactions
+ */
+struct apml_sbrmi_device {
+	struct miscdevice sbrmi_misc_dev;
+	struct completion misc_fops_done;
+	struct regmap *regmap;
+	/* Mutex locking */
+	struct mutex lock;
+	atomic_t in_progress;
+	atomic_t no_new_trans;
+	u32 pwr_limit_max;
+	u8 rev;
+	u8 dev_static_addr;
+} __packed;
+
+int sbrmi_mca_msr_read(struct apml_sbrmi_device *rmi_dev,
+		     struct apml_message *msg);
+int sbrmi_cpuid_read(struct apml_sbrmi_device *rmi_dev,
+		   struct apml_message *msg);
+int sbrmi_mailbox_xfer(struct apml_sbrmi_device *rmi_dev,
+		     struct apml_message *msg);
+#endif /*_AMD_APML_SBRMI_H_*/
diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c
index 901bd82d71d4..03cb51a4d6e8 100644
--- a/drivers/hwmon/sbrmi.c
+++ b/drivers/hwmon/sbrmi.c
@@ -3,7 +3,7 @@
  * sbrmi.c - hwmon driver for a SB-RMI mailbox
  *           compliant AMD SoC device.
  *
- * Copyright (C) 2020-2021 Advanced Micro Devices, Inc.
+ * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
  */

 #include <linux/delay.h>
@@ -11,19 +11,22 @@
 #include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
+#include <linux/io.h>
+#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/fs.h>
 #include <linux/regmap.h>

+#include "sbrmi-common.h"
+
 /* Do not allow setting negative power limit */
 #define SBRMI_PWR_MIN	0
-/* Mask for Status Register bit[1] */
-#define SW_ALERT_MASK	0x2
+/* SBRMI REVISION REG */
+#define SBRMI_REV	0x0

-/* Software Interrupt for triggering */
-#define START_CMD	0x80
-#define TRIGGER_MAILBOX	0x01
+#define MAX_WAIT_TIME_SEC	(3)

 /*
  * SB-RMI supports soft mailbox service request to MP1 (power management
@@ -37,192 +40,67 @@ enum sbrmi_msg_id {
 	SBRMI_READ_PKG_MAX_PWR_LIMIT,
 };

-/* SB-RMI registers */
-enum sbrmi_reg {
-	SBRMI_CTRL		= 0x01,
-	SBRMI_STATUS,
-	SBRMI_OUTBNDMSG0	= 0x30,
-	SBRMI_OUTBNDMSG1,
-	SBRMI_OUTBNDMSG2,
-	SBRMI_OUTBNDMSG3,
-	SBRMI_OUTBNDMSG4,
-	SBRMI_OUTBNDMSG5,
-	SBRMI_OUTBNDMSG6,
-	SBRMI_OUTBNDMSG7,
-	SBRMI_INBNDMSG0,
-	SBRMI_INBNDMSG1,
-	SBRMI_INBNDMSG2,
-	SBRMI_INBNDMSG3,
-	SBRMI_INBNDMSG4,
-	SBRMI_INBNDMSG5,
-	SBRMI_INBNDMSG6,
-	SBRMI_INBNDMSG7,
-	SBRMI_SW_INTERRUPT,
-};
-
-/* Each client has this additional data */
-struct sbrmi_data {
-	struct i2c_client *client;
-	struct mutex lock;
-	struct regmap *regmap;
-	u32 pwr_limit_max;
-};
-
-struct sbrmi_mailbox_msg {
-	u8 cmd;
-	bool read;
-	u32 data_in;
-	u32 data_out;
-};
-
-static int sbrmi_enable_alert(struct sbrmi_data *data)
+static int sbrmi_get_max_pwr_limit(struct apml_sbrmi_device *rmi_dev)
 {
-	int ctrl, ret = 0;
+	struct apml_message msg = { 0 };
+	int ret = 0;

-	/*
-	 * Enable the SB-RMI Software alert status
-	 * by writing 0 to bit 4 of Control register(0x1)
-	 */
-	ret = regmap_read(data->regmap, SBRMI_STATUS, &ctrl);
+	msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
+	msg.data_in.reg_in[RD_FLAG_INDEX] = 1;
+	ret = sbrmi_mailbox_xfer(rmi_dev, &msg);
 	if (ret < 0)
 		return ret;
+	rmi_dev->pwr_limit_max = msg.data_out.mb_out[RD_WR_DATA_INDEX];

-	if (ctrl & 0x10) {
-		ctrl &= ~0x10;
-		return regmap_write(data->regmap, SBRMI_CTRL, ctrl);
-	}
-
-	return 0;
-}
-
-static int rmi_mailbox_xfer(struct sbrmi_data *data,
-			    struct sbrmi_mailbox_msg *msg)
-{
-	unsigned int bytes = 0;
-	int i, ret, retry = 10;
-	int sw_status;
-	u8 byte;
-
-	mutex_lock(&data->lock);
-
-	/* Indicate firmware a command is to be serviced */
-	ret = regmap_write(data->regmap, SBRMI_INBNDMSG7, START_CMD);
-	if (ret < 0)
-		goto exit_unlock;
-
-	/* Write the command to SBRMI::InBndMsg_inst0 */
-	ret = regmap_write(data->regmap, SBRMI_INBNDMSG0, msg->cmd);
-	if (ret < 0)
-		goto exit_unlock;
-
-	/*
-	 * For both read and write the initiator (BMC) writes
-	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
-	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
-	 */
-	for (i = 0; i < 4; i++) {
-		byte = (msg->data_in >> i * 8) & 0xff;
-		ret = regmap_write(data->regmap, SBRMI_INBNDMSG1 + i, byte);
-		if (ret < 0)
-			goto exit_unlock;
-	}
-
-	/*
-	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
-	 * perform the requested read or write command
-	 */
-	ret = regmap_write(data->regmap, SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
-	if (ret < 0)
-		goto exit_unlock;
-
-	/*
-	 * Firmware will write SBRMI::Status[SwAlertSts]=1 to generate
-	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
-	 * of the requested command
-	 */
-	do {
-		ret = regmap_read(data->regmap, SBRMI_STATUS, &sw_status);
-		if (sw_status < 0) {
-			ret = sw_status;
-			goto exit_unlock;
-		}
-		if (sw_status & SW_ALERT_MASK)
-			break;
-		usleep_range(50, 100);
-	} while (retry--);
-
-	if (retry < 0) {
-		dev_err(&data->client->dev,
-			"Firmware fail to indicate command completion\n");
-		ret = -EIO;
-		goto exit_unlock;
-	}
-
-	/*
-	 * For a read operation, the initiator (BMC) reads the firmware
-	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
-	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
-	 */
-	if (msg->read) {
-		for (i = 0; i < 4; i++) {
-			ret = regmap_read(data->regmap,
-					  SBRMI_OUTBNDMSG1 + i, &bytes);
-			if (ret < 0)
-				goto exit_unlock;
-			msg->data_out |= bytes << i * 8;
-		}
-	}
-
-	/*
-	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
-	 * ALERT to initiator
-	 */
-	ret = regmap_write(data->regmap, SBRMI_STATUS,
-			   sw_status | SW_ALERT_MASK);
-exit_unlock:
-	mutex_unlock(&data->lock);
 	return ret;
 }

 static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 		      u32 attr, int channel, long *val)
 {
-	struct sbrmi_data *data = dev_get_drvdata(dev);
-	struct sbrmi_mailbox_msg msg = { 0 };
-	int ret;
+	struct apml_sbrmi_device *rmi_dev = dev_get_drvdata(dev);
+	struct apml_message msg = { 0 };
+	int ret = 0;

 	if (type != hwmon_power)
 		return -EINVAL;

-	msg.read = true;
+	mutex_lock(&rmi_dev->lock);
+	msg.data_in.reg_in[RD_FLAG_INDEX] = 1;
+
 	switch (attr) {
 	case hwmon_power_input:
 		msg.cmd = SBRMI_READ_PKG_PWR_CONSUMPTION;
-		ret = rmi_mailbox_xfer(data, &msg);
+		ret = sbrmi_mailbox_xfer(rmi_dev, &msg);
 		break;
 	case hwmon_power_cap:
 		msg.cmd = SBRMI_READ_PKG_PWR_LIMIT;
-		ret = rmi_mailbox_xfer(data, &msg);
+		ret = sbrmi_mailbox_xfer(rmi_dev, &msg);
 		break;
 	case hwmon_power_cap_max:
-		msg.data_out = data->pwr_limit_max;
-		ret = 0;
+		if (!rmi_dev->pwr_limit_max) {
+			/* Cache maximum power limit */
+			ret = sbrmi_get_max_pwr_limit(rmi_dev);
+		}
+		msg.data_out.mb_out[RD_WR_DATA_INDEX] = rmi_dev->pwr_limit_max;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
-	if (ret < 0)
-		return ret;
-	/* hwmon power attributes are in microWatt */
-	*val = (long)msg.data_out * 1000;
+	if (!ret)
+		/* hwmon power attributes are in microWatt */
+		*val = (long)msg.data_out.mb_out[RD_WR_DATA_INDEX] * 1000;
+
+	mutex_unlock(&rmi_dev->lock);
 	return ret;
 }

 static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel, long val)
 {
-	struct sbrmi_data *data = dev_get_drvdata(dev);
-	struct sbrmi_mailbox_msg msg = { 0 };
+	struct apml_sbrmi_device *rmi_dev = dev_get_drvdata(dev);
+	struct apml_message msg = { 0 };
+	int ret;

 	if (type != hwmon_power && attr != hwmon_power_cap)
 		return -EINVAL;
@@ -232,13 +110,16 @@ static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
 	 */
 	val /= 1000;

-	val = clamp_val(val, SBRMI_PWR_MIN, data->pwr_limit_max);
+	val = clamp_val(val, SBRMI_PWR_MIN, rmi_dev->pwr_limit_max);

 	msg.cmd = SBRMI_WRITE_PKG_PWR_LIMIT;
-	msg.data_in = val;
-	msg.read = false;
+	msg.data_in.mb_in[RD_WR_DATA_INDEX] = val;
+	msg.data_in.reg_in[RD_FLAG_INDEX] = 0;

-	return rmi_mailbox_xfer(data, &msg);
+	mutex_lock(&rmi_dev->lock);
+	ret = sbrmi_mailbox_xfer(rmi_dev, &msg);
+	mutex_unlock(&rmi_dev->lock);
+	return ret;
 }

 static umode_t sbrmi_is_visible(const void *data,
@@ -278,60 +159,187 @@ static const struct hwmon_chip_info sbrmi_chip_info = {
 	.info = sbrmi_info,
 };

-static int sbrmi_get_max_pwr_limit(struct sbrmi_data *data)
+static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	int __user *arguser = (int  __user *)arg;
+	struct apml_message msg = { 0 };
+	struct apml_sbrmi_device *rmi_dev;
+	bool read = false;
+	int ret = -EFAULT;
+
+	rmi_dev = container_of(fp->private_data, struct apml_sbrmi_device,
+			       sbrmi_misc_dev);
+	if (!rmi_dev)
+		return -ENODEV;
+
+	/*
+	 * If device remove/unbind is called do not allow new transaction
+	 */
+	if (atomic_read(&rmi_dev->no_new_trans))
+		return -EBUSY;
+	/* Copy the structure from user */
+	if (copy_struct_from_user(&msg, sizeof(msg), arguser,
+				  sizeof(struct apml_message)))
+		return ret;
+
+	/*
+	 * Only one I2C transaction can happen at
+	 * one time. Take lock across so no two protocol is
+	 * invoked at same time, modifying the register value.
+	 */
+	mutex_lock(&rmi_dev->lock);
+	/* Verify device unbind/remove is not invoked */
+	if (atomic_read(&rmi_dev->no_new_trans)) {
+		mutex_unlock(&rmi_dev->lock);
+		return -EBUSY;
+	}
+	/* Is this a read/monitor/get request */
+	if (msg.data_in.reg_in[RD_FLAG_INDEX])
+		read = true;
+
+	/*
+	 * Set the in_progress variable to true, to wait for
+	 * completion during unbind/remove of driver
+	 */
+	atomic_set(&rmi_dev->in_progress, 1);
+	switch (msg.cmd) {
+	case 0 ... 0x999:
+		/* Mailbox protocol */
+		ret = sbrmi_mailbox_xfer(rmi_dev, &msg);
+		break;
+	case APML_CPUID:
+		ret = sbrmi_cpuid_read(rmi_dev, &msg);
+		break;
+	case APML_MCA_MSR:
+		/* MCAMSR protocol */
+		ret = sbrmi_mca_msr_read(rmi_dev, &msg);
+		break;
+	case APML_REG:
+		/* REG R/W */
+		if (read) {
+			ret = regmap_read(rmi_dev->regmap,
+					  msg.data_in.reg_in[REG_OFF_INDEX],
+					  &msg.data_out.mb_out[RD_WR_DATA_INDEX]);
+		} else {
+			ret = regmap_write(rmi_dev->regmap,
+					   msg.data_in.reg_in[REG_OFF_INDEX],
+					   msg.data_in.reg_in[REG_VAL_INDEX]);
+		}
+		break;
+	default:
+		break;
+	}
+
+	/* Send complete only if device is unbinded/remove */
+	if (atomic_read(&rmi_dev->no_new_trans))
+		complete(&rmi_dev->misc_fops_done);
+
+	atomic_set(&rmi_dev->in_progress, 0);
+	mutex_unlock(&rmi_dev->lock);
+	/* Copy results back to user only for get/monitor commands and firmware failures */
+	if ((read && !ret) || ret == -EPROTOTYPE) {
+		if (copy_to_user(arguser, &msg, sizeof(struct apml_message)))
+			ret = -EFAULT;
+	}
+	return ret;
+}
+
+static const struct file_operations sbrmi_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= sbrmi_ioctl,
+	.compat_ioctl	= sbrmi_ioctl,
+};
+
+static int create_misc_sbrmi_device(struct apml_sbrmi_device *rmi_dev,
+				  struct device *dev)
 {
-	struct sbrmi_mailbox_msg msg = { 0 };
 	int ret;

-	msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
-	msg.read = true;
-	ret = rmi_mailbox_xfer(data, &msg);
-	if (ret < 0)
+	rmi_dev->sbrmi_misc_dev.name		= devm_kasprintf(dev,
+								 GFP_KERNEL,
+								 "sbrmi-%x",
+								 rmi_dev->dev_static_addr);
+	rmi_dev->sbrmi_misc_dev.minor		= MISC_DYNAMIC_MINOR;
+	rmi_dev->sbrmi_misc_dev.fops		= &sbrmi_fops;
+	rmi_dev->sbrmi_misc_dev.parent		= dev;
+	rmi_dev->sbrmi_misc_dev.nodename	= devm_kasprintf(dev,
+								 GFP_KERNEL,
+								 "sbrmi-%x",
+								 rmi_dev->dev_static_addr);
+	rmi_dev->sbrmi_misc_dev.mode		= 0600;
+
+	ret = misc_register(&rmi_dev->sbrmi_misc_dev);
+	if (ret)
 		return ret;
-	data->pwr_limit_max = msg.data_out;

+	dev_info(dev, "register %s device\n", rmi_dev->sbrmi_misc_dev.name);
 	return ret;
 }

-static int sbrmi_probe(struct i2c_client *client)
+static int sbrmi_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
-	struct sbrmi_data *data;
+	struct apml_sbrmi_device *rmi_dev;
 	struct regmap_config sbrmi_i2c_regmap_config = {
 		.reg_bits = 8,
 		.val_bits = 8,
 	};
-	int ret;

-	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
-	if (!data)
+	rmi_dev = devm_kzalloc(dev, sizeof(struct apml_sbrmi_device), GFP_KERNEL);
+	if (!rmi_dev)
 		return -ENOMEM;

-	data->client = client;
-	mutex_init(&data->lock);
-	data->regmap = devm_regmap_init_i2c(client, &sbrmi_i2c_regmap_config);
-	if (IS_ERR(data->regmap))
-		return PTR_ERR(data->regmap);
-
-	/* Enable alert for SB-RMI sequence */
-	ret = sbrmi_enable_alert(data);
-	if (ret < 0)
-		return ret;
+	atomic_set(&rmi_dev->in_progress, 0);
+	atomic_set(&rmi_dev->no_new_trans, 0);
+	mutex_init(&rmi_dev->lock);

-	/* Cache maximum power limit */
-	ret = sbrmi_get_max_pwr_limit(data);
-	if (ret < 0)
-		return ret;
+	rmi_dev->regmap = devm_regmap_init_i2c(client, &sbrmi_i2c_regmap_config);
+	if (IS_ERR(rmi_dev->regmap))
+		return PTR_ERR(rmi_dev->regmap);

-	dev_set_drvdata(dev, (void *)data);
+	dev_set_drvdata(dev, (void *)rmi_dev);

 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
-							 data,
+							 rmi_dev,
 							 &sbrmi_chip_info,
 							 NULL);
+	if (!hwmon_dev)
+		return PTR_ERR_OR_ZERO(hwmon_dev);
+
+	rmi_dev->dev_static_addr = client->addr;
+
+	init_completion(&rmi_dev->misc_fops_done);
+	return create_misc_sbrmi_device(rmi_dev, dev);
+}
+
+static void sbrmi_i2c_remove(struct i2c_client *client)
+{
+	struct apml_sbrmi_device *rmi_dev = dev_get_drvdata(&client->dev);
+
+	if (!rmi_dev)
+		return;

-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	/*
+	 * Set the no_new_trans so no new transaction can
+	 * occur in sbrmi_ioctl
+	 */
+	atomic_set(&rmi_dev->no_new_trans, 1);
+	/*
+	 * If any transaction is in progress wait for the
+	 * transaction to get complete
+	 * Max wait is 3 sec for any pending transaction to
+	 */
+	if (atomic_read(&rmi_dev->in_progress))
+		wait_for_completion_timeout(&rmi_dev->misc_fops_done,
+					    MAX_WAIT_TIME_SEC * HZ);
+	misc_deregister(&rmi_dev->sbrmi_misc_dev);
+	/* Assign fops and parent of misc dev to NULL */
+	rmi_dev->sbrmi_misc_dev.fops = NULL;
+	rmi_dev->sbrmi_misc_dev.parent = NULL;
+
+	dev_info(&client->dev, "Removed sbrmi driver\n");
+	return;
 }

 static const struct i2c_device_id sbrmi_id[] = {
@@ -354,12 +362,14 @@ static struct i2c_driver sbrmi_driver = {
 		.name = "sbrmi",
 		.of_match_table = of_match_ptr(sbrmi_of_match),
 	},
-	.probe = sbrmi_probe,
+	.probe = sbrmi_i2c_probe,
+	.remove = sbrmi_i2c_remove,
 	.id_table = sbrmi_id,
 };

 module_i2c_driver(sbrmi_driver);

 MODULE_AUTHOR("Akshay Gupta <akshay.gupta@amd.com>");
+MODULE_AUTHOR("Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>");
 MODULE_DESCRIPTION("Hwmon driver for AMD SB-RMI emulated sensor");
 MODULE_LICENSE("GPL");
diff --git a/include/uapi/linux/amd-apml.h b/include/uapi/linux/amd-apml.h
new file mode 100644
index 000000000000..6a01a8cd3092
--- /dev/null
+++ b/include/uapi/linux/amd-apml.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
+ */
+#ifndef _AMD_APML_H_
+#define _AMD_APML_H_
+
+#include <linux/types.h>
+
+enum apml_protocol {
+	APML_CPUID	= 0x1000,
+	APML_MCA_MSR,
+	APML_REG,
+};
+
+/* These are byte indexes into data_in and data_out arrays */
+#define RD_WR_DATA_INDEX	0
+#define REG_OFF_INDEX		0
+#define REG_VAL_INDEX		4
+#define THREAD_LOW_INDEX	4
+#define THREAD_HI_INDEX		5
+#define EXT_FUNC_INDEX		6
+#define RD_FLAG_INDEX		7
+
+#define MB_DATA_SIZE		4
+
+struct apml_message {
+	/* message ids:
+	 * Mailbox Messages:	0x0 ... 0x999
+	 * APML_CPUID:		0x1000
+	 * APML_MCA_MSR:	0x1001
+	 * APML_REG:		0x1002 (RMI & TSI reg access)
+	 */
+	__u32 cmd;
+
+	/*
+	 * 8 bit data for reg read,
+	 * 32 bit data in case of mailbox,
+	 * up to 64 bit in case of cpuid and mca msr
+	 */
+	union {
+		__u64 cpu_msr_out;
+		__u32 mb_out[2];
+		__u8 reg_out[8];
+	} data_out;
+
+	/*
+	 * [0]...[3] mailbox 32bit input
+	 *	     cpuid & mca msr,
+	 *	     rmi rd/wr: reg_offset
+	 * [4][5] cpuid & mca msr: thread
+	 * [4] rmi reg wr: value
+	 * [6] cpuid: ext function & read eax/ebx or ecx/edx
+	 *	[7:0] -> bits [7:4] -> ext function &
+	 *	bit [0] read eax/ebx or ecx/edx
+	 * [7] read/write functionality
+	 */
+	union {
+		__u64 cpu_msr_in;
+		__u32 mb_in[2];
+		__u8 reg_in[8];
+	} data_in;
+	/*
+	 * Status code is returned in case of CPUID/MCA access
+	 * Error code is returned in case of soft mailbox
+	 */
+	__u32 fw_ret_code;
+} __attribute__((packed));
+
+/* ioctl command for mailbox msgs using generic _IOWR */
+#define SBRMI_BASE_IOCTL_NR      0xF9
+#define SBRMI_IOCTL_CMD          _IOWR(SBRMI_BASE_IOCTL_NR, 0, struct apml_message)
+
+#endif /*_AMD_APML_H_*/
--
2.25.1

