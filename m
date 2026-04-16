Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8783B7757
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347846; cv=none; b=hboJlFR6kWqMJvcWusJV6q8gQWkMpz+8mXGIBhPzyqQASLlbRNtgbg5D/z2J35tKGPFf4fsez6V9cvHbvnQuXQ6Z3SeCTiOzsnLjDJKKbOoojlDgRJoj3DsLiANDzdyIFzB9Xi5EAQ7fEwzU2SCfhwpscoA1xYdSrxrKtKzMqv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347846; c=relaxed/simple;
	bh=qsJOp3oaXr2w4iGEmJiErCNfUdrDVwPgYREwOIeomeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G1n6NcRVauhIeB5XfU5NRNx+fEc8vttWmIhFn3cBCksHLAhaYN8X9TZCra56foeCxu7eTJk+BLUFkPkpn/8k3wt4rC08cXr+5PfmRswUgf83fxVhEaRKhWn0QGi3tSjNO7BWwaVh1T3AJFCGiYkGhzNKfqA47jd+7X3eBcs8ktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glR7kbZR; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glR7kbZR"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2d891442388so8198447eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 06:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347844; x=1776952644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9AwViEObe+yE4RqzPsI6fiKZ5hGYwUKWmhw1eqkO5OM=;
        b=glR7kbZRefhC7RLVCiIOM9PwIJ4/3xO7FEiOJPvCZzSrXAeS1MYEGsiKtPAWYYGl7s
         gH2x7U7hLy9V7o8+lNQHcNXjYXbIwIIQ8uZHNc80X2BEHaH+ui3m5tX974mQZ2MIE8ga
         Tu2TPoHI0ui+5UrDTe81X66MlCpfGmrT14aUTF9mXz7EqlFo8VrslDwH//p8mqerJx9c
         dGJ5ErTDph8H6Y1Cra5yzVVINVhd0dnYOtVQdFrRbYE02qNIEHY8SuoIBytR4tg9wdF5
         JAeB53NOWyb63P8c1iKiItggPpoeZVd6OHiKmTgg1PczewE1MVu9zcNfwTt5W4HyNGF6
         6L/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347844; x=1776952644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AwViEObe+yE4RqzPsI6fiKZ5hGYwUKWmhw1eqkO5OM=;
        b=OnonJIk7n3IRLm/Cs85PUqjmx0HKr6UiQuNSeFu4Z5zRKjX98xsW2aLmV9S6WXEckv
         jEC+k64T5pPX/e6gl+E7pf5qaE68i0EXSqcpkqoQCusRIKkyHIGLZVMnBIQiXukmlT3c
         txZF2bkkm4cghupp4z5VS360dA5kmg/ujlh3dVZJZZyUIHWTVOCmzCKM0fsQPzpoWGBQ
         sMGxgXahBREeD0tZo3e+qYzt/QmUJIzdnpdbuL0+nCvp7C6fq7e491Jlt+7SmewJLQsI
         bPMyx7zqgxUmkRlcFHoERwVQHIZkqS8EUDw5VaREtYfrJ6r+twzi/LkEj9JNb07e8DNj
         lJOg==
X-Gm-Message-State: AOJu0YwT0Ek88nEXdvmfqjkWpp2Mtm7fzzcTb0uRFuHNqsrrdOke1bXR
	iPlvtkKzPiIp+OHDQ1yG2lGMoPX3vVcJxd81cLmJr75s3i7Zx5ekG8WR
X-Gm-Gg: AeBDies/BNPvwV1NhADNbtpMZoKsBLZZ6DY+8V/22GlIeYacycn7m8XhhE2cO3J5lFt
	tCH5k4Nx6P86M3EPIlZHpjXHG4Z4ZqaDl8nBKcoLqVnQE6eO0XotSzjeuE9KAkVDLNUv1xFQSgA
	H3BGa7JViwGQEkg0gLHFqPdAFRqIr8d3cTlHoYCN4Pwif11bfcmB1/cFJV+xV8B50PVEyDzswfW
	q8+SWYDC+eeFQZR3ml6Oza25rXM996stphospOdSo93169OJIvY4jT7XnA1mzYzXodaBdQnn/zd
	deR1Fx9j7S42FSWbZhe+jCGrg3I4lhaeUhGcf1aVW64Wrb68mBZxKc/RKlAfNCIZuFQps3YHCqT
	N0xictk8IOz8WCESvv94MQAllg7BKz+K7SfUpAX1riuS8Y5VgzhYxlcfiolSjclsUYn9XfOq5Se
	k9R/OxsOtuB93CyiPgDqLfNW/2mNILeZkKSKdhl5l5qFJfYblJdWEd6d0MYDoRPyRr99rpioOb9
	1JEXcIo9JcktpQ3L9AmQUpLzzL8OsJKfi7ll52CXhRmoInEJ66qLOV3ksMbwJXbFXDpsDRFP9Qm
	LQ2L6C4sQrztFVokG/rMhBw=
X-Received: by 2002:a05:7300:7c0c:b0:2c5:60d0:701e with SMTP id 5a478bee46e88-2d586ea78f5mr15495567eec.3.1776347844222;
        Thu, 16 Apr 2026 06:57:24 -0700 (PDT)
Received: from 2045L.localdomain (49.sub-75-226-46.myvzw.com. [75.226.46.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f6615d5sm9150638eec.24.2026.04.16.06.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:57:23 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH v2] hwmon: (lm63) Add locking to avoid TOCTOU
Date: Thu, 16 Apr 2026 21:57:03 +0800
Message-ID: <20260416135703.53262-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions show_fan(), show_pwm1(), show_temp11(),
temp2_crit_hyst_show(), and show_lut_temp_hyst() access shared cached
data without holding the update lock. This can cause TOCTOU races if
the cached values change between the checks and the later calculations.

Those cached values are updated in lm63_update_device(). In the general
case, the affected functions combine multiple cached values without
locking and can therefore observe a mixed old/new snapshot. In
addition, show_fan() reads data->fan[nr] locklessly while
lm63_update_device() updates data->fan[0] in two steps, which can
expose an intermediate torn value and potentially trigger a
divide-by-zero error. This means that converting the macro to a
function is not sufficient to fix show_fan().

Hold the update lock across the whole read and calculation sequence so
that the values remain stable.

Check the other functions in the driver as well. Keep them unchanged
because they either do not access shared cached values multiple times
or already do so under lock.

Link: https://lore.kernel.org/linux-hwmon/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: e872c91e726e ("hwmon: (lm63) Add support for unsigned upper temperature limits")
Fixes: d216f6809eb6 ("hwmon: (lm63) Expose automatic fan speed control lookup table")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
v2:
- Sashiko-bot pointed out that show_fan(), temp2_crit_hyst_show(), and
  show_lut_temp_hyst() also need locking.

While learning the hwmon driver code, I found a few more potential
TOCTOU problems in drivers still using the older non-_with_info() APIs.
Fix them.
---
 drivers/hwmon/lm63.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index 035176a98ce9..b8b1de5fa90f 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -333,7 +333,13 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *devattr,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm63_data *data = lm63_update_device(dev);
-	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index]));
+	int fan;
+
+	mutex_lock(&data->update_lock);
+	fan = FAN_FROM_REG(data->fan[attr->index]);
+	mutex_unlock(&data->update_lock);
+
+	return sprintf(buf, "%d\n", fan);
 }
 
 static ssize_t set_fan(struct device *dev, struct device_attribute *dummy,
@@ -366,12 +372,14 @@ static ssize_t show_pwm1(struct device *dev, struct device_attribute *devattr,
 	int nr = attr->index;
 	int pwm;
 
+	mutex_lock(&data->update_lock);
 	if (data->pwm_highres)
 		pwm = data->pwm1[nr];
 	else
 		pwm = data->pwm1[nr] >= 2 * data->pwm1_freq ?
 		       255 : (data->pwm1[nr] * 255 + data->pwm1_freq) /
 		       (2 * data->pwm1_freq);
+	mutex_unlock(&data->update_lock);
 
 	return sprintf(buf, "%d\n", pwm);
 }
@@ -529,6 +537,7 @@ static ssize_t show_temp11(struct device *dev, struct device_attribute *devattr,
 	int nr = attr->index;
 	int temp;
 
+	mutex_lock(&data->update_lock);
 	if (!nr) {
 		/*
 		 * Use unsigned temperature unless its value is zero.
@@ -544,7 +553,10 @@ static ssize_t show_temp11(struct device *dev, struct device_attribute *devattr,
 		else
 			temp = TEMP11_FROM_REG(data->temp11[nr]);
 	}
-	return sprintf(buf, "%d\n", temp + data->temp2_offset);
+	temp += data->temp2_offset;
+	mutex_unlock(&data->update_lock);
+
+	return sprintf(buf, "%d\n", temp);
 }
 
 static ssize_t set_temp11(struct device *dev, struct device_attribute *devattr,
@@ -592,9 +604,14 @@ static ssize_t temp2_crit_hyst_show(struct device *dev,
 				    struct device_attribute *dummy, char *buf)
 {
 	struct lm63_data *data = lm63_update_device(dev);
-	return sprintf(buf, "%d\n", temp8_from_reg(data, 2)
-		       + data->temp2_offset
-		       - TEMP8_FROM_REG(data->temp2_crit_hyst));
+	int temp;
+
+	mutex_lock(&data->update_lock);
+	temp = temp8_from_reg(data, 2) + data->temp2_offset
+	     - TEMP8_FROM_REG(data->temp2_crit_hyst);
+	mutex_unlock(&data->update_lock);
+
+	return sprintf(buf, "%d\n", temp);
 }
 
 static ssize_t show_lut_temp_hyst(struct device *dev,
@@ -602,10 +619,14 @@ static ssize_t show_lut_temp_hyst(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct lm63_data *data = lm63_update_device(dev);
+	int temp;
 
-	return sprintf(buf, "%d\n", lut_temp_from_reg(data, attr->index)
-		       + data->temp2_offset
-		       - TEMP8_FROM_REG(data->lut_temp_hyst));
+	mutex_lock(&data->update_lock);
+	temp = lut_temp_from_reg(data, attr->index) + data->temp2_offset
+	     - TEMP8_FROM_REG(data->lut_temp_hyst);
+	mutex_unlock(&data->update_lock);
+
+	return sprintf(buf, "%d\n", temp);
 }
 
 /*
-- 
2.43.0
