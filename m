Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233B73EEAEB
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649962; cv=none; b=Eg8goGtyhKaQdEeCVfxgQGUPWUYsWp+vUzRHdzXj9RpRHERDH3HBYIVdrzsgloedXUqGr6ZCqReNls1BUPvd0PmI4xetyELgBnWN4rnJuptTjGpVBHcRDR9ytG5wT0M4yJ2yaJXODV1i2vP80aiwdwVLJ7jetYtkx3m3jwcCA5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649962; c=relaxed/simple;
	bh=VYkgLWCJeyiEauXzcozuHqKvw+ZR7o179+bK3zgGtWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSCrngFh1kr1WWmNPd9aqP28Vcf4tNvqcQ0pPvMiWpciZJ5Hl1KOw7bSPBscMJtkIXljaUye/JWM1NyVdWIjlC5ntaw794q/qS+nq268N2O+pKc0xp/VaA5zRmo5Nee8v0996gXdThstwluwTOwyIQ2gMSYWX595lNLxAW+kl2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6Ajig3x; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6Ajig3x"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso7975886a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 02:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787649958; x=1788254758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFXySYEtb7Jp90OKqpFBc5Jr23ETazFykOiMX2/lKCk=;
        b=k6Ajig3xYw+3nqKdjMcaFu3ApIojc7JYmyYV4mLvog4umM7OdYbt9deju5+0nkXLYe
         NCXghhXo0TIkqqIjM3yTGhmZccDwUCo7+68LWohfc9S9k3UiApkz+R+BXHEMOz04f3XO
         WGGUYH2g3VX1qXlE12T5gVNO10C/M1r9iQSMJM1X/xPzjgfKGsfYK9wyfrEXQVrCz2Jk
         O9JLZaH/laTXdLm/JVtD/cLOrWANDQj0GU9ygfb9Oup6nrcJtvWdtFtLh3D/mKLNHZke
         1p7nMyY6cpRuBDRAEwrfTO4Hn0I/mRQrmYP++AfPQ0I1KlhNIB3svlUXjhy8dvl7TuKi
         4lbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649958; x=1788254758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFXySYEtb7Jp90OKqpFBc5Jr23ETazFykOiMX2/lKCk=;
        b=pZBacNYOtNZjmWVIxxnn7ofvDBrpGozU/wFwTay8zOmqwYMmmhXHY8qyObHM/NpMkQ
         y4MC7Jg0fyA6dfVzoITNaes1gXMQ0fyIZzZmkHr16CRJF5Ov+C0XPZ9iv3apveq7mMbq
         ewm6RMFMj86aaNf2j60iA7to4rAPHuXUSNK/oTkFkBhTWeRIPGTShjEgBHlujOmsncRh
         VVddPvdaOvVZXmh7XlbLCPtD17VeAVGBafsq4GY3YwWgGvvGLOnHwnqQkpa5sC/iwjBc
         eQGLsKbx98zIfegHsNnjq6JQGJJZmBLBLalhyt0UWB7o8DAFvq7igGi2EfuTFs4opvcU
         dRIA==
X-Gm-Message-State: AFuF++kpgCqYL5IW/t+yLvMQvbNyzAJidmgCvTlaR6g8FtaYrnXrSCrn
	JD1uxrmt6mBEF4Re/8/PJSyYS5WvEhdSNeNxU0VMARe0ke6mSRoGweqTBFrnUg==
X-Gm-Gg: AR+sD100q+pgbDdocbSk02frngyS253f8xnr7sPYXRA8wdHoRBehaWkV7dDRjxMRvkS
	L50iyI1t+G3uu/kQYSt4cL48kCawIXP1ZqjW1P8OR2u9/CvIZ19tiJmlkZRnEJ3scYULHaiyh/7
	1MVQ/h03wz+JkREVOQvtKzpJPvwI5oSP9X+Yv6Ev1mRtkXpTmS71W1FoUwBVnonN3ifvzJn+8SR
	GLrZcQ4TdK33rjQe4ayhxAZITayvC1VznWE2B/kkS5J1X68R0zf098QDa3qyun/0tbFndJV2Y3W
	f/tbwMqjobu0p1YfXWsg7TQJ5n4KxcxRIygdaIlhH5ehmaF6XCAa/nx3f0MlqmJJBLonw98q1Jc
	UmpP/XWSGrUfgPdX8V+1zeBtP19/Cx7Rb3b33nYw3wQPnzNUgZtcko5oxt0Ne28HpZUnw9M8gSD
	pCqXi1WYPKVZQ/SDvkbIHiCw+azbVR5IlBzFZQ/wicOGH0qLvQ8u+ha0fWWJW4d6MXIgIQckEvu
	iOHMEMPA/EOLwU+LVfixIvsZTj8lIXqDaPQjpERiU5JWDaioEpxo7pbQpo8f11fS5DbYLnVHixd
	OeNm06N5KXY/IvCU/u5wyO4eRcCt
X-Received: by 2002:a17:906:f59b:b0:c20:7cb1:9046 with SMTP id a640c23a62f3a-c24924b7508mr2666855366b.8.1787649957973;
        Tue, 25 Aug 2026 02:25:57 -0700 (PDT)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606bd05sm1612570866b.2.2026.08.25.02.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:25:57 -0700 (PDT)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH 4/5] hwmon: (nct6683) Restore fan control mode on driver removal
Date: Tue, 25 Aug 2026 11:25:45 +0200
Message-ID: <20260825092546.669450-5-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825092546.669450-1-jdahlin@gmail.com>
References: <20260825092546.669450-1-jdahlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A fan switched to manual mode stays there when the driver is unloaded,
leaving it pinned at whatever pwm value was last written with nothing left
to update it.

Record the fan control mode register during probe and put it back with a
devres action, so the EC resumes control of the fans the driver took over
while anything the firmware had already set is left alone. The action is
registered before the hwmon device, so it runs after the attributes are
gone and cannot race with a pwm write, and it is a no-op if probe fails
before the driver touches the register.

Boards where the driver does not manage the register do not register it.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 drivers/hwmon/nct6683.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 0324ace707a5..6825e6c3af34 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -344,6 +344,7 @@ struct nct6683_data {
 	u16 have_fan;			/* some fan inputs can be disabled */
 
 	u8 have_pwm;
+	u8 initial_fan_ctrl_mode;
 	u8 pwm[NCT6683_NUM_REG_PWM];
 
 #ifdef CONFIG_PM
@@ -1275,6 +1276,17 @@ static void nct6683_setup_sensors(struct nct6683_data *data)
 	}
 }
 
+/* Put the fan control mode register back the way probe found it. */
+static void nct6683_restore_fan_control(void *_data)
+{
+	struct nct6683_data *data = _data;
+
+	mutex_lock(&data->update_lock);
+	nct6683_write(data, NCT6683_REG_FAN_CTRL_MODE,
+		      data->initial_fan_ctrl_mode);
+	mutex_unlock(&data->update_lock);
+}
+
 static int nct6683_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1284,6 +1296,7 @@ static int nct6683_probe(struct platform_device *pdev)
 	struct device *hwmon_dev;
 	struct resource *res;
 	int groups = 0;
+	int err;
 	char build[16];
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
@@ -1401,6 +1414,15 @@ static int nct6683_probe(struct platform_device *pdev)
 		 nct6683_read(data, NCT6683_REG_VERSION_LO),
 		 build);
 
+	if (nct6683_has_fan_control(data)) {
+		data->initial_fan_ctrl_mode =
+			nct6683_read(data, NCT6683_REG_FAN_CTRL_MODE);
+		err = devm_add_action_or_reset(dev, nct6683_restore_fan_control,
+					       data);
+		if (err)
+			return err;
+	}
+
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
 			nct6683_device_names[data->kind], data, data->groups);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
-- 
2.53.0

