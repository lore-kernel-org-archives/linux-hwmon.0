Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF8CC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB657610FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344269AbhIGNoW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 09:44:22 -0400
Received: from mail-eopbgr70137.outbound.protection.outlook.com ([40.107.7.137]:39330
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344885AbhIGNoW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Sep 2021 09:44:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBYZ+Uqq+9qSqIfWa5qqv3EsZFEYPAf0KX4XcmoAE/rofKK87IMmBLUE7NTt2tSFtzQN2gkK9tHFQN6pwVBaffTlN3fW4TN6oYeF9KkAxVYIIEB4WItUFAV9jNFJRgvDGaAYeWOLw3jdxKsXr0CcCfBILRBkR1QKEoBfU99q7XNQWOyHKHJilIJjJB+QmRTvxHopcsjq6Y2jNNFDgxlm/TWtLQwy3yYMbUdVux/3P8xQllzR/eOtznXYz5H35QTPn0VoNzb8juzLyCc65ykBvTB37KrAX+/rtM0DyGuMF9nvoifxX4+JxwIH8uKK/KBTCjxSQcLH0DLtpHKY3GcY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Hsj5n4wvnvZuHYbuN4wMAzJ/LItONO01vRymeWvP6K0=;
 b=PFa+h8kInLUEMK/eKyO6FUrTyTJZ7pxrfZu20Ipfrj0es81pvqQm+b3xrp9XuFmFf25oq42eeW4yAzCTGAKehP9ulZ6+6XxaHwuHZqAE7cYrMaVpOA5SsbodwohF+kJlvwlNz1N4WHQGySl2VYuPkY54u7yqKyFaLoFzHM5mI1jWFkFS6qGrXY0okg4c6yglpcBpGib8luhWX90IINsHn8ROIWbUmCzowfDpdKqgZTrnPmUdkEk8e8x3N3hmYWpYbmKBrUcKIkD1PSGbtkZQMGcMlanp9/2VlKxX9SMMoua1M0ApIbPxeqKCrXkR98Icm/xIraoVZ6blGktTtGyJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hsj5n4wvnvZuHYbuN4wMAzJ/LItONO01vRymeWvP6K0=;
 b=Mua+t4ZP1c8vMOU3eERYA8r0fDGCXvT1ua0e8F+YTyi0keYLOCERDpaIMGUkan3t+OHZEcy5RoQXJgFlgrOWzseKaG/B8iSK9Tclv3P9iRm8eUkqkgId2vufeKuvukO4JL5KPfPJiA2zmg01J6eff6sRujiZ1xSMPcl4LFdlE0s=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8269.eurprd07.prod.outlook.com (2603:10a6:10:276::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.14; Tue, 7 Sep
 2021 13:43:10 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Tue, 7 Sep 2021
 13:43:10 +0000
Date:   Tue, 7 Sep 2021 15:43:05 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/8] hwmon: (tmp421) introduce a channel struct
Message-ID: <36491db30779131ec67ddd06f3c2bf457a37a16d.1631021349.git.krzysztof.adamski@nokia.com>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1631021349.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1P18901CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::15) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by HE1P18901CA0005.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 13:43:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eb802cc-780d-44d0-9dce-08d972056e42
X-MS-TrafficTypeDiagnostic: DU2PR07MB8269:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8269679BBD45DAFCE2663807EFD39@DU2PR07MB8269.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cKjwxhDjw+ECXhL7sc10FHp5GiYa/Zjew5rtAYgYfd2zAPG9ZWN2ltRet6YwvFhQHfuYLA1AS+MGqsHwmnZ66qBJ4wBShEwKcqZSkQ3Os/hmjzoFeQqj6ugueOr9JP0vflEKY8XRzHMtNYgT1wGxadG825pwlBsvfyaUElAxeFQJltyQ7UIBfShmw2EvSZQLfsKuBYZw29SWxIjNsrokdj3mczdTLvYycFQj94FVVtXYE3P0inzVsuSUEMQ2iubcDQQZgQEPaj+/dvT2hEuHMvVsHaNn9uhl4tcBoS7JQz9VCKEsGbktusVoLriYKydydYs0YFDW0p5/SRyF9yld0PuKF7ppfkJzwPPPjDSU3VkFvw+nJ9hE3BEPPF6DypY3VX3azBW8v8k4zUob27sJtgIGStwyulqL5C0Tp5yn0p4VCy0IvUOhiLt4Sm/INKzUZpvqKn3GWULy//iFDtrSSZbgsIQy6xhy6Cp4UT2j5veT3aQXXJE4ZeGfaj7wVVF7vLhOzB9u5x40313WQyx/40UpwdvmC4VjJYb+qDw3ScjeUtQT6onCJAbh4qvba3HHy1zLD7JLRKfwE8ptBHszDwylFXeAdAaWjc0YOFEby1FkLd0dTL7gM0t8JU160wSU85OXHYVRxs7etX4dDVsJmHLKBOoYA+U8VTqmCAWBWLi6GvHw6LOY+euYdp0e28t8/zkDrJfrH/cl07Jnzvs+VQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6666004)(44832011)(26005)(110136005)(186003)(956004)(2616005)(2906002)(6486002)(66946007)(66476007)(5660300002)(36756003)(38100700002)(66556008)(316002)(6506007)(8676002)(83380400001)(8936002)(38350700002)(86362001)(6512007)(4326008)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6HxlrbUxTqdi9B2RN0mxzOZDgLQzEbSd7DJdJK3Y8wTkq8+JBIzNUQ/Dq/46?=
 =?us-ascii?Q?kgzIAc1tcqsagm07adr8UPtS9ECV8IP7s0aW+cTI+2KQZsE6MpuGOxDjlsCm?=
 =?us-ascii?Q?KCe4O3+RB1oKkknuk29TI/CKmz4WWvNfK1p0vfzB1ascH+ANN/PIx4bose4e?=
 =?us-ascii?Q?pMX8VyCgsaxLSYN/foTnzXtBSihQh91pCBM3P71kO/Gq5pA+4FYGUBqDoE50?=
 =?us-ascii?Q?wWnpWK8hkOXKbwY68HYeZjtyJYMtp/tavgb90urSN99upxMBQ8bhmpzdJ0m7?=
 =?us-ascii?Q?gRjVpFcQTU1j2jow+KS7tjDzlmYQdUXBwxllLoT7Ufw2QH+yOmVpCBx15ll1?=
 =?us-ascii?Q?+ypt/xEi5f+d298gA0CmdP1Ozgbl/bYe+RrePfWNda0EYezY/d0NTYtmhr+E?=
 =?us-ascii?Q?CJZ4ztyfnu+9UhUP5Ns579VAq98fuq8QOXBosMLepxldC7M1XEf2jBM0wdeG?=
 =?us-ascii?Q?BWx0LYPE5Se65TPxIjJZrbT3bNJw0BX2CHUWRjebwoS9W6xpVgRkpCaSh6G1?=
 =?us-ascii?Q?7Rp853Eu/abv0WurHSQ4K3bwTtiYtrhNqfrYr5pnEfJW0nNqlLuLeq7hN4Id?=
 =?us-ascii?Q?St0IKN6rbsuX/AoNYAekYM88IU+yrUZyJEOhLZOK5wOnvBEpBFZAPPEWbwXp?=
 =?us-ascii?Q?PUPbC+eH+pQvJiuRew1ZSVOUqUQu22NIdONNp/nP+h8A0rKW/QDG5Unh1qvX?=
 =?us-ascii?Q?zCr0dBcFAf63VzDDxhKO8DNn6wbcPLX3ORZlZfPh/+1ZAVYvld9150BpiJSE?=
 =?us-ascii?Q?I7v2CeElUbP+5QW11I2GL3xw647yvXY2U8TIg442HcdMuV37Da4z9ZuUWl2/?=
 =?us-ascii?Q?a2ZejBzhBRuJ+bnpIjMSAv+M0P/Vwch1eefeVbxc8y0OGuiW3KqOBQbsypH0?=
 =?us-ascii?Q?lh02xAC0mv9JHU2V90ARW8qIzMs6qbNYlcXHd3QEg1s7z2lDGQzZVYT6xkLf?=
 =?us-ascii?Q?RYv4qAZu6V3ye1PxaMjHH6p/uUGobpWR7z9r9vVpgZ/sfMXRmrTIZdqWN3Nw?=
 =?us-ascii?Q?lvT7CVA/uxmCEjqnTJG/h9waBaGbFc+kLpdLu/LnFBNTySg7SFrIs92BLgcg?=
 =?us-ascii?Q?5MeUVVa7twidLV1zcG2qRBjl6blqGHl/wyaZUUMTe99glOqu1vBSgagPAa5n?=
 =?us-ascii?Q?SxppEmNupHexgKdKLWvOWdDPXYOtL/CB7jknO0EhHlLdx8gbW/vc2OPgtb35?=
 =?us-ascii?Q?qRrz9ojDVK0Qr966BbLJJorQhy0+L5uAVggucRM/kQNBXvc3bv1lB4KeD4Fg?=
 =?us-ascii?Q?b/qPWtAhq0CWsMW1C1Eg/QNgmdNkLWVWepE9o0+xWjgD3dkPxhlHa1f1/qDE?=
 =?us-ascii?Q?NDXoa47MAU76ZidtJxa9x2OR?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb802cc-780d-44d0-9dce-08d972056e42
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:43:10.1132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FT0kWVc6VsHW0DpJy3eNLuyryeX0Z2j8sDhCsHj7+BokxNT705DP6EK4Np0BB+28u440SC7Mk0pvJPsUqKtbLYcA3nlpSRiilqtJGEVqoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8269
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is a preparatory change. Upcoming patches will introduce more
per-channel parameters so it's worth organizing them into a struct.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 2c9ba5fe5f2a..1068fe59df0b 100644
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
 
 static int temp_from_s16(s16 reg)
@@ -134,9 +138,9 @@ static struct tmp421_data *tmp421_update_device(struct device *dev)
 			TMP421_CONFIG_REG_1);
 
 		for (i = 0; i < data->channels; i++) {
-			data->temp[i] = i2c_smbus_read_byte_data(client,
+			data->channel[i].temp = i2c_smbus_read_byte_data(client,
 				TMP421_TEMP_MSB[i]) << 8;
-			data->temp[i] |= i2c_smbus_read_byte_data(client,
+			data->channel[i].temp |= i2c_smbus_read_byte_data(client,
 				TMP421_TEMP_LSB[i]);
 		}
 		data->last_updated = jiffies;
@@ -156,16 +160,16 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 	switch (attr) {
 	case hwmon_temp_input:
 		if (tmp421->config & TMP421_CONFIG_RANGE)
-			*val = temp_from_u16(tmp421->temp[channel]);
+			*val = temp_from_u16(tmp421->channel[channel].temp);
 		else
-			*val = temp_from_s16(tmp421->temp[channel]);
+			*val = temp_from_s16(tmp421->channel[channel].temp);
 		return 0;
 	case hwmon_temp_fault:
 		/*
 		 * The OPEN bit signals a fault. This is bit 0 of the temperature
 		 * register (low byte).
 		 */
-		*val = tmp421->temp[channel] & 0x01;
+		*val = tmp421->channel[channel].temp & 0x01;
 		return 0;
 	default:
 		return -EOPNOTSUPP;
-- 
2.31.1

