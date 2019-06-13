Return-Path: <SRS0=HBTv=UM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A710C31E45
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Jun 2019 15:37:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDD92206BB
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Jun 2019 15:37:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="LAmx8Ybo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbfFMPhN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 Jun 2019 11:37:13 -0400
Received: from mail-eopbgr40112.outbound.protection.outlook.com ([40.107.4.112]:5090
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726795AbfFMKMB (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Jun 2019 06:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n751I0PEXXzKET3/aKBM0zIKinHfoRFwKsahm5j1ABQ=;
 b=LAmx8Ybo7lRpMR03Ac/U8IaVn+Yq4Fk1zBwZhk6M///uivaT4xvy6q152dF3CPbJ7K5cX1ZQV/5iV63V52SoG3nHDxdgmJZeZnVxQ7eeIsibFUpXp2oviyMjg89XUoLNlfe1Ufv5C38V5Y+W6QrtTH0vLbpTEHp5seXON3y2kk4=
Received: from VI1PR0701MB2752.eurprd07.prod.outlook.com (10.173.81.136) by
 VI1PR0701MB2656.eurprd07.prod.outlook.com (10.173.82.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.8; Thu, 13 Jun 2019 10:11:56 +0000
Received: from VI1PR0701MB2752.eurprd07.prod.outlook.com
 ([fe80::f477:e7f8:c964:4d06]) by VI1PR0701MB2752.eurprd07.prod.outlook.com
 ([fe80::f477:e7f8:c964:4d06%7]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 10:11:56 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH] hwmon: (pmbus/adm1275) Fix power sampling support
Thread-Topic: [PATCH] hwmon: (pmbus/adm1275) Fix power sampling support
Thread-Index: AQHVIS9Mngp9UFDC406PONYA3p5V+qaZXnYA
Date:   Thu, 13 Jun 2019 10:11:56 +0000
Message-ID: <20190613101150.GA13769@localhost.localdomain>
References: <1560351504-14163-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1560351504-14163-1-git-send-email-linux@roeck-us.net>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR06CA0161.eurprd06.prod.outlook.com
 (2603:10a6:7:16::48) To VI1PR0701MB2752.eurprd07.prod.outlook.com
 (2603:10a6:801:a::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0eb3c41e-482a-4a09-d334-08d6efe790a7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR0701MB2656;
x-ms-traffictypediagnostic: VI1PR0701MB2656:
x-microsoft-antispam-prvs: <VI1PR0701MB2656B24DC2A7CB946623C725EFEF0@VI1PR0701MB2656.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(346002)(366004)(376002)(39860400002)(189003)(199004)(5660300002)(53936002)(8936002)(8676002)(52116002)(25786009)(9686003)(71200400001)(71190400001)(86362001)(1076003)(6512007)(66476007)(68736007)(3846002)(6246003)(107886003)(99286004)(2906002)(33656002)(6116002)(6486002)(6436002)(4326008)(229853002)(64756008)(66446008)(14454004)(26005)(6916009)(305945005)(7736002)(11346002)(66946007)(6506007)(61506002)(66066001)(66556008)(54906003)(476003)(102836004)(478600001)(186003)(386003)(73956011)(256004)(14444005)(81166006)(486006)(446003)(81156014)(316002)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR0701MB2656;H:VI1PR0701MB2752.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nZEOrsx8IQoYP5xjP5YH0kpaZ8NEXrNAY8UtH1efHsyhI8BGKD0jALutJdom38OzMqFSBBqirm7blHvdx/XOKAqFOSLGRa/dNUCAPDxnPzVfILDEM1DrJD5VMsJFJWp1qrm+i+rho0jHRn1gQPz6jN2BSXILuJpmqqiuryuAiB3wlgNvGTbcSOYKjGU/qN9REWy6u1CJeWjqiySYuRKpHbWMP4iqm/80SLiSv1kVsKVHa+Gu4gb9rAFwoZ6ZAYJmD/CcETrpGnneguwOhXRstTYhXYEH5ynZVYkTbyLjh6L88Lh/peTVrbjQToLvajfIb3GpxWxD48TyODVoHsNHL4JmH5Y6gCVWlJmInRledy/TeNwcZfEg1t4Nak36LkgsJf2yDKPoguQ+ArMyni1urXgP9lfZfllcJC1jD8RB0RA=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <40C615FE84220A4EA224D9909FDE40DA@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb3c41e-482a-4a09-d334-08d6efe790a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 10:11:56.5557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krzysztof.adamski@nokia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2656
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 12, 2019 at 07:58:24AM -0700, Guenter Roeck wrote:
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
>---
> drivers/hwmon/pmbus/adm1275.c | 84 +++++++++++++++++++++++++++++++++-----=
-----
> 1 file changed, 66 insertions(+), 18 deletions(-)
>
>diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
>index a477ce0474bb..b23c2dd95893 100644
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
>+#define ADM1278_PRW_AVG_SHIFT		11
>+#define ADM1278_PWR_AVG_MASK		GENMASK(ADM1278_PRW_AVG_SHIFT + 2, \
>+						ADM1278_PRW_AVG_SHIFT)

s/PRW/PWR/

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
>@@ -161,28 +170,60 @@ static const struct coefficients adm1293_coefficient=
s[] =3D {
> 	[18] =3D { 7658, 0, -3 },		/* power, 21V, irange200 */
> };
>
>-static inline int adm1275_read_pmon_config(struct i2c_client *client, u16=
 mask)
>+static inline int adm1275_read_pmon_config(const struct adm1275_data *dat=
a,

This function does not have to be inline anymore. It had to be inline
before because of FIELD_GET but this is not used anymore.

>+					   struct i2c_client *client,
>+					   bool is_power)
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
>+		shift =3D is_power ? ADM1278_PRW_AVG_SHIFT : ADM1278_VI_AVG_SHIFT;
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
>+static inline int adm1275_write_pmon_config(const struct adm1275_data *da=
ta,
>+					    struct i2c_client *client,
>+					    bool is_power,
> 					    u16 word)

Same comment about inline here.

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
>+		shift =3D is_power ? ADM1278_PRW_AVG_SHIFT : ADM1278_VI_AVG_SHIFT;
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
>@@ -266,14 +307,16 @@ static int adm1275_read_word_data(struct i2c_client =
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
>@@ -323,14 +366,16 @@ static int adm1275_write_word_data(struct i2c_client=
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
>@@ -528,6 +573,7 @@ static int adm1275_probe(struct i2c_client *client,
> 		data->have_vout =3D true;
> 		data->have_pin_max =3D true;
> 		data->have_temp_max =3D true;
>+		data->have_power_sampling =3D true;
>
> 		coefficients =3D adm1272_coefficients;
> 		vindex =3D (config & ADM1275_VRANGE) ? 1 : 0;
>@@ -613,6 +659,7 @@ static int adm1275_probe(struct i2c_client *client,
> 		data->have_vout =3D true;
> 		data->have_pin_max =3D true;
> 		data->have_temp_max =3D true;
>+		data->have_power_sampling =3D true;
>
> 		coefficients =3D adm1278_coefficients;
> 		vindex =3D 0;
>@@ -648,6 +695,7 @@ static int adm1275_probe(struct i2c_client *client,
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
