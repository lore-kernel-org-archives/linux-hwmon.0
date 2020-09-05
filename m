Return-Path: <SRS0=Sfjw=CO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C6CC43461
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:32:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C6E920760
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:32:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="RM1mqePD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgIEOc4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 10:32:56 -0400
Received: from mail-bn8nam11on2087.outbound.protection.outlook.com ([40.107.236.87]:9185
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728297AbgIEOc4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 5 Sep 2020 10:32:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYYqEHXUQdROoye6cqZxQku0QfAoVNghnQCc0meUCyuSRcyrs4MAj8r7TMVaTpAqbss5JTt7v+u2io1ZOx/y/NRiOwdiBEyWYE353fZfLxk6IsI2tLsgnT5bYf8y6kmxTZ2zQMfRMbLLgk7OWdNk9NH1Ez21PcEobkgZKzXl7CRsep1e2LSE5Psbbk7bqVHcDxrOZCFDwIjs2PMlFWLHcy5mwwIWrFIiWv0SFKMM/AtWc4cORQofiMyXcyvp/SlBA6aON/XoWhp7HjGaoFRcGCZKDlnwyXOeQARwlxXMVJVu6fA1gNM2Kgsjr5sj5ATLraGxLmsXIWt/uGM5goVp0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhA0rc9aIjCpwVkq9etUI7rgso6opunEg0XYPrOuXCE=;
 b=E3j2pKWau6mAVSr07jtt6cUkPJCwLYoPjAlKJZKGlEJXawIYsfKjjGA0kzTdBAXLtt0Xw3cuViRtKjAITIEAXlP000N5Bua7BbF5SLuUjS1ZEc9POiFYmDhsYYJTC3WD17nJaALTcmxBWB6uwNAWG8VGo0LvyWAgb2IxP9VTV+5OpxB7WmjS7lbJrv+Y9wHWpw52yPxRfuILRd8oGdYJGB/BVzkarsaxYmKNyHEyk0LIKKERwpWKQOkP7XcBbrBCkqrfXPMSDleSZDB4M0jmEEsISdqp9n5Fqpmk/nuHlZMbSnpCgOnQonhV5do+A3qY+6GJc7qvQZKaZsCq+13PcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhA0rc9aIjCpwVkq9etUI7rgso6opunEg0XYPrOuXCE=;
 b=RM1mqePDqIkACu0NJWQfwLAHa7Xa5l93Gq4JqjkSXIOesBl12Ax6rNODEJc/NTeKpP4aAX9yqfDDZ9HPzI0Vl0jurYzJ7zIR537fuV6Mq0kRVlYNkWyMSG43UBdYvzKQ+PwB9AhKgWiqfC3GkrVQvqqemEGWplJTq/j77R12mfY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM6PR12MB3114.namprd12.prod.outlook.com (2603:10b6:5:11e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Sat, 5 Sep
 2020 14:32:53 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839%5]) with mapi id 15.20.3348.018; Sat, 5 Sep 2020
 14:32:53 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 2/6] hwmon: amd_energy: optimize accumulation interval
Date:   Sat,  5 Sep 2020 20:02:26 +0530
Message-Id: <20200905143230.195049-3-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200905143230.195049-1-nchatrad@amd.com>
References: <20200905143230.195049-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::25) To DM6PR12MB4388.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 14:32:51 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 23b9d74c-e2d9-40e5-751e-08d851a892bb
X-MS-TrafficTypeDiagnostic: DM6PR12MB3114:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB31147F9EB9741B8D4CA49C08E82A0@DM6PR12MB3114.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SYpGTuvgPwliNJzCFBJ981boLRNfP+noMxSqtafU7K5GZ8+yyEb/1lUigrNJnAo7WQYyF//UYfwlZaXuOvgJBOARrfHmYr/swOg4yFsqByJ2dI/W13mZrHRzGIbsvOu/BQDucr9+IbEdwrE9C26inJktzITUigor4I9sFm240p97RdGFdedCJBtt/FVh8LLmM1txoJOcdsw4JzwK1r5mpWlYzEfpccOSwnOcD7SCDiSP03cH4iHELMR+yUeHqP5lWxZ9FoOUz79FT2x8gphjZYXrYv2avGxXpHdaJNkUkwk0Z6XQ3alyvpp4lV7qXt0ZWHWp3E2aIR4S5BlsuUk95g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(52116002)(316002)(478600001)(66946007)(8676002)(7696005)(66476007)(6916009)(66556008)(26005)(6666004)(4326008)(2616005)(6486002)(83380400001)(5660300002)(956004)(16526019)(36756003)(2906002)(186003)(1076003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0HHGNn5NMUQ3t5Fau3WNOcBnIXQEw51Gz7qVv3atobcq3Z7ch3KzzjSV6znOUS0wYQ+cgrPo1u0HNXve14Zh5iZrv/NnG1H/j71v/kA5SOvLV4HBLCU5H12jqMgUwA3F8F28sWlOOQYFMxu7IkZD9HKQzMBq1QkzEdB6zyCf+w6trpxTLS6Z+7O6Cv+rwAxoJneqygFRDNMrKHrBUi0bDW3bivi3NlQhhdJfFhIrzbh+JmltVnQ8dy0VaTxm4e+8hgRXyu8cOI7GxtbFQrzBN5FSB78ZvYcW/jz/2lN/W9Gsj6Jbi38DwpOwPTLf6CIfMbDGgQFKQFW4hY1YhWyXchgPd7m/MjvekZS8OOrcFK2+/I1XQkJmuJ/wXS6KkY6x/a9ybqW3ThuxEpRCxR2tVcmscUj69WnFYVN4yYZQRfLg5+8NFoIoDJlyAX6eI//SyxI3QeI+Jg4K571X2au376iIEVVQ8HoT3kslcUXzSfPFmysfdog8fioPoYaxFo8K4fJs0VA7pQQTIWlhl4puwa9PEJFUPiszmlrn7vEM0cL594AVO2iJTkW2VZfZxdVxvvscJ0YrCdisEM2RYdAV8BiGAwVI9fI/UfoM2PCfTnIi822PM9AsWCoZqk3I/1V/h2YY6+j7b0sWYo4y0fquPg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b9d74c-e2d9-40e5-751e-08d851a892bb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 14:32:53.2532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MvVN5Yc2bl939kkq2oyrJq5/EZySMGOf0upW8vBYsMkBEidKc8ignH8yOoBqCj0mmFxsWlj21feRBQrAWdVDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3114
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On a system with course grain resolution of energy unit (milli J) the
accumulation thread can be executed less frequently than on the system
with fine grain resolution(micro J).

This patch sets the accumulation thread interval to an optimum value
calculated based on the (energy unit) resolution supported by the
hardware (assuming a peak wattage of 240W).

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 drivers/hwmon/amd_energy.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index 9580a16185b8..f0a13d6cc419 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -48,6 +48,7 @@ struct amd_energy_data {
 	struct sensor_accumulator *accums;
 	/* Energy Status Units */
 	u64 energy_units;
+	unsigned int timeout;
 	int nr_cpus;
 	int nr_socks;
 	int core_id;
@@ -215,6 +216,7 @@ static umode_t amd_energy_is_visible(const void *_data,
 static int energy_accumulator(void *p)
 {
 	struct amd_energy_data *data = (struct amd_energy_data *)p;
+	unsigned int timeout = data->timeout;
 
 	while (!kthread_should_stop()) {
 		/*
@@ -234,7 +236,7 @@ static int energy_accumulator(void *p)
 		 *
 		 * let us accumulate for every 100secs
 		 */
-		schedule_timeout(msecs_to_jiffies(100000));
+		schedule_timeout(msecs_to_jiffies(timeout));
 	}
 	return 0;
 }
@@ -331,6 +333,14 @@ static int amd_energy_probe(struct platform_device *pdev)
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
+	/* Once in 3 minutes for a resolution of 1/2*16 */
+	if (data->energy_units == 0x10)
+		data->timeout = 3 * 60;
+
+	/* Once in 3 days for a resolution of 1/2^6 */
+	if (data->energy_units == 0x6)
+		data->timeout = 3 * 24 * 60 * 60;
+
 	data->wrap_accumulate = kthread_run(energy_accumulator, data,
 					    "%s", dev_name(hwmon_dev));
 	if (IS_ERR(data->wrap_accumulate))
-- 
2.26.2

