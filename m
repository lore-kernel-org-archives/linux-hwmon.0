Return-Path: <SRS0=rYov=SQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1EAC10F13
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 21:58:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7170820818
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 21:58:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="IWV4JCbH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbfDNV6X (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 17:58:23 -0400
Received: from mail-eopbgr30135.outbound.protection.outlook.com ([40.107.3.135]:40770
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725829AbfDNV6X (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 17:58:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8X4WMNDqm554svng7h1e+w8+wMKtyBxrlpAeiDCt1o=;
 b=IWV4JCbH7PgYFirkc3JYjyhzYdBHmtocLSDHrZMtMSqvl7HqB7vTo/WAw93DYph2QMAt9KGlnlbBBPZrXf3oMWMIppWF+6MXTTOQT+APTCAtYNpzz2+nVhTjxD/yXa8GVkZQ593cOpY959zXYjacuCr7RbnxOt3jhyajYe2QGXc=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB4297.eurprd07.prod.outlook.com (20.176.166.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.8; Sun, 14 Apr 2019 21:58:19 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Sun, 14 Apr 2019
 21:58:19 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v3 1/4] pmbus: introduce PMBUS_VIRT_*_SAMPLES registers
Thread-Topic: [PATCH v3 1/4] pmbus: introduce PMBUS_VIRT_*_SAMPLES registers
Thread-Index: AQHU8w0rtzfKfTHyr0mjB1smzcGX1A==
Date:   Sun, 14 Apr 2019 21:58:18 +0000
Message-ID: <d7c49e8d72af52caa5a31b476ada5161a6d437ef.1555273192.git.krzysztof.adamski@nokia.com>
References: <cover.1555273192.git.krzysztof.adamski@nokia.com>
In-Reply-To: <cover.1555273192.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0902CA0040.eurprd09.prod.outlook.com
 (2603:10a6:7:15::29) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 169bc6d7-7a34-4766-f819-08d6c1244d88
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB4297;
x-ms-traffictypediagnostic: HE1PR07MB4297:
x-microsoft-antispam-prvs: <HE1PR07MB4297F441E3F2BA727887ECDDEF2A0@HE1PR07MB4297.eurprd07.prod.outlook.com>
x-forefront-prvs: 00073DB75F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(366004)(39860400002)(376002)(346002)(189003)(199004)(316002)(7736002)(2616005)(6506007)(386003)(102836004)(5660300002)(107886003)(446003)(11346002)(6116002)(3846002)(476003)(118296001)(76176011)(71200400001)(66066001)(71190400001)(305945005)(99286004)(2906002)(486006)(52116002)(86362001)(256004)(6512007)(4326008)(81166006)(6436002)(53936002)(105586002)(6486002)(81156014)(36756003)(26005)(97736004)(106356001)(110136005)(54906003)(186003)(8936002)(478600001)(25786009)(68736007)(8676002)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB4297;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: t3muyCDTnMBuDyKJet0mRn+GfYYZhEutdGHOnZGHTlltH5yJRwqBGhkMUpJxBjcXWK4R+DCIU+w4TzWGMe5P4JuEeol3d0/xwTuEvSA2g06pCklSE98JN+r20KOu8HDEXe9fxKqd9kC0xLxzil4ZcbT1eFKMYLZyHh8X2GuvoAeE/xHwK4ehqjwPloh6lxccACuDsmI0gwAz72B/BckpticTMfhUKbOTD5BTs4P2k25QmimtyTiKO4q2NdZruU+pg4DQX8k3lQZXvjyQZsjT1zTXBM+FYzuZGMbALAbRcE/h25zDjQRjd45pmuSBtcj9ycRv4wvWdmb28T4RMG+RmJuSobOCigh1v6yHEuetqpddQWJTdjUstYj/7bCQjaVKuWYNzaMtlvQDsm2aLN2fcvojHRCO3lipWWVFxvzlCKU=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0C43D99B1AE83449B5871A840ED7E917@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169bc6d7-7a34-4766-f819-08d6c1244d88
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2019 21:58:18.9173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4297
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Those virtual registers can be used to export manufacturer specific
functionality for controlling the number of samples for average values
reported by the device.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/pmbus/pmbus.h      |  15 +++++
 drivers/hwmon/pmbus/pmbus_core.c | 110 +++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 1d24397d36ec..e73289cc867d 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -217,6 +217,20 @@ enum pmbus_regs {
 	PMBUS_VIRT_PWM_ENABLE_2,
 	PMBUS_VIRT_PWM_ENABLE_3,
 	PMBUS_VIRT_PWM_ENABLE_4,
+
+	/* Samples for average
+	 *
+	 * Drivers wanting to expose functionality for changing the number of
+	 * samples used for average values should implement support in
+	 * {read,write}_word_data callback for either PMBUS_VIRT_SAMPLES if it
+	 * applies to all types of measurements, or any number of specific
+	 * PMBUS_VIRT_*_SAMPLES registers to allow for individual control.
+	 */
+	PMBUS_VIRT_SAMPLES,
+	PMBUS_VIRT_IN_SAMPLES,
+	PMBUS_VIRT_CURR_SAMPLES,
+	PMBUS_VIRT_POWER_SAMPLES,
+	PMBUS_VIRT_TEMP_SAMPLES,
 };
=20
 /*
@@ -371,6 +385,7 @@ enum pmbus_sensor_classes {
 #define PMBUS_HAVE_STATUS_VMON	BIT(19)
 #define PMBUS_HAVE_PWM12	BIT(20)
 #define PMBUS_HAVE_PWM34	BIT(21)
+#define PMBUS_HAVE_SAMPLES	BIT(22)
=20
 #define PMBUS_PAGE_VIRTUAL	BIT(31)
=20
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c
index 2e2b5851139c..9b7d493c98b9 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1901,6 +1901,112 @@ static int pmbus_add_fan_attributes(struct i2c_clie=
nt *client,
 	return 0;
 }
=20
+struct pmbus_samples_attr {
+	int reg;
+	char *name;
+};
+
+struct pmbus_samples_reg {
+	int page;
+	struct pmbus_samples_attr *attr;
+	struct device_attribute dev_attr;
+};
+
+static struct pmbus_samples_attr pmbus_samples_registers[] =3D {
+	{
+		.reg =3D PMBUS_VIRT_SAMPLES,
+		.name =3D "samples",
+	}, {
+		.reg =3D PMBUS_VIRT_IN_SAMPLES,
+		.name =3D "in_samples",
+	}, {
+		.reg =3D PMBUS_VIRT_CURR_SAMPLES,
+		.name =3D "curr_samples",
+	}, {
+		.reg =3D PMBUS_VIRT_POWER_SAMPLES,
+		.name =3D "power_samples",
+	}, {
+		.reg =3D PMBUS_VIRT_TEMP_SAMPLES,
+		.name =3D "temp_samples",
+	}
+};
+
+#define to_samples_reg(x) container_of(x, struct pmbus_samples_reg, dev_at=
tr)
+
+static ssize_t pmbus_show_samples(struct device *dev,
+				  struct device_attribute *devattr, char *buf)
+{
+	int val;
+	struct i2c_client *client =3D to_i2c_client(dev->parent);
+	struct pmbus_samples_reg *reg =3D to_samples_reg(devattr);
+
+	val =3D _pmbus_read_word_data(client, reg->page, reg->attr->reg);
+	if (val < 0)
+		return val;
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+}
+
+static ssize_t pmbus_set_samples(struct device *dev,
+				 struct device_attribute *devattr,
+				 const char *buf, size_t count)
+{
+	int ret;
+	long val;
+	struct i2c_client *client =3D to_i2c_client(dev->parent);
+	struct pmbus_samples_reg *reg =3D to_samples_reg(devattr);
+
+	if (kstrtol(buf, 0, &val) < 0)
+		return -EINVAL;
+
+	ret =3D _pmbus_write_word_data(client, reg->page, reg->attr->reg, val);
+
+	return ret ? : count;
+}
+
+static int pmbus_add_samples_attr(struct pmbus_data *data, int page,
+				  struct pmbus_samples_attr *attr)
+{
+	struct pmbus_samples_reg *reg;
+
+	reg =3D devm_kzalloc(data->dev, sizeof(*reg), GFP_KERNEL);
+	if (!reg)
+		return -ENOMEM;
+
+	reg->attr =3D attr;
+	reg->page =3D page;
+
+	pmbus_dev_attr_init(&reg->dev_attr, attr->name, 0644,
+			    pmbus_show_samples, pmbus_set_samples);
+
+	return pmbus_add_attribute(data, &reg->dev_attr.attr);
+}
+
+static int pmbus_add_samples_attributes(struct i2c_client *client,
+					struct pmbus_data *data)
+{
+	const struct pmbus_driver_info *info =3D data->info;
+	int s;
+
+	if (!(info->func[0] & PMBUS_HAVE_SAMPLES))
+		return 0;
+
+	for (s =3D 0; s < ARRAY_SIZE(pmbus_samples_registers); s++) {
+		struct pmbus_samples_attr *attr;
+		int ret;
+
+		attr =3D &pmbus_samples_registers[s];
+		if (!pmbus_check_word_register(client, 0, attr->reg))
+			continue;
+
+		ret =3D pmbus_add_samples_attr(data, 0, attr);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int pmbus_find_attributes(struct i2c_client *client,
 				 struct pmbus_data *data)
 {
@@ -1932,6 +2038,10 @@ static int pmbus_find_attributes(struct i2c_client *=
client,
=20
 	/* Fans */
 	ret =3D pmbus_add_fan_attributes(client, data);
+	if (ret)
+		return ret;
+
+	ret =3D pmbus_add_samples_attributes(client, data);
 	return ret;
 }
=20
--=20
2.20.1

