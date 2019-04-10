Return-Path: <SRS0=HmyG=SM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B553C10F11
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 22:39:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAAF920820
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 22:39:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="LNjc57al"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfDJWjA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Apr 2019 18:39:00 -0400
Received: from mail-eopbgr150132.outbound.protection.outlook.com ([40.107.15.132]:58053
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726073AbfDJWjA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Apr 2019 18:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7hGsXsf1EG7UqGk1GGYEzjtu9tUBbE4IEm0cqwtiPo=;
 b=LNjc57alniOmkWWIQjbA9s2JCR3lY40vql7HVS8TWIrCV+RX7vlm3mxZCdNyPEz7u6AIO29pqMHTmfHhkVqPEo6MrBT3yFeNMRZUrjdNu85hYOQ/mEJmu3HcmF0eiBLhQDu5cd5eP3bbh1G88IAocUeOA/1/wk2Cx40KuYbKbDw=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB3081.eurprd07.prod.outlook.com (10.170.244.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.12; Wed, 10 Apr 2019 22:38:56 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1792.007; Wed, 10 Apr 2019
 22:38:56 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH 1/3] pmbus: support for custom sysfs attributes
Thread-Topic: [PATCH 1/3] pmbus: support for custom sysfs attributes
Thread-Index: AQHU7+4u+Hz9v2dzJE+KamGVhYjAVg==
Date:   Wed, 10 Apr 2019 22:38:56 +0000
Message-ID: <28f92a8e63ce4b0e1071e8fdb2315a057daee9c6.1554934898.git.krzysztof.adamski@nokia.com>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
In-Reply-To: <cover.1554934898.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0701CA0043.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::11) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4a2e203-2a6e-47b8-fc61-08d6be055124
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB3081;
x-ms-traffictypediagnostic: HE1PR07MB3081:
x-microsoft-antispam-prvs: <HE1PR07MB3081247C0C22CCD9F96F5F30EF2E0@HE1PR07MB3081.eurprd07.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(25786009)(107886003)(4326008)(36756003)(6512007)(81156014)(8676002)(81166006)(7736002)(305945005)(14454004)(53936002)(446003)(105586002)(186003)(486006)(118296001)(2616005)(478600001)(52116002)(11346002)(14444005)(26005)(256004)(106356001)(76176011)(386003)(6506007)(476003)(6116002)(66066001)(6486002)(3846002)(6436002)(99286004)(97736004)(68736007)(5660300002)(71200400001)(71190400001)(316002)(86362001)(2906002)(8936002)(54906003)(110136005)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB3081;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V1+dOEuSE5vVB9IpqTpWxBzu4veO4ng/F6BqHvBnMZ/BSBE1YYAfqF3BtlGIN1Qny8jm0t7B1URu/fzW50Bm2PtbIL8iCSBDgXJRlU874xlAXKcPiUmB06AgRVHXsAp91Sv1yRcmM5TGTbNtxQzTDDvFJWURdhjjnllnbJnwNZ22GYpAoexCXcVrpM5gF8OtAmgP14kkGt4NruM5g7DYwrVAoquyozRbNhgZdWMkDMZCCnbBZ83mj7aWSYwAb45LOH8sUUPvhoxM/hezcNzQR2hW0cmdWzK7RIc6c7sg1RqnttWe6HhcU9ds+Zf0ZJK5o0TZoyZnMbSWkgV+ZfP9sPVZkkDJCXWuqdKBOYM41zHkK5r7sXpYurjzsSNcNGLJmERW5CI3ERJsv7zN/1SfMeVCiyk4LM84RzVsJMTSw3o=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2933D80E58C74346BDFA1556D6B7423A@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a2e203-2a6e-47b8-fc61-08d6be055124
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 22:38:56.7668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3081
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch makes it possible to pass custom struct attribute_group array
via the pmbus_driver_info struct so that those can be added to the
attribute groups passed to hwmon_device_register_with_groups().

This makes it possible to register custom sysfs attributes by PMBUS
drivers similar to how you can do this with most other busses/classes.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/pmbus/pmbus.h      |  3 +++
 drivers/hwmon/pmbus/pmbus_core.c | 13 ++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 1d24397d36ec..fb267ec11623 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -417,6 +417,9 @@ struct pmbus_driver_info {
 	/* Regulator functionality, if supported by this chip driver. */
 	int num_regulators;
 	const struct regulator_desc *reg_desc;
+
+	/* custom attributes */
+	const struct attribute_group **groups;
 };
=20
 /* Regulator ops */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c
index 2e2b5851139c..7a7dcdc8acc9 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -103,7 +103,7 @@ struct pmbus_data {
 	int max_attributes;
 	int num_attributes;
 	struct attribute_group group;
-	const struct attribute_group *groups[2];
+	const struct attribute_group **groups;
 	struct dentry *debugfs;		/* debugfs device directory */
=20
 	struct pmbus_sensor *sensors;
@@ -2305,6 +2305,7 @@ int pmbus_do_probe(struct i2c_client *client, const s=
truct i2c_device_id *id,
 	struct device *dev =3D &client->dev;
 	const struct pmbus_platform_data *pdata =3D dev_get_platdata(dev);
 	struct pmbus_data *data;
+	size_t groups_num =3D 0;
 	int ret;
=20
 	if (!info)
@@ -2319,6 +2320,15 @@ int pmbus_do_probe(struct i2c_client *client, const =
struct i2c_device_id *id,
 	if (!data)
 		return -ENOMEM;
=20
+	if (info->groups)
+		while (info->groups[groups_num])
+			groups_num++;
+
+	data->groups =3D devm_kcalloc(dev, groups_num + 2, sizeof(void *),
+				    GFP_KERNEL);
+	if (!data->groups)
+		return -ENOMEM;
+
 	i2c_set_clientdata(client, data);
 	mutex_init(&data->update_lock);
 	data->dev =3D dev;
@@ -2346,6 +2356,7 @@ int pmbus_do_probe(struct i2c_client *client, const s=
truct i2c_device_id *id,
 	}
=20
 	data->groups[0] =3D &data->group;
+	memcpy(data->groups + 1, info->groups, sizeof(void *) * groups_num);
 	data->hwmon_dev =3D hwmon_device_register_with_groups(dev, client->name,
 							    data, data->groups);
 	if (IS_ERR(data->hwmon_dev)) {
--=20
2.20.1

