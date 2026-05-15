Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11023130.outbound.protection.outlook.com [40.93.196.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CE720297C;
	Fri, 15 May 2026 16:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861414; cv=fail; b=P7dsD0YkCd8DHLM8G713te7HaW7Ac4lHEdl2sM/JbHrNsCFbpzwZ1JbkGe6CvoEv70unqFb7ipgqEvTw0qtuKAt0D2+tX/zZ7slfOGXIPyuMtqyyHMVTnPnNg/DYIwr5ipHfK+ZApsNy6AY5YRgv1KmVTHZ5BXQ5N9vPET5cPQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861414; c=relaxed/simple;
	bh=TzEal55y0dlJAHaP99ImM6ZL26+uVKHxQ+xCSBqu5gA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aAfzfd/HEWV8LNST4ilLuXx3nejP4LJFxktDisVbryOOcPE5YIhk3Ayc7QLudwl6w63UrZqiJJ5GUDfS+WaggQxEoDgKEXiMg+hdohtmYYcqXDTV6UVwkunUM1vgsMN286BNmeR2vDrlzhST31W5xOtH6tYlrZO9YB8SO1HIZRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=sTYj1S7H; arc=fail smtp.client-ip=40.93.196.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="sTYj1S7H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLfkYbgku3mFWAEdTH9OsvEOAxhAIg6uEb+mPx/0cwgektW6qep29Ykw6Cf1oIPQ7RUp0/yO7a5Y4cVg2e2a/os6u5sBhj+cjDLFhw5ZoVSGLRZHkqLlJZiRCkLJQUR0hu09LTpANUTckUsj7hNnIW73ECvXYU/6NLJrOt13u1bMWB4jvteLhsJmEYMy9H+eJCWhDmTjxHKVGYbSksbXyJWOtckdwO1n58X3NVV2N3TnU1H4eDGMGRzgj8g/Y9qEpMq7aP1xTK0ukEnv0W0WegTiU2AcUdbzeG8KTHJcQZfEnJOFheAGruL3pfiTd+y/6OinQ1ZxgFDJXD8VPIckuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7m57ZnAC5BMFpHSu9bHUpxD+IlaSCRyZwXNVL1GntY=;
 b=PShBDHhiyJl+bFZY4Y+lsdrXdfqapzArS3aLupfOHpbOOHPzuqV0sk0mWONy9MDy1EIxutuxAbXhdJ0+lPo7WiR6yykBG6kS49BYeMhLcIh8WBQW+UcCXHfhM/NRx1Ywf/cUxU1js6HjBj4VKpsEY/YjBDoKbZWF/BPxaZGgCHZ8wNLKA05FfuJevdHoiHLXYXsxuaXDyRBeHnQGPFhAq7HrbXJWKl6pJU4DP6+FCvGiqfkBxSXpTCjM0127bIv5DDXxWUEkTq1apvFi0AZbNA7AKTEL6FE56eDRwLolHesrbz16JnSoIc0oaZLZImuwzgJxbYVV+hV6ic1sKD/5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7m57ZnAC5BMFpHSu9bHUpxD+IlaSCRyZwXNVL1GntY=;
 b=sTYj1S7HIZkW/tF84bD8zbjBCKvr84FXX0QzW0UixAYzLOnfN58zap77azLPic+i2Fo/FuAhbrsx37JOXzyL6XgyK+8wDDho9nQcExkmpCqKtN09NL8ZmkPWOodL1NdYUwuNAzJawXd8Jjg5//qMH5V1nMTAVOi9UtP4EUcVnFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 CH5PR01MB9032.prod.exchangelabs.com (2603:10b6:610:210::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.15; Fri, 15 May 2026 16:10:07 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%6]) with mapi id 15.21.0025.012; Fri, 15 May 2026
 16:10:07 +0000
From: Adam Young <admiyo@os.amperecomputing.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Huisong Li <lihuisong@huawei.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] mailbox/pcc.c move shmem unmap to teardown
Date: Fri, 15 May 2026 12:10:01 -0400
Message-ID: <20260515161001.699470-1-admiyo@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0050.namprd15.prod.outlook.com
 (2603:10b6:930:1b::16) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|CH5PR01MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6702c5-6481-4530-0008-08deb29c6e4c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|1800799024|366016|55112099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	qIlCNC5iE3ncMYOygfErtuh4pRrOUEVbTLHJ4Ng7+fLNg1BVI0OHrltXStDC6gC6B2Z2vckvckG1L1uq36eXIMpKCwBWyWRl1bbhv5ZV9lnlpUfpRkDga2xr+Y/9k7p6vzaoDdF6q/Ka482nGQbqB01XMlAw6V/fxIV9joTapG34tu8EDArROIZZ0hL/YppwzzB5RYQ8fBgFrxAhnkhYmfD3Vpm6AH84FtfVq2rKzhYLDbtQPKTNNdOlDcbVxHLLLoZBXo7RMl2zX1DFBEyuJREyJaZz99JhWbqa1RbGG/vETpGpNICJA+MnEVbEoztpm4QX4cE8efNPdNer+as6YyYW5IFW7XizmN6iU8CUnyWJtwRrIEVpBOcxLhuOejoTOcqPTEg1Sy52aWI5OgDVyD58CYnxmUf5f/v8gpjvppOfF3kiCYYPaaPETyawTz5moqv4IlHMKe8CblAiSrwIcNW2gSyzQ1WHQYzl5bzLENkF8nYQmJVlaIedQ1/LZ/OHOYHvHQKId5XjIAg86W56SzbKZZr6k6RzFcyrgtSEiYg+QHrMsaK8jFYnNKH5KcAfexO88ZKjPS5Qux22OaemsN0Lh/68PYJKW4rRPbC25pAeJC0pbcb9uf8Rp4Aa2IU6TpeYinwM64rMLMrx2appk6XdOWuVkN75UTj3PwXPkptAwuZ/Q07kUYD4CEcFfFfp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(1800799024)(366016)(55112099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?50w5EWYQKo2APiS1NdxmeZKLvrnIVyEcB3M3OkHz+jpysOKLPGoIzj/e7B1n?=
 =?us-ascii?Q?zA9uDXcZADPC3tjkTLLJelvSXEKUmUVwzPRqO0KHeyTy9Dgq6SSgyqm928iJ?=
 =?us-ascii?Q?fv9Cl/jpXe6fCathDlcB0deAImU6vvq2l7RCjHibH5e3rsG0+/fJPD1NX3Tj?=
 =?us-ascii?Q?djojI7uSwSpxnlT6zvMvmOpNXt0tv9SXlSg/1Uk5PW+bra3FbZDmfS4A+Va1?=
 =?us-ascii?Q?cJhRIioZbpwiNXl2jaugeNlhgxrKkdtSkyrNFcIU/uX387lwUmePD4j+de/U?=
 =?us-ascii?Q?xCqmkNMxCFxdATSZgG6ilIEhlPl5yHCpaRGhw6q0+8XJqgPKVKawGbCP8lfW?=
 =?us-ascii?Q?RBPiPNX6u2GjyXDx7HnZjq3D6IxA6Xy5m4e/vk6eYwn6+p0EzfnCnXD20MQq?=
 =?us-ascii?Q?PULgvDA1XvYgRlhQCwQ5Kuu/jECjvdfXqkv9q6ljXjGZoueLDNzWNUVEmboA?=
 =?us-ascii?Q?rjhGEsi8UFCisnbsfcECQaNG6GllYtknPivmZXME7hgkndxTuelT9Vx1DGXC?=
 =?us-ascii?Q?7aJOMwYoAnin+NZiO+OfWJmg13tncA6kbNhmzf8bbS3JVA0DQTPYqatjb+l6?=
 =?us-ascii?Q?TR2hZ1NlRYQTQGbRtfqPcrgTuiQf05VuWvnRFgTyI9byO/ddyXQRc8I9UsQo?=
 =?us-ascii?Q?r91ZfzZqbCVQYTFP2l1kqfL+eYAbpX5UBAjc3l4+Ytzgl3x8FaiGzwHH4cXq?=
 =?us-ascii?Q?lv43WYc+LBlObdYTmCGbYK8SGDW3AliSSsu9xr8wtVabJxD2nrz237GNUFrP?=
 =?us-ascii?Q?t4ceKkogU5H96QQBo/A24JhapGlr+5OxytpslC42su+GKsCBhspSFhJlQ0QJ?=
 =?us-ascii?Q?FEw1ZZYrRPPLrXjw44jlh6M4QTk9R8I8g42gq8Kh5ym80lEFMZ6Ws3kzkil0?=
 =?us-ascii?Q?mG2KMJQEhwFL4OD+5L/BbcVGl8iFsAsttdpIf2wt4TXpAb9v2HMVgrxiJ3aB?=
 =?us-ascii?Q?6MHCUaCi8MGNeCTRGwJsK4tAO3FPYjtxn7tNNOY7Vy3uycDF9XDwFY0oOqBP?=
 =?us-ascii?Q?l3JZHE1O5QJpceX+N8GUozQAsrGiMRQ7LUh87qlBAMGz+ebXquYXXgv1eeOC?=
 =?us-ascii?Q?jLrzVYgpejpqa2lnGHVS8huN0ophxgVMBLb+yXv7dBKG8cSK6/7gfpkuUD5t?=
 =?us-ascii?Q?MlKGtCxakLT4byPXh7Q6s822cZWH8fToZcrydBs1IMhiiZHgKNmuV0grfwep?=
 =?us-ascii?Q?P69dnPLyiq7NR09pNqeo7/K+/DOVp03aWC7W8vtvytesjv9UKjCWggksRZuQ?=
 =?us-ascii?Q?QEShpcP8GPjYBpR8T/buIatN//wbppt7KCnvELnZ04w48Qk50CFc3KiAZp+V?=
 =?us-ascii?Q?2hM+L/OQEAXvUE89XST0SAikrLZ92E6df8uDIjoXNZd8L4SEHCGPw4NXYnxZ?=
 =?us-ascii?Q?jDJNJ90mCkfHXx1EvNEjrJ2w6/0JY5u3+6ytZUMuH2gbsBk09CfwU2Y9AdXS?=
 =?us-ascii?Q?MW+rZDMYJESiL+9R2FZvesiPKBHcm8kA0O4wtt4k+l5RYI3htIXlSa1rZ0j6?=
 =?us-ascii?Q?wXj8v1CdqDz42pAFevoUXvnSjiKGDyIBWDm1VKfXWPpICsieuisl9ayeg/3e?=
 =?us-ascii?Q?3Xt7XvZCDduKFGlLn1Aez97ZPcMxtpn+WrN0XWGua/v++JJKHfVVeGr6h+1F?=
 =?us-ascii?Q?pN2/V55lF3exyk1IcVnaC1KYWiA7xgjIJ4bhJ4IDR3l93LpWubZqefItq+eS?=
 =?us-ascii?Q?HYr/gZtgSTtRRYFWaBUpd3ne3ZsvP4Nr2961NMsHSAEKjcXLSb/CqE9vABY3?=
 =?us-ascii?Q?exdyNliHtJ6EoMyDz1NfZOLKYzY6xv4IxIfSpg4eLyvDPnUNrn01YOetq6/8?=
X-MS-Exchange-AntiSpam-MessageData-1:
	jjM/0kIuxYtIZHhdETPx+Wv9QspNDEr0kx7xRuis5c/vbComqKpAOnEo
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6702c5-6481-4530-0008-08deb29c6e4c
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 16:10:06.9471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZY2/fkMAOVYY8u3RsdRrLYMpg+ukLGFb8PLuW1LZrxfBfLlTCWasjgze/OaqR3wyWLtNj/lE1IFmiw6sQKkKe+P8GF5ok98qZXqgrow959dO26BiTBh+dBZjLKuQVeJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR01MB9032

If the mailbox IRQ and shmems are not cleaned up atomically there is a
race condition. If the shmem is torn down while the IRQ is active, a late
interrupt can trigger a write to un-mapped memory.
If the shmem is torn down after the IRQ, and another thread requests the
channel again, we can end up with a channel that has had its shmem
unmapped.

By moving the unmap to the teardown process, we can let the mailbox
mechanism prevent re-entrance into the startup/teardown functions.

Assisted-by: Codex:gpt-5.4
Fixes: fa362ffafa51 ("mailbox: pcc: Always map the shared memory communication address")
Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>
---
 drivers/mailbox/pcc.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index 636879ae1db7..7fa2f6b5c492 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -401,18 +401,8 @@ EXPORT_SYMBOL_GPL(pcc_mbox_request_channel);
 void pcc_mbox_free_channel(struct pcc_mbox_chan *pchan)
 {
 	struct mbox_chan *chan = pchan->mchan;
-	struct pcc_chan_info *pchan_info;
-	struct pcc_mbox_chan *pcc_mbox_chan;
-
 	if (!chan || !chan->cl)
 		return;
-	pchan_info = chan->con_priv;
-	pcc_mbox_chan = &pchan_info->chan;
-	if (pcc_mbox_chan->shmem) {
-		iounmap(pcc_mbox_chan->shmem);
-		pcc_mbox_chan->shmem = NULL;
-	}
-
 	mbox_free_channel(chan);
 }
 EXPORT_SYMBOL_GPL(pcc_mbox_free_channel);
@@ -488,15 +478,22 @@ static int pcc_startup(struct mbox_chan *chan)
 
 /**
  * pcc_shutdown - Called from Mailbox Controller code. Used here
- *		to free the interrupt.
+ *		to free the interrupt and unmap the shared memory.
  * @chan: Pointer to Mailbox channel to shutdown.
  */
 static void pcc_shutdown(struct mbox_chan *chan)
 {
 	struct pcc_chan_info *pchan = chan->con_priv;
+	struct pcc_mbox_chan *pcc_mbox_chan;
 
 	if (pchan->plat_irq > 0)
 		devm_free_irq(chan->mbox->dev, pchan->plat_irq, chan);
+
+	pcc_mbox_chan = &pchan->chan;
+	if (pcc_mbox_chan->shmem) {
+		iounmap(pcc_mbox_chan->shmem);
+		pcc_mbox_chan->shmem = NULL;
+	}
 }
 
 static const struct mbox_chan_ops pcc_chan_ops = {
-- 
2.43.0

