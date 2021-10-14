Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15C7C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:00:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B375A610CC
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:00:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhJNNCV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Oct 2021 09:02:21 -0400
Received: from mail-db8eur05on2137.outbound.protection.outlook.com ([40.107.20.137]:1793
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230373AbhJNNCV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Oct 2021 09:02:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HysTx+v2E4Bsh6jMTMTpF8q7rBfCJQucpLrYV1PFrg2EjtXObrh+bwo/wR+WprkcF7qc11YW5c7ZQmCIrgSxw834Ms2DM8ECJ3jNhngEdUKRlEbDeewoMqjqazLjFMacJixLVGAxVnEA+in2MVaxVmBdhvbTKfCYYrvZo3e4xNH7Xg1JDeJjCP1l7RNjkagJHJUMeVKN8xt1Y8NvkXRAVUmmMKGPBdzp1abCtu4WSOZqAQOZQRef4R+jSjKNRRplFfpo2WToinBuzmmFbgZktpJFA8R4Ipjrm2aWJoHXk6bDQmD+GCoh+hc2a+mk8TnoCAT6rbiSgN12MH25fZchQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziP1x5mz7TAVlWUrWoZNeuWkeuFXZuoFocyfvVWcSNM=;
 b=XQL6hT2OId9LK4zGKQ1WB/M8BFd5SXzA24qJP836nxi8tLGOosGNqK9lJjHcvqSESRGrxrM+YpM0wTBvi3pPmBgWJ3IWhOv6mk/uV0k4boOpYum8C8ABWopLqTPoA0ia84pV7f9JK+D0ImFBejy4Br4gdd+RON8XZ+x1yM5Pkn0ZwvnUOSw794Z6DSePLqeDEouGjJUya7xuYQ68y0D/yARNYrTZyU0jd9O7iAbmsvUf6RnyOHsVRUYbm5EhRkBLcGiJfPLvUTUAaEFPFW3pfhEfBU8ROBEx8C6pXcwgDYNY3FG2Z5kCVebDy4ZlykDn8mZUsEqUnva0ZT/hxpV1Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziP1x5mz7TAVlWUrWoZNeuWkeuFXZuoFocyfvVWcSNM=;
 b=sW/27GE7uok0cCCzO97Qzce4nydJjoKFjuSQOERA8se/ybdHSfSEBhI0rBajLiu8bkVEnaeTIDWkUtKsZi2g+0NESD6DPfgqRL94IxLrBqHXQZGQfp54LRzUUkLz8RcQ8qBPvm5gR1xsVaQbIsCPMVgEXhfuR08H2wvE7B+naRY=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8072.eurprd07.prod.outlook.com (2603:10a6:20b:35b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.16; Thu, 14 Oct
 2021 13:00:10 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Thu, 14 Oct 2021
 13:00:10 +0000
Date:   Thu, 14 Oct 2021 15:00:03 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 0/9] Add per channel properies support in tmp421
Message-ID: <cover.1634206677.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: HE1PR0402CA0008.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::18) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from wrlinb104.emea.nsn-net.net (131.228.32.176) by HE1PR0402CA0008.eurprd04.prod.outlook.com (2603:10a6:3:d0::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 13:00:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eb6f6a9-cd78-457c-c1a9-08d98f128dd5
X-MS-TrafficTypeDiagnostic: AS8PR07MB8072:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8072FAA80082636115601B7BEFB89@AS8PR07MB8072.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DgvXwiiIfXeZI/cQLINme0JBOFUVigsVFNhmktmEa2hQTRd6C3EDbSRoYsq3FVVkyBskZVlh9ETtNnIcMWtowb5qZ1M3ILTvfTKcRY/4bqs15eAerwN7XHC36M99wM+G30nPDTHfhXbNT7cs7t0zBzaYG1LvTP+1Q1c/XR6HnIazQFfcr9h1LdSSP5gn4kzWTkbPnhoY6UOzshCk3kriFk0BrGU0QRV9NHylEnO3PcOuv76sZgGqDkdshMBlZtnaOIdDPOr0+p9uf4Pc+OxgHuQ/AjNoFE7VCKBMt5+R8ZiAKw8GpJ4e/lMJ3OT2V/G4XRVAuWvLB1/E0Ss9Xyb2nv6JJEDEtT7MZZ393GgaT9lYcJaOfPPTGRLn35osEDO8ED0hBmw9hN/8wzuLi3SuFDFshfsrptTYxTvhz4Fn6gyHvWVlSsbslcGgZ9eKW0r4DjY5BBg2dudt4C6RT3SH//k1FCxrj33eqpDfkHK1sWdjEoDd0O8n3sBKJobri6lp4VuflyD1THJyCHeKSmqaV7LqlAzfSo69PIwVge6rIZNBlLlD9DKmAQ0tMnui7TyJp5jWU8Q+wXgnrUOC/45bV7MlDTsLnW48LN75InUitTjA2bqQOk8OWpqqcZcErZniXCiyusrKj4+P7pICY1EWv5QBJgc5vxj/qx4L4jdigJZExu/SGV3Hg0Ax2Yr3ZHTEN5ruE2GfR+opzd0oz2eDeBuhQ5STKPWPFIqsOdqQ5SlZyeyF6wJTYXeakNgq0tc//Labn87XVNvwrSbYAAXCXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(66476007)(316002)(6666004)(4326008)(110136005)(8676002)(44832011)(6486002)(186003)(5660300002)(66946007)(6512007)(956004)(2616005)(66556008)(38350700002)(52116002)(86362001)(83380400001)(966005)(8936002)(508600001)(26005)(2906002)(82960400001)(6506007)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ESSOVxh63lnC9YtoMbOdy3VoTkdjJ7xNWujR6CNN9QLoJWraDgVHTBvYve7f?=
 =?us-ascii?Q?mNZQB7XJodya9Wadh16s608oI1Tz6vCIk7sgiAQqKZs9cZUTWYjKEO4n/X8T?=
 =?us-ascii?Q?P8kj/7DxYZ5gzsPR/Pcc6W/trEdYkeWBZ3b64pTntqMtTEKvtOWQ6X23GVz4?=
 =?us-ascii?Q?RLET1+jSh0f2B4ALWJ+RheIGgXsC2d/hTmS9s8J7sMGJviXxE7amBPYAXrJa?=
 =?us-ascii?Q?jZWv3PoUxIWGKINY5DdbyaPVkEvgwYMDjtr/gx9DBGNGU9UStrx9fvkTncXx?=
 =?us-ascii?Q?KvfB2XKYe00n7AVXwEjy0oG/SRpc25dkg1BN6msfCysP+fKQTNEosiR1U6/7?=
 =?us-ascii?Q?+xUNxhXcVnSPW+sRJ1RHguUxVCmat1GO7nLCyG9knEml02SBlH+bzNLOFiey?=
 =?us-ascii?Q?PdcuRbRoRHLV6+0j6UEhC+H+DDkGZObfWtvqvdjhqQ7BtjAOwSj2/W9WGg0t?=
 =?us-ascii?Q?zE+sBLpArPFs/YCT7CFpzNlDXl5Ad3t6P4GzAVC2yjZ7R6gfRyT3W02XL3FR?=
 =?us-ascii?Q?Zwwxo5ULunQuhdA0EdRcggXvOfGu5yKTlxQQhnRhYfnhmwRTZrRvgTuivOrs?=
 =?us-ascii?Q?EVpa97JyW9m9BzP10BJbPgNWeBLaBrjF1Ru+tRqfCd2xCMOwCqH0CqGpCekq?=
 =?us-ascii?Q?uBPYNhci1azXqL/Pxvdteut9YGk2J3I++L/Lg3lNC82/SVGwis5xV5TAvytR?=
 =?us-ascii?Q?/lM5lcXRNf/HKMfuteb8IN2VWoC2yRcmm2PWKUIrRY61cwdFKhvLZQyys8tB?=
 =?us-ascii?Q?K/ABLUku4dAas2L7QdM2TYM8+vsvt94Li4UMQXT/hyi0Xq3Rr18xMqNkm1U/?=
 =?us-ascii?Q?hWToL87/xWZNUcQ1Lg4llDEC4KlWtfEN1e4Gjupy10hoNKqg72Rcmu2caL5y?=
 =?us-ascii?Q?tAxb4s/J+qRD4iGg5laQKSISA3gRObBssT9jDXR+nULEu47tpPKokXL0Rz+9?=
 =?us-ascii?Q?VBzC/72zHEe3/CN+abldKjnicm/m488NHmFpeXOiPUXIxge1KDbQPI1s8VCW?=
 =?us-ascii?Q?Z+Qg62KQy1rIgEeAD7gaChaNmNeLoaJYCugYk4on2aRZyE5iraOHEo7/f3Ac?=
 =?us-ascii?Q?U0V5uysYeKiVl2DP0KlmFGypHNGCmecKhiIHSoygfaBkk5aWFd5lHc6QVcu7?=
 =?us-ascii?Q?GE3UnesctUW4/npxUvvE9l/yLjlkL0eyZeIdxLWlOs5Mfa+KCXI5MPAMUVUf?=
 =?us-ascii?Q?w0jY7ZJ0qNw2GtOAMlo+9onV0JNPEGGmY9A2ftJCAtLdzcg2MBwQzDMFXcjq?=
 =?us-ascii?Q?OVQenDnvXqCV/XB97WVauibKYqobnVNe4a/mjMxuC7b/1m4Ig9SP42ju1Zwl?=
 =?us-ascii?Q?IYaIzx+2i0iQc/xWyQgzjSSR?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb6f6a9-cd78-457c-c1a9-08d98f128dd5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 13:00:10.2500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9EfCxlPvRTUUpkBrc2AVMvQZuJPsUYA98+654B9j+vZTvhPh31FGcpjmaKURH7PdR3jeon5uFYWgP1U49/JxmoB7S24YoUnPuuytf7el90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8072
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

Here comes v5. Changes compared to v4:

- Use data->channels instead of MAX_CHANNELS to protect from specifying configuration for non-existing channels
- Return an error (instead of silently ignoring that) if n-factor is specified for internal channel
- Dropped some unneeded empty lines in tmp421_read
- Check attr, not type, in tmp421_write
- Fixed variable used for early return from tmp421_enable_channels
- Only update TMP421_CONFIG_REG_2 if it was changed

Changes compared to v3:
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



Krzysztof Adamski (9):
   dt-bindings: hwmon: add missing tmp421 binding
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
  drivers/hwmon/tmp421.c                        | 157 +++++++++++++++++-
  3 files changed, 272 insertions(+), 5 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml

-- 
2.31.1

