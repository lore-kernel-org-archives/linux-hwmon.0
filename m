Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2CDC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:42:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0295561100
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:42:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344269AbhIGNoE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 09:44:04 -0400
Received: from mail-eopbgr70125.outbound.protection.outlook.com ([40.107.7.125]:21476
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344638AbhIGNoE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Sep 2021 09:44:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcfE12/98Q1d7TvQeC25s/8PihzkdR5OxmZKqmXFE99Di6fLB5gbo3KdSXnx/hqSRr8Gpa9rd8+bQipirrbQtbrfdVFV0M1+uqKPRu46o6hRrCc6//Jnc5z40OaFF5Yxybx8kv7BWk9AXzN+tUpdy4SI0LY+pELJqIJOd22nCTrB6BqW/vA5Yws7J0H8bfYKcO6L7Xs534cBteV3yM/RsA8TkLH6+1aeNIkpxun7/JhrNyeG8c4IqELsaZ6SB06cnyvHXnG0AbKppaiX4R9NqIO5RJnWM8bwFLUXcusMS6bcY1mwDzmUplI8wxMyKDXuQWyDoQwmeZK7Xf7KpZbZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oJw0UupXIputVH7hbfREtC003S+N9JoS9YRbn0pt8sc=;
 b=FAH8mzGOC1F8hXTLE8ELcDYoJ3IdEBI3ArW4iUb5+GxltJpWtqiTAU/TxU7pKPwPwzYdU91j7HzvsV9F7bcAdJl4AKmTGOo1df1n9+tmhwf/tk+ACmhJFAgPDa4pYK8M9HqXE1/GTfnUcAPPbNC97lLlFb0P8gijiJT9sN8axERA131Pzl/acnRMq18JS+/AXbdDII5/scNM3UMEOZ41JYs6WT6kz75MS383hs1SxgQdaf57DpPScNsuWTHRZt3qXGomW48L60xBYe8vH01Jhw0tZBZmUCv+memrTQL+zhjeEKkwtz0mDv8eueIiDgbiiO7QzUbaWFvNzccGVlL8NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJw0UupXIputVH7hbfREtC003S+N9JoS9YRbn0pt8sc=;
 b=LP3f24u3r5RDd2w9xbUDjHCJineN+4bHxE07L66gOCDaF8dGEDWPLaEAdLEaNypqWiAO2EUmQUIhKHs2jz0BV7DeSbMnkI4fCF54pywIq13lhjN0IVL9ry8DqL2jGNe5OjUc0iHfR64AQ+dfDTLRVVAFpgLrm3a1JlkGGiI4qNo=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8269.eurprd07.prod.outlook.com (2603:10a6:10:276::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.14; Tue, 7 Sep
 2021 13:42:55 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Tue, 7 Sep 2021
 13:42:55 +0000
Date:   Tue, 7 Sep 2021 15:42:50 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/8] hwmon: (tmp421) introduce MAX_CHANNELS define
Message-ID: <b5889860f02fb6806819718ee3bd48f0c783bb73.1631021349.git.krzysztof.adamski@nokia.com>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1631021349.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1P18901CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::13) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by HE1P18901CA0003.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 13:42:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67ab7ac6-72f2-41ca-b4ec-08d972056550
X-MS-TrafficTypeDiagnostic: DU2PR07MB8269:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8269243E8B84D82833AFC6A4EFD39@DU2PR07MB8269.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nJMWu9Q1vAxgDis3G198FAqEmQZQ2LmzluoNBYmD+nQHWhDOa8JAaxAKJxyTvqawcA3je0kEfCuPHfM/geryz9UCMbhWFi6slisIny9ZBGt2XhMogiI2oh331mAUrL5UKz6PX6GFgyeZgtB0wGlbPIlRlEEmYE/qGYCBd3/Kkm+KsS+jhXvxqS4XdWYB5VJ8Csx7KPObECmatYeMFYzNs654y67JnTga+/3j/nh6l4peVpXYUA4DXNhftMu2pQE71P+AOqE9B72lAeBd+HmgIN7ZeWowTzGgWnQsGEYNQK9DF1FKqqN6rpY9eK+5feJSSq4PcREU7k+rcTxsQ1/38u8z2lQ2E56Nr3zIJM4T0S962RkyVLEp7dzl9o9MG/hfJoonZ/A2Kaw595te73BdBdvy/vvsnuLRV6oylByHFJwOyQghUjIUJvAmuwA9Ry+qu/xfG9sym8/+btgiCi4D5bseHzRo0W5gSUg3g0WrvaSvcplIZ0qLXlsD5Z1tanycoenv4RGnat4k/+KOvMwj8BRBYNRLu5tYLuLHSFgBNdZwgFb7KprFaD7pNdIrUF8pxi3t8pKp9ggIRZdWFdeEIyfAIwGbN5WHnKsHMm55v4y9WN9bhS7Pk40LyDu5VpL8WzkTxNqEhW1FWpMUtu4ErrXf8cYNxmpaTWtBhbIdF02tFvSG5N6IFkzSeS+ae/y/qDwx4E5QxY7Czg9C20ueoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(44832011)(26005)(110136005)(186003)(956004)(2616005)(2906002)(6486002)(66946007)(66476007)(5660300002)(36756003)(38100700002)(66556008)(316002)(6506007)(8676002)(83380400001)(8936002)(38350700002)(86362001)(6512007)(4326008)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HyfZHprNGupgacHRofQ53esmTvt8IUSu8BRJZhVETnmeW1MAq4yQ8uu7zchO?=
 =?us-ascii?Q?YOWhWIW99jpeyBtLP1zh0uTkQBhaiSTXngCNjiw/tCcu4ToaKaZU5iXJyPuG?=
 =?us-ascii?Q?IzJaUBir99URAYnStWBID3GcXP2xcVytllchdd133VZI3HsGWeEgJBFoYqiZ?=
 =?us-ascii?Q?jCUFUvg73dqMOWT1bv0K/ItxgbjH5DiDn5Qa55XiprERW5oCXqZELVaw5Fsv?=
 =?us-ascii?Q?SPblzBTjue7wvEmfe4i0vZNotxwXa4Awt02fvbaQNddPzVxukkdoOvcZh88W?=
 =?us-ascii?Q?gCOb5EbTsWwnmEuHAQBtVdz9VSaKF7kXx4bLV3FcdHLPbuEC4ZTRH4bwinyG?=
 =?us-ascii?Q?rK+TRjEi/BlKjtB0kiLG3+SSksdLauShC2RVkDdgK8WMPQdOvPZ3fE5Uu0HX?=
 =?us-ascii?Q?BbOQ+dPxLOi9IJ7StsDl9N/IwTCApqbxOt6UrdMouxWhEXWXBoN6ABEymEZF?=
 =?us-ascii?Q?w2+894ZxlG4Ns4X6C0VeyyQfco6yMFGXpvdodinHyin2FaBLbH1dTt8Q8Ei4?=
 =?us-ascii?Q?vnjKOKPc/VEs3lfz8lK2Tq7GF+gu1yGa+2iMusCa0Ht4Ls+N6TwKj/yB/gLv?=
 =?us-ascii?Q?0rdf1W/hK+Pvwx1T6PiykuYHeHEocFOb/Iu9ZrpfKPVZ/IEtnKtel3acSEGw?=
 =?us-ascii?Q?z1PFz0fzngpZ8obbvoCjXqOmHF2tPucbObZdJEaTeCuaVH6/AHK8LAr9xTvy?=
 =?us-ascii?Q?Z0nzijqeXtUNIVUqSfmIhMoTz8lcMJHYkzdjtjovnmOtwgiBO+9qmVPCuV86?=
 =?us-ascii?Q?py3gJJQy/1OaeosOsT92Nukpi8XsIyLDD6BWC+x1omwNb7hiC6e65Q8LLRg3?=
 =?us-ascii?Q?Ab5/zCcE35VmFQS+P/s+c3DSgnZc1p2P3qqkBniTA2jxQONAilAB61wIw/mk?=
 =?us-ascii?Q?EJUiV9UiU8q5QRG5LjCmZsl3FD1G+AWSkOo3RnO3QpEd1ajlyJC0BTU54D37?=
 =?us-ascii?Q?hvTDZINFpPxn/3on70RZdx//W4X9NHmZ5+ulP4miFxM0pD8Ah3gRDL+CUhjm?=
 =?us-ascii?Q?u+IGtaDCqJYLP0wkkBg/rDtYPScAQ+PE4MBdNpmWIaQGYStKK54a25JFTo4r?=
 =?us-ascii?Q?ZfP1gNAp3BGKFbaxhh8cU28OAP54tA18d9KK8AxynTd3BchUOqZM4D3Me9bd?=
 =?us-ascii?Q?hDjmygzGQqcqvDc/GQKvOBf5ntTtU+u/p9V6InEH/ezrfIhcwJQAkNcYLOCL?=
 =?us-ascii?Q?6OwiVh3tTQsCseHq1FVU1OITCyP3bm5TIaImEvT9wU30WScEhfFjBLPTcwZr?=
 =?us-ascii?Q?6mPOhR2pXIMaYXzFeJt+sKeGQxb4ipM3GX6xZ7XWhdMYC7YA+tMVKcWuttFe?=
 =?us-ascii?Q?HB7kxcg57nddjZ+WVjEq1xxx?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ab7ac6-72f2-41ca-b4ec-08d972056550
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:42:55.2047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dhRwpykIgftUHAzbQow3+8/FSyM2TRJ0+93pHWPqjMm1xTUDw5UaRUA3WOPyPyg7nT7GMRKrc9zbhVigwEUoK4RntYLyp2pfotWkBzsNKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8269
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There are few places where the maximal number of channels is used define
the size of arrays but when raw number is used it is not clear that they
really related to this quantity.
This commit introduces MAX_CHANNELS define and uses it those places to
give some context to the number.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index ede66ea6a730..2c9ba5fe5f2a 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -29,6 +29,7 @@ static const unsigned short normal_i2c[] = { 0x2a, 0x4c, 0x4d, 0x4e, 0x4f,
 
 enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
 
+#define MAX_CHANNELS				4
 /* The TMP421 registers */
 #define TMP421_STATUS_REG			0x08
 #define TMP421_CONFIG_REG_1			0x09
@@ -36,8 +37,8 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
 #define TMP421_MANUFACTURER_ID_REG		0xFE
 #define TMP421_DEVICE_ID_REG			0xFF
 
-static const u8 TMP421_TEMP_MSB[4]		= { 0x00, 0x01, 0x02, 0x03 };
-static const u8 TMP421_TEMP_LSB[4]		= { 0x10, 0x11, 0x12, 0x13 };
+static const u8 TMP421_TEMP_MSB[MAX_CHANNELS]	= { 0x00, 0x01, 0x02, 0x03 };
+static const u8 TMP421_TEMP_LSB[MAX_CHANNELS]	= { 0x10, 0x11, 0x12, 0x13 };
 
 /* Flags */
 #define TMP421_CONFIG_SHUTDOWN			0x40
@@ -89,7 +90,7 @@ MODULE_DEVICE_TABLE(of, tmp421_of_match);
 struct tmp421_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
-	u32 temp_config[5];
+	u32 temp_config[MAX_CHANNELS + 1];
 	struct hwmon_channel_info temp_info;
 	const struct hwmon_channel_info *info[2];
 	struct hwmon_chip_info chip;
@@ -97,7 +98,7 @@ struct tmp421_data {
 	unsigned long last_updated;
 	unsigned long channels;
 	u8 config;
-	s16 temp[4];
+	s16 temp[MAX_CHANNELS];
 };
 
 static int temp_from_s16(s16 reg)
-- 
2.31.1

