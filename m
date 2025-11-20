Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A307C2D641D
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 04:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763612027; cv=none; b=ZxcKgr+cxkeZikyWyGuB0EdeBH8ktlCB9TEJmKPc5jg395O1BSTjKmX0BtFU1r9oMicnh1nLvKkcc+Rvq8Mp/63wBwEp0ykO1CC4YRPBHmEH/FViQ8PPyhdOGZGh4Pp1UgOE9uJ0sZf9zM8hMP0qW6rX5vjnmwJE7kKxEeD5S9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763612027; c=relaxed/simple;
	bh=fFTvaxCHkwe3TWNImhqvxkbkcAX5duXv6fsZu8qXEJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BA5gVy3r7ePA6qbbxEnJaWctIlRA8KEUfb/AayMVW3GV5o9oCseHmoYtDiI1K4N8A+9rdo6CVWe1TpD8p1N/jk9Schp9enRpM/tkOkKZE4RVQR1drNQDp4+L8BCFyvoyfIG1hWMXOL5i8wlYWTLtIWpiOnHjGpulxzPSk9J4/fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOKaiRLU; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOKaiRLU"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7aab7623f42so487149b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Nov 2025 20:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763612025; x=1764216825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Pb/ET6Ol1KEYZrGqc/HU9xA8yZrF8vyNBLl5qu1OoU=;
        b=KOKaiRLUaG8Gw4TInrIlLOszNrX+CRsUKA0s9JBWRW+tflhDkqPI+Mb+NaLvMo+H0B
         Lr0sO1X7NfzeZLkc7U2Txc/aYWKSuT3GgEFat1MTSiHgBziVknwpqzc3kwtRfw1xlp+q
         wV8a3Z0K8G5F4rU7zeqhHjcR8sYNupVfmYaZpLE699bpz8B5tpQhWLncVIKHKi3tMZM0
         DEevjVC86Rg4d7GXIrCWD7OLb6LLTbVpmYergubS83XgLpGE42V6PnCr3hTDCsCZnfo1
         SRYNOEnxVEKYwP6EdZtKIb+A4s1Yyt0Zs+lULIWbMXjNFpbSkuEAitFJhEul1F6oB/Am
         pHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763612025; x=1764216825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Pb/ET6Ol1KEYZrGqc/HU9xA8yZrF8vyNBLl5qu1OoU=;
        b=ck1WPCC7eNawCfRyShU4P3mqE5sNCeb5VlnhQxOw6LoLVFljoCy7utF47YvUwG48yR
         4FEsAhiDG/sxRHxHUqeTSZP+542HyB7Z4b8xATXIsluGXKBOE701d4+QpedlBcswBij/
         2Fl/L9Sx4bAw9kFlcY7h4qWoGsFrBJgYhKcS7X19/u200oSanZAwUwDVoR/umgY+pVgw
         BjQwASlugE5y/bUul8Jy6x+7wUWe/weFLjdJ6j8cotSI0OYidDlp24Alin2EnBEHA+Q6
         PywWkF84cfGUqffCumg0f/ocJJFUC1egm/WUWTnU2vqtK0acvleQvI+e/Q6Me+lvG8ok
         b5+A==
X-Gm-Message-State: AOJu0Yw3HiMIBHwq+lq95ZYKnkv9D9P3ydIWj3u84Q/9kr6pz0bO2v4n
	/E/DkBD3jIsVf8hVnkh5o2zR4uk1j1Sh/WySVAw3cvsNTXIBHB+Z7jRM
X-Gm-Gg: ASbGncsbiI2iVpZLsjqScvxw/EHF0zKI1WvEWbulzELMJ3EDkifSlKs74Z0appa2NL3
	8MMTks4Eou2v9phWPLOEGzconjahBlqY3X/EhDOjRet/o4TOBMtPpNJFTpRB06e8Jk3uHUJXCQv
	j8iwN4ob/UxODzNR4dGTOFFBYcAfHXwqlN/DNOycEvDkoR2QYAoaIS59VjEkxAZXbbhb7pthg7/
	jEE0aBtoH8CKzKkE+G51y2TYaQ6fgnAzu27P/p1gVeR3RQ2LRHwLWVGzayFOWgrGz/8w6Mw4CIi
	7xfXoatskK3VyMLALG6HMQh+7bB5EgQd/jXg6CKoX3XXCAftJXmbze9PBL/fcnsJw1hzG1zcIZD
	F65STXfCAbmhneXpoQzWulcFF/YMJCs0og9cpYXAtGVBHODHwE6Og2BURDgwgiGM9Ly8n6/XUO6
	wHj4LUbmbYDfiBOPJ9ol8deFm5IWZDk1FWdZLuWM+GgaDuZkixt24=
X-Google-Smtp-Source: AGHT+IEbqJq4oGbb0v90QbD4tSlHOmgRzJICcxZ8RRMzvr4CvJC4X9lCSrnsAdVYzVCR4fl5KksWPg==
X-Received: by 2002:a05:6a20:5483:b0:34f:28f7:ed79 with SMTP id adf61e73a8af0-3613ca60118mr1794648637.19.1763612024737;
        Wed, 19 Nov 2025 20:13:44 -0800 (PST)
Received: from localhost.localdomain ([154.3.39.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6321sm989748a12.6.2025.11.19.20.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 20:13:44 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: juergh@proton.me,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH] hwmon: (vt1211) Convert macros to functions to avoid TOCTOU
Date: Thu, 20 Nov 2025 12:13:31 +0800
Message-Id: <20251120041331.1917570-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macros IN_FROM_REG, TEMP_FROM_REG, and RPM_FROM_REG evaluate their
arguments multiple times. These macros are used in lockless show functions
involving shared driver data, leading to Time-of-Check to Time-of-Use race
conditions.

For example, RPM_FROM_REG checks if a value is 0 or 255, and then uses it
in a division. If the value is modified by another thread to 0 after the
check but before the division, it causes a divide-by-zero error.

Convert these macros to static functions. This guarantees that arguments
are evaluated only once (pass-by-value), fixing the race conditions.
Adhere to the principle of minimal changes by only converting the specific
macros involved in these lockless contexts.

Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Based on the discussion in the link, I will submit a series of patches to
address TOCTOU issues in the hwmon subsystem by converting macros to
functions or adjusting locking where appropriate.
---
 drivers/hwmon/vt1211.c | 53 ++++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/vt1211.c b/drivers/hwmon/vt1211.c
index 386edea6b69e..1e52cabd6e24 100644
--- a/drivers/hwmon/vt1211.c
+++ b/drivers/hwmon/vt1211.c
@@ -142,9 +142,15 @@ struct vt1211_data {
  * in5 (ix = 5) is special. It's the internal 3.3V so it's scaled in the
  * driver according to the VT1211 BIOS porting guide
  */
-#define IN_FROM_REG(ix, reg)	((reg) < 3 ? 0 : (ix) == 5 ? \
-				 (((reg) - 3) * 15882 + 479) / 958 : \
-				 (((reg) - 3) * 10000 + 479) / 958)
+static int in_from_reg(int ix, int reg)
+{
+	if (reg < 3)
+		return 0;
+	if (ix == 5)
+		return ((reg - 3) * 15882 + 479) / 958;
+	return ((reg - 3) * 10000 + 479) / 958;
+}
+
 #define IN_TO_REG(ix, val)	(clamp_val((ix) == 5 ? \
 				 ((val) * 958 + 7941) / 15882 + 3 : \
 				 ((val) * 958 + 5000) / 10000 + 3, 0, 255))
@@ -156,10 +162,15 @@ struct vt1211_data {
  * temp3-7 are thermistor based so the driver returns the voltage measured at
  * the pin (range 0V - 2.2V).
  */
-#define TEMP_FROM_REG(ix, reg)	((ix) == 0 ? (reg) * 1000 : \
-				 (ix) == 1 ? (reg) < 51 ? 0 : \
-				 ((reg) - 51) * 1000 : \
-				 ((253 - (reg)) * 2200 + 105) / 210)
+static int temp_from_reg(int ix, int reg)
+{
+	if (ix == 0)
+		return reg * 1000;
+	if (ix == 1)
+		return reg < 51 ? 0 : (reg - 51) * 1000;
+	return ((253 - reg) * 2200 + 105) / 210;
+}
+
 #define TEMP_TO_REG(ix, val)	clamp_val( \
 				 ((ix) == 0 ? ((val) + 500) / 1000 : \
 				  (ix) == 1 ? ((val) + 500) / 1000 + 51 : \
@@ -167,8 +178,14 @@ struct vt1211_data {
 
 #define DIV_FROM_REG(reg)	(1 << (reg))
 
-#define RPM_FROM_REG(reg, div)	(((reg) == 0) || ((reg) == 255) ? 0 : \
-				 1310720 / (reg) / DIV_FROM_REG(div))
+static int rpm_from_reg(int reg, int div)
+{
+	if (reg == 0 || reg == 255)
+		return 0;
+
+	return 1310720 / reg / DIV_FROM_REG(div);
+}
+
 #define RPM_TO_REG(val, div)	((val) == 0 ? 255 : \
 				 clamp_val((1310720 / (val) / \
 				 DIV_FROM_REG(div)), 1, 254))
@@ -343,13 +360,13 @@ static ssize_t show_in(struct device *dev, struct device_attribute *attr,
 
 	switch (fn) {
 	case SHOW_IN_INPUT:
-		res = IN_FROM_REG(ix, data->in[ix]);
+		res = in_from_reg(ix, data->in[ix]);
 		break;
 	case SHOW_SET_IN_MIN:
-		res = IN_FROM_REG(ix, data->in_min[ix]);
+		res = in_from_reg(ix, data->in_min[ix]);
 		break;
 	case SHOW_SET_IN_MAX:
-		res = IN_FROM_REG(ix, data->in_max[ix]);
+		res = in_from_reg(ix, data->in_max[ix]);
 		break;
 	case SHOW_IN_ALARM:
 		res = (data->alarms >> bitalarmin[ix]) & 1;
@@ -417,13 +434,13 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
 
 	switch (fn) {
 	case SHOW_TEMP_INPUT:
-		res = TEMP_FROM_REG(ix, data->temp[ix]);
+		res = temp_from_reg(ix, data->temp[ix]);
 		break;
 	case SHOW_SET_TEMP_MAX:
-		res = TEMP_FROM_REG(ix, data->temp_max[ix]);
+		res = temp_from_reg(ix, data->temp_max[ix]);
 		break;
 	case SHOW_SET_TEMP_MAX_HYST:
-		res = TEMP_FROM_REG(ix, data->temp_hyst[ix]);
+		res = temp_from_reg(ix, data->temp_hyst[ix]);
 		break;
 	case SHOW_TEMP_ALARM:
 		res = (data->alarms >> bitalarmtemp[ix]) & 1;
@@ -493,10 +510,10 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
 
 	switch (fn) {
 	case SHOW_FAN_INPUT:
-		res = RPM_FROM_REG(data->fan[ix], data->fan_div[ix]);
+		res = rpm_from_reg(data->fan[ix], data->fan_div[ix]);
 		break;
 	case SHOW_SET_FAN_MIN:
-		res = RPM_FROM_REG(data->fan_min[ix], data->fan_div[ix]);
+		res = rpm_from_reg(data->fan_min[ix], data->fan_div[ix]);
 		break;
 	case SHOW_SET_FAN_DIV:
 		res = DIV_FROM_REG(data->fan_div[ix]);
@@ -751,7 +768,7 @@ static ssize_t show_pwm_auto_point_temp(struct device *dev,
 	int ix = sensor_attr_2->index;
 	int ap = sensor_attr_2->nr;
 
-	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->pwm_ctl[ix] & 7,
+	return sprintf(buf, "%d\n", temp_from_reg(data->pwm_ctl[ix] & 7,
 		       data->pwm_auto_temp[ap]));
 }
 
-- 
2.43.0

