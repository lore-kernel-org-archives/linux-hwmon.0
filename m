Return-Path: <SRS0=yVNc=SP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50339C10F11
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Apr 2019 16:03:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 201DD2084D
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Apr 2019 16:03:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="rMXwrdDp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfDMQDf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 13 Apr 2019 12:03:35 -0400
Received: from mail-eopbgr150133.outbound.protection.outlook.com ([40.107.15.133]:10592
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727048AbfDMQDf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 13 Apr 2019 12:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSA4GiD/dMPDYZVesIv+sOoNuE2PU3smB6aZj4Z2kwY=;
 b=rMXwrdDpeoH8U76Fh7Sw2UOCtACqDkzyzJSs2+np4tXmtt5Y8kn4EMw5n2c/PQVzQCnYjQH2wZdWhri44fGHG42VE9Nsf5uEAdu+mMVNUqYjVeDOhoStrylXBXi8NPSzPXMjjTKNLujVeGZGcHvV3fPCk3kuwEy/qH03h8d5xz8=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB4219.eurprd07.prod.outlook.com (20.176.166.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.9; Sat, 13 Apr 2019 16:03:32 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Sat, 13 Apr 2019
 16:03:32 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v2 2/3] lm25066: support SAMPLES_FOR_AVG register
Thread-Topic: [PATCH v2 2/3] lm25066: support SAMPLES_FOR_AVG register
Thread-Index: AQHU8hJwA9Q7bQwwQ0ua0/AzEb1ghg==
Date:   Sat, 13 Apr 2019 16:03:31 +0000
Message-ID: <8b52d91c3b182d54d9cc523d2542bbca413927d1.1555171278.git.krzysztof.adamski@nokia.com>
References: <cover.1555171278.git.krzysztof.adamski@nokia.com>
In-Reply-To: <cover.1555171278.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0102CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::27) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69803ef7-b08d-4aa7-702e-08d6c0299314
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB4219;
x-ms-traffictypediagnostic: HE1PR07MB4219:
x-microsoft-antispam-prvs: <HE1PR07MB421956DFF21EB61C145C1160EF290@HE1PR07MB4219.eurprd07.prod.outlook.com>
x-forefront-prvs: 00064751B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(376002)(396003)(39860400002)(346002)(366004)(136003)(189003)(199004)(6436002)(99286004)(54906003)(14444005)(256004)(71200400001)(71190400001)(97736004)(81166006)(118296001)(81156014)(66066001)(8676002)(68736007)(6512007)(8936002)(110136005)(316002)(6506007)(386003)(76176011)(186003)(102836004)(26005)(86362001)(5660300002)(106356001)(105586002)(6116002)(2906002)(36756003)(478600001)(52116002)(53936002)(107886003)(4326008)(6486002)(25786009)(446003)(3846002)(11346002)(7736002)(14454004)(305945005)(476003)(486006)(2616005)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB4219;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eJWDZrO4hLAGnRS17DYb14bflFfL6ETavbgf1118bmoua/lHSqXe9YOI/Dakb6xuQ688xMV0JQuCYlSquVIvjzZYZ+/94+WPlS3fulFfeHgmp9vKmZopevbfkvJulTf8kvlDioMLevvB1tzt0L9OTHVDgJtg2KAJs7fawksz+0CPyEzAqXLt2BrgTLWS02tPUmla8t0Fcd9M1o5jO3u/gefPNWlsRoEUGw+QUlCuARMXdYwMa16EcJEMyDWXHjMFOe4je8yvqywTmOA6M8HTKbVaRX95x7dcIsC29mweR6MCKay/YZ7RSn7+0w6yXP1yAr+eK/XpUig/QJv1oe+1UVCBW+2hMv1hA3/1gBYRwTcLpbPLLPWFaiaR+oUyOUvMrGE7mBgJK5pC8KnWU1JlzXBzzFJlsyo7XAeS3Ozwhzk=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0CFC63D80A804344AFC684996E54708D@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69803ef7-b08d-4aa7-702e-08d6c0299314
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2019 16:03:31.9060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4219
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Manufacturer specific SAMPLES_FOR_AVG register allows setting the number
of samples used in computing the average values (PMBUS_VIRT_READ_*_AVG).
The number we write is an exponent of base 2 of the number of samples so
for example writing 3 will result in 8 samples average.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/pmbus/lm25066.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 53db78753a0d..b560d33db459 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -26,6 +26,7 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/i2c.h>
+#include <linux/log2.h>
 #include "pmbus.h"
=20
 enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
@@ -39,12 +40,15 @@ enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i =
};
 #define LM25066_CLEAR_PIN_PEAK		0xd6
 #define LM25066_DEVICE_SETUP		0xd9
 #define LM25066_READ_AVG_VIN		0xdc
+#define LM25066_SAMPLES_FOR_AVG		0xdb
 #define LM25066_READ_AVG_VOUT		0xdd
 #define LM25066_READ_AVG_IIN		0xde
 #define LM25066_READ_AVG_PIN		0xdf
=20
 #define LM25066_DEV_SETUP_CL		BIT(4)	/* Current limit */
=20
+#define LM25066_SAMPLES_FOR_AVG_MAX	4096
+
 /* LM25056 only */
=20
 #define LM25056_VAUX_OV_WARN_LIMIT	0xe3
@@ -284,6 +288,10 @@ static int lm25066_read_word_data(struct i2c_client *c=
lient, int page, int reg)
 	case PMBUS_VIRT_RESET_PIN_HISTORY:
 		ret =3D 0;
 		break;
+	case PMBUS_VIRT_SAMPLES:
+		ret =3D pmbus_read_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG);
+		ret =3D 1 << ret;
+		break;
 	default:
 		ret =3D -ENODATA;
 		break;
@@ -398,6 +406,11 @@ static int lm25066_write_word_data(struct i2c_client *=
client, int page, int reg,
 	case PMBUS_VIRT_RESET_PIN_HISTORY:
 		ret =3D pmbus_write_byte(client, 0, LM25066_CLEAR_PIN_PEAK);
 		break;
+	case PMBUS_VIRT_SAMPLES:
+		word =3D clamp_val(word, 0, LM25066_SAMPLES_FOR_AVG_MAX);
+		ret =3D pmbus_write_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG,
+					    ilog2(word));
+		break;
 	default:
 		ret =3D -ENODATA;
 		break;
@@ -438,7 +451,7 @@ static int lm25066_probe(struct i2c_client *client,
=20
 	info->func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VMON
 	  | PMBUS_HAVE_PIN | PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT
-	  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
+	  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_SAMPLES;
=20
 	if (data->id =3D=3D lm25056) {
 		info->func[0] |=3D PMBUS_HAVE_STATUS_VMON;
--=20
2.20.1

