Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306E0C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:01:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0A36610E7
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:01:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbhJNNDp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Oct 2021 09:03:45 -0400
Received: from mail-eopbgr150119.outbound.protection.outlook.com ([40.107.15.119]:29412
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230307AbhJNNDp (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Oct 2021 09:03:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp00YkEXEdaCitVWK+HVUeXCgQAl54tHWDn1VLj6Wy3kCGO6SeFAoTwrw+nXA73SO3dyMhHdxMnNLzgbP6nMo3gPNw4AJinkU0+HRCohCQdalcRoZjAniv1apgh1POVte11xVwYqxN1BX7uL0x0yzLTAEJ7dQXXAWqGDJktQ3T94T7XKwU4u+pykAD2cvWSyJRgTPd0/GfiYzf/146Ksh0HpQ4/D5Y7FJe0qJbFpln8+cOhfTHGzb0UGpl7htDWmXVg+vUQcw0dh6lgZ0NYkWG50egrH0uw7BpDtxqucspSozch2RYZvqoxpW3ocPnYgMiRbYZLU2xTtZiSPIFfiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIYrIf+W+tvjdfDmlyOf7ACqK9HAcH3VqCvgvd3CNjc=;
 b=f+aoKpOyPBJfY7QOY4M5nJKvie9SawfAlJlyZXF0H2sCoiCxNywnTSHjLyNidBD7KV+1zaHJVpCwMohLNcUJit0xy92IbN2y+BsGIv1stTX4gIS9BZ8Sj3uJwTRxblokCrjKqMbKEErIw04/IUzEKON16Z7gWDMazZmrUTnXNnKGjqQNSZ34H0XWwy06YE1ah/VNzHSsS8gxOSNOsYPtlie2SaPJHkXZYsJdmQeHGnwCduWyotTlD2GK/UdryTv1ewHjlXkWSdehTC7+2Yxqm9Rv72wyJeX4vKpZHDGyIH/FP0H9kQl54RKAU8U8AQEvlb8ZkK+/XabJCjsjNIFFSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIYrIf+W+tvjdfDmlyOf7ACqK9HAcH3VqCvgvd3CNjc=;
 b=d+yXlbP598wNo1dnn5PiXGzVTbo2YRDcHJwqWWOjmDxgEC+ps9dSODlyoQSP1oaaeQ4UV2iG3heHb2zEhc3rocjP4bYif9hbcmUAC8b/N+c2bg+TE9C4ypf/IdEc3CTWxKUd+eE8Ia6iqhYeYLSggUt5eev6qEYyBoJmXVsSHBw=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8167.eurprd07.prod.outlook.com (2603:10a6:20b:376::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.5; Thu, 14 Oct
 2021 13:01:36 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Thu, 14 Oct 2021
 13:01:35 +0000
Date:   Thu, 14 Oct 2021 15:01:28 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 4/9] hwmon: (tmp421) support specifying n-factor via DT
Message-ID: <69d0bfcc5ba27c67f21d3eabfb100656a14c75b9.1634206677.git.krzysztof.adamski@nokia.com>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cover.1634206677.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: HE1PR0102CA0054.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::31) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from wrlinb104.emea.nsn-net.net (131.228.32.176) by HE1PR0102CA0054.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend Transport; Thu, 14 Oct 2021 13:01:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71c796c5-6b85-40c6-45e2-08d98f12c0e5
X-MS-TrafficTypeDiagnostic: AS8PR07MB8167:
X-Microsoft-Antispam-PRVS: <AS8PR07MB81674320F634C885D8D0FB13EFB89@AS8PR07MB8167.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +FPGg3iiTsVi/oUOisFZDffF/wv1gN5UCpuOYHLV21oxlvZXnemPN9jkn545LCWVa0/WQLaTBX6OuIhBIA7+0iP20xz8len8ChIARhW/IJAychHOXXwvB03B0KAK5bdcPadDO6SI/FY0URlxBE7kRvtOPLALoeYq5x26kIp1NfMkAKFZepYRyaYdUmCB07wDKU9ONB5u+AO8ZEVGmvu5MEvWVtRv1AdPmTvWNwZOfPyqYBj9g/bv7r2s1q5RTN46zuGGBjCI951xiv9XaGw3x+27U+P48TeSJqm7iTuy19zF1CqRogTUfJ9YrD7mK0nAJlL9/aPSdDMWXk180TtczjGFdxi/oy9ZaQcE0jQW/OeBmxu6J5Co9KPTJuUd+yZte64I0KhqW/7IjGE6K6jdrDTeWCPw2kpwUsjHV8duT6kJ8vK1WTfZRsiEhiAl1gkMKI6a9ysM/dt3q3Dajkh0r3wJxIa0WlsFJxUc6wwStGXnRUgTL3zG583CZ7zBgGbZw+JTxOkD7XqItdeBruwxPnYseJsADx123xY2Fl2/fLxzj8ubGRxmRM8r7ARyKx7nWrloORydKzSimoyM6YaqS6JHi1Q0+Pv6qAOblNfi+rFZCOVEHCTmO549lJEi+VIFAwxKt+yET8Dz5PMi3MhPS1OlRv8dTBPj5N94V87A0VYkn0vqxTRc31QFedo5qX8vS00Xv3RlBI7C8K58z4Jh8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(6486002)(36756003)(8676002)(956004)(38350700002)(2616005)(6666004)(2906002)(186003)(4326008)(86362001)(508600001)(38100700002)(6506007)(82960400001)(6512007)(66476007)(66946007)(66556008)(5660300002)(8936002)(110136005)(316002)(26005)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MTGB2y4x7q7wqkaNLqymJu5Uxn6WLbiU+piCcDrqRu58W7vrkd/wQPEA/6D+?=
 =?us-ascii?Q?l0142Nl4k+UFudu9NBFT/NSCbo3LC2P+9Sz30HA0n/wa9L81Xpkzb7xy/k6T?=
 =?us-ascii?Q?2vVS/dcAQDeVfaG+e5UJF53GY/gyrojVdFgUKwkzZkvu/61n/FDhNC6XV2F7?=
 =?us-ascii?Q?BySlbICXYYCP/YCe2oO9AqYUox1J69hzuuGx3IGDf+hrlzBtB942IUE7wfrb?=
 =?us-ascii?Q?a2013jilckm/Sr/TGY8NX5gcfJ6QbAkpMZTGqF5bUgmiYOy1tB+0XGiwjbTt?=
 =?us-ascii?Q?TXDvEiuKqlMjO4ULd2nFQqznTB5HWWJzVPYfe5hCOjv2pv3IozcnHxx0CkSj?=
 =?us-ascii?Q?bK5jiwM3mIzWFqGxCC78H/fM8LbqrOUzrP8kJp2h01ZyxwJdQ47ldToDtc6+?=
 =?us-ascii?Q?nxHqeRXcBDkIp43wBKbTbQ+EdjoHFlKMfQfH/fv3OAQ2cKIXKQ+PlyemLdlF?=
 =?us-ascii?Q?14jHCvKHl4l1syKiUcg/+yoT8LGnGzhoo8xmZDHrVn/x4Ib8VUIcnJYeqLB/?=
 =?us-ascii?Q?7/sarbYW4TLOH+fdKAON2k1WvAetHaAgg4HpZd1X7Qflf5dOGCsAEwnR2386?=
 =?us-ascii?Q?IOmufiUIh1NigG3wTkiSfLvlUqKWJZJJTB8Bt55Xj6LESa8ygtZCvLqptG8W?=
 =?us-ascii?Q?DhRU7rSoY7cHMMypAWWBKZUDhiCOykNxSqsQlE8BNODvR54q/pvkxSIWl7yl?=
 =?us-ascii?Q?ERjAXz8pNoHYNShLlxchU3ONEWz4EyFP3kJqs1/8Ai1Gw87fRnLHLrmFpQ5e?=
 =?us-ascii?Q?62wIQQqt6kAcIphU2x8pQoTDwSDUyyJz1aPWkQBvW/JvE7ZAa9LDAiROh3zl?=
 =?us-ascii?Q?f2bHD9qgETFGKSM0+ysoe+RQlSABoHulwgkP4oI7jOQY+r1iBdTdaDjTw/t1?=
 =?us-ascii?Q?MheeBAHUiwJO1UsP3ynSQ68Z50RTuez/5zLBCTqpgooj4sV1Ft2Ui41sLVt0?=
 =?us-ascii?Q?yCnPnuDspKTvpRj8Lhx5gw12Y8wc9rMank7GIbtk7i3RGJ968PMXuxCL2jMJ?=
 =?us-ascii?Q?VtCneP9pQUjoUHW7cdPDo1lP27ffYzceZqcWhjzv/atSN4bw9R6lsjBSGv8i?=
 =?us-ascii?Q?bROUHHTBMo5ob4KzlgC6E8wwLPx9FmeEXfMUGnINm6aq0a9gYRvibW+tUlMo?=
 =?us-ascii?Q?Jvh56kgMeewLqSrERpFA1z7W0riHQg40i1dQ7R5TqvWMk9PyDJpQAcJVMKI/?=
 =?us-ascii?Q?mLtDH0XI00zS9sP29gPpwcAQEypWKHgADOn9vu/KjM5NvDerdXS63t6z6uO3?=
 =?us-ascii?Q?PVJI/HwGLlr57vLmjudFLUo7GJX8bQ2LPY2t8YIuv375MmEROfFrECnRbpO1?=
 =?us-ascii?Q?e/x85kf8zvV3siKtejo9+IVi?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c796c5-6b85-40c6-45e2-08d98f12c0e5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 13:01:35.8976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvI91kGdYLW37+3SnUBVJFIvh+O3wAf8nsZpPsXWoTNbtHeu+q0ew5NsaageWqkCXXhRv3qwaCiNTx7n+mDQ9NqqB4Jele5BOHa63uwYBFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8167
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Previous patches added a way to specify some channel specific parameters
in DT and n-factor is definitely one of them. This calibration mechanism
is board specific as its value depends on the diodes/transistors being
connected to the sensor and thus the DT seems like a right fit for that
information. It is very similar to the value of shunt resistor that some
drivers allows specifying in DT.

This patch adds a possibility to set n-factor for each channel via
"n-factor" DT property in each channel subnode.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
  drivers/hwmon/tmp421.c | 18 ++++++++++++++++++
  1 file changed, 18 insertions(+)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index af08bc985a13..606914f20910 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -34,6 +34,7 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
  #define TMP421_STATUS_REG			0x08
  #define TMP421_CONFIG_REG_1			0x09
  #define TMP421_CONVERSION_RATE_REG		0x0B
+#define TMP421_N_FACTOR_REG_1			0x21
  #define TMP421_MANUFACTURER_ID_REG		0xFE
  #define TMP421_DEVICE_ID_REG			0xFF
  
@@ -310,6 +311,7 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
  {
  	struct device *dev = &client->dev;
  	u32 i;
+	s32 val;
  	int err;
  
  	err = of_property_read_u32(child, "reg", &i);
@@ -329,6 +331,22 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
  
  	data->channel[i].enabled = of_device_is_available(child);
  
+	err = of_property_read_s32(child, "ti,n-factor", &val);
+	if (!err) {
+		if (i == 0) {
+			dev_err(dev, "n-factor can't be set for internal channel\n");
+			return -EINVAL;
+		}
+
+		if (val > 127 || val < -128) {
+			dev_err(dev, "n-factor for channel %d invalid (%d)\n",
+				i, val);
+			return -EINVAL;
+		}
+		i2c_smbus_write_byte_data(client, TMP421_N_FACTOR_REG_1 + i - 1,
+						  val);
+	}
+
  	return 0;
  }
  
-- 
2.31.1

