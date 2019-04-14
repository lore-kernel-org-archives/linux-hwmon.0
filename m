Return-Path: <SRS0=rYov=SQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B54C10F13
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 19:09:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F2F7206B7
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 19:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="fbSOFVcY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbfDNTI7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 15:08:59 -0400
Received: from mail-eopbgr20090.outbound.protection.outlook.com ([40.107.2.90]:12420
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725780AbfDNTI7 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 15:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZHAusDZrtBmv8wsk/d7WvyE2yDBVKrYmVLGxQk73yc=;
 b=fbSOFVcYvwvjeAQO6NgodgjA2kNi4b1VqY3WbBxL50okM0kebcBC5xxE+EShTbfAsNdu6UPQ8gZoptX+ymRuZnXQF/S91UjEz8qsqhFX5y86SUmbJIYcGxynh+sYBZaF7B9ExLTK/8N8bhKGQSo3kYF7xw4LT0GcUaesVVgKc1g=
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com (10.170.247.12) by
 HE1PR07MB4378.eurprd07.prod.outlook.com (20.176.167.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.9; Sun, 14 Apr 2019 19:08:54 +0000
Received: from HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6]) by HE1PR07MB3337.eurprd07.prod.outlook.com
 ([fe80::cd23:d96f:5d94:cee6%7]) with mapi id 15.20.1813.009; Sun, 14 Apr 2019
 19:08:54 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v2 1/3] pmbus: introduce PMBUS_VIRT_*_SAMPLES registers
Thread-Topic: [PATCH v2 1/3] pmbus: introduce PMBUS_VIRT_*_SAMPLES registers
Thread-Index: AQHU8hJlvO9GfOyhcUKDBTSvUkUnTqY7uFGAgABOhAA=
Date:   Sun, 14 Apr 2019 19:08:53 +0000
Message-ID: <20190414190848.GB15303@localhost.localdomain>
References: <cover.1555171278.git.krzysztof.adamski@nokia.com>
 <a2e0f8d21ecd61d4a1c1445c872f5abd9b685a18.1555171278.git.krzysztof.adamski@nokia.com>
 <4e51a07b-a7ec-a3a8-38b1-1bfee1d6b00e@roeck-us.net>
In-Reply-To: <4e51a07b-a7ec-a3a8-38b1-1bfee1d6b00e@roeck-us.net>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR02CA0096.eurprd02.prod.outlook.com
 (2603:10a6:7:29::25) To HE1PR07MB3337.eurprd07.prod.outlook.com
 (2603:10a6:7:2d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33e488c9-4dfc-4eb1-cc2b-08d6c10ca2f1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:HE1PR07MB4378;
x-ms-traffictypediagnostic: HE1PR07MB4378:
x-microsoft-antispam-prvs: <HE1PR07MB43787FF516E0CE1BF8BF3D29EF2A0@HE1PR07MB4378.eurprd07.prod.outlook.com>
x-forefront-prvs: 00073DB75F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(346002)(136003)(376002)(39860400002)(189003)(199004)(66066001)(229853002)(476003)(99286004)(86362001)(316002)(14444005)(97736004)(71190400001)(54906003)(5660300002)(6486002)(8676002)(11346002)(71200400001)(2906002)(8936002)(61506002)(33656002)(446003)(105586002)(256004)(81156014)(486006)(81166006)(106356001)(25786009)(6436002)(107886003)(26005)(7736002)(3846002)(478600001)(4326008)(1076003)(6116002)(386003)(52116002)(305945005)(9686003)(6512007)(68736007)(6506007)(6916009)(76176011)(186003)(14454004)(102836004)(6246003)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR07MB4378;H:HE1PR07MB3337.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: amKmBeiOKu5dXBDQuQVIhLpLVxYRqRtp5sWRjBzpEF9foF2vvpQkBYnr5Gd2wQ/b5UXkxyB75qk6JObn8ccIU7OO3NjUbv6DJGGXKSWImZhGc+qnIirD9TRLLMLmHnSFo/RBR+OPVSjYdymA9AgSsGEIV6gipdEpl6QS65+QoyMqhbyTbNah9ONEbzKv4I+BTY1Aj2B5g46ev6zgv7IfRjtCzuxFHBKt4HnaDSEe/ewXwzy+5B9ZDoq08CsX/MfE4g+oW8FTnA1LtfxnIi+WzPXb9agWc6pv6pMBU0DBlLL4px5hBp7JwZt8cKJyujdcWYTGMNHd+gR8avdvTOZHWgnZyknSWlKRK7e9p7o2awOoJy+LLGQ74tZPwIX31Za/y8XHx5kdUEouobkgTu/h7BWFlKlmGrC4Xf/ol3WrUF0=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FB82A71AF165C34B9F0DB0C8E06696F9@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e488c9-4dfc-4eb1-cc2b-08d6c10ca2f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2019 19:08:53.9869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4378
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 14, 2019 at 07:27:47AM -0700, Guenter Roeck wrote:
>On 4/13/19 9:03 AM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
>>Those virtual registers can be used to export manufacturer specific
>>functionality for controlling the number of samples for average values
>>reported by the device.
>>
>>Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>>---
>>  Documentation/hwmon/sysfs-interface |  18 +++++
>>  drivers/hwmon/pmbus/pmbus.h         |  15 ++++
>>  drivers/hwmon/pmbus/pmbus_core.c    | 114 ++++++++++++++++++++++++++++
>>  3 files changed, 147 insertions(+)
>>
>>diff --git a/Documentation/hwmon/sysfs-interface b/Documentation/hwmon/sy=
sfs-interface
>>index 2b9e1005d88b..7b91706d01c8 100644
>>--- a/Documentation/hwmon/sysfs-interface
>>+++ b/Documentation/hwmon/sysfs-interface
>>@@ -756,6 +756,24 @@ intrusion[0-*]_beep
>>  		1: enable
>>  		RW
>>+********************************
>>+* Average sample configuration *
>>+********************************
>>+
>>+Devices allowing for reading {in,power,curr,temp}_average values may exp=
ort
>>+attributes for controlling number of samples used to compute average.
>>+
>>+samples		Sets number of average samples for all types of measurements.
>>+		RW
>>+
>>+in_samples
>>+power_samples
>>+curr_samples
>>+temp_samples    Sets number of average samples for specific type of meas=
urements.
>>+		Note that on some devices it won't be possible to set all of them
>>+		to different values so changing one might also change some others.
>>+		RW
>>+
>
>Separate patch for the above, please. Adding the ABI is one subject, addin=
g support
>for it into a driver (or driver core) is another.

Sure, I'll do that.

>
>>  sysfs attribute writes interpretation
>>  -------------------------------------
>>diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>>index 1d24397d36ec..e73289cc867d 100644
>>--- a/drivers/hwmon/pmbus/pmbus.h
>>+++ b/drivers/hwmon/pmbus/pmbus.h
>>@@ -217,6 +217,20 @@ enum pmbus_regs {
>>  	PMBUS_VIRT_PWM_ENABLE_2,
>>  	PMBUS_VIRT_PWM_ENABLE_3,
>>  	PMBUS_VIRT_PWM_ENABLE_4,
>>+
>>+	/* Samples for average
>>+	 *
>>+	 * Drivers wanting to expose functionality for changing the number of
>>+	 * samples used for average values should implement support in
>>+	 * {read,write}_word_data callback for either PMBUS_VIRT_SAMPLES if it
>>+	 * applies to all types of measurements, or any number of specific
>>+	 * PMBUS_VIRT_*_SAMPLES registers to allow for individual control.
>>+	 */
>>+	PMBUS_VIRT_SAMPLES,
>>+	PMBUS_VIRT_IN_SAMPLES,
>>+	PMBUS_VIRT_CURR_SAMPLES,
>>+	PMBUS_VIRT_POWER_SAMPLES,
>>+	PMBUS_VIRT_TEMP_SAMPLES,
>>  };
>>  /*
>>@@ -371,6 +385,7 @@ enum pmbus_sensor_classes {
>>  #define PMBUS_HAVE_STATUS_VMON	BIT(19)
>>  #define PMBUS_HAVE_PWM12	BIT(20)
>>  #define PMBUS_HAVE_PWM34	BIT(21)
>>+#define PMBUS_HAVE_SAMPLES	BIT(22)
>>  #define PMBUS_PAGE_VIRTUAL	BIT(31)
>>diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
>>index 2e2b5851139c..31b6bf49518c 100644
>>--- a/drivers/hwmon/pmbus/pmbus_core.c
>>+++ b/drivers/hwmon/pmbus/pmbus_core.c
>>@@ -1901,6 +1901,116 @@ static int pmbus_add_fan_attributes(struct i2c_cl=
ient *client,
>>  	return 0;
>>  }
>>+struct pmbus_samples_attr {
>>+	int reg;
>>+	char *name;
>>+};
>>+
>>+struct pmbus_samples_reg {
>>+	int page;
>>+	struct pmbus_samples_attr *attr;
>>+	struct device_attribute dev_attr;
>>+};
>>+
>>+static struct pmbus_samples_attr pmbus_samples_registers[] =3D {
>>+	{
>>+		.reg =3D PMBUS_VIRT_SAMPLES,
>>+		.name =3D "samples",
>>+	}, {
>>+		.reg =3D PMBUS_VIRT_IN_SAMPLES,
>>+		.name =3D "in_samples",
>>+	}, {
>>+		.reg =3D PMBUS_VIRT_CURR_SAMPLES,
>>+		.name =3D "curr_samples",
>>+	}, {
>>+		.reg =3D PMBUS_VIRT_POWER_SAMPLES,
>>+		.name =3D "power_samples",
>>+	}, {
>>+		.reg =3D PMBUS_VIRT_TEMP_SAMPLES,
>>+		.name =3D "temp_samples",
>>+	}
>>+};
>>+
>>+#define to_samples_reg(x) container_of(x, struct pmbus_samples_reg, dev_=
attr)
>>+
>>+static ssize_t pmbus_show_samples(struct device *dev,
>>+				  struct device_attribute *devattr, char *buf)
>>+{
>>+	int val;
>>+	struct i2c_client *client =3D to_i2c_client(dev->parent);
>>+	struct pmbus_samples_reg *reg =3D to_samples_reg(devattr);
>>+
>>+	val =3D _pmbus_read_word_data(client, reg->page, reg->attr->reg);
>>+	if (val < 0)
>>+		return val;
>>+
>>+	return snprintf(buf, PAGE_SIZE, "%d\n", val);
>>+}
>>+
>>+static ssize_t pmbus_set_samples(struct device *dev,
>>+				 struct device_attribute *devattr,
>>+				 const char *buf, size_t count)
>>+{
>>+	int ret;
>>+	long val;
>>+	struct i2c_client *client =3D to_i2c_client(dev->parent);
>>+	struct pmbus_samples_reg *reg =3D to_samples_reg(devattr);
>>+
>>+	if (kstrtol(buf, 0, &val) < 0)
>>+		return -EINVAL;
>>+
>>+	ret =3D _pmbus_write_word_data(client, reg->page, reg->attr->reg, val);
>>+
>>+	return ret ? : count;
>>+}
>>+
>>+static int pmbus_add_samples_attr(struct pmbus_data *data, int page,
>>+				  struct pmbus_samples_attr *attr)
>>+{
>>+	struct pmbus_samples_reg *reg;
>>+
>>+	reg =3D devm_kzalloc(data->dev, sizeof(*reg), GFP_KERNEL);
>>+	if (!reg)
>>+		return -ENOMEM;
>>+
>>+	reg->attr =3D attr;
>>+	reg->page =3D page;
>>+
>>+	pmbus_dev_attr_init(&reg->dev_attr, attr->name, (S_IWUSR | S_IRUGO),
>
>S_IWUSR ran out of favor and generates a checkpatch warning.
>Please use 0644.

I wasn't sure if its more important to care about checkpatch warning or
to keep convention in the file. I'll change to numerical value as
advised.
>
>>+			    pmbus_show_samples, pmbus_set_samples);
>>+
>>+	return pmbus_add_attribute(data, &reg->dev_attr.attr);
>>+}
>>+
>>+static int pmbus_add_samples_attributes(struct i2c_client *client,
>>+					struct pmbus_data *data)
>>+{
>>+	const struct pmbus_driver_info *info =3D data->info;
>>+	int page;
>>+
>>+	for (page =3D 0; page < info->pages; page++) {
>
>This won't work as intended on multi-page chips. If the driver writer
>is not careful, it will try to generate multiple similar attributes,
>one per page. I would suggest to only check this for page 0.
>At some point we may need to add a separate func pointer for
>chip specific attributes, but that should do for now.
>
Good point. I'll do that.

>>+		int s;:
>>+
>>+		if (!(info->func[page] & PMBUS_HAVE_SAMPLES))
>>+			continue;
>>+
>>+		for (s =3D 0; s < ARRAY_SIZE(pmbus_samples_registers); s++) {
>>+			int ret;
>>+			struct pmbus_samples_attr *attr;
>>+
>
>Please use reverse christmas tree here
>
>			struct pmbus_samples_attr *attr;
>			int ret;

Ok.

>>+			attr =3D &pmbus_samples_registers[s];
>>+			if (!pmbus_check_word_register(client, page, attr->reg))
>>+				continue;
>>+
>>+			ret =3D pmbus_add_samples_attr(data, page, attr);
>>+			if (ret)
>>+				return ret;
>>+		}
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>  static int pmbus_find_attributes(struct i2c_client *client,
>>  				 struct pmbus_data *data)
>>  {
>>@@ -1932,6 +2042,10 @@ static int pmbus_find_attributes(struct i2c_client=
 *client,
>>  	/* Fans */
>>  	ret =3D pmbus_add_fan_attributes(client, data);
>>+	if (ret)
>>+		return ret;
>>+
>>+	ret =3D pmbus_add_samples_attributes(client, data);
>>  	return ret;
>>  }
>>
>

Krzysztof
