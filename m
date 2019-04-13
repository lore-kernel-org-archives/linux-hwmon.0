Return-Path: <SRS0=yVNc=SP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4956AC10F11
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Apr 2019 16:03:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E1E12084D
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Apr 2019 16:03:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="ddMTv0bg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfDMQDS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 13 Apr 2019 12:03:18 -0400
Received: from mail-eopbgr150122.outbound.protection.outlook.com ([40.107.15.122]:16399
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727048AbfDMQDS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 13 Apr 2019 12:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcHYA3VknkkEviyQFOYf5SbS778n/btfFDfCDBMb+SY=;
 b=ddMTv0bgzKQoB4B+bFA3WeDPN/FQOWmtel8aZhiglRJBGf+wpV8ZjAOrRPidXwOKMXWmh5vj2xfSbTmPioUHFVXdO2Kg0yzIXVjGSqytQZjbcfKqTd/4MPq6MXhYVuHr8lkJaI6920KRNgcFRuNv4vKFSus+Qnqz/2jEVbwKUmw=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB4219.eurprd07.prod.outlook.com (20.176.166.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.9; Sat, 13 Apr 2019 16:03:12 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Sat, 13 Apr 2019
 16:03:12 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v2 1/3] pmbus: introduce PMBUS_VIRT_*_SAMPLES registers
Thread-Topic: [PATCH v2 1/3] pmbus: introduce PMBUS_VIRT_*_SAMPLES registers
Thread-Index: AQHU8hJlvO9GfOyhcUKDBTSvUkUnTg==
Date:   Sat, 13 Apr 2019 16:03:12 +0000
Message-ID: <a2e0f8d21ecd61d4a1c1445c872f5abd9b685a18.1555171278.git.krzysztof.adamski@nokia.com>
References: <cover.1555171278.git.krzysztof.adamski@nokia.com>
In-Reply-To: <cover.1555171278.git.krzysztof.adamski@nokia.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0359.eurprd05.prod.outlook.com
 (2603:10a6:7:94::18) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 415bfddb-2748-4605-b248-08d6c02987bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB4219;
x-ms-traffictypediagnostic: HE1PR07MB4219:
x-microsoft-antispam-prvs: <HE1PR07MB42190B764D27692AB2FD31C8EF290@HE1PR07MB4219.eurprd07.prod.outlook.com>
x-forefront-prvs: 00064751B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39860400002)(346002)(366004)(136003)(189003)(199004)(6436002)(99286004)(54906003)(256004)(71200400001)(71190400001)(97736004)(81166006)(118296001)(81156014)(66066001)(8676002)(68736007)(6512007)(8936002)(110136005)(316002)(6506007)(386003)(76176011)(186003)(102836004)(26005)(86362001)(5660300002)(106356001)(105586002)(6116002)(2906002)(36756003)(478600001)(52116002)(53936002)(107886003)(4326008)(6486002)(25786009)(446003)(3846002)(11346002)(7736002)(14454004)(305945005)(476003)(486006)(2616005);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB4219;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EDO1Zo3YI9MpmhI0quJvLL5uobN7teUjUmtgXbhWldQjLk7+vN+e1hxxoFXjW34asw+y2+PvKsCtIyoTTVGEXbf30Wf1VSZ6m0vTzqJepCptxgBJm99y0EyFIBzkaPr/iOpfn+SBH2tNEH5bw+ZCym9pBtNd0Ta3X1Iuk4u3N9QaqE+F51B3PvwS1PAPqb/rAi7bV7eOETIfeH5stdrDQFKMeUtwnrcikwApLmzIroCBA3v+k2VZsRY2iJuqSCMLaVZDq4j78snC7yK87yK1c/JYFodeJ9cytq7HEKCTOZ1gNwVDj/eNg2waDN8TZO78hHW/7mEA4pVTjXX1IgmzXrhUDq4hWQ8QOIvZTbSLqpSXu+NwyQbfdhqVF8eRJT/vUu5ZR9y5c1iPUCttZovdiKSzYFVfzRDiv+QV+siq3bk=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <28F2F163E0037D469124FCF2EE939CB0@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415bfddb-2748-4605-b248-08d6c02987bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2019 16:03:12.7044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4219
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Those virtual registers can be used to export manufacturer specific
functionality for controlling the number of samples for average values
reported by the device.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 Documentation/hwmon/sysfs-interface |  18 +++++
 drivers/hwmon/pmbus/pmbus.h         |  15 ++++
 drivers/hwmon/pmbus/pmbus_core.c    | 114 ++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+)

diff --git a/Documentation/hwmon/sysfs-interface b/Documentation/hwmon/sysf=
s-interface
index 2b9e1005d88b..7b91706d01c8 100644
--- a/Documentation/hwmon/sysfs-interface
+++ b/Documentation/hwmon/sysfs-interface
@@ -756,6 +756,24 @@ intrusion[0-*]_beep
 		1: enable
 		RW
=20
+********************************
+* Average sample configuration *
+********************************
+
+Devices allowing for reading {in,power,curr,temp}_average values may expor=
t
+attributes for controlling number of samples used to compute average.
+
+samples		Sets number of average samples for all types of measurements.
+		RW
+
+in_samples
+power_samples
+curr_samples
+temp_samples    Sets number of average samples for specific type of measur=
ements.
+		Note that on some devices it won't be possible to set all of them
+		to different values so changing one might also change some others.
+		RW
+
=20
 sysfs attribute writes interpretation
 -------------------------------------
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
index 2e2b5851139c..31b6bf49518c 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1901,6 +1901,116 @@ static int pmbus_add_fan_attributes(struct i2c_clie=
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
+	pmbus_dev_attr_init(&reg->dev_attr, attr->name, (S_IWUSR | S_IRUGO),
+			    pmbus_show_samples, pmbus_set_samples);
+
+	return pmbus_add_attribute(data, &reg->dev_attr.attr);
+}
+
+static int pmbus_add_samples_attributes(struct i2c_client *client,
+					struct pmbus_data *data)
+{
+	const struct pmbus_driver_info *info =3D data->info;
+	int page;
+
+	for (page =3D 0; page < info->pages; page++) {
+		int s;
+
+		if (!(info->func[page] & PMBUS_HAVE_SAMPLES))
+			continue;
+
+		for (s =3D 0; s < ARRAY_SIZE(pmbus_samples_registers); s++) {
+			int ret;
+			struct pmbus_samples_attr *attr;
+
+			attr =3D &pmbus_samples_registers[s];
+			if (!pmbus_check_word_register(client, page, attr->reg))
+				continue;
+
+			ret =3D pmbus_add_samples_attr(data, page, attr);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int pmbus_find_attributes(struct i2c_client *client,
 				 struct pmbus_data *data)
 {
@@ -1932,6 +2042,10 @@ static int pmbus_find_attributes(struct i2c_client *=
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

