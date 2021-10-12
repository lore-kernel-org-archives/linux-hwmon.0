Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B73C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:30:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0809610C9
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:30:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235562AbhJLJcg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 05:32:36 -0400
Received: from mail-eopbgr30095.outbound.protection.outlook.com ([40.107.3.95]:45795
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232657AbhJLJcf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 05:32:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZ/HV+M0dFaHXZiu1s0qDLErVinyoUC5K4GvIrArT/7iCMD4vqaNXzX7l/r09jFoFGeykKdJOwD45eAIKwyx9sVBejfe5Lr3t9vxlI9ROW2wt/5hfc1VwonsS6z14uc0p8zvQg/Iq0fqybB+0C8f+0/1t2bxO1cVFuxBTFpU/A3/UJXwlMPiU4PSzb17tctwpUitBYLbTXIZFQUYUMOlk0pjpiWaXK5niOH69xKKkXGjov+tklSlnxg8wi/B5cbudRwwCI00fuf9BRbrOTqX5VdVtZKxc9m4JGguNFAisooz6JO3wACrJ6iG8SSKe1FNGuCudylv2GBudnXRfuJAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KD1rHKWlUTQ8YgdDHKTtGcz270TdK0Fd8yuqtjnwQzo=;
 b=Imhoce/jgK5XwoxqLAs2innmiAAd2O2XM0FsdcV5fcez6Wiq0AazlZry9Ylo6xbBkgSefTfb1ldHssf4jOyrgiRqPTNfDXR+Sr4ErpYyZgjOKCpg6hnLtZt7jir1oV/35ILVEC8YLYCvOFbhzSrW4sOYnsmOZwGHwPeQI+Ht2QOx4wJ1FLopP7vjTGUfRO5Dc7fHm3A1BtcYDvtl4CI6ZKv4FVYC0QUmbLn9Vv417jjxMi98+nV3MlznsqTxeZ/WwQs4ifO+605KmkEBMq1eaOa+De/7xNJoUPoPlFTBnwjuzXEKpcGESbeEO8Wz36q9tRjHfRh/MtAr4F/coK4Bmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KD1rHKWlUTQ8YgdDHKTtGcz270TdK0Fd8yuqtjnwQzo=;
 b=oFSJUw4CcLOYwshavGVr9GlMT/AKUs5wuMa3CwyDTuagEKzmvtpbdt/sKEOWDilp3JLSVssxEvWM+DVXbw29asjCVJyU7BffgHvBUMC0FTMxbVYwmxlbOkhTpTqQXxNBuaptmqJPncsQsNNlDdd7r5Xl0oY0umhnO3zp5s0jOU4=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8328.eurprd07.prod.outlook.com (2603:10a6:20b:443::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6; Tue, 12 Oct
 2021 09:30:33 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Tue, 12 Oct 2021
 09:30:33 +0000
Date:   Tue, 12 Oct 2021 11:30:28 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 09/10] hwmon: (tmp421) ignore non-channel related DT nodes
Message-ID: <8835efd6cc7ce6791056b7fbce92a16f72d63598.1634029538.git.krzysztof.adamski@nokia.com>
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1634029538.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR0102CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::37) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.15) by HE1PR0102CA0024.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend Transport; Tue, 12 Oct 2021 09:30:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: beb9a178-6cc4-49dd-cdea-08d98d62f06f
X-MS-TrafficTypeDiagnostic: AS8PR07MB8328:
X-Microsoft-Antispam-PRVS: <AS8PR07MB83286E872376464FDFE18CC9EFB69@AS8PR07MB8328.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GnMTSYnH3zbfyVxZcBGf2oMX89WgRoiqLdsnPmduXwc3GfwQihIMP9d9PcJTZbebomX91cV1opgvovbdhOod3tB6myauUs6ynl5fF5Obp6c5S2sP5b3pd6Ug412qVJk8ibSGr/OGHdBtb/RVAkyWXxTc+oVJ+EOkeIJy84t3jJE281gWM5fTmYXp2QzT4vZzA1VDhUu82KmbH8zny5iCJQ3VdTd2/3bPS7UIx23D8aACyP+sOL92ZcKN9EcNz64df0gLPNQK8UaPmd2HOltSaO7nuAnKMr1CISqxSvQELeTwKJxSkBNvHpW9ZBrTbh+q4SELeffqMN6wobWg1GUz0X1b7EHTxRmDyjWqSOeZQnRO2U1ssC3wVjqd7uIKRP0T3gsagkWLyIzjnnumPr+BrlU/UNRc8X2amdtgakaBFrCN7Prox8vC49KdQeUcvtcK7UfSyXZMG238WoAYGAsgW3J6jfAyhI25JPnl3ra3rSAdcfdGsibMx1XZMKhza86/Ue1HIMxkT9WlYTG+dPGcFOFvaiqNyTDOliEiik5/4YhgeeN+jXephrntYnJLj/VPNAakIP7Vnf8ewLIBj4+Jpqk+KtkuJbRyZOiSSt/q/fuq+XsifiYuu7bYpvQkRN4fhDYjG3PbivmEjixIAsQLt7BiKnr3f7cVivMKN1ikr4twavr8BW6RiPdpI+4w2Li1wpnbpvul0fUhVmHA+Xg4NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(38350700002)(186003)(26005)(956004)(316002)(110136005)(66556008)(38100700002)(6506007)(2616005)(4744005)(4326008)(6486002)(6512007)(2906002)(8936002)(8676002)(44832011)(5660300002)(508600001)(52116002)(66946007)(86362001)(6666004)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DOIMVOwnXXOnmM1EyyCM64ZkRmrmhQS7E/0PfAAroSZmk2WWGYekxLZQmxaN?=
 =?us-ascii?Q?oiuZIUtc7VGa5Hf9QpeKkKksQ8IOW8y7qYTw7LW4cujGtY8TqFt0xIxw4YxD?=
 =?us-ascii?Q?xHTqet4j/JeQxH9tWnz9scmXSoUZQVr19Oi8Gy8FnZU0q/AxK3m3SepF0z6l?=
 =?us-ascii?Q?/nELLGUwz8pu+IlPR6/Jp0TdxOp4fiF3qbB7YhK+MZ7W7MqdJRjVWFrXpH+B?=
 =?us-ascii?Q?j78DUv3Y3MwwNMn3kFODC/QCrsMsUCyoDGi7j97U8nUOYhws4xUzHxmHTzpl?=
 =?us-ascii?Q?F95oe5SzMRSf+bT/379HPX4MUCKuq/kfH1lotVgFBQk0StsJqjaqDcNc6WTD?=
 =?us-ascii?Q?/Q187UC0Erk5IOoh/8ML2lS7G0o4ygSmise1YomuUGReAO+TWj9zR2JHpyXX?=
 =?us-ascii?Q?MLkPPyyo3GK3amzH4WEF+6U24dXYK0q1F9IFMzfSPIrX7DmLa3jljFgXsKun?=
 =?us-ascii?Q?s4PMYUjLDuSAEc/fLrrlkOcHsa1lfZ5aEzULDAGR/JrCIUzEXNfHlnAsJDED?=
 =?us-ascii?Q?RjIGyA3dnZc//m308OVLbVLLlzw5P798QxNPW6qMoSScIvpgWTfbyKi1IFWx?=
 =?us-ascii?Q?mVECwfh2TOWdyRtCc/Xq/f+DBpLqQNU0B6BRLEO8SsqCPzZH0IoUIdbQe90y?=
 =?us-ascii?Q?QtirUPbZ5KTMQG3L0T/71sRPj+XeKKb6iw887kdqc4K1AN0CQv+Mme9uNmBf?=
 =?us-ascii?Q?y333rfFsNZw394Ua2r8a8lb4ibzl8/26ZHhCSKsfNld4OOfl3evb5Fxacil/?=
 =?us-ascii?Q?C7PlwplhUMTp2u8bJX4x2pGCJ0G7+4FGW39wk97IbffUW0uXyfUBwFbZt7Wc?=
 =?us-ascii?Q?rDWaxZ2iJPjMCE8/J1SssajJ/YjFhRdfkLOlJblV/TyjRTwyG1B9E4S5FlGE?=
 =?us-ascii?Q?BpSKb9NfT3ldcIZNU0hC88NuWwNicflBcCxhOQzgSER/17aLnVLMl4iPzmDF?=
 =?us-ascii?Q?ndkX6SLbYLSmkIt71bmUfxq0Q/72yihEdO6pu60luAH7ID7EuuIcsHMaffXi?=
 =?us-ascii?Q?UZO44O3Urn7lyB1VXICaf+AY1uPzdzJGxz5AJvuJDvsOQ9UGV5849hudJSx/?=
 =?us-ascii?Q?gvLSvF7mByCUyhFcKrsEA0rxFrN/trJ7LFHwAQQsTTk0fh4Z9uD8PKJhbYKQ?=
 =?us-ascii?Q?+3RTzFRcDemT+3247QJXDEt3iHiRwkJECoMDf2flaQwkfGmbfFksRvQOGg+t?=
 =?us-ascii?Q?T6Ahp2WVbAnfIjJ/j//4b1ipZY0ABtFUhbCW1YpKWs8YyIPWerGAKFeCRe3X?=
 =?us-ascii?Q?6ALLecHSh06UkCS6SVvTL1QeYTKAWiSVsGIE0KPZ/Y2wzp1Bq7vJJh550B2B?=
 =?us-ascii?Q?YpdO8LJuJvC7+Rz4+Lp9Npil?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb9a178-6cc4-49dd-cdea-08d98d62f06f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:30:33.1488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1tHcS0uEQvvWKexfrldaPZn4ZkKA6C9V/0nK5LIqVylMNJ7X1LaQKrLS5nMjT6EPcj0xxNo6RMZcxWnKg8K/vqmGLr4ARX4Cf1unAZVjSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8328
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In case the DT contains some nodes not describing the input channels,
ignore them instead of exiting with error.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 133eca1f2650..d44112fe2a14 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -411,6 +411,9 @@ static int tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *d
 	int err;
 
 	for_each_child_of_node(np, child) {
+		if (strcmp(child->name, "channel"))
+			continue;
+
 		err = tmp421_probe_child_from_dt(client, child, data);
 		if (err)
 			return err;
-- 
2.31.1

