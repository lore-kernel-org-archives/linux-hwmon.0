Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6586C3233ED
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764157130; cv=none; b=noHLuAnKKRFIsTfizgUbFCuQ+G1MaRD+2PF7YcnkxC9OQ7GcL0aPg/BH1NqhrebqateA5dbofGuygSVkL/MO75DLj0k5MDPRNMMH1uZd99/OmmovvGcGtiB76TUTV9nqx5rpovJxmdeOdBryl/bTIDJiresbY7YfGagAuJ9fCbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764157130; c=relaxed/simple;
	bh=ui/YOsXzrX8cyfCbmF+r8+AOfEjRvMX/07F09KIqgyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ItWRUs81f8udekpW5xlTVEqYOXZKT/fffxaLLmyDzq3syObc1dUIwb0ibEI0jrgmZH+v8IF1pYawYGYWm6QLF/A7M78OgGwQtTEYfubL4ZA3ymJYd9M8Fr0/wEQFsulyNC+4pKOsdYLh1NIbX+3VjFhCqthsRJV97/v3P8NfPlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FW3pmSRw; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FW3pmSRw"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo7828269b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 03:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764157123; x=1764761923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOi2WEBkFdFa7VsGEA+18NFkgGtbS2j7+UJmehxcAHQ=;
        b=FW3pmSRwNG8AnaCGpOWwGQaVkh/n29s28HOKdGLPkFJO6pr8zj1dEtviEDNDt2c4xE
         c4tP+wJMEGp5F8MUE0d17cb7USubi6/sTsqHG1s9yR1R2rkjg4/F+dpTwSr2Q3+fgKLU
         Ki2Y20A19xUtI+eHPkp4Fk7GSUJq2HdRJZebm5iWq2oKe0uZCSRwGm1ipzsCbROLx9oD
         TIlR4E/3k5zIvaX5l/6loCYQjkRtJs+PwsEAZKExWIHw3HU7jrrtg2OiKeUGssaepUA2
         Ixhb1XeiV0B+bbLjlUVz5qCQRY+M9BWOBuxJkzA3ePLy1dLep0eH4vflHFWCyaRSR623
         2xVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764157123; x=1764761923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOi2WEBkFdFa7VsGEA+18NFkgGtbS2j7+UJmehxcAHQ=;
        b=d0TIPeYoZKRm+zgK4fzF4qfst3+3fU8tz1k4mjoBJmVVtfUy3PRIuRUlouOUkxsOqy
         msNWc+/jtZcXFSrUrggTzxQm9ROnnxEwNfgEhGvh6nBU1rbYttOajgt/ENu4CI+PHTqc
         74TXYieAJ4oBcOUsrXQ0YmIGRfi/dpDo4IulAC1dviRcDUKYL5pP3cEbaH/J9bIoB4j/
         lhH7INHAe9plqUtHslhbT5u5vQCg4Rwy/lMPXgxQGIp3MatySQdVioiZ9j9n32nTlg6p
         O+/riwTsTnx1tfYlgO4kC2LAKPiLw8+RKw8VM5LNld1x/9Hz8vO0CRz7pf1AIZs2xhnO
         o5Hw==
X-Gm-Message-State: AOJu0YzRLG62xtNeSsbCKORCLPTaQJi8QFeyGvrn3++I5O+RL4YznQcV
	zLBkrexx1rbo+dbYx4HRErUInRujdo6lAnWzjHVRfHG92wgMptnL7GEf
X-Gm-Gg: ASbGncvSGrlxXy/84VmjK7z98Qk2PFIfd6x+5kkbQZvCgeJ1BOwfVQh5wQBw+1LyQUd
	bKQsy25Uf8GDQ7ybqEbPsZW27omMabxC2/jxvpEvdp7MhOP+fybmICQON1yDxT7vCn7rIw8mNsh
	Ej98BGSD5BI66bkiSmf306CFvis5AKsAF8LZG1kaSvytGvHCepd1rcYimKIBiVl/zAwDcubEduG
	VO4DERolWx8YrAAUMV+9qehoOCfhetGC3zpAt+naw/Exp4ExCi9mmacbYbEGqdvjvxayd6kotVK
	j/RXHnmd9V/xk+1ugpw4bIzEZnRZXdbdlbzSCQJM3g8r81vp1WSrvDaooY069cCsfBl0UndJIk6
	/WA3rNxDILU63kSTQ2iS99DCRQSdk8MWI1uOfXTp9jVGq8YX3kozxYYTyE8OkmXk6XwyH0j+OR0
	ukyPVHY//I2OzkH9xiq7+uOOR01mMmx6j8QmN2o21Ky0y0PXDeAG0usWn0OfPQGkIYxT651sUUE
	Sqz
X-Google-Smtp-Source: AGHT+IE0lnk3M01cCR0Ii+MTstl2vJZu02+w/siYJjllyFVjijcbmhjnSSUe6jjnZMWKPFf5baUo3w==
X-Received: by 2002:a05:6a00:a245:b0:7a4:1880:e25e with SMTP id d2e1a72fcca58-7c58e9f97d4mr18303051b3a.30.1764157122869;
        Wed, 26 Nov 2025 03:38:42 -0800 (PST)
Received: from 2045D.localdomain (128.sub-75-221-107.myvzw.com. [75.221.107.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f155d053sm21237249b3a.62.2025.11.26.03.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 03:38:42 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH] hwmon: (adm1026) Convert macros to functions to avoid TOCTOU
Date: Wed, 26 Nov 2025 19:38:28 +0800
Message-ID: <20251126113828.10003-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro FAN_FROM_REG evaluates its arguments multiple times. When used
in lockless contexts involving shared driver data, this causes
Time-of-Check to Time-of-Use (TOCTOU) race conditions.

Convert the macro to a static function. This guarantees that arguments
are evaluated only once (pass-by-value), preventing the race
conditions.

Adhere to the principle of minimal changes by only converting macros
that evaluate arguments multiple times and are used in lockless
contexts.

Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Based on the discussion in the link, I will submit a series of patches to
address TOCTOU issues in the hwmon subsystem by converting macros to
functions or adjusting locking where appropriate.
---
 drivers/hwmon/adm1026.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/adm1026.c b/drivers/hwmon/adm1026.c
index 80d09b017d3b..c38c932e5d2a 100644
--- a/drivers/hwmon/adm1026.c
+++ b/drivers/hwmon/adm1026.c
@@ -197,8 +197,16 @@ static int adm1026_scaling[] = { /* .001 Volts */
 #define FAN_TO_REG(val, div)  ((val) <= 0 ? 0xff : \
 				clamp_val(1350000 / ((val) * (div)), \
 					      1, 254))
-#define FAN_FROM_REG(val, div) ((val) == 0 ? -1 : (val) == 0xff ? 0 : \
-				1350000 / ((val) * (div)))
+
+static int fan_from_reg(int val, int div)
+{
+	if (val == 0)
+		return -1;
+	if (val == 0xff)
+		return 0;
+	return 1350000 / (val * div);
+}
+
 #define DIV_FROM_REG(val) (1 << (val))
 #define DIV_TO_REG(val) ((val) >= 8 ? 3 : (val) >= 4 ? 2 : (val) >= 2 ? 1 : 0)
 
@@ -656,7 +664,7 @@ static ssize_t fan_show(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct adm1026_data *data = adm1026_update_device(dev);
-	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[nr],
+	return sprintf(buf, "%d\n", fan_from_reg(data->fan[nr],
 		data->fan_div[nr]));
 }
 static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
@@ -665,7 +673,7 @@ static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	int nr = sensor_attr->index;
 	struct adm1026_data *data = adm1026_update_device(dev);
-	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan_min[nr],
+	return sprintf(buf, "%d\n", fan_from_reg(data->fan_min[nr],
 		data->fan_div[nr]));
 }
 static ssize_t fan_min_store(struct device *dev,
-- 
2.43.0

