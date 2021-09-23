Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B6FC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 14:00:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64F0D60FA0
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 14:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241276AbhIWOCP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Sep 2021 10:02:15 -0400
Received: from mail-eopbgr10125.outbound.protection.outlook.com ([40.107.1.125]:18083
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241215AbhIWOCO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Sep 2021 10:02:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgpbWhqAYVM9E7w0xRkIgQqAer50CaY/Tfgg+Wsr06uiV9mPh41DyEWgiU0Wxdt9zDDrln9i6qdBv2tJsZflOLup/ZXW185nvxyWquQ38lJzM2iPHt0vsZ3AdmWFYOC9iar+lskv5LpZFuWd2EvK/f/lsXGOECmf39RrJ6/PglwAIERAtD3ZMOxNa1wlWeNlNVvavVBfeVpUozGrqR+mpryHJuz+f4iWs52UYcbajWWqCZHhMmXQRL7gYeXDaUPPnifjGEvnBPKMBKL1wZbV9MlSpnJmME3K8W06roBwk6MX5kyCZGE6R2bSaLdQoeHgxMKxF9hYacEHopiZw/CBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=DPG9JFDQmg1ow3oR0CLXZwFqQbt8JGrSiXVFvFEy2S4=;
 b=k1NE7de8HOJ6e6BJ7MHV9zyvfFw/eomG06azy01r6jzgEQ5oL6uX0YOjKKSi5W8AUiDjsO9hyCY30MLyEXCQ0PoTkZW31xZ6003nPNmYrmS8efjPUiLV3noXFWL5EsKlQ1IG8o70z5wYn5/IN5wT2KnkSfFEJzNzjR00r9QTYvg6RHQLceqS5u+0+a8QX0i+8U2PtSHj3MVX+a940tclvvUiWfIvNYykxtt9oyt/zfQLMXQKT/8oTdLdHg6UTgDOdp22V5sJcO2hhplwGqdulIW14z4sys9vuatgkDc3G2XjZfMpb6GdvSZAiRbeEl0qBsNUulRs8mYtAnhkEM/Exw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPG9JFDQmg1ow3oR0CLXZwFqQbt8JGrSiXVFvFEy2S4=;
 b=dpR5z0YBr9qbUHAQKHtxJ/kk/XPb4B1HoYtS0/+XeWCpx4pbx0cf4aV0W2WsYYx/O2lyYjc6+z0y+Lc5H9niFbpoIDrVhEMCT3n5Krk/DqB4SG6FmwAnY1K7vhan4MiyusKXOXwWU+NEwMWi0ljzFYbJX52MX6hfTZYKUO5WzO4=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8303.eurprd07.prod.outlook.com (2603:10a6:10:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.14; Thu, 23 Sep
 2021 14:00:39 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Thu, 23 Sep 2021
 14:00:39 +0000
Date:   Thu, 23 Sep 2021 16:00:24 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: [PATCH v2 00/10] Add per channel properies support in tmp421
Message-ID: <cover.1632402191.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MA1PR0101CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::31) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.4) by MA1PR0101CA0069.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 14:00:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2694ff00-c934-4261-f403-08d97e9a863b
X-MS-TrafficTypeDiagnostic: DU2PR07MB8303:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB83031BA3E7FB10D9B2C011C7EFA39@DU2PR07MB8303.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UBysyvz755ISWx5tUJtlP9g8QWxUr2ruzz2jm2w8j/IcRnLMJvg4UlnQvGR2EpM/HV5b5YxOEHvY7IUzmDyytHR6//R/WHnMZ8ro/40oSgTWvjBLdG/qIZbAl3fTZyhsmeaXT/kRHZRox+AHo9Dd8/aqtl3bpeLFANc6iHWtKHyRsBB3PwDs8fd2DgLYoQVgot7ULqVgN2znvhmNortyAxD1BVzNMLeigyJQRQJSlYfKz6rMEXdxzZJ96fyrbNL4C4j6wYD623erXr8FqX6KDeccjzq3XYgcH1Ou1/nug8zdjL1iwrUzaC+h3Y14rEj7k/VpOMmV5yKyEyq2BcJVwX8Wtd8Hdq7r83crlHek+QNRBFjKQK9wsMUgZFWRi0iDTnGURdjruSPtLfNd7BSbralL6M0kknsJM28yrJRY7qVIEnXntMRGSsoUYG09i7iOCdZ+DN6XmV6GWjXwB5PCz0bNqn51Bpa5slJ/rKmuyp/RFNMPTJguEOgaBAw6603lgs2gqAO97cWXzQiMnm4UyXBqCGSDnk9eDEGeY4u/D/pn4D+F2pQZlwzrCOKl7hJihVOU9POhQfzcN3uoptqDe72VhqQJMExJWz0BVt9jHFRpWrUbeI+eYHI/+vCZEIXIvQXIki7KDgJL/jAvqpkE5VGHu5q7i5LHmZjq2QWjsWpkJ4dYgBqnioDl3CCVDYXIMXNMEJDMRrqHC3N6snlF5Jw/2qj/GGH5lj25om4+OThGttuuUpJ0t3OioHUwDKdirnicv1QztUugXODzBa6jW4iuW90uLp6Lg4cZgMD0ZrA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(83380400001)(38350700002)(44832011)(6666004)(107886003)(966005)(26005)(66476007)(316002)(38100700002)(2616005)(52116002)(8676002)(508600001)(6512007)(956004)(54906003)(5660300002)(2906002)(110136005)(6486002)(36756003)(4326008)(8936002)(66556008)(6506007)(186003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kPb+dStp5S1srYd0bJ2XIkxuDOl8e4NW0JtdsQ+96gZKw5nqKA5uJVrGUhqG?=
 =?us-ascii?Q?PNxEjOlu3b+WLHnIyGqdMR2lChP5Am2Zx/xqGnLyO20HjNv723y5bABxHLLI?=
 =?us-ascii?Q?oeNwURXFwo+qc7U4vMzTGvP3+p/zrknp/6Oiu34hpPnYIQltJWRq7M5Wubh2?=
 =?us-ascii?Q?zEZdGp8kB2ofXuxz0saZCHb5goOX85E22Rkotqd1U5kPePJuGTCvQBUfhWyf?=
 =?us-ascii?Q?mSmfklHwIOj5mGb+OWK8QHYFGVcvfjs/auta5Can3JahZbFq8BOp1RMl9eld?=
 =?us-ascii?Q?VLCn+EvwKyzW2c8ltTcVFwPq1jytSsSNocGJ36h8VFBfECyM+UxtbtBFDgdL?=
 =?us-ascii?Q?b2w9ys1HkSu87z94E7uUkbF+i1reHelzkn/iQqkr0dyozne71HCPOg9FsL5a?=
 =?us-ascii?Q?fCd6hm5FtJf/pmDFXja4K7PlaM3pJbnBCGTueYk7RcaG3roKCwqYIVy9mumJ?=
 =?us-ascii?Q?NlWpcAkbyiRXQNDxJq+e126RoEGR1qQL/AimLVW+aBtnPKYtSn7rxkfnf2wC?=
 =?us-ascii?Q?sYtKI/i2jVCYZzkRnp1ZlihRasrMRJUns9PRp1lpObIt2lxoX5Jb6FVRnxz3?=
 =?us-ascii?Q?ZBuVpxzv5GOQLEsjYD9+9E6cDZwMMqiH6BKHBY3uvfbgkKB1E0+ooXLsjfBZ?=
 =?us-ascii?Q?oAK1xqieSgM7wDU9IxHDCuElbNeDKypL5nxFgGMX+dqtp1um9hw5HEChzL39?=
 =?us-ascii?Q?i+E+8GcTqyJakfzthoUEKW4xylxdbPngrZn7Iq+2J+BCiYYBypT4qttecvoM?=
 =?us-ascii?Q?kXmVNPFJuC7w6PxwXZPEw/oRgrdCQ+mx0efk9EN7xYaiDDjwNe39kmpoqxW5?=
 =?us-ascii?Q?LlO9O9AQ53U+o8Vng/GXxg46JRbzAy8YmT+8wSKEKw1Xg0HgqmTEOsyA0g/2?=
 =?us-ascii?Q?IAxTxkVFzH0WRXAEvOW10q5dwxnpmYFOyGVv3+d/C+MpjzKmYOVY7I3lLHAE?=
 =?us-ascii?Q?DAuq/WdlFyPqLYGPyBWtN2ejPaEYQrNz6EQi2G2JrmoWGtlmZzCtgOccnMbe?=
 =?us-ascii?Q?zmihZvI4EvGf1TLezzLSByHVluUVJSnyv3ambEptAebFpGHv/9yQiLLratht?=
 =?us-ascii?Q?fAX8j8KBYK+5kAP1wfol6ntpuq6ur8LT0bIfLvF5dAkw7tnRYdZu9awFcpBg?=
 =?us-ascii?Q?2W3gV6SdEC9JKM1isxrQtxltlXABT9CGcYzbDTjbw64TDWCgKivjOFCyxxbG?=
 =?us-ascii?Q?+2F5K9IYzTuzP7FtbtUdQsUJUCn9iL1beIcxisSZNWBQYBXlvNh4llnGxgUF?=
 =?us-ascii?Q?J3JxQT+bM4v8zXfEJzWtUk49lOz/vFE757U4gU7BCRSYLdXq/8i6xUDKn6hJ?=
 =?us-ascii?Q?tbgvGvtvEHAL3NjL5Ktkcs5o?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2694ff00-c934-4261-f403-08d97e9a863b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 14:00:39.3756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlPfJs2hCavxLtV3DHUsyUgGVYT37RoPT8SwS082GgEkrk1PtAlsyQTZtvSjnnxRAqPaggoe6xiF+Cg+eZo8dXHrsa1q2nMTQkQ1tW/5wJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8303
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
  dt-bindings: hwmon: allow specifying channels for tmp421
  hwmon: (tmp421) update documentation

 .../devicetree/bindings/hwmon/tmp421.yaml     | 109 +++++++++++
 Documentation/hwmon/tmp421.rst                |  10 +
 drivers/hwmon/tmp421.c                        | 172 ++++++++++++++++--
 3 files changed, 280 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp421.yaml

-- 
2.31.1

