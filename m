Return-Path: <SRS0=cyzt=T5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C74C28CC0
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 May 2019 14:36:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CD4D23A7A
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 May 2019 14:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="fwI24uiP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbfE2Og2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 29 May 2019 10:36:28 -0400
Received: from mail-eopbgr20128.outbound.protection.outlook.com ([40.107.2.128]:44928
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726068AbfE2Og2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 May 2019 10:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcNcxQ4nXyxtjoJZw57t0jQKOttWfV98fHf5rn5yrCM=;
 b=fwI24uiPPXA63TvD8QDQTVoITsSrjViLSgW43zGNMcRRhvKWqghzpT/qVOhNCxXW8kamd9sJnm3ji5Rqw4AmyMT7hObjggLctMExoYcfcOUAuZG32X5cB6oe2yrdW6RFnLs1BTiQPBEmtIygaL3BCrY+6SqGvP0CO2FqDVsdS58=
Received: from DB6PR07MB3336.eurprd07.prod.outlook.com (10.170.223.150) by
 DB6PR07MB3109.eurprd07.prod.outlook.com (10.170.222.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.4; Wed, 29 May 2019 14:36:22 +0000
Received: from DB6PR07MB3336.eurprd07.prod.outlook.com
 ([fe80::8c1c:dbc5:e07b:2cf9]) by DB6PR07MB3336.eurprd07.prod.outlook.com
 ([fe80::8c1c:dbc5:e07b:2cf9%6]) with mapi id 15.20.1943.016; Wed, 29 May 2019
 14:36:22 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v2 2/2] adm1275: support PMBUS_VIRT_*_SAMPLES
Thread-Topic: [PATCH v2 2/2] adm1275: support PMBUS_VIRT_*_SAMPLES
Thread-Index: AQHVFiviZhJ1aWEEtkiJKdPgrhm6JQ==
Date:   Wed, 29 May 2019 14:36:21 +0000
Message-ID: <7524aaac106af01da2b52662b160535a211ebcd0.1559140351.git.krzysztof.adamski@nokia.com>
References: <25c0f33fa281e8fb9781b71bda9e2f570113df85.1559140351.git.krzysztof.adamski@nokia.com>
In-Reply-To: <25c0f33fa281e8fb9781b71bda9e2f570113df85.1559140351.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0218.eurprd05.prod.outlook.com
 (2603:10a6:3:fa::18) To DB6PR07MB3336.eurprd07.prod.outlook.com
 (2603:10a6:6:1f::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.190]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c7380eb-5b0e-4e83-70e0-08d6e44304ef
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB6PR07MB3109;
x-ms-traffictypediagnostic: DB6PR07MB3109:
x-microsoft-antispam-prvs: <DB6PR07MB3109BB15945C9141160DD534EF1F0@DB6PR07MB3109.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(366004)(136003)(346002)(39860400002)(189003)(199004)(7736002)(256004)(66066001)(14444005)(73956011)(386003)(6506007)(486006)(316002)(53936002)(25786009)(102836004)(107886003)(86362001)(99286004)(8676002)(26005)(81166006)(66476007)(68736007)(66556008)(64756008)(66446008)(81156014)(66946007)(4326008)(52116002)(8936002)(76176011)(186003)(305945005)(110136005)(54906003)(11346002)(5660300002)(446003)(6486002)(2906002)(2616005)(6116002)(476003)(6436002)(6512007)(71190400001)(71200400001)(3846002)(478600001)(36756003)(14454004)(118296001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB6PR07MB3109;H:DB6PR07MB3336.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uOLD2hdCAJDYXfu7yvi2DYJhCfnHFjERpPFNC7xh55Aaoc/flQGsFpe1vo/Mrg0ttLtswOG7uNIHKQjsEtbeJhOcSqFwiOWJNeMaQ/ygXlP/FMLIvfMlqH4Hz5wm78mPnP3PzCN/oyzIhSD4qpt/vELSS4R6QfpW+OdB5M6lZWrUraogX81XmGktjuhIye2FVGzdweNwfOn6A7r/VLt8q9iNvTjvbn+rdNEelu8Yf/d4aekHx0MReCRh0HExVES5HrqScG8hueV+1F64jBu52oQJWi23od8lHqJl3fqFa6brWeahIavUgWeAIJLvtEV4SIIjrygxySAozmH+EEK8lqGMz3bPOEs4INx2xwms18IXEhAgWJCnlm8kFhmdukzTLdYvpAvrefSrNwJNN7tT/dsgPnkEj4LbFyBzncKEaxU=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C83C230E34557A47BF8DFEB0526F188D@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7380eb-5b0e-4e83-70e0-08d6e44304ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 14:36:21.9644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krzysztof.adamski@nokia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR07MB3109
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The device supports setting the number of samples for averaging the
measurements. There are two separate settings - PWR_AVG for averaging
PIN and VI_AVG for averaging VIN/VAUX/IOUT, both being part of
PMON_CONFIG register. The values are stored as exponent of base 2 of the
actual number of samples that will be taken.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---

Changes in v2:
- Moved mutex lock to pmbus_set_samples (see patch 1/2)
- Changed mask type passed as argument to adm1275_read_pmon_config and
  adm1275_write_pmon_config to u16
- Changed 1 << ret to BIT(ret)

 drivers/hwmon/pmbus/adm1275.c | 61 ++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index f569372c9204..0c3493fa53ea 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -23,6 +23,8 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/bitops.h>
+#include <linux/bitfield.h>
+#include <linux/log2.h>
 #include "pmbus.h"
=20
 enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294=
 };
@@ -78,6 +80,10 @@ enum chips { adm1075, adm1272, adm1275, adm1276, adm1278=
, adm1293, adm1294 };
 #define ADM1075_VAUX_OV_WARN		BIT(7)
 #define ADM1075_VAUX_UV_WARN		BIT(6)
=20
+#define ADM1275_PWR_AVG_MASK		GENMASK(13, 11)
+#define ADM1275_VI_AVG_MASK		GENMASK(10, 8)
+#define ADM1275_SAMPLES_AVG_MAX	128
+
 struct adm1275_data {
 	int id;
 	bool have_oc_fault;
@@ -164,6 +170,34 @@ static const struct coefficients adm1293_coefficients[=
] =3D {
 	[18] =3D { 7658, 0, -3 },		/* power, 21V, irange200 */
 };
=20
+static inline int adm1275_read_pmon_config(struct i2c_client *client, u16 =
mask)
+{
+	int ret;
+
+	ret =3D i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
+	if (ret < 0)
+		return ret;
+
+	return FIELD_GET(mask, (u16)ret);
+}
+
+static inline int adm1275_write_pmon_config(struct i2c_client *client, u16=
 mask,
+					    u16 word)
+{
+	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);
+	struct adm1275_data *data =3D to_adm1275_data(info);
+	int ret;
+
+	ret =3D i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
+	if (ret < 0)
+		return ret;
+
+	word =3D FIELD_PREP(mask, word) | (ret & ~mask);
+	ret =3D i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG, word);
+
+	return ret;
+}
+
 static int adm1275_read_word_data(struct i2c_client *client, int page, int=
 reg)
 {
 	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);
@@ -242,6 +276,19 @@ static int adm1275_read_word_data(struct i2c_client *c=
lient, int page, int reg)
 		if (!data->have_temp_max)
 			return -ENXIO;
 		break;
+	case PMBUS_VIRT_POWER_SAMPLES:
+		ret =3D adm1275_read_pmon_config(client, ADM1275_PWR_AVG_MASK);
+		if (ret < 0)
+			break;
+		ret =3D BIT(ret);
+		break;
+	case PMBUS_VIRT_IN_SAMPLES:
+	case PMBUS_VIRT_CURR_SAMPLES:
+		ret =3D adm1275_read_pmon_config(client, ADM1275_VI_AVG_MASK);
+		if (ret < 0)
+			break;
+		ret =3D BIT(ret);
+		break;
 	default:
 		ret =3D -ENODATA;
 		break;
@@ -286,6 +333,17 @@ static int adm1275_write_word_data(struct i2c_client *=
client, int page, int reg,
 	case PMBUS_VIRT_RESET_TEMP_HISTORY:
 		ret =3D pmbus_write_word_data(client, 0, ADM1278_PEAK_TEMP, 0);
 		break;
+	case PMBUS_VIRT_POWER_SAMPLES:
+		word =3D clamp_val(word, 1, ADM1275_SAMPLES_AVG_MAX);
+		ret =3D adm1275_write_pmon_config(client, ADM1275_PWR_AVG_MASK,
+						ilog2(word));
+		break;
+	case PMBUS_VIRT_IN_SAMPLES:
+	case PMBUS_VIRT_CURR_SAMPLES:
+		word =3D clamp_val(word, 1, ADM1275_SAMPLES_AVG_MAX);
+		ret =3D adm1275_write_pmon_config(client, ADM1275_VI_AVG_MASK,
+						ilog2(word));
+		break;
 	default:
 		ret =3D -ENODATA;
 		break;
@@ -439,7 +497,8 @@ static int adm1275_probe(struct i2c_client *client,
 	info->format[PSC_CURRENT_OUT] =3D direct;
 	info->format[PSC_POWER] =3D direct;
 	info->format[PSC_TEMPERATURE] =3D direct;
-	info->func[0] =3D PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT;
+	info->func[0] =3D PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+			PMBUS_HAVE_SAMPLES;
=20
 	info->read_word_data =3D adm1275_read_word_data;
 	info->read_byte_data =3D adm1275_read_byte_data;
--=20
2.20.1

