Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F72EC433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:41:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1084860041
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245280AbhIXJnF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 05:43:05 -0400
Received: from mail-db8eur05on2111.outbound.protection.outlook.com ([40.107.20.111]:32480
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244969AbhIXJnD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 05:43:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8UcWpwSsSM4+jC+yXbf2g4kntuHA1tn9bNBy/I5ypc/KZF9+Ysx+Ela+Ri++/KlEBAsantn52DsrKmQG1GiDH34fLZaH1Wr/Fx24NMiCeFZZDisGfkSFLWthifWXOXvbR7SVZ/QBPdgT4KhCD2V09XjCuIzLkIhvv7GlJ96bUz2Rh+RIZ9Znsyfn/8qNxTW+cihGhqymqLdCRwxEnRq5H+DdHLO3cVh8buvk7z7G2dVJC9uuKTcJrdZMQz5uDPjnY/4tYezQ0szhaatHgfCKGdT9RrsUwjDuhUxsRXwEFj/PMFjjY6ARiIDc9gmTTwcLoapDHq6vHjFxMWJGnUplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7Y3eW2xgWwSzpMXG5z5fvIG90RibD8Urwf56CwEsJk=;
 b=S037hADjo1q1wABiJiepMaA4MUIjnUCb0WwGYmCzW2buIJIggzhd7NhhOpjnFb9F63228km/Y6vBvOGKCT6krgXPDlKtOJMNGYkh35SkXJ1Pm8hXkaucRRmjr7zQdr8r81fA04Na8WFRRwBTwwWyCGENXLGqn4gmQIrIpsl6xiHBdUP9FU77RS5xmWfnLVwfldSgQZBD3kZuQZVQ1L8BpWIySbNwOobKtT1kZf4kl47uZro/Ys5bFqfVJ9rvlzFnobu4tQkDAf5z5xE6FKBm6z0qvtd8gP+qgMlOzyrnFFrNq8eiTFa/fXQ8iAPowfD/rIgHsmfkedyCkNnBMEaAiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7Y3eW2xgWwSzpMXG5z5fvIG90RibD8Urwf56CwEsJk=;
 b=V2PBndnrFNwhiDdJxssCwKXcKSg9YhNbLn2uGoXb7mb1dHHmAEaCJON/EBG8roqyGXjLhFXEhgXdePknJJk2zgcdc847/SYak5NWcBgZ6yNu+CjWI5GBqtq8jIPXNryS6xedIKKny+Abg+SmJyWdCqdbhjocqPK6GgCpM7uunGE=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8111.eurprd07.prod.outlook.com (2603:10a6:10:270::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Fri, 24 Sep
 2021 09:41:29 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 09:41:29 +0000
Date:   Fri, 24 Sep 2021 11:40:51 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: [PATCH v2 06/10] hwmon: (tmp421) support specifying n-factor via DT
Message-ID: <8423ae634ea5106cee9c916dac2e4627c0e2de69.1632473318.git.krzysztof.adamski@nokia.com>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632473318.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR05CA0141.eurprd05.prod.outlook.com
 (2603:10a6:7:28::28) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0141.eurprd05.prod.outlook.com (2603:10a6:7:28::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:41:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfd9c98d-951c-41aa-687f-08d97f3f7b21
X-MS-TrafficTypeDiagnostic: DU2PR07MB8111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB8111EEE842EF9642B8626789EFA49@DU2PR07MB8111.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jwgmwjn8yhS5rzWtWfSQrmWJ9yfe2V8dTLQofUz3uzP0YsEbQlqaCk0zrv5bNFlMjmnC47kuxdKBD+py70IfNkS5RWKfoGHyAzQlvE0UzDwzKw8tfdfUUpn85IXf+2cRETBWf0e71OO31ME+9cNiM1TK8ZWKfmjiNutXEK8GgFLDYl1BUgznneeOy0J+4bB2v3KwM/3kdvCHqyogPQPzAuDLb6xrCJASvAyFKty/kFJ5sIu04yIEZYNMzBlX6+2IPvjdr8jsI4dlyaP2MbVPOCjaOHuMSySup0w4B9owq7D+hIvX5Nc2hGe3g5wzjx4N1JmEnm+JmiHl/Vxyot1WJBueOFnI4B2XgwsVKy+zj98wahwSr699rwMOCEhlLF7wLF07BICtP7BShxvNqumMbw1aBqOpArhkeDjauKwB9yV2urXDhTN2PG21I1etQ007DeUJ4us8NVUMVh2HovFWTKmJtrOTghZDZN06fyP+FkB4+WMaJzxhrKd1xdrH9gdKqDrGSRrBxqowvtnk9/h0x+0jE8WVPHX3eO5KP8RxU5H5ekbL+JUvRpopSMCS9oDzsYc6T3DXa/fmknwvrYq1M/UKiHZ2V9lPZI7IARk7raasFKrtzf0xJ3pjYuiOnrkZ1YlB85Xqn0m4e0yNuZhTu4vBIyi7z0eRN4RWmeYCae+R/wYewtmU4mN935tdWWaBfjUMjdSsTwF8Q8ZpEoKI6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(107886003)(6666004)(38350700002)(8936002)(36756003)(6512007)(5660300002)(66556008)(86362001)(956004)(186003)(316002)(6506007)(4326008)(44832011)(110136005)(26005)(66476007)(52116002)(38100700002)(54906003)(2906002)(6486002)(508600001)(2616005)(8676002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vqrBzJeuiQUVpk4k+WO772BABwbOaKwu5wl5HBfX3FQ6pmKuVqOd1WS1ixEe?=
 =?us-ascii?Q?w7eY0kl0ypiwONLEIof8rO1/b17jKXtiJSb+3wTmcVt8143q9vG5lRVWHA7v?=
 =?us-ascii?Q?ExIhbGnIHKSpAEOzr5x/1GxBKUW+KY7rq38SdSJIioPtcsBqq+iZuQRauFyg?=
 =?us-ascii?Q?IATsmYd4ls/si/x6+aKV4qtVwXY94t3emKmZGolv4Y00Lt9TISu4Y8UQHYBb?=
 =?us-ascii?Q?p3sJjdvT4B4hiSQM/2sLmss737EkFr/f/GPmcBlh8jYCXpyIIX6ghpkS0ciX?=
 =?us-ascii?Q?Qvk8lfUQJzvhoYfym42kihudCTNB4ShR8XGu3+tbswF1hgq5Qm5O6VsbPyUi?=
 =?us-ascii?Q?lvq1v2DMvX6pEr7d6gwmr3kcCqvEJw9vaPKfI2Ds5ZA8YYVB77MiBMlJOqMZ?=
 =?us-ascii?Q?7m0K9zhBTtsKOZulJOfqj1J++Pa0xCXKXujPe7YwI7ui/lVa/ovcIBTfGoha?=
 =?us-ascii?Q?+Huk1sVzy2tfqnJm0QgqGVrmF69TIIKIVmmNdOxJtvFRFI/vvxz6btfcoEyF?=
 =?us-ascii?Q?6iXJyW9nhrihgZMmeDelftud0M0IPhgnLHJdri9tfI6oSxl/SS54a3It6zcD?=
 =?us-ascii?Q?rk9yR+cDwoFBo/XxWus4bLtS4ZOomaqgGnb+pLyCPuNECnRBIa9FWM1oKfw5?=
 =?us-ascii?Q?oeRrR9r/Zoo/IXjTOz/OSOR7WxvMqMtMOx/Tw988fWWgeWWXg+7cAoIMUr20?=
 =?us-ascii?Q?lqKdvQKcIqxUFxxCJbu3SXeP0J0X4swDh9UNimrzNLFGxTbqHnGgH8zzzv45?=
 =?us-ascii?Q?ZVM949j1pBpTNsnis4ZeOHBmT8M6/kMbewez3AV+gczsYR5BTzxIOE0Sn8SI?=
 =?us-ascii?Q?W/tGTTLArJtE1zwPTtF6YrzyPhAsYpCZm6RYz8S54HI8b0CjZtOKQksP8t1T?=
 =?us-ascii?Q?/PaOe9KDOZDHRwt81BTSgdSFg+N7ffv5Om08a/zdaUGAIgX2HUgycjYLMxnY?=
 =?us-ascii?Q?ZXoxTeYUdK0zKZe5RNrFqDAHmQItRWAAQw1KSsFq10WEPpx8RWvYWbyM5oF/?=
 =?us-ascii?Q?7PP8vDYUnmADvfB9ZFFdwO+a/by3+XAyrSawCFyaEwHQbNN3ryvCWacWzirb?=
 =?us-ascii?Q?0wMuTvb7gOayd9kaI4PXddxgDqhAgGP3SWTVU9xI04QAj9c9EReJI8lIs313?=
 =?us-ascii?Q?4cvt9z/ipAG7AurL7oWejt3njSF/wcOsDgJV5UeFsgH8dkuioxckMvGJWGdB?=
 =?us-ascii?Q?gBGIrlgsbJpf0EQhcmGyvKZMacKWl1vHyGRxYXsRESnn38lCq7ALY9vJocfz?=
 =?us-ascii?Q?+5/KzsKKB9Ccik/UZvcWumtDXLHqkpd5Lp7PX45rS7BTNUg8/4ZlXek8QWXy?=
 =?us-ascii?Q?jVoBf9PzrOf+5oJU67qF0wKf?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd9c98d-951c-41aa-687f-08d97f3f7b21
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:41:29.3379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFRDqHb1NSDKsuj0hE/45pr9aveg5HTQjluLxJIwf5Oykt261LA8uDZqZd+2/3O66P5lPdT3W7mfd/eG5I5r4VzALiLUMPHoSW1bOGLoQtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8111
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Previous patches added a way to specify some channel specific parameters
in DT and n-factor is definitely one of them. This calibration mechanism
is board specific as its value depends on the diodes/transistors being
connected to the sensor and thus the DT seems like a right fit for that
information. It is very similar to the value of shunt resistor that some
drivers allows specifying in DT.

This patch adds a possibility to set n-factor for each channel via
"n-factor" DT property in each channel subnode.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 5ff60b366be4..0fa4c02f5808 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -34,6 +34,7 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
 #define TMP421_STATUS_REG			0x08
 #define TMP421_CONFIG_REG_1			0x09
 #define TMP421_CONVERSION_RATE_REG		0x0B
+#define TMP421_N_FACTOR_REG_1			0x21
 #define TMP421_MANUFACTURER_ID_REG		0xFE
 #define TMP421_DEVICE_ID_REG			0xFF
 
@@ -303,6 +304,7 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	u32 i;
+	s32 val;
 	int err;
 
 	err = of_property_read_u32(child, "reg", &i);
@@ -322,6 +324,20 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
 
 	data->channel[i].enabled = of_device_is_available(child);
 
+	if (i == 0)
+		return 0; /* input 0 is internal channel */
+
+	err = of_property_read_s32(child, "n-factor", &val);
+	if (!err) {
+		if (val > 127 || val < -128) {
+			dev_err(dev, "n-factor for channel %d invalid (%d)\n",
+				i, val);
+			return -EINVAL;
+		}
+		i2c_smbus_write_byte_data(client, TMP421_N_FACTOR_REG_1 + i - 1,
+						  val);
+	}
+
 	return 0;
 }
 
-- 
2.31.1

