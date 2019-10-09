Return-Path: <SRS0=qHdd=YC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A032ECE58D
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Oct 2019 10:28:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3048620659
	for <linux-hwmon@archiver.kernel.org>; Wed,  9 Oct 2019 10:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="Nh7bCLjh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfJIK22 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 9 Oct 2019 06:28:28 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:53336 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726734AbfJIK21 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 9 Oct 2019 06:28:27 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x99AMxg3018755;
        Wed, 9 Oct 2019 06:27:48 -0400
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2055.outbound.protection.outlook.com [104.47.36.55])
        by mx0b-00128a01.pphosted.com with ESMTP id 2veqt5dw1j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Oct 2019 06:27:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve2OnYCzU4Hsk+mOdyOEmzHDkUQNWMaZi1PIpbRFdWkXbm47K3PSUz+xLNX/ghBDLbCTvZNzA2z90jLZbsDV6iou6jc3R//qp/7zhml3pa9TjyIkAP78Y+zGd1UXm5rjgFIQuDzbSfMM+fComS7TvtCo5OqaUrlukaVoUzmlLTKzEBgp7oNRcd4ZszmiujE5QC8OMBbSbcF/UW/sFRO9Jq9GkDaHRoS4qUC8d4pvE60fFPvJHB9dtX49HY7+56Pa8YBUzANP2C45IWmRgGjmzx57TzUqo0UcOf71uAQqqtnkuwuztzAc1Vb71s7XNd76uhZbVij2ijcF4I7Ov9i+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJ1uKIJtjFSb1HxqPHvAozsWBtSVPdVZst4hySeBs1E=;
 b=Y3aRq/S2eVdNCKV4WER8mPCJ+mq6K2DdQ3Of7aUXEueqYLbntfxmSx7Ofy4VxWc9oTny5w7h9sIbYMoygvG9z4JkKOE6ser9OA1kbs5aGrTVD9E0XWTNc5dCOCjPOQvL1bBDEAuI8h1kpRiJSMAJEaB4CXAxXO/KIJG0gNJezd6K9cGGHvKjGrBA/xKbHPcZ1DrUH+dR2TervkXuGj3nMOpL5cu+DOw8VTTggq1xixu16Rxb/TEQpxTw4ytrZLjV64mvcX6D8Kx1jDoHNI8uyzIydJiBOE1Mn0b5E9Q5/35vJXwPpxjaaBN0xqTJ4PZzwTWMGs86HWxzGAXmGDJrRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJ1uKIJtjFSb1HxqPHvAozsWBtSVPdVZst4hySeBs1E=;
 b=Nh7bCLjhcprbhEp3i44fAMKHm7SnjOok5OmdwUrsGjGoBrWmR0uN7X2lJOCcsNRGz1vy5RbuIV41XX9ttSDkN8NqifsM+0baqhfZUt1d5QIYSYLtVGCBrzxY7RxfS2AL5y46Yt63hlXl0OdASOSWclKouq4fXOgezlr3DaqPn8Y=
Received: from CY1PR03CA0025.namprd03.prod.outlook.com (2603:10b6:600::35) by
 BN8PR03MB4833.namprd03.prod.outlook.com (2603:10b6:408:6a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 10:27:46 +0000
Received: from BL2NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::201) by CY1PR03CA0025.outlook.office365.com
 (2603:10b6:600::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 10:27:45 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT011.mail.protection.outlook.com (10.152.77.5) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2347.16
 via Frontend Transport; Wed, 9 Oct 2019 10:27:45 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x99ARcEw003248
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Wed, 9 Oct 2019 03:27:38 -0700
Received: from nsa.sphairon.box (10.44.3.90) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 9 Oct
 2019 06:27:43 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/2] hwmon: Support ADI Fan Control IP
Date:   Wed, 9 Oct 2019 12:28:05 +0200
Message-ID: <20191009102806.262241-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.44.3.90]
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(39860400002)(346002)(376002)(396003)(199004)(189003)(478600001)(45776006)(47776003)(2870700001)(246002)(70586007)(8676002)(106002)(30864003)(70206006)(54906003)(2906002)(110136005)(316002)(26005)(5660300002)(8936002)(14444005)(1076003)(6306002)(23676004)(186003)(50226002)(5820100001)(16526019)(356004)(6666004)(86362001)(6116002)(966005)(2616005)(4326008)(53416004)(3846002)(50466002)(486006)(305945005)(126002)(7736002)(7636002)(36756003)(426003)(476003)(336012);DIR:OUT;SFP:1101;SCL:1;SRVR:BN8PR03MB4833;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc7aff66-f81b-4bfb-fcf7-08d74ca3532a
X-MS-TrafficTypeDiagnostic: BN8PR03MB4833:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <BN8PR03MB4833E597B36607BDB423A5D699950@BN8PR03MB4833.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L3oLievNRwkNfDdGUgp7B1gd0FYLrxAdLVuWGS8u+vyLUWXRyYFF+JKmTy8cbrFCaR98z29u7ca5MwDKjYEkhqQqnlnoMA4O/fiyTS1N7EqoyGS5b7P6a+FDrgSWbwnUbxYmoJmJMpf+JmtO0o8hEwmJk1Mi+Az+vJx0Euz+H+uobPQyya4hXIwJnsE6e47vfXKF7gbzK/IE9DKWCNd13bEv+ujahDl2KVI5E5r1DsFzdHyHYzt0WIJTc1O2n4jyAmgZHYn83gC2DDAIaaiLuYaqvQgzlZ0fiXwe982VB/Z2wDK+LjPQvrq20API99hIFoV7H1kiqspHCFOY1EBLFtrjHZK4QHfjZldj3BL687isQ1nky8bpO9kW8S4gwKoWDyWxAE1LS6H5fA83aLFMYXP+/qw5Oh8h1YeXM0l9g2kvrG0PZJFgyDDEvz0fOsFYiywUF8WDi4X/YHpu31ElOg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 10:27:45.4470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7aff66-f81b-4bfb-fcf7-08d74ca3532a
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4833
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_05:2019-10-08,2019-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910090098
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The purpose of this IP Core is to control the fan used for the cooling of a
Xilinx Zynq Ultrascale+ MPSoC without the need of any external temperature
sensors. To achieve this, the IP core uses the PL SYSMONE4 primitive to
obtain the PL temperature and, based on those readings, it then outputs
a PWM signal to control the fan rotation accordingly.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
Changes in v2:
 * define AXI_PCORE macros in the driver source for now;
 * include linux/bits.h;
 * axi_fan_control_io{read/write} renamed with shorter names;
 * Make sure tach is != 0 when getting the fan rpm;
 * Read only once the clk rate;
 * Remove unneeded struct clk;
 * Fixed typo in millidegrees;
 * Use devm_platform_ioremap_resource();
 * Remove unneeded error logs;
 * Check valid values for pulses per revolution;
 * Clear the fault attribute after reading it;
 * Notify userspace if HW changed the PWM;
 * Add comments on how the core works in other to better understand the IRQ handling.

 MAINTAINERS                     |   7 +
 drivers/hwmon/Kconfig           |   9 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/axi-fan-control.c | 473 ++++++++++++++++++++++++++++++++
 4 files changed, 490 insertions(+)
 create mode 100644 drivers/hwmon/axi-fan-control.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 296de2b51c83..caa80ae1925e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2873,6 +2873,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXI-FAN-CONTROL HARDWARE MONITOR DRIVER
+M:	Nuno Sá <nuno.sa@analog.com>
+W:	http://ez.analog.com/community/linux-device-drivers
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	drivers/hwmon/axi-fan-control.c
+
 AXXIA I2C CONTROLLER
 M:	Krzysztof Adamski <krzysztof.adamski@nokia.com>
 L:	linux-i2c@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 7b6c4025b827..ca53bb33b965 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -269,6 +269,15 @@ config SENSORS_ASC7621
 	  This driver can also be built as a module. If so, the module
 	  will be called asc7621.
 
+config SENSORS_AXI_FAN_CONTROL
+	tristate "Analog Devices FAN Control HDL Core driver"
+	help
+	  If you say yes here you get support for the Analog Devices
+	  AXI HDL FAN monitoring core.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called axi-fan-control
+
 config SENSORS_K8TEMP
 	tristate "AMD Athlon64/FX or Opteron temperature sensor"
 	depends on X86 && PCI
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 40c036ea45e6..dcb4b64e1f4d 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_SENSORS_AS370)	+= as370-hwmon.o
 obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
 obj-$(CONFIG_SENSORS_ASPEED)	+= aspeed-pwm-tacho.o
 obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
+obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
 obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
 obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
 obj-$(CONFIG_SENSORS_DA9055)+= da9055-hwmon.o
diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
new file mode 100644
index 000000000000..6c1bd3269c8c
--- /dev/null
+++ b/drivers/hwmon/axi-fan-control.c
@@ -0,0 +1,473 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Fan Control HDL CORE driver
+ *
+ * Copyright 2019 Analog Devices Inc.
+ */
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/fpga/adi-axi-common.h>
+#include <linux/hwmon.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#define ADI_AXI_PCORE_VER_MAJOR(version)	(((version) >> 16) & 0xff)
+#define ADI_AXI_PCORE_VER_MINOR(version)	(((version) >> 8) & 0xff)
+#define ADI_AXI_PCORE_VER_PATCH(version)	((version) & 0xff)
+
+/* register map */
+#define ADI_REG_RSTN		0x0080
+#define ADI_REG_PWM_WIDTH	0x0084
+#define ADI_REG_TACH_PERIOD	0x0088
+#define ADI_REG_TACH_TOLERANCE	0x008c
+#define ADI_REG_PWM_PERIOD	0x00c0
+#define ADI_REG_TACH_MEASUR	0x00c4
+#define ADI_REG_TEMPERATURE	0x00c8
+
+#define ADI_REG_IRQ_MASK	0x0040
+#define ADI_REG_IRQ_PENDING	0x0044
+#define ADI_REG_IRQ_SRC		0x0048
+
+/* IRQ sources */
+#define ADI_IRQ_SRC_PWM_CHANGED		BIT(0)
+#define ADI_IRQ_SRC_TACH_ERR		BIT(1)
+#define ADI_IRQ_SRC_TEMP_INCREASE	BIT(2)
+#define ADI_IRQ_SRC_NEW_MEASUR		BIT(3)
+#define ADI_IRQ_SRC_MASK		GENMASK(3, 0)
+#define ADI_IRQ_MASK_OUT_ALL		0xFFFFFFFFU
+
+#define SYSFS_PWM_MAX			255
+
+struct axi_fan_control_data {
+	void __iomem *base;
+	struct device *hdev;
+	unsigned long clk_rate;
+	int irq;
+	/* pulses per revolution */
+	u32 ppr;
+	bool hw_pwm_req;
+	bool update_tacho_params;
+	u8 fan_fault;
+};
+
+static inline void axi_iowrite(const u32 val, const u32 reg,
+			       const struct axi_fan_control_data *ctl)
+{
+	iowrite32(val, ctl->base + reg);
+}
+
+static inline u32 axi_ioread(const u32 reg,
+			     const struct axi_fan_control_data *ctl)
+{
+	return ioread32(ctl->base + reg);
+}
+
+static long axi_fan_control_get_pwm_duty(const struct axi_fan_control_data *ctl)
+{
+	u32 pwm_width = axi_ioread(ADI_REG_PWM_WIDTH, ctl);
+	u32 pwm_period = axi_ioread(ADI_REG_PWM_PERIOD, ctl);
+	/*
+	 * PWM_PERIOD is a RO register set by the core. It should never be 0.
+	 * For now we are trusting the HW...
+	 */
+	return DIV_ROUND_CLOSEST(pwm_width * SYSFS_PWM_MAX, pwm_period);
+}
+
+static int axi_fan_control_set_pwm_duty(const long val,
+					struct axi_fan_control_data *ctl)
+{
+	u32 pwm_period = axi_ioread(ADI_REG_PWM_PERIOD, ctl);
+	u32 new_width;
+	long __val = clamp_val(val, 0, SYSFS_PWM_MAX);
+
+	new_width = DIV_ROUND_CLOSEST(__val * pwm_period, SYSFS_PWM_MAX);
+
+	axi_iowrite(new_width, ADI_REG_PWM_WIDTH, ctl);
+
+	return 0;
+}
+
+static long axi_fan_control_get_fan_rpm(const struct axi_fan_control_data *ctl)
+{
+	const u32 tach = axi_ioread(ADI_REG_TACH_MEASUR, ctl);
+
+	if (tach == 0)
+		/* should we return error, EAGAIN maybe? */
+		return 0;
+	/*
+	 * The tacho period should be:
+	 *      TACH = 60/(ppr * rpm), where rpm is revolutions per second
+	 *      and ppr is pulses per revolution.
+	 * Given the tacho period, we can multiply it by the input clock
+	 * so that we know how many clocks we need to have this period.
+	 * From this, we can derive the RPM value.
+	 */
+	return DIV_ROUND_CLOSEST(60 * ctl->clk_rate, ctl->ppr * tach);
+}
+
+static int axi_fan_control_read_temp(struct device *dev, u32 attr, long *val)
+{
+	struct axi_fan_control_data *ctl = dev_get_drvdata(dev);
+	long raw_temp;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		raw_temp = axi_ioread(ADI_REG_TEMPERATURE, ctl);
+		/*
+		 * The formula for the temperature is:
+		 *      T = (ADC * 501.3743 / 2^bits) - 273.6777
+		 * It's multiplied by 1000 to have millidegrees as
+		 * specified by the hwmon sysfs interface.
+		 */
+		*val = ((raw_temp * 501374) >> 16) - 273677;
+		return 0;
+	default:
+		return -ENOTSUPP;
+	}
+}
+
+static int axi_fan_control_read_fan(struct device *dev, u32 attr, long *val)
+{
+	struct axi_fan_control_data *ctl = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_fan_fault:
+		*val = ctl->fan_fault;
+		/* clear it now */
+		ctl->fan_fault = 0;
+		return 0;
+	case hwmon_fan_input:
+		*val = axi_fan_control_get_fan_rpm(ctl);
+		return 0;
+	default:
+		return -ENOTSUPP;
+	}
+}
+
+static int axi_fan_control_read_pwm(struct device *dev, u32 attr, long *val)
+{
+	struct axi_fan_control_data *ctl = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		*val = axi_fan_control_get_pwm_duty(ctl);
+		return 0;
+	default:
+		return -ENOTSUPP;
+	}
+}
+
+static int axi_fan_control_write_pwm(struct device *dev, u32 attr, long val)
+{
+	struct axi_fan_control_data *ctl = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		return axi_fan_control_set_pwm_duty(val, ctl);
+	default:
+		return -ENOTSUPP;
+	}
+}
+
+static int axi_fan_control_read_labels(struct device *dev,
+				       enum hwmon_sensor_types type,
+				       u32 attr, int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_fan:
+		*str = "FAN";
+		return 0;
+	case hwmon_temp:
+		*str = "SYSMON4";
+		return 0;
+	default:
+		return -ENOTSUPP;
+	}
+}
+
+static int axi_fan_control_read(struct device *dev,
+				enum hwmon_sensor_types type,
+				u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_fan:
+		return axi_fan_control_read_fan(dev, attr, val);
+	case hwmon_pwm:
+		return axi_fan_control_read_pwm(dev, attr, val);
+	case hwmon_temp:
+		return axi_fan_control_read_temp(dev, attr, val);
+	default:
+		return -ENOTSUPP;
+	}
+}
+
+static int axi_fan_control_write(struct device *dev,
+				 enum hwmon_sensor_types type,
+				 u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_pwm:
+		return axi_fan_control_write_pwm(dev, attr, val);
+	default:
+		return -ENOTSUPP;
+	}
+}
+
+static umode_t axi_fan_control_fan_is_visible(const u32 attr)
+{
+	switch (attr) {
+	case hwmon_fan_input:
+	case hwmon_fan_fault:
+	case hwmon_fan_label:
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static umode_t axi_fan_control_pwm_is_visible(const u32 attr)
+{
+	switch (attr) {
+	case hwmon_pwm_input:
+		return 0644;
+	default:
+		return 0;
+	}
+}
+
+static umode_t axi_fan_control_temp_is_visible(const u32 attr)
+{
+	switch (attr) {
+	case hwmon_temp_input:
+	case hwmon_temp_label:
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static umode_t axi_fan_control_is_visible(const void *data,
+					  enum hwmon_sensor_types type,
+					  u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		return axi_fan_control_fan_is_visible(attr);
+	case hwmon_pwm:
+		return axi_fan_control_pwm_is_visible(attr);
+	case hwmon_temp:
+		return axi_fan_control_temp_is_visible(attr);
+	default:
+		return 0;
+	}
+}
+
+/*
+ * This core has two main ways of changing the PWM duty cycle. It is done,
+ * either by a request from userspace (writing on pwm1_input) or by the
+ * core itself. When the change is done by the core, it will use predefined
+ * parameters to evaluate the tach signal and, on that case we cannot set them.
+ * On the other hand, when the request is done by the user, with some arbitrary
+ * value that the core does not now about, we have to provide the tach
+ * parameters so that, the core can evaluate the signal. On the IRQ handler we
+ * distinguish this by using the ADI_IRQ_SRC_TEMP_INCREASE interrupt. This tell
+ * us that the CORE requested a new duty cycle. After this, there is 5s delay
+ * on which the core waits for the fan rotation speed to stabilize. After this
+ * we get ADI_IRQ_SRC_PWM_CHANGED irq where we will decide if we need to set
+ * the tach parameters or not on the next tach measurement cycle (corresponding
+ * already to the ney duty cycle) based on the %ctl->hw_pwm_req flag.
+ */
+static irqreturn_t axi_fan_control_irq_handler(int irq, void *data)
+{
+	struct axi_fan_control_data *ctl = (struct axi_fan_control_data *)data;
+	u32 irq_pending = axi_ioread(ADI_REG_IRQ_PENDING, ctl);
+	u32 clear_mask;
+
+	if (irq_pending & ADI_IRQ_SRC_NEW_MEASUR) {
+		if (ctl->update_tacho_params) {
+			u32 new_tach = axi_ioread(ADI_REG_TACH_MEASUR, ctl);
+
+			/* get 25% tolerance */
+			u32 tach_tol = DIV_ROUND_CLOSEST(new_tach * 25, 100);
+			/* set new tacho parameters */
+			axi_iowrite(new_tach, ADI_REG_TACH_PERIOD, ctl);
+			axi_iowrite(tach_tol, ADI_REG_TACH_TOLERANCE, ctl);
+			ctl->update_tacho_params = false;
+		}
+	}
+
+	if (irq_pending & ADI_IRQ_SRC_PWM_CHANGED) {
+		/*
+		 * if the pwm changes on behalf of software,
+		 * we need to provide new tacho parameters to the core.
+		 * Wait for the next measurement for that...
+		 */
+		if (!ctl->hw_pwm_req) {
+			ctl->update_tacho_params = true;
+		} else {
+			ctl->hw_pwm_req = false;
+			sysfs_notify(&ctl->hdev->kobj, NULL, "pwm1");
+		}
+	}
+
+	if (irq_pending & ADI_IRQ_SRC_TEMP_INCREASE)
+		/* hardware requested a new pwm */
+		ctl->hw_pwm_req = true;
+
+	if (irq_pending & ADI_IRQ_SRC_TACH_ERR)
+		ctl->fan_fault = 1;
+
+	/* clear all interrupts */
+	clear_mask = irq_pending & ADI_IRQ_SRC_MASK;
+	axi_iowrite(clear_mask, ADI_REG_IRQ_PENDING, ctl);
+
+	return IRQ_HANDLED;
+}
+
+static int axi_fan_control_init(struct axi_fan_control_data *ctl,
+				const struct device_node *np)
+{
+	int ret;
+
+	/* get fan pulses per revolution */
+	ret = of_property_read_u32(np, "adi,pulses-per-revolution", &ctl->ppr);
+	if (ret)
+		return ret;
+
+	/* 1, 2 and 4 are the typical and accepted values */
+	if (ctl->ppr != 1 && ctl->ppr != 2 && ctl->ppr != 4)
+		return -EINVAL;
+	/*
+	 * Enable all IRQs
+	 */
+	axi_iowrite(ADI_IRQ_MASK_OUT_ALL &
+		    ~(ADI_IRQ_SRC_NEW_MEASUR | ADI_IRQ_SRC_TACH_ERR |
+		      ADI_IRQ_SRC_PWM_CHANGED | ADI_IRQ_SRC_TEMP_INCREASE),
+		    ADI_REG_IRQ_MASK, ctl);
+
+	/* bring the device out of reset */
+	axi_iowrite(0x01, ADI_REG_RSTN, ctl);
+
+	return ret;
+}
+
+static const struct hwmon_channel_info *axi_fan_control_info[] = {
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_LABEL),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_ops axi_fan_control_hwmon_ops = {
+	.is_visible = axi_fan_control_is_visible,
+	.read = axi_fan_control_read,
+	.write = axi_fan_control_write,
+	.read_string = axi_fan_control_read_labels,
+};
+
+static const struct hwmon_chip_info axi_chip_info = {
+	.ops = &axi_fan_control_hwmon_ops,
+	.info = axi_fan_control_info,
+};
+
+static const u32 version_1_0_0 = ADI_AXI_PCORE_VER(1, 0, 'a');
+
+static const struct of_device_id axi_fan_control_of_match[] = {
+	{ .compatible = "adi,axi-fan-control-1.00.a",
+		.data = (void *)&version_1_0_0},
+	{},
+};
+MODULE_DEVICE_TABLE(of, axi_fan_control_of_match);
+
+static int axi_fan_control_probe(struct platform_device *pdev)
+{
+	struct axi_fan_control_data *ctl;
+	struct clk *clk;
+	const struct of_device_id *id;
+	const char *name = "axi_fan_control";
+	struct resource *res;
+	u32 version;
+	int ret;
+
+	id = of_match_node(axi_fan_control_of_match, pdev->dev.of_node);
+	if (!id)
+		return -EINVAL;
+
+	ctl = devm_kzalloc(&pdev->dev, sizeof(*ctl), GFP_KERNEL);
+	if (!ctl)
+		return -ENOMEM;
+
+	ctl->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctl->base))
+		return PTR_ERR(ctl->base);
+
+	clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(&pdev->dev, "clk_get failed with %ld\n", PTR_ERR(clk));
+		return PTR_ERR(clk);
+	}
+
+	ctl->clk_rate = clk_get_rate(clk);
+	if (!ctl->clk_rate)
+		return -EINVAL;
+
+	dev_dbg(&pdev->dev, "Re-mapped from 0x%08llX to %p\n",
+		(unsigned long long)res->start, ctl->base);
+
+	version = axi_ioread(ADI_AXI_REG_VERSION, ctl);
+	if (ADI_AXI_PCORE_VER_MAJOR(version) !=
+	    ADI_AXI_PCORE_VER_MAJOR((*(u32 *)id->data))) {
+		dev_err(&pdev->dev, "Major version mismatch. Expected %d.%.2d.%c, Reported %d.%.2d.%c\n",
+			ADI_AXI_PCORE_VER_MAJOR((*(u32 *)id->data)),
+			ADI_AXI_PCORE_VER_MINOR((*(u32 *)id->data)),
+			ADI_AXI_PCORE_VER_PATCH((*(u32 *)id->data)),
+			ADI_AXI_PCORE_VER_MAJOR(version),
+			ADI_AXI_PCORE_VER_MINOR(version),
+			ADI_AXI_PCORE_VER_PATCH(version));
+		return -ENODEV;
+	}
+
+	ctl->irq = platform_get_irq(pdev, 0);
+	if (ctl->irq < 0)
+		return ctl->irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, ctl->irq, NULL,
+					axi_fan_control_irq_handler,
+					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
+					pdev->driver_override, ctl);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request an irq, %d", ret);
+		return ret;
+	}
+
+	ret = axi_fan_control_init(ctl, pdev->dev.of_node);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to initialize device\n");
+		return ret;
+	}
+
+	ctl->hdev = devm_hwmon_device_register_with_info(&pdev->dev,
+							 name,
+							 ctl,
+							 &axi_chip_info,
+							 NULL);
+
+	return PTR_ERR_OR_ZERO(ctl->hdev);
+}
+
+static struct platform_driver axi_fan_control_driver = {
+	.driver = {
+		.name = "axi_fan_control_driver",
+		.of_match_table = axi_fan_control_of_match,
+	},
+	.probe = axi_fan_control_probe,
+};
+module_platform_driver(axi_fan_control_driver);
+
+MODULE_AUTHOR("Nuno Sa <nuno.sa@analog.com>");
+MODULE_DESCRIPTION("Analog Devices Fan Control HDL CORE driver");
+MODULE_LICENSE("GPL");
-- 
2.23.0

