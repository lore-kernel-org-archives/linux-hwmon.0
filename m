Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFFBC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:39:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAA8261039
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245221AbhIXJks (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 05:40:48 -0400
Received: from mail-eopbgr60093.outbound.protection.outlook.com ([40.107.6.93]:8706
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237056AbhIXJks (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 05:40:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fP8nocgw8jrMm54vYmov2s4VijuOvHGFgjroD+yxY2u884296rdRZAycDeBofGdYMyNcpu5jL4S6BzRaWidBRCu9HyTOYCS218TChCEKKJNTGzoHO5utEI4sU/D6zC9i+b2mtefZtinyBIoJt9SsaGYVwCgA/+n+KlPq/VPLO196EoRspzBcM8lJiijQQPqugz+tR9a7nHFDLyV18WRZe358hoRvBD1/AaasVuEHNnWKadVcsfC+O0ns9IfHGjKDVCW4qj1JUwABWMlHfTWsH+huZ8aK8U/SYNQ3nDNu7Gvi+YKRrpnFyXuyRAH+ijxjhWmt0c6VK6iJa+pEa0kZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJw0UupXIputVH7hbfREtC003S+N9JoS9YRbn0pt8sc=;
 b=OY6Vv58Tr7vIB874phQqAKwYhVbpvbs3CD7bTbp1PBv+Zl9fQH5l5N50YAgtpHlQmF/r66blEYlY8Ku/Iam+1MK65O4NERfTPOUaIehB9XLQXoAZMGZwbQmJf/gAMAdH3bTzFhC2Wuirr6tRZ5cdJvS9f6ISvXreOw8ED8MizkOADDbqzF/XFSNFdxxusY7dOop1oTT6/l/20FF1gUVSr8ViCIYKHaZyiNDZTaF2FRzAZHldYuNJUldFz/APDGPWvNU02uB1a5G3e4YB518Wf0d1Raxc+S14yJVN9BxtrUA5G88zMrR+6JHKVInxrli6eonsb/OLZFERp9HYOFaVOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJw0UupXIputVH7hbfREtC003S+N9JoS9YRbn0pt8sc=;
 b=ncoa7Y0/As5Assi5aTa3IzbXzzk1gBXinGeHdu76s7NVXbhHmw6cb/R0YR/i/pCKEjhH/J28F+eCNn0uG+jp+I4j2Lhp3l8UM28D42KWIkQEaUblJFauR6VhtEOIqkXJ8ZetLXCp9BaL+ikugpGXtXfqPH+vLirPYvKjY/a2g0I=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.10; Fri, 24 Sep
 2021 09:39:10 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 09:39:10 +0000
Date:   Fri, 24 Sep 2021 11:39:06 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: [PATCH v2 02/10] hwmon: (tmp421) introduce MAX_CHANNELS define
Message-ID: <abc1a213a25b890b799b35ad94bb543a2ade7fc8.1632473318.git.krzysztof.adamski@nokia.com>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632473318.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR05CA0151.eurprd05.prod.outlook.com
 (2603:10a6:7:28::38) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0151.eurprd05.prod.outlook.com (2603:10a6:7:28::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:39:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcc2fde8-8e9a-49fa-ff1b-08d97f3f298f
X-MS-TrafficTypeDiagnostic: DU2PR07MB8110:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB8110165E83AAC960E1469C91EFA49@DU2PR07MB8110.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z0jFKZN6KEEiTFWa04yZgK3Rc+l7SFZJxkayjuY+rWvbDzGAOF1M6HoopQYFaP1bR70NqK0ijGtwv8mhhrBpUhYvyLB3Vr5qQb/AYI+ytMjglDeFtpVOKEjhvoD8h9wVVN+XTKGp1HSQlOeetCQ1HQ5TYYPojDU0EP824vyAKXPtVAKVv2wia1GBUK4xmDnZx4+pinTa35KyKqVT+Jdy+XzKoS+0FnY7qp56RONOVc6PVxE8311JPt5pLMjlSnTsO7dp38/yT/UyeTZ3wMUtjUEmhdSMEa+pBa32PSr0s9wrxdBhOYbxVaFicyK9pLf3lxrlny/0UxqaQABCcScae3NSGtYm+qU5N0bMmvvLzPCMG0fme7s7xGSn9EGZ8CIFDDbsHbzwdfTbzjLmNIBjnIpK+z6H+0jwPQ4YFdE2xtusRdp5bHrkdbxZy2Iy5LC6F/ZbGnHD5Wd9xC7FK2OU46axnqKzQrjqMEJFBESLHZGWh66sIgCD702tX6IwI+G97rfLk7QcqUwQKA+mo2yapuRLq1gjhCR+nHnY1SHVZntXrTJxYw2Era3g+B9VM3NUSVQCGFxxk0Ov/rqwR0rLNpYyYiNsRKtcQYNOETqRX5GyBB+2u7RnzgVcQCIGW52TkviAtj7ITANyPQTm7HJVOP4eQqr2KG2pqNnPlmpuO+Qzj6ooqdUDm7FGWIMbloDwm7G+p6yBb/fCrs4Dhu8swQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(8936002)(26005)(508600001)(4326008)(956004)(83380400001)(2906002)(6666004)(86362001)(36756003)(38350700002)(66946007)(38100700002)(110136005)(107886003)(186003)(2616005)(66556008)(6486002)(316002)(8676002)(66476007)(5660300002)(54906003)(6506007)(52116002)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?inZ30EP4hwTiwjaqwduTmMCtT/eMXIxuWTmIuaIPh1rUxyJXCMHzsgEJPGMn?=
 =?us-ascii?Q?vxMC7OmP8pe0EFUPT0eyeQtUuDlPniDWiKcU41m4+jJMBnqcXE8E+m0zyhsI?=
 =?us-ascii?Q?iAi+nHJNbefX43VS/eIZ/HJtP1m/p4XbGcTE6QSotd+Y326ysrexk8mbkJZf?=
 =?us-ascii?Q?MQFjS0G5s3Nawc5nUCEz2vs2QyMHABKVcH2A8PJ2JqeVLdTAMKP1FaIbJaml?=
 =?us-ascii?Q?Urh03mBee/8Wsb8NBgPKNOLoyG8leIl+7+6oGq/wQukeTghv9Ad4k1EbWhRM?=
 =?us-ascii?Q?m8SaB6XRyV0Wg1S3khch+xHAvfoUzNoA3eOQ1Kcy4K66I9TO+Do8yCzF3kCJ?=
 =?us-ascii?Q?iJU64iF6PameoO/UIeUH0Xp9jKeCNq641WFaylpbYAp70TDWxPA051n10k/J?=
 =?us-ascii?Q?is/9YpWpqKK3zDYE39JfturQqwwQIeBCjShnmySL1wsuGuTXRUo9zmXqSQoE?=
 =?us-ascii?Q?obb2zeVD1JzcWPdT0Oo/pGeBk+503ZkqKEjNks3ntpgFjIHLQvVgUNLW06Gt?=
 =?us-ascii?Q?7Thb1ERzq/mnEP1b4mII7oXYlNwMSDL/jxN8OLl5JYR3MQEyDJC6KaBNMJRY?=
 =?us-ascii?Q?QArFCpWsKYRos8j7fTEW6UE7efGY/BAS2FhPyQC+kQdcAHKtjFm5jxXDjEu8?=
 =?us-ascii?Q?mpobpYmvpAc0qxkgi4TaZ2wDIXMMXFWneAhx0T2fYxrTEsFQzKMtq9B7OZHS?=
 =?us-ascii?Q?Nbe+bfojcWhG+KoUHVLtO+wKJ1oLLmvUslqEq3f67hogDKd9gYBTdlaYDHXx?=
 =?us-ascii?Q?MxIhDeUWQS42ZDbZ0idRgJXVk70CkEgPsLr1gtGkq2lxt/LwtEM5ynkZGcyo?=
 =?us-ascii?Q?e1GxXXZ7cEZuC9u/80THCeMywt8wqcoG5LjI/TtfIYDB/RHMcudwTV+LD8mz?=
 =?us-ascii?Q?hwx95MQreTXl3Ib69YsAYAgZTwFXcISdzJa4nYvuRdnR7umjD7WDea4SqA4W?=
 =?us-ascii?Q?j6D2Qifk0hTn5+y0JjIMGfrP6ZHvziamW62gSJQpL3sioM0j8ltEvvVtSCoO?=
 =?us-ascii?Q?IgvOsMuAUlXpwDpdPtGJ94VNA/mahv0Mw/NC0GEH1kOr6YOYSNhJodxGsaBZ?=
 =?us-ascii?Q?mvSowgBNM7BN5I+k/e2e6nTC+qJnRvLT1XWwc8QKQq5A+WMzVGaAYiaKeD3j?=
 =?us-ascii?Q?zAJ+Ekaj6Oki0SRh7YPc5ttHZJlz1/HVKtamfGmYP0XFoN0tF9rmkwx7/+YC?=
 =?us-ascii?Q?/hliMpwSw9pX+xN1V/Ut9szpxxvcR9lbZ4EFyFQZI+Wt4vtxAgMBcJ+uefjy?=
 =?us-ascii?Q?O4xgU4AG5T+JmBrXxrHr2Io61KmqMx/wAEDiu/Qb1eVuAYtSiNDIsjPquFzW?=
 =?us-ascii?Q?hyv8Xn5V9iW3rYwCjSiFtocv?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc2fde8-8e9a-49fa-ff1b-08d97f3f298f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:39:10.7830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/9w0uo5HAj05+ssxmFlne+cixhA8GfnaItEjtcxA/u5Uam4EFX5EY2A4rEgFxbk/AueIABdYvqASwxVhdaC2XxuewA/Q9Sk1GRspFjpIaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8110
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

