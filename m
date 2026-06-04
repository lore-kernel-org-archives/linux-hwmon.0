Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11022116.outbound.protection.outlook.com [40.93.195.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4099385D75;
	Thu,  4 Jun 2026 20:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780605480; cv=fail; b=Yn/PueHkoh+lR0Qx5bWEg+6+RlvWh90Pc2z8LoPf5T9iAvf1yfM8g2H3nfWmy8VsekL8UEMGChOZct7EKgXyYBFmNJyDR+DcwtFntjAjVbzlqHgzf9EkKXCm2Bu8F8Vxd3KmHTglngsOMEnRTg5cv8ZxFZ3Q/CBJzDIBZUga+18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780605480; c=relaxed/simple;
	bh=kKoi9Yg8oi4L3b2ZPjljhzch64UB5kl8lo6L/mz7+nE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=i49cmacwbAMb38k0ozl4WNdi5QVDMUvNn0sBChdENTxQ4f5tpfajt52BuCKQlQY08tUa5zvqvinLYcbFGl0QE0r7nwZYyibCWQC1CLeiES36/WpnFjiBABxciWsSr4O9bKmT5RPnZxVfCMOmlGAorgrL40nleDH1NSy9deW51iA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=bbNsr/1V; arc=fail smtp.client-ip=40.93.195.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="bbNsr/1V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5FtOMCSGIgy5Jy7g3nceCxm+1d+KrPz6gMIMxRMvi7esn36k+SMRZjvtzWD5CIIUiB8s5X3dkjlh+u00+Li2DQ9aJkVAgO+PUYB9jDo4pjU2kLkqml2i8X1D4M3+mvbRRvcd9wym9vFPHelPIJzf4myDuKNuarbxRoY5FzPejLVejZmfnKbHCkZqXWfOrATBBmNQsVoydgJDp1vQZw191Zf7PcbsEL2zhrZit6WhoGVlo/Qp54O18ijfgOHet14PSRqNuBnMXstHFsyq3Z/UYODNknnD/XkEeXPtoBtuA8lHTZFyOEu95qbR15WJnMhEfogb14yhiliC/SW5XuQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSbjDBia2Zg4Uungp/EGc06ktrhnW4aYHDCBfT01xjc=;
 b=mmEsh8856+JdVHpav8GOp2/cwXRDoPslMAGtR39q2GLMULYo8msJmjtYGvbzWQFooxTloVEU4kJzp0UTSnHJSXR9M5I3HQv+ieLl7Eo1If+mxuQ0IIpk8rDY9kiUjaIgyQ1iFTOsHY8EiPdu9V78lpRSS3Rks4eG8jvj0z44LVhRrWif8bpMGEZe/8o09gaEPPqyh/o5eSjjGxof6WYlPErvl9iRyGyRAcekC+VN61BNR9TXh2FdOCEngTiE4JGbllvZEd+hZuUgnaXmI19eRErQRKbFPG9L545L1S4v0ByRNG19IJdWahdBgjPWV/giiDW4FbOtuAvARh/guWsBHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSbjDBia2Zg4Uungp/EGc06ktrhnW4aYHDCBfT01xjc=;
 b=bbNsr/1VNh42pnOEqllNtlbuktp6Nm7K1jddnmNwh0V8E/pU8CJ0WHjL54UlicPYgaEjIKSd5lH+QIlxhPbUiQtI3qbE/hfZfrbXqKgmz1P6CxkeVm3MweS3M7Wc1FzNYavLquy2KdOB+Ziw/DpHZ+jTSmE7YgoqibuXaUSQutg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 LV1PR01MB994391.prod.exchangelabs.com (2603:10b6:408:2ce::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.8; Thu, 4 Jun 2026 20:37:55 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 20:37:55 +0000
From: Adam Young <admiyo@os.amperecomputing.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Len Brown <lenb@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Huisong Li <lihuisong@huawei.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v01] mailbox/pcc.c:  add query channel function
Date: Thu,  4 Jun 2026 16:37:48 -0400
Message-ID: <20260604203749.168752-1-admiyo@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0020.namprd15.prod.outlook.com
 (2603:10b6:930:14::27) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|LV1PR01MB994391:EE_
X-MS-Office365-Filtering-Correlation-Id: d72613ec-7297-48f2-6c74-08dec2792816
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|55112099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	HOoJKjO4Jot8y8W8pPzPh2duxBQURc8CeIKfiKmtzz3gII/kTMuaWlnPLN4wa+DR1DruJdBDz9/R49ioDeMT4QRm1AJMrUlybr2Ztkld2prKx4Xj+M72uKXxGN08XbKdwBmqf/szv557dM6k3RUrxJJbVGJ1TOrtDLU3mXUpQUpg7k/0Yjw4ma378FWoM/ZGQ/66WkP6xLGstb2pAVUeUusm3CoSBMITIVdINOZQmRpeE3GRBs1qf1tdA2V8GLLWEFkFSlQp1cOAMQN3Te705aYQkhoz24s2HCkMnD98QIRIdYLZVNsgU2irwHclaxlWjkDZUpp8MR2O+Wj2ViRg6eed8qz2fQivb5O65LmvQPQcjpQamOUxJbrNj9MSn+ESvySNhfWpem1HUc8O7fPUG8aZ7blwIU9FsZ1lrBkvaHkkkNH6L21h07lK+LAciBi7jxMxpaA0IDAzwA7Ut+HWY1/caU/PHFS8gDPRcKUNsnLFoiaQGdGlJz3hisR068W7n8qJeIqf2yChMlzEKXpZ2RjkQ0Adw1z0lpb06/iKjH8wUOUY+eDw3i0TujDwdzVP+AjjzSHUqnlwaHmW9st6nqQSQ7iVOZsM4fHJsdHcgPvZ+B6hnMtNqskwKfOTJJMlOT5yxnfN80+QYU2yZq10b1A00vwnmRNCqAYcTGTmOHxFWlGWdU2pxJphREcNaJjG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(55112099003)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v9OUaT6l3uL0M+xnb2C45ZD+5H1MheCUzGv76NsEO6L6SwBimUlbqdxjiZ0E?=
 =?us-ascii?Q?xHLg2/bdBLxv16own2oby9fXq2/cHduaQtgKJFQFf6mhOzvPsEjq8IbvJAnD?=
 =?us-ascii?Q?8Z0HKBne3/cegtE1ZcUSp0zDekd9SodZDJdNVPODJErwFTspCMru5GSoWyam?=
 =?us-ascii?Q?8rOSv57KI8y/Lj15Dar875ceiJAlrHUA1iyAeAgUsbGTCYVVPazXT19b9z5x?=
 =?us-ascii?Q?yVDy42HlAwMfey84bCiNpHDkQG9Nay2d3gLdPx6DRSBy6dDoja6TUVb0ZdBo?=
 =?us-ascii?Q?RizhwX/07A3c/73tbFlC5cUKphy8JVskpX00+Bh3TsYMZqVLxBqxt99dcpt3?=
 =?us-ascii?Q?jeqyv9hBob5jHyPZGvUze/3RNmD9vJ1UuNnCugPTF24O2EPkKFMw9g/Pp2Ci?=
 =?us-ascii?Q?y8edP6uXSAa2LItlUvEhBKn+YeoDBoBh4KPPygWzMPMR/95Jma5GlcnZ9AEv?=
 =?us-ascii?Q?HttXIfZDvQPDeQdipWkqwII/a9seXKVTmHaOA7Hii8byFr7zsp4UeZ9jJaWA?=
 =?us-ascii?Q?JnmRE3h32eXIM0dJRWf6em+vo9m/uo2Jefw11mLr9VXjH3KI4QmSHx6pQvuq?=
 =?us-ascii?Q?2ZuH62Cm44qNck9AXKTIVpKyC5aWc8HZicq0WFqIdtepeLf8EcHfbNT3B+Ia?=
 =?us-ascii?Q?eP3aafpdLosmpLMWQ/0CAtoUa9Yk7l6Ga88JhxuYfUf7I1/efDURcpJtIC31?=
 =?us-ascii?Q?fcC4+ntIzh4sJFMYBRToQgD754azgxjC1BV4jnx8SuniKXaN+3JMisnbZqm9?=
 =?us-ascii?Q?YFCclPn6ErYIlH7i/BIEIkHeYrRx9Gfmsfdv3aQKCtrvHN827xvqxyoPqsI7?=
 =?us-ascii?Q?t2hjA+7DSow8kljrkggiIKunejNeD1d3vXv02kQFfbCwtyf+AB/pr6f5f1Vb?=
 =?us-ascii?Q?oEKU7/jq3tbkDpjilMYfK3a+d2kk/uiIu/c3epiHEJ2CC2qkkSe2gOexNpmE?=
 =?us-ascii?Q?g/nZtvY4MOE7Wqflxjyh3FGEyYzYeODW954DzbgCDQh20fZDMerxXd/vI/9G?=
 =?us-ascii?Q?as1y91HvBmpXjSLuewsHS6ZkRt8yErHQ1L3mw+Vzw3TYYXfwLHAfn/EsuEZ1?=
 =?us-ascii?Q?f2WbdrTTzeTrdtnblSN4OBzomxkXfqAyyxEWvHnV1cXydWrnTCedZJqE8LSC?=
 =?us-ascii?Q?+uHfTBYW5jIAedCTx6oVkKtyitPAYOXZg8NKCiZAcsdpeg32urfW/mF2Ruel?=
 =?us-ascii?Q?DBAi323OyHTgFPswCS2cAMTSEcaTwle/9ApV8rVyg4jRK8cQgz1iFxJrz3E8?=
 =?us-ascii?Q?91OXrM8aoavW8Dfy/M3TBCXshFaaPKe0URroezxmhSu2JGNOze7jyv7b8AvL?=
 =?us-ascii?Q?7uThKbQ8oonkwI9z7dQ8Cc8fsoTQ14UvBQYD2E9J21moW6p/jl3Csg/uPn73?=
 =?us-ascii?Q?qnD11nQpPPwueB8skClhvnsts5OPBpZKHoGK52u6k8bj+3geTc0/paQN5X5C?=
 =?us-ascii?Q?BUWjlqtloLl15L+rjFWvAFJcBRmhSuki9F+qVvyCPPom54F5XcXXTxF6azqM?=
 =?us-ascii?Q?+nKlzTZ2pCQUCmsXhbWeYMESfTReA3H+5eNTdHSDMc721RarPfuPekQeQX6l?=
 =?us-ascii?Q?poIkTgQp31yMxnVGkartnBw24cdYrtvipmNjBa3zyr8ncWeDGUXc9/LxDxHG?=
 =?us-ascii?Q?RYt6Hhw0qMh1kSRuLI1BwVEZv1BXbz35NjXwr8ZcgAAhb0TFzZCz7mGGlawK?=
 =?us-ascii?Q?s16O/uaidiJdqqdZkuKaRrp/iOmpTMRJkMTs4t7pqkAEtDMYJWP/3NSQ0jeu?=
 =?us-ascii?Q?W1u+iU5t2kwKhm9sTScZWpaFytx3yegWvtBgw1Xp3CvE2BzGwRNYdw1KAq3i?=
X-MS-Exchange-AntiSpam-MessageData-1:
	jHUfyub7xpDCh3gvn+leD/Okhf6dAhkp5Z9LU+GHG6Weay7qLZEQqIxl
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72613ec-7297-48f2-6c74-08dec2792816
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 20:37:55.6776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+j2REZfPq4bAhL9sI4ElYXFZf686zoKRYXYC3RcnYIu2Y5c3tGb9KIrI16SkmkpMcrGm5jApPtnEJfaRkIB7IYJyq99H2NWvQu6sRPck0uE9XJEjmCAOu2M8r+QGZhV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR01MB994391

Drivers need information about a channel prior to creating a channel
or they risk triggering message delivery on the remote side of a
connection.

One of those pieces of infomration is the type of channel.

Add PCC channel type to records and expose PCC channel type to client.

Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>
---
 drivers/mailbox/pcc.c | 39 +++++++++++++++++++++++++++++++++++++++
 include/acpi/pcc.h    | 12 ++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index 0deaf7907ed6..c27bea426967 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -348,6 +348,44 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
 	return IRQ_HANDLED;
 }
 
+/**
+ * pcc_mbox_query_channel - returns information about the channel
+ *              without activating the channel.
+ *
+ * @q_chan a pointer to an already allocated struct pcc_mbox_chan
+ *              that will be populated with the channel data.
+ *
+ * Return: 0 upon success or non-zero upon error.
+ */
+int
+pcc_mbox_query_channel(struct pcc_mbox_chan *q_chan, int subspace_id)
+{
+	struct pcc_mbox_chan *pcc_mchan;
+	struct pcc_chan_info *pchan;
+	struct mbox_chan *chan;
+
+	if (subspace_id < 0 || subspace_id >= pcc_chan_count)
+		return -ENOENT;
+	pchan = chan_info + subspace_id;
+	chan = pchan->chan.mchan;
+	if (IS_ERR(chan)) {
+		pr_err("Channel not found for idx: %d\n", subspace_id);
+		return -EBUSY;
+	}
+	pcc_mchan = &pchan->chan;
+
+	q_chan->shmem_base_addr = pcc_mchan->shmem_base_addr;
+	q_chan->shmem = NULL;
+	q_chan->shmem_size = pcc_mchan->shmem_size;
+	q_chan->latency = pcc_mchan->latency;
+	q_chan->max_access_rate = pcc_mchan->max_access_rate;
+	q_chan->min_turnaround_time = pcc_mchan->min_turnaround_time;
+	q_chan->type = pcc_mchan->type;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pcc_mbox_query_channel);
+
 /**
  * pcc_mbox_request_channel - PCC clients call this function to
  *		request a pointer to their PCC subspace, from which they
@@ -834,6 +872,7 @@ static int pcc_mbox_probe(struct platform_device *pdev)
 		pcc_parse_subspace_shmem(pchan, pcct_entry);
 
 		pchan->type = pcct_entry->type;
+		pchan->chan.type = pcct_entry->type;
 		pcct_entry = (struct acpi_subtable_header *)
 			((unsigned long) pcct_entry + pcct_entry->length);
 	}
diff --git a/include/acpi/pcc.h b/include/acpi/pcc.h
index 840bfc95bae3..8d0fada6e31f 100644
--- a/include/acpi/pcc.h
+++ b/include/acpi/pcc.h
@@ -8,6 +8,10 @@
 
 #include <linux/mailbox_controller.h>
 #include <linux/mailbox_client.h>
+#include <linux/acpi.h>
+//#include <acpi/actypes.h>
+//#include <acpi/actbl.h>
+//#include <acpi/actbl2.h>
 
 struct pcc_mbox_chan {
 	struct mbox_chan *mchan;
@@ -17,6 +21,7 @@ struct pcc_mbox_chan {
 	u32 latency;
 	u32 max_access_rate;
 	u16 min_turnaround_time;
+	enum acpi_pcct_type type;
 };
 
 /* Generic Communications Channel Shared Memory Region */
@@ -37,6 +42,8 @@ struct pcc_mbox_chan {
 extern struct pcc_mbox_chan *
 pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id);
 extern void pcc_mbox_free_channel(struct pcc_mbox_chan *chan);
+extern int
+pcc_mbox_query_channel(struct pcc_mbox_chan *q_chan, int subspace_id);
 #else
 static inline struct pcc_mbox_chan *
 pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id)
@@ -44,6 +51,11 @@ pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id)
 	return ERR_PTR(-ENODEV);
 }
 static inline void pcc_mbox_free_channel(struct pcc_mbox_chan *chan) { }
+static inline int
+pcc_mbox_query_channel(struct pcc_mbox_chan *q_chan, int subspace_id)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* _PCC_H */
-- 
2.43.0

