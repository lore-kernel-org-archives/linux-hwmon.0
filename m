Return-Path: <SRS0=HmyG=SM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B55C10F11
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 22:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0CEB20820
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 22:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="Soc61aet"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfDJWj7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Apr 2019 18:39:59 -0400
Received: from mail-eopbgr150095.outbound.protection.outlook.com ([40.107.15.95]:52030
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725982AbfDJWj7 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Apr 2019 18:39:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxPrxjxbZ2/eqHy6tPwmNFjx6dwo1u43oHnZbFDwKj0=;
 b=Soc61aetiNh3TNw2AhV47U4FNZ5vZsHbyg/qAbBF0VcI+FiKnlWmQ5kqGkwn1b2kWmMS0OCt7IHkgTfqS995E/GzGMz24x2vFVW/SoJ13sxlP3JGboD1DmRtFq/evrMAs9Zsgq0ndYu8hvZmWIOV3i73JKwt7pdFb/Hl/su4QDc=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB3081.eurprd07.prod.outlook.com (10.170.244.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.12; Wed, 10 Apr 2019 22:39:55 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1792.007; Wed, 10 Apr 2019
 22:39:55 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH 3/3] pmbus: export coefficients via sysfs
Thread-Topic: [PATCH 3/3] pmbus: export coefficients via sysfs
Thread-Index: AQHU7+5Rz590hC5nZ0mo3TDwDq3s6A==
Date:   Wed, 10 Apr 2019 22:39:55 +0000
Message-ID: <8087920a011662114ca151d4e04186c121a9a737.1554934898.git.krzysztof.adamski@nokia.com>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
In-Reply-To: <cover.1554934898.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR08CA0074.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::45) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 843adcb1-d0fc-4632-47f8-08d6be05744e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB3081;
x-ms-traffictypediagnostic: HE1PR07MB3081:
x-microsoft-antispam-prvs: <HE1PR07MB3081BD2ED7F621E9F4DCB939EF2E0@HE1PR07MB3081.eurprd07.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(25786009)(107886003)(4326008)(36756003)(6512007)(81156014)(8676002)(81166006)(7736002)(305945005)(14454004)(53936002)(446003)(105586002)(186003)(486006)(118296001)(2616005)(478600001)(52116002)(11346002)(14444005)(26005)(256004)(106356001)(76176011)(386003)(6506007)(476003)(6116002)(66066001)(6486002)(3846002)(6436002)(99286004)(97736004)(68736007)(5660300002)(71200400001)(71190400001)(316002)(86362001)(2906002)(8936002)(54906003)(110136005)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB3081;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BU2WoAmnHej/C/XGz+dFEBzlMzOEfzpe1tmT4mKakmvQ+hBgsQfwK98opqSb9eDsxFYL18iUB2nnVoZ8WYsGyo9OheX9DdZFwx5P+JI8XiM5a716Pfa2NJoBGdAqYG4htNK88rWJnjSxMTBLCkY5nMoHZLFX/+hrKuTvKwimXBy3jRVaYCXS3tYGyupPi5TPevlJJPu9R4IEjAe06+uJJFwug/UH8d7mhGaSP917BYtto6fodE05W0BP5G89uGIlYAAs8pWx7TDX2eN/4JUt9IdjXzo/CJxlC2u3MvOI69JMWs6m3ThQWJ2rHwv+UsVZPutB7jFrNBklxa09BD21AGx3tDBiO1j7Ov/YhQ7yHt/UCOQbH4ZBpjkZFrhEC/1/NCEoBkCaeROUu44uBpVS+Q/DD5JCxwlTY01Jj1UHrbE=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <869CE9CB02EB2F4C9952D0F7EE3C3371@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 843adcb1-d0fc-4632-47f8-08d6be05744e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 22:39:55.7306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3081
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In order to get best accuracy, in case of some devices it is required to
tweak coefficient values. This is especially true for devices using
some external shunt resistor or being operated in non-usual environment.
Those values may be measured during device production and stored as
calibration values in some place (like EEPROM or even a file).

To support wide range of possible use cases, lets export those to
user space via sysfs attributes so that it can implement its own
policies about them. All those attributes are put into separate
attribute_group struct so that we can set its name to group all of them
in a "coefficients" subdirectory in sysfs.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 100 ++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c
index 7a7dcdc8acc9..8cb61fc977db 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -57,6 +57,8 @@
=20
 #define PMBUS_NAME_SIZE		24
=20
+static const char * const coeff_name[] =3D {"m", "b", "R"};
+
 struct pmbus_sensor {
 	struct pmbus_sensor *next;
 	char name[PMBUS_NAME_SIZE];	/* sysfs sensor name */
@@ -98,11 +100,12 @@ struct pmbus_data {
 	int exponent[PMBUS_PAGES];
 				/* linear mode: exponent for output voltages */
=20
-	const struct pmbus_driver_info *info;
+	struct pmbus_driver_info *info;
=20
 	int max_attributes;
 	int num_attributes;
 	struct attribute_group group;
+	struct attribute_group group_coeff;
 	const struct attribute_group **groups;
 	struct dentry *debugfs;		/* debugfs device directory */
=20
@@ -1901,6 +1904,88 @@ static int pmbus_add_fan_attributes(struct i2c_clien=
t *client,
 	return 0;
 }
=20
+static struct attribute *pmbus_init_coeff_attr(struct pmbus_data *data,
+					       const char *prefix,
+					       const char *coeff, int *target)
+{
+	struct dev_ext_attribute *ext_attr;
+	char *name;
+
+	ext_attr =3D devm_kzalloc(data->dev, sizeof(ext_attr), GFP_KERNEL);
+	if (!ext_attr)
+		return NULL;
+
+	name =3D devm_kasprintf(data->dev, GFP_KERNEL, "%s_%s", prefix, coeff);
+	if (!name)
+		return NULL;
+
+	pmbus_dev_attr_init(&ext_attr->attr, name, (S_IWUSR | S_IRUGO),
+			    device_show_int, device_store_int);
+	ext_attr->var =3D target;
+
+	return &ext_attr->attr.attr;
+}
+
+static int pmbus_add_coeff_attributes_class(struct pmbus_data *data,
+					    const char *prefix,
+					    enum pmbus_sensor_classes class,
+					    struct attribute **attrs)
+{
+	int *coeff_val[] =3D {data->info->m, data->info->b, data->info->R};
+	struct attribute *ret;
+	int i, count =3D 0;
+
+	for (i =3D 0; i < ARRAY_SIZE(coeff_name); i++) {
+		ret =3D pmbus_init_coeff_attr(data, prefix, coeff_name[i],
+					    coeff_val[i]);
+		if (!ret)
+			return -ENOMEM;
+		attrs[count++] =3D ret;
+	}
+
+	return count;
+}
+
+static const char * const classes_names[] =3D {
+	[PSC_VOLTAGE_IN] =3D "vin",
+	[PSC_VOLTAGE_OUT] =3D "vout",
+	[PSC_CURRENT_IN] =3D "iin",
+	[PSC_CURRENT_OUT] =3D "iout",
+	[PSC_POWER] =3D "p",
+	[PSC_TEMPERATURE] =3D "temp",
+};
+
+static int pmbus_add_coeff_attributes(struct i2c_client *client,
+				      struct pmbus_data *data)
+{
+	struct attribute **attrs;
+	int i, n =3D 0, ret =3D 0;
+
+	attrs =3D kcalloc(ARRAY_SIZE(coeff_name) * (PSC_NUM_CLASSES + 1),
+			sizeof(void *), GFP_KERNEL);
+	if (!attrs)
+		return -ENOMEM;
+
+	for (i =3D 0; i < ARRAY_SIZE(classes_names); i++) {
+		if (classes_names[i] =3D=3D NULL)
+			continue;
+
+		ret =3D pmbus_add_coeff_attributes_class(data, classes_names[i],
+						       i, &attrs[n]);
+		if (ret < 0) {
+			kfree(attrs);
+			return ret;
+		}
+
+		n +=3D ret;
+	}
+
+	data->group_coeff.name =3D "coefficients";
+	data->group_coeff.attrs =3D  attrs;
+
+	return 0;
+}
+
 static int pmbus_find_attributes(struct i2c_client *client,
 				 struct pmbus_data *data)
 {
@@ -1932,6 +2017,11 @@ static int pmbus_find_attributes(struct i2c_client *=
client,
=20
 	/* Fans */
 	ret =3D pmbus_add_fan_attributes(client, data);
+	if (ret)
+		return ret;
+
+	/* Coefficients */
+	ret =3D pmbus_add_coeff_attributes(client, data);
 	return ret;
 }
=20
@@ -2324,7 +2414,8 @@ int pmbus_do_probe(struct i2c_client *client, const s=
truct i2c_device_id *id,
 		while (info->groups[groups_num])
 			groups_num++;
=20
-	data->groups =3D devm_kcalloc(dev, groups_num + 2, sizeof(void *),
+	/* Two default groups + ending NULL makes 3 groups minimum */
+	data->groups =3D devm_kcalloc(dev, groups_num + 3, sizeof(void *),
 				    GFP_KERNEL);
 	if (!data->groups)
 		return -ENOMEM;
@@ -2356,7 +2447,8 @@ int pmbus_do_probe(struct i2c_client *client, const s=
truct i2c_device_id *id,
 	}
=20
 	data->groups[0] =3D &data->group;
-	memcpy(data->groups + 1, info->groups, sizeof(void *) * groups_num);
+	data->groups[1] =3D &data->group_coeff;
+	memcpy(data->groups + 2, info->groups, sizeof(void *) * groups_num);
 	data->hwmon_dev =3D hwmon_device_register_with_groups(dev, client->name,
 							    data, data->groups);
 	if (IS_ERR(data->hwmon_dev)) {
@@ -2379,6 +2471,7 @@ int pmbus_do_probe(struct i2c_client *client, const s=
truct i2c_device_id *id,
 	hwmon_device_unregister(data->hwmon_dev);
 out_kfree:
 	kfree(data->group.attrs);
+	kfree(data->group_coeff.attrs);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(pmbus_do_probe);
@@ -2391,6 +2484,7 @@ int pmbus_do_remove(struct i2c_client *client)
=20
 	hwmon_device_unregister(data->hwmon_dev);
 	kfree(data->group.attrs);
+	kfree(data->group_coeff.attrs);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pmbus_do_remove);
--=20
2.20.1

