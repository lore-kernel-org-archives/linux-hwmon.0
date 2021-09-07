Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00388C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:45:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2A6E61100
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:45:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344824AbhIGNqQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 09:46:16 -0400
Received: from mail-eopbgr20131.outbound.protection.outlook.com ([40.107.2.131]:47779
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344822AbhIGNqP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Sep 2021 09:46:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJ6zjlw10x13RMcqyMSmtXoOtdynqY1/yHYcfOH1OyTfvoygw65u/XEmLnAQJndkUVUqPrF1Wcu7rl0W9HeeqxQ1YH1beWF7mu9s1i0pnp+GIFkTRxmTYoyiwzuGeOJlNYrHUHd9r8jK1Q59+xStoh80ItAo+FIZxDo0jjmC4fWu14+U6sG1IMicTj8NxvhAB2qoWdjhAK52l9F3AOA/cSE8kFU5alkWLuC+54w+0qzsFEDsuARj1WuMlA9613EmnXdQ0GuI86N/TaNYJYw7TO44IKE/XmuFPqZziSOFQVylVF0o1ZPz251cNYZk/3do1a7HeaoyaWgo/7F5AgT26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=DakFl7vq3D1fjzo5pbNgWp+j4UgLrRLR4GmNJSs2nz8=;
 b=auaHjfdAglCiPyn1I7ZdIvK3sIV0xRTumNnutaSMOalDvp3C1ZXyoxdko292DW4aE6ph9v/v6gFu4muOvKOJQv4RKlmW16touGAJ/pHnkmMOJ9/TCDiahkh8GCDTzj6L1yOK0YadH5TfSTDMTHxh1pJn6NKDxJK3FLobIL8vjaMqiVDFYEOaFex1StprfIwCnXplJvDzZhogdQZbwzdtGCmBGMryvfkGbEC/td2hxBW4Q7d1Ff6cMVrapEmmzZN054+PTrIZWDRkfxF3pC04FlAnj0xDX6zhWmbync52o/W7BO+tc/p/skkjClvrGZ2Hl2S/au3ukoGkkZRCCt/BXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DakFl7vq3D1fjzo5pbNgWp+j4UgLrRLR4GmNJSs2nz8=;
 b=HJtpEM0NxLZYBFiEgNimrsrFW9JIbdHm142/hSHeSZCWPXyCPmzpvonnthWClS6znROIimA2P8jYC8ENB5HdEnwzP1hGCS7zX8Q3TDPPEcGuc86m5QZIkQ31Tig60c8mnKJQ0vJjoWE19hPoC5Ig4+F4QNtda+L6sF20FDpmBck=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8286.eurprd07.prod.outlook.com (2603:10a6:10:278::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.16; Tue, 7 Sep
 2021 13:45:07 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Tue, 7 Sep 2021
 13:45:07 +0000
Date:   Tue, 7 Sep 2021 15:43:46 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 5/8] hwmon: (tmp421) support disabling channels from DT
Message-ID: <1a2aa678c5a6261a1c096702f2e314e701533660.1631021349.git.krzysztof.adamski@nokia.com>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1631021349.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1P18901CA0010.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::20) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by HE1P18901CA0010.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 13:45:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8225ce0-7306-4ea7-929c-08d97205b41d
X-MS-TrafficTypeDiagnostic: DU2PR07MB8286:
X-Microsoft-Antispam-PRVS: <DU2PR07MB82865E97D046DAF55B2C4120EFD39@DU2PR07MB8286.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BikP2oOI2TlACIq0JKB0/6jAuqFr1Ge3SdfnsmuOnaBY1R3bbHe2vvwdOsqyOAEJNsyHt3maSFSCoWbGDTAxRxr/uK1NH81+Kw/sMaombOLmsuNFQpRHRy1lkReGMT7SlAbqCA4STLVAqly4e8mhizvyPNNDz+d7U5K29vTKI0AEoC+9kn44/F+bRS0ewlXd0PowIqMfdkUEDaEc5A4vsgAE5ithDtt2CuZ7NE9+tHGeCKFKnNB+R3lBvkJPcohv3OL5a6P4Bi79wRq0wCslt16TSCPPfvvCcJF9R/t5urDt9hnykg9+sfCxD5aKWLgYoXJ9ChvJDf7BmfWW3mNrPKNYjnTgWC7pdxqy2dvrsiP/yrmcrBikiiiGXWve1JsMauKsCf+4SP6iIlt2PSHNMcRXFQ1Tc6Y0whqKk64wCA+fAT5MZHDx2kaacTmo5TUMU1u8r07dSoB9eNvWkBMb+WcCCjWJavp9CY3s0N5cFZzeSfI2lmccLu7qu32us95X+cP9bljPJmujfprlVcSZoqGxm7C5RTEr1L85QZ1Q2WQ95tpBELiHnQVS4GAne+5rC5EGeVY6SEzvCleo+PIl5iPZTKIjGIXBVlkHqnNzWdsNdaYRcktV5a16OXq7ClyC+WpET2Qbon8/GjOMKZgKCKbYRiplDModDpF3L6OiAsU3+t33X87IHbVyvordFgBCeAXgfHMUeGk891HWNSpO/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(110136005)(4326008)(8936002)(6666004)(316002)(36756003)(8676002)(38350700002)(186003)(66476007)(44832011)(66556008)(38100700002)(86362001)(52116002)(26005)(83380400001)(6486002)(2906002)(6512007)(5660300002)(6506007)(478600001)(956004)(66946007)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4hVjJqk74KvpYBRmiBzxJQ4/Ijz48ta72Wgf1v1HySe84FzkqWXrTL7VYyoq?=
 =?us-ascii?Q?If7+DtkMnRmaAI+2Xxq5LmkrHJDkXwmxkKkEdgqK0dI6pe1rBjkCax9GKcWr?=
 =?us-ascii?Q?I9kgfmFXGPIXp+pu9700lUfeZhky94mSdIKqOvfcrw3u+yJnuxCNW3y6eoVl?=
 =?us-ascii?Q?fFFH3FN6kkgTCYTcpClX7Lg5zjz8B3IKEhjAU/no3eR4mNo0JKcnl28mPZ5O?=
 =?us-ascii?Q?EDoOhEsCsovu6XaOWCk+FwplowVNyMM+O0q4Len8NcbmpmblOpW2yf0AAnYA?=
 =?us-ascii?Q?BdGhNtcGCKT90vnMxX2bztJb4umHuw/rpp5stmlLVGwzbDrBJwalTMNe0PYk?=
 =?us-ascii?Q?Ghwp58/lKOw197XmbOxqNFgzO4gvn4FhZGOCmocm3lXBmHwjHhvCsyahhWhV?=
 =?us-ascii?Q?aahzXy8M74Y7+neGp75yCYcu3VXsguleAfpKV4meq80W6ahmXKjIdPuZs9Yr?=
 =?us-ascii?Q?k9TBd6MR/sOGHwOXZXfiynQUqNDXHAbASad6dcNqR7lJVzJSun33B1NbbKI1?=
 =?us-ascii?Q?ve97MtH6cBxk+R5BS3K1/4KoBz57oMFsoVfe9Ca+JunAcGrjt+GZhP80yt3C?=
 =?us-ascii?Q?IPCaQDA2VtoRfH6FtXgwqopLmYzLYFhL36/mpFVHuwyY5zcyAYhmSRd6Ti9g?=
 =?us-ascii?Q?H6aMcYfE/tWo6iCVpigkP5OA1BrOsa9Tp6/HxV5+D90jpB3OyRwDGe/v1qjP?=
 =?us-ascii?Q?g2JwRXBNZW313JfM41lyVwLI06w0FaEjZM9EvQ4v/CIQBeA6FZ0NU6VfH04C?=
 =?us-ascii?Q?GQcK07yVu49w2HwTw6dKT95QEMKXGez9WDgVO1Zbmw5vIdkokJ+D/YcjuYp9?=
 =?us-ascii?Q?dxKqMlMt45ebgwjcWxORb9i+EwjIuQpXXcTI85XtmXZVukvCRJEEJ6NhSAKm?=
 =?us-ascii?Q?IuZZfpVql2fmOg64bBaT2d8198ekjQvy6Xx888WVQycMyZEbk5gaI+mLWZxY?=
 =?us-ascii?Q?xVf8u60g0GOOQ793s8jt7MdqYDwci1gMeje+0skCiAILLxy8afAz9km5n+mI?=
 =?us-ascii?Q?dMgu7kqEp5ojAiL1oGOrUt/pBQj2wIhc8prCtA54PFGwImxVcp7KoQm7EE4t?=
 =?us-ascii?Q?LIOgaYt2mh7sYZuK2c3GdzQnYlRkuuKfQU/9lMFjUDNGeQrWqrqMbNZ4Br3/?=
 =?us-ascii?Q?o9YlQL726ayLibAhZNEMpX1yt4wbWzdOYZNi8AJlQpXgVGmH7x4w9YTV1yI0?=
 =?us-ascii?Q?nyfyVJENPxS2fI0T48MQvhoLYPnIXmnsuHw6E1Eyv1bcw2ROtk7CQOwSMCbu?=
 =?us-ascii?Q?1PIctQipLfh7e++/4ompK/PjDvyFriD8qbIVcpAalxTSG1rfWU+7k+rzWLdI?=
 =?us-ascii?Q?KMUYMSDKS5CyfXcCXxpAhMm2?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8225ce0-7306-4ea7-929c-08d97205b41d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:45:07.3847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9dEnfJVfPb0YwSVS4/1jWi+hXyLW56bWhxFlm3d+fFQWWhqn3Ki3xAnRP1+3efgVuEIpfRvOGpERSF7lPJVmWq4qj4GKVbWtn0LjNiKsUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8286
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The previous patch introduced per channel subnodes in DT that let us
specify some channel specific properties. This built a ground for easily
disabling individual channels of the sensor that may not be connected to
any external diode and thus are not returning any meaningful data.

This patch adds support for parsing the "status" property of channels DT
subnodes and makes sure the -ENODATA is returned when disabled channels
value is read.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index a1dba1d405ee..a41d7935acb9 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -89,6 +89,7 @@ MODULE_DEVICE_TABLE(of, tmp421_of_match);
 
 struct tmp421_channel {
 	const char *label;
+	bool disabled;
 	s16 temp;
 };
 
@@ -125,9 +126,8 @@ static int temp_from_u16(u16 reg)
 	return (temp * 1000 + 128) / 256;
 }
 
-static struct tmp421_data *tmp421_update_device(struct device *dev)
+static void tmp421_update_device(struct tmp421_data *data)
 {
-	struct tmp421_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
 	int i;
 
@@ -149,14 +149,17 @@ static struct tmp421_data *tmp421_update_device(struct device *dev)
 	}
 
 	mutex_unlock(&data->update_lock);
-
-	return data;
 }
 
 static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel, long *val)
 {
-	struct tmp421_data *tmp421 = tmp421_update_device(dev);
+	struct tmp421_data *tmp421 = dev_get_drvdata(dev);
+
+	if (tmp421->channel[channel].disabled)
+		return -ENODATA;
+
+	tmp421_update_device(tmp421);
 
 	switch (attr) {
 	case hwmon_temp_input:
@@ -314,6 +317,10 @@ void tmp421_probe_child_from_dt(struct i2c_client *client,
 	if (data->channel[i].label)
 		data->temp_config[i] |= HWMON_T_LABEL;
 
+	if (!of_device_is_available(child)) {
+		data->channel[i].disabled = true;
+		return;
+	}
 }
 
 void tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
-- 
2.31.1

