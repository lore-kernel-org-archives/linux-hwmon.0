Return-Path: <SRS0=Sfjw=CO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5089BC43461
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:33:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 117C0206B8
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:33:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="syPiew0g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728566AbgIEOdJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 10:33:09 -0400
Received: from mail-bn8nam11on2063.outbound.protection.outlook.com ([40.107.236.63]:2133
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727875AbgIEOdI (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 5 Sep 2020 10:33:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kX0Et7EfSgl5tP1R4urhBg5o6fHAH/6sEc9XV7lwZmlwUpVeBeEuLZJG/9760gao99BvyKcah0zOV+7NSEd0670ei8UTJmW3G0oxL85h6HLsreo3tQ/Lo59QEy6pSPWu+Zz9A22pbOnlqvKfLlvaVaZhVWrwa7OTjwce2Zz7ntvqe+91Rt10GRpciYY2yfWXsudSBAFonULUtEUlp5e/LoqmvbtDUJ+q04MT4LcTkG0IgPXGZSHXU/kHkCI4GCKjHd59rnEa0zA21bFteY4/qZc5xoS5N5pFBnFpEZnrX95usVL6aqFrpJp0Zhxp63mtfHSTczPX+7XjCCLc4/kzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1N5bqHEI4+U4XXo7nsGPe15+jKaFLEC+w6COsL/I60=;
 b=IeXfAS7sVP67r7ZLTlGy6v9ZXR1Si29GCjnNYIh9PesAJ17p7E+11RqxCTxsmKUAcsxWCc3ptuN7aQgnjnAbojdAbUu7cQcqr6/MtOKrIScC3PjojFoStWFCthobDDF7Z15LZeX1jFcXjrKCofIEtQxPT0x2Bqp88vKMT9VDbqrp9ADeHBd5Too5Pr/mTo1E0JFoaSGOVHmHXoAh2NWwxvI8/DHNOPkb1Af929RWjPd0V6pvIwT9b5FX5frL3gUwR0Dg92B114vhWqEIvihu1xc/ycdR6WHLEnoNerluCb1DbaYV3Wa3v7IBSV0/HGp2TcNE9vUowh+y3bKJQB4YYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1N5bqHEI4+U4XXo7nsGPe15+jKaFLEC+w6COsL/I60=;
 b=syPiew0gUrEVou9DqIz8mGLtRJVokZdfYL/l70gx9w1GCh5tv1VuFoRdKgp/1EsCQuWVps4iXn9ZJXgQMqZC2zJ/j5dR1g1oLeGHj1u1qGkHTILYN5Hs0ojFYwpzkdLAAufKPIJymtVnlgYRZu+fYKQXIKoERVm9r56cfQE4gbs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM6PR12MB3114.namprd12.prod.outlook.com (2603:10b6:5:11e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Sat, 5 Sep
 2020 14:33:03 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839%5]) with mapi id 15.20.3348.018; Sat, 5 Sep 2020
 14:33:03 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 6/6] hwmon: (amd_energy) Update driver documentation
Date:   Sat,  5 Sep 2020 20:02:30 +0530
Message-Id: <20200905143230.195049-7-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200905143230.195049-1-nchatrad@amd.com>
References: <20200905143230.195049-1-nchatrad@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::25) To DM6PR12MB4388.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 14:33:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0bfc8acb-d2af-492a-51b1-08d851a898dc
X-MS-TrafficTypeDiagnostic: DM6PR12MB3114:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB31148563BBFA08579145CFA6E82A0@DM6PR12MB3114.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gi5P8ugyZNKcgVYVgqA/m4uMfqkTCnSpJ/pC+bSYixC991mu8am63utWfXZdPqo/oGSJPe6SeZCKGSSEMWusWQuX5PvvKLU4ak+M6TOJ0/e3UN8LV2hdzsTybV8sg/kMwn5z9pfpCILYPNsY99kExzOz8TFSYeotC3bH+VQY4E2Wo8T6tghd9uZJ3OWBI6hhunU1B20jGlu+xvoBwjrfKyNdjkjZInK640xnFOqlax2ODzOpsl25litVmojV+FwjC8mKtJ1Z4ctcuvBTD0YRs2EF18Gy0w3yfJ0sTCx59CocCU9FmJJLkL+NZZzeY7Sf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(15650500001)(52116002)(316002)(478600001)(66946007)(8676002)(7696005)(66476007)(6916009)(66556008)(26005)(6666004)(4326008)(2616005)(6486002)(83380400001)(5660300002)(956004)(16526019)(36756003)(2906002)(186003)(1076003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: S1/k3EN26Cq4xQaxsatiX9nMYoBrIGgOaxAxW2jLan/2kr5YBgmMjxcoitLwqoQiwIUNqS9i40ROwZesnD4gqdDJdED56hFOVyVSpdoXz6ECuJDTPAre8GPPFHYu3a1/G0UyAljFJmojQBnQD1rDHGbIIzVMu9WrXpMHIjMUnGzOAXZOKzT4z/dnegU2LSVOLeEUn4a9CFOCzlSAPKnZFLqAN+mgN3p5v3PuB1GxZyY0idg9+wL1izHW92yEBfviak+GfPSaZQu4IsoBe1BDLNc9OtzFvKREy14eWcnIBaYWLfjGyiO89E8IUzBojYkzFvFQ/xvM7C19hXjafp18BXmrqK6tSQWmt1qspYuIzZyLuPgOh7Dy5MlaHgUlgpZaWH598nrBzIhuI+s+taDzlam/53qQm0ZS2PQAo+V1uT6AlrCm0PvWNFoORp1d1Rwlornbndqkn9/klWSwGvtKhuP3r89XQijNI4XZJBjtM9yDh5kYBmGt/YzcBcORxP38eFka4rL6ibwhSA/ylsg431miSHUbRHkibwAuFjY8/xFvpzjaR9UsMJ6pcTEPYXpcMqPGEIJDn8yNLIDMv3GqnWX6baam2kxL0Zwca6eprIn0uIK4Yc3cc9+B7NFnNGYFW0B+ICAArN9dXSgtKyW6QA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfc8acb-d2af-492a-51b1-08d851a898dc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 14:33:03.5230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQEd18z5nQkFSDoQbYBoCXWjI4N9f0QcxmtHBffEa5bn0uUuyJcrNcULA55DZ6HJ6t2NU7ELvyqLeXb4GWMWgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3114
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Update the documentation of the newly added features
1. Set the accumulation interval based on resolution
2. Debugfs entries to capture the counters of all
   the cores and sockets
3. Control the software accumulation

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 Documentation/hwmon/amd_energy.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/hwmon/amd_energy.rst b/Documentation/hwmon/amd_energy.rst
index f8288edff664..fe145ad158dd 100644
--- a/Documentation/hwmon/amd_energy.rst
+++ b/Documentation/hwmon/amd_energy.rst
@@ -84,9 +84,28 @@ per run to a respective 64-bit counter. The kernel thread starts
 running during probe, wakes up every 100secs and stops running
 when driver is removed.
 
+Frequency of the accumulator thread is set during the probe
+based on the chosen energy unit resolution.
+A. fine grain (1.625 micro J)
+B. course grain (0.125 milli J)
+
 A socket and core energy read would return the current register
 value added to the respective energy accumulator.
 
+The energy counters of all the core and sockets are available
+under debugfs path in '/sys/kernel/debug/amd_energy/'
+
+file cenergy_dump: To print out the core energy counters
+file senergy_dump: To print out the socket energy counters
+
+Control the Energy accumulation
+---------------------------------
+
+The software accumulation of energy counters is disabled by default.
+
+A sysfs entry "accumulator_status" is provided to enable/disable
+the same.
+
 Sysfs attributes
 ----------------
 
-- 
2.26.2

