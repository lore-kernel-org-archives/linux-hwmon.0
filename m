Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B312C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1995160FDC
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237056AbhIXJlC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 05:41:02 -0400
Received: from mail-eopbgr60116.outbound.protection.outlook.com ([40.107.6.116]:52804
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245241AbhIXJk6 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 05:40:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gj0zfCvy5aYr5Y513Hh85WvkSs4l4CgqZI1b/P4WagPOa1cMtDCzJkoesp8ArJA1tDRZY+wjSLcal2A7XPLHmQHbMdzmonEfCrfX9ipaLer8FJ1TyOfokS7HxjGCUF2piCbkURD0xHhsUq0T4XwwzNPzIrxuA0uKIMXXC4XnVzSIgCaFm2rOal+Ck0KCOlMppZ8C1542CxA05whIuLNCIoEX4UfFMsE3w35x6WPCrTqJUP52P7MVNNnZiW/SgYXvkOt0qjZlXGR4PLgYJdahGP67fOD6wJnb/tV/uNgjRXeZDoClQQZXCGb1V2XIjT+gVc9YsIa8L2ZBtaFWADLmKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hsj5n4wvnvZuHYbuN4wMAzJ/LItONO01vRymeWvP6K0=;
 b=O63h2C2+o2BZo1QpvHuS9nKUF0DZPBExCCS5x885Ci8JBE0Y3eYXpDBJblPiy3J38ZIiNw9Gf6e+gTHDLJCQiKgJV7/7DtfJAv6y1OvzWPTIkr40g3hqqB0ecyo55yc49W1RuprekywHS4HmGsh7LUG6jM5d5UIXHEVMEfJPzQ2pK4oFPHeT0c1eQf+wMQYsYgJgKs71W8IsxYDrB9dB+BLoJBYEcqlbDvTmDPAImjuJNjyZJ75JClo1Kp7riX2TDLtZiAFm7O6iCZKpPG6BokmC/qZ/eDd6CJAk54UXSiTCyRQ7chY9rjL/M+DGQlmhnOPT23anmTLCP2zX3y+bjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hsj5n4wvnvZuHYbuN4wMAzJ/LItONO01vRymeWvP6K0=;
 b=WChRCi0mmvzUfE8FAGPegZFX0T2L4mIDVX0Lumcrhbs8sb1XFuvUen7pZSb8mB2fTme4+mJley83YknUNfjaS5xlWEXtcKX7VYe2ABIwk/jQ1JFpqt9SqQzvIcfF5jOdeVkUoPmoZ4A1szMYYBBnBdFmj6ockVN2rcmY8SCjakY=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.10; Fri, 24 Sep
 2021 09:39:24 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 09:39:24 +0000
Date:   Fri, 24 Sep 2021 11:39:19 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: [PATCH v2 03/10] hwmon: (tmp421) introduce a channel struct
Message-ID: <cc28847a4302bbcd6088f83f6ece71a9309590d5.1632473318.git.krzysztof.adamski@nokia.com>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632473318.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR05CA0127.eurprd05.prod.outlook.com
 (2603:10a6:7:28::14) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0127.eurprd05.prod.outlook.com (2603:10a6:7:28::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:39:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5983a004-74d4-4c02-0ea5-08d97f3f3189
X-MS-TrafficTypeDiagnostic: DU2PR07MB8110:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB81109A464C8201B92CD41E45EFA49@DU2PR07MB8110.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 064mqQMDYJ+ggz3NogflaqxTb051BKHf4Pj9IoI84SPGMNtC9yZqKEuzhNlRrPzenFhN2UUVEWe4mseRv1Wee8kWheRvGimBXfnPRnMEaKcmzJY3szz+2jPOXiBTyg0krJ764PcGBkNslDXOyKSKJYlIo+Yw3AAD9qS0aSxoGtRbf+X/KzX0JKDELMhjJkiTRvEv8lKJ6KGPsMu/RTpmkhUpCCI4df2dHslu1DjjgBEXe1xt5Ld9RT8S9Y6njM+2QyshF9TpXYZIZPcTbHJzY2VN86DXxO1cDav4hrOZXJUFFiexrmeobIaBtsrx2O2Vfz+QRoeK3DfljRSPXo8bxGcM3qsep9ogGHWj2pGQHPzM4JG1Z0ceRL36wLyt+5WnRjmVbtR0D2GSmtyvkRDM1XINgyWXE5cN1SlWcox/ECJvG0IOrVQ1EYXlCZ3l1ifi4gnI/B+A/moEg80X13hgGBBByxX8fp//op0hIkQLANULVXj5VDUMGxIN64V506HfeolyqK1HGSp0RJOy4Hc0C0uuZvHsZrbQsRO0aCjeZYFlm/Qdyx0OfZoMhqgKHuH9Mta8Z5u0TccwYJKn213klFqlXgxIxdm9QjFqzGFPr4tSIreuYSyc2I10k/N2/VK/0MGwDwnOUIkFQK8Q/EuKr1HMCe7gtvx/8DWr43lKMKjUpPRN3OeuktErKbWYYfE7o3dsQ4vqy4ErQRcpH8kIwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(8936002)(26005)(508600001)(4326008)(956004)(83380400001)(2906002)(6666004)(86362001)(36756003)(38350700002)(66946007)(38100700002)(110136005)(107886003)(186003)(2616005)(66556008)(6486002)(316002)(8676002)(66476007)(5660300002)(54906003)(6506007)(52116002)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h9mPGxxm8G1P1Qdhof29a2wdFGFquKoU9SiJSeO0QFELZaG5ukKShQYurX+y?=
 =?us-ascii?Q?wia4DbYovGDy4oUjTYPVZYYIlS5y+Q2Ajotd4jZzhzvfLAS6mpqt7CDv9V5m?=
 =?us-ascii?Q?OAO2aIwYaB2bPYmgsbMZ0kOydNks9OZOqODH3V+E0razIEWAk19KYgK+cpXe?=
 =?us-ascii?Q?pCmKDRJR9jnriOYC1tr0O410y24UQo86bSm1IHf1LlEMPjbK2P7hdzNSXLpo?=
 =?us-ascii?Q?f3YNobaY2X2XVLD5ijedCwEtbCBlTcoN/C9VZ5gZuA7hhSNOEg6eLQYDu53x?=
 =?us-ascii?Q?4SWlWdQ1QsaxmGPfazjGMlXNkGI1oOtEbgv2n/smstvafa5CIuQ0xpONwsrj?=
 =?us-ascii?Q?CDsdjRoG2cvenF1dz6uNctstIJwp8CdUJ2xGAZ3doJ3y3pU5Q3jqmQukAuv6?=
 =?us-ascii?Q?21Niujvkwo6PnscqC+2E5BWyy29Etdnt9P9uONlB5Lw5p/8SYrQUTGFoWbfn?=
 =?us-ascii?Q?r/mq/knat/KRsewS+eeZjR7ATZ793cR2Shz79odqa5EHJAGFQxd1QeGUmA9/?=
 =?us-ascii?Q?UDWw9x+nejBWv9hqJjIZ4PVChzUXxE9oqc+gA0iSn/bAYr5ylKXD4UhSytAK?=
 =?us-ascii?Q?gMe4dmItwxYkAwna8mxDM8jwvgMCSNMwAbpKw0gMKJZXijT2jYjMzACPZmJh?=
 =?us-ascii?Q?H98yiMQ91c4K1M4bz2hC6q7Ub1rjOKLY/9S4ubqcT0a8PEcPPseTkhpOUkh9?=
 =?us-ascii?Q?2sOsrzcWKkoyK6OPJokvPS2kvgjMINC4sekTuDix2ZQly/IPgXlOpu1eNLP4?=
 =?us-ascii?Q?5bdSOIdC0tXeGliJs4V9jolH3p9/wPbAVO7BzAQIoarqc6ly8yoQ90+gPLAO?=
 =?us-ascii?Q?EXu3LqbcAt/YlclNZLMP+a4jEK5beMFXK2kheXfxw5j4cEQlMiOcLDHNh6Cg?=
 =?us-ascii?Q?dZpWsSHfcmA/+7rwpxdnyAn3kfGUTh6OEF6NkUH1gh41g/t/4w+U83Zeh82i?=
 =?us-ascii?Q?ICEPv4j3nA7ztzig+u3zx6wOHlJ0MR611fzdWegS8uHx60NU+lEfqwXNq7Un?=
 =?us-ascii?Q?D8xu/VZKAGFpA9bsTBsOovlxYKbdhgaxo1MvBt6P7/XQEOZQuZiTs2Tpi76F?=
 =?us-ascii?Q?+WEx+wlOjf04zYkdtqjvShqMagIHqTgNWOVxAsjBFNb9z3lBuSLwUHE9FR6+?=
 =?us-ascii?Q?dntiIyEkSR7p4TKfqab2EGWVB06C5Nv1+tATGMUJJriqH1ob5HowV/nRQB5l?=
 =?us-ascii?Q?bXkVrWDC71T//XXqsvrVW6lnf0mD2doQyoG2IbITfAdeVt1Zd1O8GpfrCmff?=
 =?us-ascii?Q?p5uCyL2LE14yYBb5vwJj4xrpsgP2trieynrrok0OQyrhsqG658MbXL3VQdAV?=
 =?us-ascii?Q?OqCm4fwjXXd557ny2+sz8BXO?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5983a004-74d4-4c02-0ea5-08d97f3f3189
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:39:24.1802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1sUjQ/APmeGwcym+hEdR+RildO7VELd96JQnqTy8Tm3mvyeBUoSFE/X+6waxvfB//PyXufbsgRF8TiEHARtZZV6LfdkptZaGS6Oh10lCGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8110
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

