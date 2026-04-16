Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA303845BD
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776330528; cv=none; b=WqSyKEU2k6/05OAVFLvBaStWFN70VlwF6NoPdPBPkE0fXhysWsoTEVvV72QR+Po1dl4Z67MegspWPW5pn/F8Yrm/7G0TheuWnVta+TPS0cOVDc8W1V9GlWHeVzFTs9URihj3Uek2h0MOMCcnIEmCgsNXAC9bmFvb1qCZUEQ2myo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776330528; c=relaxed/simple;
	bh=AUiUrVNs+eHoF8MDpMOY6RL9SDXUB48W2tmBZjOj8GI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AhziUK6gozhS66MEgdoR08LgS3dfANIVOL2AO30/TefGzKi6Wv2zyBZ8bYTcrbeG67iO38fxNYb9zYv/iIDJk9sCfg9UDvg5SUbSVdhKJV3OwxVOek9/LT6BsMKiANudj89rxiQbbc9ocNJJL4S2kxsP3t2fdk6jJwhfXZoIMSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+vVxZGf; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+vVxZGf"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c1a170a50so8243909c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 02:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776330526; x=1776935326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm6OnxCTh5jLC6rwYXzRMxCkYE9oe478C0w8KVA0FN4=;
        b=j+vVxZGfliggLRMF1Y4m2HSEDDp7jcjP1KRABlcpPw/wOlqqL1evzYIXR2vf0QGdD7
         iR8ulbnAeWOV6DVEtxddU2/vsssC2qU3IUXO1NjH7Qr00jYzWbdrXuiB5WBA6iKKt+I8
         Qdoqu8ZzTZZ/Us6X1ZQ/jZ05Wy0fR74EIZHrlMhJye9MpBNtziALQ8CuNCEs6jVHvgda
         gCoj9mCPM5MM0mZL6piuguwstIP8MqKMgVfchOTEcNfyMGLXsKllWjqPeVRXZzcc3+lN
         pEeCF3EOErog4FxE3ZmC7Y9ppy1sAzEIc+sCjqeQ5oTQCN0/vGAx1kZRzen1PYW74vng
         iUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776330526; x=1776935326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fm6OnxCTh5jLC6rwYXzRMxCkYE9oe478C0w8KVA0FN4=;
        b=WAET4Gxr3PJdZpQ2SqKprgV2DhR/L/JydyUH8ZuWIe6UfcZRwHMOKTK22j0yq8lB6Q
         LV92+gBeaJO+OwcAA6Gzvn1JXHCYtYsMLr3fUQCnVprTyWu4Cw62/IqPeveBzQUDiL2j
         FUzFsQdr+8rcorQSpuwagG6HWK0Lecy5dzlCw0grFreWcbLlkihu84LSl3HuBIjE+xw+
         DDwJXysoszxpwNUOxUfqklC0iKOXKo5/Ni02jMzauoH0a8YlIoOEwk4wfXy+pFG+t7LG
         TWhWCcpheCddLYcXn6kJjiWq/W+LA1MkSopjk1pb75h4dzwhyjsUwPd11pD/l47STtfW
         2Sqw==
X-Gm-Message-State: AOJu0Yx/1aota9hXnZw3d6yX9NmvVAkgRfEYPahSZPc1UwL1ZcxS3k/4
	1Z7PySH+fDAPPO8dLxEfeUhobwowWXNdKyGecDgOMhUODt+QkVeWdJ66
X-Gm-Gg: AeBDiethkovkz9r2LeC2BdNUnkbqb9rJI6QR5JJNkBXk+hi5KofbyAznlJEHcdk3apV
	VYSpJOoEau5U69s9yP0Rm6c0jpeWenVGBtmJ1T5aYzXA8NegPABamsD0hn/o4Bzc186w5AAE3l4
	5Qy9fWKcwMHbP7U1usQIKmqyq5iNdf9COO9Xoxw+0RhldtCrlfRXZb92PS68sm7i9GTSSWEJI9X
	tPLqMLCaMlPCizsUXXAJN/9I7WZazmuPocGMWWkySsUzCTDekL3CwFT3NUnn9ZMD6a1Tt+jfdho
	kZSo0IuENSVvdeG8LeaL8+v8CU9SOj2fXldA68Vtx54Fd6lgu4VF+YyYlY8ULubAV4uejF7X2J5
	QSGycWef3eNklHkrlAqrNEQYkYDTPok5uNy39Q3/r2EnSwdAwu5zOi0uyLxtuEtHQsyT+BI0+50
	ngkaYuHadYQLU4vyMIUUik+xG/iVg9G2guhELtaOPMv95LQn8QuZXj5mGjJBT2nOII2IvjHcS7W
	RMyGaVUhv4vf8O1EjgLzP9bH3zI2qhbl196qpIIRSwGgHGqyuOBqdGcPmOFWtwb+CohI6BMXmBl
	37agjM12fI11/+Jcp/t5Kcg=
X-Received: by 2002:a05:701b:230e:b0:12c:6e85:505c with SMTP id a92af1059eb24-12c6e8551d4mr89901c88.4.1776330525979;
        Thu, 16 Apr 2026 02:08:45 -0700 (PDT)
Received: from 2045L.localdomain (49.sub-75-226-46.myvzw.com. [75.226.46.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6a8496sm5185955c88.10.2026.04.16.02.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:08:45 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 2/2] hwmon: (lm63) Add locking to avoid TOCTOU
Date: Thu, 16 Apr 2026 17:07:52 +0800
Message-ID: <20260416090752.97392-2-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416090752.97392-1-hanguidong02@gmail.com>
References: <20260416090752.97392-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions show_pwm1() and show_temp11() access shared cached data
multiple times without holding the update lock. This can cause TOCTOU
races if the cached values change between the checks and the later
calculations.

Those cached values are updated in lm63_update_device(). For example,
show_pwm1() may read data->pwm1[nr] and data->pwm1_freq while a
concurrent lm63_update_device() refresh is updating them, resulting in a
mixed old/new snapshot.

Hold the update lock across the whole read and calculation sequence so
that the values remain stable.

Check the other functions in the driver as well. Keep them unchanged
because they either do not access shared cached values multiple times
or already do so under lock.

Link: https://lore.kernel.org/linux-hwmon/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: e872c91e726e ("hwmon: (lm63) Add support for unsigned upper temperature limits")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
While learning the hwmon driver code, I found a few more potential
TOCTOU problems in drivers still using the older non-_with_info() APIs.
Fix them.
---
 drivers/hwmon/lm63.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
index da132b267c58..25b871695cb3 100644
--- a/drivers/hwmon/lm63.c
+++ b/drivers/hwmon/lm63.c
@@ -372,12 +372,14 @@ static ssize_t show_pwm1(struct device *dev, struct device_attribute *devattr,
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
@@ -535,6 +537,7 @@ static ssize_t show_temp11(struct device *dev, struct device_attribute *devattr,
 	int nr = attr->index;
 	int temp;
 
+	mutex_lock(&data->update_lock);
 	if (!nr) {
 		/*
 		 * Use unsigned temperature unless its value is zero.
@@ -550,7 +553,10 @@ static ssize_t show_temp11(struct device *dev, struct device_attribute *devattr,
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
-- 
2.43.0
