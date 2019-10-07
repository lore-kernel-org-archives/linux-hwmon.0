Return-Path: <SRS0=YDtn=YA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D166C47404
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Oct 2019 20:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A66920835
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Oct 2019 20:46:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="v6Ozu5JA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbfJGUq3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Oct 2019 16:46:29 -0400
Received: from mx0b-002ab301.pphosted.com ([148.163.154.99]:8352 "EHLO
        mx0b-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728273AbfJGUq2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 7 Oct 2019 16:46:28 -0400
Received: from pps.filterd (m0118795.ppops.net [127.0.0.1])
        by mx0b-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x97KehI6031065
        for <linux-hwmon@vger.kernel.org>; Mon, 7 Oct 2019 16:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps-02182019;
 bh=ssC+dkcR9FZW5gVifqIGTNhvq+NtoaNa3SYl/HLRVsw=;
 b=v6Ozu5JA/MNfBGzKCZy3kh2x0VceEJS2AvFPyepBHBfMaxHrCPEsZG4NAdexekFeXjks
 Vnwx6wRD+GKRft/+BJg7WJYTd8PZgDMwkERtZ6AtcowevJrFxxu7GMJKYV0cLfrYO3eH
 tRv7PMmwNcLwhZ9gwMfapVp/k2Nvx5JJ4mAM2z+orT5RFrFyf95Qont56LZyQYgGfiiy
 dxvg9qrwJbnR51nVbe8mF0ri8QX8hnXXubFzT71nCWhNUzwjrlnhequXRGUxj38dba3N
 kYBXbEw9DD+TlLrMNG39GQnoLnI2gHlwu+fyccc6HuQc+J01D2EZijbBZzj1yM1zBPx5 6A== 
Received: from nam04-bn3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2052.outbound.protection.outlook.com [104.47.46.52])
        by mx0b-002ab301.pphosted.com with ESMTP id 2ven3yadfw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Oct 2019 16:46:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaCFzNdeCoJBPq3WsbO+9lv5yPYA8sp1ZhiYQVDE6KleGwPVju+kegFVHjXph1dyubJzPlQvwCVVazeJfU/2TGxKKZsHAS7cWQbrMlgxDA0e6SftyxW6ghJC143FXFJLkHpGD8G49QfpUfkEpdCKM2j8jLCCGq+OpftSYqBEbfaD4wgEp35DViOWYfjgb+ArL2yPVDJkOWfqrh9GgSCeMbqydpsqsXie6fItl3SYzNi986h7zEsQFDUFlXF3fkYPQwILY1cZbdvxy68VWq6+Rr+Yf0Mv+FmRplP0hTc5gXeZF+3QGWdoA3R2LR3Cai5XmRl/EeNWOsD2P5zE8IetRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssC+dkcR9FZW5gVifqIGTNhvq+NtoaNa3SYl/HLRVsw=;
 b=aR1iGiTNHUcOyOzG4MDemiPCPMboEodTOw+tJWYTA0SUAJ/0Iu1HsiLGn/9E81J0juBNE2JOOn3FhwN9YwLz+yQyNZJhBjF5o+v8WYTbJUmIFDYRRBLm8yCmYHhSzEy6il2EFxgL1v/vtUBpZIBf1aDYp1QfoOHumhV8jFoY990fDjfAAUPWt3TFGKnebHkZRfdsYemmZWYcXZtrMaCzmp642AfoJPgO6R8IAei8oiitfeH5YhLrv+pSl4DFt4jS44YCsbmRlSMGn+1uM/Os/I9RF2Mt7ESrlthII2VLEZRwpM0CyCABuOcZzHGUvLafMK8iX+uV5SudLKZK6zH6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4194.prod.exchangelabs.com (10.167.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Mon, 7 Oct 2019 20:46:22 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5%3]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 20:46:22 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH v4 1/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v4 1/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdV9UEav6ueUrcfJTkqh1WnrSronig==
Date:   Mon, 7 Oct 2019 20:46:22 +0000
Message-ID: <BL0PR01MB48356AEBFDF834887F090A46959B0@BL0PR01MB4835.prod.exchangelabs.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d787196-f157-4f70-f131-08d74b676a11
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR01MB4194:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <BL0PR01MB419411E40843263C347A4DBB959B0@BL0PR01MB4194.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(199004)(189003)(66946007)(102836004)(76116006)(476003)(64756008)(486006)(66446008)(14444005)(66556008)(66476007)(256004)(3846002)(86362001)(6436002)(6116002)(2906002)(5640700003)(186003)(26005)(6306002)(66066001)(55016002)(6506007)(9686003)(8936002)(7696005)(99286004)(25786009)(33656002)(6916009)(305945005)(30864003)(5660300002)(74316002)(14454004)(71200400001)(81166006)(966005)(81156014)(2501003)(7736002)(8676002)(2351001)(478600001)(316002)(71190400001)(52536014)(2004002)(559001)(579004);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4194;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +1VOwibyPzIZasmeYEHj8PkLQ/2H+LGNqAKpYIbDCuDt4+R/7Asi6HU3raoOAQhD+HWOsWNxK1owOa9W4kAlCz0uIzYZOF6y3/YD06BSpZRiEn0Z7ba1G0Pn0Ja5Ux+tFVsWB/D4VXJGsXO07LwxzHXYUIQY4pPdxFPx0HYeAeASnx7ZUhKO8R5DxR3zowJmWZp5ef0wytmJ/EXCioNZCqP4/wqd4gh+C5lWw9l+xmj7Ie0LyqUWvOUvlQii9d/OxQE7p9kiFMqmcVoFw3oTo0waEF4fGVBurx5cgBoAi/5I2NlMJIq+2nT65Eup82DnPlVi4c2S0z08cMdlVR28nBHlqW9svFZWdy1KWXXK/KsuQdX+dbrHnoWbbL8HZRbgx/maJa1xGKYXWwQRylsK22Tqwx/ncsH/iT6U38g3FmhPo3I+Q1MmFpBX71rDhLcLI4DK/MlE1+Wk25aP6RUgmQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d787196-f157-4f70-f131-08d74b676a11
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 20:46:22.8340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xvk7soIO5zEFe9+rMRU3+dzUuxRc2CRtzLKQ4YEEl54m12HUwurrr9pVlsaNAPWjxA0M7H7xwcLv6B5KKHxqGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4194
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910070182
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.

TI's TMP512/513 are I2C/SMBus system monitor chips. These chips
monitor the supply voltage, supply current, power consumption
and provide one local and up to three (TMP513) remote temperature sensors.

It has been tested using a TI TMP513 development kit (TMP513EVM)

Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
---
 Documentation/hwmon/tmp513.rst | 102 +++++
 MAINTAINERS                    |   7 +
 drivers/hwmon/Kconfig          |  10 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/tmp513.c         | 795 +++++++++++++++++++++++++++++++++
 5 files changed, 915 insertions(+)
 create mode 100644 Documentation/hwmon/tmp513.rst
 create mode 100644 drivers/hwmon/tmp513.c

diff --git a/Documentation/hwmon/tmp513.rst b/Documentation/hwmon/tmp513.rs=
t
new file mode 100644
index 000000000000..b3837748ca7e
--- /dev/null
+++ b/Documentation/hwmon/tmp513.rst
@@ -0,0 +1,102 @@
+.. SPDX-License-Identifier: GPL-2.0
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
+local and up to three (TMP513) temperature sensors. The chips also impleme=
nt
+power supply monitoring such as shunt voltage, shunt current, bus voltage
+and power consumption.
+
+The temperatures are measured in degrees Celsius with a range of
+-40 to + 125 degrees with a resolution of 0.0625 degree C.
+
+For hysteresis value, only the first channel is writable. Writing to it
+will affect all other values since each channels are sharing the same
+hysteresis value. The hysteresis is in degrees Celsius with a range of
+0 to 127.5 degrees with a resolution of 0.5 degree.
+
+The driver exports the temperature values via the following sysfs files:
+
+**temp[1-4]_input**
+
+**temp[1-4]_crit**
+
+**temp[1-4]_crit_alarm**
+
+**temp[1-4]_crit_hyst**
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
+and depend on the shunt resistor value and the pga_gain value.
diff --git a/MAINTAINERS b/MAINTAINERS
index 55199ef7fa74..64b36fa3a436 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16373,6 +16373,13 @@ S:	Maintained
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
index 000000000000..2b086cc6d7c2
--- /dev/null
+++ b/drivers/hwmon/tmp513.c
@@ -0,0 +1,795 @@
+// SPDX-License-Identifier: GPL-2.0
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
+ * Copyright (C) 2019 Eric Tremblay <etremblay@distech-controls.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/util_macros.h>
+
+// Common register definition
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
+#define TMP51X_LOCAL_TEMP_LIMIT	0x11
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
+// Common attrs, and NULL
+#define TMP51X_MANUFACTURER_ID		0x55FF
+
+#define TMP512_DEVICE_ID		0x22FF
+#define TMP513_DEVICE_ID		0x23FF
+
+// Default config
+#define TMP51X_SHUNT_CONFIG_DEFAULT	0x399F
+#define TMP51X_SHUNT_VALUE_DEFAULT	1000
+#define TMP51X_VBUS_MAX_DEFAULT		32
+#define TMP51X_PGA_DEFAULT		8
+#define TMP51X_MAX_REGISTER_ADDR	0xFF
+
+#define TMP512_TEMP_CONFIG_DEFAULT	0xBF80
+#define TMP513_TEMP_CONFIG_DEFAULT	0xFF80
+
+// Mask and shift
+#define CURRENT_SENSE_VOLTAGE_320_MASK	0x1800
+#define CURRENT_SENSE_VOLTAGE_160_MASK	0x1000
+#define CURRENT_SENSE_VOLTAGE_80_MASK	0x0800
+#define CURRENT_SENSE_VOLTAGE_40_MASK	0
+
+#define TMP51X_BUS_VOLTAGE_MASK		0x2000
+#define TMP51X_PGA_MASK			0x1800
+#define TMP51X_NFACTOR_MASK		0xFF00
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
+// Max and Min value
+#define MAX_BUS_VOLTAGE_32_LIMIT	32764
+#define MAX_BUS_VOLTAGE_16_LIMIT	16382
+
+// Max possible value is -256 to +256 but datasheet indicated -40 to 125.
+#define MAX_TEMP_LIMIT			125000
+#define MIN_TEMP_LIMIT			-40000
+
+#define MAX_NFACTOR			127
+#define MIN_NFACTOR			-128
+#define MAX_TEMP_HYST			127500
+
+static const u8 TMP51X_TEMP_INPUT[4] =3D {
+	TMP51X_LOCAL_TEMP_RESULT,
+	TMP51X_REMOTE_TEMP_RESULT_1,
+	TMP51X_REMOTE_TEMP_RESULT_2,
+	TMP513_REMOTE_TEMP_RESULT_3
+};
+
+static const u8 TMP51X_TEMP_CRIT[4] =3D {
+	TMP51X_LOCAL_TEMP_LIMIT,
+	TMP51X_REMOTE_TEMP_LIMIT_1,
+	TMP51X_REMOTE_TEMP_LIMIT_2,
+	TMP513_REMOTE_TEMP_LIMIT_3
+};
+
+static const u8 TMP51X_TEMP_CRIT_ALARM[4] =3D {
+	TMP51X_LOCAL_TEMP_LIMIT_POS,
+	TMP51X_REMOTE_TEMP_LIMIT_1_POS,
+	TMP51X_REMOTE_TEMP_LIMIT_2_POS,
+	TMP513_REMOTE_TEMP_LIMIT_3_POS
+};
+
+static const u8 TMP51X_TEMP_CRIT_HYST[4] =3D {
+	TMP51X_N_FACTOR_AND_HYST_1,
+	TMP51X_N_FACTOR_AND_HYST_1,
+	TMP51X_N_FACTOR_AND_HYST_1,
+	TMP51X_N_FACTOR_AND_HYST_1
+};
+
+static const u8 TMP51X_IN_INPUT[2] =3D {
+	TMP51X_SHUNT_VOLTAGE_RESULT,
+	TMP51X_BUS_VOLTAGE_RESULT
+};
+
+static const u8 TMP51X_IN_CRIT[2] =3D {
+	TMP51X_SHUNT_VOLTAGE_H_LIMIT,
+	TMP51X_BUS_VOLTAGE_H_LIMIT
+};
+
+static const u8 TMP51X_IN_LCRIT[2] =3D {
+	TMP51X_SHUNT_VOLTAGE_L_LIMIT,
+	TMP51X_BUS_VOLTAGE_L_LIMIT
+};
+
+static const u8 TMP51X_IN_CRIT_ALARM[2] =3D {
+	TMP51X_SHUNT_VOLTAGE_H_LIMIT_POS,
+	TMP51X_BUS_VOLTAGE_H_LIMIT_POS
+};
+
+static const u8 TMP51X_IN_LCRIT_ALARM[2] =3D {
+	TMP51X_SHUNT_VOLTAGE_L_LIMIT_POS,
+	TMP51X_BUS_VOLTAGE_L_LIMIT_POS
+};
+
+static const u8 TMP51X_CURR_INPUT[1] =3D {
+	TMP51X_SHUNT_CURRENT_RESULT
+};
+
+static const u8 TMP51X_POWER_INPUT[1] =3D {
+	TMP51X_POWER_RESULT
+};
+
+static const u8 TMP51X_POWER_CRIT[1] =3D {
+	TMP51X_POWER_LIMIT
+};
+
+static const u8 TMP51X_POWER_CRIT_ALARM[1] =3D {
+	TMP51X_POWER_LIMIT_POS
+};
+
+
+static struct regmap_config tmp51x_regmap_config =3D {
+	.reg_bits =3D 8,
+	.val_bits =3D 16,
+	.max_register =3D TMP51X_MAX_REGISTER_ADDR,
+};
+
+enum tmp51x_ids {
+	tmp512, tmp513
+};
+
+struct tmp51x_data {
+	u16 shunt_config;
+	u16 pga_gain;
+	u16 vbus_max;
+
+	u16 temp_config;
+	u8 nfactor[3];
+
+	u32 shunt_uohms;
+
+	u32 curr_lsb;
+	u32 pwr_lsb;
+
+	enum tmp51x_ids id;
+	struct regmap *regmap;
+	struct mutex config_lock;
+};
+
+// Set the shift based on the gain 8=3D4, 4=3D3, 2=3D2, 1=3D1
+static inline u8 tmp51x_get_pga_shift(struct tmp51x_data *data)
+{
+	return 5 - ffs(data->pga_gain);
+}
+
+static int tmp51x_get_value(struct tmp51x_data *data, u8 reg, u8 pos,
+			    unsigned int regval, long *val)
+{
+	switch (reg) {
+	case TMP51X_STATUS:
+		*val =3D (regval >> pos) & 1;
+		break;
+	case TMP51X_SHUNT_VOLTAGE_RESULT:
+	case TMP51X_SHUNT_VOLTAGE_H_LIMIT:
+	case TMP51X_SHUNT_VOLTAGE_L_LIMIT:
+		/*
+		 * 2's compliment number shifted by one to four depending
+		 * on the pga gain setting.
+		 * 1lsb =3D 10uV
+		 */
+		*val =3D sign_extend32(regval, 17 - tmp51x_get_pga_shift(data));
+		*val =3D DIV_ROUND_CLOSEST(*val, 100);
+		break;
+	case TMP51X_BUS_VOLTAGE_RESULT:
+	case TMP51X_BUS_VOLTAGE_H_LIMIT:
+	case TMP51X_BUS_VOLTAGE_L_LIMIT:
+		// 1lsb =3D 4mV
+		*val =3D (regval >> TMP51X_BUS_VOLTAGE_SHIFT) * 4;
+		break;
+	case TMP51X_POWER_RESULT:
+	case TMP51X_POWER_LIMIT:
+		// Power =3D (current * BusVoltage) / 5000
+		*val =3D regval * data->pwr_lsb;
+		break;
+	case TMP51X_SHUNT_CURRENT_RESULT:
+		// Current =3D (ShuntVoltage * CalibrationRegister) / 4096
+		*val =3D sign_extend32(regval, 16) * data->curr_lsb;
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
+		*val =3D sign_extend32(regval, 16) >> TMP51X_TEMP_SHIFT;
+		*val =3D DIV_ROUND_CLOSEST(*val * 625, 10);
+		break;
+	case TMP51X_N_FACTOR_AND_HYST_1:
+		// 1lsb =3D 0.5 degrees centigrade
+		*val =3D (regval & TMP51X_HYST_MASK) * 500;
+		break;
+	default:
+		// Programmer goofed
+		WARN_ON_ONCE(1);
+		*val =3D 0;
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int tmp51x_set_value(struct tmp51x_data *data, u8 reg, long val)
+{
+	int regval, ret, max_val;
+	u32 mask =3D 0;
+
+	mutex_lock(&data->config_lock);
+
+	switch (reg) {
+	case TMP51X_SHUNT_VOLTAGE_H_LIMIT:
+	case TMP51X_SHUNT_VOLTAGE_L_LIMIT:
+		// 1lsb =3D 10uV
+		val *=3D 100;
+		max_val =3D U16_MAX >> tmp51x_get_pga_shift(data);
+		regval =3D clamp_val(val, -max_val, max_val);
+		break;
+	case TMP51X_BUS_VOLTAGE_H_LIMIT:
+	case TMP51X_BUS_VOLTAGE_L_LIMIT:
+		// 1lsb =3D 4mV
+		max_val =3D (data->vbus_max =3D=3D 32) ?
+			MAX_BUS_VOLTAGE_32_LIMIT : MAX_BUS_VOLTAGE_16_LIMIT;
+
+		val =3D clamp_val(DIV_ROUND_CLOSEST(val, 4), 0, max_val);
+		regval =3D val << TMP51X_BUS_VOLTAGE_SHIFT;
+		break;
+	case TMP51X_POWER_LIMIT:
+		regval =3D clamp_val(DIV_ROUND_CLOSEST(val, data->pwr_lsb), 0,
+				   U16_MAX);
+		break;
+	case TMP51X_LOCAL_TEMP_LIMIT:
+	case TMP51X_REMOTE_TEMP_LIMIT_1:
+	case TMP51X_REMOTE_TEMP_LIMIT_2:
+	case TMP513_REMOTE_TEMP_LIMIT_3:
+		// 1lsb =3D 0.0625 degrees centigrade
+		val =3D clamp_val(val, MIN_TEMP_LIMIT, MAX_TEMP_LIMIT);
+		regval =3D DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TEMP_SHIFT;
+		break;
+	case TMP51X_N_FACTOR_AND_HYST_1:
+		// 1lsb =3D 0.5 degrees centigrade
+		val =3D clamp_val(val, 0, MAX_TEMP_HYST);
+		regval =3D DIV_ROUND_CLOSEST(val, 500);
+		mask =3D TMP51X_HYST_MASK;
+		break;
+	default:
+		// Programmer goofed
+		WARN_ON_ONCE(1);
+		mutex_unlock(&data->config_lock);
+		return -EOPNOTSUPP;
+	}
+
+	if (mask =3D=3D 0)
+		ret =3D regmap_write(data->regmap, reg, regval);
+	else
+		ret =3D regmap_update_bits(data->regmap, reg, mask, regval);
+
+	mutex_unlock(&data->config_lock);
+
+	return ret;
+}
+
+static int tmp51x_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	struct tmp51x_data *data =3D dev_get_drvdata(dev);
+	int ret;
+	u32 regval;
+	u8 pos =3D 0, reg =3D 0;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			reg =3D TMP51X_TEMP_INPUT[channel];
+			break;
+		case hwmon_temp_crit_alarm:
+			reg =3D TMP51X_STATUS;
+			pos =3D TMP51X_TEMP_CRIT_ALARM[channel];
+			break;
+		case hwmon_temp_crit:
+			reg =3D TMP51X_TEMP_CRIT[channel];
+			break;
+		case hwmon_temp_crit_hyst:
+			reg =3D TMP51X_TEMP_CRIT_HYST[channel];
+			break;
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			reg =3D TMP51X_IN_INPUT[channel];
+			break;
+		case hwmon_in_lcrit_alarm:
+			reg =3D TMP51X_STATUS;
+			pos =3D TMP51X_IN_LCRIT_ALARM[channel];
+			break;
+		case hwmon_in_crit_alarm:
+			reg =3D TMP51X_STATUS;
+			pos =3D TMP51X_IN_CRIT_ALARM[channel];
+			break;
+		case hwmon_in_lcrit:
+			reg =3D TMP51X_IN_LCRIT[channel];
+			break;
+		case hwmon_in_crit:
+			reg =3D TMP51X_IN_CRIT[channel];
+			break;
+		}
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			reg =3D TMP51X_CURR_INPUT[channel];
+			break;
+		}
+		break;
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+			reg =3D TMP51X_POWER_INPUT[channel];
+			break;
+		case hwmon_power_crit_alarm:
+			reg =3D TMP51X_STATUS;
+			pos =3D TMP51X_POWER_CRIT_ALARM[channel];
+			break;
+		case hwmon_power_crit:
+			reg =3D TMP51X_POWER_CRIT[channel];
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (reg =3D=3D 0)
+		return -EOPNOTSUPP;
+
+	ret =3D regmap_read(data->regmap, reg, &regval);
+	if (ret < 0)
+		return ret;
+
+	return tmp51x_get_value(data, reg, pos, regval, val);
+}
+
+static int tmp51x_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	u8 reg =3D 0;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_crit:
+			reg =3D TMP51X_TEMP_CRIT[channel];
+			break;
+		case hwmon_temp_crit_hyst:
+			reg =3D TMP51X_TEMP_CRIT_HYST[channel];
+			break;
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_lcrit:
+			reg =3D TMP51X_IN_LCRIT[channel];
+			break;
+		case hwmon_in_crit:
+			reg =3D TMP51X_IN_CRIT[channel];
+			break;
+		}
+		break;
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_crit:
+			reg =3D TMP51X_POWER_CRIT[channel];
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (reg =3D=3D 0)
+		return -EOPNOTSUPP;
+
+	return tmp51x_set_value(dev_get_drvdata(dev), reg, val);
+}
+
+static umode_t tmp51x_is_visible(const void *_data,
+				 enum hwmon_sensor_types type, u32 attr,
+				 int channel)
+{
+	const struct tmp51x_data *data =3D _data;
+
+	switch (type) {
+	case hwmon_temp:
+		if (data->id =3D=3D tmp512 && channel =3D=3D 4)
+			return 0;
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_crit_alarm:
+			return 0444;
+		case hwmon_temp_crit:
+			return 0644;
+		case hwmon_temp_crit_hyst:
+			if (channel =3D=3D 0)
+				return 0644;
+			return 0444;
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+		case hwmon_in_lcrit_alarm:
+		case hwmon_in_crit_alarm:
+			return 0444;
+		case hwmon_in_lcrit:
+		case hwmon_in_crit:
+			return 0644;
+		}
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			return 0444;
+		}
+		break;
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+		case hwmon_power_crit_alarm:
+			return 0444;
+		case hwmon_power_crit:
+			return 0644;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_channel_info *tmp51x_info[] =3D {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
+			   HWMON_T_CRIT_HYST,
+			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
+			   HWMON_T_CRIT_HYST,
+			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
+			   HWMON_T_CRIT_HYST,
+			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
+			   HWMON_T_CRIT_HYST),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LCRIT | HWMON_I_LCRIT_ALARM |
+			   HWMON_I_CRIT | HWMON_I_CRIT_ALARM,
+			   HWMON_I_INPUT | HWMON_I_LCRIT | HWMON_I_LCRIT_ALARM |
+			   HWMON_I_CRIT | HWMON_I_CRIT_ALARM),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT),
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT | HWMON_P_CRIT | HWMON_P_CRIT_ALARM),
+	NULL
+};
+
+static const struct hwmon_ops tmp51x_hwmon_ops =3D {
+	.is_visible =3D tmp51x_is_visible,
+	.read =3D tmp51x_read,
+	.write =3D tmp51x_write,
+};
+
+static const struct hwmon_chip_info tmp51x_chip_info =3D {
+	.ops =3D &tmp51x_hwmon_ops,
+	.info =3D tmp51x_info,
+};
+
+/*
+ * Calibrate the tmp51x following the datasheet method
+ */
+static int tmp51x_calibrate(struct tmp51x_data *data)
+{
+	int vshunt_max =3D data->pga_gain * 40;
+	u64 max_curr_ma;
+	u32 div;
+
+	/*
+	 * If shunt_uohms is equal to 0, the calibration should be set to 0.
+	 * The consequence will be that the current and power measurement engine
+	 * of the sensor will not work. Temperature and voltage sensing will
+	 * continue to work.
+	 */
+	if (data->shunt_uohms =3D=3D 0)
+		return regmap_write(data->regmap, TMP51X_SHUNT_CALIBRATION, 0);
+
+	max_curr_ma =3D DIV_ROUND_CLOSEST_ULL(vshunt_max * 1000 * 1000,
+					    data->shunt_uohms);
+
+	/*
+	 * Calculate the minimal bit resolution for the current and the power.
+	 * Those values will be used during register interpretation.
+	 */
+	data->curr_lsb =3D DIV_ROUND_CLOSEST_ULL(max_curr_ma * 1000, 32767);
+	data->pwr_lsb =3D 20 * data->curr_lsb;
+
+	div =3D DIV_ROUND_CLOSEST_ULL(data->curr_lsb * data->shunt_uohms,
+				    1000 * 1000);
+
+	return regmap_write(data->regmap, TMP51X_SHUNT_CALIBRATION,
+			    DIV_ROUND_CLOSEST(40960, div));
+}
+
+/*
+ * Initialize the configuration and calibration registers.
+ */
+static int tmp51x_init(struct tmp51x_data *data)
+{
+	unsigned int regval;
+	int ret =3D regmap_write(data->regmap, TMP51X_SHUNT_CONFIG,
+			       data->shunt_config);
+	if (ret < 0)
+		return ret;
+
+	ret =3D regmap_write(data->regmap, TMP51X_TEMP_CONFIG, data->temp_config)=
;
+	if (ret < 0)
+		return ret;
+
+	// nFactor configuration
+	ret =3D regmap_update_bits(data->regmap, TMP51X_N_FACTOR_AND_HYST_1,
+				 TMP51X_NFACTOR_MASK, data->nfactor[0] << 8);
+	if (ret < 0)
+		return ret;
+
+	ret =3D regmap_write(data->regmap, TMP51X_N_FACTOR_2,
+			   data->nfactor[1] << 8);
+	if (ret < 0)
+		return ret;
+
+	if (data->id =3D=3D tmp513) {
+		ret =3D regmap_write(data->regmap, TMP513_N_FACTOR_3,
+				   data->nfactor[2] << 8);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret =3D tmp51x_calibrate(data);
+	if (ret < 0)
+		return ret;
+
+	// Read the status register before using as the datasheet propose
+	return regmap_read(data->regmap, TMP51X_STATUS, &regval);
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
+static int tmp51x_vbus_max_to_reg(struct device *dev, struct tmp51x_data *=
data)
+{
+	if (data->vbus_max =3D=3D 32) {
+		data->shunt_config |=3D TMP51X_BUS_VOLTAGE_MASK;
+	} else if (data->vbus_max =3D=3D 16) {
+		data->shunt_config &=3D ~TMP51X_BUS_VOLTAGE_MASK;
+	} else {
+		dev_err(dev, "bus-voltage-range is invalid: %u\n",
+			data->vbus_max);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int tmp51x_pga_gain_to_reg(struct device *dev, struct tmp51x_data *=
data)
+{
+	if (data->pga_gain =3D=3D 8) {
+		data->shunt_config |=3D CURRENT_SENSE_VOLTAGE_320_MASK;
+	} else if (data->pga_gain =3D=3D 4) {
+		data->shunt_config |=3D CURRENT_SENSE_VOLTAGE_160_MASK;
+	} else if (data->pga_gain =3D=3D 2) {
+		data->shunt_config |=3D CURRENT_SENSE_VOLTAGE_80_MASK;
+	} else if (data->pga_gain =3D=3D 1) {
+		data->shunt_config |=3D CURRENT_SENSE_VOLTAGE_40_MASK;
+	} else {
+		dev_err(dev, "pga-gain is invalid: %u\n", data->pga_gain);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int tmp51x_read_properties(struct device *dev, struct tmp51x_data *=
data)
+{
+	int ret;
+	u8 nfactor[3];
+	u32 val;
+
+	ret =3D device_property_read_u32(dev, "shunt-resistor-uohm", &val);
+	data->shunt_uohms =3D (ret >=3D 0) ? val : TMP51X_SHUNT_VALUE_DEFAULT;
+
+	ret =3D device_property_read_u32(dev, "bus-voltage-range", &val);
+	data->vbus_max =3D (ret >=3D 0) ? val : TMP51X_VBUS_MAX_DEFAULT;
+	ret =3D tmp51x_vbus_max_to_reg(dev, data);
+	if (ret < 0)
+		return ret;
+
+	ret =3D device_property_read_u32(dev, "pga-gain", &val);
+	data->pga_gain =3D (ret >=3D 0) ? val : TMP51X_PGA_DEFAULT;
+	ret =3D tmp51x_pga_gain_to_reg(dev, data);
+	if (ret < 0)
+		return ret;
+
+	ret =3D device_property_read_u8_array(dev, "nfactor", nfactor,
+		(data->id =3D=3D tmp513) ? 3 : 2);
+	if (ret >=3D 0)
+		memcpy(data->nfactor, nfactor, (data->id =3D=3D tmp513) ? 3 : 2);
+
+	// Check if shunt value is compatible with pga-gain
+	if (data->shunt_uohms > data->pga_gain * 40 * 1000 * 1000) {
+		dev_err(dev,
+			"shunt-resistor-uohm: %u is too big for pga_gain: %u\n",
+			data->shunt_uohms, data->pga_gain);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void tmp51x_use_default(struct tmp51x_data *data)
+{
+	data->vbus_max =3D TMP51X_VBUS_MAX_DEFAULT;
+	data->pga_gain =3D TMP51X_PGA_DEFAULT;
+	data->shunt_uohms =3D TMP51X_SHUNT_VALUE_DEFAULT;
+}
+
+static int tmp51x_configure(struct device *dev, struct tmp51x_data *data)
+{
+	data->shunt_config =3D TMP51X_SHUNT_CONFIG_DEFAULT;
+	data->temp_config =3D (data->id =3D=3D tmp513) ?
+			TMP513_TEMP_CONFIG_DEFAULT : TMP512_TEMP_CONFIG_DEFAULT;
+
+	if (dev->of_node)
+		return tmp51x_read_properties(dev, data);
+
+	tmp51x_use_default(data);
+	return 0;
+}
+
+static int tmp51x_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct device *dev =3D &client->dev;
+	struct tmp51x_data *data;
+	struct device *hwmon_dev;
+	int ret;
+
+	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	if (client->dev.of_node)
+		data->id =3D (enum tmp51x_ids)device_get_match_data(&client->dev);
+	else
+		data->id =3D id->driver_data;
+	mutex_init(&data->config_lock);
+
+	ret =3D tmp51x_configure(dev, data);
+	if (ret < 0) {
+		dev_err(dev, "error configuring the device: %d\n", ret);
+		return ret;
+	}
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
+	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &tmp51x_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	dev_dbg(dev, "power monitor %s\n", id->name);
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

