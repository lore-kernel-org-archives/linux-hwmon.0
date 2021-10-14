Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D261C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:00:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 350D5610CC
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Oct 2021 13:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbhJNNDD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Oct 2021 09:03:03 -0400
Received: from mail-db8eur05on2092.outbound.protection.outlook.com ([40.107.20.92]:1761
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230307AbhJNNDC (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Oct 2021 09:03:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRX8vgdnGKTZUDtAg3XbmF5biTlYSqBminK2JUSdvxv0Hwe7F+NeM1vmoLOPxk2Zc5G7OE4yZefYBmtBYABZd+iU2DTMdurkwWTAYK7FiWHq1dCvj4o/USt/ZQ2Wk0zFcfZlaTEXnCwgUq4C6tJtIOecR6ySDnRUCwtEbSinXHsv74M+whejDd3/sjUhEcrTjCrz01pnlYjggqAHYvfEEan9VLNGhbOvwBYZ4Z0/eQt8+g9wQroymsjZT+IZ8mh1puL31Ab1wcgShZJYM4wWbvhdixvHCk2uMM7hb3b5AZy6ur53fIHPje5lJoklOZUPHU5UlPGzhDG3Nor9Iq4wOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6aUp2jPlV0q3I67jTGHGPbJGKJ5qwjzJwqHl9eSLaE=;
 b=KXVoEPfdU+yYnW62hBdHyU3hyIa18Jl0hsNe/zW/csaVP4R7rEvPiAoN9KMg9mWfMDvMw27Y2Y9NnVNkIv0nQn3UXdSV4seWjKOFU5beZcypCM0zF3vwQFgAxmwKwMJn9dHnGleLvDl0dmYaRWcEIEpJMi71ds0lblyOncVHPbasSRcE2hLlYA+1++qZNrxMltGZ0H6i6ZndI199zwWe4b/lv32moDXO6+roy1dc7nblTq2J2Kba+nxQ1jfoqQBqEKOoyKAsv1Zj4DfQEC09XvkbtJ3An5ULG9BC6TpA8lu3cXO76WM1R9op1zBZWVxODeuFONZleHHoATVwF3eYBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6aUp2jPlV0q3I67jTGHGPbJGKJ5qwjzJwqHl9eSLaE=;
 b=JeZaYMAcYWJg800J3t54RXhuClHXoLPLhfa87z6jA/Kversq+kDAnYYhv0MWu3LM8sxHGaTLnyG+id5UX4yeJiuVnij8AYiYciy/3a/dG9U6l618JJSt0dGOC6qFqpuCcGnW2MxkQTLyMI8uAOQvU0rXkxix1fqk/Ph+rCWZFmQ=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8072.eurprd07.prod.outlook.com (2603:10a6:20b:35b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.16; Thu, 14 Oct
 2021 13:00:56 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Thu, 14 Oct 2021
 13:00:56 +0000
Date:   Thu, 14 Oct 2021 15:00:49 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 2/9] hwmon: (tmp421) add support for defining labels from
 DT
Message-ID: <dab0fda6ac0e8d7f163c3762a7fb1e595a4d8159.1634206677.git.krzysztof.adamski@nokia.com>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cover.1634206677.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: HE1PR07CA0012.eurprd07.prod.outlook.com
 (2603:10a6:7:67::22) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from wrlinb104.emea.nsn-net.net (131.228.32.176) by HE1PR07CA0012.eurprd07.prod.outlook.com (2603:10a6:7:67::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.9 via Frontend Transport; Thu, 14 Oct 2021 13:00:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25bd2c87-bd71-4e43-4ab0-08d98f12a942
X-MS-TrafficTypeDiagnostic: AS8PR07MB8072:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8072A1A0F3BC1051552E52A3EFB89@AS8PR07MB8072.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ExPEbrwy5C9xRj3cwo7eph7BUvRProfU7wrRrbiVH3lZYNZaeo3HaVJQ4BdXx/CDRSU2Bx/sF580HQKZia1wBpogHYQHthemvxdw0jPaKmPOz2BiPdIprW8DwMsGBgA2Pen7mcoav2AGwm0gfAHOWNr4lNCcbmSckxkmoFrSoYAyAlOcIrWR2ZT+mxKn+UQN8ZAa1ePxNRYMaYpQ5vrZI14v1IFFGxgsPpQVL+Xecg9oKeE+wMe1xoakZnVUIAKKkkYN7codaSVlOS73mB0cA8VQjxYSEVf2WyKOpnwrU+4LaKiHwSRr41Gt38quvITXVkZ4kwxZeoXQWbSILyKHPgic7l6eMwT8kMdIbC3tCR5PWOh7jfMFGhXexJH8TVuZazGKTM+fnieOXiYTvQeziL+KQZ2aDJxWm+i8dHhvF5JUmk6YZrUiwVy5lAmNwYhg0wKVI691S+phHgTr8tesLMK8QjwIjkoC06TQg8QiZ3wTQecH+1TrADTQzivmjtwa+HLp4BuuZvRWnCzy2T08nlioukx4HLmRY73vHNlbPxgvjzfu72YZlUMUGG9ZNkDKC8LR6NMEiyhJ7H8sZ1wLrUJN8a7H0ls1htqZB6UtSpMiJ4AI43Kgp8pJpuTwt4cdg2rHlfxOVNtEn7/TquRhu8KMo94FnvtO9gNImj2Hs7HiIfIMiStxTUtq4DgdqumtRURS7XWinVc1x/noy8YfUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(66476007)(316002)(6666004)(4326008)(110136005)(8676002)(44832011)(6486002)(186003)(5660300002)(66946007)(6512007)(956004)(2616005)(66556008)(38350700002)(52116002)(86362001)(83380400001)(8936002)(508600001)(26005)(2906002)(82960400001)(6506007)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nBjvrx58AjAL0OvJHHHHjjJgOcrhz516b8ekOOMs9vMsHpiN7ydeSINnlbfh?=
 =?us-ascii?Q?DOCl9mCPd8lp91Y0Dcq+3hTivSQsJdkmxouq+O6ayR+6rvZthZHMlBBwFMTC?=
 =?us-ascii?Q?SZ4dE6HnR7J1SqVB+EYLHOMFAnI+Jfn/EVnrzYG7mNxkFu0bYSS4i6Gv6DoZ?=
 =?us-ascii?Q?w7fM1hDXIjBlVmXj/cvQYvCD4IHWA4LtqKLPgQ3TvYFpZgya89xHZ5HrRLGx?=
 =?us-ascii?Q?bBndLLQu2t4OVrq400vZMuxP+uk2Azfz8MUQEGf62CoeKkx1JtX0ImVR5IZj?=
 =?us-ascii?Q?ZiTF3IvCjM/cth/CySSj/Hc2BlwJS+LOKP4nfN4ERC7Jh36JW5V1knm01lws?=
 =?us-ascii?Q?syOCdAJUa4DUMOyTAf3iNh2x82sDFOk4ZcHufYQWEaIEvFVuqe6lyuCFaqzT?=
 =?us-ascii?Q?BCnWBdu/IBpb0GH9TOC/jjOgutGRkB3TXuy3Vj8JafFVrm/TiV7R3l6IlxIw?=
 =?us-ascii?Q?w+7sRiZPkBzYcrRBei9q6HaJcwzKo+CUmVa1q8MK73QfFuyjBgn0LKB6fwyl?=
 =?us-ascii?Q?71706KeAVHQw4xAXHaZ8jUfbDiAeyim8KrmDFu7LguiLEQS/pPYntBPRvh3V?=
 =?us-ascii?Q?VakTVErQnfSX61QRZEKQvrEVKZ+giFLIxm9usizq3na+iVy+JwlVQGrhMT8A?=
 =?us-ascii?Q?b2jRVg3McQ+1D2vLJtCktSlTI62TaezPfCMBGnYt62maOERv432IgZ1WqAjz?=
 =?us-ascii?Q?UinD7c6wVvq5ZCoerYnlTI7Kc8lZLPVmgiSwcf/1fxJcXqw3icGWQKdC4SdL?=
 =?us-ascii?Q?FRaLunfS/aNHb34L/SxNAg7dsaEe7zEZega6E/8I2438d3Gv6EiNhggalgwP?=
 =?us-ascii?Q?PV9xeQSGsGLkpTbIj1N3IWWBtdiSk0Ett1f130tU/voANjm7QCwRa6xeAWJ2?=
 =?us-ascii?Q?JCkbauH+BfyPxVi5okqHBIvn4Q1/HhHo64F5yb27FRzJ6VnrHVSfBMA2DdSh?=
 =?us-ascii?Q?Lre5h2Jl9URAkIzYbKeKIKlF59SyvLJ82wvEdFC2QvX4cvvzewCe40TjFG4i?=
 =?us-ascii?Q?+IR3n5uvxCblVv3bdaByoWhK3xCIJY2sKttitR1uBNwZlxRhlYuMKzHq+mkg?=
 =?us-ascii?Q?MaiJMKUbH/zLWw46C3OnPgtVZAWv2iMQ/QwmQXjFgu2nRhTKGnK5Ii9yfKrH?=
 =?us-ascii?Q?T7mTA2PZAJPf4XF1SYvY7r+yFGsElcUSjdFwVQwUhfpDkLQi6xWOop9hM35x?=
 =?us-ascii?Q?sROhGD41f55+4UiMNY9hu7IdpN4Z8qMAtkjkk5g4Ubck4M5N2bD6vVIbn0Rl?=
 =?us-ascii?Q?H0cm/d8g6hxwQ7r504MciYC1f7JomTNwci92bOn8U9odmBZGFY8L7u/tkxKn?=
 =?us-ascii?Q?l37Ji8kzFT7/6x/SFXaITenK?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25bd2c87-bd71-4e43-4ab0-08d98f12a942
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 13:00:56.2458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqWgcjrMFqkf8nLixTjH0h3Hp2mCoXBKmYArNVClVvPPRIf9HNU2IQJ1VBNAULKCSXxV9LKntcYuy0KyQH/nByf4kO9AZGPVm6LEXWO9clw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8072
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
index 707310d616a4..89346ca6c9a9 100644
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
+	if (i >= data->channels) {
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

