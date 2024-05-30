Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C07F179954
	for <linux-hwmon@vger.kernel.org>; Thu, 30 May 2024 11:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068232; cv=fail; b=gy4UZ7w1d8U4x+AiPKjHf1YBtUWmMw1sFClwSei4u54aTV4GyB6g80OwH/2tMOgylcdC544fDVHB7KsmQibACYDCq6tPRNnA9YNfaCTxLWgEs8olkD/k7U4vhNhlS2Z4/IEnzr4fIIbV6dT1yHL3maQKL/8t+AJrBFNlCULej0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068232; c=relaxed/simple;
	bh=z/osxjlYXfwtbXcb8OeffJzz7nbAiQG/MZc769pMRQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cHeZjdM+5diarzxvQmXcz1oMUMn9kwCFWa1Tpr+aKuAfB2Mr91al6qs0oMkq01D+0v1oD88P8/7mNZo847HvCnecAOVlLaQsENPnThQ+zIleXYPi4OujBbd+ec5xc/aLQL7j3FRBqAfOUEQ0cvCuIgBAikrDEaSIuTV6c3/Zbno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wfoo9dH2; arc=fail smtp.client-ip=40.107.243.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wfoo9dH2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lp4tgaTbCDth+XvXGX+m0w/Pg1AZfV5ESxJOlPhahOoxfv8w5qTc73btNRG176rveuOk6yYPUOGK+ZN2rBUCFD/7IbQZaXXPe7VMxYljs4b9X/sitKg2o7QPVHafW/1WzEZXdeE3Qw6vLHMIxhSWKS/7zegBhJDfHOkRhODB25ZEjojRjF01bE7ditEE99ArDVGH+DC2xpJUCa12zmWU2U1xkrQzywzAuSrSB34Yn0JFg1ePgqayXyocJIreTzQkdZgN+XbFEIty6SqwSJhoeMkvoxozc5v7wrBpQItNTxy6XuggwTVD3mzJsO71TY6pM/UAMjXpPqfGs4pavbdHjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFSMVLo8vax1ObIyYL5DWogRG1eVQR8Y9yzYE7MrGog=;
 b=jl0kRr/zUeoUCTAvGCN3qNtvbhW9uG4iD57ILocSkVJTFtePV3W90xl0ABe/nwR7oCrCPh/Uc0oU+mMZzLffo3U0YzJsNuxJG0WxwKnYeR00uWHtncBrUlzv0oz05gBOFI2gzlVJWRrLmQjnjmMvat/m0t+klxoqgYmPByPBF4D2nNpBnCpaZwAVkPN/948vmOewzHJOtE/mr3danaSvBRHuVYl7WsbXiot/VxTL7syUYNekZhU5SjfNEjl8iwGsk+9w4b17/VbqN3jQOITZD8JxacoYiEmf/cxiyQoGYQ6xohPHhBWwbkiDGr0/Ldk5k8U0/RZA2AO+6yEUXk6yjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFSMVLo8vax1ObIyYL5DWogRG1eVQR8Y9yzYE7MrGog=;
 b=wfoo9dH23GXqADYRaFlKEjEKqoJ+gkBykW8Xk4qZ/RXH4uJmq988uX8QUjnowJCfhXaiVQY9zVszW++LEFpyAtUnsBDiB7NF50aE0WW8ntABE9lMdLZcMNLpdMmOTrLHYKqM7nb1kstGJKs4Fo5eWth3lrZMswLImFdDS4OEt8w=
Received: from MN2PR17CA0036.namprd17.prod.outlook.com (2603:10b6:208:15e::49)
 by CH0PR12MB8508.namprd12.prod.outlook.com (2603:10b6:610:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Thu, 30 May
 2024 11:23:47 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::1) by MN2PR17CA0036.outlook.office365.com
 (2603:10b6:208:15e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21 via Frontend
 Transport; Thu, 30 May 2024 11:23:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 30 May 2024 11:23:46 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 May
 2024 06:23:43 -0500
From: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <lee@kernel.org>, <gregkh@linuxfoundation.org>,
	<arnd@arndb.de>, Akshay Gupta <akshay.gupta@amd.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 5/5] mfd/hwmon: sbrmi: Add support for APML protocols
Date: Thu, 30 May 2024 11:23:07 +0000
Message-ID: <20240530112307.3089696-6-naveenkrishna.chatradhi@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
References: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|CH0PR12MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e366dd3-ebff-4575-aa87-08dc809af8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ufj7l3vdU/Bx9LgcGaE8D8uFznPFTLEgVdOZChY4Pmc7W5J3o3JM3cUKYR1F?=
 =?us-ascii?Q?z9GIRXetAizg2RkeY2ei6dOC2YjUAdM9+leYRt8CgFY8TA3kIqR2kAbJ40fa?=
 =?us-ascii?Q?h+FQg88vYQ4FqcClUxHYHp557Bo2731FaRou1GsmFYwLQw+VDtS6C4w8XtZY?=
 =?us-ascii?Q?bsO2fH6fELH5+mik2no9ZEpywJ8uV/eVYWQJrzlBE00lyRwZWeQBKxhqQ8T1?=
 =?us-ascii?Q?kmXRbDEz6RXtlO6T/7mtPTLZ33FvjjKT8IZkWNHhIGzkOM+Ljm01v4z02kyF?=
 =?us-ascii?Q?8y9W+qSUHteKja3zVKFvBhv93yRNM46YYDXdefjnhmwi/Y3VW20sWZx/B/59?=
 =?us-ascii?Q?RpkAKZU4axI1cRon8+5htN5GAarTTh7iQqyeWAedTheJQamdBCZbLMocix1n?=
 =?us-ascii?Q?RJTzyluSe0dPlBDEXVtSOmfV+zD11uHYWlNxtzEwOymkr+CCG+aTpIx9hDXE?=
 =?us-ascii?Q?t/hnQhjOTxs2X/UOEi8qfhqY+SGNWmmixwmD7CPU5/TmT8FQ/IFQlTkFjAHs?=
 =?us-ascii?Q?D9Vf5nZYo6Ba7C+Bxa20sjYjV0qFQEG/WsfYmL55ANj6/o7f9VsgjM3qt+Ri?=
 =?us-ascii?Q?Xux8/2uHm59Di0mSp7U7i0ZGVsGD4P8O+JYm6RrnkxuFZllow1xTQMMgjm2D?=
 =?us-ascii?Q?60HRWZbwKWDYxXKekAYj6oewa+HkN7vyshYHFs5hRdBwG/wlrYkVna0ms47z?=
 =?us-ascii?Q?ZFjc0OiU76t5bBrIULLrX10TG9AKuIU+Tvq2aJqSQSRgN9U5HEtgg6QQ1i8Z?=
 =?us-ascii?Q?roq6hgYkyg3tCyqb53s/KXto3fhRJIY0vLKR2V7dWuaB3YZHKS+cOUy/wfKa?=
 =?us-ascii?Q?GTrZgAVJKUKhP+7zjxO4e3Nf9xFox8e5Rn8Oiy8H3fMCcX3OUBmjJja9YJ0/?=
 =?us-ascii?Q?GNqcKUVdhSPKu/Pigso3Pi9Cvx3qsNovJRgGSn/zpevXgrkPiUsD7I1bu4jn?=
 =?us-ascii?Q?iMsmRHFUfynA8KWmCcOKj7eK0uspjiF2B/VqYXYiVH3BzHLAhUc0oM/erFy3?=
 =?us-ascii?Q?1FUy2tERY2cxwhgPK9frhbW/5e3kb0sYINPcO1mtoDVeyl8u3RdxY0NNTUrW?=
 =?us-ascii?Q?JO4i+ezSnnMbaljs9t2662bOCLd0avSvTgXIY6/QLk0IN0zG7lx421l0fKvU?=
 =?us-ascii?Q?l+npApmnGbQXlJKA4y6mpKXyP5yPXM0ktysvkXJXCSNXIT6fmzlZ3V9HId70?=
 =?us-ascii?Q?Wqhlu43gGxYjc6iOfUyi4x34o4pOjBl8EXP1lE5fB63rDtzjSvMD4hpzocOk?=
 =?us-ascii?Q?U4j6x500CswnO3+AJUr35xyq65j7Uaqkhs9opBLkU+aqYivjGQaC90CzBhOv?=
 =?us-ascii?Q?NFX35/uYo9h6Y9DsyhzrjfgM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 11:23:46.9860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e366dd3-ebff-4575-aa87-08dc809af8fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8508

From: Akshay Gupta <akshay.gupta@amd.com>

The present sbrmi module only support reporting power via hwmon.
However, AMD data center range of processors support various
system management functionality Out-of-band over
Advanced Platform Management Link (APML).

Register a miscdevice, which creates a device /dev/sbrmiX with an IOCTL
interface for the user space to invoke the following protocols.
  - Mailbox read/write (already defined in sbrmi_mailbox_xfer())
  - CPUID read
  - MCAMSR read

Open-sourced and widely used https://github.com/amd/esmi_oob_library
will continue to provide user-space programmable API.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/hwmon/sbrmi.c         |  43 ++--
 drivers/mfd/sbrmi-core.c      | 461 +++++++++++++++++++++++++++++-----
 drivers/mfd/sbrmi-core.h      |  36 +++
 drivers/mfd/sbrmi-i2c.c       |  81 ++++--
 include/linux/mfd/amd-sb.h    |  32 ++-
 include/uapi/linux/amd-apml.h |  74 ++++++
 6 files changed, 615 insertions(+), 112 deletions(-)
 create mode 100644 drivers/mfd/sbrmi-core.h
 create mode 100644 include/uapi/linux/amd-apml.h

diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c
index aaeb5050eb0c..a8bf9aea52f9 100644
--- a/drivers/hwmon/sbrmi.c
+++ b/drivers/hwmon/sbrmi.c
@@ -19,42 +19,46 @@
 static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 		      u32 attr, int channel, long *val)
 {
-	struct sbrmi_data *data = dev_get_drvdata(dev);
-	struct sbrmi_mailbox_msg msg = { 0 };
+	struct apml_sbrmi_device *rmi_dev = dev_get_drvdata(dev);
+	struct apml_message msg = { 0 };
 	int ret;
 
 	if (type != hwmon_power)
 		return -EINVAL;
 
-	msg.read = true;
+	mutex_lock(&rmi_dev->lock);
+	msg.data_in.reg_in[RD_FLAG_INDEX] = 1;
 	switch (attr) {
 	case hwmon_power_input:
 		msg.cmd = SBRMI_READ_PKG_PWR_CONSUMPTION;
-		ret = rmi_mailbox_xfer(data, &msg);
+		ret = rmi_mailbox_xfer(rmi_dev, &msg);
 		break;
 	case hwmon_power_cap:
 		msg.cmd = SBRMI_READ_PKG_PWR_LIMIT;
-		ret = rmi_mailbox_xfer(data, &msg);
+		ret = rmi_mailbox_xfer(rmi_dev, &msg);
 		break;
 	case hwmon_power_cap_max:
-		msg.data_out = data->pwr_limit_max;
 		ret = 0;
+		msg.data_out.mb_out[RD_WR_DATA_INDEX] = rmi_dev->pwr_limit_max;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
-	if (ret < 0)
-		return ret;
+
 	/* hwmon power attributes are in microWatt */
-	*val = (long)msg.data_out * 1000;
+	if (!ret)
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
@@ -64,13 +68,16 @@ static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
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
+	ret = rmi_mailbox_xfer(rmi_dev, &msg);
+	mutex_unlock(&rmi_dev->lock);
+	return ret;
 }
 
 static umode_t sbrmi_is_visible(const void *data,
@@ -114,9 +121,9 @@ static int sbrmi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device *hwmon_dev;
-	struct sbrmi_data *data  = dev_get_drvdata(pdev->dev.parent);
+	struct apml_sbrmi_device *rmi_dev  = dev_get_drvdata(pdev->dev.parent);
 
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, "sbrmi", data,
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "sbrmi", rmi_dev,
 							 &sbrmi_chip_info, NULL);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
diff --git a/drivers/mfd/sbrmi-core.c b/drivers/mfd/sbrmi-core.c
index d5fbe5676cab..05d6c68d78b6 100644
--- a/drivers/mfd/sbrmi-core.c
+++ b/drivers/mfd/sbrmi-core.c
@@ -7,45 +7,271 @@
  */
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/fs.h>
 #include <linux/mfd/amd-sb.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
+#include "sbrmi-core.h"
 
 /* Mask for Status Register bit[1] */
 #define SW_ALERT_MASK	0x2
+/* Mask to check H/W Alert status bit */
+#define HW_ALERT_MASK	0x80
 
 /* Software Interrupt for triggering */
 #define START_CMD	0x80
 #define TRIGGER_MAILBOX	0x01
 
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
+static int rmi_mca_msr_read(struct apml_sbrmi_device *rmi_dev,
+			    struct apml_message *msg)
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
+/* Read CPUID function protocol */
+static int rmi_cpuid_read(struct apml_sbrmi_device *rmi_dev,
+			  struct apml_message *msg)
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
 
-static int sbrmi_clear_status_alert(struct sbrmi_data *data)
+static int sbrmi_clear_status_alert(struct apml_sbrmi_device *rmi_dev)
 {
 	int sw_status, ret;
 
-	ret = regmap_read(data->regmap, SBRMI_STATUS,
+	ret = regmap_read(rmi_dev->regmap, SBRMI_STATUS,
 			  &sw_status);
 	if (ret < 0)
 		return ret;
@@ -53,31 +279,31 @@ static int sbrmi_clear_status_alert(struct sbrmi_data *data)
 	if (!(sw_status & SW_ALERT_MASK))
 		return 0;
 
-	return regmap_write(data->regmap, SBRMI_STATUS,
+	return regmap_write(rmi_dev->regmap, SBRMI_STATUS,
 			    SW_ALERT_MASK);
 }
 
-int rmi_mailbox_xfer(struct sbrmi_data *data,
-		     struct sbrmi_mailbox_msg *msg)
+int rmi_mailbox_xfer(struct apml_sbrmi_device *rmi_dev,
+		     struct apml_message *msg)
 {
-	unsigned int bytes;
-	int i, ret, retry = 10;
+	unsigned int bytes, ec;
+	int i, ret;
 	int sw_status;
 	u8 byte;
 
-	mutex_lock(&data->lock);
+	msg->fw_ret_code = 0;
 
-	ret = sbrmi_clear_status_alert(data);
+	ret = sbrmi_clear_status_alert(rmi_dev);
 	if (ret < 0)
 		goto exit_unlock;
 
 	/* Indicate firmware a command is to be serviced */
-	ret = regmap_write(data->regmap, SBRMI_INBNDMSG7, START_CMD);
+	ret = regmap_write(rmi_dev->regmap, SBRMI_INBNDMSG7, START_CMD);
 	if (ret < 0)
 		goto exit_unlock;
 
 	/* Write the command to SBRMI::InBndMsg_inst0 */
-	ret = regmap_write(data->regmap, SBRMI_INBNDMSG0, msg->cmd);
+	ret = regmap_write(rmi_dev->regmap, SBRMI_INBNDMSG0, msg->cmd);
 	if (ret < 0)
 		goto exit_unlock;
 
@@ -86,9 +312,9 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
 	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
 	 */
-	for (i = 0; i < 4; i++) {
-		byte = (msg->data_in >> i * 8) & 0xff;
-		ret = regmap_write(data->regmap, SBRMI_INBNDMSG1 + i, byte);
+	for (i = 0; i < MB_DATA_SIZE; i++) {
+		byte = msg->data_in.reg_in[i];
+		ret = regmap_write(rmi_dev->regmap, SBRMI_INBNDMSG1 + i, byte);
 		if (ret < 0)
 			goto exit_unlock;
 	}
@@ -97,7 +323,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
 	 * perform the requested read or write command
 	 */
-	ret = regmap_write(data->regmap, SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
+	ret = regmap_write(rmi_dev->regmap, SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
 	if (ret < 0)
 		goto exit_unlock;
 
@@ -106,46 +332,159 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
 	 * of the requested command
 	 */
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
-		ret = -EIO;
+	ret = sbrmi_wait_status(rmi_dev, &sw_status, SW_ALERT_MASK);
+	if (ret < 0)
 		goto exit_unlock;
-	}
+
+	ret = regmap_read(rmi_dev->regmap, SBRMI_OUTBNDMSG7, &ec);
+	if (ret || ec)
+		goto exit_clear_alert;
 
 	/*
 	 * For a read operation, the initiator (BMC) reads the firmware
 	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
 	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
 	 */
-	if (msg->read) {
-		for (i = 0; i < 4; i++) {
-			ret = regmap_read(data->regmap,
+	if (msg->data_in.reg_in[RD_FLAG_INDEX]) {
+		for (i = 0; i < MB_DATA_SIZE; i++) {
+			ret = regmap_read(rmi_dev->regmap,
 					  SBRMI_OUTBNDMSG1 + i, &bytes);
 			if (ret < 0)
-				goto exit_unlock;
-			msg->data_out |= bytes << i * 8;
+				break;
+			msg->data_out.reg_out[i] = bytes;
 		}
 	}
-
+exit_clear_alert:
 	/*
 	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
 	 * ALERT to initiator
 	 */
-	ret = regmap_write(data->regmap, SBRMI_STATUS,
-			   sw_status | SW_ALERT_MASK);
-
+	ret = regmap_write(rmi_dev->regmap, SBRMI_STATUS,
+			   SW_ALERT_MASK);
+	if (ec) {
+		ret = -EPROTOTYPE;
+		msg->fw_ret_code = ec;
+	}
 exit_unlock:
-	mutex_unlock(&data->lock);
 	return ret;
 }
 EXPORT_SYMBOL(rmi_mailbox_xfer);
+
+static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	int __user *arguser = (int  __user *)arg;
+	struct apml_message msg = { 0 };
+	bool read = false;
+	int ret = -EFAULT;
+
+	struct apml_sbrmi_device *rmi_dev = container_of(fp->private_data, struct apml_sbrmi_device,
+							 sbrmi_misc_dev);
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
+
+	/* Is this a read/monitor/get request */
+	if (msg.data_in.reg_in[RD_FLAG_INDEX])
+		read = true;
+
+	/*
+	 * Set the in_progress variable to true, to wait for
+	 * completion during unbind/remove of driver
+	 */
+	atomic_set(&rmi_dev->in_progress, 1);
+
+	switch (msg.cmd) {
+	case 0 ... 0x999:
+		/* Mailbox protocol */
+		ret = rmi_mailbox_xfer(rmi_dev, &msg);
+		break;
+	case APML_CPUID:
+		ret = rmi_cpuid_read(rmi_dev, &msg);
+		break;
+	case APML_MCA_MSR:
+		/* MCAMSR protocol */
+		ret = rmi_mca_msr_read(rmi_dev, &msg);
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
+
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
+int create_misc_rmi_device(struct apml_sbrmi_device *rmi_dev,
+			   struct device *dev)
+{
+	int ret;
+
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
+		return ret;
+
+	dev_info(dev, "register %s device\n", rmi_dev->sbrmi_misc_dev.name);
+	return ret;
+}
diff --git a/drivers/mfd/sbrmi-core.h b/drivers/mfd/sbrmi-core.h
new file mode 100644
index 000000000000..6339931d4eb3
--- /dev/null
+++ b/drivers/mfd/sbrmi-core.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _SBRMI_CORE__H_
+#define _SBRMI_CORE__H_
+
+/* SB-RMI registers */
+enum sbrmi_reg {
+	SBRMI_REV		= 0x00,
+	SBRMI_CTRL,
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
+int create_misc_rmi_device(struct apml_sbrmi_device *rmi_dev,
+			   struct device *dev);
+#endif /*_SBRMI_CORE__H_*/
diff --git a/drivers/mfd/sbrmi-i2c.c b/drivers/mfd/sbrmi-i2c.c
index bdf15a7a2167..a8dcb7a92af8 100644
--- a/drivers/mfd/sbrmi-i2c.c
+++ b/drivers/mfd/sbrmi-i2c.c
@@ -12,18 +12,18 @@
 #include <linux/init.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/amd-sb.h>
-#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
+#include "sbrmi-core.h"
 
-#define SBRMI_CTRL	0x1
+#define MAX_WAIT_TIME_SEC	(3)
 
 static struct mfd_cell apml_sbrmi[] = {
 	{ .name = "sbrmi-hwmon" },
 };
 
-static int sbrmi_enable_alert(struct sbrmi_data *data)
+static int sbrmi_enable_alert(struct apml_sbrmi_device *rmi_dev)
 {
 	int ctrl, ret;
 
@@ -31,29 +31,29 @@ static int sbrmi_enable_alert(struct sbrmi_data *data)
 	 * Enable the SB-RMI Software alert status
 	 * by writing 0 to bit 4 of Control register(0x1)
 	 */
-	ret = regmap_read(data->regmap, SBRMI_CTRL, &ctrl);
+	ret = regmap_read(rmi_dev->regmap, SBRMI_CTRL, &ctrl);
 	if (ret < 0)
 		return ret;
 
 	if (ctrl & 0x10) {
 		ctrl &= ~0x10;
-		return regmap_write(data->regmap, SBRMI_CTRL, ctrl);
+		return regmap_write(rmi_dev->regmap, SBRMI_CTRL, ctrl);
 	}
 
 	return 0;
 }
 
-static int sbrmi_get_max_pwr_limit(struct sbrmi_data *data)
+static int sbrmi_get_max_pwr_limit(struct apml_sbrmi_device *rmi_dev)
 {
-	struct sbrmi_mailbox_msg msg = { 0 };
+	struct apml_message msg = { 0 };
 	int ret;
 
 	msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
-	msg.read = true;
-	ret = rmi_mailbox_xfer(data, &msg);
+	msg.data_in.reg_in[RD_FLAG_INDEX] = 1;
+	ret = rmi_mailbox_xfer(rmi_dev, &msg);
 	if (ret < 0)
 		return ret;
-	data->pwr_limit_max = msg.data_out;
+	rmi_dev->pwr_limit_max = msg.data_out.mb_out[RD_WR_DATA_INDEX];
 
 	return ret;
 }
@@ -61,40 +61,76 @@ static int sbrmi_get_max_pwr_limit(struct sbrmi_data *data)
 static int sbrmi_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct sbrmi_data *data;
+	struct apml_sbrmi_device *rmi_dev;
 	struct regmap_config sbrmi_i2c_regmap_config = {
 		.reg_bits = 8,
 		.val_bits = 8,
 	};
 	int ret;
 
-	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
-	if (!data)
+	rmi_dev = devm_kzalloc(dev, sizeof(struct apml_sbrmi_device), GFP_KERNEL);
+	if (!rmi_dev)
 		return -ENOMEM;
 
-	mutex_init(&data->lock);
+	atomic_set(&rmi_dev->in_progress, 0);
+	atomic_set(&rmi_dev->no_new_trans, 0);
+	mutex_init(&rmi_dev->lock);
 
-	data->regmap = devm_regmap_init_i2c(client, &sbrmi_i2c_regmap_config);
-	if (IS_ERR(data->regmap))
-		return PTR_ERR(data->regmap);
+	rmi_dev->regmap = devm_regmap_init_i2c(client, &sbrmi_i2c_regmap_config);
+	if (IS_ERR(rmi_dev->regmap))
+		return PTR_ERR(rmi_dev->regmap);
 
 	/* Enable alert for SB-RMI sequence */
-	ret = sbrmi_enable_alert(data);
+	ret = sbrmi_enable_alert(rmi_dev);
 	if (ret < 0)
 		return ret;
 
 	/* Cache maximum power limit */
-	ret = sbrmi_get_max_pwr_limit(data);
+	ret = sbrmi_get_max_pwr_limit(rmi_dev);
 	if (ret < 0)
 		return ret;
 
-	dev_set_drvdata(dev, (void *)data);
+	dev_set_drvdata(dev, (void *)rmi_dev);
 
 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, apml_sbrmi,
 				   ARRAY_SIZE(apml_sbrmi), NULL, 0, NULL);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "Failed to register for sub-devices: %d\n", ret);
-	return ret;
+		return ret;
+	}
+
+	rmi_dev->dev_static_addr = client->addr;
+	init_completion(&rmi_dev->misc_fops_done);
+	return create_misc_rmi_device(rmi_dev, dev);
+}
+
+static void sbrmi_i2c_remove(struct i2c_client *client)
+{
+	struct apml_sbrmi_device *rmi_dev = dev_get_drvdata(&client->dev);
+
+	if (!rmi_dev)
+		return;
+	/*
+	 * Set the no_new_trans so no new transaction can
+	 * occur in sbrmi_ioctl
+	 */
+	atomic_set(&rmi_dev->no_new_trans, 1);
+	/*
+	 * If any transaction is in progress wait for the
+	 * transaction to get complete
+	 * Max wait is 3 sec for any pending transaction to
+	 * complete.
+	 */
+	if (atomic_read(&rmi_dev->in_progress))
+		wait_for_completion_timeout(&rmi_dev->misc_fops_done,
+					    MAX_WAIT_TIME_SEC * HZ);
+	misc_deregister(&rmi_dev->sbrmi_misc_dev);
+	/* Assign fops and parent of misc dev to NULL */
+	rmi_dev->sbrmi_misc_dev.fops = NULL;
+	rmi_dev->sbrmi_misc_dev.parent = NULL;
+	dev_info(&client->dev, "Removed sbrmi driver\n");
+
+	return;
 }
 
 static const struct i2c_device_id sbrmi_id[] = {
@@ -117,6 +153,7 @@ static struct i2c_driver sbrmi_driver = {
 		.of_match_table = of_match_ptr(sbrmi_of_match),
 	},
 	.probe = sbrmi_i2c_probe,
+	.remove = sbrmi_i2c_remove,
 	.id_table = sbrmi_id,
 };
 
diff --git a/include/linux/mfd/amd-sb.h b/include/linux/mfd/amd-sb.h
index 977b8228ffa1..7bb5b89bb71a 100644
--- a/include/linux/mfd/amd-sb.h
+++ b/include/linux/mfd/amd-sb.h
@@ -6,8 +6,10 @@
 #ifndef _AMD_SB_H_
 #define _AMD_SB_H_
 
+#include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
+#include <uapi/linux/amd-apml.h>
 /*
  * SB-RMI supports soft mailbox service request to MP1 (power management
  * firmware) through SBRMI inbound/outbound message registers.
@@ -20,24 +22,32 @@ enum sbrmi_msg_id {
 	SBRMI_READ_PKG_MAX_PWR_LIMIT,
 };
 
-/* Each client has this additional data */
-struct sbrmi_data {
+/*
+ * Each client has this additional data
+ * in_progress: set during any transaction, mailbox/cpuid/mcamsr/readreg,
+ * to indicate a transaction is in progress.
+ * no_new_trans: set in rmmod/unbind path to indicate,
+ * not to accept new transactions
+ */
+struct apml_sbrmi_device {
+	struct completion misc_fops_done;
+	struct miscdevice sbrmi_misc_dev;
 	struct regmap *regmap;
+	/* Mutex locking */
 	struct mutex lock;
+	atomic_t in_progress;
+	atomic_t no_new_trans;
 	u32 pwr_limit_max;
+	u8 dev_static_addr;
+	u8 rev;
 } __packed;
 
-struct sbrmi_mailbox_msg {
-	u8 cmd;
-	bool read;
-	u32 data_in;
-	u32 data_out;
-};
-
 #if IS_ENABLED(CONFIG_MFD_SBRMI_I2C)
-int rmi_mailbox_xfer(struct sbrmi_data *data, struct sbrmi_mailbox_msg *msg);
+int rmi_mailbox_xfer(struct apml_sbrmi_device *rmi_dev,
+		     struct apml_message *msg);
 #else
-int rmi_mailbox_xfer(struct sbrmi_data *data, struct sbrmi_mailbox_msg *msg)
+int rmi_mailbox_xfer(struct apml_sbrmi_device *rmi_dev,
+		     struct apml_message *msg)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/include/uapi/linux/amd-apml.h b/include/uapi/linux/amd-apml.h
new file mode 100644
index 000000000000..11d34ee83b87
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
+	 * APML_REG:		0x1002
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

