Return-Path: <SRS0=NIjz=DG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62750C4346E
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Sep 2020 10:54:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 152FE207C4
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Sep 2020 10:54:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="gLGQ1CLq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgI2KyE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Sep 2020 06:54:04 -0400
Received: from mail-eopbgr750055.outbound.protection.outlook.com ([40.107.75.55]:17891
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725497AbgI2KyE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Sep 2020 06:54:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LP2qBFlqHjXBC5K7Bsm1HVmfVSp28Zzxh8EzSlbHAQx40QjAvtAkk9+HMrXbl7gL5UoPrvQBD79MgnTcG4et/z21IgsDoIOlOfvCa4oXFggsDNrg1fVLHOccARgxaGWWrbiBsvvtq4UeKA3EGVgnF7N27RMD4UnM04AX3TeSGIya60PqAg6LEBaFp4uMndyxoHiAX4aATDd0pgDtMKvPSqwtkQEMxFxioiK3KJLZnRW8qr1plSgqLvfAWG7OCedwN1sFPY6hwv+2KoZSFefeslmqyvW4a6UcD8veHa+IeXPG6F19XnUUQRgIocWqoRKQoLmVJpmj7/wmeol/qZtZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyDMc+S3nJqmYLC+k0B4JI6dY0QB9kTzjT6BDj4jRU8=;
 b=BgSzXDO7M8pOiRklGASJK12Suo+nmCDFzZ7gRNuEa8xK4CLg2W0nvQ7mm18h4uaMWby+35Nknq+sQoj1+psDM2YcV0FrPIzITBP2WWG/qb7fl61TSkj+BrCiDi0X+0aL/Cf0JD4a9gooIVCrLR+o9fdb6ESqhpK+cxUhL2wssT3EzpidAfA14CCt5NfTf3bhkQoF+w5xHM0hAjpaWDBjLp7cQC2fT6qejchpQW8tBIj2jGlfEmEO99SnwoPG3AhqSVzl5WKN1R/UoYaiSlQanJJprsdR9KPq6++5maeZe+PBG1zB6AQOqfpzfdVcQpYJ0hu3MuBBiab60Dh5bvFBeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyDMc+S3nJqmYLC+k0B4JI6dY0QB9kTzjT6BDj4jRU8=;
 b=gLGQ1CLq0M7sn7E8pLlKRYgPKd6fe7BO7Zj38z+VmSPS3NbkatAvGVtb3MJ+ZYmLxmaQG9r8nZ8sy0Y8nlSnYfWsRVZxSDxh5bn/mLk/E5nppFj7/H1snfBu05kNF+av9owNFkYkkTWxaGeqsPr6puZNh872bG5krSEUjrX1vtg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (20.180.254.74) by
 DM5PR1201MB0105.namprd12.prod.outlook.com (10.174.106.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20; Tue, 29 Sep 2020 10:54:01 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::31b8:2b7f:39bb:23af]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::31b8:2b7f:39bb:23af%6]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 10:54:00 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 0/4] hwmon: improvements to amd_energy driver
Date:   Tue, 29 Sep 2020 16:23:18 +0530
Message-Id: <20200929105322.8919-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR0101CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::32) To DM6PR12MB4388.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR0101CA0022.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Tue, 29 Sep 2020 10:53:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3411b77e-8edc-47a6-95cf-08d86465f8c1
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0105:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0105513C68C28BC3C3BDE5D4E8320@DM5PR1201MB0105.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u+q3rMvH0LnoQ/vT1eG7JJPv+/YDPPfDG3dgPZemI+YT1gVc8raxuCvUPz6//vrBt1Mr6HbvUVkxXAY4E2HIAJUbFargYR78MEDPKtyjGuA5zjeeFpiiPb02PsTrsgUVouhNc3JagkLP751ERxfhichfAgyaOKCfU2ASeqnZhJugHlFKHisQZbdTXKBoPq6I9DKi7jWBFggYyrYZZtQ4YHcSHrf/EYh/njvVjARYL1o/6vwsoQgYwHGnja78/OSkvMwzUoSvEWXhzgtOH9HolRm5pyasF8NDXmrm8QBrWca6udZJp2kj88dlw/vjnUg/N4JJZs98sw4Wyd0W5aVdAsrS5yKzROkX2q2/Nw53LbJI1HKnFnr3E6JJ+Ebw/W3W8sXFNyGHoEMuMW1PlTr/MA46Tgc7NlJZZ8t/BapiI5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(478600001)(8676002)(1076003)(316002)(83380400001)(66476007)(66556008)(66946007)(7696005)(52116002)(6666004)(36756003)(4326008)(2616005)(6916009)(8936002)(5660300002)(2906002)(4744005)(6486002)(956004)(26005)(16526019)(186003)(197533005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: /xDddDzmuRn4MhlHA+AFbS6xKMNra54MFZ/vImOiuf//i5odXe+PyyVtB47Okj3DBoJ5etss1ojqO/X/ELx4t+BDoIG7114ffe6mx3k0pB4xqCdVH6MjEYCd/rmTySnzbqtWdsYcMOYaEl7zFdSPaU/1P+JXl15CL/0V5JJeD5XZtPJc3fKEGPit/D3j9Co8+5Mrai5XJpexc190alkV5cHS3I/bKslSg6qbRSPqLr10tDWLgFvUsMyR5Sf6EM1rW7ZUda2wWFUknUlPw+x+hcqbIAyRxExMfj5exJ0Uzt2Fxrh/CakkpcHGalW6ULQfUs+GIk8nClBhdCFTLn3HFx0jKiCVpJfL+KKlXDiq0OMSN+HgUFlWlDIbXDg4p0+YedTcDQskPxp8MXdV0UcVvszJ/05//alOjC9yYZs152oZhA4QSA9q8HPH0uomkeuaGxEtxjKPSGR8YzxVFecA1iMRoXHXPW+pmdkwqhCxqKAtvB6xp9+p+Ly1Yugfv37W6xBJoER3yYOIwBWNvRLgUtxDJNcpHw4Tkq2UYzeJjTmgTVeILfyjYZuS/+/Bwfm7gt0D0bKjAwo7yIrUzsq3IrdvAJlfkRoSSWEjQeTltir+mEt69jYyFZYHR1JeBoFAWIbti39C+nXRmJ2b8hcwVQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3411b77e-8edc-47a6-95cf-08d86465f8c1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 10:54:00.6112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOF4x8Xg4AoL3+ucNBubeDyYW2zl7QCkpRTLjnkn+v+HtJ+3UudGs8KbhMf7GRViyQiCFJKEGot9lqNUnZwbUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0105
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

Would like to know your feedback on the following feature
for the amd_energy driver.

1) Accumulator Interval change based on reported resolution
    - Frequency of the accumulator thread can be set during
      the probe based on fine grain (1.625 micro J) or course
      grain (0.125 milli J) resolutions.

Akshay Gupta (1):
  hwmon: amd_energy: Move label out of accumulation structure

Naveen Krishna Chatradhi (3):
  hwmon: amd_energy: optimize accumulation interval
  hwmon: amd_energy: Improve the accumulation logic
  hwmon: (amd_energy) Update driver documentation

 Documentation/hwmon/amd_energy.rst |   5 +
 drivers/hwmon/amd_energy.c         | 163 ++++++++++++-----------------
 2 files changed, 72 insertions(+), 96 deletions(-)

-- 
2.17.1

