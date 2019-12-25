Return-Path: <SRS0=HrQm=2P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65954C2D0C3
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Dec 2019 02:34:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1AD3520663
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Dec 2019 02:34:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="SI/xTMO0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfLYCeE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Dec 2019 21:34:04 -0500
Received: from mx.treblig.org ([46.43.15.161]:57992 "EHLO mx.treblig.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726258AbfLYCeD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Dec 2019 21:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
        ; s=bytemarkmx; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=fEtyHQ0F3RHOU1QY3X563qHViplbnW6MunWZwxstZSM=; b=SI/xTMO0W9wZWIfvpI1/4F31Bx
        aHYaA578mpqVuLqRt92BYhUzSLSBLEoZZjZQZS8kSXEJ8EoYjSXEFNn1DKCwEZtOmMRKbtFbEvCx0
        00aM25vusl5qPNhuIfejHi/hRm3ldVdJqz39+1UzTILDbVjSL9w8TElhvNXuMtf/4v8bvnrUvLuTl
        +F57ZYwo55oFOkRqt/CKNWmJXhIUzPqglnDahnvwvxvWNCD7z/3hpnH6bYLPdmPG/oMua/UMcPI+2
        jnY9hhX75KpauNIL6MAa5ghFeNZnMpl1VEtwQqWl7PO5Q2CT8U9yHm2L4s+wtm4qTlaMgErXOdiLB
        U7snOEoA==;
Received: from localhost ([127.0.0.1] helo=major.home.treblig.org)
        by mx.treblig.org with esmtp (Exim 4.92)
        (envelope-from <linux@treblig.org>)
        id 1ijwUj-0000lw-O8; Wed, 25 Dec 2019 02:33:53 +0000
From:   "Dr. David Alan Gilbert" <linux@treblig.org>
To:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc:     "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/3] hwmon: (w83627ehf) remove nct6775 and nct6776 support
Date:   Wed, 25 Dec 2019 02:32:23 +0000
Message-Id: <20191225023225.2785-2-linux@treblig.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191225023225.2785-1-linux@treblig.org>
References: <20191225023225.2785-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The nct6775 and nct6776 are supported by the separate nct6775.c driver,
so remove the code from the w83627ehf driver.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/hwmon/Kconfig     |   5 +-
 drivers/hwmon/w83627ehf.c | 477 ++++----------------------------------
 2 files changed, 41 insertions(+), 441 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 54e1b9cbc0b9..e6e1b1008cdd 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1915,7 +1915,7 @@ config SENSORS_W83627HF
 	  will be called w83627hf.
 
 config SENSORS_W83627EHF
-	tristate "Winbond W83627EHF/EHG/DHG/UHG, W83667HG, NCT6775F, NCT6776F"
+	tristate "Winbond W83627EHF/EHG/DHG/UHG, W83667HG"
 	depends on !PPC
 	select HWMON_VID
 	help
@@ -1928,8 +1928,7 @@ config SENSORS_W83627EHF
 	  the Core 2 Duo. And also the W83627UHG, which is a stripped down
 	  version of the W83627DHG (as far as hardware monitoring goes.)
 
-	  This driver also supports Nuvoton W83667HG, W83667HG-B, NCT6775F
-	  (also known as W83667HG-I), and NCT6776F.
+	  This driver also supports Nuvoton W83667HG and W83667HG-B.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called w83627ehf.
diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 0a13f6b971f7..47edca0ffe53 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -28,8 +28,6 @@
  *  w83627uhg    8      2       2       3      0xa230 0xc1    0x5ca3
  *  w83667hg     9      5       3       3      0xa510 0xc1    0x5ca3
  *  w83667hg-b   9      5       3       4      0xb350 0xc1    0x5ca3
- *  nct6775f     9      4       3       9      0xb470 0xc1    0x5ca3
- *  nct6776f     9      5       3       9      0xC330 0xc1    0x5ca3
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -50,7 +48,7 @@
 
 enum kinds {
 	w83627ehf, w83627dhg, w83627dhg_p, w83627uhg,
-	w83667hg, w83667hg_b, nct6775, nct6776,
+	w83667hg, w83667hg_b,
 };
 
 /* used to set data->name = w83627ehf_device_names[data->sio_kind] */
@@ -61,8 +59,6 @@ static const char * const w83627ehf_device_names[] = {
 	"w83627uhg",
 	"w83667hg",
 	"w83667hg",
-	"nct6775",
-	"nct6776",
 };
 
 static unsigned short force_id;
@@ -97,8 +93,6 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_W83627UHG_ID	0xa230
 #define SIO_W83667HG_ID		0xa510
 #define SIO_W83667HG_B_ID	0xb350
-#define SIO_NCT6775_ID		0xb470
-#define SIO_NCT6776_ID		0xc330
 #define SIO_ID_MASK		0xFFF0
 
 static inline void
@@ -187,11 +181,6 @@ static const u16 W83627EHF_REG_TEMP_CONFIG[] = { 0, 0x152, 0x252, 0 };
 #define W83627EHF_REG_DIODE		0x59
 #define W83627EHF_REG_SMI_OVT		0x4C
 
-/* NCT6775F has its own fan divider registers */
-#define NCT6775_REG_FANDIV1		0x506
-#define NCT6775_REG_FANDIV2		0x507
-#define NCT6775_REG_FAN_DEBOUNCE	0xf0
-
 #define W83627EHF_REG_ALARM1		0x459
 #define W83627EHF_REG_ALARM2		0x45A
 #define W83627EHF_REG_ALARM3		0x45B
@@ -235,28 +224,6 @@ static const u16 W83627EHF_REG_FAN_STEP_OUTPUT_W83667_B[]
 
 static const u16 W83627EHF_REG_TEMP_OFFSET[] = { 0x454, 0x455, 0x456 };
 
-static const u16 NCT6775_REG_TARGET[] = { 0x101, 0x201, 0x301 };
-static const u16 NCT6775_REG_FAN_MODE[] = { 0x102, 0x202, 0x302 };
-static const u16 NCT6775_REG_FAN_STOP_OUTPUT[] = { 0x105, 0x205, 0x305 };
-static const u16 NCT6775_REG_FAN_START_OUTPUT[] = { 0x106, 0x206, 0x306 };
-static const u16 NCT6775_REG_FAN_STOP_TIME[] = { 0x107, 0x207, 0x307 };
-static const u16 NCT6775_REG_PWM[] = { 0x109, 0x209, 0x309 };
-static const u16 NCT6775_REG_FAN_MAX_OUTPUT[] = { 0x10a, 0x20a, 0x30a };
-static const u16 NCT6775_REG_FAN_STEP_OUTPUT[] = { 0x10b, 0x20b, 0x30b };
-static const u16 NCT6775_REG_FAN[] = { 0x630, 0x632, 0x634, 0x636, 0x638 };
-static const u16 NCT6776_REG_FAN_MIN[] = { 0x63a, 0x63c, 0x63e, 0x640, 0x642};
-
-static const u16 NCT6775_REG_TEMP[]
-	= { 0x27, 0x150, 0x250, 0x73, 0x75, 0x77, 0x62b, 0x62c, 0x62d };
-static const u16 NCT6775_REG_TEMP_CONFIG[]
-	= { 0, 0x152, 0x252, 0, 0, 0, 0x628, 0x629, 0x62A };
-static const u16 NCT6775_REG_TEMP_HYST[]
-	= { 0x3a, 0x153, 0x253, 0, 0, 0, 0x673, 0x678, 0x67D };
-static const u16 NCT6775_REG_TEMP_OVER[]
-	= { 0x39, 0x155, 0x255, 0, 0, 0, 0x672, 0x677, 0x67C };
-static const u16 NCT6775_REG_TEMP_SOURCE[]
-	= { 0x621, 0x622, 0x623, 0x100, 0x200, 0x300, 0x624, 0x625, 0x626 };
-
 static const char *const w83667hg_b_temp_label[] = {
 	"SYSTIN",
 	"CPUTIN",
@@ -268,57 +235,7 @@ static const char *const w83667hg_b_temp_label[] = {
 	"PECI Agent 4"
 };
 
-static const char *const nct6775_temp_label[] = {
-	"",
-	"SYSTIN",
-	"CPUTIN",
-	"AUXTIN",
-	"AMD SB-TSI",
-	"PECI Agent 0",
-	"PECI Agent 1",
-	"PECI Agent 2",
-	"PECI Agent 3",
-	"PECI Agent 4",
-	"PECI Agent 5",
-	"PECI Agent 6",
-	"PECI Agent 7",
-	"PCH_CHIP_CPU_MAX_TEMP",
-	"PCH_CHIP_TEMP",
-	"PCH_CPU_TEMP",
-	"PCH_MCH_TEMP",
-	"PCH_DIM0_TEMP",
-	"PCH_DIM1_TEMP",
-	"PCH_DIM2_TEMP",
-	"PCH_DIM3_TEMP"
-};
-
-static const char *const nct6776_temp_label[] = {
-	"",
-	"SYSTIN",
-	"CPUTIN",
-	"AUXTIN",
-	"SMBUSMASTER 0",
-	"SMBUSMASTER 1",
-	"SMBUSMASTER 2",
-	"SMBUSMASTER 3",
-	"SMBUSMASTER 4",
-	"SMBUSMASTER 5",
-	"SMBUSMASTER 6",
-	"SMBUSMASTER 7",
-	"PECI Agent 0",
-	"PECI Agent 1",
-	"PCH_CHIP_CPU_MAX_TEMP",
-	"PCH_CHIP_TEMP",
-	"PCH_CPU_TEMP",
-	"PCH_MCH_TEMP",
-	"PCH_DIM0_TEMP",
-	"PCH_DIM1_TEMP",
-	"PCH_DIM2_TEMP",
-	"PCH_DIM3_TEMP",
-	"BYTE_TEMP"
-};
-
-#define NUM_REG_TEMP	ARRAY_SIZE(NCT6775_REG_TEMP)
+#define NUM_REG_TEMP	ARRAY_SIZE(W83627EHF_REG_TEMP)
 
 static int is_word_sized(u16 reg)
 {
@@ -358,31 +275,6 @@ static unsigned int fan_from_reg8(u16 reg, unsigned int divreg)
 	return 1350000U / (reg << divreg);
 }
 
-static unsigned int fan_from_reg13(u16 reg, unsigned int divreg)
-{
-	if ((reg & 0xff1f) == 0xff1f)
-		return 0;
-
-	reg = (reg & 0x1f) | ((reg & 0xff00) >> 3);
-
-	if (reg == 0)
-		return 0;
-
-	return 1350000U / reg;
-}
-
-static unsigned int fan_from_reg16(u16 reg, unsigned int divreg)
-{
-	if (reg == 0 || reg == 0xffff)
-		return 0;
-
-	/*
-	 * Even though the registers are 16 bit wide, the fan divisor
-	 * still applies.
-	 */
-	return 1350000U / (reg << divreg);
-}
-
 static inline unsigned int
 div_from_reg(u8 reg)
 {
@@ -584,35 +476,6 @@ static int w83627ehf_write_temp(struct w83627ehf_data *data, u16 reg,
 	return w83627ehf_write_value(data, reg, value);
 }
 
-/* This function assumes that the caller holds data->update_lock */
-static void nct6775_write_fan_div(struct w83627ehf_data *data, int nr)
-{
-	u8 reg;
-
-	switch (nr) {
-	case 0:
-		reg = (w83627ehf_read_value(data, NCT6775_REG_FANDIV1) & 0x70)
-		    | (data->fan_div[0] & 0x7);
-		w83627ehf_write_value(data, NCT6775_REG_FANDIV1, reg);
-		break;
-	case 1:
-		reg = (w83627ehf_read_value(data, NCT6775_REG_FANDIV1) & 0x7)
-		    | ((data->fan_div[1] << 4) & 0x70);
-		w83627ehf_write_value(data, NCT6775_REG_FANDIV1, reg);
-		break;
-	case 2:
-		reg = (w83627ehf_read_value(data, NCT6775_REG_FANDIV2) & 0x70)
-		    | (data->fan_div[2] & 0x7);
-		w83627ehf_write_value(data, NCT6775_REG_FANDIV2, reg);
-		break;
-	case 3:
-		reg = (w83627ehf_read_value(data, NCT6775_REG_FANDIV2) & 0x7)
-		    | ((data->fan_div[3] << 4) & 0x70);
-		w83627ehf_write_value(data, NCT6775_REG_FANDIV2, reg);
-		break;
-	}
-}
-
 /* This function assumes that the caller holds data->update_lock */
 static void w83627ehf_write_fan_div(struct w83627ehf_data *data, int nr)
 {
@@ -667,25 +530,7 @@ static void w83627ehf_write_fan_div(struct w83627ehf_data *data, int nr)
 static void w83627ehf_write_fan_div_common(struct device *dev,
 					   struct w83627ehf_data *data, int nr)
 {
-	if (data->kind == nct6776)
-		; /* no dividers, do nothing */
-	else if (data->kind == nct6775)
-		nct6775_write_fan_div(data, nr);
-	else
-		w83627ehf_write_fan_div(data, nr);
-}
-
-static void nct6775_update_fan_div(struct w83627ehf_data *data)
-{
-	u8 i;
-
-	i = w83627ehf_read_value(data, NCT6775_REG_FANDIV1);
-	data->fan_div[0] = i & 0x7;
-	data->fan_div[1] = (i & 0x70) >> 4;
-	i = w83627ehf_read_value(data, NCT6775_REG_FANDIV2);
-	data->fan_div[2] = i & 0x7;
-	if (data->has_fan & (1<<3))
-		data->fan_div[3] = (i & 0x70) >> 4;
+	w83627ehf_write_fan_div(data, nr);
 }
 
 static void w83627ehf_update_fan_div(struct w83627ehf_data *data)
@@ -716,30 +561,7 @@ static void w83627ehf_update_fan_div(struct w83627ehf_data *data)
 static void w83627ehf_update_fan_div_common(struct device *dev,
 					    struct w83627ehf_data *data)
 {
-	if (data->kind == nct6776)
-		; /* no dividers, do nothing */
-	else if (data->kind == nct6775)
-		nct6775_update_fan_div(data);
-	else
-		w83627ehf_update_fan_div(data);
-}
-
-static void nct6775_update_pwm(struct w83627ehf_data *data)
-{
-	int i;
-	int pwmcfg, fanmodecfg;
-
-	for (i = 0; i < data->pwm_num; i++) {
-		pwmcfg = w83627ehf_read_value(data,
-					      W83627EHF_REG_PWM_ENABLE[i]);
-		fanmodecfg = w83627ehf_read_value(data,
-						  NCT6775_REG_FAN_MODE[i]);
-		data->pwm_mode[i] =
-		  ((pwmcfg >> W83627EHF_PWM_MODE_SHIFT[i]) & 1) ? 0 : 1;
-		data->pwm_enable[i] = ((fanmodecfg >> 4) & 7) + 1;
-		data->tolerance[i] = fanmodecfg & 0x0f;
-		data->pwm[i] = w83627ehf_read_value(data, data->REG_PWM[i]);
-	}
+	w83627ehf_update_fan_div(data);
 }
 
 static void w83627ehf_update_pwm(struct w83627ehf_data *data)
@@ -771,18 +593,12 @@ static void w83627ehf_update_pwm(struct w83627ehf_data *data)
 static void w83627ehf_update_pwm_common(struct device *dev,
 					struct w83627ehf_data *data)
 {
-	struct w83627ehf_sio_data *sio_data = dev_get_platdata(dev);
-
-	if (sio_data->kind == nct6775 || sio_data->kind == nct6776)
-		nct6775_update_pwm(data);
-	else
-		w83627ehf_update_pwm(data);
+	w83627ehf_update_pwm(data);
 }
 
 static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
-	struct w83627ehf_sio_data *sio_data = dev_get_platdata(dev);
 	int i;
 
 	mutex_lock(&data->update_lock);
@@ -826,8 +642,7 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 			 * time
 			 */
 			if (data->has_fan_div
-			    && (reg >= 0xff || (sio_data->kind == nct6775
-						&& reg == 0x00))
+			    && reg >= 0xff
 			    && data->fan_div[i] < 0x07) {
 				dev_dbg(dev,
 					"Increasing fan%d clock divider from %u to %u\n",
@@ -1061,10 +876,6 @@ store_pwm_mode(struct device *dev, struct w83627ehf_data *data, int channel,
 	if (val < 0 || val > 1)
 		return -EINVAL;
 
-	/* On NCT67766F, DC mode is only supported for pwm1 */
-	if (data->kind == nct6776 && channel && val != 1)
-		return -EINVAL;
-
 	mutex_lock(&data->update_lock);
 	reg = w83627ehf_read_value(data, W83627EHF_REG_PWM_ENABLE[channel]);
 	data->pwm_mode[channel] = val;
@@ -1098,27 +909,15 @@ store_pwm_enable(struct device *dev, struct w83627ehf_data *data, int channel,
 	if (!val || val < 0 ||
 	    (val > 4 && val != data->pwm_enable_orig[channel]))
 		return -EINVAL;
-	/* SmartFan III mode is not supported on NCT6776F */
-	if (data->kind == nct6776 && val == 4)
-		return -EINVAL;
 
 	mutex_lock(&data->update_lock);
 	data->pwm_enable[channel] = val;
-	if (data->kind == nct6775 || data->kind == nct6776) {
-		reg = w83627ehf_read_value(data,
-					   NCT6775_REG_FAN_MODE[channel]);
-		reg &= 0x0f;
-		reg |= (val - 1) << 4;
-		w83627ehf_write_value(data,
-				      NCT6775_REG_FAN_MODE[channel], reg);
-	} else {
-		reg = w83627ehf_read_value(data,
-					   W83627EHF_REG_PWM_ENABLE[channel]);
-		reg &= ~(0x03 << W83627EHF_PWM_ENABLE_SHIFT[channel]);
-		reg |= (val - 1) << W83627EHF_PWM_ENABLE_SHIFT[channel];
-		w83627ehf_write_value(data, W83627EHF_REG_PWM_ENABLE[channel],
-				      reg);
-	}
+	reg = w83627ehf_read_value(data,
+				   W83627EHF_REG_PWM_ENABLE[channel]);
+	reg &= ~(0x03 << W83627EHF_PWM_ENABLE_SHIFT[channel]);
+	reg |= (val - 1) << W83627EHF_PWM_ENABLE_SHIFT[channel];
+	w83627ehf_write_value(data, W83627EHF_REG_PWM_ENABLE[channel],
+			      reg);
 	mutex_unlock(&data->update_lock);
 	return 0;
 }
@@ -1179,21 +978,12 @@ store_tolerance(struct device *dev, struct device_attribute *attr,
 	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 0, 15);
 
 	mutex_lock(&data->update_lock);
-	if (data->kind == nct6775 || data->kind == nct6776) {
-		/* Limit tolerance further for NCT6776F */
-		if (data->kind == nct6776 && val > 7)
-			val = 7;
-		reg = w83627ehf_read_value(data, NCT6775_REG_FAN_MODE[nr]);
+	reg = w83627ehf_read_value(data, W83627EHF_REG_TOLERANCE[nr]);
+	if (nr == 1)
+		reg = (reg & 0x0f) | (val << 4);
+	else
 		reg = (reg & 0xf0) | val;
-		w83627ehf_write_value(data, NCT6775_REG_FAN_MODE[nr], reg);
-	} else {
-		reg = w83627ehf_read_value(data, W83627EHF_REG_TOLERANCE[nr]);
-		if (nr == 1)
-			reg = (reg & 0x0f) | (val << 4);
-		else
-			reg = (reg & 0xf0) | val;
-		w83627ehf_write_value(data, W83627EHF_REG_TOLERANCE[nr], reg);
-	}
+	w83627ehf_write_value(data, W83627EHF_REG_TOLERANCE[nr], reg);
 	data->tolerance[nr] = val;
 	mutex_unlock(&data->update_lock);
 	return count;
@@ -1541,16 +1331,6 @@ static inline void w83627ehf_init_device(struct w83627ehf_data *data,
 	}
 }
 
-static void w82627ehf_swap_tempreg(struct w83627ehf_data *data,
-				   int r1, int r2)
-{
-	swap(data->temp_src[r1], data->temp_src[r2]);
-	swap(data->reg_temp[r1], data->reg_temp[r2]);
-	swap(data->reg_temp_over[r1], data->reg_temp_over[r2]);
-	swap(data->reg_temp_hyst[r1], data->reg_temp_hyst[r2]);
-	swap(data->reg_temp_config[r1], data->reg_temp_config[r2]);
-}
-
 static void
 w83627ehf_set_temp_reg_ehf(struct w83627ehf_data *data, int n_temp)
 {
@@ -1578,35 +1358,7 @@ w83627ehf_check_fan_inputs(const struct w83627ehf_sio_data *sio_data,
 	}
 
 	/* fan4 and fan5 share some pins with the GPIO and serial flash */
-	if (sio_data->kind == nct6775) {
-		/* On NCT6775, fan4 shares pins with the fdc interface */
-		fan3pin = 1;
-		fan4pin = !(superio_inb(sio_data->sioreg, 0x2A) & 0x80);
-		fan4min = 0;
-		fan5pin = 0;
-	} else if (sio_data->kind == nct6776) {
-		bool gpok = superio_inb(sio_data->sioreg, 0x27) & 0x80;
-
-		superio_select(sio_data->sioreg, W83627EHF_LD_HWM);
-		regval = superio_inb(sio_data->sioreg, SIO_REG_ENABLE);
-
-		if (regval & 0x80)
-			fan3pin = gpok;
-		else
-			fan3pin = !(superio_inb(sio_data->sioreg, 0x24) & 0x40);
-
-		if (regval & 0x40)
-			fan4pin = gpok;
-		else
-			fan4pin = !!(superio_inb(sio_data->sioreg, 0x1C) & 0x01);
-
-		if (regval & 0x20)
-			fan5pin = gpok;
-		else
-			fan5pin = !!(superio_inb(sio_data->sioreg, 0x1C) & 0x02);
-
-		fan4min = fan4pin;
-	} else if (sio_data->kind == w83667hg || sio_data->kind == w83667hg_b) {
+	if (sio_data->kind == w83667hg || sio_data->kind == w83667hg_b) {
 		fan3pin = 1;
 		fan4pin = superio_inb(sio_data->sioreg, 0x27) & 0x40;
 		fan5pin = superio_inb(sio_data->sioreg, 0x27) & 0x20;
@@ -1622,30 +1374,21 @@ w83627ehf_check_fan_inputs(const struct w83627ehf_sio_data *sio_data,
 	data->has_fan |= (fan3pin << 2);
 	data->has_fan_min |= (fan3pin << 2);
 
-	if (sio_data->kind == nct6775 || sio_data->kind == nct6776) {
-		/*
-		 * NCT6775F and NCT6776F don't have the W83627EHF_REG_FANDIV1
-		 * register
-		 */
-		data->has_fan |= (fan4pin << 3) | (fan5pin << 4);
-		data->has_fan_min |= (fan4min << 3) | (fan5pin << 4);
-	} else {
-		/*
-		 * It looks like fan4 and fan5 pins can be alternatively used
-		 * as fan on/off switches, but fan5 control is write only :/
-		 * We assume that if the serial interface is disabled, designers
-		 * connected fan5 as input unless they are emitting log 1, which
-		 * is not the default.
-		 */
-		regval = w83627ehf_read_value(data, W83627EHF_REG_FANDIV1);
-		if ((regval & (1 << 2)) && fan4pin) {
-			data->has_fan |= (1 << 3);
-			data->has_fan_min |= (1 << 3);
-		}
-		if (!(regval & (1 << 1)) && fan5pin) {
-			data->has_fan |= (1 << 4);
-			data->has_fan_min |= (1 << 4);
-		}
+	/*
+	 * It looks like fan4 and fan5 pins can be alternatively used
+	 * as fan on/off switches, but fan5 control is write only :/
+	 * We assume that if the serial interface is disabled, designers
+	 * connected fan5 as input unless they are emitting log 1, which
+	 * is not the default.
+	 */
+	regval = w83627ehf_read_value(data, W83627EHF_REG_FANDIV1);
+	if ((regval & (1 << 2)) && fan4pin) {
+		data->has_fan |= (1 << 3);
+		data->has_fan_min |= (1 << 3);
+	}
+	if (!(regval & (1 << 1)) && fan5pin) {
+		data->has_fan |= (1 << 4);
+		data->has_fan_min |= (1 << 4);
 	}
 }
 
@@ -1695,10 +1438,7 @@ w83627ehf_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		if (attr == hwmon_fan_input || attr == hwmon_fan_alarm)
 			return 0444;
 		if (attr == hwmon_fan_div) {
-			if (data->kind != nct6776)
-				return 0444;
-			else
-				return 0;
+			return 0444;
 		}
 		if (attr == hwmon_fan_min) {
 			if (data->has_fan_min & (1 << channel))
@@ -1731,8 +1471,7 @@ w83627ehf_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		break;
 
 	case hwmon_intrusion:
-		if (channel == 0 ||
-		    (channel == 1 && data->kind == nct6776))
+		if (channel == 0)
 			return 0644;
 		return 0;
 
@@ -2048,15 +1787,13 @@ static int w83627ehf_probe(struct platform_device *pdev)
 
 	/* 627EHG and 627EHF have 10 voltage inputs; 627DHG and 667HG have 9 */
 	data->in_num = (sio_data->kind == w83627ehf) ? 10 : 9;
-	/* 667HG, NCT6775F, and NCT6776F have 3 pwms, and 627UHG has only 2 */
+	/* 667HG has 3 pwms, and 627UHG has only 2 */
 	switch (sio_data->kind) {
 	default:
 		data->pwm_num = 4;
 		break;
 	case w83667hg:
 	case w83667hg_b:
-	case nct6775:
-	case nct6776:
 		data->pwm_num = 3;
 		break;
 	case w83627uhg:
@@ -2068,83 +1805,7 @@ static int w83627ehf_probe(struct platform_device *pdev)
 	data->have_temp = 0x07;
 
 	/* Deal with temperature register setup first. */
-	if (sio_data->kind == nct6775 || sio_data->kind == nct6776) {
-		int mask = 0;
-
-		/*
-		 * Display temperature sensor output only if it monitors
-		 * a source other than one already reported. Always display
-		 * first three temperature registers, though.
-		 */
-		for (i = 0; i < NUM_REG_TEMP; i++) {
-			u8 src;
-
-			data->reg_temp[i] = NCT6775_REG_TEMP[i];
-			data->reg_temp_over[i] = NCT6775_REG_TEMP_OVER[i];
-			data->reg_temp_hyst[i] = NCT6775_REG_TEMP_HYST[i];
-			data->reg_temp_config[i] = NCT6775_REG_TEMP_CONFIG[i];
-
-			src = w83627ehf_read_value(data,
-						   NCT6775_REG_TEMP_SOURCE[i]);
-			src &= 0x1f;
-			if (src && !(mask & (1 << src))) {
-				data->have_temp |= 1 << i;
-				mask |= 1 << src;
-			}
-
-			data->temp_src[i] = src;
-
-			/*
-			 * Now do some register swapping if index 0..2 don't
-			 * point to SYSTIN(1), CPUIN(2), and AUXIN(3).
-			 * Idea is to have the first three attributes
-			 * report SYSTIN, CPUIN, and AUXIN if possible
-			 * without overriding the basic system configuration.
-			 */
-			if (i > 0 && data->temp_src[0] != 1
-			    && data->temp_src[i] == 1)
-				w82627ehf_swap_tempreg(data, 0, i);
-			if (i > 1 && data->temp_src[1] != 2
-			    && data->temp_src[i] == 2)
-				w82627ehf_swap_tempreg(data, 1, i);
-			if (i > 2 && data->temp_src[2] != 3
-			    && data->temp_src[i] == 3)
-				w82627ehf_swap_tempreg(data, 2, i);
-		}
-		if (sio_data->kind == nct6776) {
-			/*
-			 * On NCT6776, AUXTIN and VIN3 pins are shared.
-			 * Only way to detect it is to check if AUXTIN is used
-			 * as a temperature source, and if that source is
-			 * enabled.
-			 *
-			 * If that is the case, disable in6, which reports VIN3.
-			 * Otherwise disable temp3.
-			 */
-			if (data->temp_src[2] == 3) {
-				u8 reg;
-
-				if (data->reg_temp_config[2])
-					reg = w83627ehf_read_value(data,
-						data->reg_temp_config[2]);
-				else
-					reg = 0; /* Assume AUXTIN is used */
-
-				if (reg & 0x01)
-					data->have_temp &= ~(1 << 2);
-				else
-					data->in6_skip = 1;
-			}
-			data->temp_label = nct6776_temp_label;
-		} else {
-			data->temp_label = nct6775_temp_label;
-		}
-		data->have_temp_offset = data->have_temp & 0x07;
-		for (i = 0; i < 3; i++) {
-			if (data->temp_src[i] > 3)
-				data->have_temp_offset &= ~(1 << i);
-		}
-	} else if (sio_data->kind == w83667hg_b) {
+	if (sio_data->kind == w83667hg_b) {
 		u8 reg;
 
 		w83627ehf_set_temp_reg_ehf(data, 4);
@@ -2254,31 +1915,7 @@ static int w83627ehf_probe(struct platform_device *pdev)
 		data->have_temp_offset = data->have_temp & 0x07;
 	}
 
-	if (sio_data->kind == nct6775) {
-		data->has_fan_div = true;
-		data->fan_from_reg = fan_from_reg16;
-		data->fan_from_reg_min = fan_from_reg8;
-		data->REG_PWM = NCT6775_REG_PWM;
-		data->REG_TARGET = NCT6775_REG_TARGET;
-		data->REG_FAN = NCT6775_REG_FAN;
-		data->REG_FAN_MIN = W83627EHF_REG_FAN_MIN;
-		data->REG_FAN_START_OUTPUT = NCT6775_REG_FAN_START_OUTPUT;
-		data->REG_FAN_STOP_OUTPUT = NCT6775_REG_FAN_STOP_OUTPUT;
-		data->REG_FAN_STOP_TIME = NCT6775_REG_FAN_STOP_TIME;
-		data->REG_FAN_MAX_OUTPUT = NCT6775_REG_FAN_MAX_OUTPUT;
-		data->REG_FAN_STEP_OUTPUT = NCT6775_REG_FAN_STEP_OUTPUT;
-	} else if (sio_data->kind == nct6776) {
-		data->has_fan_div = false;
-		data->fan_from_reg = fan_from_reg13;
-		data->fan_from_reg_min = fan_from_reg13;
-		data->REG_PWM = NCT6775_REG_PWM;
-		data->REG_TARGET = NCT6775_REG_TARGET;
-		data->REG_FAN = NCT6775_REG_FAN;
-		data->REG_FAN_MIN = NCT6776_REG_FAN_MIN;
-		data->REG_FAN_START_OUTPUT = NCT6775_REG_FAN_START_OUTPUT;
-		data->REG_FAN_STOP_OUTPUT = NCT6775_REG_FAN_STOP_OUTPUT;
-		data->REG_FAN_STOP_TIME = NCT6775_REG_FAN_STOP_TIME;
-	} else if (sio_data->kind == w83667hg_b) {
+	if (sio_data->kind == w83667hg_b) {
 		data->has_fan_div = true;
 		data->fan_from_reg = fan_from_reg8;
 		data->fan_from_reg_min = fan_from_reg8;
@@ -2326,8 +1963,7 @@ static int w83627ehf_probe(struct platform_device *pdev)
 		goto exit_release;
 
 	/* Read VID value */
-	if (sio_data->kind == w83667hg || sio_data->kind == w83667hg_b ||
-	    sio_data->kind == nct6775 || sio_data->kind == nct6776) {
+	if (sio_data->kind == w83667hg || sio_data->kind == w83667hg_b) {
 		/*
 		 * W83667HG has different pins for VID input and output, so
 		 * we can get the VID input values directly at logical device D
@@ -2376,21 +2012,6 @@ static int w83627ehf_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (fan_debounce &&
-	    (sio_data->kind == nct6775 || sio_data->kind == nct6776)) {
-		u8 tmp;
-
-		superio_select(sio_data->sioreg, W83627EHF_LD_HWM);
-		tmp = superio_inb(sio_data->sioreg, NCT6775_REG_FAN_DEBOUNCE);
-		if (sio_data->kind == nct6776)
-			superio_outb(sio_data->sioreg, NCT6775_REG_FAN_DEBOUNCE,
-				     0x3e | tmp);
-		else
-			superio_outb(sio_data->sioreg, NCT6775_REG_FAN_DEBOUNCE,
-				     0x1e | tmp);
-		pr_info("Enabled fan debounce for chip %s\n", data->name);
-	}
-
 	w83627ehf_check_fan_inputs(sio_data, data);
 
 	superio_exit(sio_data->sioreg);
@@ -2430,14 +2051,9 @@ static int w83627ehf_remove(struct platform_device *pdev)
 static int w83627ehf_suspend(struct device *dev)
 {
 	struct w83627ehf_data *data = w83627ehf_update_device(dev);
-	struct w83627ehf_sio_data *sio_data = dev_get_platdata(dev);
 
 	mutex_lock(&data->update_lock);
 	data->vbat = w83627ehf_read_value(data, W83627EHF_REG_VBAT);
-	if (sio_data->kind == nct6775) {
-		data->fandiv1 = w83627ehf_read_value(data, NCT6775_REG_FANDIV1);
-		data->fandiv2 = w83627ehf_read_value(data, NCT6775_REG_FANDIV2);
-	}
 	mutex_unlock(&data->update_lock);
 
 	return 0;
@@ -2446,7 +2062,6 @@ static int w83627ehf_suspend(struct device *dev)
 static int w83627ehf_resume(struct device *dev)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
-	struct w83627ehf_sio_data *sio_data = dev_get_platdata(dev);
 	int i;
 
 	mutex_lock(&data->update_lock);
@@ -2491,10 +2106,6 @@ static int w83627ehf_resume(struct device *dev)
 
 	/* Restore other settings */
 	w83627ehf_write_value(data, W83627EHF_REG_VBAT, data->vbat);
-	if (sio_data->kind == nct6775) {
-		w83627ehf_write_value(data, NCT6775_REG_FANDIV1, data->fandiv1);
-		w83627ehf_write_value(data, NCT6775_REG_FANDIV2, data->fandiv2);
-	}
 
 	/* Force re-reading all values */
 	data->valid = 0;
@@ -2535,8 +2146,6 @@ static int __init w83627ehf_find(int sioaddr, unsigned short *addr,
 	static const char sio_name_W83627UHG[] __initconst = "W83627UHG";
 	static const char sio_name_W83667HG[] __initconst = "W83667HG";
 	static const char sio_name_W83667HG_B[] __initconst = "W83667HG-B";
-	static const char sio_name_NCT6775[] __initconst = "NCT6775F";
-	static const char sio_name_NCT6776[] __initconst = "NCT6776F";
 
 	u16 val;
 	const char *sio_name;
@@ -2580,14 +2189,6 @@ static int __init w83627ehf_find(int sioaddr, unsigned short *addr,
 		sio_data->kind = w83667hg_b;
 		sio_name = sio_name_W83667HG_B;
 		break;
-	case SIO_NCT6775_ID:
-		sio_data->kind = nct6775;
-		sio_name = sio_name_NCT6775;
-		break;
-	case SIO_NCT6776_ID:
-		sio_data->kind = nct6776;
-		sio_name = sio_name_NCT6776;
-		break;
 	default:
 		if (val != 0xffff)
 			pr_debug("unsupported chip ID: 0x%04x\n", val);
-- 
2.24.1

