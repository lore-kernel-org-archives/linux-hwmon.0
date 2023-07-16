Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633A6EB64DD
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Jul 2023 15:46:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjGPPqq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Jul 2023 11:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjGPPqq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Jul 2023 11:46:46 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6D4E5D
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Jul 2023 08:46:43 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-666e3b15370so2628091b3a.0
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Jul 2023 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689522402; x=1692114402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pfZNPc9qtDk6mwf/HYdu6dF0oVCVzyXcWZxgYLLbv4s=;
        b=nC2qwktHqMTXpQM3+eV1p+N/EOa0FTLO9pvgG/psbPg8MABi58YnZf/gnm5KPRUCHC
         LgsYf1ntyu8zW3ele/ICtgwy1kDM5weybXfgX2qGpLwe7qx5S6jitlJ0zkys1jJKC8gn
         JaVxiXI0+WpZTgjfnEKJ7Ojey/iCF7SL7q7ljI2HEhp/IqSdvHp71xyEi9s/JYpB4q4q
         zLHminzXl0EXq5kSuTI5MDbICQkuFskm4t+C/QhrOF9er0s2dbAkwm8kpcIBnDYYyAdt
         6spYB9kcdgwIDThhbBiLXsM1eheJ2m/psMEh5sONJZ6PR0jbFzZZVK8XJ6wl4w2FG0fj
         JsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689522402; x=1692114402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfZNPc9qtDk6mwf/HYdu6dF0oVCVzyXcWZxgYLLbv4s=;
        b=TGGMnnWNjrUjJJ87A9b84eEuWeI3aeOXjWKetLdQl4MarIw/3Jp9wNGxAOfBWw2NYL
         2h3ijmoqggKOg8aDw/Mq7u9qYlsqn683AGOXGoRN1/8MXMBbva0NowCbW1oQV2vwUjie
         nk/fqMZCsxjQd4e2hBW9JgmkGj323bJo8KIh/8hDgmuSpZTR6Y8AtsS1Rv9DEpa4CIVn
         SiJUjPeujWhVgeaHdpUtF7i32T1NCHmegX59HIRhj0qSPn/FX3K6am3Z2dStoC5P0sLS
         +6EWN0ZBAdbY5kJM899I8ltYMRQy1CEbOBKF9utyib+OAonJdvsMt0ZCR6Co279Y1sWT
         wLow==
X-Gm-Message-State: ABy/qLYyUWlcg4y5rRjVhHrlUBLLxwkuf108w0RQaksmVWoSuOHGX3sT
        ZwoLf3KPo41fOX3tL6/kXgI91wBfjd4=
X-Google-Smtp-Source: APBJJlHzaRwX11dtZFBffK0MxlgTmzGGCi5k3H+ewwYpZ7gaelTDYHyaluiNfJR1Rbxe/2jWbJ7wZQ==
X-Received: by 2002:a05:6a20:5492:b0:133:f5c1:57b7 with SMTP id i18-20020a056a20549200b00133f5c157b7mr7524226pzk.51.1689522401860;
        Sun, 16 Jul 2023 08:46:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i123-20020a636d81000000b00514256c05c2sm11276519pgc.7.2023.07.16.08.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 08:46:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Remove smm665 driver
Date:   Sun, 16 Jul 2023 08:46:38 -0700
Message-Id: <20230716154638.3863604-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

SMM665 and related chips are power controller/sequencer chips from
Summit Microelectronics. The company was acquired by Qualcomm in 2012,
and support for the chip series stopped.

The chips are long since gone from active use, making the driver
unsupportable and just consuming space and compile time. Remove it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/smm665.rst | 187 ---------
 MAINTAINERS                    |   7 -
 drivers/hwmon/Kconfig          |  14 -
 drivers/hwmon/Makefile         |   1 -
 drivers/hwmon/smm665.c         | 706 ---------------------------------
 5 files changed, 915 deletions(-)
 delete mode 100644 Documentation/hwmon/smm665.rst
 delete mode 100644 drivers/hwmon/smm665.c

diff --git a/Documentation/hwmon/smm665.rst b/Documentation/hwmon/smm665.rst
deleted file mode 100644
index 481e69d8bf39..000000000000
--- a/Documentation/hwmon/smm665.rst
+++ /dev/null
@@ -1,187 +0,0 @@
-Kernel driver smm665
-====================
-
-Supported chips:
-
-  * Summit Microelectronics SMM465
-
-    Prefix: 'smm465'
-
-    Addresses scanned: -
-
-    Datasheet:
-
-      http://www.summitmicro.com/prod_select/summary/SMM465/SMM465DS.pdf
-
-  * Summit Microelectronics SMM665, SMM665B
-
-    Prefix: 'smm665'
-
-    Addresses scanned: -
-
-    Datasheet:
-
-      http://www.summitmicro.com/prod_select/summary/SMM665/SMM665B_2089_20.pdf
-
-  * Summit Microelectronics SMM665C
-
-    Prefix: 'smm665c'
-
-    Addresses scanned: -
-
-    Datasheet:
-
-      http://www.summitmicro.com/prod_select/summary/SMM665C/SMM665C_2125.pdf
-
-  * Summit Microelectronics SMM764
-
-    Prefix: 'smm764'
-
-    Addresses scanned: -
-
-    Datasheet:
-
-      http://www.summitmicro.com/prod_select/summary/SMM764/SMM764_2098.pdf
-
-  * Summit Microelectronics SMM766, SMM766B
-
-    Prefix: 'smm766'
-
-    Addresses scanned: -
-
-    Datasheets:
-
-      http://www.summitmicro.com/prod_select/summary/SMM766/SMM766_2086.pdf
-
-      http://www.summitmicro.com/prod_select/summary/SMM766B/SMM766B_2122.pdf
-
-Author: Guenter Roeck <linux@roeck-us.net>
-
-
-Module Parameters
------------------
-
-* vref: int
-    Default: 1250 (mV)
-
-    Reference voltage on VREF_ADC pin in mV. It should not be necessary to set
-    this parameter unless a non-default reference voltage is used.
-
-
-Description
------------
-
-[From datasheet] The SMM665 is an Active DC Output power supply Controller
-that monitors, margins and cascade sequences power. The part monitors six
-power supply channels as well as VDD, 12V input, two general-purpose analog
-inputs and an internal temperature sensor using a 10-bit ADC.
-
-Each monitored channel has its own high and low limits, plus a critical
-limit.
-
-Support for SMM465, SMM764, and SMM766 has been implemented but is untested.
-
-
-Usage Notes
------------
-
-This driver does not probe for devices, since there is no register which
-can be safely used to identify the chip. You will have to instantiate
-the devices explicitly. When instantiating the device, you have to specify
-its configuration register address.
-
-Example: the following will load the driver for an SMM665 at address 0x57
-on I2C bus #1::
-
-	$ modprobe smm665
-	$ echo smm665 0x57 > /sys/bus/i2c/devices/i2c-1/new_device
-
-
-Sysfs entries
--------------
-
-This driver uses the values in the datasheet to convert ADC register values
-into the values specified in the sysfs-interface document. All attributes are
-read only.
-
-Min, max, lcrit, and crit values are used by the chip to trigger external signals
-and/or other activity. Triggered signals can include HEALTHY, RST, Power Off,
-or Fault depending on the chip configuration. The driver reports values as lcrit
-or crit if exceeding the limits triggers RST, Power Off, or Fault, and as min or
-max otherwise. For details please see the SMM665 datasheet.
-
-For SMM465 and SMM764, values for Channel E and F are reported but undefined.
-
-======================= =======================================================
-in1_input		12V input voltage (mV)
-in2_input		3.3V (VDD) input voltage (mV)
-in3_input		Channel A voltage (mV)
-in4_input		Channel B voltage (mV)
-in5_input		Channel C voltage (mV)
-in6_input		Channel D voltage (mV)
-in7_input		Channel E voltage (mV)
-in8_input		Channel F voltage (mV)
-in9_input		AIN1 voltage (mV)
-in10_input		AIN2 voltage (mV)
-
-in1_min			12v input minimum voltage (mV)
-in2_min			3.3V (VDD) input minimum voltage (mV)
-in3_min			Channel A minimum voltage (mV)
-in4_min			Channel B minimum voltage (mV)
-in5_min			Channel C minimum voltage (mV)
-in6_min			Channel D minimum voltage (mV)
-in7_min			Channel E minimum voltage (mV)
-in8_min			Channel F minimum voltage (mV)
-in9_min			AIN1 minimum voltage (mV)
-in10_min		AIN2 minimum voltage (mV)
-
-in1_max			12v input maximum voltage (mV)
-in2_max			3.3V (VDD) input maximum voltage (mV)
-in3_max			Channel A maximum voltage (mV)
-in4_max			Channel B maximum voltage (mV)
-in5_max			Channel C maximum voltage (mV)
-in6_max			Channel D maximum voltage (mV)
-in7_max			Channel E maximum voltage (mV)
-in8_max			Channel F maximum voltage (mV)
-in9_max			AIN1 maximum voltage (mV)
-in10_max		AIN2 maximum voltage (mV)
-
-in1_lcrit		12v input critical minimum voltage (mV)
-in2_lcrit		3.3V (VDD) input critical minimum voltage (mV)
-in3_lcrit		Channel A critical minimum voltage (mV)
-in4_lcrit		Channel B critical minimum voltage (mV)
-in5_lcrit		Channel C critical minimum voltage (mV)
-in6_lcrit		Channel D critical minimum voltage (mV)
-in7_lcrit		Channel E critical minimum voltage (mV)
-in8_lcrit		Channel F critical minimum voltage (mV)
-in9_lcrit		AIN1 critical minimum voltage (mV)
-in10_lcrit		AIN2 critical minimum voltage (mV)
-
-in1_crit		12v input critical maximum voltage (mV)
-in2_crit		3.3V (VDD) input critical maximum voltage (mV)
-in3_crit		Channel A critical maximum voltage (mV)
-in4_crit		Channel B critical maximum voltage (mV)
-in5_crit		Channel C critical maximum voltage (mV)
-in6_crit		Channel D critical maximum voltage (mV)
-in7_crit		Channel E critical maximum voltage (mV)
-in8_crit		Channel F critical maximum voltage (mV)
-in9_crit		AIN1 critical maximum voltage (mV)
-in10_crit		AIN2 critical maximum voltage (mV)
-
-in1_crit_alarm		12v input critical alarm
-in2_crit_alarm		3.3V (VDD) input critical alarm
-in3_crit_alarm		Channel A critical alarm
-in4_crit_alarm		Channel B critical alarm
-in5_crit_alarm		Channel C critical alarm
-in6_crit_alarm		Channel D critical alarm
-in7_crit_alarm		Channel E critical alarm
-in8_crit_alarm		Channel F critical alarm
-in9_crit_alarm		AIN1 critical alarm
-in10_crit_alarm		AIN2 critical alarm
-
-temp1_input		Chip temperature
-temp1_min		Minimum chip temperature
-temp1_max		Maximum chip temperature
-temp1_crit		Critical chip temperature
-temp1_crit_alarm	Temperature critical alarm
-======================= =======================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 179310aa0c4b..c7645eb196f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19590,13 +19590,6 @@ M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Odd Fixes
 F:	drivers/net/ethernet/smsc/smc91x.*
 
-SMM665 HARDWARE MONITOR DRIVER
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/hwmon/smm665.rst
-F:	drivers/hwmon/smm665.c
-
 SMSC EMC2103 HARDWARE MONITOR DRIVER
 M:	Steve Glendinning <steve.glendinning@shawell.net>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 307477b8a371..2913299c2c9e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1951,20 +1951,6 @@ config SENSORS_SFCTEMP
 	  This driver can also be built as a module.  If so, the module
 	  will be called sfctemp.
 
-config SENSORS_SMM665
-	tristate "Summit Microelectronics SMM665"
-	depends on I2C
-	help
-	  If you say yes here you get support for the hardware monitoring
-	  features of the Summit Microelectronics SMM665/SMM665B Six-Channel
-	  Active DC Output Controller / Monitor.
-
-	  Other supported chips are SMM465, SMM665C, SMM764, and SMM766.
-	  Support for those chips is untested.
-
-	  This driver can also be built as a module. If so, the module will
-	  be called smm665.
-
 config SENSORS_ADC128D818
 	tristate "Texas Instruments ADC128D818"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 3f4b0fda0998..ff6bfd109c72 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -191,7 +191,6 @@ obj-$(CONFIG_SENSORS_SHT3x)	+= sht3x.o
 obj-$(CONFIG_SENSORS_SHT4x)	+= sht4x.o
 obj-$(CONFIG_SENSORS_SHTC1)	+= shtc1.o
 obj-$(CONFIG_SENSORS_SIS5595)	+= sis5595.o
-obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
 obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
 obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
 obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
diff --git a/drivers/hwmon/smm665.c b/drivers/hwmon/smm665.c
deleted file mode 100644
index 026c76f8c22e..000000000000
--- a/drivers/hwmon/smm665.c
+++ /dev/null
@@ -1,706 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Driver for SMM665 Power Controller / Monitor
- *
- * Copyright (C) 2010 Ericsson AB.
- *
- * This driver should also work for SMM465, SMM764, and SMM766, but is untested
- * for those chips. Only monitoring functionality is implemented.
- *
- * Datasheets:
- * http://www.summitmicro.com/prod_select/summary/SMM665/SMM665B_2089_20.pdf
- * http://www.summitmicro.com/prod_select/summary/SMM766B/SMM766B_2122.pdf
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/err.h>
-#include <linux/slab.h>
-#include <linux/i2c.h>
-#include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
-#include <linux/delay.h>
-#include <linux/jiffies.h>
-
-/* Internal reference voltage (VREF, x 1000 */
-#define SMM665_VREF_ADC_X1000	1250
-
-/* module parameters */
-static int vref = SMM665_VREF_ADC_X1000;
-module_param(vref, int, 0);
-MODULE_PARM_DESC(vref, "Reference voltage in mV");
-
-enum chips { smm465, smm665, smm665c, smm764, smm766 };
-
-/*
- * ADC channel addresses
- */
-#define	SMM665_MISC16_ADC_DATA_A	0x00
-#define	SMM665_MISC16_ADC_DATA_B	0x01
-#define	SMM665_MISC16_ADC_DATA_C	0x02
-#define	SMM665_MISC16_ADC_DATA_D	0x03
-#define	SMM665_MISC16_ADC_DATA_E	0x04
-#define	SMM665_MISC16_ADC_DATA_F	0x05
-#define	SMM665_MISC16_ADC_DATA_VDD	0x06
-#define	SMM665_MISC16_ADC_DATA_12V	0x07
-#define	SMM665_MISC16_ADC_DATA_INT_TEMP	0x08
-#define	SMM665_MISC16_ADC_DATA_AIN1	0x09
-#define	SMM665_MISC16_ADC_DATA_AIN2	0x0a
-
-/*
- * Command registers
- */
-#define	SMM665_MISC8_CMD_STS		0x80
-#define	SMM665_MISC8_STATUS1		0x81
-#define	SMM665_MISC8_STATUSS2		0x82
-#define	SMM665_MISC8_IO_POLARITY	0x83
-#define	SMM665_MISC8_PUP_POLARITY	0x84
-#define	SMM665_MISC8_ADOC_STATUS1	0x85
-#define	SMM665_MISC8_ADOC_STATUS2	0x86
-#define	SMM665_MISC8_WRITE_PROT		0x87
-#define	SMM665_MISC8_STS_TRACK		0x88
-
-/*
- * Configuration registers and register groups
- */
-#define SMM665_ADOC_ENABLE		0x0d
-#define SMM665_LIMIT_BASE		0x80	/* First limit register */
-
-/*
- * Limit register bit masks
- */
-#define SMM665_TRIGGER_RST		0x8000
-#define SMM665_TRIGGER_HEALTHY		0x4000
-#define SMM665_TRIGGER_POWEROFF		0x2000
-#define SMM665_TRIGGER_SHUTDOWN		0x1000
-#define SMM665_ADC_MASK			0x03ff
-
-#define smm665_is_critical(lim)	((lim) & (SMM665_TRIGGER_RST \
-					| SMM665_TRIGGER_POWEROFF \
-					| SMM665_TRIGGER_SHUTDOWN))
-/*
- * Fault register bit definitions
- * Values are merged from status registers 1/2,
- * with status register 1 providing the upper 8 bits.
- */
-#define SMM665_FAULT_A		0x0001
-#define SMM665_FAULT_B		0x0002
-#define SMM665_FAULT_C		0x0004
-#define SMM665_FAULT_D		0x0008
-#define SMM665_FAULT_E		0x0010
-#define SMM665_FAULT_F		0x0020
-#define SMM665_FAULT_VDD	0x0040
-#define SMM665_FAULT_12V	0x0080
-#define SMM665_FAULT_TEMP	0x0100
-#define SMM665_FAULT_AIN1	0x0200
-#define SMM665_FAULT_AIN2	0x0400
-
-/*
- * I2C Register addresses
- *
- * The configuration register needs to be the configured base register.
- * The command/status register address is derived from it.
- */
-#define SMM665_REGMASK		0x78
-#define SMM665_CMDREG_BASE	0x48
-#define SMM665_CONFREG_BASE	0x50
-
-/*
- *  Equations given by chip manufacturer to calculate voltage/temperature values
- *  vref = Reference voltage on VREF_ADC pin (module parameter)
- *  adc  = 10bit ADC value read back from registers
- */
-
-/* Voltage A-F and VDD */
-#define SMM665_VMON_ADC_TO_VOLTS(adc)  ((adc) * vref / 256)
-
-/* Voltage 12VIN */
-#define SMM665_12VIN_ADC_TO_VOLTS(adc) ((adc) * vref * 3 / 256)
-
-/* Voltage AIN1, AIN2 */
-#define SMM665_AIN_ADC_TO_VOLTS(adc)   ((adc) * vref / 512)
-
-/* Temp Sensor */
-#define SMM665_TEMP_ADC_TO_CELSIUS(adc) (((adc) <= 511) ?		   \
-					 ((int)(adc) * 1000 / 4) :	   \
-					 (((int)(adc) - 0x400) * 1000 / 4))
-
-#define SMM665_NUM_ADC		11
-
-/*
- * Chip dependent ADC conversion time, in uS
- */
-#define SMM665_ADC_WAIT_SMM665	70
-#define SMM665_ADC_WAIT_SMM766	185
-
-struct smm665_data {
-	enum chips type;
-	int conversion_time;		/* ADC conversion time */
-	struct i2c_client *client;
-	struct mutex update_lock;
-	bool valid;
-	unsigned long last_updated;	/* in jiffies */
-	u16 adc[SMM665_NUM_ADC];	/* adc values (raw) */
-	u16 faults;			/* fault status */
-	/* The following values are in mV */
-	int critical_min_limit[SMM665_NUM_ADC];
-	int alarm_min_limit[SMM665_NUM_ADC];
-	int critical_max_limit[SMM665_NUM_ADC];
-	int alarm_max_limit[SMM665_NUM_ADC];
-	struct i2c_client *cmdreg;
-};
-
-/*
- * smm665_read16()
- *
- * Read 16 bit value from <reg>, <reg+1>. Upper 8 bits are in <reg>.
- */
-static int smm665_read16(struct i2c_client *client, int reg)
-{
-	int rv, val;
-
-	rv = i2c_smbus_read_byte_data(client, reg);
-	if (rv < 0)
-		return rv;
-	val = rv << 8;
-	rv = i2c_smbus_read_byte_data(client, reg + 1);
-	if (rv < 0)
-		return rv;
-	val |= rv;
-	return val;
-}
-
-/*
- * Read adc value.
- */
-static int smm665_read_adc(struct smm665_data *data, int adc)
-{
-	struct i2c_client *client = data->cmdreg;
-	int rv;
-	int radc;
-
-	/*
-	 * Algorithm for reading ADC, per SMM665 datasheet
-	 *
-	 *  {[S][addr][W][Ack]} {[offset][Ack]} {[S][addr][R][Nack]}
-	 * [wait conversion time]
-	 *  {[S][addr][R][Ack]} {[datahi][Ack]} {[datalo][Ack][P]}
-	 *
-	 * To implement the first part of this exchange,
-	 * do a full read transaction and expect a failure/Nack.
-	 * This sets up the address pointer on the SMM665
-	 * and starts the ADC conversion.
-	 * Then do a two-byte read transaction.
-	 */
-	rv = i2c_smbus_read_byte_data(client, adc << 3);
-	if (rv != -ENXIO) {
-		/*
-		 * We expect ENXIO to reflect NACK
-		 * (per Documentation/i2c/fault-codes.rst).
-		 * Everything else is an error.
-		 */
-		dev_dbg(&client->dev,
-			"Unexpected return code %d when setting ADC index", rv);
-		return (rv < 0) ? rv : -EIO;
-	}
-
-	udelay(data->conversion_time);
-
-	/*
-	 * Now read two bytes.
-	 *
-	 * Neither i2c_smbus_read_byte() nor
-	 * i2c_smbus_read_block_data() worked here,
-	 * so use i2c_smbus_read_word_swapped() instead.
-	 * We could also try to use i2c_master_recv(),
-	 * but that is not always supported.
-	 */
-	rv = i2c_smbus_read_word_swapped(client, 0);
-	if (rv < 0) {
-		dev_dbg(&client->dev, "Failed to read ADC value: error %d", rv);
-		return rv;
-	}
-	/*
-	 * Validate/verify readback adc channel (in bit 11..14).
-	 */
-	radc = (rv >> 11) & 0x0f;
-	if (radc != adc) {
-		dev_dbg(&client->dev, "Unexpected RADC: Expected %d got %d",
-			adc, radc);
-		return -EIO;
-	}
-
-	return rv & SMM665_ADC_MASK;
-}
-
-static struct smm665_data *smm665_update_device(struct device *dev)
-{
-	struct smm665_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	struct smm665_data *ret = data;
-
-	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
-		int i, val;
-
-		/*
-		 * read status registers
-		 */
-		val = smm665_read16(client, SMM665_MISC8_STATUS1);
-		if (unlikely(val < 0)) {
-			ret = ERR_PTR(val);
-			goto abort;
-		}
-		data->faults = val;
-
-		/* Read adc registers */
-		for (i = 0; i < SMM665_NUM_ADC; i++) {
-			val = smm665_read_adc(data, i);
-			if (unlikely(val < 0)) {
-				ret = ERR_PTR(val);
-				goto abort;
-			}
-			data->adc[i] = val;
-		}
-		data->last_updated = jiffies;
-		data->valid = true;
-	}
-abort:
-	mutex_unlock(&data->update_lock);
-	return ret;
-}
-
-/* Return converted value from given adc */
-static int smm665_convert(u16 adcval, int index)
-{
-	int val = 0;
-
-	switch (index) {
-	case SMM665_MISC16_ADC_DATA_12V:
-		val = SMM665_12VIN_ADC_TO_VOLTS(adcval & SMM665_ADC_MASK);
-		break;
-
-	case SMM665_MISC16_ADC_DATA_VDD:
-	case SMM665_MISC16_ADC_DATA_A:
-	case SMM665_MISC16_ADC_DATA_B:
-	case SMM665_MISC16_ADC_DATA_C:
-	case SMM665_MISC16_ADC_DATA_D:
-	case SMM665_MISC16_ADC_DATA_E:
-	case SMM665_MISC16_ADC_DATA_F:
-		val = SMM665_VMON_ADC_TO_VOLTS(adcval & SMM665_ADC_MASK);
-		break;
-
-	case SMM665_MISC16_ADC_DATA_AIN1:
-	case SMM665_MISC16_ADC_DATA_AIN2:
-		val = SMM665_AIN_ADC_TO_VOLTS(adcval & SMM665_ADC_MASK);
-		break;
-
-	case SMM665_MISC16_ADC_DATA_INT_TEMP:
-		val = SMM665_TEMP_ADC_TO_CELSIUS(adcval & SMM665_ADC_MASK);
-		break;
-
-	default:
-		/* If we get here, the developer messed up */
-		WARN_ON_ONCE(1);
-		break;
-	}
-
-	return val;
-}
-
-static int smm665_get_min(struct device *dev, int index)
-{
-	struct smm665_data *data = dev_get_drvdata(dev);
-
-	return data->alarm_min_limit[index];
-}
-
-static int smm665_get_max(struct device *dev, int index)
-{
-	struct smm665_data *data = dev_get_drvdata(dev);
-
-	return data->alarm_max_limit[index];
-}
-
-static int smm665_get_lcrit(struct device *dev, int index)
-{
-	struct smm665_data *data = dev_get_drvdata(dev);
-
-	return data->critical_min_limit[index];
-}
-
-static int smm665_get_crit(struct device *dev, int index)
-{
-	struct smm665_data *data = dev_get_drvdata(dev);
-
-	return data->critical_max_limit[index];
-}
-
-static ssize_t smm665_show_crit_alarm(struct device *dev,
-				      struct device_attribute *da, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct smm665_data *data = smm665_update_device(dev);
-	int val = 0;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	if (data->faults & (1 << attr->index))
-		val = 1;
-
-	return sysfs_emit(buf, "%d\n", val);
-}
-
-static ssize_t smm665_show_input(struct device *dev,
-				 struct device_attribute *da, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-	struct smm665_data *data = smm665_update_device(dev);
-	int adc = attr->index;
-	int val;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	val = smm665_convert(data->adc[adc], adc);
-	return sysfs_emit(buf, "%d\n", val);
-}
-
-#define SMM665_SHOW(what) \
-static ssize_t smm665_show_##what(struct device *dev, \
-				    struct device_attribute *da, char *buf) \
-{ \
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(da); \
-	const int val = smm665_get_##what(dev, attr->index); \
-	return snprintf(buf, PAGE_SIZE, "%d\n", val); \
-}
-
-SMM665_SHOW(min);
-SMM665_SHOW(max);
-SMM665_SHOW(lcrit);
-SMM665_SHOW(crit);
-
-/*
- * These macros are used below in constructing device attribute objects
- * for use with sysfs_create_group() to make a sysfs device file
- * for each register.
- */
-
-#define SMM665_ATTR(name, type, cmd_idx) \
-	static SENSOR_DEVICE_ATTR(name##_##type, S_IRUGO, \
-				  smm665_show_##type, NULL, cmd_idx)
-
-/* Construct a sensor_device_attribute structure for each register */
-
-/* Input voltages */
-SMM665_ATTR(in1, input, SMM665_MISC16_ADC_DATA_12V);
-SMM665_ATTR(in2, input, SMM665_MISC16_ADC_DATA_VDD);
-SMM665_ATTR(in3, input, SMM665_MISC16_ADC_DATA_A);
-SMM665_ATTR(in4, input, SMM665_MISC16_ADC_DATA_B);
-SMM665_ATTR(in5, input, SMM665_MISC16_ADC_DATA_C);
-SMM665_ATTR(in6, input, SMM665_MISC16_ADC_DATA_D);
-SMM665_ATTR(in7, input, SMM665_MISC16_ADC_DATA_E);
-SMM665_ATTR(in8, input, SMM665_MISC16_ADC_DATA_F);
-SMM665_ATTR(in9, input, SMM665_MISC16_ADC_DATA_AIN1);
-SMM665_ATTR(in10, input, SMM665_MISC16_ADC_DATA_AIN2);
-
-/* Input voltages min */
-SMM665_ATTR(in1, min, SMM665_MISC16_ADC_DATA_12V);
-SMM665_ATTR(in2, min, SMM665_MISC16_ADC_DATA_VDD);
-SMM665_ATTR(in3, min, SMM665_MISC16_ADC_DATA_A);
-SMM665_ATTR(in4, min, SMM665_MISC16_ADC_DATA_B);
-SMM665_ATTR(in5, min, SMM665_MISC16_ADC_DATA_C);
-SMM665_ATTR(in6, min, SMM665_MISC16_ADC_DATA_D);
-SMM665_ATTR(in7, min, SMM665_MISC16_ADC_DATA_E);
-SMM665_ATTR(in8, min, SMM665_MISC16_ADC_DATA_F);
-SMM665_ATTR(in9, min, SMM665_MISC16_ADC_DATA_AIN1);
-SMM665_ATTR(in10, min, SMM665_MISC16_ADC_DATA_AIN2);
-
-/* Input voltages max */
-SMM665_ATTR(in1, max, SMM665_MISC16_ADC_DATA_12V);
-SMM665_ATTR(in2, max, SMM665_MISC16_ADC_DATA_VDD);
-SMM665_ATTR(in3, max, SMM665_MISC16_ADC_DATA_A);
-SMM665_ATTR(in4, max, SMM665_MISC16_ADC_DATA_B);
-SMM665_ATTR(in5, max, SMM665_MISC16_ADC_DATA_C);
-SMM665_ATTR(in6, max, SMM665_MISC16_ADC_DATA_D);
-SMM665_ATTR(in7, max, SMM665_MISC16_ADC_DATA_E);
-SMM665_ATTR(in8, max, SMM665_MISC16_ADC_DATA_F);
-SMM665_ATTR(in9, max, SMM665_MISC16_ADC_DATA_AIN1);
-SMM665_ATTR(in10, max, SMM665_MISC16_ADC_DATA_AIN2);
-
-/* Input voltages lcrit */
-SMM665_ATTR(in1, lcrit, SMM665_MISC16_ADC_DATA_12V);
-SMM665_ATTR(in2, lcrit, SMM665_MISC16_ADC_DATA_VDD);
-SMM665_ATTR(in3, lcrit, SMM665_MISC16_ADC_DATA_A);
-SMM665_ATTR(in4, lcrit, SMM665_MISC16_ADC_DATA_B);
-SMM665_ATTR(in5, lcrit, SMM665_MISC16_ADC_DATA_C);
-SMM665_ATTR(in6, lcrit, SMM665_MISC16_ADC_DATA_D);
-SMM665_ATTR(in7, lcrit, SMM665_MISC16_ADC_DATA_E);
-SMM665_ATTR(in8, lcrit, SMM665_MISC16_ADC_DATA_F);
-SMM665_ATTR(in9, lcrit, SMM665_MISC16_ADC_DATA_AIN1);
-SMM665_ATTR(in10, lcrit, SMM665_MISC16_ADC_DATA_AIN2);
-
-/* Input voltages crit */
-SMM665_ATTR(in1, crit, SMM665_MISC16_ADC_DATA_12V);
-SMM665_ATTR(in2, crit, SMM665_MISC16_ADC_DATA_VDD);
-SMM665_ATTR(in3, crit, SMM665_MISC16_ADC_DATA_A);
-SMM665_ATTR(in4, crit, SMM665_MISC16_ADC_DATA_B);
-SMM665_ATTR(in5, crit, SMM665_MISC16_ADC_DATA_C);
-SMM665_ATTR(in6, crit, SMM665_MISC16_ADC_DATA_D);
-SMM665_ATTR(in7, crit, SMM665_MISC16_ADC_DATA_E);
-SMM665_ATTR(in8, crit, SMM665_MISC16_ADC_DATA_F);
-SMM665_ATTR(in9, crit, SMM665_MISC16_ADC_DATA_AIN1);
-SMM665_ATTR(in10, crit, SMM665_MISC16_ADC_DATA_AIN2);
-
-/* critical alarms */
-SMM665_ATTR(in1, crit_alarm, SMM665_FAULT_12V);
-SMM665_ATTR(in2, crit_alarm, SMM665_FAULT_VDD);
-SMM665_ATTR(in3, crit_alarm, SMM665_FAULT_A);
-SMM665_ATTR(in4, crit_alarm, SMM665_FAULT_B);
-SMM665_ATTR(in5, crit_alarm, SMM665_FAULT_C);
-SMM665_ATTR(in6, crit_alarm, SMM665_FAULT_D);
-SMM665_ATTR(in7, crit_alarm, SMM665_FAULT_E);
-SMM665_ATTR(in8, crit_alarm, SMM665_FAULT_F);
-SMM665_ATTR(in9, crit_alarm, SMM665_FAULT_AIN1);
-SMM665_ATTR(in10, crit_alarm, SMM665_FAULT_AIN2);
-
-/* Temperature */
-SMM665_ATTR(temp1, input, SMM665_MISC16_ADC_DATA_INT_TEMP);
-SMM665_ATTR(temp1, min, SMM665_MISC16_ADC_DATA_INT_TEMP);
-SMM665_ATTR(temp1, max, SMM665_MISC16_ADC_DATA_INT_TEMP);
-SMM665_ATTR(temp1, lcrit, SMM665_MISC16_ADC_DATA_INT_TEMP);
-SMM665_ATTR(temp1, crit, SMM665_MISC16_ADC_DATA_INT_TEMP);
-SMM665_ATTR(temp1, crit_alarm, SMM665_FAULT_TEMP);
-
-/*
- * Finally, construct an array of pointers to members of the above objects,
- * as required for sysfs_create_group()
- */
-static struct attribute *smm665_attrs[] = {
-	&sensor_dev_attr_in1_input.dev_attr.attr,
-	&sensor_dev_attr_in1_min.dev_attr.attr,
-	&sensor_dev_attr_in1_max.dev_attr.attr,
-	&sensor_dev_attr_in1_lcrit.dev_attr.attr,
-	&sensor_dev_attr_in1_crit.dev_attr.attr,
-	&sensor_dev_attr_in1_crit_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_in2_input.dev_attr.attr,
-	&sensor_dev_attr_in2_min.dev_attr.attr,
-	&sensor_dev_attr_in2_max.dev_attr.attr,
-	&sensor_dev_attr_in2_lcrit.dev_attr.attr,
-	&sensor_dev_attr_in2_crit.dev_attr.attr,
-	&sensor_dev_attr_in2_crit_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_in3_input.dev_attr.attr,
-	&sensor_dev_attr_in3_min.dev_attr.attr,
-	&sensor_dev_attr_in3_max.dev_attr.attr,
-	&sensor_dev_attr_in3_lcrit.dev_attr.attr,
-	&sensor_dev_attr_in3_crit.dev_attr.attr,
-	&sensor_dev_attr_in3_crit_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_in4_input.dev_attr.attr,
-	&sensor_dev_attr_in4_min.dev_attr.attr,
-	&sensor_dev_attr_in4_max.dev_attr.attr,
-	&sensor_dev_attr_in4_lcrit.dev_attr.attr,
-	&sensor_dev_attr_in4_crit.dev_attr.attr,
-	&sensor_dev_attr_in4_crit_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_in5_input.dev_attr.attr,
-	&sensor_dev_attr_in5_min.dev_attr.attr,
-	&sensor_dev_attr_in5_max.dev_attr.attr,
-	&sensor_dev_attr_in5_lcrit.dev_attr.attr,
-	&sensor_dev_attr_in5_crit.dev_attr.attr,
-	&sensor_dev_attr_in5_crit_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_in6_input.dev_attr.attr,
-	&sensor_dev_attr_in6_min.dev_attr.attr,
-	&sensor_dev_attr_in6_max.dev_attr.attr,
-	&sensor_dev_attr_in6_lcrit.dev_attr.attr,
-	&sensor_dev_attr_in6_crit.dev_attr.attr,
-	&sensor_dev_attr_in6_crit_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_in7_input.dev_attr.attr,
-	&sensor_dev_attr_in7_min.dev_attr.attr,
-	&sensor_dev_attr_in7_max.dev_attr.attr,
-	&sensor_dev_attr_in7_lcrit.dev_attr.attr,
-	&sensor_dev_attr_in7_crit.dev_attr.attr,
-	&sensor_dev_attr_in7_crit_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_in8_input.dev_attr.attr,
-	&sensor_dev_attr_in8_min.dev_attr.attr,
-	&sensor_dev_attr_in8_max.dev_attr.attr,
-	&sensor_dev_attr_in8_lcrit.dev_attr.attr,
-	&sensor_dev_attr_in8_crit.dev_attr.attr,
-	&sensor_dev_attr_in8_crit_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_in9_input.dev_attr.attr,
-	&sensor_dev_attr_in9_min.dev_attr.attr,
-	&sensor_dev_attr_in9_max.dev_attr.attr,
-	&sensor_dev_attr_in9_lcrit.dev_attr.attr,
-	&sensor_dev_attr_in9_crit.dev_attr.attr,
-	&sensor_dev_attr_in9_crit_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_in10_input.dev_attr.attr,
-	&sensor_dev_attr_in10_min.dev_attr.attr,
-	&sensor_dev_attr_in10_max.dev_attr.attr,
-	&sensor_dev_attr_in10_lcrit.dev_attr.attr,
-	&sensor_dev_attr_in10_crit.dev_attr.attr,
-	&sensor_dev_attr_in10_crit_alarm.dev_attr.attr,
-
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_min.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_lcrit.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit_alarm.dev_attr.attr,
-
-	NULL,
-};
-
-ATTRIBUTE_GROUPS(smm665);
-
-static const struct i2c_device_id smm665_id[];
-
-static int smm665_probe(struct i2c_client *client)
-{
-	struct i2c_adapter *adapter = client->adapter;
-	struct smm665_data *data;
-	struct device *hwmon_dev;
-	int i, ret;
-
-	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
-				     | I2C_FUNC_SMBUS_WORD_DATA))
-		return -ENODEV;
-
-	if (i2c_smbus_read_byte_data(client, SMM665_ADOC_ENABLE) < 0)
-		return -ENODEV;
-
-	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	i2c_set_clientdata(client, data);
-	mutex_init(&data->update_lock);
-
-	data->client = client;
-	data->type = i2c_match_id(smm665_id, client)->driver_data;
-	data->cmdreg = i2c_new_dummy_device(adapter, (client->addr & ~SMM665_REGMASK)
-				     | SMM665_CMDREG_BASE);
-	if (IS_ERR(data->cmdreg))
-		return PTR_ERR(data->cmdreg);
-
-	switch (data->type) {
-	case smm465:
-	case smm665:
-		data->conversion_time = SMM665_ADC_WAIT_SMM665;
-		break;
-	case smm665c:
-	case smm764:
-	case smm766:
-		data->conversion_time = SMM665_ADC_WAIT_SMM766;
-		break;
-	}
-
-	ret = -ENODEV;
-	if (i2c_smbus_read_byte_data(data->cmdreg, SMM665_MISC8_CMD_STS) < 0)
-		goto out_unregister;
-
-	/*
-	 * Read limits.
-	 *
-	 * Limit registers start with register SMM665_LIMIT_BASE.
-	 * Each channel uses 8 registers, providing four limit values
-	 * per channel. Each limit value requires two registers, with the
-	 * high byte in the first register and the low byte in the second
-	 * register. The first two limits are under limit values, followed
-	 * by two over limit values.
-	 *
-	 * Limit register order matches the ADC register order, so we use
-	 * ADC register defines throughout the code to index limit registers.
-	 *
-	 * We save the first retrieved value both as "critical" and "alarm"
-	 * value. The second value overwrites either the critical or the
-	 * alarm value, depending on its configuration. This ensures that both
-	 * critical and alarm values are initialized, even if both registers are
-	 * configured as critical or non-critical.
-	 */
-	for (i = 0; i < SMM665_NUM_ADC; i++) {
-		int val;
-
-		val = smm665_read16(client, SMM665_LIMIT_BASE + i * 8);
-		if (unlikely(val < 0))
-			goto out_unregister;
-		data->critical_min_limit[i] = data->alarm_min_limit[i]
-		  = smm665_convert(val, i);
-		val = smm665_read16(client, SMM665_LIMIT_BASE + i * 8 + 2);
-		if (unlikely(val < 0))
-			goto out_unregister;
-		if (smm665_is_critical(val))
-			data->critical_min_limit[i] = smm665_convert(val, i);
-		else
-			data->alarm_min_limit[i] = smm665_convert(val, i);
-		val = smm665_read16(client, SMM665_LIMIT_BASE + i * 8 + 4);
-		if (unlikely(val < 0))
-			goto out_unregister;
-		data->critical_max_limit[i] = data->alarm_max_limit[i]
-		  = smm665_convert(val, i);
-		val = smm665_read16(client, SMM665_LIMIT_BASE + i * 8 + 6);
-		if (unlikely(val < 0))
-			goto out_unregister;
-		if (smm665_is_critical(val))
-			data->critical_max_limit[i] = smm665_convert(val, i);
-		else
-			data->alarm_max_limit[i] = smm665_convert(val, i);
-	}
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(&client->dev,
-							   client->name, data,
-							   smm665_groups);
-	if (IS_ERR(hwmon_dev)) {
-		ret = PTR_ERR(hwmon_dev);
-		goto out_unregister;
-	}
-
-	return 0;
-
-out_unregister:
-	i2c_unregister_device(data->cmdreg);
-	return ret;
-}
-
-static void smm665_remove(struct i2c_client *client)
-{
-	struct smm665_data *data = i2c_get_clientdata(client);
-
-	i2c_unregister_device(data->cmdreg);
-}
-
-static const struct i2c_device_id smm665_id[] = {
-	{"smm465", smm465},
-	{"smm665", smm665},
-	{"smm665c", smm665c},
-	{"smm764", smm764},
-	{"smm766", smm766},
-	{}
-};
-
-MODULE_DEVICE_TABLE(i2c, smm665_id);
-
-/* This is the driver that will be inserted */
-static struct i2c_driver smm665_driver = {
-	.driver = {
-		   .name = "smm665",
-		   },
-	.probe = smm665_probe,
-	.remove = smm665_remove,
-	.id_table = smm665_id,
-};
-
-module_i2c_driver(smm665_driver);
-
-MODULE_AUTHOR("Guenter Roeck");
-MODULE_DESCRIPTION("SMM665 driver");
-MODULE_LICENSE("GPL");
-- 
2.39.2

