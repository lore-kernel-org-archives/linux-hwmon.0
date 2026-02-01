Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B02B2BDC32
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Feb 2026 20:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769977684; cv=none; b=er2zIznmh1fGTyJZ3PtCheJLqR/rWlEAa7nvZ1g9tQFN22VOWhtF75wVaU7LqG43lv4QujavcfzjVFoCZQGM2hxmhmjrSTLlQ0GF5GVe81KWk4LPMFQde7DCdezZyqfqaIgrE7n2YEpjkxtxQg9Rz1NoJ+1rL4omMy5pF5qdvgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769977684; c=relaxed/simple;
	bh=vGh2EPOtSs3uU0tbQrc/ahmxI1I2LdwJf2L25JyD/RI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=luptBV509JTXIEuw+UxP8NNODHFmBg6z8GI2/VZPiXz3/aAAVpJWXZW+VeUbZA4sBAs8ypu6xsedYdGzh9jBe/dBcHSOI0rcTC1lannve8or21tugVxuUvN+L4+nScSXTQaSRTs4KL0RnHV0JFcTXoYCK78LX+QmgA7DTCVuwR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SX2WnnjQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SX2WnnjQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801bc32725so27579345e9.0
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Feb 2026 12:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769977680; x=1770582480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mt6GFrnIpDmVr1ned31GEivSS//BmzvPiSdNE5r52ro=;
        b=SX2WnnjQyN2F3jN+q8s9U0qkMfmWAj3PBBiVhrgACJ3FJkU37oXtQoxEioamtmrhYA
         2xzl3cqtgQycwPzI+YcZsfHlhIeZrWE1R9qywvNGVFXl3mtbhYbNKVWjrAYAi86LBqXf
         UNtiTmyXjAvrwemvVgVor/brIukZnrvbdYulghxKQR+QuTBG3jkaDfcUyfoDUMPhkbhO
         CcIlRGMKj8/w9FFtr2DyK0aCW/TgcifKdhB4obYMHK39noCfBAUUuVQAicnR+yVP9jWU
         Br95URDInd8xiBt/rhc63SKA1vBl0QljV+NJP1H7Mul8zj6BwZKM7LyWw+wJQRBojElO
         SUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769977680; x=1770582480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mt6GFrnIpDmVr1ned31GEivSS//BmzvPiSdNE5r52ro=;
        b=TzMz8Q1LHlPoMEaAI3ebfeiXlJClWmOG9ibXLgCxP4Iz6Hu+MiRHlxIIvJqmj757tT
         0B2FU475XeXuMhHaM+w2hDZjfEaQlK36UnyrCY4UqpI72RqZMx/XkiTOnlbVKXmcrC0R
         dA6nJAz3YbeXIoYASN3hQrC7tKj3791tguHYIxGy7HC1yTXqKZC/h/83qxjMSlkFTdR2
         0htPyneVO3f7NzkqomVWOWtjgyHgMJim4WbLC/43z5Dc7sOp1GDNN1J1Oa7o6J53NhqY
         8OH3rWlk1HxOgKiYpK8QWjg6CnGoSL7CvyaimX5qoCM5KkafuOVvSfZePKgyO4aFV+X0
         0Ciw==
X-Gm-Message-State: AOJu0YyMJxvoN2E8ZL9nqQDrATVQeEbjMmdOZo3RcMyU6Ww/ySN4/0CQ
	nJNkh1MK5GrnumCIj4acJTNBIJFM+hS/b2lOfgIzFAoT4JtMzKoW6B+E
X-Gm-Gg: AZuq6aJzzOcxrjFBWAUS1bhWZXgO2TlskVVoPL16cygMAo/e9HlM+eTAcVCbFNhDCd5
	e+mn2HV1gI/FbFh1uRpsMRWxdVSrcZbIrbf0tEtDYc4PtUf6pVBmpDJmVB+p/y7LQDtJXI4XoO9
	bKj+3mfzLzWJXNrPetHIqbFyRvJGJdIqz8E5lNu9xAkAOCCF7eLuLkmUUs5ClBAc0gRXylCsnTA
	/elDJlPyZwRLtZ2CuEGF29zK6d9oRbzQZQxJLuz1yEMLeG8zW7R8sWUT4j+6Ju1vKNmWtKwGIC7
	JMVzygaV5zHBd3GrpicewHPWjXmYyxJV9+Pa6cOeDVkBViES2TvI5mMDENZIdU+xkqmW8XnXMDy
	n0SP7rCScgngXUT0BeM8r9BGx97jacDGLR07P5b+RgMNrFvTrK9x3kGdb42D3kcw5zUkVMggsb7
	nRgUhu1g2ONtkXYljSocQ60dg=
X-Received: by 2002:a05:600c:3b23:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-482db4a01edmr137237275e9.31.1769977680270;
        Sun, 01 Feb 2026 12:28:00 -0800 (PST)
Received: from fedora ([146.70.134.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cf16sm38799073f8f.22.2026.02.01.12.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 12:27:59 -0800 (PST)
From: =?UTF-8?q?Filippo=20Muscher=C3=A0?= <filippo.muschera@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Filippo=20Muscher=C3=A0?= <filippo.muschera@gmail.com>
Subject: [PATCH] hwmon: (nct6775) use sysfs_emit instead of sprintf
Date: Sun,  1 Feb 2026 21:27:21 +0100
Message-ID: <20260201202721.3871-1-filippo.muschera@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in sysfs 'show' functions.
sysfs_emit() is preferred because it automatically handles the
buffer size and PAGE_SIZE boundary checks, preventing potential
buffer overflows.

This aligns the legacy code with the new functions in the driver
that already utilize sysfs_emit.

Signed-off-by: Filippo Muscherà <filippo.muschera@gmail.com>
---
 drivers/hwmon/nct6775-core.c | 70 ++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 79bc67ffb998..d668dc390def 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -1721,8 +1721,8 @@ show_in_reg(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%ld\n",
-		       in_from_reg(data->in[nr][index], nr, data->scale_in));
+	return sysfs_emit(buf, "%ld\n",
+			  in_from_reg(data->in[nr][index], nr, data->scale_in));
 }
 
 static ssize_t
@@ -1757,8 +1757,8 @@ nct6775_show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
 		return PTR_ERR(data);
 
 	nr = data->ALARM_BITS[sattr->index];
-	return sprintf(buf, "%u\n",
-		       (unsigned int)((data->alarms >> nr) & 0x01));
+	return sysfs_emit(buf, "%u\n",
+			  (unsigned int)((data->alarms >> nr) & 0x01));
 }
 EXPORT_SYMBOL_GPL(nct6775_show_alarm);
 
@@ -1800,7 +1800,7 @@ show_temp_alarm(struct device *dev, struct device_attribute *attr, char *buf)
 
 		alarm = (data->alarms >> bit) & 0x01;
 	}
-	return sprintf(buf, "%u\n", alarm);
+	return sysfs_emit(buf, "%u\n", alarm);
 }
 
 ssize_t
@@ -1815,8 +1815,8 @@ nct6775_show_beep(struct device *dev, struct device_attribute *attr, char *buf)
 
 	nr = data->BEEP_BITS[sattr->index];
 
-	return sprintf(buf, "%u\n",
-		       (unsigned int)((data->beeps >> nr) & 0x01));
+	return sysfs_emit(buf, "%u\n",
+			  (unsigned int)((data->beeps >> nr) & 0x01));
 }
 EXPORT_SYMBOL_GPL(nct6775_show_beep);
 
@@ -1870,7 +1870,7 @@ show_temp_beep(struct device *dev, struct device_attribute *attr, char *buf)
 
 		beep = (data->beeps >> bit) & 0x01;
 	}
-	return sprintf(buf, "%u\n", beep);
+	return sysfs_emit(buf, "%u\n", beep);
 }
 
 static ssize_t
@@ -1960,7 +1960,7 @@ show_fan(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n", data->rpm[nr]);
+	return sysfs_emit(buf, "%d\n", data->rpm[nr]);
 }
 
 static ssize_t
@@ -1973,9 +1973,9 @@ show_fan_min(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n",
-		       data->fan_from_reg_min(data->fan_min[nr],
-					      data->fan_div[nr]));
+	return sysfs_emit(buf, "%d\n",
+			  data->fan_from_reg_min(data->fan_min[nr],
+						 data->fan_div[nr]));
 }
 
 static ssize_t
@@ -1988,7 +1988,7 @@ show_fan_div(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%u\n", div_from_reg(data->fan_div[nr]));
+	return sysfs_emit(buf, "%u\n", div_from_reg(data->fan_div[nr]));
 }
 
 static ssize_t
@@ -2098,7 +2098,7 @@ show_fan_pulses(struct device *dev, struct device_attribute *attr, char *buf)
 		return PTR_ERR(data);
 
 	p = data->fan_pulses[sattr->index];
-	return sprintf(buf, "%d\n", p ? : 4);
+	return sysfs_emit(buf, "%d\n", p ? : 4);
 }
 
 static ssize_t
@@ -2197,7 +2197,7 @@ show_temp_label(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%s\n", data->temp_label[data->temp_src[nr]]);
+	return sysfs_emit(buf, "%s\n", data->temp_label[data->temp_src[nr]]);
 }
 
 static ssize_t
@@ -2211,7 +2211,8 @@ show_temp(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n", LM75_TEMP_FROM_REG(data->temp[index][nr]));
+	return sysfs_emit(buf, "%d\n",
+			  LM75_TEMP_FROM_REG(data->temp[index][nr]));
 }
 
 static ssize_t
@@ -2245,7 +2246,7 @@ show_temp_offset(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n", data->temp_offset[sattr->index] * 1000);
+	return sysfs_emit(buf, "%d\n", data->temp_offset[sattr->index] * 1000);
 }
 
 static ssize_t
@@ -2282,7 +2283,7 @@ show_temp_type(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n", (int)data->temp_type[nr]);
+	return sysfs_emit(buf, "%d\n", (int)data->temp_type[nr]);
 }
 
 static ssize_t
@@ -2468,7 +2469,7 @@ show_pwm_mode(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n", data->pwm_mode[sattr->index]);
+	return sysfs_emit(buf, "%d\n", data->pwm_mode[sattr->index]);
 }
 
 static ssize_t
@@ -2535,7 +2536,7 @@ show_pwm(struct device *dev, struct device_attribute *attr, char *buf)
 		pwm = data->pwm[index][nr];
 	}
 
-	return sprintf(buf, "%d\n", pwm);
+	return sysfs_emit(buf, "%d\n", pwm);
 }
 
 static ssize_t
@@ -2667,7 +2668,7 @@ show_pwm_enable(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n", data->pwm_enable[sattr->index]);
+	return sysfs_emit(buf, "%d\n", data->pwm_enable[sattr->index]);
 }
 
 static ssize_t
@@ -2736,7 +2737,7 @@ show_pwm_temp_sel_common(struct nct6775_data *data, char *buf, int src)
 		}
 	}
 
-	return sprintf(buf, "%d\n", sel);
+	return sysfs_emit(buf, "%d\n", sel);
 }
 
 static ssize_t
@@ -2861,7 +2862,7 @@ show_target_temp(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n", data->target_temp[sattr->index] * 1000);
+	return sysfs_emit(buf, "%d\n", data->target_temp[sattr->index] * 1000);
 }
 
 static ssize_t
@@ -2897,9 +2898,9 @@ show_target_speed(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n",
-		       fan_from_reg16(data->target_speed[nr],
-				      data->fan_div[nr]));
+	return sysfs_emit(buf, "%d\n",
+			  fan_from_reg16(data->target_speed[nr],
+					 data->fan_div[nr]));
 }
 
 static ssize_t
@@ -2939,7 +2940,7 @@ show_temp_tolerance(struct device *dev, struct device_attribute *attr,
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n", data->temp_tolerance[index][nr] * 1000);
+	return sysfs_emit(buf, "%d\n", data->temp_tolerance[index][nr] * 1000);
 }
 
 static ssize_t
@@ -3006,7 +3007,7 @@ show_speed_tolerance(struct device *dev, struct device_attribute *attr,
 			     - fan_from_reg16(high, data->fan_div[nr])) / 2;
 	}
 
-	return sprintf(buf, "%d\n", tolerance);
+	return sysfs_emit(buf, "%d\n", tolerance);
 }
 
 static ssize_t
@@ -3066,7 +3067,7 @@ show_weight_temp(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n", data->weight_temp[index][nr] * 1000);
+	return sysfs_emit(buf, "%d\n", data->weight_temp[index][nr] * 1000);
 }
 
 static ssize_t
@@ -3115,9 +3116,9 @@ show_fan_time(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n",
-		       step_time_from_reg(data->fan_time[index][nr],
-					  data->pwm_mode[nr]));
+	return sysfs_emit(buf, "%d\n",
+			  step_time_from_reg(data->fan_time[index][nr],
+					     data->pwm_mode[nr]));
 }
 
 static ssize_t
@@ -3152,7 +3153,8 @@ show_auto_pwm(struct device *dev, struct device_attribute *attr, char *buf)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n", data->auto_pwm[sattr->nr][sattr->index]);
+	return sysfs_emit(buf, "%d\n",
+			  data->auto_pwm[sattr->nr][sattr->index]);
 }
 
 static ssize_t
@@ -3244,7 +3246,7 @@ show_auto_temp(struct device *dev, struct device_attribute *attr, char *buf)
 	 * We don't know for sure if the temperature is signed or unsigned.
 	 * Assume it is unsigned.
 	 */
-	return sprintf(buf, "%d\n", data->auto_temp[nr][point] * 1000);
+	return sysfs_emit(buf, "%d\n", data->auto_temp[nr][point] * 1000);
 }
 
 static ssize_t
-- 
2.52.0

