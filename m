Return-Path: <SRS0=rYov=SQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BFEC10F13
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 21:59:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 16DBA20818
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 21:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="I5wg+SWA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbfDNV7Y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 17:59:24 -0400
Received: from mail-eopbgr80121.outbound.protection.outlook.com ([40.107.8.121]:20685
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726392AbfDNV7Y (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 17:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f8D3ftvovaQru18/2r+5wxWGrDfJ5sSeczgEn23uco=;
 b=I5wg+SWAfZy5cSlcMYoWYBTzFkmM4blnx+VWLlbpHc1qgdYx63WD5C4eT+njH+s5t/pfjSL6zgnyoMXBiXFBOtN8xNT6MhsXP5AltsihXU6Te1Bgh8L0tKPgw36suNMRr9zMxGGkN/cO332N9LKihMbNjC1k/GoP0xxUMyCQ/ik=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB3306.eurprd07.prod.outlook.com (10.170.246.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.9; Sun, 14 Apr 2019 21:59:20 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Sun, 14 Apr 2019
 21:59:20 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v3 3/4] lm25066: support SAMPLES_FOR_AVG register
Thread-Topic: [PATCH v3 3/4] lm25066: support SAMPLES_FOR_AVG register
Thread-Index: AQHU8w1P+rO0Osx87UmdZYlGnHsuVw==
Date:   Sun, 14 Apr 2019 21:59:19 +0000
Message-ID: <81104f51d2c10aff1932de23a24d5bc133b52ab7.1555273192.git.krzysztof.adamski@nokia.com>
References: <cover.1555273192.git.krzysztof.adamski@nokia.com>
In-Reply-To: <cover.1555273192.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0501CA0001.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::11) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d83d1ad-ce03-4c5c-8964-08d6c12471b5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB3306;
x-ms-traffictypediagnostic: HE1PR07MB3306:
x-microsoft-antispam-prvs: <HE1PR07MB3306FA783452B909337B8C60EF2A0@HE1PR07MB3306.eurprd07.prod.outlook.com>
x-forefront-prvs: 00073DB75F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(346002)(136003)(376002)(366004)(199004)(189003)(6486002)(52116002)(186003)(86362001)(5660300002)(102836004)(118296001)(6506007)(386003)(53936002)(6116002)(26005)(6512007)(99286004)(66066001)(76176011)(11346002)(446003)(2616005)(3846002)(68736007)(106356001)(14444005)(25786009)(105586002)(486006)(107886003)(8936002)(81166006)(71200400001)(71190400001)(36756003)(14454004)(478600001)(54906003)(2906002)(81156014)(6436002)(8676002)(305945005)(7736002)(97736004)(316002)(110136005)(476003)(4326008)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB3306;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Lbk1z0pX4kOuhWCMtkGcoeTFWHTcyoYE21IzuHpz/yp8o7gyWjVRPNU6Uiy63t+RuI3HLk7nnxy/zqUWtsnggWc2MR4o+pv0j2ijaxRvgBhN1i2YDK+CtDP+6/BGAIecXOKvYJc4vvEEsVsw5HLT3/L63YVhU3ILS8AnQ1gx6vHkeJkKFRUqmqgQdEIo32tExF5uGTJxMraDKsnTXKRMWrsVs4JByX58g52AJOmCamhAz3jwgSJV306e+nv043ATYv1SLe3Zj0iW18YnfqafcohkgjrMu7ICGRNY8LkaOLSj0vl7qeE9eYOmB/Idkc0vySNRPWTQHHKklc8/ErLn+rQx0a9UVR17DoP7KKGKVyffuvS/0iVJIF1FwNJ/scs4WLDnG6eEiUgJH7aU+mIPq41XvdqVTVPih00Wv426K7c=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <090F65296A993D418B5FB956D45C45F0@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d83d1ad-ce03-4c5c-8964-08d6c12471b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2019 21:59:19.9316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3306
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
 drivers/hwmon/pmbus/lm25066.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 53db78753a0d..715d4ab57516 100644
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
@@ -284,6 +288,12 @@ static int lm25066_read_word_data(struct i2c_client *c=
lient, int page, int reg)
 	case PMBUS_VIRT_RESET_PIN_HISTORY:
 		ret =3D 0;
 		break;
+	case PMBUS_VIRT_SAMPLES:
+		ret =3D pmbus_read_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG);
+		if (ret < 0)
+			break;
+		ret =3D 1 << ret;
+		break;
 	default:
 		ret =3D -ENODATA;
 		break;
@@ -398,6 +408,11 @@ static int lm25066_write_word_data(struct i2c_client *=
client, int page, int reg,
 	case PMBUS_VIRT_RESET_PIN_HISTORY:
 		ret =3D pmbus_write_byte(client, 0, LM25066_CLEAR_PIN_PEAK);
 		break;
+	case PMBUS_VIRT_SAMPLES:
+		word =3D clamp_val(word, 1, LM25066_SAMPLES_FOR_AVG_MAX);
+		ret =3D pmbus_write_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG,
+					    ilog2(word));
+		break;
 	default:
 		ret =3D -ENODATA;
 		break;
@@ -438,7 +453,7 @@ static int lm25066_probe(struct i2c_client *client,
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

