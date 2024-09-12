Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AC6189BA5
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2024 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726124936; cv=fail; b=Q0SygBfplh4qnJ3HURyFPOLuE1BOlwO+4ir69+rVD8ZY4XP6T5GsqXTDJB3EiW4UafXf/JuqyGeiKRsYo3ZE0y8tba5KBBdugXT7/uZWL3mOXrmXtv+soS0cMcIvTQM6AUPtOH26ZmDUa8MgngWLddPa8fXwSPBe4B1uQj0FZEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726124936; c=relaxed/simple;
	bh=hwYNauNFnDp6G1I6Dns78SuJQW1SuLiCYEXnrqX4vsg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m8xNN9LX+55gdu+9yPxASiaE5yRkAIVQX1mHxzbF2czXC1dCFfYAvwGqnWHaUn2nHikx7XLQxSn9FVV5X4jAEdWSs4KhYKDP95rcb7TXqoz16yXD+uYFsgVedakzR5ftMKqOKXtIGJqBLXZ7GJjqN7YuDMeNqGhX7P+xgw1wEiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2KMp8FHI; arc=fail smtp.client-ip=40.107.93.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2KMp8FHI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fx+SqhP4CEWrYzJvNY5b6bko3WXIESFJ3VtGpGNHCzdx6qIF9nwEnfPqXkDhpxKOQQNZO5SF9ry3AJbr0yD32oZyH1R7mw9O+uTEU4VSBJ6/OxnyXKxddibekMBsUmUfyv4bxvNWDbyENGFchf3wOLqS59hZKOyHO9gGCxgAJjXshMmnatQDkJrcIfPmY3YIXkPHGnF4OKN+rftPO53xa3Qv2ptjzE6S+hEn0ZSvkclzrJwSfpzoa3tMpLPVZGohgHOXLi/AqjAjKTS2kkepNZhD8uMKPYRp11KZ+k9y2Fco8Nbnhl+bZlQ/xs8/4ja5pCeBHajL7WRCKVmkYj9vpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dv/2ldloZTlwiaNq5oOi8yzMUVWbxfuVVRPydOLFRHA=;
 b=J105dXO2Rz9Mh3AdYAR3ApD9+c7njJ2zdk8Qo8ZEeELLsH0XU9p8ZewvIhjpO6xHTEa9VmOFrSrsiG3nWm113JIe4omgRbjoHyo5yhYcjFTAQFI2kK5M5S/0jkf5iRz68vYR5iGBLTJylvGm/UFz+/lb4wUTdk5+bbE1OfMG6vOR61NwjuX1YHMQPgddRprE8zBNfem+G6rxYegqWJPBAxlbGM6E8KScfMwGcV+ZDINykSHnlOBgFNKsodJXG6+OD60le7twOQzr4ikArwknphaSjB22mmlePYg2z6B9/3omvQ5Om2b1UVufb0tTtb9bk1VutwGqleE/hWCkdySjsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv/2ldloZTlwiaNq5oOi8yzMUVWbxfuVVRPydOLFRHA=;
 b=2KMp8FHIML5RbXp4dBU7US8dgeSJheIvES7VQBhB0PuBp5h8ujxLgtO8beHimjB8qs4MIBVv9odh4+TIBwzbKzWLgGgcjPW6x1TmHJygNJ24uJwb56lb1bGW80riBlySvNFV21wtqLFiylE+qbFVb9WnaAwdr6ma5ry8uCuW5Io=
Received: from CH5PR04CA0014.namprd04.prod.outlook.com (2603:10b6:610:1f4::26)
 by LV2PR12MB5727.namprd12.prod.outlook.com (2603:10b6:408:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Thu, 12 Sep
 2024 07:08:50 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:1f4::4) by CH5PR04CA0014.outlook.office365.com
 (2603:10b6:610:1f4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26 via Frontend
 Transport; Thu, 12 Sep 2024 07:08:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 12 Sep 2024 07:08:50 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Sep
 2024 02:08:47 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<naveenkrishna.chatradhi@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v4 5/9] misc: amd-sbi: Add support for mailbox error codes
Date: Thu, 12 Sep 2024 07:08:06 +0000
Message-ID: <20240912070810.1644621-6-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|LV2PR12MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: 260cef74-38ef-447a-710e-08dcd2f9c10c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CiannKmomgPGY960WAUw1jsIyP5UvREGxX+FliYBiaDmV3LQxPB3lWJKRrSh?=
 =?us-ascii?Q?jSPOlZXr7n9AV5nIQK8jY20ARuUypBsxfQoBLYrq1glq9L9BpsHZFwcBHdY1?=
 =?us-ascii?Q?IMqysj/Q3pT0xixFPuzL7ONGCQzRRDDVrRRRz4knvBp70EqAZBJ5BkpoOwre?=
 =?us-ascii?Q?Urm+nTbJL7TPqu45oCmj68tSNq9TRqKj2rfIUif1CRd7KTcRhrFZuD+jWktU?=
 =?us-ascii?Q?CzidIupFveYTf0HexV3GyiDoasBf2DkpKl8pqxXu6Y2pMe6PMlG8xhQ3Mc8w?=
 =?us-ascii?Q?IgRtGAJcrds9ky3tn2Y6PfWtd95BIKh4wJcSAkcr2XKjMpog4zeHBZtSn5Az?=
 =?us-ascii?Q?Vorrlf0ntUY8qEh44WSpYoPI6eNTSulS/IkHx2b/sRAM4knXHUIYFCj6b8Lp?=
 =?us-ascii?Q?+f2InR4AJ3jqeli+Rg70VbvPM91iMDvZ0r5cEUZfNEbkDOJscG9wMVuzqV9o?=
 =?us-ascii?Q?0VBuZ9mhDGzpF9MkIP/1e4XvQvSIO02UPJyRWa7o0MgRRoUh3Ypj8Oz4RYPB?=
 =?us-ascii?Q?2NqNilX2f45NHSd+TkgwSbtGFy7SkX9XOmk6S1TBXDcWNmyIGhiwxixP1BDH?=
 =?us-ascii?Q?w5vuIaanrgDqhByXsjgvrYdjsVZBwrAh5OyCyEHzRxlFZPr1uXDgJk3rHfZd?=
 =?us-ascii?Q?dtjyRhPZzUQVwk8NNA4uB3VqjgURlzHfWY5ZCxx6cReaIiWijIZcSg8/R9RP?=
 =?us-ascii?Q?ZnuYVMrrhZgrrhptVKyBRGlnAgoEdxW73DScoD0i71V4VrT4zhe+9w9g5S/c?=
 =?us-ascii?Q?iTWl+sVvedvJOB3xJB6oSrijLsCb4f78+HtjrFfpLH+KKOwTHzQPOFrVZpOQ?=
 =?us-ascii?Q?tpcF8JW9RLsNH+FGAVN3f5zYv3rcPqlYT1t6XZ8rL1RjVG7IFqK4WgzAcNjK?=
 =?us-ascii?Q?LfkIBeeWBMBaqr+2ngBgvMMZmGlO82VtFcxWSrjrh8xKvyJqiGVLwJFzDSIm?=
 =?us-ascii?Q?2eMlT6HqBYeObwYO3a8krof6f7pwHI0bZK4BEh2TjmgvpnIV35f44xS32WJp?=
 =?us-ascii?Q?AWGXBG3DVF1j6MAEoVzjmJWa2+J3xw0Jp9ctTVEnZ4jND5ApyinLd7JjL1Qh?=
 =?us-ascii?Q?6EojiRsHtvUM7jL+E+g3F8O9euZ6uXxA7xdbOwfNTNCez0Io7jNl7pYFE4oS?=
 =?us-ascii?Q?lB/hsjGisqDO1UIuxDj6lN/OUekQO0N7CensR8TMpKCgW6SepQN6kn+Wo7VA?=
 =?us-ascii?Q?JsSP1azberlQM5l1XMI1HUfG/yh8LrrhslymRLgl/3FB5aN6sbl6H1vpsTMH?=
 =?us-ascii?Q?LD7Cr2J9rJCvK8sYDy7alN4PuyNOQyTVGD11J59K19wwGANL/67U9+/2ea/c?=
 =?us-ascii?Q?QyGfG6BAezJQqNWkLyawFEjvbg1sWu9PPkzWixT6eElTWy8b09tuVPk1rx+2?=
 =?us-ascii?Q?WpdE43TS7slTSPQ/kdd6irBgtQD0CSeEUGJKcUu3l0lacwBN9UBD4OnCNKE1?=
 =?us-ascii?Q?xr+9XuSqjuJua2GfcQTjb+vvzKpaJ2YV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 07:08:50.6338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 260cef74-38ef-447a-710e-08dcd2f9c10c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5727

APML mailbox protocol returns additional error codes written by
SMU firmware in the out-bound register 0x37. These errors include,
invalid core, message not supported over platform and
others. This additional error codes can be used to provide more
details to userspace.

Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v3:
- update ioctl comment description
 
Changes since v1:
- bifurcated from previous patch 5

 drivers/misc/amd-sbi/rmi-core.c | 12 +++++++++++-
 include/uapi/misc/amd-apml.h    |  5 +++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 92d33d589bdc..b4f292303ed4 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -27,13 +27,15 @@
 int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct apml_message *msg)
 {
-	unsigned int bytes;
+	unsigned int bytes, ec;
 	int i, ret;
 	int sw_status;
 	u8 byte;
 
 	mutex_lock(&data->lock);
 
+	msg->fw_ret_code = 0;
+
 	/* Indicate firmware a command is to be serviced */
 	ret = regmap_write(data->regmap, SBRMI_INBNDMSG7, START_CMD);
 	if (ret < 0)
@@ -74,6 +76,9 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	if (ret)
 		goto exit_unlock;
 
+	ret = regmap_read(data->regmap, SBRMI_OUTBNDMSG7, &ec);
+	if (ret || ec)
+		goto exit_clear_alert;
 	/*
 	 * For a read operation, the initiator (BMC) reads the firmware
 	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
@@ -89,12 +94,17 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 		}
 	}
 
+exit_clear_alert:
 	/*
 	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
 	 * ALERT to initiator
 	 */
 	ret = regmap_write(data->regmap, SBRMI_STATUS,
 			   sw_status | SW_ALERT_MASK);
+	if (ec) {
+		ret = -EPROTOTYPE;
+		msg->fw_ret_code = ec;
+	}
 exit_unlock:
 	mutex_unlock(&data->lock);
 	return ret;
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
index dc926327629d..4207aa08b660 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -38,6 +38,10 @@ struct apml_message {
 		__u32 mb_in[2];
 		__u8 reg_in[8];
 	} data_in;
+	/*
+	 * Error code is returned in case of soft mailbox
+	 */
+	__u32 fw_ret_code;
 } __attribute__((packed));
 
 /**
@@ -60,6 +64,7 @@ struct apml_message {
  * The APML RMI module checks whether the cmd is
  *  - Mailbox message read/write(0x0~0x999)
  *  - returning "-EFAULT" if none of the above
+ * "-EPROTOTYPE" error is returned to provide additional error details
  */
 #define SBRMI_IOCTL_CMD		_IOWR(SB_BASE_IOCTL_NR, 0, struct apml_message)
 
-- 
2.25.1

