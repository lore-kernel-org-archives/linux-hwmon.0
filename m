Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB68C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:09:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08B5561994
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:09:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348669AbhI3HL2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Sep 2021 03:11:28 -0400
Received: from mail-eopbgr150113.outbound.protection.outlook.com ([40.107.15.113]:19522
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348631AbhI3HLT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Sep 2021 03:11:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7jU5e6MvOnuKfQ+oMZ7S744AQKM7HARdZEtEnavq/Ug/Sf/pqnZ7NjnISJB8V1COS0TELpY/5o0PpxVUCk61dDn5QpfxZ0ikHWQ0SpDQPUkVuTgl+h/LwqEmKE8IpX//n6RIERFs1UnA/JfwUoummZ4gzemGOELEs5zvu1Gm0+jnE6Qd0gQsOKVRIhluW7/CUdT7f8n7uWq4wkazBsX3iX7HsrMxOMztvLb5lJOlJiPtMKJIcNrQ1iL2DOYMHj0VPMf4DYX8XRWuhuAA0jmnNn1VMEbEvjqCzFZLhnkPiKavbUxBAQ4k32ZqOcV96ji7i4Af5foqSSm1ifuu6HfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pA917/1RO7nkKuNXzH1QccqhUE+OjkAbrT8p2UbUu04=;
 b=BDtLBMSvhTGID176QeLiG0PttFS+7aMxVcRW/wpxlzLT6w/lKS3K3LorjJy2FzAUVZ2R69ZLBDhNKB0B72j0IbMWi54IfEUE9BaboqOOCqro47NOuiTmqY2ZjyQzIksBkFyU4GIu5htggpOfgPn8FW0virOgfrvYLDQc3Y7CZXiw0AHljcAWpy5m9jqrJcuGLpyj/Z8gH3jSVb9M0BjGTkbExErk35kOcl25A5yFxpiITNSwuarr/7dW/G2CXOmVgChHjpGpxY5wxWWOYj3IVDNKT3B/wkaMmf7RP2yLqEymVISHQtk8XVRyrW6vfKA4njaoAUVj2wQFjmXBADGDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pA917/1RO7nkKuNXzH1QccqhUE+OjkAbrT8p2UbUu04=;
 b=I1JgXU7arS0dtGhGZGHmJQFvJfKmybTSFu6ebC0J90eLMKwhAQrKr6yRWEJj7uKuLsEi/UD42a28MTjQUuf6YyY5jMqmha16QkrgddRplM2iLjta0sG/XdwZjYMETwBvo4LWx6bm76mQya7asTRLvfKC3KR7husITTkmWGP2Zyw=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8348.eurprd07.prod.outlook.com (2603:10a6:10:2e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.10; Thu, 30 Sep
 2021 07:09:35 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Thu, 30 Sep 2021
 07:09:35 +0000
Date:   Thu, 30 Sep 2021 09:09:15 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 07/11] hwmon: (tmp421) really disable channels
Message-ID: <0be8ec1796909533d8a608ce58e2230e917b172c.1632984254.git.krzysztof.adamski@nokia.com>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632984254.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: MAXPR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::15) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MAXPR01CA0097.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 07:09:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b337bb77-5f05-4d3a-da9e-08d983e14219
X-MS-TrafficTypeDiagnostic: DU2PR07MB8348:
X-Microsoft-Antispam-PRVS: <DU2PR07MB834881C0002C150F2E91A44EEFAA9@DU2PR07MB8348.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: is972uAzAS6K6WbbN/Q3DK/qe7nHSYs65q0FuyKh1xhXKoEtxngt65VyeN6RgI7HlGVL1FNyS+l1+nJd2QxYwb6UUObcqTCz7qzRJ2D9Tpfy2ZNn0ZuDCXnIwh5aFanM/afpNBLSglPfrHtbg0QU7yu6iizJ3vHcB31oZOwZt0AXiqErb9lA7FtbifCufaTq9QLyILYYzbLrsUYkKq4NEfcSGd8kZx4Vdzb54Y3BgYR3wmWgPWdycFCBakAdxCJBytaNH1tm30DpN+IDc3OhbN7WMmVb1mKjdEq3QndAmITtOpGoke85kERCuiQnRJlw1AAZuLItFjFQ7q+o2KTW8kr/RWSAQazvwX6dS7DtbHyuE87SGQThOiQGKLUJxaRCki4fQ1gjkZzDuJ/4Rt1iU2H5+krnTaDASEu5+3fKgGTZTwkoHWLDJgAh02ueKGQwkJrPO6s3ijst5A2VNdysNskr7hfNW8bF53nwZb32tU3zc+peuUq/83HTxU0KrEpW709tOlpURjW2oXWfBi4M8exf7To3f0s1asqeigvspeSxiDCloU9HJ0rHh0XyIQqDmtAh52uy3NoAqHCHQ3DeMecXd//qnVR3OfFbxzahN0RPJCHqKUxY4ssexnmF7o+otP9hTOfwn090D9o8pEe63QAw5Tus8UKxnPgu+OHJEMWOr5AZ8Sph76/nwtgMERlDQ9ABfaYqhpHSzc5sQDC+YQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(6506007)(86362001)(6666004)(26005)(8936002)(8676002)(4326008)(186003)(2616005)(508600001)(66946007)(66476007)(2906002)(66556008)(956004)(6512007)(110136005)(52116002)(38100700002)(83380400001)(36756003)(44832011)(5660300002)(38350700002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yCTbkS/d50uGv04bKPbA0ABxrqnRf3D1qXK8IcxZXW7ARpoJrZl5Dh/WOK8x?=
 =?us-ascii?Q?JxV1hB+6tEI52sM6B5V6JVECef8HFsPx1AQvnhNMqHmLFDI9zxAlbvuFNmkG?=
 =?us-ascii?Q?rGqqyiA4l9gdQtXw0jr17OFtQ4kXOsq7DR3/1ax+hQ2L56R3RZJs14fg9TEJ?=
 =?us-ascii?Q?h9hv6UTIyy31npYmjDUyn94EsIt0JYEr9XFbJBRIsNpRTVHUp54/UpWlQ66D?=
 =?us-ascii?Q?oG18gFzRwlQXP8Jp5dbk3f1lEyzdr7PadQ/n9K8GdAnt3pJ/Pi7wyfoAkYV1?=
 =?us-ascii?Q?OPwj7JAsDaXwqT1DJ2Rfb0N0u16uVwX7unHwNrg+EZTSzD89iKdHnQ9w+G7b?=
 =?us-ascii?Q?AJOuy23II8oMpxmFHTMXPcuCu+44Ndn9lw9YqF1r14OT5tnHjBDzdaRTCSJL?=
 =?us-ascii?Q?USTNcQCy1VwHrN11b5EgJMTS5y7MAsC2vlb/f3L6jeX/ibheB1IpJt1YFA3h?=
 =?us-ascii?Q?mEPXqMK3nPdNsLrh+9N40cPccPyrNPw3ROFQplB9yc7vjcsbZb7rcHsNvNZ3?=
 =?us-ascii?Q?HRqInBAw3XawUADmLtWXbHNesZagdZDa2ZXAvqt2S47cOb/VUOTnuSzmwdmt?=
 =?us-ascii?Q?dTdY5j2NRZkFSj3gKnUYXTtOau31OLnHlhCxqHwQzM1RpP/7X4IebJoNr4HP?=
 =?us-ascii?Q?LGjReV2VlQqu5BztohukG97cxSjU6Q5fRp4RXedHCcW/8+3Ut81g9MCr0l13?=
 =?us-ascii?Q?2n5VwMUmvGYgcMrqHoTT/SYpAPCv2UpsM/UkZZDyeLHLrA2y4jcv5sJovfrx?=
 =?us-ascii?Q?6ytG+Q2Tz2VGTAiZLnRVF0Y2VLWbS7QL3dTVl5aTW45EDxxQoDtPggxfKUaJ?=
 =?us-ascii?Q?Yy2nZW3M4KZl7egZPFFfmAhgtwhZWsFDIkoM5u5V7c1plWACa0UiygKk+E1g?=
 =?us-ascii?Q?heMBnNFZ7sLZeCs9gyC/uDShmZwUI9PWAkB5aaFBzaa4OwNUrresDdLsWpKP?=
 =?us-ascii?Q?zq021tWKZg2xQMTIpkhsHTRZYqSvPtJZIl1DO5nGClZ2JLeN9ZWIIvxns5ux?=
 =?us-ascii?Q?Jv4SRXJkgxk8VJcRruvvRQOoBguvWci2qKIH8NB/RJKMxkV/JeTGT+ClHanY?=
 =?us-ascii?Q?qy735p0uMwrzjRkGw9OjDuZT3Q2f2hPxQuU8hgOPIeP3YPrI3XwXh8btNyAr?=
 =?us-ascii?Q?RTS471fijZibECuDCLYRKEH4fZejA8rRke5G6/V3Bvo5fRme0AxJJbe/JZ7U?=
 =?us-ascii?Q?Ogx3a3mz7ju7COc1zdSsioh9uvoMxj/vekrY6hLJ0YwHsmE4c9wIL9JMNTLK?=
 =?us-ascii?Q?4NmuCKZOEoLR6wXcSQ9PD+9e5x/K8Mly2/A4DLanSEeXh7jl1m/B6BA6SIXJ?=
 =?us-ascii?Q?qNdKr/V1bUEWF9MQtFdmczfh?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b337bb77-5f05-4d3a-da9e-08d983e14219
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:09:35.4315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JaRwLRF2duoK9GJ0Bf3UPQdcKSkDd3jxLcIi82TNx8a0sz883fNj+mR+kHKp/zde8f4yhlnHDWzS8NyoGZD9Izn0+v3L8ObpIJHCyEInHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8348
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Recent patch added possibility to disable selected channels. That would
only make sure that the ENODATA is returned for those channels but would
not configure the actual hardware.

With this patch, the config register is written to make sure the
channels are disabled also at hardware level.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 41 +++++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index b32fd2b6ed07..f9c6f23f1f0f 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -33,6 +33,9 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
 /* The TMP421 registers */
 #define TMP421_STATUS_REG			0x08
 #define TMP421_CONFIG_REG_1			0x09
+#define TMP421_CONFIG_REG_2			0x0A
+#define TMP421_CONFIG_REG_REN(x)		(BIT(3 + (x)))
+#define TMP421_CONFIG_REG_REN_MASK		GENMASK(6, 3)
 #define TMP421_CONVERSION_RATE_REG		0x0B
 #define TMP421_N_FACTOR_REG_1			0x21
 #define TMP421_MANUFACTURER_ID_REG		0xFE
@@ -162,6 +165,31 @@ static int tmp421_update_device(struct tmp421_data *data)
 	return 0;
 }
 
+static int tmp421_enable_channels(struct tmp421_data *data)
+{
+	int err;
+	struct i2c_client *client = data->client;
+	struct device *dev = &client->dev;
+	int cfg = i2c_smbus_read_byte_data(client, TMP421_CONFIG_REG_2);
+	int i;
+
+	if (cfg < 0) {
+		dev_err(dev, "error reading register, can't disable channels\n");
+		return err;
+	}
+
+	cfg &= ~TMP421_CONFIG_REG_REN_MASK;
+	for (i = 0; i < data->channels; i++)
+		if (data->channel[i].enabled)
+			cfg |= TMP421_CONFIG_REG_REN(i);
+
+	err = i2c_smbus_write_byte_data(client, TMP421_CONFIG_REG_2, cfg);
+	if (err < 0)
+		dev_err(dev, "error writing register, can't disable channels\n");
+
+	return err;
+}
+
 static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel, long *val)
 {
@@ -217,9 +245,10 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
 	}
 }
 
-static int tmp421_init_client(struct i2c_client *client)
+static int tmp421_init_client(struct tmp421_data *data)
 {
 	int config, config_orig;
+	struct i2c_client *client = data->client;
 
 	/* Set the conversion rate to 2 Hz */
 	i2c_smbus_write_byte_data(client, TMP421_CONVERSION_RATE_REG, 0x05);
@@ -240,7 +269,7 @@ static int tmp421_init_client(struct i2c_client *client)
 		i2c_smbus_write_byte_data(client, TMP421_CONFIG_REG_1, config);
 	}
 
-	return 0;
+	return tmp421_enable_channels(data);
 }
 
 static int tmp421_detect(struct i2c_client *client,
@@ -389,10 +418,6 @@ static int tmp421_probe(struct i2c_client *client)
 		data->channels = i2c_match_id(tmp421_id, client)->driver_data;
 	data->client = client;
 
-	err = tmp421_init_client(client);
-	if (err)
-		return err;
-
 	for (i = 0; i < data->channels; i++) {
 		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
 		data->channel[i].enabled = true;
@@ -402,6 +427,10 @@ static int tmp421_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	err = tmp421_init_client(data);
+	if (err)
+		return err;
+
 	data->chip.ops = &tmp421_ops;
 	data->chip.info = data->info;
 
-- 
2.31.1

