Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBE9C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:28:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8729D60F92
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 09:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235306AbhJLJaQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 05:30:16 -0400
Received: from mail-eopbgr130132.outbound.protection.outlook.com ([40.107.13.132]:33167
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232657AbhJLJaP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 05:30:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4GJxKvZvBaMKbWmQisVVpSdGtdeTsI688Ie9JL00CN8JGuew5VxLtDSqq5++DsYyTtyI0lHCdE0gpu16u5gMCyjeHBbXCFJ8cR5emHg4vOuP1yAXGDbng/tdJH952bKe7ZqfvwSzm6SpFqxQ0rXlhpnnVPGr5FLtLU52MsavAPMEiLG9dJybHvn84vhmeBssYupESdrgGAF+cvVt/rtBG59ME/o1t6rMvcdZb6P6g6qBfrPx2JgNO4jHTKSKIsXrvul0oe/xmFqWBtPojn2urOAuipmDJyRW03D+en2R2lHMy1cTtMMKGCQgXkPrASfdEwV4K8eYilGaUetKkPeQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9XfWASZm3m/nmDq8apLt112J7fvMqWOeOQE6rGfAKY=;
 b=VLbcm/0h1mAJAeb1dO7Nh1oSE0QqlPtE80gcD/45Cpe8V1neR+2lAh6li0+RY2FfDUUPp3rMuJyUCZLbkB4yoHQ7Xt0RJ1ualhKVp6zIs11Zt4J6KYxi+qi44vdERJDzZVfqKkq1GdtLna5Zv1zLKYvAlLIgNq7VG2q4JUEU7r6W8dV1fV+VV3GmJClIEhg0JSypfBSBFVncnTK62nWlxL+Ho+sllOGpL7J04GVoG0Nw8nwCUhsYB90riL0gi5jlZ3QqDuq2bNA1zqSJGEyhxVKbrK83wSkK8EzkajzCbyv40Gwv3WGLsEeHiHO/ZQQz2HBZu1ctDlx7m5ns3VHe0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9XfWASZm3m/nmDq8apLt112J7fvMqWOeOQE6rGfAKY=;
 b=h/XCpnRBdykYeJmi6HCIIBV3a1traz7vpQyoZjdbp3K/0SdcWUVSS5eN+iGhEJGLSrM8kchIVjrC8pgM9pZTSK37boQRuvbAtA6DxAmDexP/RUMaKkyM8TUEmDhJ3LlJM2xND+N2wJcpnZSYa5qDVKXpKh/nQo+LxEDpxghreJg=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by AS8PR07MB8281.eurprd07.prod.outlook.com (2603:10a6:20b:379::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6; Tue, 12 Oct
 2021 09:28:12 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::bd6d:55f0:170c:e342%6]) with mapi id 15.20.4523.026; Tue, 12 Oct 2021
 09:28:12 +0000
Date:   Tue, 12 Oct 2021 11:28:08 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 05/10] hwmon: (tmp421) support specifying n-factor via DT
Message-ID: <97068b3f1703db5da8fe9bec0729c6b3a79672df.1634029538.git.krzysztof.adamski@nokia.com>
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1634029538.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1PR0102CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::18) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.15) by HE1PR0102CA0005.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 09:28:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 352eb148-b9d5-4e68-3fbe-08d98d629c75
X-MS-TrafficTypeDiagnostic: AS8PR07MB8281:
X-Microsoft-Antispam-PRVS: <AS8PR07MB82816CB67B6F9F1AEFB69CEAEFB69@AS8PR07MB8281.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UZcWHQ4ArYrPe6Vz628BKNTzFTNtY2Dz8HG1KW8pgYNRSyJus3nU7v8oQRSAcykUQi0myMXLKjkx/aQ5eI4HOy2JdgIEElVJqUBzLXwCH+3xAncFFvg8A9SWgOMURtWSNHL2XxtSx9rRihkQiojCW2znZhSW7n8L2T2PB8KOvRwOuxe1PQNBEdIWxVTw9WIVEIZeuWhui/GLfnhvNx70LoKdTDvPJWILih5UZ+hlLPjk6fafqEXYm6jiVSqmGHcDFI/JGgQZi2177WVRYjjTCOitZh5YnDuYjWCPyKafV7b2MeASiuCFNfvrezDbqod1TuQ1+ujT3csol4POkaFAfSn3BNj9dniULdNb2/u2t6KXgJfUQfX3XNQsb4v0mFJMmnGT/lp0evChoO2I2/3fHaUHxupOFRRYEyUU/mFVpevG+62Tz7uQ2diCQZpet+IxfyuS6rUugMx9i/+RWiLPji7R9slCIJLI7ZztXObGcUmqsLx3cVpyyPzpUXi16poU6o1LwNjOGcxd5LEWlK7KthO9Q/V4WFl6oZeSd609VZCCh6oG7Ww+i3XpCJyTi1GRM2/+e83FbtIepPUkWxg5oxW5kjCOAES/Sbqpy6k0AW889GQfKXA/wpJ9Q3Ft77Go/NQ6fZFqOpaV6a8fd5V3diqVWUhYHs1sU2rcNl++j3wK7zV8Wg8vyqyOQMAOGZebUHhPHQq/t/qo5doHeOJgyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(6512007)(52116002)(2906002)(316002)(110136005)(2616005)(6666004)(38100700002)(8936002)(6486002)(956004)(86362001)(66946007)(36756003)(5660300002)(44832011)(38350700002)(8676002)(508600001)(26005)(186003)(4326008)(66476007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AL6iXPgtP5xHB+aArwcb8NoSw0TAT957FLKFRC/CdLSbCrZweARRqHJKQclh?=
 =?us-ascii?Q?avBsoEroqAyaMomucaqa8CejqlHz9VmdZ/lJGHUC4v55UMfpr2r1iotf3cBa?=
 =?us-ascii?Q?+08bFnrLPR51qcbuTbGIg5ufWRQ7HYS+0vdyJpZhlgPIUvmbD+Ehd2tKU6d9?=
 =?us-ascii?Q?L7tm/1T9KhG8r2Ryt9KcLnTeY5hzRy/pUbQnuBKObQFBwO0LbDkiRSiFOHNT?=
 =?us-ascii?Q?F3nxly6nH+ouXjU6bnqEYJqYbo404y0tHS7PUlONH3n1XrRtmY5hc/N9TCSk?=
 =?us-ascii?Q?2xv722TJ+GnOj3L/2WmRcb4wmSEMvdmVfgY3HwbLMxcvfp2Cykf30+CfW9OY?=
 =?us-ascii?Q?d1l1KgkkKdiQIivWYeB/lk8+yBO4nqJBE9LSXqN6Bkz03jlOC60WR6Zp6keO?=
 =?us-ascii?Q?/XhDhFaoP1ma8WRZM7eQeRME/tv4FZ/Zn9f86Hc/kOcPHe9SuJteWQhz34NY?=
 =?us-ascii?Q?l5cuZkQ/Jmr+IFY9BsjYiUKtIhgpmf8IQRRxXtA07FwvsUlkwPmjQUDT/nhS?=
 =?us-ascii?Q?pNqxxTT5u/gH/QOl4nDQmCfViu5Et6tDIWsj3I6/2SgFqAD0tSYVRGSSW9xt?=
 =?us-ascii?Q?ay15xTrPPRAInQ2kOVDFfRcYWeeRq7S93cUf2jeixJYPkgf2rASt5u7ttJo7?=
 =?us-ascii?Q?ywXbRoSu7H1ga/awaybTMUsXFEyQVXhlLuYCT1YZ1E4KFndjZZHX8fiFUstL?=
 =?us-ascii?Q?fuRZgftpjW23V4NT3QYotyFfY5qbV6BwpndKDnM8HXWrEBqwpEFsundqmnWo?=
 =?us-ascii?Q?FNm1vJBsb2B0Qn48WX8QdLF6saaZPAX8AhZl4s52mMBLK/Mhz0HdmEBqDtaL?=
 =?us-ascii?Q?52KaPZX37AdvqZHlxbLfR8NLEMuTc58t55JYmR71qOxjDVQe48tsdpzH380a?=
 =?us-ascii?Q?bP5PpY/3rXXnvm1zGqwheFN3sYnmeZ22gduOH8hcBPvlNafcUaMtSoARySmL?=
 =?us-ascii?Q?ng26sRRAZ0JSd7DisEOe08X0+MgEjOyOt1HitngRa9F4idXi9NZ+QbzkKJjY?=
 =?us-ascii?Q?O//EqY3HzWEV2djFzFfqLO+pyXgCj5PuR0gvThXf9QMHlJ9UESS/FZQrkGm5?=
 =?us-ascii?Q?0DSTPXOQ1AOnwtjwQZX42wkUX8xUwEjw2aXQFz0XgZj02JSBXAUJD4R+oarE?=
 =?us-ascii?Q?bFrqCCt83b+5+ZybStCEMlsEadKdLrsQeHptREKSPxWmwe9KuZYRxYsph+rd?=
 =?us-ascii?Q?iNVGKaqci1BUV+TPJtcocIipeeGndZ/DsBNArJh+LwlWYAifrsaW+EDMUZfP?=
 =?us-ascii?Q?bgTPnkN03pTZ+0/aMm9PmMualNn0aQFNgX+wGMCDuQC3Ml3q8vR8bxP+7x6T?=
 =?us-ascii?Q?oYCTw+Y7QVnpoxAsWoHyyGEV?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352eb148-b9d5-4e68-3fbe-08d98d629c75
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:28:12.2937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kh9f8J6B17uogN3zUQwSc4W4SR52lPqEzdxmhvaeSb0hk2mV+UANwtJsPf2Bw/pKtsXT2dr1DdlnZ8lqH9IJVdes4SKEg9z5yy8nlmzavOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8281
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
index fffffd671e34..fcd2932a6ddb 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -34,6 +34,7 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
 #define TMP421_STATUS_REG			0x08
 #define TMP421_CONFIG_REG_1			0x09
 #define TMP421_CONVERSION_RATE_REG		0x0B
+#define TMP421_N_FACTOR_REG_1			0x21
 #define TMP421_MANUFACTURER_ID_REG		0xFE
 #define TMP421_DEVICE_ID_REG			0xFF
 
@@ -310,6 +311,7 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	u32 i;
+	s32 val;
 	int err;
 
 	err = of_property_read_u32(child, "reg", &i);
@@ -329,6 +331,20 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
 
 	data->channel[i].enabled = of_device_is_available(child);
 
+	if (i == 0)
+		return 0; /* input 0 is internal channel */
+
+	err = of_property_read_s32(child, "ti,n-factor", &val);
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

