Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA6CC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:27:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9E3961056
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:27:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235600AbhJLJ3E (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 05:29:04 -0400
Received: from mail-eopbgr40096.outbound.protection.outlook.com ([40.107.4.96]:8726
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232657AbhJLJ3D (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 05:29:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0SqYXXfcjRro0MvQ8zf6cYF2gX/RQvJuoLTBDMA05NnsjmhwyIYxM8YuUwoG9ZKEJY50sZ7cXhp0KMZL9P8ZNgh3DpPiTBTbWRuGytHd0uyUY57qFZnxNbhwHXqMnKPyiAM/iLu9tQ+dSBoUwpBK5FxL7+9M85G1gqJr2MXi221ucf+c4CeJ6TxBYuQuhva87aqp4C0YYyPezl2xw2gltZ6eYXxoiQAwFKFuMIBBrDoibO6KlUrcG1V2MRAdmhZJcRMEb93Qe4B/hJ1DFcVOrmmryt+VVpVfchILGhNga/261kPh+QRIeZNgzMP5P5ciF1gdGBfQ0PdlaV99v0PsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Od/xhj9MjLvORikJ1GibwyjkvprzEqO1wDKrnplX6SY=;
 b=kBwzzqkgp4TZ4c4Iritm5A/Pm8Xe1bXwvLNFZcpQst5hh+RYg0+wB1WuRWIrmrrNxgy1LwfBUAojZA1mTo6hjAZBfu8Pa1V7MAr+hDoYpL6q0Xy4GMMB0NKI+DWYsgxIdkj2rwohLvSZP8P5/QxYBiZUVpryna/tqm2Fm8/16rfr95ys3HY38hORai8bZeVmyTAykD6niExmeeYoUoC7f18GBzXfxbQHj9jL+zWkxwjefYdFnz2xNJjTX2VQeTcRiZAvWbHG7haN8n9F6SJeQXUgThKLKdsAo4JTwztfJZns4S7LM9KZJkYHsVW42rbCP0678dfalrDeRpLXzuuhTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Od/xhj9MjLvORikJ1GibwyjkvprzEqO1wDKrnplX6SY=;
 b=nECrd/Q3K9/WsXquOVApypuffAQZKg9QeQx9/cDHshmeHjluelM0KcdkXdxzRZMtf3VbS0mJDLYG7B5l8jFJqV2dkp3gDWPbMmwrP6qGyv5ytUUdXpBQCQy1++XQdEAyzky9uAUO732ytgUYVCDszx7cuS2ooTpfcmHLpU1BqHU=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8070.eurprd07.prod.outlook.com (2603:10a6:20b:359::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.9; Tue, 12 Oct
 2021 09:27:00 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Tue, 12 Oct 2021
 09:27:00 +0000
Date:   Tue, 12 Oct 2021 11:26:55 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 02/10] hwmon: (tmp421) introduce a channel struct
Message-ID: <baf34d95983a6b58a3e39e4c098e5979e541572e.1634029538.git.krzysztof.adamski@nokia.com>
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1634029538.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR0102CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::25) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.15) by HE1PR0102CA0012.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend Transport; Tue, 12 Oct 2021 09:26:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14e3e0b4-d30b-42d1-44db-08d98d62717a
X-MS-TrafficTypeDiagnostic: AS8PR07MB8070:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8070BC5A5303C2F734099723EFB69@AS8PR07MB8070.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: idt66ugfZu05wIs2JEbHSD/k5hB4I8UPNIEC4i1OY/qKpIxh3poqZg6tn8eZh8tyALHgIOKUVIV0D10t3bec+hsCTXLnvW7cQblEWL/X9gEBEvzsDB9YrQ5fF+TFYScUAiQ+zusVI1sLeiZJKj80loNswljGNAPlib8Ox1EyGBa+kL8C3hkn9ayEcc3yimT7X5oEJCR55P0PqihzKiZvxpmpi3jtAbuogb+HU9IgpI9Im/PzwHw1+cQcQPvrllLqDS12CQi2ytKYmZJtveERZjakiZ4ADKFWfRE9AeUfZ4b8Jftd9/O7aNBW9p/GCUHDSIhfj2o4UW7ENv67d50YXlfQ0XilvxkUz9429WdWQhsNZxUGOJ+7Qq9h9FxmZHcz/qsdK5ApTSFlksRTXIp5b87kMC4Rzvafl609kBsQ3Y/OJrPYFB1PWUWOcpWI2MVkCS3n1pbTD9tlIBkaROvHTNqzYmG9gM8gsz3xncCQutn39cLv768hcpRUQYIXtsQ2BAQpu8H2h1MYEGjaY9KJ1P9pOShuvTwoZkjDQNvohBUvKRvu0YB8pHXQmmMZT9TV9ZIkDImVLFMathNretxkN7AnXPGCiuYKcF1tUR2+LPJq8h+6jpOpGW1TpjiuxO4FTM8XD47bMjnFsdHWxOKumJuIkrQa7knVVfHNQ1ffvuyvj6Wl8fD/0G3LIxrmcm5c1y1jtJ7ftci072ACtysCvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(38100700002)(316002)(508600001)(6486002)(66946007)(66556008)(66476007)(83380400001)(6512007)(6666004)(36756003)(5660300002)(110136005)(6506007)(8676002)(8936002)(2616005)(186003)(26005)(4326008)(2906002)(86362001)(956004)(52116002)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?px4R86vN8JrzYEKZYJGQZLQIhRjILaU6x4PBe5uMboORKFFZjwiue6EvM+W7?=
 =?us-ascii?Q?X4ZgLKljPakUDtlbT6xqWbioRw6biHKMcUVvz7ePtx3cau32a16DBziEcufx?=
 =?us-ascii?Q?jo3gZxQJ/vn+gbM2auOVkxNEs5i0RoUzEj16Zvsw7KmzBDcpy3aY5eP6a5my?=
 =?us-ascii?Q?LBUpaKQFtIneo2X3Y0lbwxQeBrcI6FrOCN41FJiNp1sKII3ExpSVrj+PewL/?=
 =?us-ascii?Q?xE0aisMP4DEbx92oLR9bOGjE1ABqGzR9VKXvqlUrb67un6Ho8C/G7TzvzHcP?=
 =?us-ascii?Q?/w2eXouJtzOLiVamyCCiS/PpxVuedLegRdG5X4ThXITpgHyMtoX3Lrt6qYY4?=
 =?us-ascii?Q?JBTrPDXU0LZhkbzM1sCh5shy961C/euUxobUTd01+EswIQ4dSTfQODRaedUW?=
 =?us-ascii?Q?/v0jlH1B3F0E/de3VJOY6A4YihLO2gp0sOkHa8k06TVpLs0JwejryyV/exDp?=
 =?us-ascii?Q?OUBfutZy7NXZXLHDqMEYZmFlssGLFK7rmyJqlD5gH1octku+1vM9+47DoXNN?=
 =?us-ascii?Q?p4QeLtG9EiLrr0HsnOiU/As/XNfWLpyhAVzFsRiP6pr+VVtL8Di8cV7gcviO?=
 =?us-ascii?Q?Rc8VgDXeneT3PWgxHlQleCaFEVQR3p0JPOkdgFp2Z8VSQMTPDaU6PtlWaFw+?=
 =?us-ascii?Q?1pU5sCFbTsm9Wq/1Nn+W+T5rvpiFCDkGOotSi9LtdD5WOh64JEI2AJgaaV8C?=
 =?us-ascii?Q?YCNXWbAxYqyRS9qXN+GQRmy1oex72dXVZIGKu2AbuBXnCZJmSJCHSHakzPha?=
 =?us-ascii?Q?g/0yLrIyvykAygAd8BErn87eQ+ilylJrOmbjNBsisjgYw70CrNi1as68GmZS?=
 =?us-ascii?Q?JKDqihf/EU5WUeDBWy8bKfuowF12GvEl0jizSsfU4WQ2kQcyRL1r5M7GPlN8?=
 =?us-ascii?Q?t98y7FRPPcFkarCnIsBZ4GArV4oFnxL0LFjdc0b/l54NEpukXCCvwFeFLf0S?=
 =?us-ascii?Q?VuUj26LQRQDFaECKl7kPIbSwstCZFef/wPhZsjLGSeVZ6IURH5auFyTj3oAh?=
 =?us-ascii?Q?ccEntibbtu00pz/ofnLrPfDJaTUtJTKlaJNs6W941IHAPRLO07aruLrLtH0M?=
 =?us-ascii?Q?PgBZWcSY9T4glinMFoCSroQT/6gYPlLGtvC79IaHS7jkyoNogpF3LxWWNRuT?=
 =?us-ascii?Q?Y1YEvTXxh3w4pLy2FxkyGBWH/5IWtIZFUXeMYY6kSvVsxKWWRR/TNxC/XYXE?=
 =?us-ascii?Q?76h9S1pjnvnB+ykEI9va7YDz4idUTMmLQkwkBlxXhafojBGlFdBXhmv5zb9+?=
 =?us-ascii?Q?62bD3jtMg0fOD6ildj27B5KvpHjdLHGIHStyYQbMzQzkgOGxUTMN8WkeggQP?=
 =?us-ascii?Q?sHnXbEMVxiVZuub7kTa5C1MS?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e3e0b4-d30b-42d1-44db-08d98d62717a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:27:00.1219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLLKumcoHWdqj+2AdVeJqntHBHXzUkrzoes6hXhdnTo8TdbTobiYSkhVl9lGwR9nK+4JUYHhXsH/HtzeyoeEON/VJq56zOaA6bTSzg0C7Hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8070
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is a preparatory change. Upcoming patches will introduce more
per-channel parameters so it's worth organizing them into a struct.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 356c96c3588b..707310d616a4 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -87,6 +87,10 @@ static const struct of_device_id __maybe_unused tmp421_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tmp421_of_match);
 
+struct tmp421_channel {
+	s16 temp;
+};
+
 struct tmp421_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
@@ -98,7 +102,7 @@ struct tmp421_data {
 	unsigned long last_updated;
 	unsigned long channels;
 	u8 config;
-	s16 temp[MAX_CHANNELS];
+	struct tmp421_channel channel[MAX_CHANNELS];
 };
 
 static int temp_from_raw(u16 reg, bool extended)
@@ -133,12 +137,12 @@ static int tmp421_update_device(struct tmp421_data *data)
 			ret = i2c_smbus_read_byte_data(client, TMP421_TEMP_MSB[i]);
 			if (ret < 0)
 				goto exit;
-			data->temp[i] = ret << 8;
+			data->channel[i].temp = ret << 8;
 
 			ret = i2c_smbus_read_byte_data(client, TMP421_TEMP_LSB[i]);
 			if (ret < 0)
 				goto exit;
-			data->temp[i] |= ret;
+			data->channel[i].temp |= ret;
 		}
 		data->last_updated = jiffies;
 		data->valid = true;
@@ -167,7 +171,7 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 
 	switch (attr) {
 	case hwmon_temp_input:
-		*val = temp_from_raw(tmp421->temp[channel],
+		*val = temp_from_raw(tmp421->channel[channel].temp,
 				     tmp421->config & TMP421_CONFIG_RANGE);
 		return 0;
 	case hwmon_temp_fault:
@@ -175,7 +179,7 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 		 * Any of OPEN or /PVLD bits indicate a hardware mulfunction
 		 * and the conversion result may be incorrect
 		 */
-		*val = !!(tmp421->temp[channel] & 0x03);
+		*val = !!(tmp421->channel[channel].temp & 0x03);
 		return 0;
 	default:
 		return -EOPNOTSUPP;
-- 
2.31.1

