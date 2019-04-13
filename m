Return-Path: <SRS0=yVNc=SP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8903DC10F11
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Apr 2019 16:03:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B4C82084D
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Apr 2019 16:03:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="dahAXMLc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbfDMQD6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 13 Apr 2019 12:03:58 -0400
Received: from mail-eopbgr40114.outbound.protection.outlook.com ([40.107.4.114]:60803
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726998AbfDMQD5 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 13 Apr 2019 12:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iu6CR73/LLWicJJev52r2lxuh/3zLDE+Dj/TvCAYWH4=;
 b=dahAXMLcegpiCUgRjB2+/0hBZaCtXVOxgZ+9QgqGJc8GTF3JXPvPxdJaW2lkFdfiCqJYB3LjMxR8FEMcDCS7nJNMQ1XUqFtxwFn2Yi6jFpKF1GEvuj04FoZTJ9o2HB9TjNY2cZMAZ110D5G2N1wftouw2MW998nVv0M9a6Q+tHE=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB4219.eurprd07.prod.outlook.com (20.176.166.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.9; Sat, 13 Apr 2019 16:03:53 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Sat, 13 Apr 2019
 16:03:53 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v2 3/3] pmbus_core: export coefficients via sysfs
Thread-Topic: [PATCH v2 3/3] pmbus_core: export coefficients via sysfs
Thread-Index: AQHU8hJ9k5PA44rmYUaMU2aI0qCslQ==
Date:   Sat, 13 Apr 2019 16:03:53 +0000
Message-ID: <9c7aba8fe6bf19a017dad4766ac933878481eb54.1555171278.git.krzysztof.adamski@nokia.com>
References: <cover.1555171278.git.krzysztof.adamski@nokia.com>
In-Reply-To: <cover.1555171278.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0102CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::18) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4352553-660a-4707-9a7a-08d6c0299fdf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB4219;
x-ms-traffictypediagnostic: HE1PR07MB4219:
x-microsoft-antispam-prvs: <HE1PR07MB4219A683EF474B9AB8EECA59EF290@HE1PR07MB4219.eurprd07.prod.outlook.com>
x-forefront-prvs: 00064751B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39860400002)(346002)(366004)(136003)(189003)(199004)(6436002)(99286004)(54906003)(14444005)(256004)(71200400001)(71190400001)(97736004)(81166006)(118296001)(81156014)(66066001)(8676002)(68736007)(6512007)(8936002)(110136005)(316002)(6506007)(386003)(76176011)(186003)(102836004)(26005)(86362001)(5660300002)(106356001)(105586002)(6116002)(2906002)(36756003)(478600001)(52116002)(53936002)(107886003)(4326008)(6486002)(25786009)(446003)(3846002)(11346002)(7736002)(14454004)(305945005)(476003)(486006)(2616005);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB4219;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S9JE1iSEf3nWGuMMei+Q5hHGj7Ek8EkfLPxk6VThogqET2H2fFiXF8ggSBQyPjMXuLYMhuc0VkozGJbdH5qpBDsX1/qGr/q45011sNDuq4fqXnKDRlTI2sgUt8elPVz6YEx2A+34DsfkeuwBUfViih1BQ+7F8Gw4ikcKqvvTTni0NQh9o5uUN0uwRvD3+2O2emS2it2oaJJ2/TqXLjRApzpiYP5bSbPQ5fGLVAQzT7cXxDUt+YEk4BmfC/QRYZ2zD7mcbXpW+b4GtnESy63gvJL3c9as5K+rNvi1/zCsWaU26KGr5m+BmWj9D+OMzMqRt1ln84kcvoL749gJ+o93FiZvWTFgsujQeUZ4Iwd951ef/Tz7VhNbiO9v9d1HAnHnXMHHLZ9qkN5LTv2sZucoxWOmULtv3IBjuIjNVrcfKVI=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9AFED10C5DF9DE4887B0D6F8DDBA27F9@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4352553-660a-4707-9a7a-08d6c0299fdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2019 16:03:53.0359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4219
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PMBUS devices report values in real-world units. Those using direct
format require conversion using standarised coefficients and formula.
This operation is already done by pmbus_core and the default values for
coefficients are configured by chip drivers.

However those default values are not allways suitable as they depend on
the value of sense register and environment used. For that reason, in
order to get values that make sense or just to get best accuracy, in it
may be required to tweak coefficient values. The proper values may be
measured during device production (to get best accuracy, they might be
callibrated for each individual unit) and stored as calibration values
in some place (like EEPROM or even a file).

To support wide range of possible use cases, lets export those to user
space via sysfs attributes so that it can implement its own policies
about them. All those attributes are put into separate attribute_group
struct so that we can set its name to group all of them in a
"coefficients" subdirectory in sysfs.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 104 ++++++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c
index 31b6bf49518c..3f94200bf793 100644
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
@@ -98,12 +100,13 @@ struct pmbus_data {
 	int exponent[PMBUS_PAGES];
 				/* linear mode: exponent for output voltages */
=20
-	const struct pmbus_driver_info *info;
+	struct pmbus_driver_info *info;
=20
 	int max_attributes;
 	int num_attributes;
 	struct attribute_group group;
-	const struct attribute_group *groups[2];
+	const struct attribute_group *groups[3];
+	struct attribute_group group_coeff;
 	struct dentry *debugfs;		/* debugfs device directory */
=20
 	struct pmbus_sensor *sensors;
@@ -2011,6 +2014,95 @@ static int pmbus_add_samples_attributes(struct i2c_c=
lient *client,
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
+	ext_attr =3D devm_kzalloc(data->dev, sizeof(*ext_attr), GFP_KERNEL);
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
+	[PSC_POWER] =3D "power",
+	[PSC_TEMPERATURE] =3D "temp",
+};
+
+static int pmbus_add_coeff_attributes(struct i2c_client *client,
+				      struct pmbus_data *data)
+{
+	struct attribute **attrs;
+	int i, n =3D 0, ret =3D 0;
+
+	attrs =3D kcalloc(ARRAY_SIZE(coeff_name) * ARRAY_SIZE(classes_names) + 1,
+			sizeof(void *), GFP_KERNEL);
+	if (!attrs)
+		return -ENOMEM;
+
+	for (i =3D 0; i < ARRAY_SIZE(classes_names); i++) {
+		if (classes_names[i] =3D=3D NULL)
+			continue;
+
+		if (data->info->format[i] !=3D direct)
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
+	if (n) {
+		data->group_coeff.name =3D "coefficients";
+		data->group_coeff.attrs =3D attrs;
+	} else {
+		kfree(attrs);
+	}
+
+	return 0;
+}
+
 static int pmbus_find_attributes(struct i2c_client *client,
 				 struct pmbus_data *data)
 {
@@ -2046,6 +2138,10 @@ static int pmbus_find_attributes(struct i2c_client *=
client,
 		return ret;
=20
 	ret =3D pmbus_add_samples_attributes(client, data);
+	if (ret)
+		return ret;
+
+	ret =3D pmbus_add_coeff_attributes(client, data);
 	return ret;
 }
=20
@@ -2460,6 +2556,8 @@ int pmbus_do_probe(struct i2c_client *client, const s=
truct i2c_device_id *id,
 	}
=20
 	data->groups[0] =3D &data->group;
+	if (data->group_coeff.attrs)
+		data->groups[1] =3D &data->group_coeff;
 	data->hwmon_dev =3D hwmon_device_register_with_groups(dev, client->name,
 							    data, data->groups);
 	if (IS_ERR(data->hwmon_dev)) {
@@ -2482,6 +2580,7 @@ int pmbus_do_probe(struct i2c_client *client, const s=
truct i2c_device_id *id,
 	hwmon_device_unregister(data->hwmon_dev);
 out_kfree:
 	kfree(data->group.attrs);
+	kfree(data->group_coeff.attrs);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(pmbus_do_probe);
@@ -2494,6 +2593,7 @@ int pmbus_do_remove(struct i2c_client *client)
=20
 	hwmon_device_unregister(data->hwmon_dev);
 	kfree(data->group.attrs);
+	kfree(data->group_coeff.attrs);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pmbus_do_remove);
--=20
2.20.1

