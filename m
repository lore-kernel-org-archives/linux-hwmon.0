Return-Path: <SRS0=etf3=UN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCCDC31E44
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jun 2019 06:11:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56C8D20851
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jun 2019 06:11:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="rZaya6C5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbfFNGLc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jun 2019 02:11:32 -0400
Received: from mail-eopbgr130111.outbound.protection.outlook.com ([40.107.13.111]:16000
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725774AbfFNGLb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jun 2019 02:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3EoDdr5y1TUQycjwE8FgpgjBGCP9KaWKYPrjsBuMLw=;
 b=rZaya6C5iBM3AadOCNV+n8769aPsiyTZLb+6MmSrFrQpTrsO96z1G+4pMwaoMnKSdUuls7RR0mId7G0TQrKUHPAlSvGqB203ShH3ANFYylP2SugzUEdWBak0npkIplfJiVlbKQ61QdFdFvWI5b5he9x7F8H9UpxY85izjzh/oK4=
Received: from VI1PR0701MB2752.eurprd07.prod.outlook.com (10.173.81.136) by
 VI1PR0701MB2685.eurprd07.prod.outlook.com (10.173.80.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.7; Fri, 14 Jun 2019 06:11:25 +0000
Received: from VI1PR0701MB2752.eurprd07.prod.outlook.com
 ([fe80::f477:e7f8:c964:4d06]) by VI1PR0701MB2752.eurprd07.prod.outlook.com
 ([fe80::f477:e7f8:c964:4d06%7]) with mapi id 15.20.1987.012; Fri, 14 Jun 2019
 06:11:25 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v2] hwmon: (pmbus/adm1275) Fix power sampling support
Thread-Topic: [PATCH v2] hwmon: (pmbus/adm1275) Fix power sampling support
Thread-Index: AQHVIeWAkZLUyGSgS0CxLQixazR9O6aarCoA
Date:   Fri, 14 Jun 2019 06:11:25 +0000
Message-ID: <20190614061118.GB26525@localhost.localdomain>
References: <1560429754-17510-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1560429754-17510-1-git-send-email-linux@roeck-us.net>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0701CA0085.eurprd07.prod.outlook.com
 (2603:10a6:3:64::29) To VI1PR0701MB2752.eurprd07.prod.outlook.com
 (2603:10a6:801:a::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c00358dd-fe62-4d03-dfc4-08d6f08f213e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR0701MB2685;
x-ms-traffictypediagnostic: VI1PR0701MB2685:
x-microsoft-antispam-prvs: <VI1PR0701MB2685BF55F596A78593043A82EFEE0@VI1PR0701MB2685.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(54906003)(3846002)(8936002)(33656002)(6116002)(305945005)(316002)(102836004)(26005)(478600001)(7736002)(68736007)(6506007)(386003)(186003)(76176011)(99286004)(2906002)(8676002)(66476007)(81156014)(81166006)(14454004)(52116002)(66446008)(66556008)(64756008)(1076003)(6916009)(446003)(66946007)(73956011)(476003)(4326008)(486006)(25786009)(6486002)(11346002)(66066001)(6246003)(14444005)(256004)(61506002)(5660300002)(53936002)(86362001)(71190400001)(71200400001)(9686003)(229853002)(107886003)(6512007)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR0701MB2685;H:VI1PR0701MB2752.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5ES9LDC3w29p6gw09uwaIqENc3fUkPpu+B6RlgRYTwTCO2xZYtWBnEfupvnK+QNUxv+kO+3BnK6vx14aDdcZ0cGDmi4d2AMQJ+UOZZNlFEJhL+FbUQZ0Oyjv1GU34wuCIx4aelTrSzYHS03DCKLko131/Uif4PkisC9aJTAbqBCNkVKPA9+S3qCXREQ8ifPEVWnyWECh6aTFXQaI4lmmj/deZ1u7UUwkhKsPeYlx7KB8SgaSPHxFmPQ2nGEQ5IIjDELhcVR5z1rkL3t2hePZ4MOHB2CRaQYKv4yujdxF+rpP3z0untVgFRYtAqNWz3ve7xFybVjrfwX1RYx4+Xq5c4M9sQaqHGHW7NRUTt3EdSaw/VcHX0wrO0y163Ph7uFohzh8jDxKQQYq65hHp6lCWGhDQXsGGjqG8nDFP47uE2k=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <82D54FCEDBFB6A40BC1BA048A18A7847@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c00358dd-fe62-4d03-dfc4-08d6f08f213e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 06:11:25.1264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krzysztof.adamski@nokia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2685
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jun 13, 2019 at 05:42:34AM -0700, Guenter Roeck wrote:
>Not every chip supported by this driver supports setting the number
>of samples for power averaging. Also, the power monitoring register
>is not always a 16-bit register, and the configuration bits used for
>voltage sampling are different depending on the register width.
>Some conditional code is needed to fix the problem.
>
>On top of all that, the compiler complains about problems with
>FIELD_GET and FIELD_PREP macros if the file is built with W=3D1.
>Avoid using those macros to silence the warning.
>
>Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

>---
>v2: s/PRW/PWR/g
>    Drop inline from function declarations
>
> drivers/hwmon/pmbus/adm1275.c | 84 +++++++++++++++++++++++++++++++++-----=
-----
> 1 file changed, 65 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
>index a477ce0474bb..5caa37fbfc18 100644
>--- a/drivers/hwmon/pmbus/adm1275.c
>+++ b/drivers/hwmon/pmbus/adm1275.c
>@@ -71,9 +71,17 @@ enum chips { adm1075, adm1272, adm1275, adm1276, adm127=
8, adm1293, adm1294 };
> #define ADM1075_VAUX_OV_WARN		BIT(7)
> #define ADM1075_VAUX_UV_WARN		BIT(6)
>
>-#define ADM1275_PWR_AVG_MASK		GENMASK(13, 11)
>-#define ADM1275_VI_AVG_MASK		GENMASK(10, 8)
>-#define ADM1275_SAMPLES_AVG_MAX	128
>+#define ADM1275_VI_AVG_SHIFT		0
>+#define ADM1275_VI_AVG_MASK		GENMASK(ADM1275_VI_AVG_SHIFT + 2, \
>+						ADM1275_VI_AVG_SHIFT)
>+#define ADM1275_SAMPLES_AVG_MAX		128
>+
>+#define ADM1278_PWR_AVG_SHIFT		11
>+#define ADM1278_PWR_AVG_MASK		GENMASK(ADM1278_PWR_AVG_SHIFT + 2, \
>+						ADM1278_PWR_AVG_SHIFT)
>+#define ADM1278_VI_AVG_SHIFT		8
>+#define ADM1278_VI_AVG_MASK		GENMASK(ADM1278_VI_AVG_SHIFT + 2, \
>+						ADM1278_VI_AVG_SHIFT)
>
> struct adm1275_data {
> 	int id;
>@@ -86,6 +94,7 @@ struct adm1275_data {
> 	bool have_pin_min;
> 	bool have_pin_max;
> 	bool have_temp_max;
>+	bool have_power_sampling;
> 	struct pmbus_driver_info info;
> };
>
>@@ -161,28 +170,58 @@ static const struct coefficients adm1293_coefficient=
s[] =3D {
> 	[18] =3D { 7658, 0, -3 },		/* power, 21V, irange200 */
> };
>
>-static inline int adm1275_read_pmon_config(struct i2c_client *client, u16=
 mask)
>+static int adm1275_read_pmon_config(const struct adm1275_data *data,
>+				    struct i2c_client *client, bool is_power)
> {
>-	int ret;
>-
>-	ret =3D i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
>+	int shift, ret;
>+	u16 mask;
>+
>+	/*
>+	 * The PMON configuration register is a 16-bit register only on chips
>+	 * supporting power average sampling. On other chips it is an 8-bit
>+	 * register.
>+	 */
>+	if (data->have_power_sampling) {
>+		ret =3D i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
>+		mask =3D is_power ? ADM1278_PWR_AVG_MASK : ADM1278_VI_AVG_MASK;
>+		shift =3D is_power ? ADM1278_PWR_AVG_SHIFT : ADM1278_VI_AVG_SHIFT;
>+	} else {
>+		ret =3D i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
>+		mask =3D ADM1275_VI_AVG_MASK;
>+		shift =3D ADM1275_VI_AVG_SHIFT;
>+	}
> 	if (ret < 0)
> 		return ret;
>
>-	return FIELD_GET(mask, (u16)ret);
>+	return (ret & mask) >> shift;
> }
>
>-static inline int adm1275_write_pmon_config(struct i2c_client *client, u1=
6 mask,
>-					    u16 word)
>+static int adm1275_write_pmon_config(const struct adm1275_data *data,
>+				     struct i2c_client *client,
>+				     bool is_power, u16 word)
> {
>-	int ret;
>-
>-	ret =3D i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
>+	int shift, ret;
>+	u16 mask;
>+
>+	if (data->have_power_sampling) {
>+		ret =3D i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
>+		mask =3D is_power ? ADM1278_PWR_AVG_MASK : ADM1278_VI_AVG_MASK;
>+		shift =3D is_power ? ADM1278_PWR_AVG_SHIFT : ADM1278_VI_AVG_SHIFT;
>+	} else {
>+		ret =3D i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
>+		mask =3D ADM1275_VI_AVG_MASK;
>+		shift =3D ADM1275_VI_AVG_SHIFT;
>+	}
> 	if (ret < 0)
> 		return ret;
>
>-	word =3D FIELD_PREP(mask, word) | (ret & ~mask);
>-	ret =3D i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG, word);
>+	word =3D (ret & ~mask) | ((word << shift) & mask);
>+	if (data->have_power_sampling)
>+		ret =3D i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG,
>+						word);
>+	else
>+		ret =3D i2c_smbus_write_byte_data(client, ADM1275_PMON_CONFIG,
>+						word);
>
> 	return ret;
> }
>@@ -266,14 +305,16 @@ static int adm1275_read_word_data(struct i2c_client =
*client, int page, int reg)
> 			return -ENXIO;
> 		break;
> 	case PMBUS_VIRT_POWER_SAMPLES:
>-		ret =3D adm1275_read_pmon_config(client, ADM1275_PWR_AVG_MASK);
>+		if (!data->have_power_sampling)
>+			return -ENXIO;
>+		ret =3D adm1275_read_pmon_config(data, client, true);
> 		if (ret < 0)
> 			break;
> 		ret =3D BIT(ret);
> 		break;
> 	case PMBUS_VIRT_IN_SAMPLES:
> 	case PMBUS_VIRT_CURR_SAMPLES:
>-		ret =3D adm1275_read_pmon_config(client, ADM1275_VI_AVG_MASK);
>+		ret =3D adm1275_read_pmon_config(data, client, false);
> 		if (ret < 0)
> 			break;
> 		ret =3D BIT(ret);
>@@ -323,14 +364,16 @@ static int adm1275_write_word_data(struct i2c_client=
 *client, int page, int reg,
> 		ret =3D pmbus_write_word_data(client, 0, ADM1278_PEAK_TEMP, 0);
> 		break;
> 	case PMBUS_VIRT_POWER_SAMPLES:
>+		if (!data->have_power_sampling)
>+			return -ENXIO;
> 		word =3D clamp_val(word, 1, ADM1275_SAMPLES_AVG_MAX);
>-		ret =3D adm1275_write_pmon_config(client, ADM1275_PWR_AVG_MASK,
>+		ret =3D adm1275_write_pmon_config(data, client, true,
> 						ilog2(word));
> 		break;
> 	case PMBUS_VIRT_IN_SAMPLES:
> 	case PMBUS_VIRT_CURR_SAMPLES:
> 		word =3D clamp_val(word, 1, ADM1275_SAMPLES_AVG_MAX);
>-		ret =3D adm1275_write_pmon_config(client, ADM1275_VI_AVG_MASK,
>+		ret =3D adm1275_write_pmon_config(data, client, false,
> 						ilog2(word));
> 		break;
> 	default:
>@@ -528,6 +571,7 @@ static int adm1275_probe(struct i2c_client *client,
> 		data->have_vout =3D true;
> 		data->have_pin_max =3D true;
> 		data->have_temp_max =3D true;
>+		data->have_power_sampling =3D true;
>
> 		coefficients =3D adm1272_coefficients;
> 		vindex =3D (config & ADM1275_VRANGE) ? 1 : 0;
>@@ -613,6 +657,7 @@ static int adm1275_probe(struct i2c_client *client,
> 		data->have_vout =3D true;
> 		data->have_pin_max =3D true;
> 		data->have_temp_max =3D true;
>+		data->have_power_sampling =3D true;
>
> 		coefficients =3D adm1278_coefficients;
> 		vindex =3D 0;
>@@ -648,6 +693,7 @@ static int adm1275_probe(struct i2c_client *client,
> 		data->have_pin_min =3D true;
> 		data->have_pin_max =3D true;
> 		data->have_mfr_vaux_status =3D true;
>+		data->have_power_sampling =3D true;
>
> 		coefficients =3D adm1293_coefficients;
>
>--=20
>2.7.4
>
