Return-Path: <SRS0=rYov=SQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5286C10F13
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 21:59:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8837320818
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 21:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="qA0JPdKB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfDNV7l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 17:59:41 -0400
Received: from mail-eopbgr80127.outbound.protection.outlook.com ([40.107.8.127]:54757
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726392AbfDNV7l (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 17:59:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Up069WkEw8jiCz442d388bwfdrmGA3hj/nUkOY/0hE=;
 b=qA0JPdKBKWhigOic1YsMrbLaxOznJszn+ifn2nKnlqwspYg0ai/cW9DwVUduhXIrwdFZpXT4tkPmj41FKa+yCWNvhTREc5BKX9vuDd+RchrxDkUMRERGTSnkMQgDK8wMxPmUvdWscY+IJMbah0CaVXe0HrScbKFgItbjD8oj220=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB3306.eurprd07.prod.outlook.com (10.170.246.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.9; Sun, 14 Apr 2019 21:59:36 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Sun, 14 Apr 2019
 21:59:36 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v3 4/4] pmbus_core: export coefficients via sysfs
Thread-Topic: [PATCH v3 4/4] pmbus_core: export coefficients via sysfs
Thread-Index: AQHU8w1ZydbOroauu0aS8/AaxTnXFw==
Date:   Sun, 14 Apr 2019 21:59:36 +0000
Message-ID: <4887ef85022d7ceb26905997c19a874d7d89087f.1555273192.git.krzysztof.adamski@nokia.com>
References: <cover.1555273192.git.krzysztof.adamski@nokia.com>
In-Reply-To: <cover.1555273192.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0802CA0019.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::29) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 282b00c1-ff10-43b6-aaf7-08d6c1247bd0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB3306;
x-ms-traffictypediagnostic: HE1PR07MB3306:
x-microsoft-antispam-prvs: <HE1PR07MB3306CA8623291F83D9BE7B6DEF2A0@HE1PR07MB3306.eurprd07.prod.outlook.com>
x-forefront-prvs: 00073DB75F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(346002)(136003)(376002)(366004)(199004)(189003)(6486002)(52116002)(186003)(86362001)(5660300002)(102836004)(118296001)(6506007)(386003)(53936002)(6116002)(26005)(6512007)(99286004)(66066001)(76176011)(11346002)(446003)(2616005)(3846002)(68736007)(106356001)(14444005)(25786009)(105586002)(486006)(107886003)(8936002)(81166006)(71200400001)(71190400001)(36756003)(14454004)(478600001)(54906003)(2906002)(81156014)(6436002)(8676002)(305945005)(7736002)(97736004)(316002)(110136005)(476003)(4326008)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB3306;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cMdzM2NAR2M3v1/NHVHQKXK/7TmFCdVcawDu8IRRyTdB+PD+DeL7OkxFRoEeeqPbvLbVLWoA2dcEK3E4a0VK0dHHe/KgRFEOepw8U84aRMonwEEvdyZwaO3iSNKV/WS9DTaHXnXdHAS3wP9MS+IUePCk4htxKSImfsNf5eY4hOOQw0q47vNT1bb1TT6uQ08LmVyUrcVYprF5qkRcGkU019eqGguzNDxfQR0p/fonHZYZC6Pla1RycDhOtVQNVxgVSzhJYq82DJz7ZN272dI314QdequO0295PjY7ri911tBTP0BCOJjg3VACD8cqyFaJbFRS4YublOmDD8nWhlVjwKBJxWnuFG4b7H7DClonBFgFg/izfErKGtXXbjRMMUh+FWBGsSdmaZIbrDAdqmUE4xuPEGTz1E7V7u2Y+6QYfvg=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BF40E3366F08974CA3912DCB291A3C9F@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282b00c1-ff10-43b6-aaf7-08d6c1247bd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2019 21:59:36.3052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3306
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
index 9b7d493c98b9..38493617d6a7 100644
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
@@ -2007,6 +2010,95 @@ static int pmbus_add_samples_attributes(struct i2c_c=
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
@@ -2042,6 +2134,10 @@ static int pmbus_find_attributes(struct i2c_client *=
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
@@ -2456,6 +2552,8 @@ int pmbus_do_probe(struct i2c_client *client, const s=
truct i2c_device_id *id,
 	}
=20
 	data->groups[0] =3D &data->group;
+	if (data->group_coeff.attrs)
+		data->groups[1] =3D &data->group_coeff;
 	data->hwmon_dev =3D hwmon_device_register_with_groups(dev, client->name,
 							    data, data->groups);
 	if (IS_ERR(data->hwmon_dev)) {
@@ -2478,6 +2576,7 @@ int pmbus_do_probe(struct i2c_client *client, const s=
truct i2c_device_id *id,
 	hwmon_device_unregister(data->hwmon_dev);
 out_kfree:
 	kfree(data->group.attrs);
+	kfree(data->group_coeff.attrs);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(pmbus_do_probe);
@@ -2490,6 +2589,7 @@ int pmbus_do_remove(struct i2c_client *client)
=20
 	hwmon_device_unregister(data->hwmon_dev);
 	kfree(data->group.attrs);
+	kfree(data->group_coeff.attrs);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pmbus_do_remove);
--=20
2.20.1

