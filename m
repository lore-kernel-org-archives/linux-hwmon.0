Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28405C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 06:59:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0775D615E1
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 06:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348451AbhI3HA5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Sep 2021 03:00:57 -0400
Received: from mail-am6eur05on2135.outbound.protection.outlook.com ([40.107.22.135]:3745
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348449AbhI3HA4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Sep 2021 03:00:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlV2NuIzFXguyfrpgxYtNlKOGWQ1qWPZUvlyP19Y8WyTUx8fiEL1kB7vee9j96I27gj4ZmnGfqWUvlJgHZVdTcErLhEjR1bV+/qER0Qtt02sXSHYycR1zTHNRth30E1rfoO+GB/AMrm2qS4Sxw7sHe5z2Ly88TNTw/ZwB/zmf2+L9AGGNROAkfiZOZXP4YBOHWr13Yn1gE0sd7CABXk7HcPpb1vXBFaZY+qEAOw2XZH2UffSMLgzNKjys4Et1yEiO5t6KB1kFvyWt65Ein+D6a9fOQFixFlxtTbM4veJR1P9IrgZAnDzMKxSCBJGtLC0ivnmy2Y+SikpDmHQshx0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74iPP5DVTZHAIfTDVRJw+1DPc61X61jkjOJ+AZ0+Spk=;
 b=aXoLepY45kMF5N5bJAiVZ7aLSePTzNFIdmph50cTxVrbwyiJ4tOrU+ed49/aXJZ3lbAro4f3DqginBjtXwQmEa5lBjrOVN87ejE7agI7ZLUzGQEoY2WzCbULWRHUSidefrsBu/5Cwpm2Ga8dY456RibCgpYrkcytAP6mlPBLDvH5lSb9zLzgh7381AGb0B/dVEbTQ5/vV5mbC+aaNctMY8GZqnxbCdkNga8N/QLJ6rnOrmebMovHPHL8TJMEB6FtE4/+HE7ACjGPYmVsDG5G2JaZ0wiiJxd8a6kSES/H7fUztzrW+Rj1c0rUTA6zrEo/2OIaUWs6ROVX444ZBAgGKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74iPP5DVTZHAIfTDVRJw+1DPc61X61jkjOJ+AZ0+Spk=;
 b=f243OSfRkOyM/NDRU5ReAAjxDTLMHeRrbo5c2oViG2hsXcq65y1weffDAZ6VM//ib89k3dBznDIw6jamQ7a+7e3iE3XGZH2/LkAnAz0ZFtXVdEArgrYdgWf0gpC02GKN3HhzqoACwU8l1Wyo8EaxyKl+/MetVz7HY11QLuRwteg=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8222.eurprd07.prod.outlook.com (2603:10a6:10:273::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Thu, 30 Sep
 2021 06:59:10 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Thu, 30 Sep 2021
 06:59:10 +0000
Date:   Thu, 30 Sep 2021 08:58:56 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 03/11] hwmon: (tmp421) introduce a channel struct
Message-ID: <d4beee9a72569a12c686df1c40008607a7af3019.1632984254.git.krzysztof.adamski@nokia.com>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632984254.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: MAXPR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::19) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MAXPR01CA0101.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 06:59:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3c99367-2c23-41e8-faa2-08d983dfcde8
X-MS-TrafficTypeDiagnostic: DU2PR07MB8222:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8222775EF8D48200CBD4CA5AEFAA9@DU2PR07MB8222.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lGnriLVb79iw3VduvbWatdtr8OIBgQ/pDmNoq2ikxDCn/o0BBS9BJN1a32xLNscgWOQr57ylxR9GR5NfvgLWR8Xkkesl/3Scr9B6o8OqYrAxx3huqKDXR89F2MuFYMEryLOMq5KVylwKafinkZkyEIXh/6UqmbuA6xk2Bl25n4jgsu9rMrGwo20QHaqEG5lMH5OzGhkgfo9pXYTcAgMzwvNHq7mOy2NLQ6neXUS16tvF5xGpXac1cQx+myN195b7HML8tEvdt02HLDcwFmn7WqxctTRldXgTGriF2sw++1qb5IOmr4Bt5oFlNZI0nTJpWOdgumOV91QjBv77zsJ+btpmFuyvhS2Wmqt4C1S/3zo/1zHTQHqxF0XCFSbdYBsNQbhMwI/5aRgL8hlitC66TvfQyKCblY7hPOsc+FGkzi1A/KJ6Sn6RkSJlemRWPG/r0lxeEoXT3uCfKIeiC/POONsNqM1IGvtw6t8HMLc2jxEnm25SxuDHXtJz9E2N8/FZRWJSw7Ekx9++6/p3OcMQsVDmhSNr+SWPGWYinkz8yF1KTLB2oGCUpfi26DF511hAXKXVJmc+QL0mCSaChqs2qE6A75NHvvdfp5ltFMaRGzJUDUkj0ihNr7aqrVaJVtSP03cfP89gyRXzc0G+5e/oJPTv9vao0WlBDn1Q65UUmCN0UNIHwtFaBKVlklUYREmnXEBgXy4b8e15eO/bGgLC/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(83380400001)(6506007)(66476007)(66556008)(110136005)(5660300002)(66946007)(2906002)(36756003)(52116002)(4326008)(86362001)(44832011)(38100700002)(6666004)(38350700002)(6486002)(186003)(2616005)(26005)(6512007)(508600001)(8676002)(8936002)(956004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c9blEaHIENk1LyeJ95nUnd7U5hCJPj8N+158ndcfh5s1xN+cZOjT5Stm83jR?=
 =?us-ascii?Q?3sa9ugYsMLuck8Zxv/YNuMasGavuRco4YS/ROW+cqSxfDgOb3D1iv9zEAt/z?=
 =?us-ascii?Q?PhOyiQg8+Sd9nUiidWH0MunvtEW9vx4L4bxMukWgDE7igIBhl5azCMul0Jul?=
 =?us-ascii?Q?tf+Eq4H2I9WkFUkS1rtwPW58Uhb9UvUEtdSOCRVfYb+pCCcdEVUB+GfeUjjC?=
 =?us-ascii?Q?Diav4XCFUfX3BeKYnb4uQywdE6IbWDhbJz3vbdbfNtHiJcKOIM6rtP9b7avQ?=
 =?us-ascii?Q?7ql+28EK/O3iyntsR2gdviDa7+x0aydm+0goz58gkdPOVmdOxJTfzzGLEG8F?=
 =?us-ascii?Q?0NMFcLcT6OcwLAsU6+zgyacnGZO14EEIHrgs69OUBwNhDmLuAjabZ2/QDOAQ?=
 =?us-ascii?Q?Pc7izs8nK3sMahS85J0gIYTkRVaQGtf8VtmD7FTDGgSOoGl8ZiHeeW2jH/p4?=
 =?us-ascii?Q?tSeKYG5Yhf7tcHGe8pkDWWi6lVFvaUxPeKEs6gh4chYS1Iypt+N+XQWgUybA?=
 =?us-ascii?Q?dCogEeOBrf9k7xKRru+z9GHd8R9YT6iUiToEijh8KmHkrUtpjAEiMtJCuXDr?=
 =?us-ascii?Q?Qk2cIE1V4voAGTai9yNDDRgqM30wyl2Fif+jIQqH149620FRl0K1p3apYFWx?=
 =?us-ascii?Q?Jf1AqSVEsoRafy9QjMQPCVYvpbHhiaS861UXpT0tHVMm/ZJRoZJkFO3unRRG?=
 =?us-ascii?Q?6QU7SyOEzofeYKWMgYYSPOm7YUxw1FEnFnDqjHt0nAyIZb9tFWSbrYJ61NhG?=
 =?us-ascii?Q?Xt3uUf8IbbtaXkQjGsUE5v8PZWMpCST1tipZi5LdI8tlInLYw5CzUU0D8D7P?=
 =?us-ascii?Q?Olfk5HRlOWqlcYyFxLNN5Xk+6zmF5hSmpUzfe7HQNuOIotzJlBXAVMcAew5W?=
 =?us-ascii?Q?W5RZZuzBn9tgvh8Fsjww59jr6tT3WwFE/HBnCFLfikmxhWa9CdxU2Hkh8A58?=
 =?us-ascii?Q?40ccpXJ7aKF4wfrfjVseYbg8H0GtXkuPmSRDUO+FnUMzxtasVbeTE0W2Lec2?=
 =?us-ascii?Q?FCyNXqCoj6s51AZB/7hP+VV7hhlKmjvzvY4/NC/vWZtUx/JSSAvst4dsLnEb?=
 =?us-ascii?Q?s/W/nn/p66FoY1hRDEQfcJfoHdTPBjEPoJSvLyqFQDLDPeONeVlfYbQAoxya?=
 =?us-ascii?Q?q4ilj2fJes9mdLuVp/p974yfLd8QEgXriFCsflXs7tZbLzDslnXh3cC5ixCy?=
 =?us-ascii?Q?W0Ykffj0ltNag3Wzkq0mlqTiOer4l7zNO3AMruBOcAUzQuc2UDGBAqvog/rw?=
 =?us-ascii?Q?eBVgA9EIpvnziMPX7PV0tcc59HS8zqA3cVpJKRETdSZjCol3YLjo8JmkSrCL?=
 =?us-ascii?Q?UD5oVMuBcjiXpVwtUS6XTU4M?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c99367-2c23-41e8-faa2-08d983dfcde8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 06:59:10.6473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2QCND+zDmZd9sx+9MVxXS+ccakAyoH2a7M3CI6qe0Ss31zyGBHVcHEVcuUuP31PBYj2Uh5ttqMko3YattaqwOCQ/EUROZrlDvQZwWBz9nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8222
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
index a4ac6e16d592..f3d59ea347e3 100644
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
 		data->valid = 1;
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

