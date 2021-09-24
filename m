Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC0FC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:37:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4320161039
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:37:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245254AbhIXJid (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 05:38:33 -0400
Received: from mail-eopbgr10131.outbound.protection.outlook.com ([40.107.1.131]:25733
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245054AbhIXJic (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 05:38:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqdebQzox6oCmo53aWo+iKaz6lyN9t9JYa+Abmxkk5vrU0OFLtzDkNPJd9leO54M9Vg7SyQLzN5gYdX/N7hf3+NgTXqodg1g5zi9rVGVFlMqxjSi0EXrCYAnDc8+uQBMpWmq8i6aK1xoO1QBR59zmAgJQdCfHIXosKmhtXfiMbEgb3ytke3X7uvQ4MtOr+VPdaTaUT/9R+sx2ACUCJGXrz7F0087rxuhVT/pABReINrDRrMzmslP3t36jk/e05tmxFmIluY1hbU9O9HbuibdVafCkKJuopb3ac2FMCLzPpLt1gyBYz3em8JCs/6dkefcJY2diNuD2EacB8yIAvj3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydRRDFdKsCd0rgjE78d4I7lQZGXwVsD/lrKUsz4aliI=;
 b=YeXSI6paIrAU8WeGtrPyYwr4Nm55FAR3chmDQEfMEcJVrHT9xJajLB78gnB1ltI/sCeI5fZs9ZIRLdvGNjUkUSue9a+uVambZzVlCfQSuY08kn7aLwZS7f8BDN2JzMZGOICg4/gMoG2dw29AEpd46PR8BbIkbXD+85GvPJ7Q1vFTmoXW0XRiVOmF7CwkDywJ1NWw+P1rSZe2h+JOGoYUkrNCRWkK8zYd012JdAabK0aP00jGciN3bUMf7CVuaUeWn2n3VlW5V4jE1pQacWLl8nz7xXgBpPhzSRwjWA48LbnKmDipO5EvL0xBTg0mVN9s+yU6dEa/aesgMmKE2cUJqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydRRDFdKsCd0rgjE78d4I7lQZGXwVsD/lrKUsz4aliI=;
 b=XrBM7V4dkPI/hT8S8ChAygI7bqgFC/I+W5JzWm8W0g79I5Shp7ccjNIK9e/UuBnUsX1XxVf2AEbsCxKJn6sZZbZzkAXtHxAvE0drcC2Kpf+u5JvhmH/Ecj2l96qvhaC+6Y1fpLwIFau/h01PgKX5s4UHTYmgalm45eEiKUjnd2o=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8077.eurprd07.prod.outlook.com (2603:10a6:10:2b6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.11; Fri, 24 Sep
 2021 09:36:51 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 09:36:51 +0000
Date:   Fri, 24 Sep 2021 11:36:30 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: [PATCH v2 00/10] Add per channel properies support in tmp421
Message-ID: <cover.1632473318.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: HE1PR05CA0140.eurprd05.prod.outlook.com
 (2603:10a6:7:28::27) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0140.eurprd05.prod.outlook.com (2603:10a6:7:28::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend Transport; Fri, 24 Sep 2021 09:36:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7876caad-fdc1-4d38-9c7a-08d97f3ed659
X-MS-TrafficTypeDiagnostic: DU2PR07MB8077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB8077BEC1B88305CB3F4E8CA2EFA49@DU2PR07MB8077.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5LPQfy1HSCwyoeblWF57w4ox1zSiaOOy96IE5LthpjdfP7lS0x8O7FQNf3Q9ee1kE4Aq0ZeD+HkuhCpoyqvEAKf8LR6eBAAJURwWhiZ590XQqkVzOrYc3HcC/0li1yqj8CWy4mLF2JzThwPGVY8FNN5UI6a1zQXuUtzNDJZb/NWnld5NtU8aWvugRhWHl2uEX3QpCMFdvbOJa5dMam3tPK1tHRLG0xkIpdMLPs1jhkbolmoOl4DM4Zz+8VBN3tywned2fW3aBrHss+6kXfo0mml99T5LSO2gpq3yvI6dhjFXfrI1G16zixJ6u/UDsSoVvNaSXXbzDLo7vBnj/ci41UcE9P+8AxU1T0EsPb5B7vF1oyXYSV++j5AFbZz4osEZwcCqckJWBImVh0UHJb8OcHnmYnTYvrALFQKAOJoP5UdVF+534p8vn6P7/CHLobVaIhq4M041gMAFhPEwki+xyTeXakV5+JZz3V5y9aMJNGTMi2UQAyCzJQHcRV4BIrr06jwqG1Wl7JGKLpC9i26HxDQD+7uYRGY3wy7ag47+vPGLFe3Edt8P4V+6tUUqU4l3wTVXKCS3l53h/eoIXwHb2Vfx5nfv+Pf9VSwaOcuNWNfmcz8jKPynwPQRsBZuD6xjambCvfSzqZJtXxOi/XLQdX1A/yXLj6yrdtN5wvOe40lZjhlAfrgFmQSd7GCjlX6ppDJkwTCb0F1L0XZiUhxPENPi3OU5LguVu5wQgD/qcN242eKLkUK7W+jdXq2jyWYGlgxEXXFJjsJydoKPitt9i3Jo3aN/Hdu/gNXFRtESoSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(36756003)(8936002)(52116002)(186003)(508600001)(26005)(83380400001)(966005)(38350700002)(8676002)(4326008)(66476007)(6512007)(6486002)(66556008)(86362001)(6666004)(110136005)(107886003)(2616005)(956004)(44832011)(54906003)(5660300002)(66946007)(316002)(2906002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zM/oUZa9wz+DPwLpA9sTjsI6yCXUHgsVdPp1JHU6mBX83fe8TI7UFzP5aQlR?=
 =?us-ascii?Q?Da/AqtF88bNjM/+iZyjA3zTqffZrBUbC9KgOwMdn/F0BDXmKJM/Jw7+5yRCD?=
 =?us-ascii?Q?z/ikgPxclr8t5N/xdgx5z6T1IsuJMKCJYoXhMSHJ5mqrCi5P1osg7Tykaty7?=
 =?us-ascii?Q?HJAIBKyycdVaV9kZytumiSEG5SRueNuIM+qPDEVgaeB7zrhVZrCytHNnFqmr?=
 =?us-ascii?Q?kW0WveaF3M8yasxr9GwGzD4fg5wObgDL1744QzOff0NRzkH1vZiW2rGzBPbi?=
 =?us-ascii?Q?bag4+SipOST6uDCNHxW0XK+kz4JuhVxHIeb5D7VYVYd3vrs7eftUYvd6QTsM?=
 =?us-ascii?Q?4J+5WAH4BJRInPL9VaMBclN7s/z5VggCbBixUOGzBpt8ZquIEk24i8Yxwmm8?=
 =?us-ascii?Q?4al3jBHzgb3e5okyman8URQqTr10CqvWmrKtmvpqWYxWotMRunFax94/lv30?=
 =?us-ascii?Q?AacUomdiagYiOLjFmhHgXBCxg2Kr9kjz+Y+Gwo2HjiMBLgUzLLvGgPLcM2p2?=
 =?us-ascii?Q?czQNna2d3LJEqorX3GsY1KJhwpwRG4uq0GZJOg49A4by/y6dZeC/ABWVBXxC?=
 =?us-ascii?Q?E7ZvlGabAIudA4hS+zCTEb2Mastweu4c/prz48us95VzVkA+E6qsq5ddiao/?=
 =?us-ascii?Q?xmAZIF7wIbvxub0SPxW1v4i5sFwxsxY8tn1/lr5Rft8jOf3ujyud3CewGUv6?=
 =?us-ascii?Q?rbWk8cR9Kht/eMU5Sy7o+HKGbVmgVuWI6pD0VL5oxb7ahCtEDl0UifMhmPlK?=
 =?us-ascii?Q?bbRRmOI0LaFhLDSK5FuSFr8lxeavAdIhHtk0RLmdhr9gVMpiECogi2M7AnC0?=
 =?us-ascii?Q?X5Vz+qJG3ylx1I1/rGJ+TtG8zhyH540YnzNgvdrm/oti7+akwVd+aE0SvLUa?=
 =?us-ascii?Q?2fcQhB0gO4KwCdwNuXKueG1XRKivT0M+XqgkbdFgjj+3yQ17Nij1NbD3EQ4w?=
 =?us-ascii?Q?IduGakX3O754oY4bo9DgRw0fQuKa3m3FbrUX9WwEr0wy3ZDFuYi4pS8JF7Ik?=
 =?us-ascii?Q?b0rqgoz3hSSwM9hzM5dUujQu4pJyoNSK084CbSyO7lI0/O42kf7O51eA3Fpg?=
 =?us-ascii?Q?ra3Naet6qC87hFLk+ceADWqLgKtbupH8drUI0qx1aC8twLaY3kOIMeF39JDc?=
 =?us-ascii?Q?ealrJIEtpVEQKjKwBaMjUHumJYez8VQ/p3nGb+tcfuyPz24SCxFvoySAuy/y?=
 =?us-ascii?Q?3x/gtkff3ka8cbniaBKK5ByEXvyQijsjKO2QFvppK3bu40AGuxnst0HHUFCg?=
 =?us-ascii?Q?YrKAn4+jxHJQcPgKgzSRBHwUbO0Laggw+vtlpiTJu5repZ/OQfm6O9DZ6FEo?=
 =?us-ascii?Q?+HcTMxr+5JPU723zIHsH3DK7?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7876caad-fdc1-4d38-9c7a-08d97f3ed659
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:36:51.2275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQwfSAmGaGoEL5T/1ch8jWv3D7xCOFSFtzG0s/japoU0OorPHLmFQmwFA8YyV0JUBDjr/bGZvEuzaGRKAJvOXWTfMZLI/9NheP2ctb2+zEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8077
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

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

Here comes V2. Changes compared to v1:
- renamed tmp421.yaml to ti,tmp421.yaml
- fixed sparse warnings about making function declarations static
- changed the policy for broken DT - in case of errors, the probe will
  return an error instead of continuing
- in addition to disabling the channels specified in DT, the probe
  function will also enable all the others in case they were disabled by
  some other code earlier
  NOTE: this may be a backwards incompatible change - if some channels
  were disabled by some bootloader code previously the channels would
  stay like that and now they would be enabled during probe, even if
  nothing is specified in DT. Is this what we want?
- added support for HWMON_T_ENABLE
- updated documentation
- NOTE: I haven't changed anything related to DT as the discussion has
  no clear conclusion yet.

Krzysztof Adamski (10):
  dt-bindings: hwmon: add missing tmp421 binding
  hwmon: (tmp421) introduce MAX_CHANNELS define
  hwmon: (tmp421) introduce a channel struct
  hwmon: (tmp421) add support for defining labels from DT
  hwmon: (tmp421) support disabling channels from DT
  hwmon: (tmp421) support specifying n-factor via DT
  hwmon: (tmp421) really disable channels
  hwmon: (tmp421) support HWMON_T_ENABLE
  hwmon: (tmp421) update documentation
  dt-bindings: hwmon: allow specifying channels for tmp421

 .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 109 +++++++++++
 Documentation/hwmon/tmp421.rst                |  10 +
 drivers/hwmon/tmp421.c                        | 172 ++++++++++++++++--
 3 files changed, 280 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml

-- 
2.31.1

