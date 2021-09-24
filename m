Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA26DC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:42:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91D9760238
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245289AbhIXJoX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 05:44:23 -0400
Received: from mail-eopbgr150113.outbound.protection.outlook.com ([40.107.15.113]:46389
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245260AbhIXJoW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 05:44:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awTIDCUMFzasid0V3FAPyiREL7nNj4OXPbi3lsHrJ8W9Xpu201K5mj2bM86BV9TaAeINemP/ICgCuk1CktT58c++OA7xDnQver+ZKzQ+cLb3vyEiVQled1eYIVioYsaVgE9TFE6xEMklOvlsosq7BRHSJ8Ge5oEBTIF9Hbpcc7hGkim4O2xg8uccFN71FlRskYKEDuH+eh10QPSDWLsr/CxABFIFZ/VkSda2O2mi+CeOLdWFwpn2NxwZ7R4UZ/bcUdEsF/wE2Fmq3nUHOKlyIJc3lFMTrn+bIa7rNyKVzCXvTfEkQmuMMCzgKCg8ZWv5eE0Jrxd/MIwdjt2P02gLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyeXUqfKkxEw0gdcRk86zPDjngvrsXWj/KdV8Fy45Xc=;
 b=m1Wl8LVDW3VJehL+n2xrHLfcmgGizNOLB1engESYiDMuwOjbElApCXPrOSgKcdcp8BUj+MqGeej6DksF09BS9jAWSn8mrgiIhYLgoMtuL/WYUHBWG6XQVF4F0Nf9MV6g5Edp6nO7DATomCi29CXRhX6HsuNqCHtBxdUIAU03FugA4aDLqV04yQ+OX/0v+EkHrTKp391gxbsXk9exYarjkrdZVuJnvr5NvNJq0ZUNnU3w8LsxSMGxvo3ieR+9cQNuNBSjqdEpLuuM0CtMrPOXkiz/RmmVKAT8dT2nLgmfMOsroNQvCjGzpANMIqm8lyru4D0/iEfYV7wCUxLvq5FwBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyeXUqfKkxEw0gdcRk86zPDjngvrsXWj/KdV8Fy45Xc=;
 b=h+GxHQuZ9aJIdPVsBV5zXbEpDvOaC3F5IHUKoGLLBuhVxxnddNLmMLErn/mytv9mXEUBb3jp7ebjGs9PqDO4NpQgRm4Hs2bVojMSm75JfLoTtaJNsBtWsVu7diYKWR9rwmACz0bd2IxsOFvgb6RjIYH2VGj1othVz2d7EeW8lSU=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8272.eurprd07.prod.outlook.com (2603:10a6:10:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.9; Fri, 24 Sep
 2021 09:42:45 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 09:42:45 +0000
Date:   Fri, 24 Sep 2021 11:42:40 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: [PATCH v2 07/10] hwmon: (tmp421) really disable channels
Message-ID: <1553ef3db09cfa166b26b77c958f5c13576dfbaf.1632473318.git.krzysztof.adamski@nokia.com>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632473318.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR05CA0154.eurprd05.prod.outlook.com
 (2603:10a6:7:28::41) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0154.eurprd05.prod.outlook.com (2603:10a6:7:28::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:42:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e573117-ec41-4427-9c9d-08d97f3fa9b6
X-MS-TrafficTypeDiagnostic: DU2PR07MB8272:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB8272CA77E8FC9DEBD1B24B8AEFA49@DU2PR07MB8272.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aHcHKRxUKRJCarZaLUG2vn1SIcXae8yRjQs6DIzvIxk17UfE+Ykf02eD6FTOGCbwa/R8oyS5/gJuvM4pmZlh543y5lty/e3osigwRQGT3so/XCK4O/wZcxJCYjqXDMuwRlciU5qYaXTEgssE1mQh2u42YaE7hBYBS8qodPOqWLUbvBwoBcGGz+CjRaUQyC0RZ7U3bw2x6E4lEg/KJ1awjK/RPH4f007UgVs/Ll+6gy32NOGt3cblQaVahQczqr1JTJatnS+4U8fl97R7Oxic99Xh9Zp7NvcLGKUgt65usNXEE/yh3/Y+g4bppM17CKSR89U6nnm9uhSvYVBYDm2D2QG0CfAc1W3qZK4xNNsEQ2LJ/5TfSirlg+1FhVL9q/9K1zn/o8hNRRp2KSPh153FEZ+jMpNs/QyxTLsjXDS4oZGrqFjPqHTfWCVPMpdAlC9IETfBdF/U2BFeMg6g/OXHC9wq3X/Ywd+KUQt4KjKdd04z95t/ZauRJxFc+lVf4Ry6TWQUA7hBbl26w2WYkc0fdCRVYPsQ30QYP7TJzljAL91iTRCU4qh/7//UD9JLeebI+hqPg+odzo2koBnaBLfSiODJpaULK3Z/QE25LxthTiHvfD1SkPWJfR5x9BA75vfW9z/fvJPqJaY42xgTkTKAilyeJIGSrCdE8/d70hqe4BUwllPik8hqdDZQUraeUI4yAZlA2u/GMmSQEZcMyQvOkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(86362001)(54906003)(83380400001)(316002)(110136005)(6512007)(36756003)(8936002)(508600001)(956004)(2616005)(6506007)(107886003)(6486002)(2906002)(4326008)(6666004)(38350700002)(38100700002)(66476007)(52116002)(66946007)(26005)(66556008)(44832011)(186003)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j+IaMVWmrWY4YwwWMrOch7ZV6EtNkjhMAWFIEkhASVsx89P/8vfPws/TW3mo?=
 =?us-ascii?Q?BTIuR73oM6GjlTJSZ8gHfRCrGN5y7GebPa+bUPB9Mysk3WSRiaj2IS549d0E?=
 =?us-ascii?Q?EOvTdCP+SpjrCb2dKA0rY8kMxTDeyjDkHyjiPTZMTuXdBtBMYXOszysAwgJX?=
 =?us-ascii?Q?8zT/EulJDZ5WlDz9oHadYTP7ks+47aATboF+Fe0h1BKSOd4ogkZtiXK2OUjy?=
 =?us-ascii?Q?4AoI4YzMLuBsckCBx1qcM6f3HWkBmUqKLS5zU2NAusOseS64e/3M5rIPGiKv?=
 =?us-ascii?Q?3KBE+Ptvd6t7jf0WoScKyLNTZjggsF7EFOxfaxZ1zINd/fhyPGRNvSWwGVPP?=
 =?us-ascii?Q?AjsXZ6eE+SW3TXeeZq4RIth8BC1cjXQ4b5YER4/rNG07zzATmhonaWHYWE9E?=
 =?us-ascii?Q?B7s53y2Psup9K3xwHmpa0hFdHB2nb0vndm/j3505Vxl+pWV3S3visWjmIjqM?=
 =?us-ascii?Q?f9EJda+cg8acST1CtVmFY8aIl09bZk6c4WsDA+53stA3ufgyLIc3ytc5C8w3?=
 =?us-ascii?Q?fh0GgVuGUORiBSOkDedu0XJFUZazJbnzm02SgAkSkiQccZHiJ795hz2QnnhQ?=
 =?us-ascii?Q?tLiA+0UaLmY2WtqVZf7JNLot0S+sz6P4dQ31sGTFq/oBJV8zdkVrvqqsoKMU?=
 =?us-ascii?Q?NIodb9/LortBw+TRmb+MHnKgEPuJQDa/l/atcZMv9kAfbjggTb0FnIUw81HK?=
 =?us-ascii?Q?kJDz34u77VuV3KFPAscv/QqxrKBlPnZe3TrdB9bQ1GMl1qQWeXr+MOjQtAvd?=
 =?us-ascii?Q?r4u4npLDU5huJPVIZEfxQSks4tyz4NO/mt8arZAO90k4bDu3q2wPnE2P7fHk?=
 =?us-ascii?Q?A9LuAkpNNKyStwX3n2V0Wwmc9ihmpGwuHzfhVLLyRw0EDdEAnUd0Kcu0auPv?=
 =?us-ascii?Q?EJnlntTJR3huR/xJHofsFx74SRKEDt9uuE/QzmEGPG5ZJrKcUDsMzaxF/Uve?=
 =?us-ascii?Q?rVZ21JpSEXRqnMFID5sL7KaggCUSTKx5TlrClh9COOdsMzqAHKBTSn3iOMcE?=
 =?us-ascii?Q?+jVQPOKKU8VUOIlOh6h3s9QnzFPQbgasm3gPFGSySIPVg3h9U8tVe+rZ/Xa6?=
 =?us-ascii?Q?NJLGtr3sRNMEXUOTc1DIhc7XWQoU53y4YT8OMrQ2iCVzfJgDyTGZn1Sqcyf0?=
 =?us-ascii?Q?zRcw2tc2+MKFCiqz1gww+FMc4XaUsI6b2qjFMYsEiQPCTtW8E9SNYDgsxM/y?=
 =?us-ascii?Q?hFXi8dEmbf2QHX9fDNkSWMs+Gyh8pUC5cpuzpHM3Acpgu2EMl+WgXzbLuh74?=
 =?us-ascii?Q?DsxIQqksUwuRzthwCNHserfvS91OI6AebsjlCNrWhl8Nj0YuQPgsd2CJ58W+?=
 =?us-ascii?Q?JmZJeuvdEUvwdI3N1XTIx6x8?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e573117-ec41-4427-9c9d-08d97f3fa9b6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:42:45.7645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KD7QUxFTTD1SxtzzA9yMGATWATfqHTZHFYEKP4lpPtbqlTXybZtGX+tqdzo3ZEEvAw17Z4+7u0lqJ8z/tIwIixULSQucqXuF/zI1VvMKGsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8272
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
 drivers/hwmon/tmp421.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 0fa4c02f5808..4934ce13afb4 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -33,6 +33,9 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
 /* The TMP421 registers */
 #define TMP421_STATUS_REG			0x08
 #define TMP421_CONFIG_REG_1			0x09
+#define TMP421_CONFIG_REG_2			0x0A
+#define TMP421_CONFIG_REG_REN(x)		(BIT(3 + (x)))
+#define TMP421_CONFIG_REG_REN_MASK		(BIT(3)|BIT(4)|BIT(5)|BIT(6))
 #define TMP421_CONVERSION_RATE_REG		0x0B
 #define TMP421_N_FACTOR_REG_1			0x21
 #define TMP421_MANUFACTURER_ID_REG		0xFE
@@ -155,6 +158,33 @@ static struct tmp421_data *tmp421_update_device(struct device *dev)
 	return data;
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
+		dev_err(dev,
+			"error reading register, can't disable channels\n");
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
+		dev_err(dev,
+			"error writing register, can't disable channels\n");
+
+	return err;
+}
+
 static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel, long *val)
 {
@@ -395,6 +425,10 @@ static int tmp421_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	err = tmp421_enable_channels(data);
+	if (err)
+		return err;
+
 	data->chip.ops = &tmp421_ops;
 	data->chip.info = data->info;
 
-- 
2.31.1

