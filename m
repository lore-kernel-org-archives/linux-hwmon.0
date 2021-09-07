Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07CCC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:46:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE063610FF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:46:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344844AbhIGNrT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 09:47:19 -0400
Received: from mail-am6eur05on2116.outbound.protection.outlook.com ([40.107.22.116]:27361
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344814AbhIGNrR (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Sep 2021 09:47:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUw2yOd1gzkxksVlWNslHjQfmMQWtpebO0gPn7jcqbbSo7Q8R5HohZAgRLggoOnPPoMRSUsSCZvBi+uJEFNSDUCf+BkaPHt96in6OqrK9c8Rvi49EScT/6bP2cFpQB7ytpZehBeRK+YCNCv9N9RymvPu+INTlrwwnMAk9Jw/D/wKZxHd1Uy66UHaN2FCRdUVtzjHFeAQ6GzZi2lQKZ3B+YjpP9VQzzIlTpq9nlNeIHNqrl3sklmOUWIdTQcJk1Y21EmAb34rmRY5wRTLhTKsIdSgSNigmeaq4aQMY934glmmnE3Lyfgin19iQZJIDQvsPnz0cNzmaFkhNfzU+QPL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=O6SdkTVIKhbyDQHQPQaG259ifhNybU44H7mclDhDEaY=;
 b=JgqTqSevRMRPjEUfK/B5zo1Vx07TLz3t0BhLnp8PJycv+7NDBKbqVDNW1rA9OG2SZ02DGKTjycPI0VfFDpv5+wi/XQRPk6M2byWuMosNXZxh36VrHyBVaQQF51KN9EXYdYzHi8wXnpy1R4L2CxMeJLR4DlRQcHualGmfPz2Elk4GswYK7zAC5o6SMtFsJgUyVog+sb5d89Q1XQmnM1kMe1OIa1WpjCTYdIxYgO5/g/5SWJNTvFPITV80d4hQ/oYyHaECJNxMACvKjVf1sqaBhUeWgbcQxhPcgA46VZHumAIXnVNBejVoTnc+7hyfLVB2xMIBvp3wG9XZSu43ZJdsYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6SdkTVIKhbyDQHQPQaG259ifhNybU44H7mclDhDEaY=;
 b=a+pSNp5XKc/fZzs7+sAEoUQyuq4pmLrhddYrwgRxN/lGKLZZK4Zj4vM5BE+sYSzPa/ayLFhd8SQjT6scXGWqawME8F0ZIBBuvk9ohmFULpdHWk6pSxCKmoa9XH68FBoUPSWc8si2MoaEWQEUJE4OslgG8FeXksFRX88YePh1QXA=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8303.eurprd07.prod.outlook.com (2603:10a6:10:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.14; Tue, 7 Sep
 2021 13:46:04 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Tue, 7 Sep 2021
 13:46:04 +0000
Date:   Tue, 7 Sep 2021 15:46:00 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 7/8] hwmon: (tmp421) really disable channels
Message-ID: <d0a1be24701dcf19a2f7501a9bc7fddf2b739792.1631021349.git.krzysztof.adamski@nokia.com>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1631021349.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1P18901CA0001.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::11) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by HE1P18901CA0001.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 13:46:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16b78887-2f8a-40e6-e2b8-08d97205d60c
X-MS-TrafficTypeDiagnostic: DU2PR07MB8303:
X-Microsoft-Antispam-PRVS: <DU2PR07MB83034DC5CA130F6E52D21347EFD39@DU2PR07MB8303.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uLEUzq4QRNdutS6dqOTdFobdOC/hoGVQKHsbTU0Kxk1kXSgEWhAogBHcfW/U02E0UvtI31JpUs+5cdxyiR65rQ6Pq1Y2/mhTKVhduuyzTLFT7z/njhRhXOyk28iwPla5y2JOm6m2Ml1tCtL0cySF6z/JAiyNXSG63RD0B6Ae8Cfnj/jLFkqJIzXnt2U9uHoKsG4sM9f2B2BrA8gZYpMlDx3/UVC7ecHqz0d9q/PSUtToXpOZYyu2FKchZ/bzceF/Hcfz75xcZ/RcE9piIA3JnVFzAxfT6m4rFdDnTzIEZ5Nc1V7WH/nsgkL3zgE7rKD1mvS62dYtRIT+s6Qv3A+2SbH8gXK4dNc7MMYVfoeSIcuTaf+qDbBr+ng4ytUtv+fjRbuMq+5RRyyQPibQce/S2ffQ4PsgJoLrXppKXtjskK6+ito12+6hKNBFAhgVLuZrqcACMZYP57WCjz3Uirg51CETUwW69rJlt3lYqg94t5yITfBWEA5ziMthdvmBJr19Bri9ryK9X7bAVSpNyaD49TSDzpETkudbS5TZQqDlx3mC7liSsRs/nlhzJIx2Ce1sD8b6gUBRitgMnThRHlZvERCykbERj4/M2NE9Vptw+OJ34SXViV/b1HVMEEX26VWMlK2tkhJmEvuoGyo9g21X8YNfLj6b2YKrgfdgvripqi1Cz1KoGIMnsHvmBtbnpSKKLGLoqceYyMJTE/PnSj4jtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(6506007)(110136005)(44832011)(6512007)(6486002)(186003)(4326008)(478600001)(8936002)(38350700002)(8676002)(66476007)(52116002)(316002)(66946007)(2906002)(5660300002)(36756003)(956004)(2616005)(38100700002)(26005)(83380400001)(66556008)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?39SQBu2R73tj1eWX/alrhdE0w859+d4ISbN8bgiaUZM/agW+6vQ/sDelIZoq?=
 =?us-ascii?Q?WF+iqZ56bXFP3lFEBy/WOrRx5JtIZU4sjl62vNfase4OV7c2haRGDroLmStb?=
 =?us-ascii?Q?0A97Zqs8RdH2jdcL3Tl6jW3DWLydiCH4at2dJxp9XJMkNkuM4ObulPCC729Q?=
 =?us-ascii?Q?1z4LqFOG/pN56g2QLFqoDocEs31JhS3PnG/4I3UM6gnS12lMVfr9and8SmYN?=
 =?us-ascii?Q?9xDHDAOFZ+roQrb7Vz+TvGOOnwR0g1CUpo4lAAe57r1B0v9gIzteOYkOtEWu?=
 =?us-ascii?Q?aD8t6dA150cP2OmZJNX7iiDlnj9neKfD1WSbnMKEys+Na+dGhWKuzubC1fv2?=
 =?us-ascii?Q?VSmb8NhSA9NEmBxxv8VtYNIy9krVx+dqeZbwzY/EOND6J4KULOjIJXPByk5J?=
 =?us-ascii?Q?63SwdhFw80IjEsd8Csay4Vqr7YGxH1Oh09jCN5F7BGXl7abWwVKXgWHnDAH4?=
 =?us-ascii?Q?1D+JjhHCf/1Y8J5/KvFUnAYQQTyEpy2+VTX37Ezphw7LaP+762Lj/F04jJZc?=
 =?us-ascii?Q?NCqrpttUYtoMIKbPvyQK/qYDxrXRHh0vC+aRuzadudX6eAmok8UFx+cNIMDP?=
 =?us-ascii?Q?bTNmCsahChN9oZaIgfe7dJUIozOZ2hPeXVEA1HRYk/TlsA0bbzxWqwU4K5bn?=
 =?us-ascii?Q?hjPaESd2dUDYqI2kR8h8ET0+94ltXrtSaJv4iMTlleVjK5to/WigtL7Qr4WP?=
 =?us-ascii?Q?B5O4AEZW59MvPA4Z+DZXG6nYtbEDp7yKtU8gfUrK4Tx0ABSW057AP5xSz1MX?=
 =?us-ascii?Q?mCxeQ3ZD6tYLWt8DSr/We3ne3JYkBmIR6LZK4BDG8yt1xdzo9wnm8qEpT4ut?=
 =?us-ascii?Q?ZFKszdJRpKISABa8yhyaQl5q6D3zdipkL5hjBROXNQDBR3x/h8EjgxctSHYW?=
 =?us-ascii?Q?O4t3WVOk4a5HKM6dA+X+646bB6P4nudr6c43DcfkrG5eu76J2pjKaRPawtwc?=
 =?us-ascii?Q?+ZZ4FfuNiteIGCEtulz9zNYqXcYmLdHoXn+jlp/uvhpiqJ9EeF8Im2w1H0DF?=
 =?us-ascii?Q?0kZm/s/Lyrz1ATzj8zOMOeSTNMsKogy1uiOHM1/6OtBeznXAbvrD3Fd8GAI8?=
 =?us-ascii?Q?zwKT0tqTNb5e60E+3xDBo2JBp2uQ667h1oixOhfgH4CKQm15NVOE+0+XO0at?=
 =?us-ascii?Q?H8efW68nt87ipGqTYJKbklEgHoDw1UbbaiDvxJPg5XStvpGNmLPCwiAR4fPS?=
 =?us-ascii?Q?26fm/tO7dOSWm6R+YKx6Fw99s0f3KueaRV2s6olUNqYrfogwPxfEvdyOcR60?=
 =?us-ascii?Q?lfBa3jQ/a6gnaM+SKPFJmFciwKzZ5NB2YKhJVmCGmp1CxbefdiN94syeZu/D?=
 =?us-ascii?Q?j0CIymq+1k4z40bTzInvQdQK?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b78887-2f8a-40e6-e2b8-08d97205d60c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:46:04.3427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMqjRYzdC8L9/Top1IGzLXhCQir2dM56TckIOp6DYo4eDJ4RNZC1GgMh1ETP2nM9jveZd25+q8/SwuefvEkW8XVNA2zuFe56mzboijtLLNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8303
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
 drivers/hwmon/tmp421.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 90c6b094785e..cec25fb1c771 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -33,6 +33,8 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
 /* The TMP421 registers */
 #define TMP421_STATUS_REG			0x08
 #define TMP421_CONFIG_REG_1			0x09
+#define TMP421_CONFIG_REG_2			0x0A
+#define TMP421_CONFIG_REG_REN(x)		(BIT(3 + (x)))
 #define TMP421_CONVERSION_RATE_REG		0x0B
 #define TMP421_N_FACTOR_REG_1			0x21
 #define TMP421_MANUFACTURER_ID_REG		0xFE
@@ -351,6 +353,25 @@ void tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
 	}
 }
 
+void tmp421_disable_channels(struct i2c_client *client, uint8_t mask)
+{
+	int err;
+	int cfg = i2c_smbus_read_byte_data(client, TMP421_CONFIG_REG_2);
+
+	if (cfg < 0) {
+		dev_err(&client->dev,
+			"error reading register, can't disable channels\n");
+		return;
+	}
+
+	cfg &= ~mask;
+
+	err = i2c_smbus_write_byte_data(client, TMP421_CONFIG_REG_2, cfg);
+	if (err < 0)
+		dev_err(&client->dev,
+			"error writing register, can't disable channels\n");
+}
+
 static const struct hwmon_ops tmp421_ops = {
 	.is_visible = tmp421_is_visible,
 	.read = tmp421_read,
@@ -363,6 +384,7 @@ static int tmp421_probe(struct i2c_client *client)
 	struct device *hwmon_dev;
 	struct tmp421_data *data;
 	int i, err;
+	u8 disable = 0;
 
 	data = devm_kzalloc(dev, sizeof(struct tmp421_data), GFP_KERNEL);
 	if (!data)
@@ -380,11 +402,18 @@ static int tmp421_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	for (i = 0; i < data->channels; i++)
-		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
-
 	tmp421_probe_from_dt(client, data);
 
+	for (i = 0; i < data->channels; i++) {
+		data->temp_config[i] |= HWMON_T_INPUT | HWMON_T_FAULT;
+		if (data->channel[i].disabled)
+			disable |= TMP421_CONFIG_REG_REN(i);
+
+	}
+
+	if (disable)
+		tmp421_disable_channels(client, disable);
+
 	data->chip.ops = &tmp421_ops;
 	data->chip.info = data->info;
 
-- 
2.31.1

