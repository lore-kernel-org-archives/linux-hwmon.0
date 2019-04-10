Return-Path: <SRS0=HmyG=SM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB41CC10F11
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 22:39:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F8AF20820
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 22:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="TDH1mgst"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfDJWjW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Apr 2019 18:39:22 -0400
Received: from mail-eopbgr60125.outbound.protection.outlook.com ([40.107.6.125]:54243
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726073AbfDJWjW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Apr 2019 18:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LArME4rRF8zXYusQONb5/cv8ot3g/Pf98YZp5AVroI=;
 b=TDH1mgstLVUV9uH0YNTZhDwqY4v+gj82332bnEQLyJBJPATGqp7+Cd9Mw8ptD2mOW7lQEEa0PtWYuaMllTP3L4HE7RKV8y61s0pFG1qGqyiS+TN6BUgSNY1vf0qa/e/9ZppcnXKkJQ/iBb68Ld3OxA+gl3SFZ5mDqxHTiNUEn34=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB3081.eurprd07.prod.outlook.com (10.170.244.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.12; Wed, 10 Apr 2019 22:39:18 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1792.007; Wed, 10 Apr 2019
 22:39:18 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH 2/3] lm25066: export sysfs attribute for SAMPLES_FOR_AVG
Thread-Topic: [PATCH 2/3] lm25066: export sysfs attribute for SAMPLES_FOR_AVG
Thread-Index: AQHU7+47oOY4p2ACFEixplJDKxZryw==
Date:   Wed, 10 Apr 2019 22:39:17 +0000
Message-ID: <e231af1feac9cbe8b72923a13587035220b76ad8.1554934898.git.krzysztof.adamski@nokia.com>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
In-Reply-To: <cover.1554934898.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0701CA0046.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::14) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 313d69f8-7006-4c8c-e019-08d6be055db8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB3081;
x-ms-traffictypediagnostic: HE1PR07MB3081:
x-microsoft-antispam-prvs: <HE1PR07MB3081560ABB47BD61BF3385EBEF2E0@HE1PR07MB3081.eurprd07.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(25786009)(107886003)(4326008)(36756003)(6512007)(81156014)(8676002)(81166006)(7736002)(305945005)(14454004)(53936002)(446003)(105586002)(186003)(486006)(118296001)(2616005)(478600001)(52116002)(11346002)(14444005)(26005)(256004)(106356001)(76176011)(386003)(6506007)(476003)(6116002)(66066001)(6486002)(3846002)(6436002)(99286004)(97736004)(68736007)(5660300002)(71200400001)(71190400001)(316002)(86362001)(2906002)(8936002)(54906003)(110136005)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB3081;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BGDU+P1yErjk+bR4yuYQ5gbHDp1fMFIZ4ZnNigY1YJHJsPo+AearK7sYSz0KVyMWb6AmOrh73B9BBFjqOFC9V8RosnDe2ECjAVd778qJUvI2NmV41oNLJ99Ky8vmItuuG9/eAPnf4miq6EoIv9XWZaHLdf6br+CDgbxnyENaEZ9DCe2wpeVARo78p4ZGwU+prVOxP9dZKAqqG3gEOZjpiPRpDE9jz2u+bosnXYBVsZjYAoKXeeCOCzSKd1mBtTUq7ZuJzndSWgl9PNq3DWGomjutkRLLpOy39gsm+REzpcoROWUzBMnoPIvGKxTgmmT+qIv4XYNyiYwPoMAW/PWKzaiQ8IoBA8QTg0mRlWeM4a/6YflwIWVIoAZG3zrdfULZ1Cw2peL+jLMXtUYk8Z5IB217Ea+HctalgIdGnRdIlAI=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3F7DD29B36856D41B78456587BE309E6@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313d69f8-7006-4c8c-e019-08d6be055db8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 22:39:17.8566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3081
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Register custom sysfs attribute to be registered by pmbus allowing
read/write access to the manufacturer specific SAMPLES_FOR_AVG register.
This register allows setting the number of samples used in computing the
average values (PMBUS_VIRT_READ_*_AVG). The number we write is an
exponent of base 2 of the number of samples so for example writing 3
will result in 8 samples average.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/pmbus/lm25066.c | 45 +++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 53db78753a0d..c78af0a7e5ff 100644
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
@@ -38,6 +39,7 @@ enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
 #define LM25066_READ_PIN_PEAK		0xd5
 #define LM25066_CLEAR_PIN_PEAK		0xd6
 #define LM25066_DEVICE_SETUP		0xd9
+#define LM25066_SAMPLES_FOR_AVG		0xdb
 #define LM25066_READ_AVG_VIN		0xdc
 #define LM25066_READ_AVG_VOUT		0xdd
 #define LM25066_READ_AVG_IIN		0xde
@@ -405,6 +407,47 @@ static int lm25066_write_word_data(struct i2c_client *=
client, int page, int reg,
 	return ret;
 }
=20
+static ssize_t samples_for_avg_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client =3D to_i2c_client(dev->parent);
+	int ret;
+
+	ret =3D pmbus_read_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", 1 << ret);
+}
+
+static ssize_t samples_for_avg_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct i2c_client *client =3D to_i2c_client(dev->parent);
+	int ret, val;
+
+	ret =3D kstrtoint(buf, 0, &val);
+	if (ret < 0)
+		return ret;
+
+	ret =3D pmbus_write_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG,
+				    ilog2(val));
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(samples_for_avg);
+
+static struct attribute *lm25056_attrs[] =3D {
+	&dev_attr_samples_for_avg.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(lm25056); // should we set a name of this group to put al=
l
+			   // those attributes in subdirectory? Like "custom" ?
+
 static int lm25066_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
@@ -476,6 +519,8 @@ static int lm25066_probe(struct i2c_client *client,
 		info->b[PSC_POWER] =3D coeff[PSC_POWER].b;
 	}
=20
+	info->groups =3D lm25056_groups;
+
 	return pmbus_do_probe(client, id, info);
 }
=20
--=20
2.20.1

