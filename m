Return-Path: <SRS0=NIjz=DG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A6FC4346E
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Sep 2020 10:54:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B943208FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Sep 2020 10:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="Qv+qvLSg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgI2Kyk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Sep 2020 06:54:40 -0400
Received: from mail-eopbgr750057.outbound.protection.outlook.com ([40.107.75.57]:5952
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725306AbgI2Kyk (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Sep 2020 06:54:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMZGEuJi0dEryeUNFfkB/8X+6h1I+9g85R4iN4i+xobmB0yXMEaC5H3aRhFZwJ9xnDlispNUG3KWj3sme0919wmw9khOHlF0O0Ah2LPq56Pj+BW3o1nrHPpVThMmvEJrVHBvUNzUvJNsyaCAjI1Tns4VQ0N/pKmE0YQZvAS9u+Dcu4HesQVgtwM7cjxNmEMF4lBdBPKnXAwh5q/TJI3aNZ8y1NxmG8V6u1RNNA95JKuAQH4+QlPsIpBHgUhjIW14VA3Yjiri4WN2pbfNv9kExhNFKjK5Z9illnMMyS7aJHPDyQcIYjT3Q5yEFZbBppcCgbowfiKjVmVjp14YG/xPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8EZl2TGw699PkKeXZLop2Uvcbu7VsD4pEC3bFXfa9s=;
 b=dy7fuEq7MwBRnHnTFh+aSIQF32ECYwjtCKsTQBKvXByAqxkkkEK29XwNV05QcjxE9zxtZlEL4QVdmOf485l6itDDEsGC/9vpLiRjeYZxCv33VAQ+nGX2hD1Ubd4yPQ9Bo1pdvdCAYsisG8AzYp/3BNSLHrSQmF5GNGNuq33VJncsgAdgRL2IgGcKT4imaDo0gdP8ArLETfMrhv6RMvghRf0bkppfZaM/I2/ec9i7zjqBVm2wzQgtmk6x4qd5cvh2344/69XT1P2SmfINTzV4Vy/r9z/m/BEyH4D2JPsSUETtKLEG70bOahmq6BlDMaOe0RZa0Mlfu9Csx/4UGPxJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8EZl2TGw699PkKeXZLop2Uvcbu7VsD4pEC3bFXfa9s=;
 b=Qv+qvLSg/rV7r0NjzEEAy7JYrlPCcHm8AHnXkqRKOq9zrKADKSCIrzybzCNeBtxwjdk2MQ2rlwACX9zVSr5ir3u/tFnjDHI0g3JpbVOj+I1nFTYTOP+3csYryWob2Z6oIZqaMmaizopU9Wv+nfGT+mNjRjoGCMzMRQXOAOey910=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (20.180.254.74) by
 DM5PR1201MB0105.namprd12.prod.outlook.com (10.174.106.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20; Tue, 29 Sep 2020 10:54:38 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::31b8:2b7f:39bb:23af]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::31b8:2b7f:39bb:23af%6]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 10:54:38 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 4/4] hwmon: (amd_energy) Update driver documentation
Date:   Tue, 29 Sep 2020 16:23:22 +0530
Message-Id: <20200929105322.8919-5-nchatrad@amd.com>
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
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR0101CA0022.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Tue, 29 Sep 2020 10:54:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 74709860-a0ca-44db-8a2e-08d864660efb
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0105:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0105E01DA1C118BB7E3105BCE8320@DM5PR1201MB0105.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J4vMPAu2hMXql6cn/TAp7QFHJKlBYKJNkozqBoUQDKoY9/JzAvtBO8GL7T9R6LkddG6itVylE2NtSc1KqkU7zPMVrFKF0/uVyc2VBix0hJnlrJNfaB1HZwscpo3wieiwlhJplup+qQyDYHojSHxwvUlXXAMQ2dl4lKEd8Fe8nWt0xFnvHtKvmsHCk+AU6IGDioioo16exfg0jZl4ya06P2IRvWiIcC+FKFeI8HX9xOt9o1R7lYuSeodNFZwU7+VPxPZZAnOZOqkBg92mS9jVqgt2LGZL4JHNe+vJ0+WN9ln+p0HFRdwrTR967QLgruxCCS2H6aJppVr2aTLjvuRCi1kNHJFhcaNrTelJK+n9v4R08noy7ZBLT0UsgjbFGPCJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(478600001)(8676002)(1076003)(316002)(83380400001)(66476007)(66556008)(15650500001)(66946007)(7696005)(52116002)(6666004)(36756003)(4326008)(2616005)(6916009)(8936002)(5660300002)(2906002)(6486002)(956004)(26005)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: hnoDNgQ0ibK0jY/TXbUtIOvDsMeMJ4HbFX0qpxj+wiTg9EzbPLGTvVAHPGMIAB8+BDF336GI0MChOw9pUfd1hFyoVlLwXTWqWbY3l1pB+57uQ3hfC1dlu7CzazxO4fOkkBalOUA2kkDPouXnntgh3Z5HVfkqnwkeErwmW8faigXd/C96hO5HJCTj+OBpFm8rHmutJWptkysba9ioF/ATVjePOlH+Zur9LQDUYMG1YQNJyne+MZPMr34BeVYQahAH7J71r4m/gZweLv8DDk7nKSr7upbAJGezqlRyTf19exsoIEk2ENgkXLHTnw3UBvxIc0uiH7K8c+y2sjbShmUahn/N4tRHR2YTRBMRlLPsZYLhpBTRE1JLtfKzxLfqPiZ0B+HVKW6pkKwehQhdBJdCGMe+YWeNi85+DA9Xl67v4PqzQPbdC70kxrzpQ/zdmrJXw+L0W5TC8E8NQp1Dn5zwxKj+Uu0NzFfEqfwyViNF8buRmvBpKiLi8pHUF8Ry/Su71iYv3ciCc/A85Dar+ZhYJvpU9SLryIYdNLcLRCV+dPVWd5wJbILwxqzw3W7MXJbT2hGB50xbnAwIs27PlJLZIrzMO5iM3R1oPAc39MzBtdZsWroaUdbPIZzPAZ+J6D7gZ0EmboJJoiNX7P4eeypMTQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74709860-a0ca-44db-8a2e-08d864660efb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 10:54:37.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTr3BNHWBpLtSsAb1z91ww4Bhr3AVo7vgXXXuBtIQYXHDRzaHsZzh77lZCv3ee9Eskrj6DJiEBykXl0H03lFGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0105
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Update the documentation with the newly added features
* Set the accumulation interval based on resolution

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v1:
Dropped the accumulator status control and debugfs feature updates

 Documentation/hwmon/amd_energy.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/hwmon/amd_energy.rst b/Documentation/hwmon/amd_energy.rst
index f8288edff664..86e4ebc5cbc2 100644
--- a/Documentation/hwmon/amd_energy.rst
+++ b/Documentation/hwmon/amd_energy.rst
@@ -84,6 +84,11 @@ per run to a respective 64-bit counter. The kernel thread starts
 running during probe, wakes up every 100secs and stops running
 when driver is removed.
 
+Frequency of the accumulator thread is set during the probe
+based on the chosen energy unit resolution. For example
+A. fine grain (1.625 micro J)
+B. course grain (0.125 milli J)
+
 A socket and core energy read would return the current register
 value added to the respective energy accumulator.
 
-- 
2.17.1

