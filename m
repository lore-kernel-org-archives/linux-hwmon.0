Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D491C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:16:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FDD16187A
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348563AbhI3HRt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Sep 2021 03:17:49 -0400
Received: from mail-eopbgr10122.outbound.protection.outlook.com ([40.107.1.122]:61410
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348519AbhI3HRt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Sep 2021 03:17:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwazsGUxwN9amLAUusi7BkJx/aOjlARtxIp9aeWQL8p/P+I0cJmplQb4w97lsCIhvA5ZJtcfo0w9ZyzRQ6ecDsNHPmiomWJcljVRvOBjS9rw91EUPye8ufepO0b7gx1PLM+txTyPMuwSXvEy/xu5yJGz+IJ1MeD60s9S5lItY4khLDoqYHQnVLAl8iV+zzrnX/cOq6jDWMGfIql4Axq7aVpEge8E0OCrNLLIc0v+ARqiKWMDWHXHmgxv3RMUMpLaUxyz3VbiGv5JKYpnuOnCHm+oDzUURJag5W6LPq7AJbtOlQyDtetT9QFc5dx4h36DIx5oNhwOkfsIYWP4npxFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTzVM7nyOcqlPpYRirNEvFe3gvjmazQtO1W46Qrx/Is=;
 b=NwiiaPDtgAKt7rSYHBz/U9B+dWRgdurMOkV8Q4vdCOgoBsI1/KxEpdFUgM3VZm7ydBnQZ+gi4DgDoyYIoxTbHoAH0TQpsqCKO79tAtlj12aMpFTcvBGCIjr9QPIQChIwIXl9z59cKXSmL9M6IVdS4WmgYHi6fbRrDm2RB0MhuXyXvGFfocSXvtuSxHVT5LTN5hh80XYPm0ozetzYmsrezyK4Q9uRtH3yHK5/0vPhw5Oat+MwdIcqCsjwFXDtxifrMY2DQfrwoNYQjLwbSSr0Pb2OfzdiDD/nuMRL9/gOOU2UEy2xagI0jgxXrGW5dJZaGuk7VRb1M3kuu98VyKXn6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTzVM7nyOcqlPpYRirNEvFe3gvjmazQtO1W46Qrx/Is=;
 b=PtRV8VgijyV/YNhZiLSW5mSI5sT5cGQI2mKvbkWykxo6lJKCPHjBe1aoTmj0aszqChIdwx5VPXwMC2W50DbD3p1RWWyz0gGD7JVM4mzompA6iPL4jVXZhOvwYo+R8gdOxbL175shVaUFJcDDTdpjNOfPnte0GSLpsCJG68ZWnkw=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8331.eurprd07.prod.outlook.com (2603:10a6:10:2e6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.9; Thu, 30 Sep
 2021 07:16:04 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Thu, 30 Sep 2021
 07:16:04 +0000
Date:   Thu, 30 Sep 2021 09:15:36 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 08/11] hwmon: (tmp421) support HWMON_T_ENABLE
Message-ID: <f86b75e58b05a7a60150b9c641ea1d628c1c4c06.1632984254.git.krzysztof.adamski@nokia.com>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632984254.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 07:16:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11784321-863e-4f7f-7796-08d983e22a24
X-MS-TrafficTypeDiagnostic: DU2PR07MB8331:
X-Microsoft-Antispam-PRVS: <DU2PR07MB833186006471DC353B4C4404EFAA9@DU2PR07MB8331.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tjw7lqk5K4y0z5HDW/DiGAhr8Uo2DZ9M47DK/JnbykUX+TNZm/74ifdijo47/ap5wxF/W05tugsjTBiqNhnTkJQDS+/j8cllTitI25BhfdWNRjwi5WtY/O/kqz8Q03mNsaO8EHLaKrx9uY13pLhrUAFstVCdzykF9Asts/Oh2Z8fZX/vstJjkpBjBsjmw4kFPa3VWPnwKoWZXtq6UllcgbtU6ycoSe5Ux/O7tH5T+afcO/qcAUGMrAhNbb1HNzwQoYoaIL5lQu728//1EkXS9anjdIBztw9Tgctz+n46mZxpxOXl7eM41od9SUhzjuLQGjGwE2XhUOE8ysIhUqLCtfFwHxOhJhvPdpgcSdxaFUEiT042pkNGIgMvkwx+j7dS7zoPaR4U9MCLS+DeEmfOGqwghZC9cpa3IKnVBlZpPnHZVdwVzTJCJApxz4btC3oTWOx3Nqrnb4Hr6YnSjM0h+wOFM6M9F01TnULgeanFRSlTUr5PB/Q7UauCAABVsZM6uZqwXFKuUvLoP1r5xisOtmm5vBSLiZd5VE9hyEk8GlBjZV7/NtYoh4nNkacDyPBkvprhpb7wEQsLXlP+eJFWXK7Ezhmyr/giu2BNx7QKJcaWjuIWt6PRhDg0XPpJ+HSMFm+UjpETkDhybp/Vvkz4jr5imtVlludDlQKS81Tp2atkwInSL2Ff/7+WD1Ld4bYh8wfj/2SKrMGoryd03/vqRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(6666004)(52116002)(508600001)(26005)(6506007)(8676002)(110136005)(66556008)(66476007)(66946007)(6486002)(4326008)(2906002)(2616005)(956004)(83380400001)(44832011)(38100700002)(36756003)(38350700002)(316002)(186003)(6512007)(5660300002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JwIInhgBN8yum0gmej9A58mj3J5JYQjWIrD8FV3LDJ8ug3PqKYHs8mbZau7y?=
 =?us-ascii?Q?sgQymyCbtNXedTc+yyX09GIhUm70Ew0Htc3TTQ0XcV0Uq8Koim1uU0gWI6jV?=
 =?us-ascii?Q?tXoJdsEXqwiHNL6U9Dpmj06NBOUTySGwoMZeanjqU33LGNP4AahS//giPHHZ?=
 =?us-ascii?Q?YfiImCbgxd4QuGXSSd7RNqM+6+0YowsLzz+pDta1GoXogfXGl/GIg+eUov0o?=
 =?us-ascii?Q?TjTGAcoM5jVGhGNWd3YN6cEMu6txwYpgzeDNIMuamuFoRD9Cbb9QmLUxjMSg?=
 =?us-ascii?Q?foo96NUlyWauNgYELbZAyUQDULgyHF1V1RSlQZs0ZFySET/XZoD8Us/QOjYT?=
 =?us-ascii?Q?0rNXRPwA+vE03B4iollvkwkOLz/KAev8xdk32/dW6qZwRcpfPM3xC1fulFib?=
 =?us-ascii?Q?K2lmTSHEDwg+roneMKT15SUXeNdKsHr0xSihLMEOyGcLsJumwJU/8IaJJ8DH?=
 =?us-ascii?Q?6AGw5zt+L+dRphgc7h5xYbR710MPL5K5W7EpAFlIwHgtdKDbKGfye3HTKvYW?=
 =?us-ascii?Q?RjqSUQ0lB24aOJfCs5PMIpCunoUUREEHsYEKjbtrfkTzc2S+f7p/9hQn6A5C?=
 =?us-ascii?Q?8Y4oFB6Ng2x0HsFEri8bappBrahWl7tbm1OFZBTXEv0TCxb+cTkPEKdbHiY6?=
 =?us-ascii?Q?7ROpB8yu78pbxealPUeb8uDGwi98IkeRsPXZZ5tf0dC36Pv8Rv4aIZDbBXKK?=
 =?us-ascii?Q?8LJZAw9yzNhByS8yKw1e7MftYH+s90SOhZI0jU1MvBdn5vBVcRbPC/tMMWwm?=
 =?us-ascii?Q?AD+9ElVbbiewtgBZsCWVm0lTASadFh4Y3P/ye6iPD/U4PKp+IDH7JXIvMSjN?=
 =?us-ascii?Q?Vm1/5U6aDRFs4i/kVqy5uo6dpRrB3HfsxToTKy6N/9mb3LJ4c7GF0kIo7A4E?=
 =?us-ascii?Q?3EDFWzyedPMYLGlqtQ2KNA3bVYBPc7Lmd4VW4euctLTmZbgNRk0fcrRr8MoG?=
 =?us-ascii?Q?Rb0VHnKJUwi88HC777uY6DqqMlT2eTMna339Kz33NWETsrTW70MGiWNWZ0MY?=
 =?us-ascii?Q?Vb62dKLu8lDVPyoSIPfBJWUJcQD/gob8qop8qClMydfDOEno8zyg2RJQN7s8?=
 =?us-ascii?Q?VjkvOPbxAI3moSOJFtrAzUu74WLYAUv3q+XY3SWrnXCAfeNC82RbIYXVKADa?=
 =?us-ascii?Q?9Fkb+4aDN1/O3fJsBmqUk5l1S73xTeMufXj/NGDOKnFo7tkmhEWKv94ko9v6?=
 =?us-ascii?Q?JDNgG/KHaMHQcs5rOvaVURK3dEa6JCqrzwDZFybUtblATNHATOaDbZxS4JOc?=
 =?us-ascii?Q?qOqZr9lZrTGyCeOIy24V+PhegDVBLKp9iOx/0y+t/ySwPVTfXIMMTSUJue9P?=
 =?us-ascii?Q?9xTPwKaDdSyr5/3V5GxrM6Lu?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11784321-863e-4f7f-7796-08d983e22a24
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:16:04.3691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iTdoPKPMyJVHNwBz079ocPuR5dITql28EeM+lWo+2yNpAL4uZRrOQQ8Q76UzsrP1WPvJBRjtOjAYB72/BK2eIrvd/qXYkOL50/L6Dthoxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8331
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
index f9c6f23f1f0f..66ef9c5d9a52 100644
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

