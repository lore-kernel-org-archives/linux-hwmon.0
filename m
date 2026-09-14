Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344703D7D8C
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 06:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367300; cv=none; b=I6GRpwkOYFCHolGZ7WwhNw2GBbQagy1bJc8gtBSL/ZfvnAYW8pCxADuA9as/NJr+5q+UFD9X3m72v2jC/xEoRmKeHDBs8nhA6jYWNVv8dG60zlJqh82BJ0s59HgsXi0u+9dAu0E1oP7m+s4au1bK9z1HW/6krc5/oDym5IZK6PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367300; c=relaxed/simple;
	bh=TPDQPFLtPZvZI1VjjY0N2Stg09IIGcwfk/cDP+v1pFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B8iBeBgx+lOAnfEfw0R4xQZCG32vOyNOJn4QjtyE5Ozq4bFlYjv3hSMw4Ffz+4hYteI+sxZUjR8AbREnA9Pdq7FsrcRbB3NI1chGvi5XCk8jpLYu4+XEb7IjcHStL5kOUt3PNDagvP21U7mVJwTGnhevr4fvIIc3AUpIze8WK8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Im0O/NMv; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Im0O/NMv"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso488125b3a.1
        for <linux-hwmon@vger.kernel.org>; Sun, 13 Sep 2026 23:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789367298; x=1789972098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iiJKaMbfu9qWEi2n2OlhqAtcjgz04Z/iHxvz1jHrk94=;
        b=Im0O/NMvog1usWt2PJGPLuFH4wO+sLDVWWgS4PPxInUlmlhk4fVBHL8zHvm7fC9OYH
         g6RrUXxF1Y9KtHTQktb2row3Wwi0B7zV1FApjfprMhms6Kr3NAyfQT8cZQBItUaFrmKY
         UzqZXyQiE5reD8PtSCgcSD6FhRQ+bngeIgL9cRudmZGRDAET9dhqYcNsCYR6dAdC6rBz
         owj4/+EKhVZdNsyXQ+1tG+epyqS46+pRAhTPjZUUWWH3wqreTU6HGbLKpMzVRxx8qMgX
         EyqmtmWwLK6Fm+o+uLMWsIWIvQQbG7fxd9plgRd3ukluMNqeEmGer+8Oe3cjdTX4ICdk
         8Y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367298; x=1789972098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiJKaMbfu9qWEi2n2OlhqAtcjgz04Z/iHxvz1jHrk94=;
        b=l/UP09lhcCMj29/YunZhXS040ojCkRahMxMBZ0+r3ZEXbOo9twggMD8cAEXvkIvxsU
         wHHtd0ftZZlprLgApuw4Z/Z1aeFcC4Gl70ax7RvhMcqTA4V7u0gd7u9uaBcLZftvsTwl
         I9OX2bjg1Q20Eym/XZnjm0jnjcbWZzJu5vcVBWw/vBB1XJhPQajcvzfMMlmkgl3+6IBG
         POAenPbTL1QRqg6ajQ5M1dXc4DsX2SypboiK9Ig71F04yab4AsG6dB8fgY9D7wL+bCeM
         XM6A0S+aNX4A5uJPx5iExIFpJYHcZGZLj/Ku4Cjn2X7W2HTENoo0JR2GvHYWCzZDsZQn
         +GHw==
X-Forwarded-Encrypted: i=1; AKwUvBzDstkw+jInHosoWlw0+H9OvPxyvEzYuT5N4sw/W0p6I6EyRytwbKXaayK1CBN/u3hq1SdxR/ddN1i8NQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lqKpnMvjhfG951J0+nbOXTqr0ctSiPOsmGG6ciL2xtL0YKSevT
	kzBow8npx4Hfi6vi7+tZ9N8YKMDVtWJ1P5JzO33SuSV8WawPttXYfO5d
X-Gm-Gg: AYBFou3s7bg7ahfWsTdh5ac0QPeOFJT1QhG71p6z4KmYxCqumW7zX9xAbj+lT1MlaMx
	F/s9gZQ/3qC6mvtWYeqlbkVVibjM+42USkzb+Hscuxjt/OCFfxphGlu7wsme4q1L9MlTpBi6jWE
	HkKhwlKrQUT6VRCMtG11JUzJbQFBDdjYBYb1tP7OQZDHVtGcPYQ+Y4RF2mOPkff/2qvZwX3TvQ/
	lA40C85jZOrj3BxX2ZmsiadFDk/DVMje3qz9a6h2K6Vo4C218SelYt3Zfv8AnV5zh8acfIkwXL2
	kZhBobYElRvpnlMNsSmGBGYrQ1L8/twfOG2vX8j+OeJUePPtjgsIk+DnjfmWNmwIDx2eUUL3T/+
	FHGznclg/dz23cmvL/sRMb2OWnFehTPgc7YW02kYQ7yqrCHb/PVS+U4TphmH1qxkQ0O7CtE5l4w
	mJ28HP8d9l98wDm+78UKZi5TMJ44XVENq2GVtXSMN1T+Ft7SiFA0hRRQ==
X-Received: by 2002:a05:6a00:ae0d:b0:869:31b1:4ce3 with SMTP id d2e1a72fcca58-86e2a7ce365mr6207771b3a.9.1789367298432;
        Sun, 13 Sep 2026 23:28:18 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b294be699sm3989659b3a.34.2026.09.13.23.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:28:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Marc Hulsman <m.hulsman@tudelft.nl>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <khali@linux-fr.org>,
	Hans de Goede <j.w.r.degoede@hhs.nl>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hwmon: (w83791d) remove fan/pwm 4-5 sysfs group on remove
Date: Mon, 14 Sep 2026 14:28:09 +0800
Message-ID: <20260914062809.1650538-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the fan/pwm 4-5 pins are not used as GPIO, w83791d_probe()
creates the w83791d_group_fanpwm45 sysfs group on the I2C client
device.

The probe error path removes this group when a later initialization
step fails, but the normal remove path only removes w83791d_group.
As a result, the optional fan/pwm 4-5 sysfs files can remain after the
driver is unbound.

The callbacks associated with these files access the driver data,
which is devm allocated and released after driver unbind. Leaving the
sysfs files behind can therefore result in accesses to stale driver
data.

Remove w83791d_group_fanpwm45 during normal teardown as well.

This issue was found by manual code inspection.

Fixes: 6e1ecd9b8f13 ("hwmon: (w83791d) fan 4/5 pins can also be used for gpio")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/hwmon/w83791d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index 4a777430af5c..4b07a25ae59e 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -1415,6 +1415,7 @@ static void w83791d_remove(struct i2c_client *client)
 	struct w83791d_data *data = i2c_get_clientdata(client);
 
 	hwmon_device_unregister(data->hwmon_dev);
+	sysfs_remove_group(&client->dev.kobj, &w83791d_group_fanpwm45);
 	sysfs_remove_group(&client->dev.kobj, &w83791d_group);
 }
 
-- 
2.43.0

