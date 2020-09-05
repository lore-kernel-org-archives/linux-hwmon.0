Return-Path: <SRS0=Sfjw=CO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EF2C43461
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC76220760
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:32:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="Fkjm6IwA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgIEOcw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 10:32:52 -0400
Received: from mail-bn8nam11on2087.outbound.protection.outlook.com ([40.107.236.87]:9185
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727875AbgIEOcu (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 5 Sep 2020 10:32:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpW8o1NvvzD2fb6y+zU7G0gbW+lPAmB6vGStKLUGx55gZUtoBT78/j9kE62UqERT3ywqLHC+7YGfSbx4+8RRm6JgUCdikh/HkZ1F19zTzym9yYnj8oEqj36igctflZNa40ZJgDnPjM6gqF65D33lrZynUdXv8reXR8oUvYqXr8p+xp7Avq6QY8L1kyNr5eDDv/cSEsORv2PKSV1/p9j2Vu7305ecgYBfvVOhGz2qB6dzcCMTjp0JSGR9YszSss9ZkohOhle8H6aH5/cyes2TQdzpIVCu+c7+16kYSjF2LMDYCTVNIcuM528kDH8m9Tu0difOOgNsuaZC1S7lNkWquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxpD5wWLQtIklDOYLQFCSTn0zbLInJ39TgU9frxV2Ng=;
 b=VckFv7K4nDVBWJJApTm3NTAxT2f6yTU5ITr1u0DQz+c+MlauCpq1QqgMesJSxEdZkKWq6THOq6hDFiP1H9VIEHCn61YbOuBQAiC7cN+wf31njOU99t0AS+0LS0ItVYjoU98KekNIPdc7E/bSgRsZZz7xoCWb2sTNu4U5l/8tuBcg2mkqZt4obCegDYofOJJI01KzVC1yinKKyAuDTh0/0nHWStGZ/UtLpSt4UxFoSZr81ixnwjTsM9zKA/uYKXtF1uwfNYw1fmZJlIzAWaeepVL3eyHpnFoa3UdZ2t1MO5Iaprzp0wEZgFXAP7rftXaEtdzbiPvPipoXX47o7guWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxpD5wWLQtIklDOYLQFCSTn0zbLInJ39TgU9frxV2Ng=;
 b=Fkjm6IwAIjzrAbR1DVmLm356ZOHnYheW3eX1GC9fkq7+QM+ZLeiWlOKse8HkRZvGrA8RogR474+I+T1pnaLXIRHAnUitw/R+dhwrX3Cc+lZHv4RWmgevZiNljAYYOixbx+OZXFsM6mJdqP6jK+HdGjz6IQfJzUpsFM0X/Zsco2o=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM6PR12MB3114.namprd12.prod.outlook.com (2603:10b6:5:11e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Sat, 5 Sep
 2020 14:32:47 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::311f:8c73:8d31:7839%5]) with mapi id 15.20.3348.018; Sat, 5 Sep 2020
 14:32:47 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 0/6] RFC: hwmon: few improvements to amd_energy driver
Date:   Sat,  5 Sep 2020 20:02:24 +0530
Message-Id: <20200905143230.195049-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::25) To DM6PR12MB4388.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 14:32:46 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c1fd01c3-f6ee-475c-9c5f-08d851a88f58
X-MS-TrafficTypeDiagnostic: DM6PR12MB3114:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB31144DCCA79F002224CFDAEDE82A0@DM6PR12MB3114.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xcf+gRe2q0Ht4uSG5NJHB8QaxuWx7ufQ3xvEjS4kEcM4WKaIyxo5wCafCgCgSQaOfYVk3d6I3ZYwAUovSDo5/ffjPONCahnZ3lwPb1G7hEehqh/UMkGfKEn/JHdXpI62hR8JXoNYBVlwYhIAIzm/3/IbUcTf78PDbC/URGIMqMhIazxfSYH/LhE3+CwJKbvmnIY4hPAiCUSt1/DvZtDGSzestD0eX2QGY1QFlqcPIz8Wv6bSnmK4lVD+xLybyhP0pQFTnU48y8BWC6IRfD62RExeg+AG9HG8QJY584JwZV5FPMOGYRr4RIhutDiJU8AYYvWkp7xWGlnCcw4CNtaI+nOyxKJRETYe4C+zeQkoCAlEpuepZQ+w9Ju0jFF5Dr2X
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(52116002)(316002)(478600001)(66946007)(8676002)(7696005)(66476007)(6916009)(66556008)(26005)(6666004)(4326008)(2616005)(6486002)(83380400001)(5660300002)(956004)(16526019)(36756003)(2906002)(186003)(1076003)(8936002)(197533005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: OBmHdK+m3v9+JOwrSuBi+b07YYtVHVkDkObEyGccBc+xYO6UVdbJSt3YI5EfCnYRsaFxEwdAtgTIQsTual0hA4Vtj4AKh8hvju3OXvXR0mRHx9FOEZb4AEDax7ohHP+GEZid51/Br1LuhlOQpKFYiWeOVAlH6AgvRB7V+A+ssYTzq7vGVzqV4ES7jS5INFnMncQQHD4/U532294MZRp1cOdtCk4viPFOLG4wMDR78x5v3mpJRpGnIEDaVD+JeItuJ1VUpsPeP5A+KtPSbQFycirSI5X1bww9o3HYxT4eb8JSKrhJxGEJEZe3sZqwz+/ulBN75VUVmy8hGVBnefUPveHTnJ0eqZBn46pQmIxQwUgz2qVBbZsqUatb1vRItB78wouDhwsPzUKNe4hSUceaCo5mSAWKf288yyptGsuZhpPORjvsebi7juEXUMyNcEFgV0DQ3kimIr19v4bBltXTLwEEk75HqtJ0cJu0FqAUP2l3VSdVR5uuzOjGEmz17vkLIJy0nXoD2ikFevJv/WnHFrlCdBAJtwVSt0FSu0Afs0lXgLpE1bda79gfwZKVHkUur6Uq1d40pFiWsQrWNBoq6/+WEROu9OQgV0J9F8tlCz4d9YPR2gg66XQNW84k7VmQ6RSA/P3SGgc2M+cLV3PdhQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fd01c3-f6ee-475c-9c5f-08d851a88f58
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 14:32:47.8192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KxC5jbQGni6P4zCfgeRjHo3q7UyisRsFX+Xq11oaZTcxg0EkITJ/zNYC4VNd3xvRJ+voy+Xmzx6AON8KCqhGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3114
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

Would like to know your feedback on the following features
for the amd_energy driver.

1) Sysfs entry for dumping energy counters of all the cores
    - On latest CPUs there can be as many as 128 cores.
      An ABI for dumping all 128 counters using seq_printf()
      to a debugfs/sysfs file would save a lot of cycles.

2) Enable/Disable the accumulation, Disabled by default
    - The accumulator thread may introduce some noise.
      Providing a knob to enable/disable (start/stop) the
      accumulation in software.

3) Accumulator Interval change based on reported resolution
    - Frequency of the accumulator thread can be set during
      the probe based on fine grain (1.625 micro J) or course
      grain (0.125 milli J) resolutions.

Akshay Gupta (1):
  hwmon: amd_energy: Move label out of accumulation structure

Naveen Krishna Chatradhi (5):
  hwmon: amd_energy: optimize accumulation interval
  hwmon: amd_energy: Improve the accumulation logic
  hwmon: amd_energy: let user enable/disable the sw accumulation
  hwmon: amd_energy: dump energy counters via debugfs
  hwmon: (amd_energy) Update driver documentation

 Documentation/hwmon/amd_energy.rst |  19 ++
 drivers/hwmon/amd_energy.c         | 351 +++++++++++++++++++++--------
 2 files changed, 273 insertions(+), 97 deletions(-)

-- 
2.26.2

