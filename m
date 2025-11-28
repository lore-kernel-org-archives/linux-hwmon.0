Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC07C327BE6
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 12:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764333531; cv=none; b=GhIuNxADFu/ffHwNRUU7zupH1krH0PsqlNqQ/XPo3V4Ga7511G5gDYnrpv5HOn6ML/qopHqogHk52BJKILwfeD8Dtk9JibvooqRm1h6g4QXiqqm5pVBZZysKjY5B3JTLhB4dGtAN1v9tXoq70TG1K/vLRlGbqW/hGwXql7zewi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764333531; c=relaxed/simple;
	bh=/oucUdI4s6hMDaFfL69cWC2kmdkZHo8+wo/d7zs3NQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WJe96xUOuMkom7o9WscA2gQRBTzdEZqdiy4obFtIRZku9QSI+ZUu9u1eatHX36C/awxPnTtxcgx/3CXIo8mbhyjGrRRBFCUqfwTMfjVn+y7qxlzm/yRZd8HAt7Uy85F88A8XSDsA2hfpFQ0OIdDw5ZymdSlNuxJxZkCMlNWhLc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfULMyxG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfULMyxG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297dc3e299bso17810805ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 04:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764333524; x=1764938324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+gmGE0zgXdosAgPn5zQUUbQPBAhgt9HdrlUFjfdvA8k=;
        b=OfULMyxGJCjnnRtkfIsLQG3xnIOBARjYNVF2vmJ/q1ZR5CuhY+rhqoTGM0SrFWG7z5
         n4SOKS8Z6p4e29LGB3pR0yPxitVRVaEjnZdwiFpswd/7LuYo4ccogq+dvKoqDNdAA2Bm
         Qxok9JQoebCwfposwjpUDdo1t7CxJXhf2MlPFIVDIANmoibbXQC7oUSiaKB25W9PCuPo
         eVmiO3Pvy2+CVavwsKyUNJuus45PJ3si8ZEIwbgMSdCiQQvb5+3cGGU4h2vLSjfgxc8V
         evu/kiXj43n2J06QIWog+kxTLapRjbJqyP9XQamqN8r+AEkq968O0c9QlSTDJajd6kgE
         nn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764333524; x=1764938324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gmGE0zgXdosAgPn5zQUUbQPBAhgt9HdrlUFjfdvA8k=;
        b=M3uix5p5xX6DOERlAYFs5mFrWfTeFAgvWDCeK2H8ltTA6K0quFlCbgTxPEntjkha8r
         GlFvl2MIX6Zb70sHr4rPpNvY9mhmUmgHBOU+JZlgRlW5DS/4zy66tTQiqgaLD4bpHRWv
         Kwx8LFfhITA3+UJDXpxa2mjNFysYUdkxhqElU3aw3jdcOkpESjcsVoc3DP75MAbDp10P
         bn+NHGvuGz+9E71w1kD+2TN6FgeFoJrkGJafpaVhsX4hdmzhsrh1+yhC4O8AMumB7TWn
         vnVeZAdvvPJubpduCC4WyhwJB6GOD1tpFHMGpLMj1TJA7sVc1JULpVVOaeVB0J6X8gPc
         SFBg==
X-Gm-Message-State: AOJu0YwPhm4PYB1vT6r9RS4QKoHYFnQoNL8zMygTn3ybFeqwg61OdaGj
	Qy/XDBlCInaoyyaIBs674s6V6H7J2vwWYhZndjfTscAih9to89GCjG2L
X-Gm-Gg: ASbGncviREfldxMOwEDqxx0Ae18OyV4OGEXRVBTNC/Bb7J9NLMhki49T9/MWDp6AYfI
	+d4wjgpRBwFi5AVmeudvqdqK/6Wtw4NWNSrirmlFp/gswCz2jRRPX9kyGipeghrlPbzRcp6zD1g
	RjfYVGUT+UcP/yly1FiEOBOPYNArJ3qb2feUQNplk0s/TLiTpehfcUpzC81/+jRAj/91q6KDw8k
	JMUxbAeGRh3JA7WIPQwU4wPDVl/tjRSogqamvc9QwX7DSSWzXODpC4oM+8ErYcsAj3JhiWjUe2F
	DaPs+pzZgB8QpegPrxqydwPXKRj8nTUr1sK34UHo3oAmlP7s7BQYhyqN79Wix92YqaYgroxhoS8
	U0O7EfqFNhmuPJnrP/TwacwpXMYtch71N1ZiA0NWYoefn2MH+6f4d+Tk3FsE8uXwcfekPIQunnB
	JFM3WMg7sdcI+mVf/fGt0o3Zq3xE85BIMtounb7gUxAesDLcD/IGlTuWzJ+w+HVjD5/HyJ
X-Google-Smtp-Source: AGHT+IFYP75h55aKp41FxpTw5WUWy2Up5lb2YKqkFZzaSewuv7Yc1W4fIprqoqs4MCOOfVoM2+dg6w==
X-Received: by 2002:a05:7022:2487:b0:119:e56b:98a1 with SMTP id a92af1059eb24-11cb3ecc3f2mr10394654c88.8.1764333524073;
        Fri, 28 Nov 2025 04:38:44 -0800 (PST)
Received: from 2045L.localdomain (7.sub-75-221-66.myvzw.com. [75.221.66.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcae73bedsm18301241c88.0.2025.11.28.04.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 04:38:43 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hwmon: (w83l786ng) Convert macros to functions to avoid TOCTOU
Date: Fri, 28 Nov 2025 20:38:16 +0800
Message-ID: <20251128123816.3670-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macros FAN_FROM_REG and TEMP_FROM_REG evaluate their arguments
multiple times. When used in lockless contexts involving shared driver
data, this causes Time-of-Check to Time-of-Use (TOCTOU) race
conditions.

Convert the macros to static functions. This guarantees that arguments
are evaluated only once (pass-by-value), preventing the race
conditions.

Adhere to the principle of minimal changes by only converting macros
that evaluate arguments multiple times and are used in lockless
contexts.

Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Fixes: 85f03bccd6e0 ("hwmon: Add support for Winbond W83L786NG/NR")
Cc: stable@vger.kernel.org
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Based on the discussion in the link, I will submit a series of patches to
address TOCTOU issues in the hwmon subsystem by converting macros to
functions or adjusting locking where appropriate.
---
 drivers/hwmon/w83l786ng.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/w83l786ng.c b/drivers/hwmon/w83l786ng.c
index 9b81bd406e05..1d9109ca1585 100644
--- a/drivers/hwmon/w83l786ng.c
+++ b/drivers/hwmon/w83l786ng.c
@@ -76,15 +76,25 @@ FAN_TO_REG(long rpm, int div)
 	return clamp_val((1350000 + rpm * div / 2) / (rpm * div), 1, 254);
 }
 
-#define FAN_FROM_REG(val, div)	((val) == 0   ? -1 : \
-				((val) == 255 ? 0 : \
-				1350000 / ((val) * (div))))
+static int fan_from_reg(int val, int div)
+{
+	if (val == 0)
+		return -1;
+	if (val == 255)
+		return 0;
+	return 1350000 / (val * div);
+}
 
 /* for temp */
 #define TEMP_TO_REG(val)	(clamp_val(((val) < 0 ? (val) + 0x100 * 1000 \
 						      : (val)) / 1000, 0, 0xff))
-#define TEMP_FROM_REG(val)	(((val) & 0x80 ? \
-				  (val) - 0x100 : (val)) * 1000)
+
+static int temp_from_reg(int val)
+{
+	if (val & 0x80)
+		return (val - 0x100) * 1000;
+	return val * 1000;
+}
 
 /*
  * The analog voltage inputs have 8mV LSB. Since the sysfs output is
@@ -280,7 +290,7 @@ static ssize_t show_##reg(struct device *dev, struct device_attribute *attr, \
 	int nr = to_sensor_dev_attr(attr)->index; \
 	struct w83l786ng_data *data = w83l786ng_update_device(dev); \
 	return sprintf(buf, "%d\n", \
-		FAN_FROM_REG(data->reg[nr], DIV_FROM_REG(data->fan_div[nr]))); \
+		fan_from_reg(data->reg[nr], DIV_FROM_REG(data->fan_div[nr]))); \
 }
 
 show_fan_reg(fan);
@@ -347,7 +357,7 @@ store_fan_div(struct device *dev, struct device_attribute *attr,
 
 	/* Save fan_min */
 	mutex_lock(&data->update_lock);
-	min = FAN_FROM_REG(data->fan_min[nr], DIV_FROM_REG(data->fan_div[nr]));
+	min = fan_from_reg(data->fan_min[nr], DIV_FROM_REG(data->fan_div[nr]));
 
 	data->fan_div[nr] = DIV_TO_REG(val);
 
@@ -409,7 +419,7 @@ show_temp(struct device *dev, struct device_attribute *attr, char *buf)
 	int nr = sensor_attr->nr;
 	int index = sensor_attr->index;
 	struct w83l786ng_data *data = w83l786ng_update_device(dev);
-	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr][index]));
+	return sprintf(buf, "%d\n", temp_from_reg(data->temp[nr][index]));
 }
 
 static ssize_t
-- 
2.43.0

