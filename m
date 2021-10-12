Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D69C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AC2660F92
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235581AbhJLJbj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 05:31:39 -0400
Received: from mail-eopbgr30111.outbound.protection.outlook.com ([40.107.3.111]:2528
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235704AbhJLJbh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 05:31:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qt0IZDeXi6SQDeqAutGagSwgItIIH1xDTI26/hg/Gi6HI4RI5wufP26UPi2x2A5O6JKluhvdjMAdJBLpkLFqXMQxjE9EBdzrHrnekOaZwcAAYHTe9gfonLaGctGTLRFxwGtCp+fRmWToGZBcjKBSLipMQcIJVlDdnhgGLwWY4/xbtwUFeSttxBOMcgscp2sLIPEdXuJUyWCvnJlSWt2a+0JGQp1oHJYfI5fdYVX/35Wx3kX5Xc79mvh1TVrv9sV/pe1mLHO2phq9YdEX4uh4JIFrR+YNLBuYobUzIkbn69LmyO561dYF1OB0Wb1pPo17zbD4j3TQDKAmG/8AfTQVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyI4oyQtpiWI9P2t0YpO07BuRXt7UMdw80W0hFQtYcQ=;
 b=IsWx+gV4s1pEAyuZ6Ep8LHuV8l6kHirahh8xxrBKnyJRae3WKYkruTK+0kJZGXLDOUewtODu0tmVIRNbASkgWb4r/Lc2S7+24SMhTIBEVit+a3Jt0mQrs4y/CNACumBeII8Me07WyX8vkwqt7kVpGd/iBmSkQIIk1VuATIGDjl+I3T19IeKP6xeIUOLQe9MZDQ4++aBh4gFgnf7GXq4GLKg6dBhq75iWNU5asHCtIbIhY9C9Z01B3qQB38zbGIZzK7yOLul1zKAk8c37FIgdP0R0eBNf5S+h90O77WDzSjg3guH3ksGu4wYf4GJAwJr0RcvGKlZiEv4DL7VhraBW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyI4oyQtpiWI9P2t0YpO07BuRXt7UMdw80W0hFQtYcQ=;
 b=F0XdJiUYyVlKL2Ao5csuVcAYFNGQwo4ycJcXZ00mCafEN2MGJI0rjBJOobTyhYWLxLO9/51yUkchcQWPczirVPoPJKUUYZKuhPgE3XAzszeBw9Q03QV7alBAdD4ckFxJNMBeeZuzXm/1EZcsan4ZG602l0qh1K1cJQQbzjAyrZw=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8328.eurprd07.prod.outlook.com (2603:10a6:20b:443::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6; Tue, 12 Oct
 2021 09:29:31 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Tue, 12 Oct 2021
 09:29:31 +0000
Date:   Tue, 12 Oct 2021 11:29:27 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 06/10] hwmon: (tmp421) really disable channels
Message-ID: <eaee0947c813b04b77ee8364724d1a406dccc33b.1634029538.git.krzysztof.adamski@nokia.com>
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1634029538.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR0102CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::27) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.15) by HE1PR0102CA0014.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 09:29:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7df297f7-9554-47eb-068a-08d98d62cb7c
X-MS-TrafficTypeDiagnostic: AS8PR07MB8328:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8328DDC9783C90176341C7DAEFB69@AS8PR07MB8328.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 95lqqqvz38Dq8d9cWE6ObWfpJ+EybfCxQqhl0KNAUSohnJKMdnYqQQghQ6sm57eIXwDCGWTQD0YHrreYKIKtt5sJtpAIR0kXGj+96wGwG+qUSNGCdt5FbCf+33NWAfZJ7v+Iu3WD05Cgrm/4de82uda3BbX+Hoj+goo7stE72giNtazDca0BlhdWuJG20ozn4ift00GWrcJCpZzMQ6lYYPldPyUyfEnFbTeLazmmx60EeaI9EJyyWirrokfl1MvHoOMWkkUuOGl4kdj1/WByFMJHqsmYL68168J2fEqyikfXKYzfZ2hRuwBTbRcKJsgLX6bIF3/tEi7kX9dhyz2/DYtRVM0PTZjZ44fNWul9OloxXyqwIB2/6BQbKPa+sNoX0uzQ9hNuPpbkRPaCL8fRgc3Rr2mDvFcC83YQx4jBFokQq0seNOO7CnAn+4vmnSF+LKN7SkVAYlHwFefaCjqugDuMRn68066QXKF6r+EKRpikjwETPYYlF91/IsxkoUJur/YfnMAW/tD0gBCm2zuzq9FnQ8dEEPXG0H7U6ZoiLCWBOK5DSxLsqoEQAZaVdiFFrUScR9f/odhUOBoHIkd+HNdU5fiPWmwP7V6+3p4SNeZ98QfZO3mHTwjRIo8WN4zj5R4W8U8Lep9rNOILb1yW1WkY4qi/rGzFtCK99/5zCPCkNc2Kt+AGiygE+IT6DYsJniJSCetQnq/FTCr2s1k6sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(38350700002)(186003)(26005)(956004)(316002)(110136005)(66556008)(83380400001)(38100700002)(6506007)(2616005)(4326008)(6486002)(6512007)(2906002)(8936002)(8676002)(44832011)(5660300002)(508600001)(52116002)(66946007)(86362001)(6666004)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RclK2f8BidRUeM9RP3EhFSEwXBdz0I29TW2wDS+8CiVaoCV5xp7948WXw5/o?=
 =?us-ascii?Q?A5HY3VrXOvTbDVeNK+mwiDyhVXL9AMkb4ugmaOHfk1XkGa0DT4JRQzi41Jgh?=
 =?us-ascii?Q?VQYcwyxI3XeEP+i3rv+63fQOzk6yx7VqpjKpHPsXwWU7E0oGrMCq7p5wcog1?=
 =?us-ascii?Q?PSM44ooaMLpstPGro/L4BztjWKwxebqYFo6WUZn7gCW5i9ILWEdLBlkK3tbf?=
 =?us-ascii?Q?+uHfM3sxOIR0iPC30hJgflHoKEKoyWczYp3hBmAkJxCszDPO5DJe5V5EZmMA?=
 =?us-ascii?Q?qxxgQy/u3PYXSMAcUIQPdqSE4z/+omqEvkd+haE3REcdBiMIDMeZwR7UEZnV?=
 =?us-ascii?Q?tWpp6nI+Y5gTNqwbm7HopoKqwq7TyOvmOcSKocRJOTM4hC/iY8ExMVCutArz?=
 =?us-ascii?Q?NVdtlI6Kf52f/vktc8xcOrcw/vqz5o2f5jdwuPydjr/7UMitzOG+/dp9LqOw?=
 =?us-ascii?Q?aHWcCr6EnVEkyh+ZZz5/vD2GqyQwmnQgT5VHpyS9eaDDTcfhzrbjoAZ25xiC?=
 =?us-ascii?Q?wR5PB/XgUIq/jM7aTo5nvz0VJo39/Nidjsl65uOmZcXg6Hp71eRXhB+xNrfG?=
 =?us-ascii?Q?JjP9QRXATS77ncC9+otx1Oir0HDjnjXfXJF/I/kqAR/SuHQnv6f1WHdZb0AF?=
 =?us-ascii?Q?mAVLxVTZIw4r2vGUL1MPpm5o9sS/vBCp3Sd4c+zAqkPUev29xrXMh/xA/EmX?=
 =?us-ascii?Q?RwNn1Fydw+6XCHIGD9q0uTCuoTQ1y8TVk1Sd3vBXSDNxTBP3vhWpFnkXBiRz?=
 =?us-ascii?Q?uex45Im8bYUwGorIKTzJY+DwG7DdgRzIAoLvdM5WOHdZspykpsH5n88IjhYZ?=
 =?us-ascii?Q?pyTtuc5/yBvnwevFHhovI+NjludKZhMsOOyWwvDwpdyEy7EStzBC9g2razIZ?=
 =?us-ascii?Q?Ta4GU5o41A69wJ0vYLhVhNu0gkxWKq+4fV+LWfzKmC+A7kK3Yxygn9KKVTXb?=
 =?us-ascii?Q?ORfvYjIMMarqwFoC4dsmhqk174lSiT33iaH4m3Ao96cEzDXNTl29ghYoPNgq?=
 =?us-ascii?Q?tPKgGAKNvIG5cVXG0wzEzKUP11hJdXz6ZwWNJCxT+PK7IsGvNoOjZCR6vJmT?=
 =?us-ascii?Q?uF9adFgpqddvT96LQVPR0N2ZRBgrnzfY80W2a8GqG64KNFgjD/VINbCS6LAg?=
 =?us-ascii?Q?UBDWbRLE13DYEIHwYRghUwxQZPmwgk4fojK/4F9IMDNv2pReA3bX5WoGvR3i?=
 =?us-ascii?Q?HHHjMHHTCWaQbVf+crwa8x/18fWZYRzT+/e3cqV/IRcSVNRbeeL02dfSfQgu?=
 =?us-ascii?Q?zdIw59GmAAUKAZUEnCvYw+CviA2Mu50bKXtEt/RicM6zYP/LjC6S7wCIpcHA?=
 =?us-ascii?Q?uVNsfg98sh1BPLyEj/6qiQTC?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df297f7-9554-47eb-068a-08d98d62cb7c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:29:31.2070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6dCwlXGSv19Snt9+vsfkDnOCFoNhKT/4LpMhar9wnmFN8um5nSBsAVE62RNm42+nKcO3DW6U7xjpucYG8WuILTxdYE4vWQOcuZ5g+rZ3H4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8328
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
index fcd2932a6ddb..45cb197cd277 100644
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

