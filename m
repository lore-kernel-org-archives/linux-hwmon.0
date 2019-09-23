Return-Path: <SRS0=LAd6=XS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C10C4CEC4
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Sep 2019 19:51:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FCF820820
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Sep 2019 19:51:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="qQgSdzeY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502448AbfIWTvd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Sep 2019 15:51:33 -0400
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:29416 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726777AbfIWTvd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Sep 2019 15:51:33 -0400
X-Greylist: delayed 1298 seconds by postgrey-1.27 at vger.kernel.org; Mon, 23 Sep 2019 15:51:31 EDT
Received: from pps.filterd (m0118791.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8NJFqMt028816
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Sep 2019 15:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps-02182019;
 bh=7PXDvLWQ06HAyEEJJN/VTTpOLQ/yk8VQrgyFOugwMGw=;
 b=qQgSdzeYsqRkwYjO6/8nTcKMTQ+LqDNKQN1F7vDtVssBlVIpoLC1yMjoDxNDAlIe2ZvX
 ECBMniHFta7tuK6nc0j1cistTnjldQZJaPeLZfz34KhUJgtzkFa4fq9TDITETsv+IhjZ
 jHh4ypxqU5IqLAncTPZxAF8jYldU9sEp1LuFaa/x2GJolokLDKE4jEXjmap1VNSerLIa
 S/NGyI/hJbQS5+upETtfnNBnlWFroAAbeQvsBwz7Q+SMiR+y8pQbmQYaMhNkBlkZRyzh
 TS5Eb3FYed5Ou0eWmTagaEkYYJ5MDX3luQDMwhYJhBhs83hzBk89d7kzKvYBHSNLpSWh 7g== 
Received: from nam01-bn3-obe.outbound.protection.outlook.com (mail-bn3nam01lp2053.outbound.protection.outlook.com [104.47.33.53])
        by mx0a-002ab301.pphosted.com with ESMTP id 2v5gh79t6u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Sep 2019 15:29:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBvpOeBbPfOPKwubOrioNYjJx9TGM7R8somfJIx0bYGrYIn4kv1RG8dkOT6ILXMixrb+ceB4XgCQP3GamAX2VhROURlG5J4oN1zGCsCBmE6r9j43u66m/EAdRzDAQcE6rVnyzbxKSBNyXtuYtjr5wN4ZYwyFaD8vF93zwT3mGp1IBGChBFGbnKHJEY8dDfZgqmOzRPp7xnqszdHwIU7fH5/CFJurBk9604A5b6vdDMRb62K/VIsKKYC66Xz0YQq2ghTbdLIAXk6oIACl8YKq0rwR9PnaJaGVG2hLWDHWjfEYPw8cLEUdnX78bpznWFXiUQgZspQWUGPWJ8uaQMCocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PXDvLWQ06HAyEEJJN/VTTpOLQ/yk8VQrgyFOugwMGw=;
 b=G2gWsVTtJzJpHiDZ9Be2Uy3BfK9gl8n3Zb7D78RQ3+v5HRqwAJq2xvyuqP7B3A95eQqV33l29t8P5VnXrxQLhTiO3sM7Azb4p4h1GixbyljcvIji9fmSrNADD4TLBvvohS8iE91b4aSxLhX9YEgrkkOtmwtsQs7VmOO+H6tJazjyeA9VkRI1h7kzUO8bk+F6myh0m1mNxydo8deVsmpoZiES+GXzrj+Tz1lIRauWf7x7eUWxnv/VDEDabDjvfFGL+rBq8tyoaFUpRYeYCJqsJfAjxqUfxTi3BI4isQo4/XrWdDc8i7BGH0K8HIJNeyn/d2MKFLyYS4v5G3QGPxeg7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4547.prod.exchangelabs.com (20.177.241.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Mon, 23 Sep 2019 19:29:49 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5%3]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 19:29:48 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH] hwmon: Add driver for Texas Instruments TMP512/513 sensor
 chips
Thread-Topic: [PATCH] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Index: AdVyRQx+X+FbDMv5TmWYjnmYIlTKDw==
Date:   Mon, 23 Sep 2019 19:29:48 +0000
Message-ID: <BL0PR01MB4835F78BC92478EDDCB32F9195850@BL0PR01MB4835.prod.exchangelabs.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc0e1a65-efda-43ef-e726-08d7405c6612
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:BL0PR01MB4547;
x-ms-traffictypediagnostic: BL0PR01MB4547:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <BL0PR01MB454703185AEC45AC6A8CA1C595850@BL0PR01MB4547.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(199004)(189003)(2906002)(3846002)(9686003)(6116002)(66476007)(6306002)(476003)(52536014)(81166006)(81156014)(2351001)(966005)(5660300002)(8936002)(486006)(64756008)(6436002)(5640700003)(66446008)(66946007)(30864003)(71200400001)(71190400001)(55016002)(8676002)(33656002)(86362001)(99286004)(6916009)(26005)(186003)(256004)(66556008)(14444005)(316002)(478600001)(102836004)(25786009)(7736002)(76116006)(74316002)(305945005)(2501003)(14454004)(6506007)(7696005)(66066001)(2004002)(559001)(579004)(569006);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4547;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VFacexuOJ1FrCU5KWAHRwAb3CViGCt6/mjIyapQT1yAZyFE6EkF1kGFqDvldjDqf6YlVuGwEap3nCUmUnZPgjUdGndvKEyt9AfAPyKtZkDiC7EUeMFYeXHVzhdDFryt0UqHdu3JW7bTKedrCfCS6AI+kk0cVg2TpDExrDWUJlWOVcQfOxiDUssePf5F9JyhF5MCmP7t64kJEhFhXGIcCWgu/5o8velQ9nhtNZP1zwJCytnaDOP5QPf8OLJQHBbmNv5mvN3cGu9jPCvES35Sats2/bQxFJIJ0UhJV4X8+updDNJg4qZeiG7dOzuM+zpwCB7ayNzKAkARl5azfDyP9p6qXhwJ5iLW0TrqQXVpLmktxMzQ5qKEw8GRNnO4EQrFaR0IsOrv5v3yukuGzCSqFneMZZslnnYmXokdYH95ZYMU=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0e1a65-efda-43ef-e726-08d7405c6612
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 19:29:48.6500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGL6Ebrr9GhG+XdUF7syZv1nx3yp7u8k6lFyTLqabETwG+e5duSBJUSD/1s/ty5l0Eq5HP6cLDb3LbLIl4GcVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4547
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 mlxscore=0
 clxscore=1011 adultscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909230164
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add driver for Texas Instruments TMP512/513 sensor chips.

TI's TMP512/513 are I2C/SMBus system monitor chips. These chips
monitor the supply voltage, supply current, power consumption and
provide one local and up to three (TMP513) remote temperature sensors.

It has been tested using a TI TMP513 development kit (TMP513EVM)

Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
---
 .../devicetree/bindings/hwmon/tmp513.txt      |  24 +
 Documentation/hwmon/tmp513.rst                | 118 +++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tmp513.c                        | 910 ++++++++++++++++++
 6 files changed, 1070 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/tmp513.txt
 create mode 100644 Documentation/hwmon/tmp513.rst
 create mode 100644 drivers/hwmon/tmp513.c

diff --git a/Documentation/devicetree/bindings/hwmon/tmp513.txt b/Documenta=
tion/devicetree/bindings/hwmon/tmp513.txt
new file mode 100644
index 000000000000..9f6498607736
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/tmp513.txt
@@ -0,0 +1,24 @@
+TMP513 system monitor sensor
+-------------------------
+
+Requires node properties:
+- compatible: one of
+		"ti,tmp512"
+		"ti,tmp513"
+- reg : the I2C address of the device. This is 0x5c, 0x5d, 0x5e, or 0x5f.
+- shunt-resistor-mohm : The shunt resistor value in mohm.
+
+Optional properties:
+- bus-voltage-range: 32V or 16V, default to 32V.
+- pga-gain: The gain value for the PGA function. This is 8, 4, 2 or 1. Def=
ault to 8.
+- max-expected-current-ma: Maximum current value that is expected. Default=
 to max value.
+
+Example:
+	tmp513@5c {
+		  compatible =3D "ti,tmp513";
+		  reg =3D <0x5C>;
+		  shunt-resistor-mohm =3D <330>;
+		  bus-voltage-range =3D <32>;
+		  pga-gain =3D <8>;
+		  max-expected-current-ma =3D <100>;
+	};
diff --git a/Documentation/hwmon/tmp513.rst b/Documentation/hwmon/tmp513.rs=
t
new file mode 100644
index 000000000000..adc99e79287b
--- /dev/null
+++ b/Documentation/hwmon/tmp513.rst
@@ -0,0 +1,118 @@
+Kernel driver tmp513
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Supported chips:
+
+  * Texas Instruments TMP512
+
+    Prefix: 'tmp512'
+
+    Datasheet: http://www.ti.com/lit/ds/symlink/tmp512.pdf
+
+  * Texas Instruments TMP513
+
+    Prefix: 'tmp513'
+
+    Datasheet: http://www.ti.com/lit/ds/symlink/tmp513.pdf
+
+Authors:
+
+	Eric Tremblay <etremblay@distech-controls.com>
+
+Description
+-----------
+
+This driver implements support for Texas Instruments TMP512, and TMP513
+temperature and power supply sensor chips. These chips implement one
+local and up to three (TMP513) temperature sensor. The chips also implemen=
t
+power supply monitoring such as shunt voltage, shunt current, bus voltage
+and power consumption.
+
+The temperatures are measured in degrees Celsius with a range of
+-40 to + 125 degress Celcius with a resolution of 0.0625 degree C.
+The nfactor of the diode can by configured on each channel and a
+global hysteresis value for the alarms can be set.
+
+The driver exports the temperature values via the following sysfs files:
+
+**temp[1-4]_input**
+
+**temp[1-4]_crit**
+
+**temp[1-4]_crit_alarm**
+
+**temp[1-4]_nfactor**
+
+**temp_hyst**
+
+The shunt voltage is measured in micro volts. There are four configurable
+range: 320mV, 160mV, 80mV and 40mV all of them with a resolution of 10 uV.
+The range depends on the pga gain specified in the device tree
+with "pga-gain" (default to 8). The range will be equal to pga gain
+multiply by 40mV.
+
+The driver exports the shunt voltage values via the following sysFs files:
+
+**in0_input**
+
+**in0_lcrit**
+
+**in0_lcrit_alarm**
+
+**in0_crit**
+
+**in0_crit_alarm**
+
+The bus voltage is measured in milli volts. There are two configuable
+range: 32V and 16V both with a resolution of 4mV. It can be configured in =
the
+device tree with "bus-voltage-range" (default to 32V);
+
+The driver exports the bus voltage values via the following sysFs files:
+
+**in0_input**
+
+**in0_lcrit**
+
+**in0_lcrit_alarm**
+
+**in0_crit**
+
+**in0_crit_alarm**
+
+The power and the currents range and resolution depends on the calibration
+register value. Those values are calculate by the hardware using those
+formula:
+
+Current =3D (ShuntVoltage * CalibrationRegister) / 4096
+Power   =3D (Current * BusVoltage) / 5000
+
+The driver exports the current and power values via the following sysFs fi=
les:
+
+**curr0_input**
+
+**power1_input**
+
+**power1_crit**
+
+**power1_crit_alarm**
+
+The calibration process follow the procedure of the datasheet (without ove=
rflow)
+and depend on the shunt resistor value, needed in the device tree "shunt-r=
esistor-mohm".
+It also depends on the pga gain and the maximum expected current, also spe=
cified from
+the device tree "max-expected-current-ma". If not specified it default to =
the maximum
+possible current depending on the pga gain. The shunt resistor value and t=
he device
+address are the only mandatory parameters needed in the device tree.
+
+The calibration value can be set from the sysFs file:
+
+**shunt_calibration**
+
+The drivers also export some register raw value:
+
+**shunt_config**
+
+**temp_config**
+
+**status**
+
+**smbus_alart**
diff --git a/MAINTAINERS b/MAINTAINERS
index a400af0501c9..2b46adb14ced 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16347,6 +16347,13 @@ S:	Maintained
 F:	Documentation/hwmon/tmp401.rst
 F:	drivers/hwmon/tmp401.c
=20
+TMP513 HARDWARE MONITOR DRIVER
+M:	Eric Tremblay <etremblay@distech-controls.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/tmp513.rst
+F:	drivers/hwmon/tmp513.c
+
 TMPFS (SHMEM FILESYSTEM)
 M:	Hugh Dickins <hughd@google.com>
 L:	linux-mm@kvack.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 13a6b4afb4b3..926e3c98dbdf 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1709,6 +1709,16 @@ config SENSORS_TMP421
 	  This driver can also be built as a module. If so, the module
 	  will be called tmp421.
=20
+config SENSORS_TMP513
+	tristate "Texas Instruments TMP513 and compatibles"
+	depends on I2C
+	help
+	  If you say yes here you get support for Texas Instruments TMP512,
+	  and TMP513 temperature and power supply sensor chips.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called tmp513.
+
 config SENSORS_VEXPRESS
 	tristate "Versatile Express"
 	depends on VEXPRESS_CONFIG
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 40c036ea45e6..762642291914 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -166,6 +166,7 @@ obj-$(CONFIG_SENSORS_TMP103)	+=3D tmp103.o
 obj-$(CONFIG_SENSORS_TMP108)	+=3D tmp108.o
 obj-$(CONFIG_SENSORS_TMP401)	+=3D tmp401.o
 obj-$(CONFIG_SENSORS_TMP421)	+=3D tmp421.o
+obj-$(CONFIG_SENSORS_TMP513)	+=3D tmp513.o
 obj-$(CONFIG_SENSORS_VEXPRESS)	+=3D vexpress-hwmon.o
 obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+=3D via-cputemp.o
 obj-$(CONFIG_SENSORS_VIA686A)	+=3D via686a.o
diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
new file mode 100644
index 000000000000..44b8f15316f6
--- /dev/null
+++ b/drivers/hwmon/tmp513.c
@@ -0,0 +1,910 @@
+/*
+ * Driver for Texas Instruments TMP512, TMP513 power monitor chips
+ *
+ * TMP513:
+ * Thermal/Power Management with Triple Remote and
+ * Local Temperature Sensor and Current Shunt Monitor
+ * Datasheet: http://www.ti.com/lit/gpn/tmp513
+ *
+ * TMP512:
+ * Thermal/Power Management with Dual Remote
+ *	and Local Temperature Sensor and Current Shunt Monitor
+ * Datasheet: http://www.ti.com/lit/gpn/tmp512
+ *
+ * Copyright (C) 2019 Eric Tremblay <etremblay@distechcontrols.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/util_macros.h>
+
+// common register definition
+#define TMP51X_SHUNT_CONFIG		0x00
+#define TMP51X_TEMP_CONFIG		0x01
+#define TMP51X_STATUS			0x02
+#define TMP51X_SMBUS_ALERT		0x03
+#define TMP51X_SHUNT_VOLTAGE_RESULT	0x04
+#define TMP51X_BUS_VOLTAGE_RESULT	0x05
+#define TMP51X_POWER_RESULT		0x06
+#define TMP51X_SHUNT_CURRENT_RESULT	0x07
+#define TMP51X_LOCAL_TEMP_RESULT	0x08
+#define TMP51X_REMOTE_TEMP_RESULT_1	0x09
+#define TMP51X_REMOTE_TEMP_RESULT_2	0x0A
+#define TMP51X_SHUNT_VOLTAGE_H_LIMIT	0x0C
+#define TMP51X_SHUNT_VOLTAGE_L_LIMIT	0x0D
+#define TMP51X_BUS_VOLTAGE_H_LIMIT	0x0E
+#define TMP51X_BUS_VOLTAGE_L_LIMIT	0x0F
+#define TMP51X_POWER_LIMIT		0x10
+#define TMP51X_LOCAL_TEMP_LIMIT		0x11
+#define TMP51X_REMOTE_TEMP_LIMIT_1	0x12
+#define TMP51X_REMOTE_TEMP_LIMIT_2	0x13
+#define TMP51X_SHUNT_CALIBRATION	0x15
+#define TMP51X_N_FACTOR_AND_HYST_1	0x16
+#define TMP51X_N_FACTOR_2		0x17
+#define TMP51X_MAN_ID_REG		0xFE
+#define TMP51X_DEVICE_ID_REG		0xFF
+
+// TMP513 specific register definition
+#define TMP513_REMOTE_TEMP_RESULT_3	0x0B
+#define TMP513_REMOTE_TEMP_LIMIT_3	0x14
+#define TMP513_N_FACTOR_3		0x18
+
+// common attrs, tmp513 attrs and NULL
+#define TMP51X_MAX_ATTRIBUTE_GROUPS	3
+#define TMP51X_MANUFACTURER_ID		0x55FF
+
+#define TMP512_DEVICE_ID		0x22FF
+#define TMP513_DEVICE_ID		0x23FF
+
+// Default config
+#define TMP51X_SHUNT_CONFIG_DEFAULT	0x399F
+#define TMP51X_TEMP_LIMIT_DEFAULT	0x2A80
+#define TMP51X_MAX_REGISTER_ADDR	0xFF
+
+#define TMP512_TEMP_CONFIG_DEFAULT	0xBF80
+#define TMP513_TEMP_CONFIG_DEFAULT	0xFF80
+
+// mask and shift
+#define CURRENT_SENSE_VOLTAGE_320_MASK	0x1800
+#define CURRENT_SENSE_VOLTAGE_160_MASK	0x1000
+#define CURRENT_SENSE_VOLTAGE_80_MASK	0x0800
+#define CURRENT_SENSE_VOLTAGE_40_MASK	0
+
+#define TMP51X_BUS_VOLTAGE_MASK		0x2000
+#define TMP51X_PGA_MASK			0x1800
+#define TMP51X_N_FACTOR_MASK		0xFF00
+#define TMP51X_HYST_MASK		0x00FF
+
+#define TMP51X_BUS_VOLTAGE_SHIFT	3
+#define TMP51X_TEMP_SHIFT		3
+
+// Alarms
+#define TMP51X_SHUNT_VOLTAGE_H_LIMIT_POS	15
+#define TMP51X_SHUNT_VOLTAGE_L_LIMIT_POS	14
+#define TMP51X_BUS_VOLTAGE_H_LIMIT_POS		13
+#define TMP51X_BUS_VOLTAGE_L_LIMIT_POS		12
+#define TMP51X_POWER_LIMIT_POS			11
+#define TMP51X_LOCAL_TEMP_LIMIT_POS		10
+#define TMP51X_REMOTE_TEMP_LIMIT_1_POS		9
+#define TMP51X_REMOTE_TEMP_LIMIT_2_POS		8
+#define TMP513_REMOTE_TEMP_LIMIT_3_POS		7
+
+// Value type for register with more than one value
+#define TMP51X_N_FACTOR_ELEM		0
+#define TMP51X_HYST_ELEM		1
+
+static struct regmap_config tmp51x_regmap_config =3D {
+	.reg_bits =3D 8,
+	.val_bits =3D 16,
+};
+
+enum tmp51x_ids {
+	tmp512, tmp513
+};
+
+struct tmp51x_config {
+	int shunt_config;
+	int pga_shift;
+	int pga_gain;
+	int rshunt;
+	int max_curr_ma;
+
+	int temp_config;
+
+	int curr_lsb;
+	int pwr_lsb;
+	int registers;
+};
+
+struct tmp51x_data {
+	struct tmp51x_config *config;
+
+	struct regmap *regmap;
+	struct mutex config_lock;
+	const struct attribute_group *groups[TMP51X_MAX_ATTRIBUTE_GROUPS];
+};
+
+static struct tmp51x_config tmp51x_config[] =3D {
+	[tmp512] =3D {
+		.shunt_config =3D TMP51X_SHUNT_CONFIG_DEFAULT,
+		.pga_shift =3D 1,
+		.pga_gain =3D 8,
+		.temp_config =3D TMP512_TEMP_CONFIG_DEFAULT,
+		.registers =3D TMP51X_MAX_REGISTER_ADDR,
+	},
+	[tmp513] =3D {
+		.shunt_config =3D TMP51X_SHUNT_CONFIG_DEFAULT,
+		.pga_shift =3D 1,
+		.pga_gain =3D 8,
+		.temp_config =3D TMP513_TEMP_CONFIG_DEFAULT,
+		.registers =3D TMP51X_MAX_REGISTER_ADDR,
+	},
+};
+
+static int tmp51x_get_value(struct tmp51x_data *data, u8 reg,
+			    unsigned int regval)
+{
+	int val;
+
+	switch (reg) {
+	case TMP51X_STATUS:
+	case TMP51X_SHUNT_CONFIG:
+	case TMP51X_TEMP_CONFIG:
+	case TMP51X_SMBUS_ALERT:
+	case TMP51X_SHUNT_CALIBRATION:
+		val =3D regval;
+		break;
+	case TMP51X_SHUNT_VOLTAGE_RESULT:
+	case TMP51X_SHUNT_VOLTAGE_H_LIMIT:
+	case TMP51X_SHUNT_VOLTAGE_L_LIMIT:
+		/* 2's compliment number shifted by one to four depending
+		 * on the pga gain setting.
+		 * 1lsb =3D 10uV
+		 */
+		val =3D sign_extend32(regval, 16 - data->config->pga_shift);
+		val =3D DIV_ROUND_CLOSEST(val, 100);
+		break;
+	case TMP51X_BUS_VOLTAGE_RESULT:
+	case TMP51X_BUS_VOLTAGE_H_LIMIT:
+	case TMP51X_BUS_VOLTAGE_L_LIMIT:
+		// 1lsb =3D 4uV
+		val =3D (regval >> TMP51X_BUS_VOLTAGE_SHIFT) * 4;
+		break;
+	case TMP51X_POWER_RESULT:
+	case TMP51X_POWER_LIMIT:
+		// Power =3D (current * BusVoltage) / 5000
+		val =3D regval * data->config->pwr_lsb;
+		break;
+	case TMP51X_SHUNT_CURRENT_RESULT:
+		// Current =3D (ShuntVoltage * CalibrationRegister) / 4096
+		val =3D sign_extend32(regval, 15) * data->config->curr_lsb;
+		break;
+	case TMP51X_LOCAL_TEMP_RESULT:
+	case TMP51X_REMOTE_TEMP_RESULT_1:
+	case TMP51X_REMOTE_TEMP_RESULT_2:
+	case TMP513_REMOTE_TEMP_RESULT_3:
+	case TMP51X_LOCAL_TEMP_LIMIT:
+	case TMP51X_REMOTE_TEMP_LIMIT_1:
+	case TMP51X_REMOTE_TEMP_LIMIT_2:
+	case TMP513_REMOTE_TEMP_LIMIT_3:
+		// 1lsb =3D 0.0625 degrees centigrade
+		val =3D DIV_ROUND_CLOSEST((regval >> TMP51X_TEMP_SHIFT) * 625,
+					10);
+		break;
+	default:
+		/* programmer goofed */
+		WARN_ON_ONCE(1);
+		val =3D 0;
+		break;
+	}
+
+	return val;
+}
+
+static int tmp51x_get_value_2(struct tmp51x_data *data, u8 reg, u8 elem,
+			      unsigned int regval)
+{
+	int val;
+
+	switch (reg) {
+	case TMP51X_N_FACTOR_AND_HYST_1:
+		if (elem =3D=3D TMP51X_N_FACTOR_ELEM) {
+			val =3D (regval & TMP51X_N_FACTOR_MASK) >> 8;
+		} else if (elem =3D=3D TMP51X_HYST_ELEM) {
+			val =3D (regval & TMP51X_HYST_MASK) * 500;
+		} else {
+			/* programmer goofed */
+			WARN_ON_ONCE(1);
+			val =3D 0;
+		}
+		break;
+	case TMP51X_STATUS:
+		switch (elem) {
+		case TMP51X_SHUNT_VOLTAGE_H_LIMIT:
+			val =3D (regval >> TMP51X_SHUNT_VOLTAGE_H_LIMIT_POS) & 1;
+			break;
+		case TMP51X_SHUNT_VOLTAGE_L_LIMIT:
+			val =3D (regval >> TMP51X_SHUNT_VOLTAGE_L_LIMIT_POS) & 1;
+			break;
+		case TMP51X_BUS_VOLTAGE_H_LIMIT:
+			val =3D (regval >> TMP51X_BUS_VOLTAGE_H_LIMIT_POS) & 1;
+			break;
+		case TMP51X_BUS_VOLTAGE_L_LIMIT:
+			val =3D (regval >> TMP51X_BUS_VOLTAGE_L_LIMIT_POS) & 1;
+			break;
+		case TMP51X_POWER_LIMIT:
+			val =3D (regval >> TMP51X_POWER_LIMIT_POS) & 1;
+			break;
+		case TMP51X_LOCAL_TEMP_LIMIT:
+			val =3D (regval >> TMP51X_LOCAL_TEMP_LIMIT_POS) & 1;
+			break;
+		case TMP51X_REMOTE_TEMP_LIMIT_1:
+			val =3D (regval >> TMP51X_REMOTE_TEMP_LIMIT_1_POS) & 1;
+			break;
+		case TMP51X_REMOTE_TEMP_LIMIT_2:
+			val =3D (regval >> TMP51X_REMOTE_TEMP_LIMIT_2_POS) & 1;
+			break;
+		case TMP513_REMOTE_TEMP_LIMIT_3:
+			val =3D (regval >> TMP513_REMOTE_TEMP_LIMIT_3_POS) & 1;
+			break;
+		default:
+			/* programmer goofed */
+			WARN_ON_ONCE(1);
+			val =3D 0;
+			break;
+		}
+		break;
+	default:
+		/* programmer goofed */
+		WARN_ON_ONCE(1);
+		val =3D 0;
+		break;
+	}
+
+	return val;
+}
+
+static int tmp51x_set_value(struct device *dev, u8 reg, long val)
+{
+	struct tmp51x_data *data =3D dev_get_drvdata(dev);
+	int regval, ret;
+
+	mutex_lock(&data->config_lock);
+
+	switch (reg) {
+	case TMP51X_SHUNT_CONFIG:
+	case TMP51X_TEMP_CONFIG:
+	case TMP51X_SMBUS_ALERT:
+		regval =3D val;
+		break;
+	case TMP51X_SHUNT_VOLTAGE_H_LIMIT:
+	case TMP51X_SHUNT_VOLTAGE_L_LIMIT:
+		// User must make sure to be between the configured range
+		// 1lsb =3D 10uv
+		regval =3D val * 100;
+		break;
+	case TMP51X_BUS_VOLTAGE_H_LIMIT:
+	case TMP51X_BUS_VOLTAGE_L_LIMIT:
+		// 1lsb =3D 4uv
+		regval =3D DIV_ROUND_CLOSEST(val, 4) << TMP51X_BUS_VOLTAGE_SHIFT;
+		break;
+	case TMP51X_POWER_LIMIT:
+		regval =3D DIV_ROUND_CLOSEST(val, data->config->pwr_lsb);
+		break;
+	case TMP51X_LOCAL_TEMP_LIMIT:
+	case TMP51X_REMOTE_TEMP_LIMIT_1:
+	case TMP51X_REMOTE_TEMP_LIMIT_2:
+	case TMP513_REMOTE_TEMP_LIMIT_3:
+		// 1lsb =3D 0.0625 degrees centigrade
+		regval =3D DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TEMP_SHIFT;
+		break;
+	case TMP51X_SHUNT_CALIBRATION:
+		/* If calibration is adjust from user space,
+		 * lsb value for current and power need to adjusted
+		 */
+		data->config->curr_lsb =3D
+			DIV_ROUND_CLOSEST(40960000, val * data->config->rshunt);
+		data->config->pwr_lsb =3D 20 * data->config->curr_lsb;
+		regval =3D val;
+		break;
+	default:
+		/* programmer goofed */
+		WARN_ON_ONCE(1);
+		regval =3D 0;
+		break;
+	}
+
+	dev_info(dev, "write register %02X, val =3D 0x%04x\n", reg, regval);
+
+	ret =3D regmap_write(data->regmap, reg, regval);
+
+	mutex_unlock(&data->config_lock);
+
+	return ret;
+}
+
+static int tmp51x_set_value_2(struct device *dev, u8 reg, u8 elem, long va=
l)
+{
+	struct tmp51x_data *data =3D dev_get_drvdata(dev);
+	int regval, ret;
+	unsigned int mask;
+
+	mutex_lock(&data->config_lock);
+
+	switch (reg) {
+	case TMP51X_N_FACTOR_AND_HYST_1:
+		if (elem =3D=3D TMP51X_N_FACTOR_ELEM) {
+			mask =3D TMP51X_N_FACTOR_MASK;
+			regval =3D (val << 8) & mask;
+		} else if (elem =3D=3D TMP51X_HYST_ELEM) {
+			mask =3D TMP51X_HYST_MASK;
+			regval =3D DIV_ROUND_CLOSEST(val, 500) & mask;
+		} else {
+			/* programmer goofed */
+			WARN_ON_ONCE(1);
+			regval =3D 0;
+			mask =3D 0;
+		}
+		break;
+	default:
+		/* programmer goofed */
+		WARN_ON_ONCE(1);
+		regval =3D 0;
+		mask =3D 0;
+		break;
+	}
+
+	dev_info(dev, "update register 0x%02X, mask =3D 0x%04X, val =3D 0x%04x\n"=
,
+		 reg, mask, regval);
+
+	ret =3D regmap_update_bits(data->regmap, reg, mask, regval);
+
+	mutex_unlock(&data->config_lock);
+
+	return ret;
+}
+
+static int tmp51x_read_reg(struct device *dev, int reg, unsigned int *regv=
al)
+{
+	struct tmp51x_data *data =3D dev_get_drvdata(dev);
+	int ret;
+
+	//todo replace by dev_dbg
+	dev_info(dev, "Starting register %02X read\n", reg);
+
+	ret =3D regmap_read(data->regmap, reg, regval);
+	if (ret < 0)
+		return ret;
+
+	dev_info(dev, "read %02X, val =3D 0x%04x\n", reg, *regval);
+
+	return 0;
+}
+
+static ssize_t tmp51x_show_value(struct device *dev,
+				 struct device_attribute *da, char *buf)
+{
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
+	struct tmp51x_data *data =3D dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
+
+	err =3D tmp51x_read_reg(dev, attr->index, &regval);
+	if (err < 0)
+		return err;
+
+	return snprintf(buf, PAGE_SIZE, "%d\n",
+			tmp51x_get_value(data, attr->index, regval));
+}
+
+static ssize_t tmp51x_show_hex_value(struct device *dev,
+				     struct device_attribute *da, char *buf)
+{
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
+	struct tmp51x_data *data =3D dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
+
+	err =3D tmp51x_read_reg(dev, attr->index, &regval);
+	if (err < 0)
+		return err;
+
+	return snprintf(buf, PAGE_SIZE, "%04x\n",
+			tmp51x_get_value(data, attr->index, regval));
+}
+
+static ssize_t tmp51x_show_value_2(struct device *dev,
+				   struct device_attribute *da, char *buf)
+{
+	struct sensor_device_attribute_2 *attr =3D to_sensor_dev_attr_2(da);
+	struct tmp51x_data *data =3D dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
+
+	err =3D tmp51x_read_reg(dev, attr->index, &regval);
+	if (err < 0)
+		return err;
+
+	return snprintf(buf, PAGE_SIZE, "%d\n",
+			tmp51x_get_value_2(data, attr->index, attr->nr,
+					   regval));
+}
+
+static ssize_t tmp51x_store_value(struct device *dev,
+				  struct device_attribute *da,
+				  const char *buf, size_t count)
+{
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
+	long val;
+	int status;
+
+	status =3D kstrtol(buf, 10, &val);
+	if (status < 0)
+		return status;
+
+	status =3D tmp51x_set_value(dev, attr->index, val);
+	if (status < 0)
+		return status;
+
+	return count;
+}
+
+static ssize_t tmp51x_store_hex_value(struct device *dev,
+				      struct device_attribute *da,
+				      const char *buf, size_t count)
+{
+	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
+	long val;
+	int status;
+
+	status =3D kstrtol(buf, 16, &val);
+	if (status < 0)
+		return status;
+
+	status =3D tmp51x_set_value(dev, attr->index, val);
+	if (status < 0)
+		return status;
+
+	return count;
+}
+
+static ssize_t tmp51x_store_value_2(struct device *dev,
+				    struct device_attribute *da,
+				    const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *attr =3D to_sensor_dev_attr_2(da);
+	long val;
+	int status;
+
+	status =3D kstrtol(buf, 10, &val);
+	if (status < 0)
+		return status;
+
+	status =3D tmp51x_set_value_2(dev, attr->index, attr->nr, val);
+	if (status < 0)
+		return status;
+
+	return count;
+}
+
+/* raw status register */
+static SENSOR_DEVICE_ATTR(status, 0444, tmp51x_show_hex_value, NULL,
+			  TMP51X_STATUS);
+
+/* raw shunt config register */
+static SENSOR_DEVICE_ATTR(shunt_config, 0644,
+			  tmp51x_show_hex_value, tmp51x_store_hex_value,
+			  TMP51X_SHUNT_CONFIG);
+
+/* raw temperature config register */
+static SENSOR_DEVICE_ATTR(temp_config, 0644, tmp51x_show_hex_value,
+			  tmp51x_store_hex_value, TMP51X_TEMP_CONFIG);
+
+/* raw smbus alert register */
+static SENSOR_DEVICE_ATTR(smbus_alert, 0644, tmp51x_show_hex_value,
+			  tmp51x_store_hex_value, TMP51X_SMBUS_ALERT);
+
+/* shunt voltage result */
+static SENSOR_DEVICE_ATTR(in0_input, 0444, tmp51x_show_value, NULL,
+			  TMP51X_SHUNT_VOLTAGE_RESULT);
+
+/* bus voltage result */
+static SENSOR_DEVICE_ATTR(in1_input, 0444, tmp51x_show_value, NULL,
+			  TMP51X_BUS_VOLTAGE_RESULT);
+
+/* power result */
+static SENSOR_DEVICE_ATTR(power1_input, 0444, tmp51x_show_value, NULL,
+			  TMP51X_POWER_RESULT);
+
+/* shunt current result */
+static SENSOR_DEVICE_ATTR(curr1_input, 0444, tmp51x_show_value, NULL,
+			  TMP51X_SHUNT_CURRENT_RESULT);
+
+/* local temperature result */
+static SENSOR_DEVICE_ATTR(temp1_input, 0444, tmp51x_show_value, NULL,
+			  TMP51X_LOCAL_TEMP_RESULT);
+
+/* Remote temperature 1 result */
+static SENSOR_DEVICE_ATTR(temp2_input, 0444, tmp51x_show_value, NULL,
+			  TMP51X_REMOTE_TEMP_RESULT_1);
+
+/* Remote temperature 2 result */
+static SENSOR_DEVICE_ATTR(temp3_input, 0444, tmp51x_show_value, NULL,
+			  TMP51X_REMOTE_TEMP_RESULT_2);
+
+/* Remote temperature 3 result */
+static SENSOR_DEVICE_ATTR(temp4_input, 0444, tmp51x_show_value, NULL,
+			  TMP513_REMOTE_TEMP_RESULT_3);
+
+/* Shunt voltage positive limit */
+static SENSOR_DEVICE_ATTR(in0_crit, 0644, tmp51x_show_value,
+			  tmp51x_store_value, TMP51X_SHUNT_VOLTAGE_H_LIMIT);
+
+static SENSOR_DEVICE_ATTR_2(in0_crit_alarm, 0444, tmp51x_show_value_2, NUL=
L,
+			    TMP51X_SHUNT_VOLTAGE_H_LIMIT, TMP51X_STATUS);
+
+/* Shunt voltage negative limit */
+static SENSOR_DEVICE_ATTR(in0_lcrit, 0644, tmp51x_show_value,
+			  tmp51x_store_value, TMP51X_SHUNT_VOLTAGE_L_LIMIT);
+
+static SENSOR_DEVICE_ATTR_2(in0_lcrit_alarm, 0444, tmp51x_show_value_2, NU=
LL,
+			  TMP51X_SHUNT_VOLTAGE_L_LIMIT, TMP51X_STATUS);
+
+/* Bus voltage positive limit */
+static SENSOR_DEVICE_ATTR(in1_crit, 0644, tmp51x_show_value,
+			  tmp51x_store_value, TMP51X_BUS_VOLTAGE_H_LIMIT);
+
+static SENSOR_DEVICE_ATTR_2(in1_crit_alarm, 0444, tmp51x_show_value_2, NUL=
L,
+			    TMP51X_BUS_VOLTAGE_H_LIMIT, TMP51X_STATUS);
+
+/* Bus voltage negative limit */
+static SENSOR_DEVICE_ATTR(in1_lcrit, 0644, tmp51x_show_value,
+			  tmp51x_store_value, TMP51X_BUS_VOLTAGE_L_LIMIT);
+
+static SENSOR_DEVICE_ATTR_2(in1_lcrit_alarm, 0444, tmp51x_show_value_2, NU=
LL,
+			    TMP51X_BUS_VOLTAGE_L_LIMIT, TMP51X_STATUS);
+
+/* Power limit */
+static SENSOR_DEVICE_ATTR(power1_crit, 0644, tmp51x_show_value,
+			  tmp51x_store_value, TMP51X_POWER_LIMIT);
+
+static SENSOR_DEVICE_ATTR_2(power1_crit_alarm, 0444, tmp51x_show_value_2, =
NULL,
+			    TMP51X_POWER_LIMIT, TMP51X_STATUS);
+
+/* Local temperature limit */
+static SENSOR_DEVICE_ATTR(temp1_crit, 0644, tmp51x_show_value,
+			  tmp51x_store_value, TMP51X_LOCAL_TEMP_LIMIT);
+
+static SENSOR_DEVICE_ATTR_2(temp1_crit_alarm, 0444, tmp51x_show_value_2, N=
ULL,
+			    TMP51X_LOCAL_TEMP_LIMIT, TMP51X_STATUS);
+
+/* Remote temperature 1 limit */
+static SENSOR_DEVICE_ATTR(temp2_crit, 0644, tmp51x_show_value,
+			  tmp51x_store_value, TMP51X_REMOTE_TEMP_LIMIT_1);
+
+static SENSOR_DEVICE_ATTR_2(temp2_crit_alarm, 0444, tmp51x_show_value_2, N=
ULL,
+			    TMP51X_REMOTE_TEMP_LIMIT_1, TMP51X_STATUS);
+
+/* Remote temperature 2 limit */
+static SENSOR_DEVICE_ATTR(temp3_crit, 0644, tmp51x_show_value,
+			  tmp51x_store_value, TMP51X_REMOTE_TEMP_LIMIT_2);
+
+static SENSOR_DEVICE_ATTR_2(temp3_crit_alarm, 0444, tmp51x_show_value_2, N=
ULL,
+			    TMP51X_REMOTE_TEMP_LIMIT_2, TMP51X_STATUS);
+
+/* Remote temperature 3 limit */
+static SENSOR_DEVICE_ATTR(temp4_crit, 0644, tmp51x_show_value,
+			  tmp51x_store_value, TMP513_REMOTE_TEMP_LIMIT_3);
+
+static SENSOR_DEVICE_ATTR_2(temp4_crit_alarm, 0444, tmp51x_show_value_2, N=
ULL,
+			    TMP513_REMOTE_TEMP_LIMIT_3, TMP51X_STATUS);
+
+/* Calibration */
+static SENSOR_DEVICE_ATTR(shunt_calibration, 0644, tmp51x_show_value,
+			  tmp51x_store_value, TMP51X_SHUNT_CALIBRATION);
+
+/* nfactor 1 */
+static SENSOR_DEVICE_ATTR_2(temp2_nfactor, 0644, tmp51x_show_value_2,
+			    tmp51x_store_value_2, TMP51X_N_FACTOR_ELEM,
+			    TMP51X_N_FACTOR_AND_HYST_1);
+
+/* hyst 1 */
+static SENSOR_DEVICE_ATTR_2(temp_hyst, 0644, tmp51x_show_value_2,
+			    tmp51x_store_value_2, TMP51X_HYST_ELEM,
+			    TMP51X_N_FACTOR_AND_HYST_1);
+
+/* nfactor 2 */
+static SENSOR_DEVICE_ATTR(temp3_nfactor, 0644, tmp51x_show_value,
+			  tmp51x_store_value, TMP51X_N_FACTOR_2);
+
+/* nfactor 3 */
+static SENSOR_DEVICE_ATTR(temp4_nfactor, 0644, tmp51x_show_value,
+			  tmp51x_store_value, TMP513_N_FACTOR_3);
+
+
+/* pointers to created device attributes */
+static struct attribute *tmp51x_attrs[] =3D {
+	&sensor_dev_attr_status.dev_attr.attr,
+	&sensor_dev_attr_shunt_config.dev_attr.attr,
+	&sensor_dev_attr_temp_config.dev_attr.attr,
+	&sensor_dev_attr_smbus_alert.dev_attr.attr,
+	&sensor_dev_attr_in0_input.dev_attr.attr,
+	&sensor_dev_attr_in1_input.dev_attr.attr,
+	&sensor_dev_attr_power1_input.dev_attr.attr,
+	&sensor_dev_attr_curr1_input.dev_attr.attr,
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_input.dev_attr.attr,
+	&sensor_dev_attr_temp3_input.dev_attr.attr,
+	&sensor_dev_attr_in0_crit.dev_attr.attr,
+	&sensor_dev_attr_in0_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_in0_lcrit.dev_attr.attr,
+	&sensor_dev_attr_in0_lcrit_alarm.dev_attr.attr,
+	&sensor_dev_attr_in1_crit.dev_attr.attr,
+	&sensor_dev_attr_in1_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_in1_lcrit.dev_attr.attr,
+	&sensor_dev_attr_in1_lcrit_alarm.dev_attr.attr,
+	&sensor_dev_attr_power1_crit.dev_attr.attr,
+	&sensor_dev_attr_power1_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp1_crit.dev_attr.attr,
+	&sensor_dev_attr_temp1_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit.dev_attr.attr,
+	&sensor_dev_attr_temp2_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp3_crit.dev_attr.attr,
+	&sensor_dev_attr_temp3_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_shunt_calibration.dev_attr.attr,
+	&sensor_dev_attr_temp2_nfactor.dev_attr.attr,
+	&sensor_dev_attr_temp3_nfactor.dev_attr.attr,
+	&sensor_dev_attr_temp_hyst.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group tmp51x_group =3D {
+	.attrs =3D tmp51x_attrs,
+};
+
+static struct attribute *tmp513_attrs[] =3D {
+	&sensor_dev_attr_temp4_input.dev_attr.attr,
+	&sensor_dev_attr_temp4_crit.dev_attr.attr,
+	&sensor_dev_attr_temp4_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp4_nfactor.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group tmp513_group =3D {
+	.attrs =3D tmp513_attrs,
+};
+
+static int tmp51x_vbus_max_to_reg(struct tmp51x_config *config, u32 vbus_m=
ax)
+{
+	if (vbus_max =3D=3D 32)
+		config->shunt_config |=3D TMP51X_BUS_VOLTAGE_MASK;
+	else if (vbus_max =3D=3D 16)
+		config->shunt_config &=3D ~TMP51X_BUS_VOLTAGE_MASK;
+	else
+		return -EINVAL;
+	return 0;
+}
+
+static int tmp51x_pga_gain_to_reg(struct tmp51x_config *config, u32 pga_ga=
in)
+{
+	config->shunt_config &=3D ~TMP51X_PGA_MASK;
+	config->pga_gain =3D pga_gain;
+
+	/* The shift depend on the gain 8=3D4, 4=3D3, 2=3D2, 1=3D1*/
+	config->pga_shift =3D 5 - ffs(pga_gain);
+
+	if (pga_gain =3D=3D 8)
+		config->shunt_config |=3D CURRENT_SENSE_VOLTAGE_320_MASK;
+	else if (pga_gain =3D=3D 4)
+		config->shunt_config |=3D CURRENT_SENSE_VOLTAGE_160_MASK;
+	else if (pga_gain =3D=3D 2)
+		config->shunt_config |=3D CURRENT_SENSE_VOLTAGE_80_MASK;
+	else if (pga_gain =3D=3D 1)
+		config->shunt_config |=3D CURRENT_SENSE_VOLTAGE_40_MASK;
+	else
+		return -EINVAL;
+	return 0;
+}
+
+/*
+ * Calibrate the tmp51x following the datasheet method
+ */
+static int tmp51x_calibrate(struct tmp51x_data *data)
+{
+	int rshunt =3D data->config->rshunt;
+	int vshunt_max =3D data->config->pga_gain * 40;
+	int val, max_curr_ma;
+
+	/* Calculate the maximum current that
+	 * can flow through the shunt in milliamps.
+	 */
+	max_curr_ma =3D DIV_ROUND_CLOSEST(vshunt_max * 1000, rshunt);
+	if (max_curr_ma < data->config->max_curr_ma)
+		data->config->max_curr_ma =3D max_curr_ma;
+
+	/* Calculate the minimal bit resolution for the current and the power.
+	 * Those values will be used during register interpretation.
+	 */
+	data->config->curr_lsb =3D
+		DIV_ROUND_CLOSEST(data->config->max_curr_ma * 1000, 32767);
+	data->config->pwr_lsb =3D 20 * data->config->curr_lsb;
+
+	/* Calculate the calibration register */
+	val =3D DIV_ROUND_CLOSEST(data->config->curr_lsb * rshunt, 1000);
+	val =3D DIV_ROUND_CLOSEST(40960, val);
+
+	return regmap_write(data->regmap, TMP51X_SHUNT_CALIBRATION, val);
+}
+
+/*
+ * Initialize the configuration and calibration registers.
+ */
+static int tmp51x_init(struct tmp51x_data *data)
+{
+	// Shunt configuration
+	unsigned int regval;
+	int ret =3D regmap_write(data->regmap, TMP51X_SHUNT_CONFIG,
+			       data->config->shunt_config);
+	if (ret < 0)
+		return ret;
+
+	// Temperature measurement configuration
+	ret =3D regmap_write(data->regmap, TMP51X_TEMP_CONFIG,
+			       data->config->temp_config);
+	if (ret < 0)
+		return ret;
+
+	ret =3D tmp51x_calibrate(data);
+	if (ret < 0)
+		return ret;
+
+	// Read the status register before using as the datasheet propose
+	ret =3D regmap_read(data->regmap, TMP51X_STATUS, &regval);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static const struct i2c_device_id tmp51x_id[] =3D {
+	{ "tmp512", tmp512 },
+	{ "tmp513", tmp513 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tmp51x_id);
+
+static const struct of_device_id tmp51x_of_match[] =3D {
+	{
+		.compatible =3D "ti,tmp512",
+		.data =3D (void *)tmp512
+	},
+	{
+		.compatible =3D "ti,tmp513",
+		.data =3D (void *)tmp513
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tmp51x_of_match);
+
+static int tmp51x_parse_device_tree(struct device *dev,
+	struct tmp51x_config *config)
+{
+	int ret;
+	u32 val;
+
+	// Mandatory fields
+	ret =3D of_property_read_u32(dev->of_node, "shunt-resistor-mohm", &val);
+	if (ret < 0)
+		return -ENODEV;
+
+	config->rshunt =3D val;
+
+	// Optional field
+	ret =3D of_property_read_u32(dev->of_node, "bus-voltage-range", &val);
+	if (ret >=3D 0) {
+		ret =3D tmp51x_vbus_max_to_reg(config, val);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret =3D of_property_read_u32(dev->of_node, "pga-gain", &val);
+	if (ret >=3D 0) {
+		ret =3D tmp51x_pga_gain_to_reg(config, val);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret =3D of_property_read_u32(dev->of_node, "max-expected-current-ma",
+				   &val);
+	if (ret >=3D 0) {
+		config->max_curr_ma =3D val;
+	} else {
+		config->max_curr_ma =3D
+			DIV_ROUND_CLOSEST(config->pga_gain * 40 * 1000,
+					  config->rshunt);
+	}
+
+	return 0;
+}
+
+static int tmp51x_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct device *dev =3D &client->dev;
+	struct tmp51x_data *data;
+	struct device *hwmon_dev;
+	int ret, group =3D 0;
+	enum tmp51x_ids chip;
+
+	if (client->dev.of_node)
+		chip =3D (enum tmp51x_ids)of_device_get_match_data(&client->dev);
+	else
+		return -ENODEV;
+
+	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	/* set the device type */
+	data->config =3D &tmp51x_config[chip];
+	mutex_init(&data->config_lock);
+
+	ret =3D tmp51x_parse_device_tree(dev, data->config);
+	if (ret < 0)
+		return ret;
+
+	tmp51x_regmap_config.max_register =3D data->config->registers;
+
+	data->regmap =3D devm_regmap_init_i2c(client, &tmp51x_regmap_config);
+	if (IS_ERR(data->regmap)) {
+		dev_err(dev, "failed to allocate register map\n");
+		return PTR_ERR(data->regmap);
+	}
+
+	ret =3D tmp51x_init(data);
+	if (ret < 0) {
+		dev_err(dev, "error configuring the device: %d\n", ret);
+		return -ENODEV;
+	}
+
+	data->groups[group++] =3D &tmp51x_group;
+	if (id->driver_data =3D=3D tmp513)
+		data->groups[group++] =3D &tmp513_group;
+
+	hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, client->name,
+							   data, data->groups);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	dev_info(dev, "power monitor %s\n", id->name);
+
+	return 0;
+}
+
+static struct i2c_driver tmp51x_driver =3D {
+	.driver =3D {
+		.name	=3D "tmp51x",
+		.of_match_table =3D of_match_ptr(tmp51x_of_match),
+	},
+	.probe		=3D tmp51x_probe,
+	.id_table	=3D tmp51x_id,
+};
+
+module_i2c_driver(tmp51x_driver);
+
+MODULE_AUTHOR("Eric Tremblay <etremblay@distechcontrols.com>");
+MODULE_DESCRIPTION("tmp51x driver");
+MODULE_LICENSE("GPL");
--=20
2.17.1

