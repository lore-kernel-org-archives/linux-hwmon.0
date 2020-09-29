Return-Path: <SRS0=NIjz=DG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB2BC4346E
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Sep 2020 10:54:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E589208FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Sep 2020 10:54:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="XhQFuXQb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbgI2KyH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Sep 2020 06:54:07 -0400
Received: from mail-eopbgr750074.outbound.protection.outlook.com ([40.107.75.74]:8175
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725497AbgI2KyG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Sep 2020 06:54:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fevVtrLUe31dPhsa9X3fyW73Zso21oH8+APDFKdJ7IBiiC0wvui3YvaYIssQJWcO1Th55a+jVUZzUJ1fDwoY/de9qY+XX0bHoBhvyvMqW/p1/FE9jLZNeVgxI4AI7MB3gWHCTd3+cCtWk9mVUfJ5HysHWTSjVBPtCCNiiKZfjdUnHCfy9zueNFdDsAEEQeOtHIBoFvHraKy5dVBCXqPETCWVOwcYDExC9xm6UH+7eeskKS7ZpPE6VaqnVOalHhYdMi2sFr4BrUXnk6zRONpsJLie0fWw+vXrnfXjad1R15h1QSN1UdHx3yRr/pfhWQwmtgG+wmX7q01R5fMDEGHCbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwAZXgW0oEWc1Ln9uPlWKcgGEO5AKJBRAhaDRVVd6U0=;
 b=iJWrjoYeEd8k7el/otozbnf5BRzMZkotY1TuPDxyMlaI49dOz/2+nK3r0nS24jaX3PJjZCaQuCrjkXzwrelLh/U5X/i5jYpZ08hD8ZEYCs6dtZFGOFUk71wnHIXGgdAacAprDcBXuxg2seHogkndUWwXkOiN8FLYhbA7zfCLgcx8SXkwpNonihTK5bHzURmSxGtiB9uR86P7oZ+TFZpclK69/Oxn6wcMjlvQN4MW7EtquE7XgNbLDbEUxc0rBK0C/TvY6zpb6FLszFPeN81RZwl5K/aiY2VhvQq+ZwiUrW3hAF2Zi6rdLYSeFoCxufv54aK+UfdhHjhM8vMNK1zWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwAZXgW0oEWc1Ln9uPlWKcgGEO5AKJBRAhaDRVVd6U0=;
 b=XhQFuXQboTWyiiwZ0NWPHkSmMgubvIy0/NYDmGszfI5MPTXprhibXlmBgbQ5BRvry1LrFhQ6isGgD5I6a6sWtC+9bTE4wSwECGeF81plk2KIPVdP7h4u6z03+dAfVWCIGeUjiIiX8MWU4G4xRFi4O/gUQYpTPGGjmmm5Qf5B/Qs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (20.180.254.74) by
 DM5PR1201MB0105.namprd12.prod.outlook.com (10.174.106.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20; Tue, 29 Sep 2020 10:54:04 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::31b8:2b7f:39bb:23af]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::31b8:2b7f:39bb:23af%6]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 10:54:04 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com, Akshay Gupta <Akshay.Gupta@amd.com>
Subject: [PATCH v2 1/4] hwmon: amd_energy: Move label out of accumulation structure
Date:   Tue, 29 Sep 2020 16:23:19 +0530
Message-Id: <20200929105322.8919-2-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929105322.8919-1-nchatrad@amd.com>
References: <20200929105322.8919-1-nchatrad@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR0101CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::32) To DM6PR12MB4388.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR0101CA0022.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Tue, 29 Sep 2020 10:54:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 954462d1-98e5-4a04-082a-08d86465fb27
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0105:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB01054D102258A4582508EAC1E8320@DM5PR1201MB0105.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aszSxVa3KzH75scaye0qw7Wo6Ep4nXqqrO2YKklKQhAoYYhyXAI8OZ32nUdOUEIRKXcpHb8HZdolv6rWvscT70arfTboCDCUsO9cNuVpLtSIDHxywqgBaW//1oluHvLT1WX6K2KYpT4gRbe6FJnJK0Gu72OFdL7S+yysKczB9UDjGB1ruPQOXti/pqQeGFVjtZFB+Is5KnZMm7EWqAsgGsUq995RRRSNDaxv0MbfR9yP6SrQL5BNKkk0EB1UMyduOr0l2ZYUbJ0FVD33iu2SuxssF2odDI3ZnM0Nb++O6JySarBQ3Xr6JGg+1UbWoD344EIbowMeX6NX4q2ylvSQbTi4gPoAo/ImN5tlES89rzpIIKnjsSFA7JEpAmT6zvO1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(478600001)(8676002)(1076003)(316002)(83380400001)(66476007)(66556008)(66946007)(7696005)(52116002)(6666004)(36756003)(4326008)(2616005)(6916009)(8936002)(5660300002)(2906002)(6486002)(956004)(26005)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: fqQGts2bE8//IWQzVEdr/OflJBWwXhGvxoy5Bi64fogbGi/On5tS/21fNxAeyNVAYPpa47IZp01PxL77CiqAASLPHQb6ILP3hierMTZuGWAksGup2PnRjKTb+ezHvanA78z75gnjnvdiwCIsBuY3aXTtIpKfKIQvA8M22zsQzwdSZfkJzqz/kdBZPiIlYstcDl82qWP0dfbtc0iwnGxXjww6vl8j++H62Js/e+ZawnDbrli8GXyrfbfX12Bg3MbZwRwvJ7KvA7IKDGSypXqtFDUA9L1ZZIoCgNRFJMUtOXUhzLpdaohWe4IxQxB0w6GNBbPzxIiWos5/fMcr8a3n3Y3e22DG5H3j0JtaBuI5aO2T83RD75VTh7gIy6NGxPNxOwNCVrLVHJ9/b5sxejK9Ps3uSh1o3VWB5fCjP5tDnS53uDMT5H1yCcOZrV/f8viFWzGYBzglV8bVIJzh1mIv1A+JySOHyrOnRvSCbRTdgtBNFFW6Ky7wG/krnheUq7uXp06iBQfAiFU95RBwHv/YIUnG9R3kt7T3jIaW+otkp5Pi9VcvERbCM76x6YQZEfHcfjcXuBqt25QbSzLXSejKKg9atRFQ3D57kPD59D4sYg5LpN9kY8cOXk/WDvyGWJk72OXOM6cu0LL0rOmBpvizcA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954462d1-98e5-4a04-082a-08d86465fb27
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 10:54:04.2442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3T0YQWRikohrx2hvldmT1V0Jwp2zS+Uwic2qsj402E196gagwVBHItYZjRIGSn+P/z8t8nVS6ZyV+06n7oKv+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0105
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Akshay Gupta <Akshay.Gupta@amd.com>

At present, core & socket labels are defined in struct sensor_accumulator
This patch moves it to the amd_energy_data structure, which will
help in calling memset on struct sensor_accumulator to optimize the code.

Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
---
Changes since v1:
None

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
2.17.1

