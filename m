Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2135C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:44:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7BD461050
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245481AbhIXJpd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 05:45:33 -0400
Received: from mail-eopbgr130135.outbound.protection.outlook.com ([40.107.13.135]:22144
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245384AbhIXJpK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 05:45:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVMl9nJlE8xI64zk1TrZ+KilpK2DYrFS+cBVYX9bAr4LhLRsQgxSxxYKj0phxeq2uq5grJnX0ZVSJRie+mY7tK48qa+yKTlC+zAq5fRnTT1B7TUM9hcKy8x+rhcGwK+LMsje6mUgfKaGMXZjh1GzQcrlQZn8YHRRJhdTAcGBKWT71VFn1Mmsxk8gQFb6ferHszUYebUjB8V5lIGnpSu4mC29SM7RPtmmSxW5lnhvAQYy3xyW7lkBjRJYW93L57fVb9YpNZOMMUGSKdCMBOh9ulIcugDhr2p+fBg101vGobuxxYbBGNPLriPwOP8Zq+G+Kc6HgKjm2JfZgRVR9V2ejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fjqHEvEd8hrsD3y67fdtljoWjba6IFeztxzF5zdJJQ=;
 b=KnIt9YCVvE3gZqLBZQ/2OFwg+oe9FFzbmuoVSufFFJKruaN1Fdedg/km1sCe7W1kZfA+z9rjRzkvx2AhKZCI81fStsZcqcxFNHGODuoyU47J/mXLq5yV4cpwUVhOV/AUGIU7PHY2R5noIsnpngci14rMcZg700lEvrPkRSnX6+rUZ8OC0eyxa4K2bYeQh7goNh09V2z2LF5vv5DkZaTn93jTb0dB8CXsf/3QmeOS5hDLjegaaBoecWMJQDQpabbI5tyOeEDSL7bkzQnDxIAdi8ZjyQmiK2O4gnrMhal2zpcx+WEJwgQSxDxEh51fpllaqZ3ccueuU8emc9GoZyi7Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fjqHEvEd8hrsD3y67fdtljoWjba6IFeztxzF5zdJJQ=;
 b=sRTiBjP2hLc7tYpDd67pfJfAP5y26K/aNScMB28bMDCFdvESzMjb246O01xCaOx42yLLpCJ0lD07vlu6j/y7r6kE+coRsg533gieoy3RGSOWpBJvCjWrEIAWUlU2ORfACBj4wDUt2Y92ZtR6t0qo+riGVLN5JGOZFbdSm+RUCDs=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8173.eurprd07.prod.outlook.com (2603:10a6:10:272::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.5; Fri, 24 Sep
 2021 09:43:35 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Fri, 24 Sep 2021
 09:43:34 +0000
Date:   Fri, 24 Sep 2021 11:43:13 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: [PATCH v2 08/10] hwmon: (tmp421) support HWMON_T_ENABLE
Message-ID: <b92b0feafcdac34f606f052ced27f4c025c5ca45.1632473318.git.krzysztof.adamski@nokia.com>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632473318.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR05CA0157.eurprd05.prod.outlook.com
 (2603:10a6:7:28::44) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.1) by HE1PR05CA0157.eurprd05.prod.outlook.com (2603:10a6:7:28::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend Transport; Fri, 24 Sep 2021 09:43:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56bb36ba-6b5b-45a2-d812-08d97f3fc6f9
X-MS-TrafficTypeDiagnostic: DU2PR07MB8173:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR07MB8173F6065D5EEE34744C14C5EFA49@DU2PR07MB8173.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +exkBo/xS+POHXZ4elnYmWDym+1S2VVQXd23LxyTj9Q8mc5UCO4MPnhb78fUXRtC4LuNWTzdmKetTLRci7Az1Q4Ket4vZGMKghExtoTIakwfIj6fZSizoHhHkRz+J2h3LEyCsADljH5mSIvxuy8++oFgfc9nCqJ9rWEvxKJ6yvCoAFj++EhT0lkZpc3QK1hfKzKAIA1LAgvN+vzMBwNFuEx1t/XIzyt5hcCMbtvuOXmAExKkMT5Q4Xkfp/unFORIEd+bMiirJ7oVYDFJAX2Mcu+8q+7mmh24+XieTzjV43T0KK+9knfRhEpJKHY0DXraMTyKLvNk+zrignxvCVvdHYb6fz7DZw/SCaT6jWbeI4FQ1r97SRKELCjj9cAyzkYSD/UN9DzImBq/zUSYWwJARHGtjRbEA8omSx6+aMF+ICrYokcGMGbz3lxbz0qoq6TIZIQLk20w2zM9GUfU0jucyWI9jsWmFGJH1s9jdmK0YMPkSDUcc+HZZaAfe99wMMVwnj39bHFMa9MFImm4QbvqmpFObPNSjLsMkqLbvFfQK0PS6/E8OTwvWjcXO9BJ4WPur68grcWN3p5k2TLe1x456XTXAmgsiJ0PKv4UnH/lJF/UpuOXVSQ8iq4ZMp1t5l/1bvvzEubq0R/caWCJJ1ng7f3AS8nDp46ixDo+ZGbyZ/9zkARp2hJKShfemDh9k0T+GXwSKolm1k6Uf0bE2nFseg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6666004)(66556008)(52116002)(6506007)(6486002)(38350700002)(316002)(66476007)(36756003)(8936002)(86362001)(26005)(66946007)(2616005)(186003)(2906002)(110136005)(54906003)(956004)(6512007)(508600001)(5660300002)(8676002)(44832011)(4326008)(107886003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wGyfu8ALdhrVyuBfH1Hv8/bP2Wxnm+uM7U9/Ml0ucwkcrNoxqavHeCqGekZz?=
 =?us-ascii?Q?ec0Buqh44LuFnmv9l89zBuNPkwo/+e60xfgjImwd7QS5YkRlldZUuAadai5L?=
 =?us-ascii?Q?Gj0zqF04lcqLxFjFdiOxevQkSdMszozmQpECCFP3Q+7coS7c5ufT+UxZmBUu?=
 =?us-ascii?Q?TIMTRQHUzTTVruUhWB25CKNxzx9L98MKNlPNr6VJ5IpEzj9M8CnJ+1GhtpnV?=
 =?us-ascii?Q?VFBgdoixBP9qTyr+gZH1O6hs5snK5qIvEE1fYMaPHC3E1+bxCcPvPPTzhjIB?=
 =?us-ascii?Q?4uZFnW74vzmD/EGleynjTYhkeei1OOWu3lEX5BnByUy4rjYmDZBy8xPN75JC?=
 =?us-ascii?Q?Q5JcCk+2dszpI6KFUq3LLaYhg9Gydc+9NSVXXMsgvinjHc/0veJpKq1HL4o6?=
 =?us-ascii?Q?mTo2Z+0hMduFZ4Y+U3ZDqlCNtqyTf2g39jTBvbOmaaw0wIiwROyd30XIAwpj?=
 =?us-ascii?Q?smN7YDJTS12Vu8QabJQ1CPKC+G2KykwGR6B9uBNUGsVyKuVW3wxTa5i+7OST?=
 =?us-ascii?Q?NP9XFYJbk0kAWQFWUH1QHyzkGP4xzEOFqFSEx8Aj25fzzWbSE6C+ekRAi8CY?=
 =?us-ascii?Q?VqepxImjia7Cr685nkarwX94XbS+TELj9uwihI2e3zwSq2pJxEJK4l8NKbIh?=
 =?us-ascii?Q?lX1uKpsLAVvAfzOHpQEytb5n+3MhiL4JthG/P3hqjc7GF6NzLjDu+5x9rjTI?=
 =?us-ascii?Q?AeLjvz/JS6x7/xnn8RWAE3DSJAkgrFOiY84e+LKc95fjR4yc5xcSawLfzn3R?=
 =?us-ascii?Q?Ou187D9hMQyBS+Zj9AFoVVZm0rZfGrGz7zUgew6dDsziNMsf+59wddHRdwKi?=
 =?us-ascii?Q?uo4RkNogWjD/jRW9NMktcEtUP1j/p7XpXKzcgcAkvzh2GakTTi8+m3e4GFx7?=
 =?us-ascii?Q?BTe0DVw7ic7mUCx/gF8v1Vlx32zoalB160pYz0+4W8GmtpHwjINnvmePbaZG?=
 =?us-ascii?Q?OabJk6stdmXUs6foLmjk5owJZnZkV5kheYA9K2UpQx3Sr6tWBIt3xjvFM9S8?=
 =?us-ascii?Q?RToAFs9N3J2IVR9JfDYNrMek99qFNyHt4O0L9o38FQWYkjHfwdkCk2P9xBiW?=
 =?us-ascii?Q?iUKrid01b9PYNMMRlZ9WE9EXSWRJOJieGPZNmzLiz0LEZqhmzXCzjA0bth2M?=
 =?us-ascii?Q?93AOPUFH7iBe7nyM9yicEx/5zR3nCgexWfcJRbbnIL4gUu9YKZABVXsndCCm?=
 =?us-ascii?Q?6LS+W7y76ToIRgR7MNwNIxPOD4wgmnSaBOIL6AduHSIYnoUN+RsY77Ud1ld8?=
 =?us-ascii?Q?YgTLfTm/zSYlGAgzQvp0aDsg7K0pbTtBX5Nsc3MuiL/R0eyX0WF/yjAZvVLR?=
 =?us-ascii?Q?vL3r4Rg4OBsH8W/WnIbP+mnP?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56bb36ba-6b5b-45a2-d812-08d97f3fc6f9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:43:34.9317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61hY19a+PFf2vmpPiIveEuHkT4BS4TXp7xnp6pyeL4kMvBdGfVQIdUcLjT69e/EvS1y+pgVSmnsjlFFUS33ncYRhmnMslz/yuCfi+zjtH24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8173
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Since the recent patches added possibility of disabling sensor channels
via DT, it only make sense to allow controlling that from userspace via
HWMON_T_ENABLE mechanism. This patches adds support for that.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 4934ce13afb4..3f3e5d6c9e3d 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -190,23 +190,28 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct tmp421_data *tmp421 = tmp421_update_device(dev);
 
-	if (!tmp421->channel[channel].enabled)
-		return -ENODATA;
-
 	switch (attr) {
 	case hwmon_temp_input:
+		if (!tmp421->channel[channel].enabled)
+			return -ENODATA;
+
 		if (tmp421->config & TMP421_CONFIG_RANGE)
 			*val = temp_from_u16(tmp421->channel[channel].temp);
 		else
 			*val = temp_from_s16(tmp421->channel[channel].temp);
 		return 0;
 	case hwmon_temp_fault:
+		if (!tmp421->channel[channel].enabled)
+			return -ENODATA;
 		/*
 		 * The OPEN bit signals a fault. This is bit 0 of the temperature
 		 * register (low byte).
 		 */
 		*val = tmp421->channel[channel].temp & 0x01;
 		return 0;
+	case hwmon_temp_enable:
+		*val = tmp421->channel[channel].enabled;
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -223,6 +228,24 @@ static int tmp421_read_string(struct device *dev, enum hwmon_sensor_types type,
 	return 0;
 }
 
+static int tmp421_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	struct tmp421_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		data->channel[channel].enabled = val;
+		ret = tmp421_enable_channels(data);
+		break;
+	default:
+	    ret = -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
 static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
 				 u32 attr, int channel)
 {
@@ -235,6 +258,8 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
 		return 0444;
 	case hwmon_temp_label:
 		return 0444;
+	case hwmon_temp_enable:
+		return 0644;
 	default:
 		return 0;
 	}
@@ -391,6 +416,7 @@ static const struct hwmon_ops tmp421_ops = {
 	.is_visible = tmp421_is_visible,
 	.read = tmp421_read,
 	.read_string = tmp421_read_string,
+	.write = tmp421_write,
 };
 
 static int tmp421_probe(struct i2c_client *client)
@@ -417,7 +443,7 @@ static int tmp421_probe(struct i2c_client *client)
 		return err;
 
 	for (i = 0; i < data->channels; i++) {
-		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
+		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_ENABLE;
 		data->channel[i].enabled = true;
 	}
 
-- 
2.31.1

