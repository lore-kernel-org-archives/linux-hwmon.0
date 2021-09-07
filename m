Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A52BC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:43:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21CA761102
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344726AbhIGNom (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 09:44:42 -0400
Received: from mail-eopbgr70109.outbound.protection.outlook.com ([40.107.7.109]:17134
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344752AbhIGNol (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Sep 2021 09:44:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KscfeUPqGXyQaF6U/2AiGelowBHfPhLueYoYRZtJfIjNjgJ4CqFxVJ5x0dlNinOrd6Ss2DbxFZ2lnJ5L+qdAnyeqiKIcNtIxK+6LoZisV51CcVX6e1gbjb0Dywl31aKUNSKH1LMqQqNqff8YH2fzCvll7Mv1CgmcyV3hZPMTAMMAYJC5uzIOuGE476XCjbrFEIPlCdBpUouAnz/hTDZIKNJTTG4jt8QSvZox9rduHon4u8ci5Y+sUxVUN65FRhyCwhPrQyoTgyFdWtPp8sm8srWc8C4GHK+Xtx63rFynriOoJbpuR0c4DWZKiBk91HCj1Tf5eFL94YsJa6WXvUmnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xj5my7WxshMC3K9ru11z6QN/OTS4xYdeuLRftLc929Q=;
 b=fzgJp2fhb+LTeQOvJQAhTNz6qRIVZyGo4uGtCwfkrEYbGzvfuEWCz6f2u9oqRYXQZByaVok7yroDk3TZrrGzrKQ+OQlDtYQCk7qMIjHukrwpMf0NxS3NEpZCWuYEzHZBhz9fRWvw/nKz1nb3C7KsLnuWUOdtvR5A8f7cmwd2eN+4HMDbOyNFPvW90AKJp/zmaufGoSS7z8HmzOy82yjHDi9dhrP5Xd63LA6I8SAozTr//S+OU1N/0+Mau+ARV6hTN3CzbaPY/PlrYaCveZ5TM14irf3hkg+Cx/lXykoiAxMm3FQfxJDp/DAQ3fC+jVwtkshYxUt19u2NHe3VRUt5mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xj5my7WxshMC3K9ru11z6QN/OTS4xYdeuLRftLc929Q=;
 b=XGq8pK5lB0gz3oO+bSOWbWH5TVIxw2l8Pm59+hIIm6Bi+2RxqEjhvJ1bLhfBQmqQ29ENEV3cuWp+BaqIPdoy1nzxdePkQ+HXe/cmioyqgeaYW+fNtQ+ayn7m5dtseqmG/XiqzWBQZjzDq8FPkTjFfHDpPcb0RcPqPy3AcdcuN44=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8239.eurprd07.prod.outlook.com (2603:10a6:10:278::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.12; Tue, 7 Sep
 2021 13:43:29 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Tue, 7 Sep 2021
 13:43:29 +0000
Date:   Tue, 7 Sep 2021 15:43:24 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 4/8] hwmon: (tmp421) add support for defining labels from DT
Message-ID: <22639314543a98b4c24e55b7e5a803325ad9e568.1631021349.git.krzysztof.adamski@nokia.com>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1631021349.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1P18901CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::25) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by HE1P18901CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 13:43:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5932794a-d568-4615-4b78-08d9720579ca
X-MS-TrafficTypeDiagnostic: DU2PR07MB8239:
X-Microsoft-Antispam-PRVS: <DU2PR07MB823942C0F49CD2FB811E1990EFD39@DU2PR07MB8239.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z4FeFaf4rhjeV93cqd+MNjRDvcGj2oQg4rA0XRg7BUxPfE9TtavSzV5faUDAZMtX//mRdYEj5QFe+Pc+rJ4t0523bDz1rgsruyOp2o7c7A3AGTAeNOmlIW91mun6eIuMTk/Ap7YSdr85eIbUVytmVQyqWusV2NuGoIgz3cA4gbMj1umIYfIu+zo/IeAGnNv7/hGh3ISHXrfGqZTd/iMO4Smz2tNNw5FY5EtN+k17MLL3IpiXkhmPJlyUJr+dkFzNe3mSBRIRDdXNmwLywRBThGd7ZZtKmdpjp0n4VvyD+Lmkqa31R+DIlp5IbXGpBK2/9ESaHhYEs3NYpcZ5PIflqdB/2S4ah4yLD0CD1uSph6d/YjYbkU11e51ULOyACiRMvYx8Pygf+Dna/9xf2A5ItAjL20oeP15s4tB0N8VBXqt4NW4bQr9vBrAj2N/PBRNeQgKxHCyX9ecAYURJZwv2ovJbs+EqQfkUY96RwfBtu0PbrHY3oDLTJk3m/Qg3cRePvy9EIM0Xfrud8weLtad9xyQrIRDOYLPZw9Z5TcVTqa6reMfiZr8bmBHZkupulvl4vL8PMnGV3ABWICxVLfInLTHbrI/ECpTOx+ERnDf/JOaRQ9KsmDh2gBIkB3T3+1yGqTXpdmrw9lJ0d/lOMr/EsR7cA8Zgj0OerwnSeCVgxMqwgEDn+OtX/+jxqFJFTSbP+c+vj/2ctXd9gxvVjxacHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(86362001)(26005)(6666004)(83380400001)(66946007)(4326008)(36756003)(38350700002)(6512007)(8676002)(8936002)(66556008)(5660300002)(66476007)(44832011)(478600001)(186003)(52116002)(2616005)(956004)(6486002)(110136005)(2906002)(316002)(38100700002)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cI+P4uW/P8smRLhUwpgJNytQlBuHuAZEOM/0LTlQ5YMDSPEUxxkO/yq94NkU?=
 =?us-ascii?Q?Clkcb40c+w2dzRUv/I2P52KhdJ6ENQdx3nURYszPdPVaHs2lkZbkcRheWiNq?=
 =?us-ascii?Q?q6Vk3sw3n6z8MWtaYMW2gyW2qAmQtHDrIMuMnWkiTh0fMAkQE+bzO5ay9+0i?=
 =?us-ascii?Q?GJE0YxbSALiZgnDDPcDZ4YIUEk6D9VdBf3SJxXBWLcDq1NVV0ZCW6vy5etcI?=
 =?us-ascii?Q?l4b1JvhDjmNP7nvuo7AIF2rLHPryU0B3bq6/mnMzYg9rkj7vz6Nqz4QgAIXa?=
 =?us-ascii?Q?ocUxofzxIEjD8ZRnH291H/f03ZkyLmK8qwB4al8C95rCjAQGjBlGxHMtQVms?=
 =?us-ascii?Q?uX+BfTk7QaA4UjtlWaAOlcyWcKnkuX0ui7UYEImmEAlZZDU2Itwzgtbww2PG?=
 =?us-ascii?Q?vPIMOzWvBSk2ZcirOrJBsIplFxAxrKowpFDV1fTLpHPolmv8yYuSyQ2VOEwq?=
 =?us-ascii?Q?9ooLVXAVij35WdeLeJfQda5kYrZVvYGmBrpvdL8K5d9kJWT5B0cJp9+Ssd4Z?=
 =?us-ascii?Q?ymfjfYdsz1H2O3lYHMMmiUlRHa8MAgYXRSpm09RjfvXmCAlflXN+n2P0+eB3?=
 =?us-ascii?Q?boN3h7EbzspYnr55xRW9K3hdYZn5gJJ2/38g3qov7J1sZcf3W+eDdVKQ2QLd?=
 =?us-ascii?Q?hcomyDSvjrrHjuWnma0yncCjN8liwiruxFWZJmP0x2zrC0IJf4G2WjSq5JaU?=
 =?us-ascii?Q?3thIpgNPQbMSKwjYF+h7FjvGapRZ+q7gtuA/p4G+Uc24tbfMQphjKxzy5yo3?=
 =?us-ascii?Q?qdFM/YYH6yEQ7ytvvcHhOrRG2qPbJpoz0p5DV9a8W6zJcfTsW3yf8hkvYfEK?=
 =?us-ascii?Q?UUeHAeWJtYlDH36OV51971Fpl7jqHfxKojmbl7TNvCi8vSwYr0wP2cdxzx+g?=
 =?us-ascii?Q?xwhWi0DHwM2RUzyGqizY1EQ5VKsc6rFi8iv7unCa/dfTyuNqD3nIJinE9SkC?=
 =?us-ascii?Q?wtmo1oUWsge9KmisRdYW0dMJmxay7OIUecJuThplMHTTt6irBPMiKd3MkR/A?=
 =?us-ascii?Q?fNW8iXUrM8ls9uFKjJydD4eCamU/ETaxNxiPlDJ4p5RZYOLkLGZOB4Xar3zX?=
 =?us-ascii?Q?/jyIxBuS1wvBJMgYTyla5HL9QNI98IyVdXebCa6mSij70cr+6OF0ReaSD7vi?=
 =?us-ascii?Q?BfBnQyZps1xutg6K6AMhauaV7SFv64rKj7iw9PtND8A8DyelPZ2RBTSD0RRS?=
 =?us-ascii?Q?60sM2+hMSzBkRQnnuTYwqTVh2WNuqK9FVWM9Zo2eU6ccTXy72oE5q5mafaPy?=
 =?us-ascii?Q?W7yLM6+dPOkgi64Q/hhyw4WzVA+UhgPaw0uJZbG0mcaFLNUaRVXcIEMuuS8b?=
 =?us-ascii?Q?lZy5VlFCJAUrrMeBsHy0JDJK?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5932794a-d568-4615-4b78-08d9720579ca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:43:29.7083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+fn4Mz/ZxnJDiWaZ4Lxx1ys7Eo2qdvzqwIw9wxfLuLmOipoLg+L/QcSCbI0DubNCWZaXehckRW0Q7V6eyqa4nE9f9dpHV/yUXJD4N+x2FI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8239
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tmp42x is a multichannel temperature sensor with several external
channels. Since those channels can be used to connect diodes placed
anywhere in the system, their meaning will vary depending on the
project. For this case, the hwmon framework has an idea of labels which
allows us to assign the meaning to each channel.

The similar concept is already implemented in ina3221 - the label for
each channel can be defined via device tree. See commit a9e9dd9c6de5
("hwmon: (ina3221) Read channel input source info from DT")

This patch adds support for similar feature to tmp421.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 1068fe59df0b..a1dba1d405ee 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -88,6 +88,7 @@ static const struct of_device_id __maybe_unused tmp421_of_match[] = {
 MODULE_DEVICE_TABLE(of, tmp421_of_match);
 
 struct tmp421_channel {
+	const char *label;
 	s16 temp;
 };
 
@@ -177,6 +178,16 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 
 }
 
+static int tmp421_read_string(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, const char **str)
+{
+	struct tmp421_data *data = dev_get_drvdata(dev);
+
+	*str = data->channel[channel].label;
+
+	return 0;
+}
+
 static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
 				 u32 attr, int channel)
 {
@@ -187,6 +198,8 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
 		return 0444;
 	case hwmon_temp_input:
 		return 0444;
+	case hwmon_temp_label:
+		return 0444;
 	default:
 		return 0;
 	}
@@ -279,9 +292,45 @@ static int tmp421_detect(struct i2c_client *client,
 	return 0;
 }
 
+void tmp421_probe_child_from_dt(struct i2c_client *client,
+				struct device_node *child,
+				struct tmp421_data *data)
+
+{
+	struct device *dev = &client->dev;
+	u32 i;
+	int err;
+
+	err = of_property_read_u32(child, "reg", &i);
+	if (err) {
+		dev_err(dev, "missing reg property of %pOFn\n", child);
+		return;
+	} else if (i > MAX_CHANNELS) {
+		dev_err(dev, "invalid reg %d of %pOFn\n", i, child);
+		return;
+	}
+
+	of_property_read_string(child, "label", &data->channel[i].label);
+	if (data->channel[i].label)
+		data->temp_config[i] |= HWMON_T_LABEL;
+
+}
+
+void tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
+{
+	struct device *dev = &client->dev;
+	const struct device_node *np = dev->of_node;
+	struct device_node *child;
+
+	for_each_child_of_node(np, child) {
+		tmp421_probe_child_from_dt(client, child, data);
+	}
+}
+
 static const struct hwmon_ops tmp421_ops = {
 	.is_visible = tmp421_is_visible,
 	.read = tmp421_read,
+	.read_string = tmp421_read_string,
 };
 
 static int tmp421_probe(struct i2c_client *client)
@@ -310,6 +359,8 @@ static int tmp421_probe(struct i2c_client *client)
 	for (i = 0; i < data->channels; i++)
 		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
 
+	tmp421_probe_from_dt(client, data);
+
 	data->chip.ops = &tmp421_ops;
 	data->chip.info = data->info;
 
-- 
2.31.1

