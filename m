Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278DBC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:30:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08A706054F
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235581AbhJLJcE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 05:32:04 -0400
Received: from mail-vi1eur05on2096.outbound.protection.outlook.com ([40.107.21.96]:39072
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232657AbhJLJcE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 05:32:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+MvXwGJsWBs8fWUxoA0SJ9haby3eeBTjGTecd1gi/XEXM6PtNgydQNwMU8Sap6y9xcFyDcqWW42HRiOiu15tYb52s/oozsY1/Dw2kMP5rp1pnqzs3SERFPirgZkIupirHspz6gpYeLh2WD0a1FmVHINcGDyhdqFQVfdhwGW0HibsLccs7CEvv1Z77+gM+vIJkBOBl4QhZED8sr7ncLY4ihvAl0pcr1SIOGqnWu99wedobiTVhBDlmzuDWskLG2RG0OC7rDBoHGGBaxMFTbgSjEkT42Lj1885gWzuDAGlgzehnkqmyZRlOAEslPRi/XRJKfmZdauN28TEhgemBRpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llCOKr6zXNjOsmMKY50TIHrNnh1CyciyrbZfgMIO1tI=;
 b=YC4ev0mWFqqGegEtLHWmQjtBFzSVDB5nTBEkEa/ZwK3sOitFc8Kv/VjG911A4Opdrdm4UERMovryQVF4xXKht9nhSQkuNqMW7R9E6NAvC8BxD9YOFP8L6L73ySvccx9easCFeAqgywnjGEDeEM6NecdGHFv9zylfapnq+gyn+BpwGdWOcvkmPwyJELV6A1UXJPxwmeziwopFOzCktJDg3CP1Lmn3uMX48AzKmmbU0N49Ym2SgmVg5FAX4/gsT20VXsDU/+4Xd0yrn9iVfXM3nYKl2Y9c5LX8UGaVNuTzWlXK7L9Z9Bqrf4YLvO1DQh6HLPC92shFJoh9WC7PngTTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llCOKr6zXNjOsmMKY50TIHrNnh1CyciyrbZfgMIO1tI=;
 b=Knws0fqjBg90KPgNzRCZAWW1gvUQvVZP741HUieR6Vi/T9imHCg9Y21RV6GYlyPdcnd70ZtfL3Eng9jInfgdrdrHSptXW7P/qFjjTXV8UNDseRX4qFb8V7eKtFQhVKUQiRe0amw3W5vEGqzHp9CR49HCip6H7cRdOyo6B2bv7tU=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8328.eurprd07.prod.outlook.com (2603:10a6:20b:443::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6; Tue, 12 Oct
 2021 09:30:00 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Tue, 12 Oct 2021
 09:30:00 +0000
Date:   Tue, 12 Oct 2021 11:29:55 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 07/10] hwmon: (tmp421) support HWMON_T_ENABLE
Message-ID: <3b8d00c549996739b2d6fb4394241916fdf0743e.1634029538.git.krzysztof.adamski@nokia.com>
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1634029538.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR0102CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::23) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.15) by HE1PR0102CA0010.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 09:29:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49397d01-4cda-488b-3dc2-08d98d62dd32
X-MS-TrafficTypeDiagnostic: AS8PR07MB8328:
X-Microsoft-Antispam-PRVS: <AS8PR07MB83284B21D5C8F57F63C7A729EFB69@AS8PR07MB8328.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LGVXauCCnPZDgY327gzzwVPT/2RBp2ZCYcb2xP0r2chrwz5O/qNp16khCZwdUZN091mMMy9QjLKQgbeziESqLVyv9eCZO7Dy0JiyGkk9P97cmsfzGcZbhxscD7sI9ip551gLHKc/kaTTtaBGwtA8O02dcIn4wAbwYMVCUAgr7zq+U58zOh+LgAlKbDMnznKVUlMV/sXrXLeiJr5cxWzh2mV/UpmXS4BU5GXbNfm6Lwm6eMiLOpRZoLxlA+v5bdeXCyA2ptInuwOHusyLzegTTRMQgyb/kLDfkQlTcAT71CnC74xNqtctKiMuT6LmXGz8FNL61h8dDYlkLGCnbgUH9H01zbFbGMp/jnFeI+g9J6PWJ7kW7ncJe8P7VreD1O99na+ECd8redR8t1d6oLPTcN4xTxEU8V12pwmgDIuedypEQGi7lUFy6sLvf/3DzxZ3AMMRYaTWbdi5v4ZIi4ZD4InVT67DkS/C314JEa02zhahd6dAUIOtFQjAzB5aTWeodyiaAaeeXSCj9axoYuyBr8RLG+Azx6DH2m5H4h8/v2PJcMKbxKKeMl2TITYLEBek5X94Xpb2ZUCJeUVKOqmDQhKxrlwGP1CKHSHi4BGKIehraKwdCTFNXek7+vD6+OnMsr7FwHiJwbnOZvoZqjQ6vSowTmlHjXDfY2bqTGm6LZzj8KsUxakpAQ+/sH+kY2xtmT50tzwQ/1xN/VJ9iVXCoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(38350700002)(186003)(26005)(956004)(316002)(110136005)(66556008)(83380400001)(38100700002)(6506007)(2616005)(4326008)(6486002)(6512007)(2906002)(8936002)(8676002)(44832011)(5660300002)(508600001)(52116002)(66946007)(86362001)(6666004)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wPn2TqRT5GuL7tya5iR3lsj3fuN25w80WUf/zFBsIGoOMU7UJZXG7l9LatGS?=
 =?us-ascii?Q?76PlOh+USPED9U6iUbF++Q3ac6P1RYmXZEn6r7yHCMAiCbpNVORZilGPEraH?=
 =?us-ascii?Q?nLcZsf5W32VCpnB1x5MF/iCdkDj7WbCO0MeV1oRpHrFCuSjN++EWz2hqaZ4Q?=
 =?us-ascii?Q?Tg+vQIV9E7TGRhqn6Qc/vDlJ9WjdOElaThtcnbt9eU8qMSI6itJ8aEg5G0Y2?=
 =?us-ascii?Q?IDPMpkCLCs4eEb6U/gA56d2ujKrj4RLQBTL7cujjLS9crOyJN6nbS6GECFbJ?=
 =?us-ascii?Q?t3u1AI1ZoFPXO1Wo9hc5fPtMQWxnmDOwr8+mKtql87mujrIRYWYdkjt+SHL1?=
 =?us-ascii?Q?enQTr4DEoj9Q3Jas6VLC0AxHkYkDMAp1IuQiMQcQ7Qe9Mv3UTTxlkPqwu8Ex?=
 =?us-ascii?Q?4xJEMmfxbbwO05bGNfhEHcxdpeN6SZvbEh8w84bYiIx5IA9IsIq6CQEAUkC8?=
 =?us-ascii?Q?eQFHNdzyh/l1lhmjom4hIuMUe4ZKbeJWY4bWkRKwC5Q9MSAbc5Pheiu+euBj?=
 =?us-ascii?Q?9wMbkY6xPtFKHTN5JIj5THS0Bsarn8F8jhLeiCTv2l3oxYEYJNlf5I4U8c51?=
 =?us-ascii?Q?dbVFWFY3O9258qxewI4PewizoyJoKCWDy+qIegEDpQyVvnBs1XB9+YOjXYFM?=
 =?us-ascii?Q?3A6iRYV6ssGLOuwd5vXGx16Utz7Q6tmSeMXIW9N34SzZtKf8WhnrODdD4Gh8?=
 =?us-ascii?Q?RH8v+AovVnOEcHk+Pa/MRnu0kmxOsCeXDvCdeo2QJGzeip4yrNkDUXqGQQrP?=
 =?us-ascii?Q?73JNLUITTV6V63LgcP375uMSMttuaiP5NAKc69uUsRARgQeYyfwBSE+AqrR3?=
 =?us-ascii?Q?LpJlEfHfrnMVTkVIGDTi4nas9zl83f9Iemp0166MFY1zlI6rWyVRLIk6BsdX?=
 =?us-ascii?Q?ZPodllwo5k32JFXPAmzwegW9LDpALHchZtWTcRW1kEZeMkxIzDKDPt+0wy7u?=
 =?us-ascii?Q?P9yrF3GkWncthnNz6bCY9bUyznTzSG7jp2v3wUiRZA6r++UxBVXU+SnCyrrd?=
 =?us-ascii?Q?RDhkLBGf2s7EQvrAm1xSbahfHuW83DshBfKM70V5X4aiGLVxWeK3Cm3+oiMS?=
 =?us-ascii?Q?Mjb4sjvbkXf2u/uxu+EHY2NwhLCZEkXArlXcv2HIhjymxByAcpHv2lt6Fppq?=
 =?us-ascii?Q?GDOERiZCztNmAeC3LjctdmukIaP+3v0dPaSPaaiEbrSUgxsPdopYWPfvvPcE?=
 =?us-ascii?Q?hufjU/eqPwv5x1c9E2cCA89yx+d71DhwAtcS5ZOc92EE4u2Ydxt7M+AmByGb?=
 =?us-ascii?Q?wXaZbV+3Hw43k7BRLVMZWhhLizu2bc35sSdIyHtPSCquwLT1fmOCTqH6Bl3x?=
 =?us-ascii?Q?eyWxarpJuk1Rk82Uxivvx/Yp?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49397d01-4cda-488b-3dc2-08d98d62dd32
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:30:00.9294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igUibsjZWZVhIa5un3r90hqEXwzHgTtc4Z2ULKEaEI200hJURPH20ZTcrD1s161xGuBsjWTM7/I2KdX5lmrlmVhs+B7Dtfyc6S2TOmT8TDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8328
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Since the recent patches added possibility of disabling sensor channels
via DT, it only make sense to allow controlling that from userspace via
HWMON_T_ENABLE mechanism. This patches adds support for that.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 45cb197cd277..133eca1f2650 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -200,21 +200,27 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 	if (ret)
 		return ret;
 
-	if (!tmp421->channel[channel].enabled)
-		return -ENODATA;
-
 	switch (attr) {
 	case hwmon_temp_input:
+		if (!tmp421->channel[channel].enabled)
+			return -ENODATA;
+
 		*val = temp_from_raw(tmp421->channel[channel].temp,
 				     tmp421->config & TMP421_CONFIG_RANGE);
+
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
@@ -231,6 +237,24 @@ static int tmp421_read_string(struct device *dev, enum hwmon_sensor_types type,
 	return 0;
 }
 
+static int tmp421_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	struct tmp421_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
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
@@ -240,6 +264,8 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
 		return 0444;
 	case hwmon_temp_label:
 		return 0444;
+	case hwmon_temp_enable:
+		return 0644;
 	default:
 		return 0;
 	}
@@ -397,6 +423,7 @@ static const struct hwmon_ops tmp421_ops = {
 	.is_visible = tmp421_is_visible,
 	.read = tmp421_read,
 	.read_string = tmp421_read_string,
+	.write = tmp421_write,
 };
 
 static int tmp421_probe(struct i2c_client *client)
@@ -419,7 +446,7 @@ static int tmp421_probe(struct i2c_client *client)
 	data->client = client;
 
 	for (i = 0; i < data->channels; i++) {
-		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
+		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_ENABLE;
 		data->channel[i].enabled = true;
 	}
 
-- 
2.31.1

