Return-Path: <SRS0=Sfjw=CO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BF3C2BBD0
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:32:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AB50206B8
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:32:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="TyIUJJct"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbgIEOcy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 10:32:54 -0400
Received: from mail-bn8nam11on2087.outbound.protection.outlook.com ([40.107.236.87]:9185
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728206AbgIEOcx (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 5 Sep 2020 10:32:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ts7k/g9KmWY7jMY2ypL2vS3ajfA3YaD0nJZYPJrawNbfvycCW27zFb4lw1UvSYNuaPVrS5D/hhB/noCRE4KEinAAscQkcgRf2S4RF4dwK+mzHTULPuZZjBZUWcAPxPooSJvqUMx1so5kEbdfuGQr/F7Dix8cEanE/ITV8cP92kOZCDYMV1HQZV2KLuZxVn83P25rNKRhi2aNVKJTeG8gxhQQ36aGh2q6rZ+eH96x0PyrtHtxje4tymy0zr5K7b9JU9nJXyoXO9R1Itv3KALAfRZVFC/FLjo4fTTgGntlhNdJ/TEOk/U8Pa11RqgBgDNM2LdHDDr1jqO4AkBZ1DYsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFh4S3JU5H900LMduFCoKGDACjoNGmqN1Edal7hH74g=;
 b=k9PmOQTXxY6Gnt+xINOXXsJ+ZnB5z9EYGH1Lpg9CKpCWR7gD0ODwFpmdq9k4HqpiF5xxFwGdJR7qj4I/EALAsswzMWEGfZxXjCcqeFPkkO86LLyZfpBTqwa04YJjhiuinwMPI/bPZFrlJD4tIBYZ4ILKW4CG3eyhLg2hPbdxCNZbHrWMQKvdb4AQioRyLp6iTSTj1xjo5IGblXzAl67Krs74aXvUwpIYhn125klLzRWtlJmavtGA/lFxrRlfaEiIFbHaF7/HQuJYBvIbxekEqvmmMYGnqMC0pVbcHoKVldpHzOQk0YrvzfV7mWwy42T2vLmMdZSbpGpdRd+FBSgBLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFh4S3JU5H900LMduFCoKGDACjoNGmqN1Edal7hH74g=;
 b=TyIUJJctJzUgix2xX+T98qennQjt+t0TfF6H9/E0OxQYEnqcPX7JAiw3icjzR4akg7E+w4uwqGCT+myUeTmr28336moRjzZnbxI46OIPD9Vl7cP8LVlB4mKjMOaR9rx3B08HrD7ddhkMD3iFF5vOHq/BTZjfZwDbM1T2h1gcP5E=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM6PR12MB3114.namprd12.prod.outlook.com (2603:10b6:5:11e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Sat, 5 Sep
 2020 14:32:50 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839%5]) with mapi id 15.20.3348.018; Sat, 5 Sep 2020
 14:32:50 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Akshay Gupta <Akshay.Gupta@amd.com>
Subject: [PATCH 1/6] hwmon: amd_energy: Move label out of accumulation structure
Date:   Sat,  5 Sep 2020 20:02:25 +0530
Message-Id: <20200905143230.195049-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200905143230.195049-1-nchatrad@amd.com>
References: <20200905143230.195049-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::25) To DM6PR12MB4388.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 14:32:49 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 853003c0-e1db-4c01-a822-08d851a8911b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3114:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3114DDCEE7108C5363DC608FE82A0@DM6PR12MB3114.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcV7r0+5UvRMJYuS6gKqowWG5psElgCuXEpvAS73ZIYSYh9Sc6P9u2UviXf5JFcPUdwUeFv/1GQhYPv14HRT3Diwr1aC8oPU3MyQNpjJyBKP4RQ2iTkUxCP3PH4LG9arRekefU5TYLyHk4ndJW3JuyYS01WvlC8SVoRQ7Z5lc8cHbNX9rLvy/Fs7WdQmQBgstMY5CIoXAdqVcAskRpCz4u/378W5bJyZwxuEB1OHbYrObWLRyLVc2M3V+AUHjmCtFPcpC+frm+7kNSTHLuKgGW4Z6EBePHvxfdCJORWGZI9Iwukr/oc0b40x8uF4FmG9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(52116002)(316002)(478600001)(66946007)(8676002)(7696005)(66476007)(6916009)(66556008)(26005)(6666004)(4326008)(2616005)(6486002)(83380400001)(5660300002)(956004)(16526019)(36756003)(2906002)(186003)(1076003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: h4JPk8fPpM567uIUevLkL09KoIi0uiJUYNIqPIMVAq7G8W0TAHlXtk5TtDO4jEImQtkklNRsNyClUcPvuFhXoVoJxhGu2wWdJvA4qeANyPVUhOqZTx1rVqliVC9v/nq05WwCYqGfk7AcNydFEMcsk1boUKGs5E4KvaQJQEEcU89RhppW/U1SLSHkM7ft9YWWS1H2fFX0mWgEHZ6ZrhIBNtvkrnTTxioE9MfjuBU5c2GC5RmC89x73gcK0epD0NBZb0uL2mYAa20opQVCkKupGaGeEXaLkqEhSSrDUpchMRT9SEEFnlYHVN55qH0kE3ZBh5EEML/X7wvde/0g8v8aYjNawkTfbkXKRwni1pwB82iBgoNQp7SUuXhqHM1MJiq6RbTog49yhutdQbE9uGFk5Pcr4NvlEx4kAmQ/gKns7Z5BOUu35NGy3FArMBxTo9q12ezC+r2P+oHFslvlzqEKIjH1vMJdxANc52NInJBDXPGCidmhn9XRPPyji27CQw2lH8/MTZ7dOOby9nvTnqp5OAwm3mOkhaYdnBo/+8EjF+qEVVDd8X9i1Coqs8+uomFFnyuaAI540gZ9UGrfe7G0POixZykXNHGfDIWqXTMtSYat/9dKihpj224JXBbkj7jR6kO46QuDH9uRlfHDIBoEJQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853003c0-e1db-4c01-a822-08d851a8911b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 14:32:50.5054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/NSGJtyz14aQxKt6QJl9BUKsofHhAEFq1+lCgnfRfHjA3j7RFyGWv48lvQk7ez62JgptnAP3nSlv0gWoIFbNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3114
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Akshay Gupta <Akshay.Gupta@amd.com>

At present, core & socket labels are defined in struct sensor_accumulator
This patch moves it to the amd_energy_data structure, which will
help in calling memset on struct sensor_accumulator to optimize the code.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
---
 drivers/hwmon/amd_energy.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index 29603742c858..9580a16185b8 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -35,7 +35,6 @@
 struct sensor_accumulator {
 	u64 energy_ctr;
 	u64 prev_value;
-	char label[10];
 };
 
 struct amd_energy_data {
@@ -52,6 +51,7 @@ struct amd_energy_data {
 	int nr_cpus;
 	int nr_socks;
 	int core_id;
+	char (*label)[10];
 };
 
 static int amd_energy_read_labels(struct device *dev,
@@ -61,7 +61,7 @@ static int amd_energy_read_labels(struct device *dev,
 {
 	struct amd_energy_data *data = dev_get_drvdata(dev);
 
-	*str = data->accums[channel].label;
+	*str = data->label[channel];
 	return 0;
 }
 
@@ -253,6 +253,7 @@ static int amd_create_sensor(struct device *dev,
 	struct sensor_accumulator *accums;
 	int i, num_siblings, cpus, sockets;
 	u32 *s_config;
+	char (*label_l)[10];
 
 	/* Identify the number of siblings per core */
 	num_siblings = ((cpuid_ebx(0x8000001e) >> 8) & 0xff) + 1;
@@ -276,21 +277,25 @@ static int amd_create_sensor(struct device *dev,
 	if (!accums)
 		return -ENOMEM;
 
+	label_l = devm_kcalloc(dev, cpus + sockets,
+			       sizeof(*label_l), GFP_KERNEL);
+	if (!label_l)
+		return -ENOMEM;
+
 	info->type = type;
 	info->config = s_config;
 
 	data->nr_cpus = cpus;
 	data->nr_socks = sockets;
 	data->accums = accums;
+	data->label = label_l;
 
 	for (i = 0; i < cpus + sockets; i++) {
 		s_config[i] = config;
 		if (i < cpus)
-			scnprintf(accums[i].label, 10,
-				  "Ecore%03u", i);
+			scnprintf(label_l[i], 10, "Ecore%03u", i);
 		else
-			scnprintf(accums[i].label, 10,
-				  "Esocket%u", (i - cpus));
+			scnprintf(label_l[i], 10, "Esocket%u", (i - cpus));
 	}
 
 	return 0;
-- 
2.26.2

