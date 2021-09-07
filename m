Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11893C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5E0361100
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 13:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344824AbhIGNqu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 09:46:50 -0400
Received: from mail-eopbgr30092.outbound.protection.outlook.com ([40.107.3.92]:58745
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344814AbhIGNqt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Sep 2021 09:46:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hidxxc9Wg0EIBTtzWHzN0rCURaldE7n1ztihppcoGDKuPZSn/QQVgjTjzVfIWSvRulxmOx86Qm2oPMYMyix0mrCHKxlw1AM3zK9pa/9+mUWcCynjbMr+7OxS3lFWuJzFf0swJSmFuCDbKSG9mg4cC/Lu09C1oVIFTs5q8uSF3HOEMXZPqFJodDQFNTXWfvRqzw1+FYpYXA+NPQCmfDwF8quhRBvtSMuKQ7Q+wSDW5oh9bLtVD36zZ7vG6umu5FuedMWKJENtG4ZTPXIYPjU+2w+/Z6nJPj50afDI9QTC+Qxp1tQP1EullVwhc8e1RKMWVEVNHT8iU0gtae1lcVbsMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlrgkwfyZ4T769jKIA/bOWIXkKz7D4o7VAUEA4lOzuo=;
 b=D0tXGkSf/tCc1B6FA24+hTrHz8nBDffM1rsQB3OfebbMoQl2jKH8eCgI54Ra5XHFPbjRdKqIBbHr+Hg9jCYEaWRKuzXbmQbKrPTrTk7sbRiomZ1lAMUcwUhQcZZ7vI0ZJgfT9V3Gdxlm0IiD0Q7IPPyVTQYPN6drJkI6WWc4Cpl9oHW/P8sfxelyne+FvQwUiaPRe918wz8UoXwDx0jnNybL3jTaz6ema4mipi26MoZFCw3LvRS64Gj9SdlMkdqApD6le44JqrDtdp/yW+CNPmFFJIBGG3flsTw4UPcI+OZNkftYXfS4w7OGsxyqzNENYXBQ4vwGqMTRa/jXZ7IXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlrgkwfyZ4T769jKIA/bOWIXkKz7D4o7VAUEA4lOzuo=;
 b=tsKxdl1ftTvb3mC/7Qt6NFR7+feY+pV7EegKHldBFNUjMTBN0aWw5Z+iIa3n+fKVSlquSxItTdl7t1zIWf7sovkA0DaS5Af86B/TpcU+FUsoeVHVytR6l/yUHL5THaZFrxUQeToPw78NT4K/rzgpUDP9BuCBXzUSV/+nEIY8dCM=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8221.eurprd07.prod.outlook.com (2603:10a6:10:272::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.13; Tue, 7 Sep
 2021 13:45:41 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%6]) with mapi id 15.20.4478.014; Tue, 7 Sep 2021
 13:45:41 +0000
Date:   Tue, 7 Sep 2021 15:45:36 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 6/8] hwmon: (tmp421) support specifying n-factor via DT
Message-ID: <546898c479414a00e9caf8902d8d8db082a02668.1631021349.git.krzysztof.adamski@nokia.com>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1631021349.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: HE1P18901CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::23) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by HE1P18901CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 13:45:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eac74a5-5d33-4371-cae3-08d97205c7eb
X-MS-TrafficTypeDiagnostic: DU2PR07MB8221:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8221AC7E6909D32F147BEEE1EFD39@DU2PR07MB8221.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: esYD7Jpu5quGxBTfqdDC1R6kZfDWp6JZUVroPp+DCYNJ7bEzwAOm00R+lfpgcBkJl9tQUXZhbhsaDwGOct8aEmoQJGK0/DgThOQqk13Wq0EOBac6mU50OL8kdEZFFPtZ8TSVCEZwU4XLXqQ02PjYwwF/jTG3MaRnsVpK0RhSIZ6uf7jQhzg+KrYI9qbF77aJiOAIo33ZFfB8krCoMHLS07PhHhETxGPOBjxnnUKs6T9cTy3UEzeJ+qmQBeBNm2WV34v76euHrk5FsWRirwPPdrowSHktsAX3GOZjPCm01yeY9fmq5Brk3VgJaM1h8Q70p6dY3ZK8ktcKp3lkmHxpEnA2OOQF9WvTF7mRKaKu47EDwicxZITzxMRhIs2r44J6af/KbAgd6zV7HoxZVl6pr/5rIeNGL187NGC4rCv25s2LrQr4icZAZl5AJ27gSoUNeEGulPhyVyJg3TjPFLCo5f/jM2bo5iaT91xPBs6wBtPr7Oo5VWQaR2H9MWMw9HdnQ8dzr/6auHdi78RjXfvXm1M++RV5t5GiXrO/ECY2mAvM/awayyuK5RXN89Ud1Aki0cMpdcVudsl6IPpOEb6K5maU4pyUhVs37H5w5XRVCmXZ0ZMtFvzo6hd6P1raJxKKjiXr2bcCVfP/AVxBRlwp9s3xfVWa/2DejFujLAlkBbeyRzpK1Hizql2EA+VPsaaojm3fH4xEd3LjkmuAMzfViw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(186003)(38350700002)(6486002)(8676002)(66476007)(8936002)(86362001)(110136005)(956004)(66946007)(508600001)(36756003)(2906002)(316002)(6666004)(44832011)(38100700002)(4326008)(52116002)(6512007)(6506007)(5660300002)(26005)(66556008)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MXxnLHTO8eEyX+oSrpw1SpU4cD45ojPvUVOdEw9X8zQV5CLUFXXhoxmT5eUH?=
 =?us-ascii?Q?+Zyj5jyFCwLZaagx7IIPcvIh5O7WAFUxPj4ie3M2ZK6mRPE2/3D3GpZBBOlH?=
 =?us-ascii?Q?mueEUXvOaPbdmwJSCalfOWgpESrGguaG+rLDMRTx9wkoJODEUjSQxzUL6grf?=
 =?us-ascii?Q?FEWz2UUmAO6rscXNaqchXZMgjLV/6Q46TlUXwVYzGFrt2nFpxbI/T5vZAA2h?=
 =?us-ascii?Q?td/mDNmPJS9gaHBDxUy5Cn777fVq9tIHtL66jHFbIra/R1zQAnVbcFUDXVrm?=
 =?us-ascii?Q?ah1TMOP7xzwhoGT10vosrKH7joDAg5fOARLNZbO01LsNfSJLGWe+iJ3Dhfbo?=
 =?us-ascii?Q?N9h38slRd9f4Jgqqyi0Mau5X4ZLFVzM0+jIsGONGA4jaDa2WYmUwR6pNLFIW?=
 =?us-ascii?Q?+EbAy9pEu68pNCeq+TGj/sIecKqqlkdCJdS0pNOJNV8ALYIeKNxIBXFu8Dfv?=
 =?us-ascii?Q?bsGhfw9cl5h+mhdJziecyfxmlGkUbsAj9pJrU0QNULP24SZNhT+8vcwAWUSj?=
 =?us-ascii?Q?cbBGNeGV8r7R+P4xyWocShtq5g2Tm+InJ9HYNP7BxQ1YRKSQKR7Cipj7Iar3?=
 =?us-ascii?Q?6r1LEnPr0qSxEBnuXY+ye3IJgH9tHPIEDZ0CAkHlCfnqIEj+5Q6pfMmapCPB?=
 =?us-ascii?Q?d9oeDBcbReB7lWRT2buGiAnxYbAC64cEGEcZF6S+nJzFlAHvw8c76ym2pla2?=
 =?us-ascii?Q?Uu6D0glGeYy4S0r84zflaeRuF69KOEyR3qWb4y7V2FhrYA2ETtK4wiuTZfrh?=
 =?us-ascii?Q?qEReN7aSuUkKHAovcqqPh9UIMgPsa1yRx2hojAWC2XamYTcYRbGbyXLpjK1K?=
 =?us-ascii?Q?oGk2/MmC98+BJFL2AGi2BMi+puB9q3t8nRuYjFe5UPKCWxCbDMWmgwc+Ih25?=
 =?us-ascii?Q?Qyid8Orn7Kk6g4YXvDfg5AoeLNrJYRvDWg/Da4DBUMkf8gve9VVLhyKbzQKi?=
 =?us-ascii?Q?Br9YG70z9pbC0yrhURa/wdC5+QaEweWnqisyK4O6CZVzPDx4LBbKjd4IqHzI?=
 =?us-ascii?Q?eb8KB5xnAtImVb+l3xK5YYqOn8NNyQ7Lc7lxCOxkKZ65WP7vv1HrKDkoQw9s?=
 =?us-ascii?Q?447sFKAPGaoW5oPcMA48tNptD5bLEaDj3NZ98EXPu7P6//4GJozArpr/bdvU?=
 =?us-ascii?Q?wT8YCbA5aJiAC7udziA4POKSA0hnMo1hdrYj4rUWPaINaMV1DRKspv5I+i2T?=
 =?us-ascii?Q?iw9lqMZ+GlU5q/4g5usPl/yO1vG+zvuePU/PI7delKxhiTg5qw8Exwkmdngs?=
 =?us-ascii?Q?B4VMOoftZOFXCNcWD4eGz/BOyqGMOYhWQc0k9wvezw1Jc11aMuDTVcqMGfAl?=
 =?us-ascii?Q?42KP42/hypCZbp7qJXHClaAN?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eac74a5-5d33-4371-cae3-08d97205c7eb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:45:41.8016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGQSndYaSuTMyHjdHYhv9Y1Wi4TD1Jg24/XMyUXvUMOD2CVJj/S8Hpd/3+RyH/JuQx3fa1Y2CXvhs6isW7rMr+lur2i1PMP5AEkp6LXT+5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8221
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
 drivers/hwmon/tmp421.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index a41d7935acb9..90c6b094785e 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -34,6 +34,7 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
 #define TMP421_STATUS_REG			0x08
 #define TMP421_CONFIG_REG_1			0x09
 #define TMP421_CONVERSION_RATE_REG		0x0B
+#define TMP421_N_FACTOR_REG_1			0x21
 #define TMP421_MANUFACTURER_ID_REG		0xFE
 #define TMP421_DEVICE_ID_REG			0xFF
 
@@ -302,6 +303,7 @@ void tmp421_probe_child_from_dt(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	u32 i;
+	s32 val;
 	int err;
 
 	err = of_property_read_u32(child, "reg", &i);
@@ -321,6 +323,21 @@ void tmp421_probe_child_from_dt(struct i2c_client *client,
 		data->channel[i].disabled = true;
 		return;
 	}
+
+	if (i == 0)
+		return; /* input 0 is internal channel */
+
+	err = of_property_read_s32(child, "n-factor", &val);
+	if (!err) {
+		if (val > 127 || val < -128)
+			dev_err(dev, "n-factor for channel %d invalid (%d)\n",
+				i, val);
+		else
+			i2c_smbus_write_byte_data(client,
+						  TMP421_N_FACTOR_REG_1 + i - 1,
+						  val);
+	}
+
 }
 
 void tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
-- 
2.31.1

