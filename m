Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99235C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:09:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D43F60EDF
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbhJNNLW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Oct 2021 09:11:22 -0400
Received: from mail-db8eur05on2103.outbound.protection.outlook.com ([40.107.20.103]:18913
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231248AbhJNNLW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Oct 2021 09:11:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhbNYWjW/DV8jImVaJgD6KPcMNSA+WiBLixnKB8VW6YMuVxd1sGTG+4QKDaokyfw6uM1NKb40xK1uzu6Y9KRvxYnaZ3DUj2/oBSLEIDSytWNmxH0rWFvVfz+adaUSt6ANEthqWYfI10DAb0E/qG8OSn+zezw5nOS5jqRMDdfP+26b2cnIMEwTmhWPK25rTg4KxaKEUhj+Kq7OkjO8h87peS3P6jr/II7UhY40iekgazMZ38Qi7lC1TKIbwtk3AbebGYFLqwpYPetqQ/Xj/imbp9J9ig7mWfj4wexGIn7k0Gdyf+Nt+7rTgiKrTeDvmRgE4AObh6WGOMkmPtPu6feOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gP1hdt1dn3lfgcRmhJ2wGMm1v21zPrYmvy48SdggZXQ=;
 b=JVIdoXYuwld9LTi840O/MvU/DvnwH7ZyY5qjnwXZ//oWOK/z2Mku93NuJurJfgMM+I/7E3IWtifo3WFrMJiCVk7gsF4WD3y9h87jF7oovwhtcFAAMDYDH7pZWNDN2sdsPZ3a1BixTMwKkQx0U8pHN0A7ACL2hUZZpa3bvV9TLCqzPX588dh1bREDrZcGAaUISi3qun9q/yxTHF0CxJq5PoSd0/jmaDuFkcLR5WWPpg3IqaD9VxpAjiWah5D+pho3CuQGeSxHTYzkdfpd2oZsoori/EJDjBiDO64fgX1BrMcq05OjYgho1rWmPpD5EPLTJx9MFaSYMpY/wW2JxaACcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gP1hdt1dn3lfgcRmhJ2wGMm1v21zPrYmvy48SdggZXQ=;
 b=kNNNMdbQPCa1uCLf8xLiNk7NBLT7IAtTkgWyXAgzkSBy9+3GpeMBcblQrEr29DWAszc9783xlhM06xjDDdE00u6ufqJF6bhvAp9Covtp0xS5sklrfbyGUCeM/0U0j9fJcvA0NZoY85xPWPNTS6Q7ulrfYUT7sgaKPOUsRRGgJOE=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8251.eurprd07.prod.outlook.com (2603:10a6:20b:37a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.8; Thu, 14 Oct
 2021 13:09:15 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Thu, 14 Oct 2021
 13:09:15 +0000
Date:   Thu, 14 Oct 2021 15:09:08 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 5/9] hwmon: (tmp421) really disable channels
Message-ID: <d451cacdf21bf8eff38a47c055aad8c0c6e8755a.1634206677.git.krzysztof.adamski@nokia.com>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cover.1634206677.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: HE1P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::22)
 To AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from wrlinb104.emea.nsn-net.net (131.228.32.176) by HE1P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 13:09:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1232777c-abd8-49d6-c252-08d98f13d2ed
X-MS-TrafficTypeDiagnostic: AS8PR07MB8251:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8251C48DA723BE66C921250BEFB89@AS8PR07MB8251.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w1yG5dfT9lNi48HB6j90NO0fd+/FRgACJlbcgXMHHrJrGdVw4+l9aTOpXelqWm/x8A6ZgE1N8UiO1PjhxTURAk5zHoR8RlKQ7Awe7/4JPLW14ACjWJqbll1TPFoNQTJ9J9RQq7BqBcz5+mxZ+YS+6SAXEqO/Rc3qORU8LRGjG0F2beNZ2tDtadXwSmEATwZWve0odHYNNbnUE47zbk3D59p8TwbbCi0CdYg2v+qJe9cX3TuoV5n48KZJaV5ptzcc0NiXVQ+uCikLHywQusrmH0mLetnBoLXJWuCzTAPfdic1tjSr/ncjfNHJViKjDFHbbzl3ef94BIUOmTtI2FLflbU37tHT10q+DYE57wwEfyr1ZrulsoFa9wjWMNbSNNcqdM/lfv9BXdSncikmZZ4Byx+JvlXlmnX9OidQBbeD8AOAiEf0HDo5VNm1GJ7n5rdJ9kGRqWie3swmrULk1agmozmaKyXoewiUX+v2BpV9QwtPqivdG1/rjxvgq5YL+0cYJ+XzC2gjqFw8TSRzd/Oy9F/E8O1FpP1Weo3hQ54yeEB7k7m3ZA9lPgz4ek4MnuYAQE1qKZ/wnKTQJaucWU04n9WwfH27dcPNB0aAHxcHUy/51irsmpmfSRlvqbhKtx32odJm6yj2B+mtS2BbgYA8Dqr3DZ4e6Jb2BGrubzaItwDTUMnmSEw2rixhq/ZZ5jwFcarhTfgoat7q7Lm1Hj25zA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(6666004)(6506007)(66946007)(316002)(186003)(26005)(38350700002)(110136005)(2906002)(5660300002)(8936002)(36756003)(4326008)(38100700002)(6512007)(66556008)(86362001)(508600001)(8676002)(2616005)(6486002)(66476007)(83380400001)(82960400001)(52116002)(956004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q3eeps5WkYunKHpxORtrj4BGJMxHQMlIC136Hs5FQsb+734ggvOl9EV6eg0D?=
 =?us-ascii?Q?TMwYvRaR0YC1wLzC+Iqdz2VT387fBxo8XpXUvmOC9P5tbzwgl3ff9Na82FE6?=
 =?us-ascii?Q?HXxt4Sj4tsEmOix3cw9vvK1dBLOi8iXftSQ8OXOHKu7S28jmgUFpTk+iuHni?=
 =?us-ascii?Q?lZzx208K+BS+w7LjySvnwTIbA89euqenIPiTnYn/ieTCFgMl+EEwAK57vH4W?=
 =?us-ascii?Q?DV8cb9eQ6nJaSjhRQxfMSIYuLMNmzp4rq6YFAsw0KyIEdlCy7Tjq/kX6c2Ku?=
 =?us-ascii?Q?mN7kWlH4Hlq5Qtu9NpVXaVDSQdfAKkG7xjvZRLihNoteumqeJdW8F+j7ACJN?=
 =?us-ascii?Q?XOS8w2u1Wz9x4fAHM7jDOFh1ssK35MbISl2O5mfNeeCySFu/KOyxQO/K5BGX?=
 =?us-ascii?Q?WdynUmfSHj4LZ6JD9SPftUmbBytlZ4YDRaIGpBf+FXDIFTrVLY3WlGJyl6eY?=
 =?us-ascii?Q?WsDBNnJ/SthR/HKpqqkdsDgiO0zNXd8f5q2wjCBFNNTe2Rq8yjv/nHMUH80w?=
 =?us-ascii?Q?kyDH4pMWrR7BNhOTkGbaJF+bsw2FyjUOVGg3g85DpkyGg0ALg7GOZcOCyYhQ?=
 =?us-ascii?Q?tqLWfjeY/ZVBPHnyQiN44u2a44gVkF79H7O6wu2SYIfFbqMqrvJx3hTj5l+9?=
 =?us-ascii?Q?FDH+hflmGzgiF8ZATwnWCEblVUHH6y3V9oW7kHNt0/L2O8vpZlKmGSgkLl/l?=
 =?us-ascii?Q?oCcTBcusC+boRkq08Xy3FDx9kQ8CBtSkKo+/2GR02lMQCEtLUArdVvh43JkO?=
 =?us-ascii?Q?Yhh3BCAohS2gAuLjsdNrFfqtIkUvWPNnaNjbwmyCYjM4i43IOEA1K569YFlW?=
 =?us-ascii?Q?ghUJwPQyaUgFAuKa9nYjxjeMUBxR58AtXJtNzjZc59CDJyE8ewPAZuka6Hj7?=
 =?us-ascii?Q?U2v2QtblvQqiKENveH0NsLkplVCHkR1Ri18I9e3mWLtKs22z6d2yIQAYH1Ub?=
 =?us-ascii?Q?KbIf8rQwNHUYkQbdG01lqyUyhYrOOyOyMbIfnhdqciW0ZVSVcZ6M9XlLmJY/?=
 =?us-ascii?Q?fdnqLLpqlB8C7mg/8jr+LbA6wuuAzxJzA4fTJs4VdL9ZWnbIFyZpxbjkqzhG?=
 =?us-ascii?Q?Nv3iOfskjlGBeON1qxVK79MginbDpZN7HOsjSuW/7i+YncLDbu1UYhQyp9Ii?=
 =?us-ascii?Q?rvBLP4YlWqQ/D30RmmWN6GGAoQAUNdFYQl8oW4W7Av6PrNIsXnWU0GIgqgWu?=
 =?us-ascii?Q?Vqnj30Z0fOuQ3uPxOXNW85Z4+FssF83wsqR89BV9jJXm/KDm9r07ymeiKjF6?=
 =?us-ascii?Q?qCvIHQUQtaRIrX9qdM9rk88LV8L69GGSoKe/9D5DSyRGpAa/f5MBkuaTBoqY?=
 =?us-ascii?Q?WGaVNKj8LxgQftY0TW8EgN4L?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1232777c-abd8-49d6-c252-08d98f13d2ed
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 13:09:15.6559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jU/jT3KP6ppH7w0Vro0fvCpOSW2webEtp63+zx4Oltmn2nOEWfIwkiOdX5N6zeBaULRmVkspfGdTz04UL770qty7RnyuQ8HCNBDgpi2ZCfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8251
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
  drivers/hwmon/tmp421.c | 44 ++++++++++++++++++++++++++++++++++++------
  1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 606914f20910..b402e81ae5d5 100644
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
@@ -162,6 +165,34 @@ static int tmp421_update_device(struct tmp421_data *data)
  	return 0;
  }
  
+static int tmp421_enable_channels(struct tmp421_data *data)
+{
+	int err;
+	struct i2c_client *client = data->client;
+	struct device *dev = &client->dev;
+	int old = i2c_smbus_read_byte_data(client, TMP421_CONFIG_REG_2);
+	int new, i;
+
+	if (old < 0) {
+		dev_err(dev, "error reading register, can't disable channels\n");
+		return old;
+	}
+
+	new = old & ~TMP421_CONFIG_REG_REN_MASK;
+	for (i = 0; i < data->channels; i++)
+		if (data->channel[i].enabled)
+			new |= TMP421_CONFIG_REG_REN(i);
+
+	if (new == old)
+		return 0;
+
+	err = i2c_smbus_write_byte_data(client, TMP421_CONFIG_REG_2, new);
+	if (err < 0)
+		dev_err(dev, "error writing register, can't disable channels\n");
+
+	return err;
+}
+
  static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
  		       u32 attr, int channel, long *val)
  {
@@ -217,9 +248,10 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
  	}
  }
  
-static int tmp421_init_client(struct i2c_client *client)
+static int tmp421_init_client(struct tmp421_data *data)
  {
  	int config, config_orig;
+	struct i2c_client *client = data->client;
  
  	/* Set the conversion rate to 2 Hz */
  	i2c_smbus_write_byte_data(client, TMP421_CONVERSION_RATE_REG, 0x05);
@@ -240,7 +272,7 @@ static int tmp421_init_client(struct i2c_client *client)
  		i2c_smbus_write_byte_data(client, TMP421_CONFIG_REG_1, config);
  	}
  
-	return 0;
+	return tmp421_enable_channels(data);
  }
  
  static int tmp421_detect(struct i2c_client *client,
@@ -391,10 +423,6 @@ static int tmp421_probe(struct i2c_client *client)
  		data->channels = i2c_match_id(tmp421_id, client)->driver_data;
  	data->client = client;
  
-	err = tmp421_init_client(client);
-	if (err)
-		return err;
-
  	for (i = 0; i < data->channels; i++) {
  		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
  		data->channel[i].enabled = true;
@@ -404,6 +432,10 @@ static int tmp421_probe(struct i2c_client *client)
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

