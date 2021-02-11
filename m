Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46389C433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Feb 2021 17:24:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1596E64DCD
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Feb 2021 17:24:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhBKRYO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Feb 2021 12:24:14 -0500
Received: from mail-dm6nam11on2078.outbound.protection.outlook.com ([40.107.223.78]:45792
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230404AbhBKRWF (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Feb 2021 12:22:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8CeHj7qZ1GH6vQNb6/b4moWYO3126GaQ5GCuYXFcWTUQAp5X1UKnCc6XvmS63wue+VmnsLRRph7hfDWY551LdnqNVywDd0Zj0H9+n1l6SRawXqsqLbM2xg2eME43QU1orjqo5BcAVD7X0XbDLdrQEFSRhQ8yXQBXvftQNvHzFFq1xuRYAbxaw0u9mHG9VR3EgPn093ogM49s9QWk2P7zo79RcUEG9hpzs4f0SgvQhcn2fxe8A5K00n/rjXHay1acGeHg5u6Jy0yWzYsEg2FgxLLpMI3pYjscxn8NzFHOsAm9/DU+rmiCD0HHtlrD+fCSvluca9CfJaMW/6Ixmm4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rTMZp0w4awKbZLtjHiYLnRHoZu6J4ofXsRfiOD0Jm4=;
 b=VVPemLmz8oYyPyQ2j2G3Y3IuyMhIMIC88L8CwB5WPvgr4RWWLav8fiEWygfHEdeS7pKK6JRyhGC19HJdvZ5HyeODo0kB8JlfCDzHTD4kcm0inAqvmpLczyylWn4TaRL1f0IK0T2IYetvi85Uwz5gilDVlBcXAG5gF+jxCqsA1ZUuxUMhwkaz531nrV+aYgwQKT3ps5dkdKSAR+wrakhN9HUHs9jbdEQl6c59VPGECYgyulLffarkWskjLcjB0jhlUZXlvZqW8kuHh1LB3fHVE3jZJyXDEwYGC0Eb3riNcVMpXr6T87/XQr+Pa1Uj8nJAJ2ySsxsXcoZWTIIjKYrP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rTMZp0w4awKbZLtjHiYLnRHoZu6J4ofXsRfiOD0Jm4=;
 b=B5ow6i6ApzGXTI37fJ0mCDtcLMJZzOt/FEDPUIbS19GpfkVzfViAErVtYrdxUafj1jCet7lNfGA3nqEbi3nrPv5nOEN9lKArWzTGI55rzoXKtDdlP4/mLhIkF3ch0/Hz7+GSVZ5xBaLJbAYai0SSzPTmng8GgnKCbKU7ihwYxkI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM6PR12MB3515.namprd12.prod.outlook.com (2603:10b6:5:15f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 11 Feb
 2021 17:21:13 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::fde6:793d:cca2:977b]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::fde6:793d:cca2:977b%4]) with mapi id 15.20.3846.027; Thu, 11 Feb 2021
 17:21:13 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com, linux@roeck-us.net,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH] hwmon: (amd_energy) Add AMD family 19h model 30h x86 match
Date:   Thu, 11 Feb 2021 22:50:54 +0530
Message-Id: <20210211172054.246276-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::35) To DM6PR12MB4388.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.28 via Frontend Transport; Thu, 11 Feb 2021 17:21:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f60bdff9-f71c-48dc-bc0b-08d8ceb16e50
X-MS-TrafficTypeDiagnostic: DM6PR12MB3515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3515A0C41481A36D27981E9CE88C9@DM6PR12MB3515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SNA1ND6k6LXmrb0zAXUyIc5EeuDkBhp1RwX7cbZwVCCfqsF79ZjU0oafjlWzOgD+tIm96fh9+Kf4v45xJucntUsQsYGzDShVamdVHxa0km4naFq3mjLwI+wa/3nd+u2moPfifmFdRA98eCxLHqgozbN1s68yNeC/kgrOxhaKzRJXHWZei73uSj88c6EcLUhNQ1m6uOreoGfT3zFCGRb8+BnwNiO8iIudU53ipnjOff6n++OcycO67nOgcI+FowmwGPfIGurrUY41Byi/X0fsMsscrAW0XrbTvIoVU7+oaNigg/qmeTU8yG2p0xOwocBOL/fBdDHfsRRIGjjZlzcU8zovHdOFfhFNUJ6OTZ2hIfQWOEn3slZzN9BM7HZ7JUV2jiubxFECFjkLKfblRTmsfWBHU4H68Eb9mXxJ1K8axn3IfpIyyD3i37vDb2COHANazma6c1mY8gRqVpfnGVJnugF5CQjqaDzMHLnG0PxwHMFo5ylaKQ2lvAO1tFD30MBs+jAmCnjQRUJtNDKF4DI9pQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(66946007)(52116002)(186003)(6666004)(16526019)(6486002)(2616005)(66556008)(956004)(26005)(7696005)(6916009)(316002)(4326008)(8936002)(5660300002)(478600001)(1076003)(36756003)(8676002)(2906002)(4744005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4qRBjKcwGdrND+gOd/BP6+LSfItOVhm02GzPgXJVXaQyLX9O28arP91PsMkE?=
 =?us-ascii?Q?F+LPHTsmY69qR6ucwyv4HcQ8ITmzfIzd5otPuXrkTaLjLTvR7QDTlqDcd2Mr?=
 =?us-ascii?Q?ku2HsOfKqipSdA48LLqpUcR+EMl00mzE9s/yNUzJmn724FQCmE+SLXC1G3VA?=
 =?us-ascii?Q?O7bjvuy7TIiO4xvTFNxFUdGxOHRSoLgU5EVRHdlO2enXlqWb9TD27e1/kGGH?=
 =?us-ascii?Q?TmeZ3rT613wpxkfkF8fRn9jIfffUFCVt6S8hLrv7hcEbqo8b7jkQfG64kQSA?=
 =?us-ascii?Q?rzPRN39++XB0yPJu7wfsNQJLgkDUBh2z14TkGbJBt38CRPC23dnfKYYtRzmC?=
 =?us-ascii?Q?QR0Ebardmy/I9CrEOEXnzhq+UAiYQD4PrDx8RFSQJSuuEo32+8Nz6WrQIaA/?=
 =?us-ascii?Q?Tz8CC3gIEpqo6lKJmYQQVbXqMMTM7xHifThlGDLMxZkCwNP0m1QuQtFITYc7?=
 =?us-ascii?Q?eRSLThK3O2stM4AO7h8C8koRacrqmkpHC+f3uLEEKxCl1zlYh8Djccffo1ys?=
 =?us-ascii?Q?dll8GhILCW5jAY6dsQuN/48s2uvPsgShh1bUzApbbuVSqP5H6kjOZG7Yx+gb?=
 =?us-ascii?Q?/V/937AO/3FFZyK/642kRE7J43wuO9XHzMfwYeJfxAiWo31KeyX6H/W6O1si?=
 =?us-ascii?Q?0NWT+NvGcdSAA0ZgV6NRKFktdQ/1Ujw+Sq7jEXo0aoROId5/8Ts5iOV0gJe8?=
 =?us-ascii?Q?QcMjz6qk7bfMljRnqsLh6Vrk/rH8nuDihz6yz40ZfG2p5epnFQma0tMP/QPH?=
 =?us-ascii?Q?dgea5hd0yXN1PqpyWgfm3h1zdN0HDPIZpcASM1RVjLORQWQFc3bhyiTuCI6E?=
 =?us-ascii?Q?rRz409zCJ9Kv9MzvU7VxT2rRsosXzGoNTqnckBryCMShxQs8c/0bvs5opKwd?=
 =?us-ascii?Q?4AxbvOMF0nYha3PPIACj6y/tPwCx2UOQ/4VyOUmS5uSVtyZ55V4JGqsXQBgo?=
 =?us-ascii?Q?wR8jW5DM+QX2GwhIG7Rt0Ue+R5zhUxU0uVTi34dLCkR075lBKqZCCOFI1Vle?=
 =?us-ascii?Q?HfmgLLpOZeCwetDFXEpmtD3rus/eJ5dpahCMwyoYKMQC9AVy1grZmVYLKlje?=
 =?us-ascii?Q?r9kf/hKmIgJ54WR0gZBVK8puhZe4Yaz5pO445I/nyKfU5ErXe+lLDLQwVKTv?=
 =?us-ascii?Q?qsZUna81n8LyPFeAiKAmbQkiNGb/0ru4PZzcA+Kgm4xmH5luoS6L5pLmaR2E?=
 =?us-ascii?Q?0+wQomeWhvZX+9GeacQTbBG3KDGjgchVaAJ0a7P34+wPexzkL8khh52nkHhe?=
 =?us-ascii?Q?ByQp0nBuned9BnjQPno9UlTVeLpDgSmQ20FftkV+bn3dN1XeDKyLgeLnNiXo?=
 =?us-ascii?Q?BREJrXiOhd4MgJMfrUPWdZPV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60bdff9-f71c-48dc-bc0b-08d8ceb16e50
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 17:21:13.2295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1z4NQ7L69XNs3bgoOhiXOsmk0uUoIB8t7uMgSJejqENIkPG0CqcUQGXuGj9mcrfjV4QI1jX6rG+A90tGjkqr9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3515
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add X86 CPU match for AMD family 19h model 30h. This is necessary to
enable support for energy reporting via the amd_energy module.

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 drivers/hwmon/amd_energy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index 822c2e74b98d..a86cc8d6d93d 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -333,6 +333,7 @@ static struct platform_device *amd_energy_platdev;
 static const struct x86_cpu_id cpu_ids[] __initconst = {
 	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x17, 0x31, NULL),
 	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x19, 0x01, NULL),
+	X86_MATCH_VENDOR_FAM_MODEL(AMD, 0x19, 0x30, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
-- 
2.17.1

