Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B5A188930
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Sep 2024 07:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726124940; cv=fail; b=nu5awX1U9eGwNWw+mbWNb3BpEfGVSPJKSbEgzFPK31Y6tcjCoevelNYD2qJh8nawY/wT3ny7PC7d6wPcHLsmYs1bBGW4S2DmafNx15iALXVoDX78n37KFJ8p12TH0H23qrJmqyWekce9rddtIM/tLU6FgQNv5YyS8WBF6lB/zN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726124940; c=relaxed/simple;
	bh=WOS1mX6OcpJSYslpFhwNma38/rUfxL7bVHNc39zKPqI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mlv3Ur9QQ87BoZ7dTyGvHI6EcogoVgwj9AmosAJMa3HzInD0ZotR8GIvUslhyMBrvLug3zoPJt39Jacqg1kepcJiE8iRWvSoEPHUw8mgQslyYmdDAfVWZo/4q+XJhlv4drKJXQw/3y3lsqRpHrUdi+JiRt+DufbQkt5UXjZMsIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TfwaRDUb; arc=fail smtp.client-ip=40.107.94.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TfwaRDUb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUFrzrbUdulanxGtovBdgZEYmMATkIXCkeX7iYZJDZDrlys/pF9yhUyFVRdbMUc6kcgPBG5ltBabMjgCIHQogapVEHULtOjq+ucE6p19W1kb3QbmXy//4zOk2UtqXORf01hpGLLIp4XSuvTLUd32lDJlTvpHPD4ER8/EM+SxmMnfhnDeGScF6jXs3FFM/n53STgFz1giDwuzxzG3gUh3tf9t3mk1HUHcp1INdtTxlh1FmPOhNoRuzF6PZgGhjyEwnTaHNMtSVRP/W/s6W/bjP3o4s9NdtLnv0lRMc0HZoO2RayHHpUIzY2xWEDv4NR+GV6uQ3q98spO6FbRVKhP34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pG/W3JpCrw4yO6tuAim/nlTDkb63CizuW51UJ1jp8E4=;
 b=UsYwN+6+oSvECFw8OMVCJ03VWcONaboxkWS5nBo5UsggnjZ+ge2IWJuY8iV1ULHXsbvuIYo+3mP101Y8EmZ6vuLUS0CWyui+g4k85VT9lyZmBYHMCXXeCUWKNkP16cMX5U+IGekdyL3BenrEmTDwdW8qy0+Iw8Q0IkflFYdQLxNc0Gztm/COtfGUDnwv6b5lkZuogjQIjgk+sXCRfyRkh3WybP6nfqDadWCcN3i7PmYKwckxXOro8VvtUSsW5QO3QwhAA8mgRjAZCpAjs7E27LwSDrROszMyk0FM3ar/oFFghAGhYzyeMWNC9Kwgpe/EHjw6BujKPmtLZtcbhTNC6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pG/W3JpCrw4yO6tuAim/nlTDkb63CizuW51UJ1jp8E4=;
 b=TfwaRDUby/Tt/5S8TaNJdDGXh6KT6PTvRCfRwHjQOmGRswZuEeeaZyOpqpuFdyEhQhKA8nDeXd8wlAfiGtLFy1DY+qDF0YA3xFS7cDIW0VUsSXGPDCX6u14voNPCgz2czxBXtuZDzssyOa9MBL3frr8b1u79eeMoWA0NTbDQ9IE=
Received: from CH5P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::28)
 by CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 07:08:55 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::50) by CH5P223CA0023.outlook.office365.com
 (2603:10b6:610:1f3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Thu, 12 Sep 2024 07:08:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 12 Sep 2024 07:08:55 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Sep
 2024 02:08:52 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <inux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<naveenkrishna.chatradhi@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v4 6/9] misc: amd-sbi: Add support for CPUID protocol
Date: Thu, 12 Sep 2024 07:08:07 +0000
Message-ID: <20240912070810.1644621-7-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|CH3PR12MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 99be545c-4a43-4c97-05a2-08dcd2f9c3a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PLHOIgi4fc6l34QhzfIP2uzskt3Fr0eHtajbS3ktdNqsngjhvh1Se3vb9vm0?=
 =?us-ascii?Q?8eW6d1zCLK68JMBCeGAyr3/ocV5BFOGO9bKCGoz3oZr1FD/OASy0bhC7CQ97?=
 =?us-ascii?Q?Q50zIrrJSO0cAK9Y/ZTJPk0gp3mq91o3N696dvel8HDaaZFnvqou9BxdD92r?=
 =?us-ascii?Q?e/APQ3eS+BlogRsvWwrlQ+iZCylP27E/X429J5MrfQ1ucaTbUfOame7PIOXH?=
 =?us-ascii?Q?gW4CkzeWKR2GMM/wfXGK5AQZ8KViiEbn0MxMUAwUW60fBSQ8qm4RcNs+D3pI?=
 =?us-ascii?Q?Yg+Fb00P06Wn0UEBi+Fj1khw+BGmQ1RlNlGh+XcjQiNbO3ATSWV7n1VduBY/?=
 =?us-ascii?Q?Fm6dEB9FYJ0GPHTeXyDYV0IP+HnJ8WpqxKnMRcjo0os3SssUAKbxagfWQLB1?=
 =?us-ascii?Q?RqqtnvsPlh9cJF5IkFAXYuw2Ltm5O0OWH2Pf8LGayMnlSNnVJW88A9sTqqUp?=
 =?us-ascii?Q?in14u19sWVG0tZPKMLVjQWZ6r4NedOGoEvN8YL3v8SlFQzftWgKTo6h8Sx7/?=
 =?us-ascii?Q?mBzdsTobLzH9yepEaOHoBTIOnVK7pwczzz1LCwyvNDNDSxXGe5VBUuEkheY5?=
 =?us-ascii?Q?6k0vAwNxXsEl/H5zxrbOws1sUJ02g1/z+20UYk22ttmspV+NSWmCi8AAhsQN?=
 =?us-ascii?Q?DitrCpZbqKabNpCQ0yt9/cfZ2U0iXghzMnzqblk5fCh+bMAvIRa0tCRHr1H8?=
 =?us-ascii?Q?tPDa0KkfUpG8ZVCPHBLCU917NeReqH0fUQgl0SL8lNwDLlSBXOyRMm+Spjxi?=
 =?us-ascii?Q?KvHNN82+1qHwxjz3onkF2agjA3RKgFbCh5L+afvEh8oAPcCgfTCE30wxuiyK?=
 =?us-ascii?Q?xNsUFCSGuIrhu5vG2IRVTCai6tpQgG97vOIyoM66xZDaIlKuaOwdXayq1j7e?=
 =?us-ascii?Q?fqm5GNNMwiYH9rEk1zUdFos/cJ7QO/1n+7UyvwURwZCbt7i8HTk+xKzDNyTU?=
 =?us-ascii?Q?7wE6kJRoTYr2FcH19uun6CfDCGzt2fgm7LZV5v5W+xHIH2Lxhw3iWXO42hOP?=
 =?us-ascii?Q?P7g/Cb0uHyZbKykrEsc+MnqmN3deURyDD80tu3O2kaYZ2ATwfPyXbRbzQX0B?=
 =?us-ascii?Q?gQM87IrtjIt20jR/oiEsTDcCbkpKJ9QHxsJ9zy8deOIzh1JA9wNB+JgbLdKv?=
 =?us-ascii?Q?hg31BnwiO6frmpM7hIAEI+oH7LDCDKX1ovVJuuO5MjhDnjwdBGi+Tbsa1xBP?=
 =?us-ascii?Q?9dNaI5Jr/Xwc6Oc9XIVF7AMMpkKnjJAwZ/jKBazHgvfGiotMAOHbSgUr7mEG?=
 =?us-ascii?Q?IOesIN4ALGA01FwZOQuyRP1nJt2yJvduXqdp8ed1kendDofCFZAEM/6W6lMR?=
 =?us-ascii?Q?TZpqwbx67ytcxEucboNpSiD/ywTVI7xDxYa+nh1Kkp4F9q59R9V8zly1zSQI?=
 =?us-ascii?Q?nbArWT7J4+OpFZmphCEYqsdMQVZsFZwK//bQDTcXCYnSBXMSV8BPsUTxaNoy?=
 =?us-ascii?Q?jZ5XbEqmMu1rSWHFfBN48kkkd8Mmr3HN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 07:08:55.0179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99be545c-4a43-4c97-05a2-08dcd2f9c3a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617

- AMD provides custom protocol to read Processor feature
  capabilities and configuration information through side band.
  The information is accessed by providing CPUID Function,
  extended function and thread ID to the protocol.
  Undefined function returns 0.

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

 drivers/misc/amd-sbi/rmi-core.c | 148 ++++++++++++++++++++++++++++++++
 drivers/misc/amd-sbi/rmi-core.h |   5 +-
 include/uapi/misc/amd-apml.h    |  16 ++++
 3 files changed, 168 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index b4f292303ed4..3efb11ac2910 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -17,6 +17,8 @@
 
 /* Mask for Status Register bit[1] */
 #define SW_ALERT_MASK	0x2
+/* Mask to check H/W Alert status bit */
+#define HW_ALERT_MASK	0x80
 /* Do not allow setting negative power limit */
 #define SBRMI_PWR_MIN	0
 
@@ -24,6 +26,149 @@
 #define START_CMD	0x80
 #define TRIGGER_MAILBOX	0x01
 
+/* Default message lengths as per APML command protocol */
+/* CPUID */
+#define CPUID_RD_DATA_LEN	0x8
+#define CPUID_WR_DATA_LEN	0x8
+#define CPUID_RD_REG_LEN	0xa
+#define CPUID_WR_REG_LEN	0x9
+
+/* CPUID MSR Command Ids */
+#define CPUID_MCA_CMD	0x73
+#define RD_CPUID_CMD	0x91
+
+/* input for bulk write to CPUID protocol */
+struct cpu_msr_indata {
+	u8 wr_len;	/* const value */
+	u8 rd_len;	/* const value */
+	u8 proto_cmd;	/* const value */
+	u8 thread;	/* thread number */
+	union {
+		u8 reg_offset[4];	/* input value */
+		u32 value;
+	} __packed;
+	u8 ext; /* extended function */
+};
+
+/* output for bulk read from CPUID protocol */
+struct cpu_msr_outdata {
+	u8 num_bytes;	/* number of bytes return */
+	u8 status;	/* Protocol status code */
+	union {
+		u64 value;
+		u8 reg_data[8];
+	} __packed;
+};
+
+static inline void prepare_cpuid_input_message(struct cpu_msr_indata *input,
+					       u8 thread_id, u32 func,
+					       u8 ext_func)
+{
+	input->rd_len		= CPUID_RD_DATA_LEN;
+	input->wr_len		= CPUID_WR_DATA_LEN;
+	input->proto_cmd	= RD_CPUID_CMD;
+	input->thread		= thread_id << 1;
+	input->value		= func;
+	input->ext		= ext_func;
+}
+
+static int sbrmi_get_rev(struct sbrmi_data *data)
+{
+	struct apml_message msg = { 0 };
+	int ret;
+
+	msg.data_in.reg_in[AMD_SBI_REG_OFF_INDEX] = SBRMI_REV;
+	msg.data_in.reg_in[AMD_SBI_RD_FLAG_INDEX] = 1;
+	ret = regmap_read(data->regmap,
+			  msg.data_in.reg_in[AMD_SBI_REG_OFF_INDEX],
+			  &msg.data_out.mb_out[AMD_SBI_RD_WR_DATA_INDEX]);
+	if (ret < 0)
+		return ret;
+
+	data->rev = msg.data_out.reg_out[AMD_SBI_RD_WR_DATA_INDEX];
+	return 0;
+}
+
+/* Read CPUID function protocol */
+static int rmi_cpuid_read(struct sbrmi_data *data,
+			  struct apml_message *msg)
+{
+	struct cpu_msr_indata input = {0};
+	struct cpu_msr_outdata output = {0};
+	int val = 0;
+	int ret, hw_status;
+	u16 thread;
+
+	mutex_lock(&data->lock);
+	/* cache the rev value to identify if protocol is supported or not */
+	if (!data->rev) {
+		ret = sbrmi_get_rev(data);
+		if (ret < 0)
+			goto exit_unlock;
+	}
+	/* CPUID protocol for REV 0x10 is not supported*/
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
+	prepare_cpuid_input_message(&input, thread,
+				    msg->data_in.mb_in[AMD_SBI_RD_WR_DATA_INDEX],
+				    msg->data_in.reg_in[AMD_SBI_EXT_FUNC_INDEX]);
+
+	ret = regmap_bulk_write(data->regmap, CPUID_MCA_CMD,
+				&input, CPUID_WR_REG_LEN);
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
+			       &output, CPUID_RD_REG_LEN);
+	if (ret < 0)
+		goto exit_unlock;
+
+	ret = regmap_write(data->regmap, SBRMI_STATUS,
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
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
 int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct apml_message *msg)
 {
@@ -136,6 +281,9 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		/* Mailbox protocol */
 		ret = rmi_mailbox_xfer(data, &msg);
 		break;
+	case APML_CPUID:
+		ret = rmi_cpuid_read(data, &msg);
+		break;
 	default:
 		pr_err("Command:0x%x not recognized\n", msg.cmd);
 		break;
diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
index b728f5582256..529c8284dec4 100644
--- a/drivers/misc/amd-sbi/rmi-core.h
+++ b/drivers/misc/amd-sbi/rmi-core.h
@@ -15,7 +15,8 @@
 
 /* SB-RMI registers */
 enum sbrmi_reg {
-	SBRMI_CTRL		= 0x01,
+	SBRMI_REV		= 0x00,
+	SBRMI_CTRL,
 	SBRMI_STATUS,
 	SBRMI_OUTBNDMSG0	= 0x30,
 	SBRMI_OUTBNDMSG1,
@@ -34,6 +35,7 @@ enum sbrmi_reg {
 	SBRMI_INBNDMSG6,
 	SBRMI_INBNDMSG7,
 	SBRMI_SW_INTERRUPT,
+	SBRMI_THREAD128CS	= 0x4b,
 };
 
 /*
@@ -56,6 +58,7 @@ struct sbrmi_data {
 	struct mutex lock;
 	u32 pwr_limit_max;
 	u8 dev_static_addr;
+	u8 rev;
 };
 
 int rmi_mailbox_xfer(struct sbrmi_data *data, struct apml_message *msg);
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
index 4207aa08b660..293532500450 100644
--- a/include/uapi/misc/amd-apml.h
+++ b/include/uapi/misc/amd-apml.h
@@ -7,38 +7,53 @@
 
 #include <linux/types.h>
 
+/* command ID to identify CPUID protocol */
+#define APML_CPUID	0x1000
 /* These are byte indexes into data_in and data_out arrays */
 #define AMD_SBI_RD_WR_DATA_INDEX	0
 #define AMD_SBI_REG_OFF_INDEX		0
 #define AMD_SBI_REG_VAL_INDEX		4
 #define AMD_SBI_RD_FLAG_INDEX		7
+#define AMD_SBI_THREAD_LOW_INDEX	4
+#define AMD_SBI_THREAD_HI_INDEX		5
+#define AMD_SBI_EXT_FUNC_INDEX		6
 
 #define AMD_SBI_MB_DATA_SIZE		4
 
 struct apml_message {
 	/* message ids:
 	 * Mailbox Messages:	0x0 ... 0x999
+	 * APML_CPUID:		0x1000
 	 */
 	__u32 cmd;
 
 	/*
 	 * 8 bit data for reg read,
 	 * 32 bit data in case of mailbox,
+	 * up to 64 bit in case of cpuid
 	 */
 	union {
+		__u64 cpu_msr_out;
 		__u32 mb_out[2];
 		__u8 reg_out[8];
 	} data_out;
 
 	/*
 	 * [0]...[3] mailbox 32bit input
+	 *	     cpuid,
+	 * [4][5] cpuid: thread
+	 * [6] cpuid: ext function & read eax/ebx or ecx/edx
+	 *	[7:0] -> bits [7:4] -> ext function &
+	 *	bit [0] read eax/ebx or ecx/edx
 	 * [7] read/write functionality
 	 */
 	union {
+		__u64 cpu_msr_in;
 		__u32 mb_in[2];
 		__u8 reg_in[8];
 	} data_in;
 	/*
+	 * Status code is returned in case of CPUID access
 	 * Error code is returned in case of soft mailbox
 	 */
 	__u32 fw_ret_code;
@@ -63,6 +78,7 @@ struct apml_message {
  * The IOCTL provides userspace access to AMD sideband protocols
  * The APML RMI module checks whether the cmd is
  *  - Mailbox message read/write(0x0~0x999)
+ *  - CPUID read(0x1000)
  *  - returning "-EFAULT" if none of the above
  * "-EPROTOTYPE" error is returned to provide additional error details
  */
-- 
2.25.1

