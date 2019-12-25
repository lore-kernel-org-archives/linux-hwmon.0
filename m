Return-Path: <SRS0=HrQm=2P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12528C2D0C3
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Dec 2019 02:34:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1577206B7
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Dec 2019 02:34:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="LeAp0G0u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfLYCeL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Dec 2019 21:34:11 -0500
Received: from mx.treblig.org ([46.43.15.161]:58000 "EHLO mx.treblig.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726258AbfLYCeL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Dec 2019 21:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
        ; s=bytemarkmx; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uQdSNhmGfcMvQyN6JZg51uLfihLfRc0O7BJ4BAJjLFY=; b=LeAp0G0u/6em9esRy95xJonoT/
        VFClML5qXeXxyLfbVWy525yPIU+E4u6+GBuCn2O229rIMN7SebkeUMdjKbP7c7y1+67cVKFV8Jiy9
        wZ88eJsQCcMCU1C1F2xIHevDovaPbvRE0Ye0cQ1bhHEu5GFIOGFaLpWC3PpSpRYrQAQqN8SaV7TpE
        hkQx2oL2OOF74jBZzyVBogC72uOisCYv/LXv9koynaEfHiQUFCgGIjxX8hZQahvionVT7s+H7xfUe
        I9yJLTaAAVVWSnSInMjJCVbZRC65YeAaxbEgoYSU62o2HzbXIOGcG0wJkZq2B35SmHb598mDy24lk
        9V2NdStg==;
Received: from localhost ([127.0.0.1] helo=major.home.treblig.org)
        by mx.treblig.org with esmtp (Exim 4.92)
        (envelope-from <linux@treblig.org>)
        id 1ijwUj-0000lw-W0; Wed, 25 Dec 2019 02:33:54 +0000
From:   "Dr. David Alan Gilbert" <linux@treblig.org>
To:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc:     "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/3] hwmon: (w83627ehf) Remove code not needed after nct677* removal
Date:   Wed, 25 Dec 2019 02:32:24 +0000
Message-Id: <20191225023225.2785-3-linux@treblig.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191225023225.2785-1-linux@treblig.org>
References: <20191225023225.2785-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Now the nct677* are gone, we can clean up some flags that are
always the same now and simplify some code.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/hwmon/w83627ehf.c | 138 +++++++++-----------------------------
 1 file changed, 32 insertions(+), 106 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 47edca0ffe53..e13bec80af0b 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -65,10 +65,6 @@ static unsigned short force_id;
 module_param(force_id, ushort, 0);
 MODULE_PARM_DESC(force_id, "Override the detected device ID");
 
-static unsigned short fan_debounce;
-module_param(fan_debounce, ushort, 0);
-MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
-
 #define DRVNAME "w83627ehf"
 
 /*
@@ -309,7 +305,6 @@ static inline u8 in_to_reg(u32 val, u8 nr, const u16 *scale_in)
 struct w83627ehf_data {
 	int addr;	/* IO base of hw monitor block */
 	const char *name;
-	enum kinds kind; /* Convenience copy of sio_data->kind */
 
 	struct mutex lock;
 
@@ -320,20 +315,10 @@ struct w83627ehf_data {
 	u8 temp_src[NUM_REG_TEMP];
 	const char * const *temp_label;
 
-	const u16 *REG_PWM;
-	const u16 *REG_TARGET;
-	const u16 *REG_FAN;
-	const u16 *REG_FAN_MIN;
-	const u16 *REG_FAN_START_OUTPUT;
-	const u16 *REG_FAN_STOP_OUTPUT;
-	const u16 *REG_FAN_STOP_TIME;
 	const u16 *REG_FAN_MAX_OUTPUT;
 	const u16 *REG_FAN_STEP_OUTPUT;
 	const u16 *scale_in;
 
-	unsigned int (*fan_from_reg)(u16 reg, unsigned int divreg);
-	unsigned int (*fan_from_reg_min)(u16 reg, unsigned int divreg);
-
 	struct mutex update_lock;
 	char valid;		/* !=0 if following fields are valid */
 	unsigned long last_updated;	/* In jiffies */
@@ -349,7 +334,6 @@ struct w83627ehf_data {
 	u8 fan_div[5];
 	u8 has_fan;		/* some fan inputs can be disabled */
 	u8 has_fan_min;		/* some fans don't have min register */
-	bool has_fan_div;
 	u8 temp_type[3];
 	s8 temp_offset[3];
 	s16 temp[9];
@@ -527,12 +511,6 @@ static void w83627ehf_write_fan_div(struct w83627ehf_data *data, int nr)
 	}
 }
 
-static void w83627ehf_write_fan_div_common(struct device *dev,
-					   struct w83627ehf_data *data, int nr)
-{
-	w83627ehf_write_fan_div(data, nr);
-}
-
 static void w83627ehf_update_fan_div(struct w83627ehf_data *data)
 {
 	int i;
@@ -558,12 +536,6 @@ static void w83627ehf_update_fan_div(struct w83627ehf_data *data)
 	}
 }
 
-static void w83627ehf_update_fan_div_common(struct device *dev,
-					    struct w83627ehf_data *data)
-{
-	w83627ehf_update_fan_div(data);
-}
-
 static void w83627ehf_update_pwm(struct w83627ehf_data *data)
 {
 	int i;
@@ -584,18 +556,12 @@ static void w83627ehf_update_pwm(struct w83627ehf_data *data)
 			((pwmcfg >> W83627EHF_PWM_MODE_SHIFT[i]) & 1) ? 0 : 1;
 		data->pwm_enable[i] = ((pwmcfg >> W83627EHF_PWM_ENABLE_SHIFT[i])
 				       & 3) + 1;
-		data->pwm[i] = w83627ehf_read_value(data, data->REG_PWM[i]);
+		data->pwm[i] = w83627ehf_read_value(data, W83627EHF_REG_PWM[i]);
 
 		data->tolerance[i] = (tolerance >> (i == 1 ? 4 : 0)) & 0x0f;
 	}
 }
 
-static void w83627ehf_update_pwm_common(struct device *dev,
-					struct w83627ehf_data *data)
-{
-	w83627ehf_update_pwm(data);
-}
-
 static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 {
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
@@ -606,7 +572,7 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 	if (time_after(jiffies, data->last_updated + HZ + HZ/2)
 	 || !data->valid) {
 		/* Fan clock dividers */
-		w83627ehf_update_fan_div_common(dev, data);
+		w83627ehf_update_fan_div(data);
 
 		/* Measured voltages and limits */
 		for (i = 0; i < data->in_num; i++) {
@@ -628,39 +594,36 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 			if (!(data->has_fan & (1 << i)))
 				continue;
 
-			reg = w83627ehf_read_value(data, data->REG_FAN[i]);
-			data->rpm[i] = data->fan_from_reg(reg,
-							  data->fan_div[i]);
+			reg = w83627ehf_read_value(data, W83627EHF_REG_FAN[i]);
+			data->rpm[i] = fan_from_reg8(reg, data->fan_div[i]);
 
 			if (data->has_fan_min & (1 << i))
 				data->fan_min[i] = w83627ehf_read_value(data,
-					   data->REG_FAN_MIN[i]);
+					   W83627EHF_REG_FAN_MIN[i]);
 
 			/*
 			 * If we failed to measure the fan speed and clock
 			 * divider can be increased, let's try that for next
 			 * time
 			 */
-			if (data->has_fan_div
-			    && reg >= 0xff
-			    && data->fan_div[i] < 0x07) {
+			if (reg >= 0xff && data->fan_div[i] < 0x07) {
 				dev_dbg(dev,
 					"Increasing fan%d clock divider from %u to %u\n",
 					i + 1, div_from_reg(data->fan_div[i]),
 					div_from_reg(data->fan_div[i] + 1));
 				data->fan_div[i]++;
-				w83627ehf_write_fan_div_common(dev, data, i);
+				w83627ehf_write_fan_div(data, i);
 				/* Preserve min limit if possible */
 				if ((data->has_fan_min & (1 << i))
 				 && data->fan_min[i] >= 2
 				 && data->fan_min[i] != 255)
 					w83627ehf_write_value(data,
-						data->REG_FAN_MIN[i],
+						W83627EHF_REG_FAN_MIN[i],
 						(data->fan_min[i] /= 2));
 			}
 		}
 
-		w83627ehf_update_pwm_common(dev, data);
+		w83627ehf_update_pwm(data);
 
 		for (i = 0; i < data->pwm_num; i++) {
 			if (!(data->has_fan & (1 << i)))
@@ -668,13 +631,13 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 
 			data->fan_start_output[i] =
 			  w83627ehf_read_value(data,
-					       data->REG_FAN_START_OUTPUT[i]);
+					     W83627EHF_REG_FAN_START_OUTPUT[i]);
 			data->fan_stop_output[i] =
 			  w83627ehf_read_value(data,
-					       data->REG_FAN_STOP_OUTPUT[i]);
+					     W83627EHF_REG_FAN_STOP_OUTPUT[i]);
 			data->fan_stop_time[i] =
 			  w83627ehf_read_value(data,
-					       data->REG_FAN_STOP_TIME[i]);
+					       W83627EHF_REG_FAN_STOP_TIME[i]);
 
 			if (data->REG_FAN_MAX_OUTPUT &&
 			    data->REG_FAN_MAX_OUTPUT[i] != 0xff)
@@ -690,7 +653,7 @@ static struct w83627ehf_data *w83627ehf_update_device(struct device *dev)
 
 			data->target_temp[i] =
 				w83627ehf_read_value(data,
-					data->REG_TARGET[i]) &
+					W83627EHF_REG_TARGET[i]) &
 					(data->pwm_mode[i] == 1 ? 0x7f : 0xff);
 		}
 
@@ -763,22 +726,6 @@ store_fan_min(struct device *dev, struct w83627ehf_data *data, int channel,
 		return -EINVAL;
 
 	mutex_lock(&data->update_lock);
-	if (!data->has_fan_div) {
-		/*
-		 * Only NCT6776F for now, so we know that this is a 13 bit
-		 * register
-		 */
-		if (!val) {
-			val = 0xff1f;
-		} else {
-			if (val > 1350000U)
-				val = 135000U;
-			val = 1350000U / val;
-			val = (val & 0x1f) | ((val << 3) & 0xff00);
-		}
-		data->fan_min[channel] = val;
-		goto done;	/* Leave fan divider alone */
-	}
 	if (!val) {
 		/* No min limit, alarm disabled */
 		data->fan_min[channel] = 255;
@@ -794,7 +741,7 @@ store_fan_min(struct device *dev, struct w83627ehf_data *data, int channel,
 		new_div = 7; /* 128 == (1 << 7) */
 		dev_warn(dev,
 			 "fan%u low limit %lu below minimum %u, set to minimum\n",
-			 channel + 1, val, data->fan_from_reg_min(254, 7));
+			 channel + 1, val, fan_from_reg8(254, 7));
 	} else if (!reg) {
 		/*
 		 * Speed above this value cannot possibly be represented,
@@ -804,7 +751,7 @@ store_fan_min(struct device *dev, struct w83627ehf_data *data, int channel,
 		new_div = 0; /* 1 == (1 << 0) */
 		dev_warn(dev,
 			 "fan%u low limit %lu above maximum %u, set to maximum\n",
-			 channel + 1, val, data->fan_from_reg_min(1, 0));
+			 channel + 1, val, fan_from_reg8(1, 0));
 	} else {
 		/*
 		 * Automatically pick the best divider, i.e. the one such
@@ -828,12 +775,12 @@ store_fan_min(struct device *dev, struct w83627ehf_data *data, int channel,
 			channel + 1, div_from_reg(data->fan_div[channel]),
 			div_from_reg(new_div));
 		data->fan_div[channel] = new_div;
-		w83627ehf_write_fan_div_common(dev, data, channel);
+		w83627ehf_write_fan_div(data, channel);
 		/* Give the chip time to sample a new speed value */
 		data->last_updated = jiffies;
 	}
-done:
-	w83627ehf_write_value(data, data->REG_FAN_MIN[channel],
+
+	w83627ehf_write_value(data, W83627EHF_REG_FAN_MIN[channel],
 			      data->fan_min[channel]);
 	mutex_unlock(&data->update_lock);
 
@@ -895,7 +842,7 @@ store_pwm(struct device *dev, struct w83627ehf_data *data, int channel,
 
 	mutex_lock(&data->update_lock);
 	data->pwm[channel] = val;
-	w83627ehf_write_value(data, data->REG_PWM[channel], val);
+	w83627ehf_write_value(data, W83627EHF_REG_PWM[channel], val);
 	mutex_unlock(&data->update_lock);
 	return 0;
 }
@@ -954,7 +901,7 @@ store_target_temp(struct device *dev, struct device_attribute *attr,
 
 	mutex_lock(&data->update_lock);
 	data->target_temp[nr] = val;
-	w83627ehf_write_value(data, data->REG_TARGET[nr], val);
+	w83627ehf_write_value(data, W83627EHF_REG_TARGET[nr], val);
 	mutex_unlock(&data->update_lock);
 	return count;
 }
@@ -1035,15 +982,15 @@ store_##reg(struct device *dev, struct device_attribute *attr, \
 	val = clamp_val(val, 1, 255); \
 	mutex_lock(&data->update_lock); \
 	data->reg[nr] = val; \
-	w83627ehf_write_value(data, data->REG_##REG[nr], val); \
+	w83627ehf_write_value(data, REG[nr], val); \
 	mutex_unlock(&data->update_lock); \
 	return count; \
 }
 
-fan_functions(fan_start_output, FAN_START_OUTPUT)
-fan_functions(fan_stop_output, FAN_STOP_OUTPUT)
-fan_functions(fan_max_output, FAN_MAX_OUTPUT)
-fan_functions(fan_step_output, FAN_STEP_OUTPUT)
+fan_functions(fan_start_output, W83627EHF_REG_FAN_START_OUTPUT)
+fan_functions(fan_stop_output, W83627EHF_REG_FAN_STOP_OUTPUT)
+fan_functions(fan_max_output, data->REG_FAN_MAX_OUTPUT)
+fan_functions(fan_step_output, data->REG_FAN_STEP_OUTPUT)
 
 #define fan_time_functions(reg, REG) \
 static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
@@ -1074,12 +1021,12 @@ store_##reg(struct device *dev, struct device_attribute *attr, \
 	val = step_time_to_reg(val, data->pwm_mode[nr]); \
 	mutex_lock(&data->update_lock); \
 	data->reg[nr] = val; \
-	w83627ehf_write_value(data, data->REG_##REG[nr], val); \
+	w83627ehf_write_value(data, REG[nr], val); \
 	mutex_unlock(&data->update_lock); \
 	return count; \
 } \
 
-fan_time_functions(fan_stop_time, FAN_STOP_TIME)
+fan_time_functions(fan_stop_time, W83627EHF_REG_FAN_STOP_TIME)
 
 static SENSOR_DEVICE_ATTR(pwm4_stop_time, 0644, show_fan_stop_time,
 	    store_fan_stop_time, 3);
@@ -1555,8 +1502,8 @@ w83627ehf_do_read_fan(struct w83627ehf_data *data, u32 attr,
 		*val = data->rpm[channel];
 		return 0;
 	case hwmon_fan_min:
-		*val = data->fan_from_reg_min(data->fan_min[channel],
-					      data->fan_div[channel]);
+		*val = fan_from_reg8(data->fan_min[channel],
+				     data->fan_div[channel]);
 		return 0;
 	case hwmon_fan_div:
 		*val = div_from_reg(data->fan_div[channel]);
@@ -1781,7 +1728,6 @@ static int w83627ehf_probe(struct platform_device *pdev)
 	mutex_init(&data->lock);
 	mutex_init(&data->update_lock);
 	data->name = w83627ehf_device_names[sio_data->kind];
-	data->kind = sio_data->kind;
 	data->bank = 0xff;		/* Force initial bank selection */
 	platform_set_drvdata(pdev, data);
 
@@ -1916,31 +1862,11 @@ static int w83627ehf_probe(struct platform_device *pdev)
 	}
 
 	if (sio_data->kind == w83667hg_b) {
-		data->has_fan_div = true;
-		data->fan_from_reg = fan_from_reg8;
-		data->fan_from_reg_min = fan_from_reg8;
-		data->REG_PWM = W83627EHF_REG_PWM;
-		data->REG_TARGET = W83627EHF_REG_TARGET;
-		data->REG_FAN = W83627EHF_REG_FAN;
-		data->REG_FAN_MIN = W83627EHF_REG_FAN_MIN;
-		data->REG_FAN_START_OUTPUT = W83627EHF_REG_FAN_START_OUTPUT;
-		data->REG_FAN_STOP_OUTPUT = W83627EHF_REG_FAN_STOP_OUTPUT;
-		data->REG_FAN_STOP_TIME = W83627EHF_REG_FAN_STOP_TIME;
 		data->REG_FAN_MAX_OUTPUT =
 		  W83627EHF_REG_FAN_MAX_OUTPUT_W83667_B;
 		data->REG_FAN_STEP_OUTPUT =
 		  W83627EHF_REG_FAN_STEP_OUTPUT_W83667_B;
 	} else {
-		data->has_fan_div = true;
-		data->fan_from_reg = fan_from_reg8;
-		data->fan_from_reg_min = fan_from_reg8;
-		data->REG_PWM = W83627EHF_REG_PWM;
-		data->REG_TARGET = W83627EHF_REG_TARGET;
-		data->REG_FAN = W83627EHF_REG_FAN;
-		data->REG_FAN_MIN = W83627EHF_REG_FAN_MIN;
-		data->REG_FAN_START_OUTPUT = W83627EHF_REG_FAN_START_OUTPUT;
-		data->REG_FAN_STOP_OUTPUT = W83627EHF_REG_FAN_STOP_OUTPUT;
-		data->REG_FAN_STOP_TIME = W83627EHF_REG_FAN_STOP_TIME;
 		data->REG_FAN_MAX_OUTPUT =
 		  W83627EHF_REG_FAN_MAX_OUTPUT_COMMON;
 		data->REG_FAN_STEP_OUTPUT =
@@ -2017,10 +1943,10 @@ static int w83627ehf_probe(struct platform_device *pdev)
 	superio_exit(sio_data->sioreg);
 
 	/* Read fan clock dividers immediately */
-	w83627ehf_update_fan_div_common(dev, data);
+	w83627ehf_update_fan_div(data);
 
 	/* Read pwm data to save original values */
-	w83627ehf_update_pwm_common(dev, data);
+	w83627ehf_update_pwm(data);
 	for (i = 0; i < data->pwm_num; i++)
 		data->pwm_enable_orig[i] = data->pwm_enable[i];
 
@@ -2082,7 +2008,7 @@ static int w83627ehf_resume(struct device *dev)
 		if (!(data->has_fan_min & (1 << i)))
 			continue;
 
-		w83627ehf_write_value(data, data->REG_FAN_MIN[i],
+		w83627ehf_write_value(data, W83627EHF_REG_FAN_MIN[i],
 				      data->fan_min[i]);
 	}
 
-- 
2.24.1

