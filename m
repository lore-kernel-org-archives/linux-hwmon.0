Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2625AC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:39:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C8FF60FDC
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245259AbhIXJla (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 05:41:30 -0400
Received: from mail-eopbgr140114.outbound.protection.outlook.com ([40.107.14.114]:61454
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245241AbhIXJl3 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 05:41:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dx7oP6hnbjix9OB7CBzzzKi87ThYSuMc77BtFp9fejE+eU9r0ZaNAFWIbyYd7NIYu3NfdlzFa3LMLUwktB/LsU3C6khhQRkm+fgBnSUzar5Z/ZGa4IaRrueir92sgsIKAe5lVc5yuRBtayhtmBEIrBOe17o5ZxHEddvjmP2QZeoy3k7gWsoNVRWTyyqulZwxLWFFPjgRqzhYwiAy49P9F2dvOlwdsMv8gPW58EbmMw28qJwQLPxmWPJcQivbktRkZaXYBF9/6tF0iFymXHqsgGT5/kKZS9e80fr3IcEEMMkYk6vm9Sherkq72PFglm75w1r0paNC/mjspHTG/bmbxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UcRK93P6BoFZUIlptuy+5ZsF1fCyLG7Nfr8DXKlpiI=;
 b=KoS7gnCTGf4nTKNQNmBsJg9UQpduFL9Tpm2kXY6CDhwtYVmuxskySBjEf7MP5oCDZcdPY1yFbwZxBaOQek3sN0maVItnvXHzU/DgNQBARZ5xf0+ksbU119ChaZex9apJRdEGbe/hiaqeqxjlgKKrAdm5OpIK9mwIePec9neBrL9BUmcIQQhQdOvrqTGfl8p+gwCYY4tFkSskV5RinvSR/4hAe2Cb4TtIQbxQnYdx6Y9r4pa3KgbVObJh4GqRmkKXHg6ty6CT5gDhzAKsTPRqUb6GunpmUJMRK8UPIcqwt2XLFRknNvV5tXFebnwvqpPvzs+j/wJmRhd4TuCVO06mnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UcRK93P6BoFZUIlptuy+5ZsF1fCyLG7Nfr8DXKlpiI=;
 b=dvs6DLCgpdOyG/qaOSHfpd+15BrA+d8mJls6jaovDQr+LQeJ0du9UOERM/zGXRT53HyMy9VxOCY95ztFFmQgKpzAowYF45m1pKuXagJXRO/BBOkHTDzIRoUkH7/iRGbWozCh1Przh/2/Ic2rUT5OUZB32wu5ir1GdwxwQMs21yo=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8237.eurprd07.prod.outlook.com (2603:10a6:10:276::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.12; Fri, 24 Sep
 2021 09:39:54 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 09:39:54 +0000
Date:   Fri, 24 Sep 2021 11:39:49 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: [PATCH v2 04/10] hwmon: (tmp421) add support for defining labels
 from DT
Message-ID: <fab57edf8a0b8b2bcb2a7acefa1e1b65a9534f31.1632473318.git.krzysztof.adamski@nokia.com>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632473318.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR05CA0142.eurprd05.prod.outlook.com
 (2603:10a6:7:28::29) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0142.eurprd05.prod.outlook.com (2603:10a6:7:28::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:39:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 949712e3-5b4f-4c85-b83f-08d97f3f43bb
X-MS-TrafficTypeDiagnostic: DU2PR07MB8237:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB82374E72A1814A79D55BAF63EFA49@DU2PR07MB8237.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kOm1WPzlTRCiqMC3/xrWmKlZWSpTtse2UERZRAePqpk6wdONuyjxR/QvwNal2PzSLZHj87ucYyaRyGxtRxESyOKXVBW2FRRshczLe4N6endQ2o/Rjmm+uh9odxvzAkCOz0lx5VzrxHI34aGjEnkULA81m6ZLgaKzORDXur3rCZhgPOO6ZmFH/MHIcCtmB193WNNtu2TSOSYiRN4I1/71/vDGVsfPd1BqoU0/J/F/B5fl37Xdkzig0m+seN+cIMrFZ06JirgQxxkjZ0uAhjaSCi/7wwlF4f00jNqs66VXeduX+sUccYEdd0zV4TVPYSDA83buxxHESaYVYOnpOaFEUJ/ZAbyTxqlFEzxQIe3xAuplv1yJiujk9oYrHalSZzGwlD1099jzMAjWGtKrg8853eDBOTZrE9UVOW28jpCJFEDUAgKGYBHjYBh64wKk72mgGEH5UMKHA0n63L/YOve+z3FCk6OklfWwe0ztQ+GcT3nQzrJnle0TaOit/mvXtU6MnqPZOz0BwUHldJv8Fqn0ecuwbPrPdmGwW9VIJ1Gtn2ERSLzE6MlYQ35t/4pnglkHgvpqCmcBeT/JMBSx1j6unSOyBP5frTAGWztYemqBVlDa2kSaEioLspwu/POXcfRrA+9wgcJa7w/jzHuEm/+VTVqTO94fNkotlscITtdW9uVt8Ayul2B4+8dTcU+iLxIIIhuyaSZxXvwHfyk7G30VxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(26005)(8676002)(54906003)(36756003)(110136005)(4326008)(107886003)(316002)(66946007)(2906002)(86362001)(66556008)(66476007)(6666004)(52116002)(44832011)(956004)(38100700002)(38350700002)(5660300002)(8936002)(6486002)(6506007)(508600001)(83380400001)(2616005)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pXpMPp7z/ph5HPuSeCbOzmLg+AeFaos1H+Y09NgxQiOhXDVQmLlg63ouxQu/?=
 =?us-ascii?Q?POs0huZUcyYMjJTqMUXMKPfFWg3zx34wsQUILpXFFk8ZGjqMKtkymTgyyTX3?=
 =?us-ascii?Q?aZCGzNz2Reb+4NpsmJ2Q5+SB06AkSSXuF4jVrxH/OCTcInycFzn9apkYCLEh?=
 =?us-ascii?Q?BkoMOqCvW3zWd6l4OzfR/1y+NnwdZNU1cvBKdm/Z7mbkzrDWl/Jcr2HQ08RD?=
 =?us-ascii?Q?AaahEm3L5p9bYKO78i8mGmEh8Kx0UqmYiWu7IJQVQfhxKvEOXmN7zuQBF7Uo?=
 =?us-ascii?Q?V60hiFczrFBmRHSdynH7YsjLpOnk5+CKdpQSWADk+mZUGePNegnsQ7sDIty3?=
 =?us-ascii?Q?4X23rfPMaovephV/Nbu3zJ+E0oCn6IrRx3yi7VTDk3nDXnVfMWOMl3VNRmJE?=
 =?us-ascii?Q?WAp8dMFlconWPOsnh8Z9/GpkpvZEh8rszOwUFHNK+/v16QdDgfoKP9UcAAFA?=
 =?us-ascii?Q?2FkQHP8+wlRt06jkLji2vOL/peRhmKWwJIwYLmvPfoviA2f1RJfThCx2I+sw?=
 =?us-ascii?Q?iRQOD9RF1yaAgVNbkwGlUBWaJIlG5WRHxEafChp0xY48rHxl/9Eo65OXgrW/?=
 =?us-ascii?Q?mbE6Nd69Gze/gLnTndGliQ4TiW4WzgoV92Ln7v2xtokGMd+KwFYN5ngEHm3y?=
 =?us-ascii?Q?k5F4lv/Vl8FqYMXUr2WGXfPMG2EIbT0XfmeeDYBGm4jYpmLNZoPDh6jQBKaV?=
 =?us-ascii?Q?FtgzTSgIKOatSHiBQuYz65s288vl0qNy6L3tOcym7RFBIQdXi/AlN3aDzWFb?=
 =?us-ascii?Q?m46MXuTCG9db246MXBzYhvtf4B8Tu2Th4Ye8/d66ds8Yf88n7pWFk1ZUjjvo?=
 =?us-ascii?Q?P/Jwdd3Clm3duvG0zoU0Z4mhP/1EnjbmiTDkEpeVuU49NkRQhz02L+BCbs9s?=
 =?us-ascii?Q?qqhGViI9vmTBb9HHZSX0m6v9546DEJik/f3e1p1z5mcfbQ+fCMQmaOjzdvfo?=
 =?us-ascii?Q?VWytPpJIgrqYTobWlAcB2FTYlgAeqVJTDJvDXFwpsrgcBKT+FAA14IyYUVeG?=
 =?us-ascii?Q?fBNcKOkZih+dJNvhF0/LVg1iTu9VROrC0V9fpJCANWlm37dZ1s7JV4TdyQEa?=
 =?us-ascii?Q?/7dTqa7GzY3CmiWNs2YBC/Mu39wI16EVvo+5Ijc54a9wJn4DUmRLa2GCJoil?=
 =?us-ascii?Q?XJ2VfYf+VhjN5eXAB8B359W8sK4jU8nNOIV6pmYNQkHqYMCr7PKijkeCpVi/?=
 =?us-ascii?Q?A+qhqA0xHKg58fUxdXe1UrLE4uuH8Sgik6odr8TpN/q00Wzht71nHl/8XpJj?=
 =?us-ascii?Q?UNEgeCrTFmPRYAJRd47lXdCc4mUfj7Nep8crXuG5oSSOBtM2fg6Gc/WF5o0H?=
 =?us-ascii?Q?SEaIVL5YijkD1XJfPES8VS5D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949712e3-5b4f-4c85-b83f-08d97f3f43bb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:39:54.6863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9SHa+tV5ZsyyEEFS+X57QuT6o2/yT/sUXsrXxf6tQbebwAu1rsgU05yeT0HhiKmnUZAFtW+dwTDDXNIT6nkbM1OYBcNXQvsJjNosLMbfJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8237
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tmp42x is a multichannel temperature sensor with several external
channels. Since those channels can be used to connect diodes placed
anywhere in the system, their meaning will vary depending on the
project. For this case, the hwmon framework has an idea of labels which
allows us to assign the meaning to each channel.

The similar concept is already implemented in ina3221 - the label for
each channel can be defined via device tree. See commit a9e9dd9c6de5
("hwmon: (ina3221) Read channel input source info from DT")

This patch adds support for similar feature to tmp421.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 1068fe59df0b..f9f910d60b12 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -88,6 +88,7 @@ static const struct of_device_id __maybe_unused tmp421_of_match[] = {
 MODULE_DEVICE_TABLE(of, tmp421_of_match);
 
 struct tmp421_channel {
+	const char *label;
 	s16 temp;
 };
 
@@ -177,6 +178,16 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 
 }
 
+static int tmp421_read_string(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, const char **str)
+{
+	struct tmp421_data *data = dev_get_drvdata(dev);
+
+	*str = data->channel[channel].label;
+
+	return 0;
+}
+
 static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
 				 u32 attr, int channel)
 {
@@ -187,6 +198,8 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
 		return 0444;
 	case hwmon_temp_input:
 		return 0444;
+	case hwmon_temp_label:
+		return 0444;
 	default:
 		return 0;
 	}
@@ -279,9 +292,53 @@ static int tmp421_detect(struct i2c_client *client,
 	return 0;
 }
 
+static int tmp421_probe_child_from_dt(struct i2c_client *client,
+				      struct device_node *child,
+				      struct tmp421_data *data)
+
+{
+	struct device *dev = &client->dev;
+	u32 i;
+	int err;
+
+	err = of_property_read_u32(child, "reg", &i);
+	if (err) {
+		dev_err(dev, "missing reg property of %pOFn\n", child);
+		return err;
+	}
+
+	if (i > MAX_CHANNELS) {
+		dev_err(dev, "invalid reg %d of %pOFn\n", i, child);
+		return -EINVAL;
+	}
+
+	of_property_read_string(child, "label", &data->channel[i].label);
+	if (data->channel[i].label)
+		data->temp_config[i] |= HWMON_T_LABEL;
+
+	return 0;
+}
+
+static int tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
+{
+	struct device *dev = &client->dev;
+	const struct device_node *np = dev->of_node;
+	struct device_node *child;
+	int err;
+
+	for_each_child_of_node(np, child) {
+		err = tmp421_probe_child_from_dt(client, child, data);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static const struct hwmon_ops tmp421_ops = {
 	.is_visible = tmp421_is_visible,
 	.read = tmp421_read,
+	.read_string = tmp421_read_string,
 };
 
 static int tmp421_probe(struct i2c_client *client)
@@ -310,6 +367,10 @@ static int tmp421_probe(struct i2c_client *client)
 	for (i = 0; i < data->channels; i++)
 		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
 
+	err = tmp421_probe_from_dt(client, data);
+	if (err)
+		return err;
+
 	data->chip.ops = &tmp421_ops;
 	data->chip.info = data->info;
 
-- 
2.31.1

