Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11022116.outbound.protection.outlook.com [40.107.209.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFC137D11B;
	Fri, 22 May 2026 20:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779483153; cv=fail; b=LCCbw7UaeEdlH5Rr8fmeOL9VP+j6sPZt+2Olhl5gzuEa+0RmeIxEUupcQCnLwLpo54ZJ0vcxH+JaN7flxuK9zfL382zvmE4rwKiAJzzIlfsPAK4o7sCd8UwahvTpRMcHl1XlC6d64k87bw/lYilF1UcHZV5ZWMeOgE4rEUIs/Ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779483153; c=relaxed/simple;
	bh=RlODzhmQNY1aetmrCCnmusrx6V4j7R+msnn67AtY4VU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FaQ5rWtPKKbBsM1e5gYqErMXtE6/HiLaXY6hdZi6HPHeYW00qOVdyRWEQlZkuUoiG31mv75QiCaubTc8yiw/tWHz27iRigy9svMKsH1emfoqCLMBn9S6egyAUCRhoH67PyRdBmgqCWaQJhNLXq/3nnwu8N+UXy8scPfosLdB9d4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=PYr8/z1q; arc=fail smtp.client-ip=40.107.209.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="PYr8/z1q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhm0JVrN31rwM4y663XFKoKCQZzhMm51J3aE7ur/UaovL6/QJ4E4inr9GBNHeYF6lS9o6eRf66jAs1KRtOV0QhnfmaGIVmHzPxXQjvv6tdEpLKHgp0q6nbX0WYGCvmrfP64Z4MU44Z4+IKUR5uKvnTcysFojSmQnJtvwaKnQ8Tfu59X4dUfx/lmxgxQGTuwYjyPU8fJ2VxVhbLfqXk2s+k1mAP6pNNt6uojhf7p+VEem5BV+Xc9kiMlJDsjHiMs1vGyzvZwEWplFJfyIoUG0B6rni6j+Zxa1TP7A4zUNINvDbyVfFfq+9Fus28++0gShecXc8vSx19DUw3kdgBOzrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rd5TrjXyF1XvL08JYkWw0Got8+1gIjyp3xOFokyOvEU=;
 b=HLfhRvt6NWJgwIc0vR19NBy4abSkz3uLVZTozuN+jUkwjRVYQbh5eRD+1TrtgO3Njusv9fB5vUttJi2R9dBdEE+9R5ymNKwExBaifWHkGhpol9DBGZk6z6MRuxGX6WMhMJKyoRuUuKgu7ClrjnwBndHpUA5pcu+kViYREgTH3eRMaKDKMb4wtCZSrvR2sRm9vdCLgc+S67MsuW+4YiRWyjT6JnP5MXtmVgrMt1S5rUVh8fRGCG4eZqbypN+k6b3pW1tr5vU4EhmdwSRoR3X6OaECqjHXwc9mDdkcc5w9/rekFSBUg7BG/FnaycC+Pnw++Q+JZa80mvtEIeZe1E0+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rd5TrjXyF1XvL08JYkWw0Got8+1gIjyp3xOFokyOvEU=;
 b=PYr8/z1q90MFb+MUwaKquPn912MkWH6SmfcuWw1JS/VJM+k7L/QvmBTpCPsWZAD+xH13gpX+sV/1nn51WXM5DGl1+lhjd57XYiXrXiFtA56FyBk7BqoA2FP2lJPfZKUZLbqmCiffpekB0oYj2iKQK4OcDyjPQ+w9peOXiwjbhwM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 LV3PR01MB8533.prod.exchangelabs.com (2603:10b6:408:199::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Fri, 22 May 2026 20:52:26 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 20:52:26 +0000
From: Adam Young <admiyo@os.amperecomputing.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Huisong Li <lihuisong@huawei.com>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v02] mailbox/pcc.c shmem map/unmap in callbacks
Date: Fri, 22 May 2026 16:52:20 -0400
Message-ID: <20260522205220.237355-1-admiyo@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0115.namprd15.prod.outlook.com
 (2603:10b6:930:68::8) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|LV3PR01MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: 407e78cc-207e-4f6d-f086-08deb84407db
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|11063799006|55112099003|6133799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	S6XzZnJuZgAsLaHgUEub0HI6jnKpoLoKBa+eH5/N5PVOu/chqfkI1xzUTXBCMcNnDvwUKH++/O7gG/dQ2ULETSiOVt2KHNOzR4ZpKijAYhsY3t1QHSdfF/Cfq63tNCs7GZO9RAY/aO6wStuwVGmCjQdUaYVqUlo+tg5UtaRKTXjAUcRuKZvL/gBPZfDx0LmzhTLx4slB1CJAJ54G49bAc5TL0h3M2NFeN5BYzdshj/RIEv4oY91D1hVAWU2ItmZ3sBUxUaB7HbTcVo910EtgrBA0Bfjos/jS5yhOm+qtQMtaD3J3DHyzDZ5el8VTNNIzPgWsMmuYE1oRpRtI3fVX7pHJW9nC4ciWStVplmUXxXKEWIc5NCRuT6GwrQe/vKHwWJQAF6na/SuJ8Zb1xxSLnBesKRQMmD/uRwa+0eTey2a8ll0FuGwoROHlCu5hmBbcJxiz/kzg2IwCCyWdl0vHm0VIigTVwVelvrnR/z1kML1+qb92RB4nHsx2VosX6Ue58BMN6SfCXynjvO/dLUPkn6k/iYySIF2E3oTFX8punMK8kfmM+JYKnPxohNquFK+TppKpOiUVnrq28dt27hYC/GnwczEyvM+puQXgiGDmAA1U8KloBLvGLgGmYP2ct34w802tM+mOO93pesPgQfb7KwCogoHgre9ZGR75E+cJAs2oeEwv0PtSEGIp771d54FOhI0Axp1afNK1CBy4kW9KRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(11063799006)(55112099003)(6133799003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JmCIFHNElNFwJRGL54zpBRYPOOPculc5fcCsGgwVQpkWqkJsS3pkprGtKa61?=
 =?us-ascii?Q?3cHFH14f1fc4AQ+oZVfEzWMcjIB/6tUrKx6lXvGblyENm2I7T/FZ888Lqh6w?=
 =?us-ascii?Q?d01r73h0HLM7EMNxHFLWUewmws7LesCpmvlvMag8M0m5Tg4uYsFopEA1ICju?=
 =?us-ascii?Q?HBkCqv8QdQQb35aAcdna+v7AN/sTLLQAa/ya1N2xrc5C2hHKnqMhma6kBFl8?=
 =?us-ascii?Q?dTbxnH94BMyJwY3pf141t1usaiuPdpWp7Ew0IOKIrOJv4leP61pfflxFVTs7?=
 =?us-ascii?Q?JjJfmx9YmN4x2Fe74S4HYkoDZwqii1P6jk1uZis/M4SevQnNaJ8vkXRZXAw8?=
 =?us-ascii?Q?Ey++6k5ozFbRJ72l5pM8soJcYk1wMd6aUr72aFs+QNDtfRyuyiPXTlUMBNq5?=
 =?us-ascii?Q?Ywh8ol6E05xC/aUjLwDK7vu6DlABAqq+UDNttZhdOYGee8CyvfXSyR2LEe6y?=
 =?us-ascii?Q?lMrAtsgRB0ApqDLwEpZFdnjpe6t0jkflPDnNJ2zvCZHOPNke0b3CAafox2e6?=
 =?us-ascii?Q?QQJOx7gvmfoQAH8x3VeqKR5I1VlIjQsgffPQmkIwwVPE1G10zDlqrnE6k1+x?=
 =?us-ascii?Q?dqx8ZoKoXy78AOeOL94ghiAaXmn15BBGz+aYwvv0MA+WXXXZwq9DOtqmtlA9?=
 =?us-ascii?Q?g9+Q0fGL6Ms9rGqzEeQkD3T+0essWJ0SOk3/LVNoRqXKO3udA/I4sZhWy0Z+?=
 =?us-ascii?Q?MR1lwPVs2VHX65WbGESUtAGwzcdrG1bnt7Wk6+TpsjcMPY0SMrf2k1mvb/e0?=
 =?us-ascii?Q?bft0CDMsoCiLfgq1iFsy1PTxH1qnbtvtfr38FEfoX4ggMI52YUPxUWo/p5WE?=
 =?us-ascii?Q?rPaXCa7XZiLw2NsWbhC4NuqOV+t+UciXCPGQE6nXWyGh6ETEKuw4iY8VL/ca?=
 =?us-ascii?Q?qv6NAAy2VFr5K+Q1SdOr1ODtdq0S36LmY2BQdbpC/nmP5e4dE149AoMAp7XS?=
 =?us-ascii?Q?CUz9MIGt/cQwcuItmsfZ9iNuQM+iTVP6r5GgmI5gka9w9tfJncEgUFNIrPVx?=
 =?us-ascii?Q?z4LqHqcFYShkzy8TOhJeW9kLand6jPE0QUS1CnY1crN8wcSLX/Zaa5wrqff3?=
 =?us-ascii?Q?mYTlZv4COze90wqDnPRK4HuSOTd3uYJ/VYhiQOhccmyxRmxw3E3nnQjNW+Mj?=
 =?us-ascii?Q?5WXMAuVwxLdwTrcgxfF/cLPh6LCtD/UVA8ZlFyeCc2W+kX4e8Q9+RHQMAnis?=
 =?us-ascii?Q?KSEXwmSiY3e6nEkwF5CDo8TMWXXZ7+bEItsLYwT3YtjcD/yu3hYuY70HM5SM?=
 =?us-ascii?Q?4PnSwa4SN1Frcnyd1HrlwvsO/RR1nJBOZZzVBCo9/3z0b6BU9sgriHCVdJ9p?=
 =?us-ascii?Q?ZWOg/OSMuPuK+Olzd2jKn/l1IMQZO6MTlNOCJM0SrHHKQQs9o4VZ4rAM7TSn?=
 =?us-ascii?Q?UDCTDpMwfWde2qWDyKc+xlrWWRw1dtPlTnGFSpGeczBtPhbekgmUTQRCs9xE?=
 =?us-ascii?Q?dHi9Q1OsyWX7XSsGn99mcOzMb5avtF2k1doya7qrF0WlVVN6SHLJeHqgQXgn?=
 =?us-ascii?Q?FWNoGJGRl9LpIYZin8+lpO/n8OT5WF4WGarxg1qnO8DCOrc2+aeUjBtO8fQT?=
 =?us-ascii?Q?k2ultv5SWLsCXPS3gVf50xmg8bg0A87yugIOVgfZxatWgAiPaWNxwCIUl5Nl?=
 =?us-ascii?Q?ytrlW2Hca2nfBK1EgsIeiLnCUUrMFGEpWyI1/tsX2TfZ9+kerFLWNUM9/CNN?=
 =?us-ascii?Q?cmYs63Yt+gTAJap64Wr8RyD2dtdPPP5I5Hu/ahX2psHkRAW0wMt5zqnaoFFi?=
 =?us-ascii?Q?RjySPNqi51NK4e9/j6NjYWgYFI4Ts4daVOTijnY7T2s2M1hdyTwLwE6i8eoq?=
X-MS-Exchange-AntiSpam-MessageData-1: JDvEX3O8OBSRTA==
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 407e78cc-207e-4f6d-f086-08deb84407db
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 20:52:26.4513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTc8tmEmxStOhBz5E4/Mu9K7GL3ssY2uVO1w6xmeERTlT0qkq7bPfiC60il9JFamGAkg9PR2Olu20zOrtjfU/+29zgLSlrhjbdvbZp/BmxVVszYNx0J8e3vNcH/YzaME
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR01MB8533

The mailbox IRQ and shmems are not cleaned up atomically, so there is a
race condition. If the shmem is torn down while the IRQ is active, a late
interrupt can trigger a write to un-mapped memory.
If the shmem is torn down while the IRQ is active, and another thread
requests the channel again, we can end up with a channel that has had
its shmem unmapped.

By moving the map to start up and the unmap to teardown, we can let
the mailbox mechanism prevent re-entrance into the startup/teardown
functions.

Avoid doubly unmapping the region by removing the unmap in the
direct error handler for the request.

Assisted-by: Codex:gpt-5.4
Fixes: fa362ffafa51 ("mailbox: pcc: Always map the shared memory communication address")
Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>

---
Previous Version:  https://lore.kernel.org/linux-hwmon/20260515161001.699470-1-admiyo@os.amperecomputing.com/

Changes in this Version:

- Move the initial mapping into the startup callback
- No Double unmap on error during setup
---
 drivers/mailbox/pcc.c | 42 ++++++++++++++++++------------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index 636879ae1db7..c5873f9f2b91 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -360,7 +360,6 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
 struct pcc_mbox_chan *
 pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id)
 {
-	struct pcc_mbox_chan *pcc_mchan;
 	struct pcc_chan_info *pchan;
 	struct mbox_chan *chan;
 	int rc;
@@ -375,20 +374,10 @@ pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id)
 		return ERR_PTR(-EBUSY);
 	}
 
-	pcc_mchan = &pchan->chan;
-	pcc_mchan->shmem = acpi_os_ioremap(pcc_mchan->shmem_base_addr,
-					   pcc_mchan->shmem_size);
-	if (!pcc_mchan->shmem)
-		return ERR_PTR(-ENXIO);
-
 	rc = mbox_bind_client(chan, cl);
-	if (rc) {
-		iounmap(pcc_mchan->shmem);
-		pcc_mchan->shmem = NULL;
+	if (rc)
 		return ERR_PTR(rc);
-	}
-
-	return pcc_mchan;
+	return  &pchan->chan;
 }
 EXPORT_SYMBOL_GPL(pcc_mbox_request_channel);
 
@@ -401,18 +390,8 @@ EXPORT_SYMBOL_GPL(pcc_mbox_request_channel);
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
@@ -462,9 +441,15 @@ static bool pcc_last_tx_done(struct mbox_chan *chan)
 static int pcc_startup(struct mbox_chan *chan)
 {
 	struct pcc_chan_info *pchan = chan->con_priv;
+	struct pcc_mbox_chan *pcc_mchan;
 	unsigned long irqflags;
 	int rc;
 
+	pcc_mchan = &pchan->chan;
+	pcc_mchan->shmem = acpi_os_ioremap(pcc_mchan->shmem_base_addr,
+					   pcc_mchan->shmem_size);
+	if (pcc_mchan->shmem  == NULL)
+		return -ENOMEM;
 	/*
 	 * Clear and acknowledge any pending interrupts on responder channel
 	 * before enabling the interrupt
@@ -479,6 +464,8 @@ static int pcc_startup(struct mbox_chan *chan)
 		if (unlikely(rc)) {
 			dev_err(chan->mbox->dev, "failed to register PCC interrupt %d\n",
 				pchan->plat_irq);
+			iounmap(pcc_mchan->shmem);
+			pcc_mchan->shmem = NULL;
 			return rc;
 		}
 	}
@@ -488,15 +475,22 @@ static int pcc_startup(struct mbox_chan *chan)
 
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

