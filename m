Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8870B39936D
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331095; cv=none; b=l3+UngbSf7Wsy3aWy78ZXgagHH6tBOakHp5FHsHjfh1y/IedE/SMgTMiS8UubbMRl+HIUSVh/stsmogSTcc1OTSVJi6toiYCB95AxDH8pkQ/Y0xFFYvDebUwT+TnEE/huvixCt1iJn8pDqYOWNpVnGcqzIcT50Dnfazl5tMOo2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331095; c=relaxed/simple;
	bh=d+1X7Njz9igX3gmwKo4zciVCRBP1oyl0oYxKxhWhBqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YzSp05o2gXVhnoGUmhFASWm+HTZyskhl/1ue+hsAB4kfdxnkogbDkmcwt2Du2XvNeqeLy4LTeFSAL+oa45jxut6wgSXARHjVke/HFgEyDFfbd0z43jocdHBg0T6u/MIla0s65gLDXKu1RFfZYj/hCTXa0x7NCoOuJUyl7IDIsLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5kKjaxN; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5kKjaxN"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2dbb4ad19a5so1945633eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 02:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776331093; x=1776935893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RhanGM5dfIe9kmWnPIzxO7xokusaxBthdsG0vEBhbc=;
        b=i5kKjaxNrHwFMTJ1//KOvHAdAF9NqZ92Sd5B8ZEjNX8xsiDmKNs0ih4avbYsJYUvH0
         dPvJELb6ia6etvXF1AyGisO78DGwyuqnhtsyp988ZWiO+XCoaPyKO0yEpQ81Jg9uwWDv
         Y/mSnuVuB1Am+HzS+PVt8qDu48ArO5VnyDDRn7keIFckaddurNRDmJfmkDMhiotw6YuY
         SnhycdmI/XVzVnR1bkTSbKu2hEmVvigDCS2c1vKuDoNzrZ2LgcGXbRvMYNJ1jRyCV9bE
         M9+kJlCY+rBI/ION4BCDQrX/KZ3PAXubuSfc983b3VDprcFW+iVHMZNsEBWkfjR6xWA6
         /Byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331093; x=1776935893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/RhanGM5dfIe9kmWnPIzxO7xokusaxBthdsG0vEBhbc=;
        b=OLCLQKC/sgCKqYYy7rkwKxhGRoAWtZJ7fGkGILjSR4R+LOWWeG3cnTwnZJ4pm+Autg
         N3hYH5bk6/z8ZC6W8xVpGwTmdR+JwgYYoD8Rdso6hW6m5ebQphl1isaC1cAcU5V79lIC
         um3oMAzWh1T8zvrHv2LxJDLP365cqoNnPjY+SQHnI2f9I9M4JMl1/eHaGl7s/OTRN2Ja
         oo2UHqihKDvwDQiCPg9C5p1MfByjm+GUYomc96uBJVJXNqFiDBj2tVxTMfXTIbhwJryU
         TbFINUMq9ZVWEb9mLS+wniNfqIlHJV+I4lcYpcaL+smTp+jnKu1h/G0lPzGRSKpLz9Fx
         NtQw==
X-Gm-Message-State: AOJu0YzoKfo7ypp2FIbPcZN53dYhn1Ts/e9zq1Buh+zlZMBhcbF+i/p1
	rLOOkezinzg/nnO9RyM2RSHKJl3AFTv2CGQBqWynx0/99e807LeUiutr
X-Gm-Gg: AeBDies3zOKZ3T5pX6jdhkyktdGP1a0/BgeAyMcFPC9BurA7gmBzLttec5RUo/Umhq1
	uER59/U2FuSBNZVNXFx4ILJ/yokSjRe5NPBpzl5f6C3EWK2yMAjsntQNVC9MP5hh8bXW4GayJ4A
	m7UV/vZ6ehmURRbbuLietXXVFaTpRBqUtoDv4KfcwULSY0HK75kAqSaPOVW7LvybD+pvybh44ak
	mbQB72mkIz+/7uH+NMDRWcfLLpZZwIXoXuxHFvvcy2l/0gjZSjvMJmjIpgco2Y+ixBHbYzC5lPs
	sKHCEmM/DkbpkMnFUPd+UHIvqYjpAgBTxE0FYVtzMKZaxoj0IlnfHO+Fy3+GWmTZhOcWDlnWokx
	9r55M+8IbiRSWAesMUEvGLmOFj/G7YGcGL/QEE+Sd2CbxbWA9HrOkkgtSvEplJ0LZyQ3m4fm1rO
	3KB75t8QpF1OVBaBrqOnYvFVeeUvVS6Hyrb250/DYoh1SeTqYh7/RNMFrmdeo5rrvQs3D+a79gq
	v/txyk3lj67Dqc3mpKmHO2u5yqr63xGmT6LHcgFLvVqyuyVq3pFZm+B+0CvoPelxEvfe4n2QXzv
	vGV7LoG6ehcaI5ayfb2khKU=
X-Received: by 2002:a05:7300:e60c:b0:2e2:4979:eba with SMTP id 5a478bee46e88-2e249792b69mr232897eec.7.1776331092420;
        Thu, 16 Apr 2026 02:18:12 -0700 (PDT)
Received: from 2045L.localdomain (49.sub-75-226-46.myvzw.com. [75.226.46.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8482asm6591216eec.15.2026.04.16.02.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:18:12 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 2/3] hwmon: (adm1031) Hold lock while reading cached data
Date: Thu, 16 Apr 2026 17:17:53 +0800
Message-ID: <20260416091754.310-2-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416091754.310-1-hanguidong02@gmail.com>
References: <20260416091754.310-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions fan_show(), fan_min_show(), and temp_show() read shared
cached values multiple times without holding data->update_lock.
fan_auto_channel_store() also reads data->conf1 before taking the lock.
Those cached values can change in adm1031_update_device(), resulting in
inconsistent snapshots and TOCTOU races.

Hold data->update_lock across those reads so that the cached values stay
stable while the results are calculated.

Check the remaining functions in the driver as well. Keep them unchanged
because they either do not access shared cached values multiple times
or already do so under lock.

Link: https://lore.kernel.org/linux-hwmon/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
While learning the hwmon driver code, I found a few more potential
TOCTOU problems in drivers still using the older non-_with_info() APIs.
Fix them.
---
 drivers/hwmon/adm1031.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
index 0551f815233d..887fba9ea149 100644
--- a/drivers/hwmon/adm1031.c
+++ b/drivers/hwmon/adm1031.c
@@ -350,9 +350,8 @@ fan_auto_channel_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
-	old_fan_mode = data->conf1;
-
 	mutex_lock(&data->update_lock);
+	old_fan_mode = data->conf1;
 
 	ret = get_fan_auto_nearest(data, nr, val, data->conf1);
 	if (ret < 0) {
@@ -568,8 +567,10 @@ static ssize_t fan_show(struct device *dev, struct device_attribute *attr,
 	struct adm1031_data *data = adm1031_update_device(dev);
 	int value;
 
+	mutex_lock(&data->update_lock);
 	value = trust_fan_readings(data, nr) ? fan_from_reg(data->fan[nr],
 				 FAN_DIV_FROM_REG(data->fan_div[nr])) : 0;
+	mutex_unlock(&data->update_lock);
 	return sprintf(buf, "%d\n", value);
 }
 
@@ -585,9 +586,13 @@ static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
-	return sprintf(buf, "%d\n",
-		       fan_from_reg(data->fan_min[nr],
-				    FAN_DIV_FROM_REG(data->fan_div[nr])));
+	int value;
+
+	mutex_lock(&data->update_lock);
+	value = fan_from_reg(data->fan_min[nr],
+			     FAN_DIV_FROM_REG(data->fan_div[nr]));
+	mutex_unlock(&data->update_lock);
+	return sprintf(buf, "%d\n", value);
 }
 static ssize_t fan_min_store(struct device *dev,
 			     struct device_attribute *attr, const char *buf,
@@ -677,10 +682,15 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
 	int ext;
+	int temp;
+
+	mutex_lock(&data->update_lock);
 	ext = nr == 0 ?
 	    ((data->ext_temp[nr] >> 6) & 0x3) * 2 :
 	    (((data->ext_temp[nr] >> ((nr - 1) * 3)) & 7));
-	return sprintf(buf, "%d\n", TEMP_FROM_REG_EXT(data->temp[nr], ext));
+	temp = TEMP_FROM_REG_EXT(data->temp[nr], ext);
+	mutex_unlock(&data->update_lock);
+	return sprintf(buf, "%d\n", temp);
 }
 static ssize_t temp_offset_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
-- 
2.43.0

