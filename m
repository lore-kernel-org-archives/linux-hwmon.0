Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A877C433ED
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 May 2021 20:12:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42332613AA
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 May 2021 20:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbhEEUNe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 May 2021 16:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbhEEUNe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 May 2021 16:13:34 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050::465:102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0314DC061574
        for <linux-hwmon@vger.kernel.org>; Wed,  5 May 2021 13:12:36 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Fb7DK1lFGzQjxG;
        Wed,  5 May 2021 22:12:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id IdUa5jHKfWAU; Wed,  5 May 2021 22:12:26 +0200 (CEST)
From:   Bernhard Seibold <mail@bernhard-seibold.de>
Subject: [PATCH] hwmon: (nct6775) Support access via Asus WMI
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>
Message-ID: <523324cb-4e9d-c8f3-abe1-94158368aa45@bernhard-seibold.de>
Date:   Wed, 5 May 2021 22:12:25 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -0.97 / 15.00 / 15.00
X-Rspamd-Queue-Id: 46B5B1404
X-Rspamd-UID: cf62e0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Support accessing the chip via Asus WMI. This enables the driver to work
on boards where the IO region is reserved by ACPI.

Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
Tested-by: Artem S. Tashkinov <aros@gmx.com>
---
 drivers/hwmon/Kconfig   |  15 ++
 drivers/hwmon/nct6775.c | 406 ++++++++++++++++++++++++++++++----------
 2 files changed, 318 insertions(+), 103 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 54f04e61fb83..1f374ccd8f54 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1444,6 +1444,21 @@ config SENSORS_NCT6775
 	  This driver can also be built as a module. If so, the module
 	  will be called nct6775.
 
+if SENSORS_NCT6775
+
+config SENSORS_NCT6775_ASUSWMI
+	bool "Support access via Asus WMI"
+	depends on ACPI_WMI
+	default y if ACPI_WMI
+	help
+	  Support accessing the NCT677x via Asus WMI functions.
+
+	  On mainboards that support this way of accessing the chip,
+	  the driver will usually not work without this option since
+	  in these mainboards, ACPI will mark the I/O port as used.
+
+endif # SENSORS_NCT6775
+
 config SENSORS_NCT7802
 	tristate "Nuvoton NCT7802Y"
 	depends on I2C
diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 5bd15622a85f..3b26afd4ff84 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -55,6 +55,7 @@
 #include <linux/dmi.h>
 #include <linux/io.h>
 #include <linux/nospec.h>
+#include <linux/wmi.h>
 #include "lm75.h"
 
 #define USE_ALTERNATE
@@ -133,30 +134,150 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 
 enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
 
+struct nct6775_sio_data {
+	int sioreg;
+	int ld;
+	enum kinds kind;
+};
+
+#ifdef CONFIG_SENSORS_NCT6775_ASUSWMI
+
+#define ASUSWMI_MGMT2_GUID		"466747A0-70EC-11DE-8A39-0800200C9A66"
+#define ASUSWMI_METHODID_RSIO		0x5253494F
+#define ASUSWMI_METHODID_WSIO		0x5753494F
+#define ASUSWMI_METHODID_RHWM		0x5248574D
+#define ASUSWMI_METHODID_WHWM		0x5748574D
+#define ASUSWMI_UNSUPPORTED_METHOD	0xFFFFFFFE
+
+static int asuswmi_evaluate_method(u32 method_id,
+		u8 bank, u8 reg, u8 val, u32 *retval)
+{
+	u32 args = bank | (reg << 8) | (val << 16);
+	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+	union acpi_object *obj;
+	u32 tmp = 0;
+
+	status = wmi_evaluate_method(ASUSWMI_MGMT2_GUID, 0, method_id,
+				     &input, &output);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = (union acpi_object *)output.pointer;
+	if (obj && obj->type == ACPI_TYPE_INTEGER)
+		tmp = (u32) obj->integer.value;
+
+	if (retval)
+		*retval = tmp;
+
+	kfree(obj);
+
+	if (tmp == ASUSWMI_UNSUPPORTED_METHOD)
+		return -ENODEV;
+	return 0;
+}
+
+static inline int
+nct6775_asuswmi_write(u8 bank, u8 reg, u8 val)
+{
+	return asuswmi_evaluate_method(ASUSWMI_METHODID_WHWM, bank, reg, val, 0);
+}
+
+static inline int
+nct6775_asuswmi_read(u8 bank, u8 reg, u8 *val)
+{
+	int ret;
+	u32 tmp;
+
+	ret = asuswmi_evaluate_method(ASUSWMI_METHODID_RHWM, bank, reg, 0, &tmp);
+	if (val)
+		*val = tmp & 0xff;
+	return ret;
+}
+
+static inline int
+superio_wmi_inb(struct nct6775_sio_data *sio_data, int reg)
+{
+	int tmp;
+
+	asuswmi_evaluate_method(ASUSWMI_METHODID_RSIO,
+			sio_data->ld, reg, 0, &tmp);
+	return tmp;
+}
+
 static inline void
-superio_outb(int ioreg, int reg, int val)
+superio_wmi_outb(struct nct6775_sio_data *sio_data, int reg, int val)
+{
+	asuswmi_evaluate_method(ASUSWMI_METHODID_WSIO,
+			sio_data->ld, reg, val, 0);
+}
+
+static inline bool
+superio_use_asuswmi(struct nct6775_sio_data *sio_data)
 {
+	return sio_data->sioreg == 0;
+}
+
+#endif
+
+static inline void
+superio_outb(struct nct6775_sio_data *sio_data, int reg, int val)
+{
+	int ioreg = sio_data->sioreg;
+
+#ifdef CONFIG_SENSORS_NCT6775_ASUSWMI
+	if (superio_use_asuswmi(sio_data)) {
+		superio_wmi_outb(sio_data, reg, val);
+		return;
+	}
+#endif
+
 	outb(reg, ioreg);
 	outb(val, ioreg + 1);
 }
 
 static inline int
-superio_inb(int ioreg, int reg)
+superio_inb(struct nct6775_sio_data *sio_data, int reg)
 {
+	int ioreg = sio_data->sioreg;
+
+#ifdef CONFIG_SENSORS_NCT6775_ASUSWMI
+	if (superio_use_asuswmi(sio_data))
+		return superio_wmi_inb(sio_data, reg);
+#endif
+
 	outb(reg, ioreg);
 	return inb(ioreg + 1);
 }
 
 static inline void
-superio_select(int ioreg, int ld)
+superio_select(struct nct6775_sio_data *sio_data, int ld)
 {
+	int ioreg = sio_data->sioreg;
+
+#ifdef CONFIG_SENSORS_NCT6775_ASUSWMI
+	if (superio_use_asuswmi(sio_data)) {
+		sio_data->ld = ld;
+		return;
+	}
+#endif
+
 	outb(SIO_REG_LDSEL, ioreg);
 	outb(ld, ioreg + 1);
 }
 
 static inline int
-superio_enter(int ioreg)
+superio_enter(struct nct6775_sio_data *sio_data)
 {
+	int ioreg = sio_data->sioreg;
+
+#ifdef CONFIG_SENSORS_NCT6775_ASUSWMI
+	if (superio_use_asuswmi(sio_data))
+		return 0;
+#endif
+
 	/*
 	 * Try to reserve <ioreg> and <ioreg + 1> for exclusive access.
 	 */
@@ -170,8 +291,15 @@ superio_enter(int ioreg)
 }
 
 static inline void
-superio_exit(int ioreg)
+superio_exit(struct nct6775_sio_data *sio_data)
 {
+	int ioreg = sio_data->sioreg;
+
+#ifdef CONFIG_SENSORS_NCT6775_ASUSWMI
+	if (superio_use_asuswmi(sio_data))
+		return;
+#endif
+
 	outb(0xaa, ioreg);
 	outb(0x02, ioreg);
 	outb(0x02, ioreg + 1);
@@ -1217,11 +1345,6 @@ struct nct6775_data {
 	u8 sio_reg_enable;
 };
 
-struct nct6775_sio_data {
-	int sioreg;
-	enum kinds kind;
-};
-
 struct sensor_device_template {
 	struct device_attribute dev_attr;
 	union {
@@ -1407,6 +1530,15 @@ static bool is_word_sized(struct nct6775_data *data, u16 reg)
 	return false;
 }
 
+#ifdef CONFIG_SENSORS_NCT6775_ASUSWMI
+
+static bool use_asuswmi(struct nct6775_data *data)
+{
+	return (data->addr <= 0);
+}
+
+#endif
+
 /*
  * On older chips, only registers 0x50-0x5f are banked.
  * On more recent chips, all registers are banked.
@@ -1417,6 +1549,13 @@ static inline void nct6775_set_bank(struct nct6775_data *data, u16 reg)
 {
 	u8 bank = reg >> 8;
 
+#ifdef CONFIG_SENSORS_NCT6775_ASUSWMI
+	if (use_asuswmi(data)) {
+		data->bank = bank;
+		return;
+	}
+#endif
+
 	if (data->bank != bank) {
 		outb_p(NCT6775_REG_BANK, data->addr + ADDR_REG_OFFSET);
 		outb_p(bank, data->addr + DATA_REG_OFFSET);
@@ -1427,8 +1566,25 @@ static inline void nct6775_set_bank(struct nct6775_data *data, u16 reg)
 static u16 nct6775_read_value(struct nct6775_data *data, u16 reg)
 {
 	int res, word_sized = is_word_sized(data, reg);
+#ifdef CONFIG_SENSORS_NCT6775_ASUSWMI
+	u8 tmp;
+#endif
 
 	nct6775_set_bank(data, reg);
+
+#ifdef CONFIG_SENSORS_NCT6775_ASUSWMI
+	if (use_asuswmi(data)) {
+		nct6775_asuswmi_read(data->bank, reg, &tmp);
+		res = (tmp & 0xff);
+		if (word_sized) {
+			nct6775_asuswmi_read(data->bank,
+					(reg & 0xff) + 1, &tmp);
+			res = (res << 8) + (tmp & 0xff);
+		}
+		return res;
+	}
+#endif
+
 	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
 	res = inb_p(data->addr + DATA_REG_OFFSET);
 	if (word_sized) {
@@ -1444,6 +1600,23 @@ static int nct6775_write_value(struct nct6775_data *data, u16 reg, u16 value)
 	int word_sized = is_word_sized(data, reg);
 
 	nct6775_set_bank(data, reg);
+
+#ifdef CONFIG_SENSORS_NCT6775_ASUSWMI
+	if (use_asuswmi(data)) {
+		if (word_sized) {
+			nct6775_asuswmi_write(data->bank, (reg & 0xff),
+					(value >> 8) & 0xff);
+			nct6775_asuswmi_write(data->bank, (reg & 0xff) + 1,
+					value & 0xff);
+		} else {
+			nct6775_asuswmi_write(data->bank, (reg & 0xff),
+					value);
+		}
+
+		return 0;
+	}
+#endif
+
 	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
 	if (word_sized) {
 		outb_p(value >> 8, data->addr + DATA_REG_OFFSET);
@@ -3410,6 +3583,7 @@ clear_caseopen(struct device *dev, struct device_attribute *attr,
 	       const char *buf, size_t count)
 {
 	struct nct6775_data *data = dev_get_drvdata(dev);
+	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
 	int nr = to_sensor_dev_attr(attr)->index - INTRUSION_ALARM_BASE;
 	unsigned long val;
 	u8 reg;
@@ -3425,19 +3599,19 @@ clear_caseopen(struct device *dev, struct device_attribute *attr,
 	 * The CR registers are the same for all chips, and not all chips
 	 * support clearing the caseopen status through "regular" registers.
 	 */
-	ret = superio_enter(data->sioreg);
+	ret = superio_enter(sio_data);
 	if (ret) {
 		count = ret;
 		goto error;
 	}
 
-	superio_select(data->sioreg, NCT6775_LD_ACPI);
-	reg = superio_inb(data->sioreg, NCT6775_REG_CR_CASEOPEN_CLR[nr]);
+	superio_select(sio_data, NCT6775_LD_ACPI);
+	reg = superio_inb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr]);
 	reg |= NCT6775_CR_CASEOPEN_CLR_MASK[nr];
-	superio_outb(data->sioreg, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
+	superio_outb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
 	reg &= ~NCT6775_CR_CASEOPEN_CLR_MASK[nr];
-	superio_outb(data->sioreg, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
-	superio_exit(data->sioreg);
+	superio_outb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
+	superio_exit(sio_data);
 
 	data->valid = false;	/* Force cache refresh */
 error:
@@ -3542,29 +3716,29 @@ static inline void nct6775_init_device(struct nct6775_data *data)
 }
 
 static void
-nct6775_check_fan_inputs(struct nct6775_data *data)
+nct6775_check_fan_inputs(struct nct6775_data *data,
+		struct nct6775_sio_data *sio_data)
 {
 	bool fan3pin = false, fan4pin = false, fan4min = false;
 	bool fan5pin = false, fan6pin = false, fan7pin = false;
 	bool pwm3pin = false, pwm4pin = false, pwm5pin = false;
 	bool pwm6pin = false, pwm7pin = false;
-	int sioreg = data->sioreg;
 
 	/* Store SIO_REG_ENABLE for use during resume */
-	superio_select(sioreg, NCT6775_LD_HWM);
-	data->sio_reg_enable = superio_inb(sioreg, SIO_REG_ENABLE);
+	superio_select(sio_data, NCT6775_LD_HWM);
+	data->sio_reg_enable = superio_inb(sio_data, SIO_REG_ENABLE);
 
 	/* fan4 and fan5 share some pins with the GPIO and serial flash */
 	if (data->kind == nct6775) {
-		int cr2c = superio_inb(sioreg, 0x2c);
+		int cr2c = superio_inb(sio_data, 0x2c);
 
 		fan3pin = cr2c & BIT(6);
 		pwm3pin = cr2c & BIT(7);
 
 		/* On NCT6775, fan4 shares pins with the fdc interface */
-		fan4pin = !(superio_inb(sioreg, 0x2A) & 0x80);
+		fan4pin = !(superio_inb(sio_data, 0x2A) & 0x80);
 	} else if (data->kind == nct6776) {
-		bool gpok = superio_inb(sioreg, 0x27) & 0x80;
+		bool gpok = superio_inb(sio_data, 0x27) & 0x80;
 		const char *board_vendor, *board_name;
 
 		board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
@@ -3580,7 +3754,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 			if (!strcmp(board_name, "Z77 Pro4-M")) {
 				if ((data->sio_reg_enable & 0xe0) != 0xe0) {
 					data->sio_reg_enable |= 0xe0;
-					superio_outb(sioreg, SIO_REG_ENABLE,
+					superio_outb(sio_data, SIO_REG_ENABLE,
 						     data->sio_reg_enable);
 				}
 			}
@@ -3589,32 +3763,32 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		if (data->sio_reg_enable & 0x80)
 			fan3pin = gpok;
 		else
-			fan3pin = !(superio_inb(sioreg, 0x24) & 0x40);
+			fan3pin = !(superio_inb(sio_data, 0x24) & 0x40);
 
 		if (data->sio_reg_enable & 0x40)
 			fan4pin = gpok;
 		else
-			fan4pin = superio_inb(sioreg, 0x1C) & 0x01;
+			fan4pin = superio_inb(sio_data, 0x1C) & 0x01;
 
 		if (data->sio_reg_enable & 0x20)
 			fan5pin = gpok;
 		else
-			fan5pin = superio_inb(sioreg, 0x1C) & 0x02;
+			fan5pin = superio_inb(sio_data, 0x1C) & 0x02;
 
 		fan4min = fan4pin;
 		pwm3pin = fan3pin;
 	} else if (data->kind == nct6106) {
-		int cr24 = superio_inb(sioreg, 0x24);
+		int cr24 = superio_inb(sio_data, 0x24);
 
 		fan3pin = !(cr24 & 0x80);
 		pwm3pin = cr24 & 0x08;
 	} else if (data->kind == nct6116) {
-		int cr1a = superio_inb(sioreg, 0x1a);
-		int cr1b = superio_inb(sioreg, 0x1b);
-		int cr24 = superio_inb(sioreg, 0x24);
-		int cr2a = superio_inb(sioreg, 0x2a);
-		int cr2b = superio_inb(sioreg, 0x2b);
-		int cr2f = superio_inb(sioreg, 0x2f);
+		int cr1a = superio_inb(sio_data, 0x1a);
+		int cr1b = superio_inb(sio_data, 0x1b);
+		int cr24 = superio_inb(sio_data, 0x24);
+		int cr2a = superio_inb(sio_data, 0x2a);
+		int cr2b = superio_inb(sio_data, 0x2b);
+		int cr2f = superio_inb(sio_data, 0x2f);
 
 		fan3pin = !(cr2b & 0x10);
 		fan4pin = (cr2b & 0x80) ||			// pin 1(2)
@@ -3630,24 +3804,24 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
 		 * NCT6797D, NCT6798D
 		 */
-		int cr1a = superio_inb(sioreg, 0x1a);
-		int cr1b = superio_inb(sioreg, 0x1b);
-		int cr1c = superio_inb(sioreg, 0x1c);
-		int cr1d = superio_inb(sioreg, 0x1d);
-		int cr2a = superio_inb(sioreg, 0x2a);
-		int cr2b = superio_inb(sioreg, 0x2b);
-		int cr2d = superio_inb(sioreg, 0x2d);
-		int cr2f = superio_inb(sioreg, 0x2f);
+		int cr1a = superio_inb(sio_data, 0x1a);
+		int cr1b = superio_inb(sio_data, 0x1b);
+		int cr1c = superio_inb(sio_data, 0x1c);
+		int cr1d = superio_inb(sio_data, 0x1d);
+		int cr2a = superio_inb(sio_data, 0x2a);
+		int cr2b = superio_inb(sio_data, 0x2b);
+		int cr2d = superio_inb(sio_data, 0x2d);
+		int cr2f = superio_inb(sio_data, 0x2f);
 		bool dsw_en = cr2f & BIT(3);
 		bool ddr4_en = cr2f & BIT(4);
 		int cre0;
 		int creb;
 		int cred;
 
-		superio_select(sioreg, NCT6775_LD_12);
-		cre0 = superio_inb(sioreg, 0xe0);
-		creb = superio_inb(sioreg, 0xeb);
-		cred = superio_inb(sioreg, 0xed);
+		superio_select(sio_data, NCT6775_LD_12);
+		cre0 = superio_inb(sio_data, 0xe0);
+		creb = superio_inb(sio_data, 0xeb);
+		cred = superio_inb(sio_data, 0xed);
 
 		fan3pin = !(cr1c & BIT(5));
 		fan4pin = !(cr1c & BIT(6));
@@ -3806,9 +3980,10 @@ static int nct6775_probe(struct platform_device *pdev)
 	int num_attr_groups = 0;
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
-	if (!devm_request_region(&pdev->dev, res->start, IOREGION_LENGTH,
-				 DRVNAME))
-		return -EBUSY;
+	if (res)
+		if (!devm_request_region(&pdev->dev, res->start, IOREGION_LENGTH,
+					 DRVNAME))
+			return -EBUSY;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(struct nct6775_data),
 			    GFP_KERNEL);
@@ -3817,7 +3992,10 @@ static int nct6775_probe(struct platform_device *pdev)
 
 	data->kind = sio_data->kind;
 	data->sioreg = sio_data->sioreg;
-	data->addr = res->start;
+	if (res)
+		data->addr = res->start;
+	else
+		data->addr = 0;
 	mutex_init(&data->update_lock);
 	data->name = nct6775_device_names[data->kind];
 	data->bank = 0xff;		/* Force initial bank selection */
@@ -4502,11 +4680,11 @@ static int nct6775_probe(struct platform_device *pdev)
 	/* Initialize the chip */
 	nct6775_init_device(data);
 
-	err = superio_enter(sio_data->sioreg);
+	err = superio_enter(sio_data);
 	if (err)
 		return err;
 
-	cr2a = superio_inb(sio_data->sioreg, 0x2a);
+	cr2a = superio_inb(sio_data, 0x2a);
 	switch (data->kind) {
 	case nct6775:
 		data->have_vid = (cr2a & 0x40);
@@ -4532,16 +4710,16 @@ static int nct6775_probe(struct platform_device *pdev)
 	 * We can get the VID input values directly at logical device D 0xe3.
 	 */
 	if (data->have_vid) {
-		superio_select(sio_data->sioreg, NCT6775_LD_VID);
-		data->vid = superio_inb(sio_data->sioreg, 0xe3);
+		superio_select(sio_data, NCT6775_LD_VID);
+		data->vid = superio_inb(sio_data, 0xe3);
 		data->vrm = vid_which_vrm();
 	}
 
 	if (fan_debounce) {
 		u8 tmp;
 
-		superio_select(sio_data->sioreg, NCT6775_LD_HWM);
-		tmp = superio_inb(sio_data->sioreg,
+		superio_select(sio_data, NCT6775_LD_HWM);
+		tmp = superio_inb(sio_data,
 				  NCT6775_REG_CR_FAN_DEBOUNCE);
 		switch (data->kind) {
 		case nct6106:
@@ -4565,15 +4743,15 @@ static int nct6775_probe(struct platform_device *pdev)
 			tmp |= 0x7e;
 			break;
 		}
-		superio_outb(sio_data->sioreg, NCT6775_REG_CR_FAN_DEBOUNCE,
+		superio_outb(sio_data, NCT6775_REG_CR_FAN_DEBOUNCE,
 			     tmp);
 		dev_info(&pdev->dev, "Enabled fan debounce for chip %s\n",
 			 data->name);
 	}
 
-	nct6775_check_fan_inputs(data);
+	nct6775_check_fan_inputs(data, sio_data);
 
-	superio_exit(sio_data->sioreg);
+	superio_exit(sio_data);
 
 	/* Read fan clock dividers immediately */
 	nct6775_init_fan_common(dev, data);
@@ -4613,14 +4791,14 @@ static int nct6775_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
-static void nct6791_enable_io_mapping(int sioaddr)
+static void nct6791_enable_io_mapping(struct nct6775_sio_data *sio_data)
 {
 	int val;
 
-	val = superio_inb(sioaddr, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE);
+	val = superio_inb(sio_data, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE);
 	if (val & 0x10) {
 		pr_info("Enabling hardware monitor logical device mappings.\n");
-		superio_outb(sioaddr, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE,
+		superio_outb(sio_data, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE,
 			     val & ~0x10);
 	}
 }
@@ -4643,29 +4821,29 @@ static int __maybe_unused nct6775_suspend(struct device *dev)
 static int __maybe_unused nct6775_resume(struct device *dev)
 {
 	struct nct6775_data *data = dev_get_drvdata(dev);
-	int sioreg = data->sioreg;
+	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
 	int i, j, err = 0;
 	u8 reg;
 
 	mutex_lock(&data->update_lock);
 	data->bank = 0xff;		/* Force initial bank selection */
 
-	err = superio_enter(sioreg);
+	err = superio_enter(sio_data);
 	if (err)
 		goto abort;
 
-	superio_select(sioreg, NCT6775_LD_HWM);
-	reg = superio_inb(sioreg, SIO_REG_ENABLE);
+	superio_select(sio_data, NCT6775_LD_HWM);
+	reg = superio_inb(sio_data, SIO_REG_ENABLE);
 	if (reg != data->sio_reg_enable)
-		superio_outb(sioreg, SIO_REG_ENABLE, data->sio_reg_enable);
+		superio_outb(sio_data, SIO_REG_ENABLE, data->sio_reg_enable);
 
 	if (data->kind == nct6791 || data->kind == nct6792 ||
 	    data->kind == nct6793 || data->kind == nct6795 ||
 	    data->kind == nct6796 || data->kind == nct6797 ||
 	    data->kind == nct6798)
-		nct6791_enable_io_mapping(sioreg);
+		nct6791_enable_io_mapping(sio_data);
 
-	superio_exit(sioreg);
+	superio_exit(sio_data);
 
 	/* Restore limits */
 	for (i = 0; i < data->in_num; i++) {
@@ -4722,18 +4900,19 @@ static struct platform_driver nct6775_driver = {
 };
 
 /* nct6775_find() looks for a '627 in the Super-I/O config space */
-static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
+static int __init nct6775_find(struct nct6775_sio_data *sio_data)
 {
 	u16 val;
 	int err;
 	int addr;
 
-	err = superio_enter(sioaddr);
+	err = superio_enter(sio_data);
 	if (err)
 		return err;
 
-	val = (superio_inb(sioaddr, SIO_REG_DEVID) << 8) |
-		superio_inb(sioaddr, SIO_REG_DEVID + 1);
+	superio_select(sio_data, NCT6775_LD_HWM);
+	val = (superio_inb(sio_data, SIO_REG_DEVID) << 8) |
+		superio_inb(sio_data, SIO_REG_DEVID + 1);
 	if (force_id && val != 0xffff)
 		val = force_id;
 
@@ -4777,38 +4956,37 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 	default:
 		if (val != 0xffff)
 			pr_debug("unsupported chip ID: 0x%04x\n", val);
-		superio_exit(sioaddr);
+		superio_exit(sio_data);
 		return -ENODEV;
 	}
 
 	/* We have a known chip, find the HWM I/O address */
-	superio_select(sioaddr, NCT6775_LD_HWM);
-	val = (superio_inb(sioaddr, SIO_REG_ADDR) << 8)
-	    | superio_inb(sioaddr, SIO_REG_ADDR + 1);
+	superio_select(sio_data, NCT6775_LD_HWM);
+	val = (superio_inb(sio_data, SIO_REG_ADDR) << 8)
+	    | superio_inb(sio_data, SIO_REG_ADDR + 1);
 	addr = val & IOREGION_ALIGNMENT;
 	if (addr == 0) {
 		pr_err("Refusing to enable a Super-I/O device with a base I/O port 0\n");
-		superio_exit(sioaddr);
+		superio_exit(sio_data);
 		return -ENODEV;
 	}
 
 	/* Activate logical device if needed */
-	val = superio_inb(sioaddr, SIO_REG_ENABLE);
+	val = superio_inb(sio_data, SIO_REG_ENABLE);
 	if (!(val & 0x01)) {
 		pr_warn("Forcibly enabling Super-I/O. Sensor is probably unusable.\n");
-		superio_outb(sioaddr, SIO_REG_ENABLE, val | 0x01);
+		superio_outb(sio_data, SIO_REG_ENABLE, val | 0x01);
 	}
 
 	if (sio_data->kind == nct6791 || sio_data->kind == nct6792 ||
 	    sio_data->kind == nct6793 || sio_data->kind == nct6795 ||
 	    sio_data->kind == nct6796 || sio_data->kind == nct6797 ||
 	    sio_data->kind == nct6798)
-		nct6791_enable_io_mapping(sioaddr);
+		nct6791_enable_io_mapping(sio_data);
 
-	superio_exit(sioaddr);
+	superio_exit(sio_data);
 	pr_info("Found %s or compatible chip at %#x:%#x\n",
-		nct6775_sio_names[sio_data->kind], sioaddr, addr);
-	sio_data->sioreg = sioaddr;
+		nct6775_sio_names[sio_data->kind], sio_data->sioreg, addr);
 
 	return addr;
 }
@@ -4819,16 +4997,18 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
  * track of the nct6775 driver. But since we use platform_device_alloc(), we
  * must keep track of the device
  */
-static struct platform_device *pdev[2];
+static struct platform_device *pdev[3];
+
+#define NCT6775_REG_CHIPID 0x58
 
 static int __init sensors_nct6775_init(void)
 {
 	int i, err;
 	bool found = false;
 	int address;
-	struct resource res;
+	struct resource res, siores;
 	struct nct6775_sio_data sio_data;
-	int sioaddr[2] = { 0x2e, 0x4e };
+	int sioaddr[3] = { 0, 0x2e, 0x4e };
 
 	err = platform_driver_register(&nct6775_driver);
 	if (err)
@@ -4842,12 +5022,29 @@ static int __init sensors_nct6775_init(void)
 	 * nct6775 hardware monitor, and call probe()
 	 */
 	for (i = 0; i < ARRAY_SIZE(pdev); i++) {
-		address = nct6775_find(sioaddr[i], &sio_data);
+		siores.name = DRVNAME;
+		siores.start = sioaddr[i];
+		siores.end = sioaddr[i] + 1;
+		siores.flags = IORESOURCE_IO;
+		err = acpi_check_resource_conflict(&siores);
+		if (err)
+			continue;
+
+		sio_data.sioreg = sioaddr[i];
+		address = nct6775_find(&sio_data);
 		if (address <= 0)
 			continue;
 
 		found = true;
 
+#ifdef CONFIG_SENSORS_NCT6775_ASUSWMI
+		// if reading chip id via WMI succeeds, use WMI
+		if (!nct6775_asuswmi_read(0, NCT6775_REG_CHIPID, NULL)) {
+			pr_info("Using Asus WMI to access chip");
+			address = 0;
+		}
+#endif
+
 		pdev[i] = platform_device_alloc(DRVNAME, address);
 		if (!pdev[i]) {
 			err = -ENOMEM;
@@ -4859,27 +5056,30 @@ static int __init sensors_nct6775_init(void)
 		if (err)
 			goto exit_device_put;
 
-		memset(&res, 0, sizeof(res));
-		res.name = DRVNAME;
-		res.start = address + IOREGION_OFFSET;
-		res.end = address + IOREGION_OFFSET + IOREGION_LENGTH - 1;
-		res.flags = IORESOURCE_IO;
+		if (address > 0) {
+			memset(&res, 0, sizeof(res));
+			res.name = DRVNAME;
+			res.start = address + IOREGION_OFFSET;
+			res.end = address + IOREGION_OFFSET + IOREGION_LENGTH - 1;
+			res.flags = IORESOURCE_IO;
+
+			err = acpi_check_resource_conflict(&res);
+			if (err) {
+				platform_device_put(pdev[i]);
+				pdev[i] = NULL;
+				continue;
+			}
 
-		err = acpi_check_resource_conflict(&res);
-		if (err) {
-			platform_device_put(pdev[i]);
-			pdev[i] = NULL;
-			continue;
+			err = platform_device_add_resources(pdev[i], &res, 1);
+			if (err)
+				goto exit_device_put;
 		}
-
-		err = platform_device_add_resources(pdev[i], &res, 1);
-		if (err)
-			goto exit_device_put;
-
 		/* platform_device_add calls probe() */
 		err = platform_device_add(pdev[i]);
 		if (err)
 			goto exit_device_put;
+
+		break;
 	}
 	if (!found) {
 		err = -ENODEV;
-- 
2.26.3

