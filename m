Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938FBC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 06:58:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B3B96162E
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 06:58:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbhI3HA2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Sep 2021 03:00:28 -0400
Received: from mail-eopbgr00105.outbound.protection.outlook.com ([40.107.0.105]:16130
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348452AbhI3HA0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Sep 2021 03:00:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l67uHFYatzjLL7D66CRVBO7aJNAcCN+2kkqr3XOfcxSXphOvZbYjLG7o4sPq0tCp+sp6U9qL1xnM/CsUn+5UlBH2dd6cGLqGWHAap6XqPXcN6R52li/X8TjJKbcOoMLzDd8oC4vX2wxRv0RvagiID8kEEIXtdsO9F7joZ7SjwdFtv+ox5iIT5RPOw/MnXwCYz0R/OkmVI5vfmNJsaNLwUQFsUYv8bhQN0rqom0R8FZIUYJ6PRcixzTs99cfH1vbmfK7Vdjr0e38xOT5nrcTx8NGeiBPoOujGcJxrHFdlc8/LeK7L0CTTGzYK0HXSAkoKPigy07LkTeBCcCxO/Yr9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoYPuNSOpp/T3BnRykpbt8NPDre5R1E6Tj6/8E6xIjU=;
 b=kp36G4OgRwM4tNlr9p7iLmGieE3sW5VXf0oqUOoDXVH4lvngcVSJiDy8xdWDVwlH//1L+8NVkmwOuU5wVUBocHMP1xBWe6/BXcua+hfceLHhHweOD32HUSAehRZ4g4OT6whwcNq7vomU5Rhiwn3BuKa3mYLivQjJtrtUsXlkQl2m2Q0ih1O/qvRq4h3q8e+snBCPvlqtWK1uADn8Jg7uNWn70zAKJ+B6PgRNLA+/sKuAepSVlTjBiEINBk+H3uXA43FxJawc4A/fR7RtSgj6hGmDjrqda9wCCo+PRYojpLnSojINrIKyF5efJplDbD8+tq7Zp3afdGRq6YfeKSIqcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoYPuNSOpp/T3BnRykpbt8NPDre5R1E6Tj6/8E6xIjU=;
 b=T+5v30Y5itpVXv1A93FuRdqmRSodZJQ9p1xHe9Abzz19djbdCr8ZapZcFpeFc7CoOw/vfp7rpIhNU5VPqG1YmH3NBdOvkU7ZgdB45PXmBuhEME1MgwFQt0TGW0ZEy7oR8dmuDKjdqEeNAaYGluc60QRx1XtsYWVqNzlXdEBwLbg=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8079.eurprd07.prod.outlook.com (2603:10a6:10:23b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 30 Sep
 2021 06:58:42 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Thu, 30 Sep 2021
 06:58:42 +0000
Date:   Thu, 30 Sep 2021 08:58:28 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 02/11] hwmon: (tmp421) introduce MAX_CHANNELS define
Message-ID: <038441600e4477b5f82ff501ba404a2fde6f6aec.1632984254.git.krzysztof.adamski@nokia.com>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632984254.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 06:58:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92d12888-7b33-440a-f449-08d983dfbd12
X-MS-TrafficTypeDiagnostic: DU2PR07MB8079:
X-Microsoft-Antispam-PRVS: <DU2PR07MB807953A1B120A3F5A4D4FDA2EFAA9@DU2PR07MB8079.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r8kokBzMTvAXKCcl2akwkGjgaIQWjV2nfXL+RFDb+lnYzFB2uHyVn+mi2dJjT/9G3FTjQ1H3Pn4i41uoRofsQMbt+Ykby/Wt6uQ1j0pFkn+wlXoSXHuy3VF34Tj7BUlAPoeOFlKtMoUyE7w3d0KFZk0na3cekvbgO6OcJSlMJyDTr+s8o9tOr8DcKNthV99abX3Kqc/4qVo5mKUzqGJsILgZWD0Xv3QXMNJuwRziD+9m8Wen3pf1bZbVpW+sfl291TEmhYKTXrJlCTdjNo94euRaRN79fdbprOrAM/RwiCheJo6/dLX4eOJGOKH002ZaFh9yXGk57r7jBe33O865vhmOkl+sPMNCG5ARflIV/aOcWX9/HZWHhG3OyJPTKwu6v6ouUZoRw/Nm0G4bafo96f82GsBp9TfZj3eJLxSdtfs9/T+4VxrXCDnzhOa7Agqk+Mm8RecQLRNqZgjxz0AHwu/rmceaehCUzXdzk53NoCqOLsgTn4X0/kUY3LBKLrUaArn2knLT9RXZpLaDMtWy4p0fmbBuKgkkXLxyc6TljjNHtWefkgsIee/PlegyNIahbb590QVKEOCwIaBt5khDTI0/Omazd0QjOfXI0Z8ojBLIh9crpOvUBORTXwY39yxFeXUrxPHF+Opm1wtFZg1IgwU+D2tvyZWx/wy7kePPJ2HN975capmJlObKTC0dRtXmBlLjqZLgpQUfQ4YsqZNV7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(186003)(26005)(38350700002)(38100700002)(52116002)(2906002)(86362001)(6506007)(83380400001)(2616005)(956004)(6666004)(5660300002)(8936002)(44832011)(6512007)(110136005)(8676002)(66476007)(66556008)(4326008)(66946007)(508600001)(316002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nSxMEEU6bf8wv+30C7CQcOG6DgkUUIr1axhm7c5xvOpaa7/QqYhvCHDACCHE?=
 =?us-ascii?Q?1Ng/vspJ/Vs3m2b+i5lvwfHtETnVF5jwuguj5CccoHgmFFbqmDUXCjenCCpt?=
 =?us-ascii?Q?E0waINCjSKkpwYAr6d+EG6xXHeO9tZ2diMtFdwRGMZAhx7I92GLi6bri3pvZ?=
 =?us-ascii?Q?kwR0NIYYNblrxzGajb2Sv4te13mTHLN7UZVh3jooVWXLf+prqtnOEMcpNgX3?=
 =?us-ascii?Q?CUURwjmmUo+6MU6EOsMCek/XlMwSGOaT/TD4gQx23PJbcPn5ZW8/Ry5X/8KZ?=
 =?us-ascii?Q?6EwDqNgry1B2dCVcwnRGQfA44rE0slD6t0UqPUX5+eAnvDj5KirhJpLy4gdy?=
 =?us-ascii?Q?bzHERr7vuUqxx0u9Z7gVIaYMZJjDsxPNF3X0ZfS2pyzZC7AiEhe59fXvhLWb?=
 =?us-ascii?Q?vzXXPizEYZXrjecNekdqxfk9g5x+Ar1r83eSKjfK1Fd6PrjjH0S/Wk/wUaTJ?=
 =?us-ascii?Q?Yg5ZlEDDA16jUuih0pg8jKtXGXri55T7NmZN8WiDBEqIY1qMbLFQH+fMkkDh?=
 =?us-ascii?Q?wDkEu0mTLt2hgVDGRiG1QIxXKLrJvgD/y+pi/XvSXA6VI/lOnmSxOTasoNWC?=
 =?us-ascii?Q?5hQR1IvSu+u8xRpb/wE9nhinineDJGSI1ox0n6FziorGUCgFdHlBaqPr7354?=
 =?us-ascii?Q?hCsDXS0HQj3GP3PR3uuDIwut5FXTvfex4ziD7Tlg/4zVYbMbPpuYpQIS3/AT?=
 =?us-ascii?Q?zRUI640fesbUV5wpib4+CVV0osVrtKEfl3Mkg4RIrEMSDbwhI6wHkO1wI539?=
 =?us-ascii?Q?oALL8qXUvnX11llyH6/qM6wMr7jG7986unqYITJgeuDvPjpksDnq1w0hMqc9?=
 =?us-ascii?Q?0d0BtV/AEJVrJ0I/hFGoi59mb1gNjB9/EJy7XNr597KtuTFc4pINEcIdkkLM?=
 =?us-ascii?Q?p0eMKpZQ7FZ9nPsRDT1cvyOmJxufp6sLHcjM8UJw8YBuqXzU+pr15eB8viVL?=
 =?us-ascii?Q?SmWoY7l07ewbFUakRr6aEJ6OmLt2Vt7I8btoo2ub8gJmI3RuqIyogVZrT0vi?=
 =?us-ascii?Q?kF6H62arx1eu/va8plvgiyQHpjpJMDk5+RkOw9G/6xY0zhejzFbLonjlqjxI?=
 =?us-ascii?Q?E9c5nFRwkXy+NJiLwJ0AYqS21kDDCYxxccK0FscZPFYFZS5mBjkhDEDnpkal?=
 =?us-ascii?Q?qr/61kTQFVa8qlIvKptpy6xyw4sLAlO3qeD5hpDadi9iEA8JdFhBDoRbDH9O?=
 =?us-ascii?Q?SN8+F38RJpW1rbN1OWxSZLOO7tThXnUamCNSjMOS26r/QU8SF0iKowHwq+gE?=
 =?us-ascii?Q?pzuNjOOvqMeOIK1tOiB3ak3QozfDvpZFKQuSQDBC+m6U1mnWmP6v99o+JYR0?=
 =?us-ascii?Q?RJ8oKxxDUXN4IxAVzwQNjPer?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d12888-7b33-440a-f449-08d983dfbd12
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 06:58:42.7695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzJwqhniLBQEVx3hhp/2ZyDOyiRCsQ827vtGMtw+k/9MQAdsNpDH4VtDEuW7fH9XkJ74+DwgEBCkgCOqawDsJqcHnY6UfiGxhjF3shVdM3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8079
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
index b963a369c5ab..a4ac6e16d592 100644
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
 
 static int temp_from_raw(u16 reg, bool extended)
-- 
2.31.1

