Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F7DC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:10:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36DAD60EDF
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:10:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhJNNM1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Oct 2021 09:12:27 -0400
Received: from mail-eopbgr80105.outbound.protection.outlook.com ([40.107.8.105]:1349
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230049AbhJNNM0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Oct 2021 09:12:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Li4faiW6VC71igq9hW3p20ow+c/HGtYWDrivAZsiNYiyi8mkAFMAq4/niIUhG6U8lEAvZiheDOFTyq1V0trEF8ZyZkTbxd5uAVvTLLxFR412OS4SMpClqEkXcpm8UoryRRzO76Gc6+8DZAamyHfPQObzjyaBSTjvP3EZ/5UKhCRIJonaFpnOMxSGuZNg02Vwc2wIgTqhv3btU5mJhfUyfFFHxSUakm/DxjOHGMoGQlYp8A/EAPFrUiu6GNwj36E5p6brvAi5wBCOuC97hbkpBF42rAhSqs3d6bnv8bNHf8Rjn8Dv9duEYIf/9nfjJ7PqZOCFyymhZYrfmEZeeJIC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqhMO8SYni2T+kQRvYHQ8NkPp0I+ix6v3luDqt9+XXA=;
 b=K6rf+Je8+ZYpqyRMpQAq9YSx6lC4/SQd2i5Wu9tZZk3oT3h1ngCGGPuWu9TGa5pzhJTeIF80yzRvofeNHTsAoQZy/uIqkjgkbQFE8d1djipY81b18qhS3/WBYMUDeVe3pmqZec0dPyNPHNceYgvzVXh73IXf/ITZrFQsdXj2yika5zCmMzVCUhyojhUZiZxwWLMUYTRjSwxzyVEXJ97BS3k4DBEvbd6PJ6L1R1fw03VzQu8KdCfYp4lOMI7s6Yv1R2eICQG7nZp/EpOw4bM5lgAB096dezM+rq/SOWoCRQVJCeEYLgsFGimA0gNVAa9WVx7DB3D/XL/0mdGtvF5sKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqhMO8SYni2T+kQRvYHQ8NkPp0I+ix6v3luDqt9+XXA=;
 b=r+bYNQ8z5ydIkXtKsFOdNBKlNMpRgoBlZDRnjZ4pLGgVs694DVOdP4r2Yev2e8Ovkk12huX6Na5rRObciio1vVoFYAcZWfTSacRVJplwUvJy3mF7j8bShVw9NDw+0sA1tpMR4/sChxA5MEOHwZgSkWcD6MFsSrIbp/778OGxbFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8154.eurprd07.prod.outlook.com (2603:10a6:20b:375::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.8; Thu, 14 Oct
 2021 13:10:18 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Thu, 14 Oct 2021
 13:10:18 +0000
Date:   Thu, 14 Oct 2021 15:09:58 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 6/9] hwmon: (tmp421) support HWMON_T_ENABLE
Message-ID: <a64c22e7323bd5a083f37aaaca91a745ac1beef3.1634206677.git.krzysztof.adamski@nokia.com>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cover.1634206677.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: HE1PR06CA0149.eurprd06.prod.outlook.com
 (2603:10a6:7:16::36) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from wrlinb104.emea.nsn-net.net (131.228.32.176) by HE1PR06CA0149.eurprd06.prod.outlook.com (2603:10a6:7:16::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend Transport; Thu, 14 Oct 2021 13:10:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3144731b-8837-459a-ff27-08d98f13f876
X-MS-TrafficTypeDiagnostic: AS8PR07MB8154:
X-Microsoft-Antispam-PRVS: <AS8PR07MB81543F409C410F7C07669374EFB89@AS8PR07MB8154.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: InVc5/8kCVGu/uZSPaltpBwybfSB7kF3rscrO7ExfopmWFTPN8FIh+b+P1wQKkXegnX81PoyVCz3/8yX2LiokjrlHcTCFNfmwaVbG4r5V5YWkwcP9WnhsFwQxpSH00ASV4n+CrtmfN5lzhZvYO2Aw+teRYb0aMXD2pSf2Z00XZi+ZXKpvRd1/vgMyAMX1SD77rJ39XdcBUZkBUCUQT1bKMS6QdYlXWmAc5Pc0jTldPZQxO2LRgpvztZWQoMLJZD4RY4w03jKx2jx+Kd2bXB58a90JauhHJoF3Vj+tdX7Av6kGvyKPU70n5XERPpPevZfxnx/NmtZduYbTWA+5m0X6NqqdJK4HbPqNj9ZELKtepNUi41smI3GNvZRcV8BO+NCWe0TT5A2x9Tg6mrRrWZI2ldEr1Q44GPIXj8OkXnuZwRybyVib3smpet7IWSPrYPMKoP7FUfG21Fnr+UKHFWto58zPtJAswFoJVfuCgPJnKcg/YhJVgN5DG+VT7SOyluZ8FSzv03rGvV+g3GApkDw4sOiT754o1FABw+GrpZATG9bS60wVCdifDRvJuq6yT7aA7nkDa3wH5pdsVGZThodo+EyqlJJiR7/8BjafAJfIanm8a4I36Oo+2EUVOAhjbXVTRUHANF14fA7bTjtf+gcBBuGnsA3Ge958NJDf8tv5Bre+uQlMp+zRQYTtPja5/mpaVTzJtCwvTGkzrGJKIYToQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66476007)(66556008)(82960400001)(66946007)(83380400001)(44832011)(956004)(2906002)(5660300002)(2616005)(52116002)(86362001)(6512007)(186003)(38350700002)(316002)(110136005)(26005)(508600001)(36756003)(8676002)(38100700002)(8936002)(6506007)(6666004)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MdA5nc4NfqBhj+vlwlmbn/yyFG7X5mLGlV+yC0cJvLWw87CamfL8bNUGmUd4?=
 =?us-ascii?Q?lhlRcU1WPuJ9vOi80mbAgSCG1dEFsJw8Nd6cCnTME75XorEGyDIeiGTp88C4?=
 =?us-ascii?Q?SQBKKtboNChIj+a1i6n/hN3PEKbh9S7h+sR0mbk1rNEG1VuibrTL0CwICo4b?=
 =?us-ascii?Q?N5mg6qT5XFJtr3DqYi5xJ1n542UXcBWmmK3tzACIOs7ItvNoDuFmLknP9sbI?=
 =?us-ascii?Q?4nerDDUZEJv3U84ze13z0mIviGmzhOYWCNGQs9XuHyqV3HeFiVSToPee3BoV?=
 =?us-ascii?Q?CrfwajqTZ6BDlooWRibCxvQJGqzFAGvQs0Bte8FtFickrivZtfA8k33lIYIB?=
 =?us-ascii?Q?vcJX0oZoy91WlpK8M+HzCzHj6PEYVcdDrObApkVSc6q/8LprH1zz1W3aYgNR?=
 =?us-ascii?Q?iCcf/wKACf6vI1rQJAtCKkPQZn+tk3x9mANzatjqSgUHvVvfrNPcZZhfiTdk?=
 =?us-ascii?Q?H7qEbDOluHCcIKLRdzApAbZ1W/hlJzQLjLThRs2r4j8qmECDHG7AN7lQJ/A2?=
 =?us-ascii?Q?dTT4U8Po38Dgnc5g+ChOprAFSyWO2iqYVHjOazLEOGQ/9AKmd6Y2AI0Tu6kX?=
 =?us-ascii?Q?kIYNwLMHZbvrQj+4wJG39sqtxGLUvpGTMAb7VTkIITBqYcby0WWiQy+HwMMJ?=
 =?us-ascii?Q?nSkU8Cc1JG/gjvVJsUCbJ/O48NTdYDRwnKwDV+/NUuoHOz9YANyH1WHLJ349?=
 =?us-ascii?Q?yGuTLIcvWB+X++5W7qG0846/EaHzt62YcKbr6YIKMIKs/WBb15D6h2KY9Pzr?=
 =?us-ascii?Q?49mfOSZIqY/3BHGfTcnEIT4tq55ZWJCegwewtdOp/r1JlxgedblNCexcAgVg?=
 =?us-ascii?Q?05VKezAAflLUBxaZl/4Er58nT/+gIyM4DVmQdiPJ+WT8VKMGhEmioycQzSGl?=
 =?us-ascii?Q?QQzMErFjowwdGhXLQZTEBcCRJ2cfrhHNNjwbZ0/wjpRN8t35iqnKOGmRoU31?=
 =?us-ascii?Q?kX0PrF/a0/977HiXsMBZW6dT2HOWUTTCWRO8HKkei9VfAPQ6SahBsGXgjNZf?=
 =?us-ascii?Q?LjOcqe9fZMMdk1R672fU79XANtm+eNuDuklxXMxP4fLFm4N7TauHwfX95erN?=
 =?us-ascii?Q?6ARqnAvec6sw/+h2YYbxnsFY7O6ggpcdVyDW2fH06ib3HJwDBJW4TS/Bep7R?=
 =?us-ascii?Q?AenLx8yQTRl5CF6GiXGuwWmtrHb0DH6sX4vnzruw6okvPSEbBbtGtLBXxhzw?=
 =?us-ascii?Q?4is3Qp/6PtUu0m34kJeRB3P8PpmP82Nkn6fytgOK3srSqhFGxTV/C7VqgmEn?=
 =?us-ascii?Q?0fBstuhiJI/WDmWmIdn5/fUq+gmxYxm34/kSbhBPY7MOdA3vtpWkqIgMNJAD?=
 =?us-ascii?Q?QP47cKgZnUXfS6CDXczir/ILwHHZdRt1JjTsxfk6wUM11XXtjhUph63U8qRu?=
 =?us-ascii?Q?GCd2Fs3187W8FJLfMWxdHn2yHqfBEtYBMZwxbbWktGeflbbPAEjsMp3ikU4T?=
 =?us-ascii?Q?/PVuNfuQeMbg0xNy6wM/jP43ZL4yqW4oSAElutlooCFRP1Tfk3OfR41qU36F?=
 =?us-ascii?Q?Qfbf7zKoJcTzt8rDFi3yd/X9ZHlsfI7MeT1Tzo9it1qHjLqeINWjxlNeAVql?=
 =?us-ascii?Q?SvvMpjfXniS8wTVrytm+bkMkqhIpP+UUpJixnGwpIP9w7usNKg9F0b4qFRCa?=
 =?us-ascii?Q?kPDtXfMOY8eZ5tP1hmzL2DNF7cY6F2sS9tqlquD2LtaAQsaSu5Ux1yUeQey4?=
 =?us-ascii?Q?z8t1tQ=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3144731b-8837-459a-ff27-08d98f13f876
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 13:10:18.6180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TK8x7Hrk+PzBLcHORnqA358+xW4rl2pqFOTyoyGCC0eB4P+IZ85a2iEfEfvUUQTZ1biq+rAKq5fSUsbjiPVyFv80+crqJThGBfFD6uNCgE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8154
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Since the recent patches added possibility of disabling sensor channels
via DT, it only make sense to allow controlling that from userspace via
HWMON_T_ENABLE mechanism. This patches adds support for that.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
  drivers/hwmon/tmp421.c | 33 +++++++++++++++++++++++++++++----
  1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index b402e81ae5d5..2e20c558fcb0 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -203,21 +203,25 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
  	if (ret)
  		return ret;
  
-	if (!tmp421->channel[channel].enabled)
-		return -ENODATA;
-
  	switch (attr) {
  	case hwmon_temp_input:
+		if (!tmp421->channel[channel].enabled)
+			return -ENODATA;
  		*val = temp_from_raw(tmp421->channel[channel].temp,
  				     tmp421->config & TMP421_CONFIG_RANGE);
  		return 0;
  	case hwmon_temp_fault:
+		if (!tmp421->channel[channel].enabled)
+			return -ENODATA;
  		/*
  		 * Any of OPEN or /PVLD bits indicate a hardware mulfunction
  		 * and the conversion result may be incorrect
  		 */
  		*val = !!(tmp421->channel[channel].temp & 0x03);
  		return 0;
+	case hwmon_temp_enable:
+		*val = tmp421->channel[channel].enabled;
+		return 0;
  	default:
  		return -EOPNOTSUPP;
  	}
@@ -234,6 +238,24 @@ static int tmp421_read_string(struct device *dev, enum hwmon_sensor_types type,
  	return 0;
  }
  
+static int tmp421_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	struct tmp421_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_enable:
+		data->channel[channel].enabled = val;
+		ret = tmp421_enable_channels(data);
+		break;
+	default:
+	    ret = -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
  static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
  				 u32 attr, int channel)
  {
@@ -243,6 +265,8 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
  		return 0444;
  	case hwmon_temp_label:
  		return 0444;
+	case hwmon_temp_enable:
+		return 0644;
  	default:
  		return 0;
  	}
@@ -402,6 +426,7 @@ static const struct hwmon_ops tmp421_ops = {
  	.is_visible = tmp421_is_visible,
  	.read = tmp421_read,
  	.read_string = tmp421_read_string,
+	.write = tmp421_write,
  };
  
  static int tmp421_probe(struct i2c_client *client)
@@ -424,7 +449,7 @@ static int tmp421_probe(struct i2c_client *client)
  	data->client = client;
  
  	for (i = 0; i < data->channels; i++) {
-		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
+		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_ENABLE;
  		data->channel[i].enabled = true;
  	}
  
-- 
2.31.1

