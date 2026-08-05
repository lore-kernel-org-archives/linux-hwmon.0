Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97E237204A
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 01:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785894165; cv=none; b=Y73TF3GWueQl23iIsriUwp4pQ594j9bJYveUDAFM1g6iy+de2DnoF7sWztUGesud8pZ/4NZjRko/AhiSbJIco9CCcUB1/h/olfSun/JOuOYvB02fwaPUcTqDvoo2sGtGRha243JaXgKWVtc5hRDFMW/ddxATc28UrYIqGNG0pw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785894165; c=relaxed/simple;
	bh=ekYyjbGDCMIjKTojcaxhwQ+AMRhdvTKOaGTvjM0ayMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=euiGjPxeCrXlFfNSParlLfjXyn98UiJDnp4+/rR+wiwxkfT5fX3t3xtOSMamSZ6HjTy+ukRAYC7JaJPka2q8J9cf9a2DssjXcrwgzqAiEdFY6IKoISfFR5JOpu2SQ99Y0Up1166YphX+7ao1aXkssyLEtDbUAM70rw0nIE0aVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWb4GEdq; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWb4GEdq"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso273479a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 18:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785894160; x=1786498960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WtsicDUzlvcscfC5dX4W8BMmJ9vs/CpiKg/Y+8Yj9KE=;
        b=ZWb4GEdqrrrlv0oCe5ue9ABZJ+TAXWSJ6Fkvrv6mi/rdkZ2TDVVqzNJ+aIckx1iPX9
         f6HiZXK4tDl1qCmsbQAZY1oTP2sc44yCN3OYM0HULT5VQYFkBsPUt1PvO6zOCo0HvexS
         cPnJsvzxnGlbFyDKKFEMA0Ew31wU+P7lcFan6PIjxkcgzZ7QqYhyYTupn8eNHAoWfxFf
         796t5fQzxwbMBn8tDuhgHkBGX9EkToxTVQntw88dzh7BvdUZom89DBF1qtWwOVnbKLzA
         2phMf/CBYQ3pNO9TXxcD9XaYOOycNPSryUC1+JxjRowmD6uZUEITqyqqcT8zMDfm9Mur
         G7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785894160; x=1786498960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtsicDUzlvcscfC5dX4W8BMmJ9vs/CpiKg/Y+8Yj9KE=;
        b=fD2uBgujkwfCC/l8tHcHJFdrLHFDNtV83I1kalIkwSoW0czq5x1u1rhC2CotG+CCWG
         f6doWeQhDftgMJtbfgxieIq2DexFIqeFMR/krR2fVavZb+wmp9Z/K2qX15XG3uXPiUsO
         h5vEGaHR7V/uw6hAb9Pxp641z02ukB2ESK+txGaPHPf8gm4MCqpugN03cb/F4sRfWn3C
         GM5hZVHeFjp/sM46PEXtEe5WleX6pfCe9gpeBn4BDD8L/0DfaeSsNPjbfiKz9kbLqJd1
         SUf/j1Sp2Y+qJ8cXx9LVOn9TKETzmatdG/C8nZ+/4VDTF+Wf+spMn6+nAcV/p9JUm/ke
         fFWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpJWJl3slOUo5mvr5EIRiTyXi44ln+oCuCir7enlPDJmPrCdDBOP1NHQcoovYVDYaWZSRldEs49Rud/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTcEgO7ZcPTlkumAN8206xy/30dehteQPttSPEFu4aw0ZbIva+
	xj095nDzWhFTHkHnPrOU1wJzhcpzQLdkVGUpY1tiYs0D35+R1qY+6HpZ
X-Gm-Gg: AR+sD13XS4ttlaByNtE6hFweB9sh6MvL2xcMIp0PoHgWXdidTd3MHBQ1tJXFAHfeL0N
	dVF9oDgggpkY5P3yeiLsBGVy7096DVXC/Xo5IkKZgWOBT9i8/sxAK82JFODDUC2PcE65e8CSR/7
	cgTL0DC/x5y+hRejj5oqh4rdHA74y++y70+yphACKsoyAxodDn8p+bj9DX7HlDr5TIfT9nG5nGN
	JdN9Xh1aIEQfXdj2MJesfQVfWnnMxIytzmq04PKcffE11NtPpj7YWS9EaIQS9OXMOJRiKu5lcmT
	WgL5Y0gVFg6ZvgMK+irgjTrF8Bw+6QDB2UxcqiezHdAhR60e5pn/qG7hDH32g7Iw2yvPaTBp5mp
	YJnIj6Ni14CtQcF1bJf6JvrHzZZhStcLGx1iOpFpRPw2hbKuq/+Fl7X0DEhJ8D+EWSwdTEA9UHd
	ZICSr31v8N/kTXDQFar/hJwSTQU0dzhqc85vftIlKVOp1XdUvs7a2Ll2tcWobjWaBHIjo07lY1o
	1q4FcMkpV9jKt/7EGyyxZh+iugAm4zwb4vbzkDzM1hGa9ZA3yN3ioPv/xVU
X-Received: by 2002:a05:6a00:6c95:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-84f2e022798mr3333888b3a.4.1785894160046;
        Tue, 04 Aug 2026 18:42:40 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e507c38sm333744b3a.43.2026.08.04.18.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 18:42:39 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: lee@kernel.org,
	sre@kernel.org,
	linux@roeck-us.net
Cc: patches@opensource.cirrus.com,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] mfd: wm8350: propagate ADC read timeout instead of returning 0
Date: Tue,  4 Aug 2026 19:42:21 -0600
Message-ID: <20260805014221.16412-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wm8350_read_auxadc() logs an error via dev_err() when the AUX ADC
read times out, but then falls through to return the masked value
of `result`, which was left at its initial value of 0. Callers have
no way to distinguish a genuine 0V reading from a failed read.

Return -ETIMEDOUT on timeout instead, and update the wm8350 hwmon
and power_supply drivers, which call this function directly, to
check for a negative return and propagate the error rather than
using it as a voltage value.

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/hwmon/wm8350-hwmon.c        |  9 ++++--
 drivers/mfd/wm8350-core.c           | 14 ++++++---
 drivers/power/supply/wm8350_power.c | 45 ++++++++++++++++++++++-------
 3 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/wm8350-hwmon.c b/drivers/hwmon/wm8350-hwmon.c
index 10e17bb79895..a455e1c5476c 100644
--- a/drivers/hwmon/wm8350-hwmon.c
+++ b/drivers/hwmon/wm8350-hwmon.c
@@ -23,14 +23,17 @@ static const char * const input_names[] = {
 };
 
 static ssize_t show_voltage(struct device *dev,
-			    struct device_attribute *attr, char *buf)
+			  struct device_attribute *attr, char *buf)
 {
 	struct wm8350 *wm8350 = dev_get_drvdata(dev);
 	int channel = to_sensor_dev_attr(attr)->index;
 	int val;
 
-	val = wm8350_read_auxadc(wm8350, channel, 0, 0) * WM8350_AUX_COEFF;
-	val = DIV_ROUND_CLOSEST(val, 1000);
+	val = wm8350_read_auxadc(wm8350, channel, 0, 0);
+	if (val < 0)
+		return val;
+
+	val = DIV_ROUND_CLOSEST(val * WM8350_AUX_COEFF, 1000);
 
 	return sprintf(buf, "%d\n", val);
 }
diff --git a/drivers/mfd/wm8350-core.c b/drivers/mfd/wm8350-core.c
index fbc77b218215..3120c6b8fa3f 100644
--- a/drivers/mfd/wm8350-core.c
+++ b/drivers/mfd/wm8350-core.c
@@ -188,6 +188,7 @@ EXPORT_SYMBOL_GPL(wm8350_reg_unlock);
 int wm8350_read_auxadc(struct wm8350 *wm8350, int channel, int scale, int vref)
 {
 	u16 reg, result = 0;
+	int ret = 0;
 
 	if (channel < WM8350_AUXADC_AUX1 || channel > WM8350_AUXADC_TEMP)
 		return -EINVAL;
@@ -221,19 +222,24 @@ int wm8350_read_auxadc(struct wm8350 *wm8350, int channel, int scale, int vref)
 	wait_for_completion_timeout(&wm8350->auxadc_done, msecs_to_jiffies(5));
 
 	reg = wm8350_reg_read(wm8350, WM8350_DIGITISER_CONTROL_1);
-	if (reg & WM8350_AUXADC_POLL)
+	if (reg & WM8350_AUXADC_POLL) {
 		dev_err(wm8350->dev, "adc chn %d read timeout\n", channel);
-	else
+		ret = -ETIMEDOUT;
+	} else {
 		result = wm8350_reg_read(wm8350,
-					 WM8350_AUX1_READBACK + channel);
+					WM8350_AUX1_READBACK + channel);
+	}
 
 	/* Turn off the ADC */
 	reg = wm8350_reg_read(wm8350, WM8350_POWER_MGMT_5);
 	wm8350_reg_write(wm8350, WM8350_POWER_MGMT_5,
-			 reg & ~WM8350_AUXADC_ENA);
+			reg & ~WM8350_AUXADC_ENA);
 
 	mutex_unlock(&wm8350->auxadc_mutex);
 
+	if (ret)
+		return ret;
+
 	return result & WM8350_AUXADC_DATA1_MASK;
 }
 EXPORT_SYMBOL_GPL(wm8350_read_auxadc);
diff --git a/drivers/power/supply/wm8350_power.c b/drivers/power/supply/wm8350_power.c
index b0eb6e0ce8bc..111373027905 100644
--- a/drivers/power/supply/wm8350_power.c
+++ b/drivers/power/supply/wm8350_power.c
@@ -19,20 +19,32 @@
 
 static int wm8350_read_battery_uvolts(struct wm8350 *wm8350)
 {
-	return wm8350_read_auxadc(wm8350, WM8350_AUXADC_BATT, 0, 0)
-		* WM8350_AUX_COEFF;
+	int val = wm8350_read_auxadc(wm8350, WM8350_AUXADC_BATT, 0, 0);
+
+	if (val < 0)
+		return val;
+
+	return val * WM8350_AUX_COEFF;
 }
 
 static int wm8350_read_line_uvolts(struct wm8350 *wm8350)
 {
-	return wm8350_read_auxadc(wm8350, WM8350_AUXADC_LINE, 0, 0)
-		* WM8350_AUX_COEFF;
+	int val = wm8350_read_auxadc(wm8350, WM8350_AUXADC_LINE, 0, 0);
+
+	if (val < 0)
+		return val;
+
+	return val * WM8350_AUX_COEFF;
 }
 
 static int wm8350_read_usb_uvolts(struct wm8350 *wm8350)
 {
-	return wm8350_read_auxadc(wm8350, WM8350_AUXADC_USB, 0, 0)
-		* WM8350_AUX_COEFF;
+	int val = wm8350_read_auxadc(wm8350, WM8350_AUXADC_USB, 0, 0);
+
+	if (val < 0)
+		return val;
+
+	return val * WM8350_AUX_COEFF;
 }
 
 #define WM8350_BATT_SUPPLY	1
@@ -257,7 +269,10 @@ static int wm8350_ac_get_prop(struct power_supply *psy,
 				 WM8350_LINE_SUPPLY);
 		break;
 	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
-		val->intval = wm8350_read_line_uvolts(wm8350);
+		ret = wm8350_read_line_uvolts(wm8350);
+		if (ret < 0)
+			return ret;
+		val->intval = ret;
 		break;
 	default:
 		ret = -EINVAL;
@@ -287,7 +302,10 @@ static int wm8350_usb_get_prop(struct power_supply *psy,
 				 WM8350_USB_SUPPLY);
 		break;
 	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
-		val->intval = wm8350_read_usb_uvolts(wm8350);
+		ret = wm8350_read_usb_uvolts(wm8350);
+		if (ret < 0)
+			return ret;
+		val->intval = ret;
 		break;
 	default:
 		ret = -EINVAL;
@@ -308,8 +326,12 @@ static enum power_supply_property wm8350_usb_props[] = {
 static int wm8350_bat_check_health(struct wm8350 *wm8350)
 {
 	u16 reg;
+	int uvolts = wm8350_read_battery_uvolts(wm8350);
+
+	if (uvolts < 0)
+		return POWER_SUPPLY_HEALTH_UNKNOWN;
 
-	if (wm8350_read_battery_uvolts(wm8350) < 2850000)
+	if (uvolts < 2850000)
 		return POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
 
 	reg = wm8350_reg_read(wm8350, WM8350_CHARGER_OVERRIDES);
@@ -356,7 +378,10 @@ static int wm8350_bat_get_property(struct power_supply *psy,
 				 WM8350_BATT_SUPPLY);
 		break;
 	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
-		val->intval = wm8350_read_battery_uvolts(wm8350);
+		ret = wm8350_read_battery_uvolts(wm8350);
+		if (ret < 0)
+			return ret;
+		val->intval = ret;
 		break;
 	case POWER_SUPPLY_PROP_HEALTH:
 		val->intval = wm8350_bat_check_health(wm8350);
-- 
2.55.0

