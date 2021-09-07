Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B2AC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:41:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04F3661100
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:41:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344807AbhIGNm2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 09:42:28 -0400
Received: from mail-vi1eur05on2125.outbound.protection.outlook.com ([40.107.21.125]:15073
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344754AbhIGNm0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Sep 2021 09:42:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6dFnzCG9+QKKxBFzeny7JtIYYZqlRPckewBXkgGq+QXYD8jrs2t3SKQUu2Nce0b9bGUFnBA2+ASmWphWwWoIGHJB0hESZZbVyojLDYxcX1otOjCx01e58Pc6IujgUQ4YGNWgwgocJnJpXRuHTjN+43sDMwCzZU/1EIkpdjNGrU8vnyaVdI4GCCkHlVlWu01Tfl/ZC471MrCOir1oO3ndLPk0RianNauhSMLEmF0InFmkJuhPjII60kebaJaLirGhFRSMx83BjhDTWPLkiyTI0WgZCEqplA2LNqjdqZGbj50k9lNqsXEFFQY6J4dxXKVhcnJUCCbOrjOuOGB/ZsqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPkZTu+T/fvzVwSYYc7lvWjeOh+5Hg1jIJJztcLIlso=;
 b=jFwhUd9nObqpV/1ZLbnH7a91EPH2DHmIzKjV074EmDLohpp9f5l2bH2N4hCrBP/+S7gpg5lzoKa7cLMtKmJYm661OSSYsenCIbpA0Z9s3JPW2eTa+MmZiM7ftaIfEdKSWgyiEYDKvLRvbpUm8AySzpXIAeOaeGDy6RrE7rayBDM4DFSPP4h49+1hut1MRXUJz1HVIldowRG/SVQfAz54MxlgNM2iAbfmN4G0uJKvwVr5cCY83VdIOaFDXqm6kCL5H36am2ndKh9DW7dMbyVxENITYGrmIXp0fQdd+CT61XRux6RF7BRsFl4ChA8ZSQrTSH2zVzBkBBJz9/TTgRtpyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPkZTu+T/fvzVwSYYc7lvWjeOh+5Hg1jIJJztcLIlso=;
 b=cilcfMBTm2wDqc6GAeRuud54vaAnoy+RvmKGiUC8TzEIpn/IgOOKD7jX2B9amVloCV9EnY9TQ9H/WXifUl8eiFD/vfmTMsI5K/ITXy5wbXIIRlEtOv6eA0GaKsKGrl0XBKNVFRxq8ttl50fBky/X/wl3y6oDci7C+LesBIrKvi4=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8221.eurprd07.prod.outlook.com (2603:10a6:10:272::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.13; Tue, 7 Sep
 2021 13:41:18 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Tue, 7 Sep 2021
 13:41:18 +0000
Date:   Tue, 7 Sep 2021 15:41:10 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/8] Add per channel properies support in tmp421
Message-ID: <cover.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: HE1P18901CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::23) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by HE1P18901CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 13:41:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3ee22bd-96ad-4eb4-2412-08d972052b81
X-MS-TrafficTypeDiagnostic: DU2PR07MB8221:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8221F2C3D5E39767D4827C53EFD39@DU2PR07MB8221.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Rwd/0SdwLXgS8vtXH7nLab/rEtyJxWn/W0PBnGXunm+NXR+G4CU9C7MQx87BxZJP6BiubcvdHLI3zhbSsXDbavV31lGYyBCFYSCVMQWtZ0IvL3x9af+upFrA8yGsCZOYxemmNy24/UdEl0kIoNjiuMmcwHuhd9tN4IMlGOYHzwwwfQclDqPHJsvABOCr6TjZzbGES7NKSuJCrJnrQCf5ri88TaOzTLU3B9Fnr+HSgMtXPcmNV+3iDiK+LPJtmTuX+6Su63o4rdXs+2/dCfXc1l7/Jt0PMxbzJhqwNa4HGVZik5H9FK+HnkeCeX0mTNMIAT0SxNxIOiPyS9L8UkDhNhsIEgQLThNJyWrmj+fnEXgWCo7XvtOsv1MWK0/TsbtQHobmsPGWG76OMnmjyhUkYTfsEpo8nkkCdNuVnKcLwD/Z0COihgOu8UpdmL15PtzN/RC381sgchxfCFxjQHn7FpYFWqp/p7R4eQV6wvlOFlzw1eNY1ZTuiEEPrsYpOIdOHwoogScGMQ1JUf47WF+WZcf/egyj+ylUnhmfxLOc/5Vf+QhZW3x0SyiqIALfdQXzM8aKh+17tqZjcldH4GiUDnyPJJIRh6fj39/ZaqRbi2tnBCtxbrzxbX7Py0CnblK6INoboSCi/kHrIt7k79wuKjUZxx8gbbb3Ye8NT9Zr4iEBZBtGniuqSViP4SW/3PvGjOAunDIov943pCqUlmxAkwFrikKx9ZExmybcrIDlXMUoku/JcJM7mI1ekAP2NuoZvkML3QJVOep9L1vcDBMxkK1oeCqoZJNCERDEV1b6pw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(186003)(38350700002)(6486002)(8676002)(66476007)(8936002)(86362001)(110136005)(956004)(966005)(66946007)(508600001)(36756003)(2906002)(316002)(6666004)(44832011)(38100700002)(4326008)(52116002)(6512007)(6506007)(5660300002)(26005)(66556008)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e4OU95k7EjRQ8o8bK4KMpkIRKZF2E/W9PJNz6qD/jw6sJ/od4zK6G9uGNDqL?=
 =?us-ascii?Q?2k6fK0stz1BS4Gak+49ariz4iiUauw2CTjYLo9GAugdIF4XNpUEH0gVEmLU/?=
 =?us-ascii?Q?nvY+j5YMRFybz0CLkKWM3GldHcZHAaTtDMzUq3e6TxNk1uqQ3BNVIGghlcd/?=
 =?us-ascii?Q?3Rx20lGACsG10Qe6oncj0CS6wR8fwo/x5M1DqB1e5i4uC8PE074KgY2UrT/c?=
 =?us-ascii?Q?kUsX5XzhKvfo5fwztuokzEZpUBprWLaUh0pw2HOnsgwxAcsXMs9/XFBMjafX?=
 =?us-ascii?Q?GJPrlZY0C7tmGD9C8msbk1AMkASF1Pin38I2xtkkBLQWzZj8uke6pBzsfrX6?=
 =?us-ascii?Q?PTr2MStwrTMBx2BbwsJeo40G4X/NfMJno2ho+LhJJGYZc7br6AgspepXHI0p?=
 =?us-ascii?Q?cXC4ltUPo7MJlMdgsBCorP1QJ3bsq9cHxJ+eW4rK+ExEh2lRs2K/bFBo/qhT?=
 =?us-ascii?Q?onVZ5exAlCh1y/c8Z/9NPUsrJlgXvtXG5ssvMWpxbtX90uEBEu9e3TBnxQhx?=
 =?us-ascii?Q?dhHyJ0iEkanLf6hFoFL/2LwaqbWnq/FCWFkRIrEEwgq9BUj6rCQqvpuP9g80?=
 =?us-ascii?Q?AW57MBrlkUvq//uLhWLV4pRx4t2jJFP3aUY/wDNfvYHc7CRT6Jk+XWMjG+fi?=
 =?us-ascii?Q?KSQc/yMuP9B11uTWzWh0vC0m2NiHLQlz3UnOz321Txk50mdZQ1FtsWqJV736?=
 =?us-ascii?Q?GG6YgIHiPNnN77xF+SgxwwTYqjrgGeIA7SoMeEziSMK1JFhd9PU/ytwUW+4f?=
 =?us-ascii?Q?fjO+AVlQ5/iN3STHt1ERhIAjpeZe84oUGy2Qd2n8l68vI8KUncveihyRAyTc?=
 =?us-ascii?Q?pGS9B+U+LUDkp1wLYrRdGkMI++V9yYv5fLf87PDCn/4175PCUX6iHBAQwsgk?=
 =?us-ascii?Q?Gco+Du2l0ongpC947qSxcwUh3lyhv56vF394W4DLPxKB5iflqpUTVnYBVFKP?=
 =?us-ascii?Q?QE6rGAplc82zR6v65oqOPEbdxkJpM1P0qFQvSJ3aGE/hjvqXpeQ6kQjxwL22?=
 =?us-ascii?Q?ouA3deK/bPe0W5ah4UcEh/4eAdugReXmLM4wduBIjCEzmeEbZGkbWJEjuGtd?=
 =?us-ascii?Q?WQTXhycyKAyUvMOpkYneEV14Vfxzjvy1EeCjHcxErHX+NnH5dP6/1C/2E3+c?=
 =?us-ascii?Q?RASJBlwn93aBOjOrOH7QYOobLKCbKL40xM1yYPTBxKw7Z+hnBaFHnf36St4I?=
 =?us-ascii?Q?WyZr3qcVWmwoqm1X4marCMdv8jc1RUe3L2Pl5xxIDRErcDZSD0BlC+V76rOt?=
 =?us-ascii?Q?OERmCsc3UonNxmUhEzHg4CLE8HkLPxkz4WM4fGjcItH4Qb3IQ1mzYOMMwTIF?=
 =?us-ascii?Q?FWTDWPlUL0DwReqk9Gp5xOsE?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ee22bd-96ad-4eb4-2412-08d972052b81
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:41:18.1286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXYtM6HgLznSoLagEQMEKFmIFHn5lAmTAZa0CeYNaDmssDorb7HOFzhz7GIwIo6WTWCKMXUeD84VPbXe7FqfbtdZINlr4OT8KKkBSvOdR/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8221
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series adds support for defining per-channel properies (like
n-factor and label) to the TMP421 driver. It starts by adding the
missing DT binding for tmp421, in the form that was there before any of
my changes. Then I do the changes to the driver and finally adjust the
bindings to my changes.

The precedence for this case is:
[PATCH v9 2/2] hwmon: (ina3221) Read channel input source info from DT
Which can be found here:
https://lkml.org/lkml/2018/10/2/136

My patches does similar thing but to tmp422 - we need a way to define
the labels for specific channels as well as to define the n-factor (that
is board specific as it depends on the diodes used for remote sensing).
A possibility to disable unused channels seems like a good idea too.

Krzysztof Adamski (8):
  dt-bindings: hwmon: add missing tmp421 binding
  hwmon: (tmp421) introduce MAX_CHANNELS define
  hwmon: (tmp421) introduce a channel struct
  hwmon: (tmp421) add support for defining labels from DT
  hwmon: (tmp421) support disabling channels from DT
  hwmon: (tmp421) support specifying n-factor via DT
  hwmon: (tmp421) really disable channels
  dt-bindings: hwmon: allow specifying channels for tmp421

 .../devicetree/bindings/hwmon/tmp421.yaml     | 109 ++++++++++++++
 drivers/hwmon/tmp421.c                        | 141 ++++++++++++++++--
 2 files changed, 234 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp421.yaml

-- 
2.31.1

