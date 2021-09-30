Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C149EC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 06:48:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A064D615E1
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 06:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348377AbhI3GuE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Sep 2021 02:50:04 -0400
Received: from mail-db8eur05on2124.outbound.protection.outlook.com ([40.107.20.124]:57632
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348342AbhI3GuD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Sep 2021 02:50:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtG+MgzxXMxZD+WzZKQ5jka6apZhKtjPLnJ2cIGgHu+7AH42zyAJeNu+clI97zZLYnNo89pJD1VUoPDYKNMvK6fhWDCpEBoWxQMaQaAktuEZya2/j062lAve0D5Nqialr2lGNn4uXgCa/vCurLbgcPddNEhUgFizIlMqZ43eVXGzwJHEGNF1+LTfLgtDowdmCKoVSvV+x5b/5/Yi8bqiqyD30xKsTEoMW8HyqVN0yD+8JSPlb2ChNjDLo/CKuvd0hEAz/kmHipdqwWo8tL6zO/hNdNLXQgzw1TBzzXyRJEYEZ1dcXNDcj8UfcwULWsLZSRScsUi055reT1kKpR8XZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G90sv7YH+XSUdMbwGpqTcgDfigidAYZR6+MLvbAQ2yQ=;
 b=nGWmrwnuCf1+WmHNjz0+9maFPCjKpRQG+YoGAA8cPJuM5QD9sVEVY2DxYSubppAMu3quwpCSLYKHvL7Ji4FjkzJZZQY2faZAJlnzY6ilJizeLmJmNhHOoz2ZVVuxgvl+vnH3D/z0OKK5tgSJhbWgK0s5YbUM0NqEn2e6MlXTwarLtsD4EysSkGPFMTZowJr4dQars6vfCJjMTzymF35kMmUWl5Pb1WPRGA6C8tWIYd1hiXuy8oRXwksZrmSW7G4MY/fjBVpEvZbd7/8hFpQTVdG5/blRc25ggz1oNgYcjoGFjKGi/D3WO0g8PXRJCvLaNCTMghK7z1W+Dtd2wiuOZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G90sv7YH+XSUdMbwGpqTcgDfigidAYZR6+MLvbAQ2yQ=;
 b=Tus4hnsr3e0W3Qig63NhYz9qzpnlqLwmqCv2Bf2EmKXo0+02dRpVSJeQThem3ZwcjMa55PGiLWznWli8cvd6XPOrkxI/lcSunkyNEBsNYIG9xGrjUZGPhBtQiz81hurCzOuVpzLLopCvj2K6bx++QauFLZl7tE7VvhcNpm0/UuE=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8174.eurprd07.prod.outlook.com (2603:10a6:10:273::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.6; Thu, 30 Sep
 2021 06:48:20 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Thu, 30 Sep 2021
 06:48:20 +0000
Date:   Thu, 30 Sep 2021 08:47:58 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 00/11] Add per channel properies support in tmp421
Message-ID: <cover.1632984254.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::22) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 06:48:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84fcc00c-68a6-42e3-b6ee-08d983de49ff
X-MS-TrafficTypeDiagnostic: DU2PR07MB8174:
X-Microsoft-Antispam-PRVS: <DU2PR07MB81746524AD38F0B84C3A5DFEEFAA9@DU2PR07MB8174.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A9IQUp/VxRp6uv/Kl+vSsBVKIuc4OOZq8EhHGfrpGNK2xg33IKxJ+PO1bPHO0G+MriBq2gZ1+f2y246bTxkpBLQNDXd0OQb68RZACLg/IlQ4is1jT+uAuCfFg7ofiMV4O6V26eeKWW2uPgx3RjOO4GwwMmq+gjrYk1zQWMjlhCX0qltV94JjXAUk0VQ+zfL1G2OWuvgqAUTAHKwOpczW17r134YT0JBkRXTRQzQdR9LjXaJOHjbXKz97a9jGqGO1g+G4IEAPvEbRPfPGjKnkXdgqDAKStBdUE7OAMyhYD5Zc60Uj+REpAvdyR3o8yTPglAMEF+sAL+9XGtvEAka1grFbaMsxjQZRy8EE6KYwxHFL7geHcp9nyRzXZmPLle8IoXrATbQfXnFYaE9GuB4XlNqmc9c5nQD04eJSfUX27c9HOXiGfLCcSogtoyE+cL9Woc0oSo9oJmYFzPkzVkvYYwaWMQ7MhTt1WDeveQXdPx2/TjLhLpdEM/QEB2a639bdZr/6rNwFw11dMrICpSYh/0rYXwJXXnV44F3PIxOakfCQGnpMjnwslWkDi6mI0sMaeQ0p561Zip8MO2My7q4+wCiqwWRotfSCTNd9RwMb+xmFVhMD51/3G9zhPVPunWY7kTJzPm59chCtn7ICzMep5p44vtt4Fr9gP16/ZGHUEhqJVr/Z+A6GlL9E0pC9p8Q8/s06DaqGMT5vk03xVFNeBEPV9m4CTe65b3e1WRCTOn0OWwBA3YVLc/QwkDsuc+5+CBUdwD0UNHE9GHPVbaxbpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(4326008)(52116002)(44832011)(2616005)(6666004)(66556008)(66946007)(2906002)(508600001)(8936002)(956004)(26005)(6512007)(186003)(6506007)(110136005)(8676002)(36756003)(966005)(86362001)(83380400001)(6486002)(5660300002)(38350700002)(316002)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9x69+X1r4pZZ8+YVNffl7OMm12v3n3zLttsonsTlLqLXfLtIEUnNEp8fsHbm?=
 =?us-ascii?Q?fPR5vEliuVUD4OQ3ehfB9YlQ1152jhHiF/0pi5BTb0g0y/2PqG25LEzhU/uf?=
 =?us-ascii?Q?T2/N3QULFaUSvNo0N/nvsLLZeCmH9jFR5p53WvMK2buRBR881szoUCAx33Fz?=
 =?us-ascii?Q?J6KoKQM7H9B0p/7ux09VRCvMcUlviyhVA40dbZSGjzvjMbsNtY3w4EoYO6mS?=
 =?us-ascii?Q?Hf9ip20NElfkya8DqjR6cfZIyn6GpSx854fakf1bdIWEjVsTaGWsAcZEnDkb?=
 =?us-ascii?Q?ApLfmQkTlBZa+OOOBst5VzbbeKLfuiBUT9NHu8n3eHjjan737fyUZytxHa/P?=
 =?us-ascii?Q?P1zLlLNqwAK0nmqm9PRMtPZvbVe52SYENCFniHOQtDQZzYFI+jMK4BIeHTBa?=
 =?us-ascii?Q?5k9ADjeZ+5byHGRCTsnOre2ZsogO3dnJs2xx//n8NFW/buWW458Cg+oIkaul?=
 =?us-ascii?Q?cQq27tEZ1oljl3nVntYX9TGeInp2ye9jgZZ6mEyidvWKZfBi5EK69EEtAe3C?=
 =?us-ascii?Q?FaBbVe//n2Tq45UXw6ZUEJJYwmkQp0xnDkCnmv3ihMLGz74PJMDkw+efyQYu?=
 =?us-ascii?Q?Pz66WWQtvp00Fl3hDzFlNmzCpADhFXny96UIatdED+QlUBhalI0gfT3LDZ6j?=
 =?us-ascii?Q?Jm6rhmRe3rSWmeApLGuiCDwGalOj5MWh3oNij91HJ3etf311pilh+9k46pTI?=
 =?us-ascii?Q?8Ljlnjw3Y9BTc028vAzjv4In114MXUS1NyEsa28s0Yb9ZZvYen0vkyeJDD9i?=
 =?us-ascii?Q?peF0Xf1aJhDmAnwHyuMg8v7MdWJE5weXeLwxx1DoPCAn1wiFyTBVGfSYD/CQ?=
 =?us-ascii?Q?gDg7/mDCnLwBbMUA4p0yHkkFWk5Tjch+CBTJPHeIBVXFzB4bJi7a7x4OzASk?=
 =?us-ascii?Q?htcTQau0Sk0dZbnXkKlgBty+GAokUcqe0akgBUmnXya8l5rhRMfg63eXotf+?=
 =?us-ascii?Q?VACZLVYiPoHEnCmYFm+2M9l4MQBk+hc4syCZQ44dOVnhUL5/Q1lVEABd9xpO?=
 =?us-ascii?Q?kXePWLoNSs6AiuP58ToOJRYqfPV4bXYhn0kvLXm2wiIFFvzOzzCfh+iJPO74?=
 =?us-ascii?Q?zo0AWwRfrAND0C+x8qaqtVd/kqAnrFHQVcOmzmDdQuA1HTuEyxz+Nf9X8dgM?=
 =?us-ascii?Q?7CUXEBlw1TPAjVc+s0MmAAiAWRApOgn2vBGAM52NgSH7VoxCo3XNoEgYgA3G?=
 =?us-ascii?Q?wVOM0WvVWc4mDUNmK6Jqsg7arHjhhaS4q/BxjRgMceEK57UtnAzH2J1QQmVG?=
 =?us-ascii?Q?C9ppXcsX4SJuqIZ38iO7A+iwD5tn7654tScZJmw6n4w38xZwiRWofn9Wdjvt?=
 =?us-ascii?Q?Vq7taoTE1yqBTN3LaZeIxQzG?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84fcc00c-68a6-42e3-b6ee-08d983de49ff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 06:48:19.8702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TeaDq3l6QMPBuIJ8wPr71qXzCc9LJ0RZ3SSmxJpVdkTjNLVf34K1yZKAO9t3bQQvD04BHnIGoGqhR7M3x2xc3jtsDFlxxtXL0Yu7ufJ1As=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8174
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

Here comes v3. Changes compared to v2:
- fixed the $id path in DT
- moved the tmp421_enable_channels() call inside of tmp421_init_client()
- fixed some unneeded line brakes
- added "ignore non input related DT nodes" patch for skipping all
  subnodes that are not input@X without raising an error. I'm not
  completly convinced this is what we should do so I made it a separate
  patch so that you can easily skip it, if you decide to

Changes compared to v1:
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

Krzysztof Adamski (11):
  dt-bindings: hwmon: add missing tmp421 binding
  hwmon: (tmp421) introduce MAX_CHANNELS define
  hwmon: (tmp421) introduce a channel struct
  hwmon: (tmp421) add support for defining labels from DT
  hwmon: (tmp421) support disabling channels from DT
  hwmon: (tmp421) support specifying n-factor via DT
  hwmon: (tmp421) really disable channels
  hwmon: (tmp421) support HWMON_T_ENABLE
  hwmon: (tmp421) update documentation
  hwmon: (tmp421) ignore non input related DT nodes
  dt-bindings: hwmon: allow specifying channels for tmp421

 .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 109 +++++++++++
 Documentation/hwmon/tmp421.rst                |  10 +
 drivers/hwmon/tmp421.c                        | 175 ++++++++++++++++--
 3 files changed, 281 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml

-- 
2.31.1

