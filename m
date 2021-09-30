Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96AFC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:00:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99A08615E5
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348407AbhI3HCB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Sep 2021 03:02:01 -0400
Received: from mail-eopbgr00101.outbound.protection.outlook.com ([40.107.0.101]:35030
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348394AbhI3HCB (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Sep 2021 03:02:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBd+yHBXJTyewf3BWhx6B0jK8aJwbaykRkIqJ6v0zLvKo0vpwsjITkABZAoVb+D7kUSf2sotG/qmw9mSB7JvZyaURjcK5cEyyUnxaEo7SuPHwmE27XkRtoM7h0cuVmdB9/A0th5UevwviJpMUEnUGldocUzkT86jMvhkWAB1dsdRV0RdrdtGzJuVZArNpIYg2jlzTw+r80oJ+jyq3eunQL1mzmx0mndQfcGuxL8ptiiOrFSuLZ4dJjxsLY3gr7W5FYxOl/9asq4SQiJwJOv8Y+bU9cQ5JEX0PbbXE6h7XMnmBe8Mqk799wUCvqXjGgOaAy7zMxqyK/Fy/4khsIBauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRAoSN5Y54/thGmtM5rfuFjSHqRZmAXjvEDTwTk1pD0=;
 b=HuPCTvcwfUoGATujheRivSufJMT8aXecgYuLClNT0d2YLzR9qKYcWBs6tHDXLtGlckqtnfVx0mSefX7FDQ/9+SOVeuV0qfkWaB/inYyXcAqXZUK4vFvK17FKw6Z8NFDrRddpgaCe/+H3IgwjTf7N3ViRkZ0SVfhQE20LR5ZFYjbO4dAVGN0BftFYzXczG+UfzDqf0mGld6guvxq36zno5J86Kk3zJi5R5+KXzH2geLpRCYhd8KA0E9RvbrHRS31mFEK8/TtdHvAqiJaLyitm7qYIZto1+odZWSePegH4qQ1EuRoSE928twbku7ZAb5NEPsap+tHozyybOcSvcagLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRAoSN5Y54/thGmtM5rfuFjSHqRZmAXjvEDTwTk1pD0=;
 b=ihC2S4AXcvPKrcvAzRJScndLfb2gNLePOdzvlhnuo+55N5ySaQ7Mg7P8JC8WiGhJ27oRL+eT33Qn2y53PygD0PP+kjNEtUxuOXOFJC8t1KMOItXS3/Q0/wdz9n2jJZoUCj0KWrYCRg7jxWx1G3rxOusXg0plFf3p0K/w9gPepng=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8079.eurprd07.prod.outlook.com (2603:10a6:10:23b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 30 Sep
 2021 07:00:14 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Thu, 30 Sep 2021
 07:00:14 +0000
Date:   Thu, 30 Sep 2021 08:59:36 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 04/11] hwmon: (tmp421) add support for defining labels
 from DT
Message-ID: <b2aa14df2092e86191986cd558b48ee6536aa47d.1632984254.git.krzysztof.adamski@nokia.com>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632984254.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 07:00:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bc1fb62-d78e-4a81-ba6f-08d983dff3d8
X-MS-TrafficTypeDiagnostic: DU2PR07MB8079:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8079AC8E09C7F7231F9F37EDEFAA9@DU2PR07MB8079.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cmzWMfAe0zRtQKVccPg+i9UZOVD/7wU/f0L07gvnsxc2/ZnHxColmI5N8HxqldrKKzQkx0daHbDE3qebKhIJz/soavs/TNF+zUl6CjpssUb1hW0OAurPtMPkR4Kw1/uarGoPew3iXxAMbMobzlILKrhxqSiUDHXBWbvYYkbPSse22AY5EWxYx6eiz637Fbel7K9LvZYro/+n5VrMmqlmWPpqv/ZJnQBNZCP+Y+HOZZ8ZWj+kDIw/je4LDPMOj1qqQaVthgqQYWdSu6EcqYv6m/Irp0OQkOVKBUBZOOJW9Jcx3u8Zbppq5Zvw3T71dcTDI0f8jb2nHeAiV1PJN67QYmF67cpFZPLfiM2WK2W0p9Z1mKg6fOwKU0QsMLcDw4LsKt+5DYZNwGY0gbZtZghCLmXCH4j2wird7mzRYD6/A3AZRztI6TcjZPOlK1m/BJ1vWrSJZfyMbdSvDpnH98d1w50tqUnB4uXRIGwVd5i7f6ZIEUGTmPhQZrfbQscuJJOh0ju8S3wmMn3NftPBTgnD82ftHj31ZTHeZgcJ4sYew64z3105EadD6Kwfo53k8+9/Mu6x+70xHY4Ah/xI6Vp/cyIxn9cgJRk+Xo++hwf3vbosowmwDG21HBIDqUo1LBBCCrD3KXM4TkYHwPkYgSXPL4U82JLhLmIvNa7uiEZzU1qOu3uVbdO5Hz/rQ5NKqOhwzN2MgxhSgtHcsS2u7cbSUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(186003)(26005)(38350700002)(38100700002)(52116002)(2906002)(86362001)(6506007)(83380400001)(2616005)(956004)(6666004)(5660300002)(8936002)(44832011)(6512007)(110136005)(8676002)(66476007)(66556008)(4326008)(66946007)(508600001)(316002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z/dbFnzd0X3XRCe2XC9WG2UK7I0LaGxEG6GBli/rL+9lhUej0wiaSLjTTQXK?=
 =?us-ascii?Q?MSR6oxZJs62qJ2+mY0L6h2t6eFCTd9LB5+vy84itT/mh7orCMK+JFZ9j8Cx8?=
 =?us-ascii?Q?eUz3P/02mqkbg1iFL5gwxMPt+sTlyKvwnmBqGrkRVE16k5Yw0h6H0QzIuys4?=
 =?us-ascii?Q?fRs+8Kqosmw9QSVXU6/dkhc8sABfb3UjHrLo5xo08dQWy6NSKGCkmTImzoUW?=
 =?us-ascii?Q?xuiyYYn5JMx7Y8LfFyHL62j6j6C0VYwSsIhhxsJaKx+juN2tmqh7OFb0KQxT?=
 =?us-ascii?Q?6xjFmKPVUredRhPbLSjYTC62tuUQfyOhS69kDZXwKdDA3ACy5M6frzrmRXaP?=
 =?us-ascii?Q?3RpT4gIFyoWRJMfkIvqra25q/uZ8A7KacoivS6h3/5dev1zWmGCXuiYcZG/W?=
 =?us-ascii?Q?P750kwampa8LUoWPqQKXAw3l6HiNt/ZnvSYxiPmZ1rIAG5J0/U0kRor19YJV?=
 =?us-ascii?Q?/QnFvkjUDYEUeB/dk+KG5G8iyCOjMGbBVpUKhg5lhcvWnjEizr0ir3QdQ3Pp?=
 =?us-ascii?Q?tLIa91srL4rWKb9hVVGyQ4paVsTLtDgo7jA3294JJwAusxKdy18/16eFTrrf?=
 =?us-ascii?Q?4tu5DcWB0Zbr7BlFxDA1DRDmr7aseznUb9WV08qYeVa+mUqTEs58g+OAN27K?=
 =?us-ascii?Q?ZHEB38QiaoOTohomCtbyhY7z6SDRbtOyb2YFRRdCSHT8CogsA8XDOpCx0f77?=
 =?us-ascii?Q?mlrLc9HL/eEnP2DwYWo7yj4sUWVWRz/L786AowUrrwKu8PfVu6I2SD8vHVIh?=
 =?us-ascii?Q?Erew/D1uJYWzu87+ZrQcmrm1DbKHNDQsMgC1ncKW6BeovaigW0H5/RRE1m2W?=
 =?us-ascii?Q?qqSWk9CAFX/g88OGy+jtbBN57KoebNigcBJKHzpBJXJSq8IeOhORyh2usveP?=
 =?us-ascii?Q?HTqz4MPK+vgjpY8aU4j/yTni6o7Wt16I546x2U6qldg0oKER1FhQP8muzaNx?=
 =?us-ascii?Q?OPeJ2kSZrjxomM1c9ylFZgivwQW5aElDYqgAVdLkN5WOjCxsNtRWHT2Htelx?=
 =?us-ascii?Q?visTo1eAeM0bR1cjcR8ArWvdEBDYBtNJ6IPUNyW3isK924jo9yF9GSAbHbf/?=
 =?us-ascii?Q?22Y/tifqNcBUOUnhqsV03lY9LNzVsB5PMnkjcNcRQY/ztGpv8+SAuySgcTHQ?=
 =?us-ascii?Q?QqANEZMkGNb0c5kgKsHIMgGpghu8wKXOcyJz7zbZccvE4pq1JUifZfobMtGt?=
 =?us-ascii?Q?V3n0vXe5Jg4vdTxTgi19wGTdAAbKEUkQZYRFKMM+uVQ9w8zwg36oQtmMpJmZ?=
 =?us-ascii?Q?qRJXzuCie+uJGvEvh1xFzntIdk6HeFU04P2L31Vm4w6iUe2qWFPMtxGhHiYe?=
 =?us-ascii?Q?anKsAwEOXPF3V9M690UeM1M+?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc1fb62-d78e-4a81-ba6f-08d983dff3d8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:00:14.3460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNkNOk68BCenDbgz9y41A2DG5IEQLbZM1DJlf0bCQNNx/CAUyRyLwRU9he1R3N6WL8GIAT/rNYF5Wjeyb72NkjLi10/YYBYDJMOIx0ck4Ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8079
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
 drivers/hwmon/tmp421.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index f3d59ea347e3..7feef60a592c 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -88,6 +88,7 @@ static const struct of_device_id __maybe_unused tmp421_of_match[] = {
 MODULE_DEVICE_TABLE(of, tmp421_of_match);
 
 struct tmp421_channel {
+	const char *label;
 	s16 temp;
 };
 
@@ -187,6 +188,16 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 
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
@@ -194,6 +205,8 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
 	case hwmon_temp_fault:
 	case hwmon_temp_input:
 		return 0444;
+	case hwmon_temp_label:
+		return 0444;
 	default:
 		return 0;
 	}
@@ -286,9 +299,53 @@ static int tmp421_detect(struct i2c_client *client,
 	return 0;
 }
 
+static int tmp421_probe_child_from_dt(struct i2c_client *client,
+				      struct device_node *child,
+				      struct tmp421_data *data)
+
+{
+	struct device *dev = &client->dev;
+	u32 i;
+	int err;
+
+	err = of_property_read_u32(child, "reg", &i);
+	if (err) {
+		dev_err(dev, "missing reg property of %pOFn\n", child);
+		return err;
+	}
+
+	if (i > MAX_CHANNELS) {
+		dev_err(dev, "invalid reg %d of %pOFn\n", i, child);
+		return -EINVAL;
+	}
+
+	of_property_read_string(child, "label", &data->channel[i].label);
+	if (data->channel[i].label)
+		data->temp_config[i] |= HWMON_T_LABEL;
+
+	return 0;
+}
+
+static int tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
+{
+	struct device *dev = &client->dev;
+	const struct device_node *np = dev->of_node;
+	struct device_node *child;
+	int err;
+
+	for_each_child_of_node(np, child) {
+		err = tmp421_probe_child_from_dt(client, child, data);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static const struct hwmon_ops tmp421_ops = {
 	.is_visible = tmp421_is_visible,
 	.read = tmp421_read,
+	.read_string = tmp421_read_string,
 };
 
 static int tmp421_probe(struct i2c_client *client)
@@ -317,6 +374,10 @@ static int tmp421_probe(struct i2c_client *client)
 	for (i = 0; i < data->channels; i++)
 		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
 
+	err = tmp421_probe_from_dt(client, data);
+	if (err)
+		return err;
+
 	data->chip.ops = &tmp421_ops;
 	data->chip.info = data->info;
 
-- 
2.31.1

