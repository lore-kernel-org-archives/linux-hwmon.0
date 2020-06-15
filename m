Return-Path: <SRS0=zIh4=74=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DBFC433E0
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Jun 2020 23:49:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3FC42074D
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Jun 2020 23:49:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com header.i=@maximintegrated.onmicrosoft.com header.b="jvUzR8/+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgFOXtT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Jun 2020 19:49:19 -0400
Received: from mail-dm6nam11on2129.outbound.protection.outlook.com ([40.107.223.129]:12288
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725960AbgFOXtT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Jun 2020 19:49:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hzc1YZIw0VKw4BXDGPHVwbGRXAajCauIkCpL1QWL/AtVVwTpPz+xNb6VlQsWwFQCWLw746vR7z6dQBZKsqDOKPzm8hcKMB1Fe7UssLQwppNrN1HG6x+GxuuS/vyxgX2pM1cw8ahty7m9HengITmUWBg0xRr9EVHeDBCTPiCZUQum+7gdEgJ6N9zFSKg/+SuOGYTwnCr7vc8pZEsCRRnaD0077QIJV2Y3Y894Z8nRlloYtl14ZU059Iy9Z5PjbqAu1cAnGaoIr19Q7AG1AvH6aiY3P7bqG463HocixFwFnTTR012iFuBrbObeiolhFH2/kt+95aVOCcmw0p1J4oqyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f5wKFoHkfWMsyBKhA0/nAUfvDS0rdJgriztWYzU/pA=;
 b=QLXjiItjra+B1tEE2ktq5lkWI3aPBzvMOaN5IsRrt4ewaASF4m7IHSPmMcsw4keXXvkxr2Z6s9smpyDGSObsrfkBjlMHO2KT0OOjsdZJPDI41aGyfuUcDOhpHMmENRBIRapXuqhg90TA+evskWtdySeNnmmCBH/iw1qhbFxJ/hT36cNcOKiIwCX7sjutodydVkqRJudi3zLUhfDK7IIeSIcLvp8+4QkFKU1pMAztsxcRwoXvV+4ZYzzDq7xvW7jcO94xoA8Bg2N7Wlsek7UJNRKvDW+2hVkEEJ/9uAnKU9/POoS1a0dsdLSXE4cuuWPlVltPV8ZvQ5Kz3QuUrIN7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f5wKFoHkfWMsyBKhA0/nAUfvDS0rdJgriztWYzU/pA=;
 b=jvUzR8/+J9R5u0ZvogpZ5qPnQ4KJ8WfhVgSeAokvDfY3qsEkBOboGeL7/eOYq5w7KNcSXTXcVRnai+MTEQyQRa+7yDtm8K9rIevdiuYwHQVtm9izT/9RomNCJABIzvJtKzpI9WsRoVxvFbuD0ANAEynxTNwnpEB8LWNPXxUyn8Q=
Received: from BYAPR11MB3174.namprd11.prod.outlook.com (2603:10b6:a03:76::27)
 by BY5PR11MB4039.namprd11.prod.outlook.com (2603:10b6:a03:18b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Mon, 15 Jun
 2020 23:49:14 +0000
Received: from BYAPR11MB3174.namprd11.prod.outlook.com
 ([fe80::35af:2a57:ade8:101f]) by BYAPR11MB3174.namprd11.prod.outlook.com
 ([fe80::35af:2a57:ade8:101f%4]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 23:49:14 +0000
From:   Ugur Usug <Ugur.Usug@maximintegrated.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH 1/2] hwmon (pmbus/max20730): add max20710 support
Thread-Topic: [PATCH 1/2] hwmon (pmbus/max20730): add max20710 support
Thread-Index: AdZDbqwQY4xT22FzTQ+pAK2xvQl7MQ==
Date:   Mon, 15 Jun 2020 23:49:14 +0000
Message-ID: <BYAPR11MB317423C13909AE6F1913BBD7FD9C0@BYAPR11MB3174.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none
 header.from=maximintegrated.com;
x-originating-ip: [159.146.48.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a047ad79-735d-4874-e42b-08d81186b5fd
x-ms-traffictypediagnostic: BY5PR11MB4039:
x-microsoft-antispam-prvs: <BY5PR11MB403908531EE4DDFC28043A7FFD9C0@BY5PR11MB4039.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qsW36hOxkMMG/qA/kd0d0ChxTFeY+lO/FRgjq+2SJRbpdyYgda9hkrO6E5wm4Ct6wOa6hxFDT8uhQ3KFvs48bMR1RJCjfFoKuEG/PESn5dRjmkE9iNAJOaGYBzoROhl0OEJcYwukRdRYtJqYIUw/HZKdFP6za2zGSfl6+QwOksi0m0t+PwrTVMRnI1ViOGD/RQ+PlaD0/DrRvb3FWGuDwjUSwdB8PGP+RAbSBZCkKreS9nzolBaZPft+wuK2/e0JjL2W9YE+27GWa0a0GziBtfzmkaixmfH5elM6TDxb4ZA9q4+lSRkHQi/TSHTnUkkSohaVCmy4CyK9jEAO5+tvmt158BXmCrw6puZR25NVDzm+xfWnVEcV8E3OvVQL3ASerE+52bWMyI6jY5ajvTA1Og==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3174.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(55016002)(33656002)(86362001)(9686003)(6916009)(478600001)(186003)(316002)(26005)(4326008)(6506007)(5660300002)(66946007)(2906002)(8676002)(71200400001)(83380400001)(76116006)(966005)(7696005)(54906003)(66446008)(52536014)(64756008)(8936002)(66556008)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: OdtwA5ctwM8eZI+gKT1WyZmcf8yTclVejbpDNgGc5XaCFXvOJvrkEbNQPNqIL3Ti7IZoby/rYOMf5OcdRwWRJh6MV5LiDtM5HHzWwhCFMF3pfO3tbC6pQlS2MdvfqrEalc4pYRkR1KWwIhU3m3hBxg+abY5awPLrmWMVoYW5aJvioPkaZ7KkyDMuF8ZE9FECtY/pVDrniBuW9C+LB5aS0VKEAUecRUApGT7iLI7/AMRBzRWbhymxEH1vd5AvPeZerQY93cjJrMo5tKpnmBo+cMGdEYgrkzElVzWhXRWhWSEMZiZxaqHF0squ7vxzMHvjTEfqtP8v6SgO/OjgeBciL4n+0jACnc8e4xDDC8ELaGSZwF97E3due+p7/O5zXuhhgGXNuHct8yJoifaJCYtXKE3G6bHo9Q7QVLWh7b3Sro86yqpVRhYoAYyoD55aHe4eIfRUox6s7oQVSTtaXbjnQ74LR/urJbH80/9y7kRWvOZ9wfHm/B9IErJPeifosdsV
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a047ad79-735d-4874-e42b-08d81186b5fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 23:49:14.8880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z1vmYbkhsxHBOQgulnxdx0DAS+3L81BY1b4P9SGYbO+pbp+lgk05tLZkXi34yNabmlPoOqAlbdWmfrhYevPdBr2DiIo6Mnhrpb7Pp8rOKsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4039
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

add support for max20710 into the existing max20730 driver.

Signed-off-by: Ugur Usug <ugur.usug@maximintegrated.com>
---
 Documentation/hwmon/max20730.rst | 10 ++++++-
 drivers/hwmon/pmbus/Kconfig      |  4 +--
 drivers/hwmon/pmbus/max20730.c   | 57 ++++++++++++++++++++++++++++++++++--=
----
 3 files changed, 60 insertions(+), 11 deletions(-)

diff --git a/Documentation/hwmon/max20730.rst b/Documentation/hwmon/max2073=
0.rst
index cea7ae5..cb0c95b 100644
--- a/Documentation/hwmon/max20730.rst
+++ b/Documentation/hwmon/max20730.rst
@@ -5,6 +5,14 @@ Kernel driver max20730
=20
 Supported chips:
=20
+  * Maxim MAX20710
+
+    Prefix: 'max20710'
+
+    Addresses scanned: -
+
+    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX20710.pdf
+
   * Maxim MAX20730
=20
     Prefix: 'max20730'
@@ -35,7 +43,7 @@ Author: Guenter Roeck <linux@roeck-us.net>
 Description
 -----------
=20
-This driver implements support for Maxim MAX20730, MAX20734, and MAX20743
+This driver implements support for Maxim MAX20710, MAX20730, MAX20734, and=
 MAX20743
 Integrated, Step-Down Switching Regulators with PMBus support.
=20
 The driver is a client driver to the core PMBus driver.
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index a337195..3ad97fd 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -156,10 +156,10 @@ config SENSORS_MAX16601
 	  be called max16601.
=20
 config SENSORS_MAX20730
-	tristate "Maxim MAX20730, MAX20734, MAX20743"
+	tristate "Maxim MAX20710, MAX20730, MAX20734, MAX20743"
 	help
 	  If you say yes here you get hardware monitoring support for Maxim
-	  MAX20730, MAX20734, and MAX20743.
+	  MAX20710, MAX20730, MAX20734, and MAX20743.
=20
 	  This driver can also be built as a module. If so, the module will
 	  be called max20730.
diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.=
c
index c0bb054..3ddc19b 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Driver for MAX20730, MAX20734, and MAX20743 Integrated, Step-Down
- * Switching Regulators
+ * Driver for MAX20710, MAX20730, MAX20734, and MAX20743 Integrated,=20
+ * Step-Down Switching Regulators
  *
  * Copyright 2019 Google LLC.
+ * Copyright 2020 Maxim Integrated
  */
=20
 #include <linux/bits.h>
@@ -19,6 +20,7 @@
 #include "pmbus.h"
=20
 enum chips {
+	max20710,
 	max20730,
 	max20734,
 	max20743
@@ -80,6 +82,7 @@ static long direct_to_val(u16 w, enum pmbus_sensor_classe=
s class,
 }
=20
 static u32 max_current[][5] =3D {
+	[max20710] =3D { 6200, 8000, 9700, 11600 },
 	[max20730] =3D { 13000, 16600, 20100, 23600 },
 	[max20734] =3D { 21000, 27000, 32000, 38000 },
 	[max20743] =3D { 18900, 24100, 29200, 34100 },
@@ -164,6 +167,35 @@ static int max20730_write_word_data(struct i2c_client =
*client, int page,
 }
=20
 static const struct pmbus_driver_info max20730_info[] =3D {
+	[max20710] =3D {
+		.pages =3D 1,
+		.read_word_data =3D max20730_read_word_data,
+		.write_word_data =3D max20730_write_word_data,
+
+		/* Source : Maxim AN6140 and AN6042 */
+		.format[PSC_TEMPERATURE] =3D direct,
+		.m[PSC_TEMPERATURE] =3D 21,
+		.b[PSC_TEMPERATURE] =3D 5887,
+		.R[PSC_TEMPERATURE] =3D -1,
+
+		.format[PSC_VOLTAGE_IN] =3D direct,
+		.m[PSC_VOLTAGE_IN] =3D 3609,
+		.b[PSC_VOLTAGE_IN] =3D 0,
+		.R[PSC_VOLTAGE_IN] =3D -2,
+
+		.format[PSC_CURRENT_OUT] =3D direct,
+		.m[PSC_CURRENT_OUT] =3D 153,
+		.b[PSC_CURRENT_OUT] =3D 4976,
+		.R[PSC_CURRENT_OUT] =3D -1,
+
+		.format[PSC_VOLTAGE_OUT] =3D linear,
+
+		.func[0] =3D PMBUS_HAVE_VIN |
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+			PMBUS_HAVE_STATUS_INPUT,
+	},
 	[max20730] =3D {
 		.pages =3D 1,
 		.read_word_data =3D max20730_read_word_data,
@@ -200,7 +232,8 @@ static const struct pmbus_driver_info max20730_info[] =
=3D {
 		.func[0] =3D PMBUS_HAVE_VIN |
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
-			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+			PMBUS_HAVE_STATUS_INPUT,
 	},
 	[max20734] =3D {
 		.pages =3D 1,
@@ -228,7 +261,8 @@ static const struct pmbus_driver_info max20730_info[] =
=3D {
 		.func[0] =3D PMBUS_HAVE_VIN |
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
-			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+			PMBUS_HAVE_STATUS_INPUT,
 	},
 	[max20743] =3D {
 		.pages =3D 1,
@@ -256,7 +290,8 @@ static const struct pmbus_driver_info max20730_info[] =
=3D {
 		.func[0] =3D PMBUS_HAVE_VIN |
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
-			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+			PMBUS_HAVE_STATUS_INPUT,
 	},
 };
=20
@@ -274,7 +309,7 @@ static int max20730_probe(struct i2c_client *client,
 				     I2C_FUNC_SMBUS_READ_WORD_DATA |
 				     I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
-
+=09
 	ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
@@ -335,10 +370,15 @@ static int max20730_probe(struct i2c_client *client,
 		return ret;
 	data->mfr_devset1 =3D ret;
=20
-	return pmbus_do_probe(client, id, &data->info);
+	ret =3D pmbus_do_probe(client, id, &data->info);
+	if (ret < 0)
+		return ret;
+=09
+	return 0;
 }
=20
 static const struct i2c_device_id max20730_id[] =3D {
+	{ "max20710", max20710 },
 	{ "max20730", max20730 },
 	{ "max20734", max20734 },
 	{ "max20743", max20743 },
@@ -348,6 +388,7 @@ static const struct i2c_device_id max20730_id[] =3D {
 MODULE_DEVICE_TABLE(i2c, max20730_id);
=20
 static const struct of_device_id max20730_of_match[] =3D {
+	{ .compatible =3D "maxim,max20710", .data =3D (void *)max20710 },
 	{ .compatible =3D "maxim,max20730", .data =3D (void *)max20730 },
 	{ .compatible =3D "maxim,max20734", .data =3D (void *)max20734 },
 	{ .compatible =3D "maxim,max20743", .data =3D (void *)max20743 },
@@ -369,5 +410,5 @@ static struct i2c_driver max20730_driver =3D {
 module_i2c_driver(max20730_driver);
=20
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
-MODULE_DESCRIPTION("PMBus driver for Maxim MAX20730 / MAX20734 / MAX20743"=
);
+MODULE_DESCRIPTION("PMBus driver for Maxim MAX20710 / MAX20730 / MAX20734 =
/ MAX20743");
 MODULE_LICENSE("GPL");
--=20
2.7.4
