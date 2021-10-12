Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D413FC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:14:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1F6361056
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235441AbhJLJQo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 05:16:44 -0400
Received: from mail-eopbgr70117.outbound.protection.outlook.com ([40.107.7.117]:7845
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232657AbhJLJQn (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 05:16:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+1+ZGQ5ibOdurmkqepAT0TYF1YKOWHEGiiokUVdMIKvr5/H6sMGwZGvPoeUMnF2FhlsoQtur1gDX3kQ4yNxZDwjGOfJ/52oWX6EZDiX+3U9ClvNQILZ89qVKTct1+EyFvZUwFl3Xayzh9o+IqhGsC5HRgCFF+4fwWpLNoTV7bRGg3fR1wa+0rN5P6BOE+ZSFbV046ncgItko3mhsv+LkBcPcJPdL1lzW+eE6/obMZzK5bGBOf9fF+CkVv68+Tugefl2SuZV6P8I8Vf/0fzEOV7QjpL7XS9jVwG2zZ0QOSYwiRKYm53NISNZO+QRMAlJvdJcTTuGcZzmtPQeaqHfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgc3ENc5dPqPW/BlIKYrZWT0dCy26y8HZJnxraWhjdo=;
 b=Yft4+haKfm6G0Ni/Abii7zTmgfTDBxkXzndJ6BYJq5Q3UdfkMqF3iQSEKbG1Qyw6ns0d2oG1RoUX5pnn3+EPnAv7xe0AqxZaPECTWK/IplNTqo0H1BEbZyCbYvBpG9rSQwfcG0VqpU3N2k02W6dqIEHU6dzxR0kg+cUrxZzbazoSYAZbc5g9vwNiP3xyvBuESlHMBfFsTblwxGO6Rq6qG8JxKZKUb1hHajQAYc4KoQnf67SXt68oFXktXjcswpk1ADy0b/I53QgMl+TK0+fMtzyXBWnoP1m8bKPv3jejIshkxy++4S+wH30+XAxgLRXyIQ6rn9jU63MZ+aa/JH9euQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgc3ENc5dPqPW/BlIKYrZWT0dCy26y8HZJnxraWhjdo=;
 b=NBceH/LzDwYqb17/zCjrh5YGIqEEUF2veq5hH9foBE2cErF5XtR/zUqZr1OsdPcJvOwuDaPH7q2KWv37PLREEwFOXFh2WB9cLzXIyBbACqn8yADu2OTEN0taJFpisjsKz7RJPo3kHo1KAfsSnqXQTebTrB0LZBbDm6JwT/r8rBI=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8167.eurprd07.prod.outlook.com (2603:10a6:20b:376::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.5; Tue, 12 Oct
 2021 09:14:39 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Tue, 12 Oct 2021
 09:14:39 +0000
Date:   Tue, 12 Oct 2021 11:14:32 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 00/10] Add per channel properies support in tmp421
Message-ID: <cover.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: HE1PR0102CA0032.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::45) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.15) by HE1PR0102CA0032.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 09:14:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5abedfc8-4dd8-49d1-cbf3-08d98d60b7d7
X-MS-TrafficTypeDiagnostic: AS8PR07MB8167:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8167AB3B06DE458FCE3D0C05EFB69@AS8PR07MB8167.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1B0hQhGWlGeRKlt2fudmsybFo77DMb3f/1Q2EltO3ta9390LkHwlW86Lmz7n0yyz13uAJPyGUh45djreY5StwRf/Z82JKx/S08wH29mf0X3Y/LlOU4P2lWO2iqcMvPMwy1XnclNn9REH7NIuYib0nwLwE9N2tZpL0uNVoPxmq5Yg01+AHJabBrISZXNtKwstcBII3LI31tDWB+/D7PHmhp5IZbC8JmMRVqsluy7HD7oOrGfoGLDEGsiV1D7ICN/PspEbAfbr3DHpEx4NVCz/mRHwmeoVuFYSbsJauyDEaRbm5IkdWUFWZNwZKCbLVwpoDMAtOwX8eOfXPzJ34/UUgN/xmTTcyvT/+vDAYbiHdlIGgspB2iT7MVEn/74lk2FmGC8wadXZxDId1j7aEhT7nUg53X6TBEtFSdangccw4WKXZEQ4nh8IUTLPKlrxdMgI6rXhJhYXfKs2Mk/JlwiVPYf39dST5w7sonR0b6bRP448cwlwEnfT0VDA2LmR/0Bc4gRqps0NEkgnbcHfkE2LusoE61CGPGyCsXV66/Px52Ctn6NctopjbazNEJxZe9Fyyd1eERsM07csoq+N7+FWWnniNiCg7FHO4tFbv7S71FqelPUKrNQs2e53ob+PKttct/rqfTZHztfpJXAE230Ryj4w3gIRoDlcvNgW1kfMTb9ziaQ2MJydtAYzBkUAXR8tSadh8C1bE0DcrbFIYm7wuuQziNgSUhbN1Oo/IV6RbDoNuBhgKhEQkg0vyfU8fHC5BMZh/NlRTST4X8m7z/FsVeyXVNwm4AbFZZsbznIpZRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(38350700002)(508600001)(4326008)(6486002)(6666004)(38100700002)(86362001)(2906002)(26005)(186003)(8676002)(6506007)(6512007)(966005)(110136005)(52116002)(956004)(5660300002)(36756003)(66556008)(44832011)(8936002)(66476007)(66946007)(2616005)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4E0ko4cKl/8tDRdxf3nZyuyno/sFKlacLRmPGURnCEBmpKcW96/AsLBX61Aw?=
 =?us-ascii?Q?87lJauOlB3a5OYEZSbyYmDBCWaAaZb+IRDqvqLlqLg4+xw/VQzNHLM8bTuPT?=
 =?us-ascii?Q?LPy8lW4vnvtXYh9LiWtKDaOmMwYpzCn1SEbf4Wb+LqfUKQ261JspCXlaUkSi?=
 =?us-ascii?Q?Wv8DNBbvvKO9Qn/FZ6ClHzGCthfK4OOHB13HRotEmFVmQBM2TbivlTcNnIuV?=
 =?us-ascii?Q?nmuaiiOtlJniM556/0y1+JueDxbyc/VeziqZ/1WFWI8sS/n7s0JDz9VqsNUQ?=
 =?us-ascii?Q?lF7rb9yG7kdEx05+Vtq4KbfwCIx9YR+xFWDfei/FJO+YZE77jiKCYy3P9/4O?=
 =?us-ascii?Q?jTGHZFBloLBGIdtzIVgNI4nI8FhF2a6+6tB7XqsYXU1vqfU88jm71ZNFBwTo?=
 =?us-ascii?Q?uJJsDqTwSHyXSY10QzwKZ0T+MAy2Iya0qYNCjSKCy1BXQ6fMyjTs/cXnEwEP?=
 =?us-ascii?Q?wLbRwHPqChTyYr9uX6UUEvqGHyO4aB6HiFSMI78THrfBtrXgIZIUUbbAW/MB?=
 =?us-ascii?Q?HlLSSxrql0G9YcdA26yPGK3ZcKVUaIRnpd9GtZ+2TqhEzZ7eY/AiSAyd9kPg?=
 =?us-ascii?Q?oCWwVEWjquTckbPjq8mIfuk7ywcL9rGDbzJuuZxL1FPdNuBvxnawoLra2Qpw?=
 =?us-ascii?Q?CNi6XH0aOOdE4E2UyfYky/XfmO8vklFbGgX+H1Z2VQWbTLPKLJq6BWxluJR/?=
 =?us-ascii?Q?StBLaly9AP60kmtAdhLeNdmGAMOloes0mzWbqI2P2muvm8PIN3Vs0WbRRkai?=
 =?us-ascii?Q?1Ke+RlS+9TlYokVQcrJ7gmei/qdf+zMb1yO9wY4Q28hCAC1h7sgqoaQh2I26?=
 =?us-ascii?Q?7uuJlTpHlgTgCMkeQ57lNoU7oRd7dXCb4dEbJ4lq8aLElUaySVzhhtEpj4qF?=
 =?us-ascii?Q?qgToZdS4W97bJszM4xfgunCclc1XXalnJ5lRJFhk+rafUk5kTvFz1uSWb5Jo?=
 =?us-ascii?Q?HMYHPU4vTlhh4CK2OYbQHMPRe1TJGpVfDNGrMV0LcoH3YAScQh2F0qCitCBO?=
 =?us-ascii?Q?IHZ9GSNBEJ/+5Olrew4GReuYfPGFC1zNYVvFJJ6ci3jhZWoj5p1KO3LWqqKz?=
 =?us-ascii?Q?X9eJ+4p+Z8Gg+M+DiYrDacASgMFUFlu6J74X2IJPsHuT940kKrtphK4T48MB?=
 =?us-ascii?Q?9DeLT1i5R+FRkgdk8A66F1Ri8hCH+KK1hBjPQBvEfI64r9IYP2KKbgfu5NuS?=
 =?us-ascii?Q?eznpWWmSm8yaL/zUmXOdOpFNcuDKQZVWrq5CdhRbPxpy3/NXekT6TTLdrdiJ?=
 =?us-ascii?Q?NR68vVy4AHFbggifQwgA9Y3RXo6xXUPrv96dq3szhHUSexQnAB3k2Oqn7ORj?=
 =?us-ascii?Q?yJXcS6dW1bPgN+N8bHplxsjT?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abedfc8-4dd8-49d1-cbf3-08d98d60b7d7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:14:39.3183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3U/rzKQfgI+Xw7DDGGxQ/8IeO0n200erlQkOjOLcGj3BllijCnLgGeRNXjZjBuuG1iP8H79NtEHkbk57mVvrlunByoRdqpv0z22OlYz7Mtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8167
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

Here comes v4. Changes compared to v3:
- fixed of by one error in the tmp421_probe_child_from_dt
- fixed errors in binding description
  - there are maximum 3 remote sensors
  - the n-factor range is -128..127
- changed "input@X" nodes into "channel@X" in DT
- changed "n-factor" property into "ti,n-factor" in DT

Changes compared to v2:
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


Krzysztof Adamski (10):
  dt-bindings: hwmon: add missing tmp421 binding
  hwmon: (tmp421) introduce a channel struct
  hwmon: (tmp421) add support for defining labels from DT
  hwmon: (tmp421) support disabling channels from DT
  hwmon: (tmp421) support specifying n-factor via DT
  hwmon: (tmp421) really disable channels
  hwmon: (tmp421) support HWMON_T_ENABLE
  hwmon: (tmp421) update documentation
  hwmon: (tmp421) ignore non-channel related DT nodes
  dt-bindings: hwmon: allow specifying channels for tmp421

 .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 110 ++++++++++++
 Documentation/hwmon/tmp421.rst                |  10 ++
 drivers/hwmon/tmp421.c                        | 168 ++++++++++++++++--
 3 files changed, 278 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml

-- 
2.31.1

