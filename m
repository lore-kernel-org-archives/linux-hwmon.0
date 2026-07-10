Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E84E41C314
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 11:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682489; cv=none; b=fF2S32eZJ8L1et0q4qsQQaZgNELP4SKgsPSFonMetLUhaUJPQhfLrCMEaBnRULnDwGEokAyctAW8PzQdyGtZSkwINDEwV1QVS2cAguW9krlE3pFlmgrhw8xoQfcsx6kHhzp3+W9AwxndHQXJuk9EG4o4/M+umhA37kMjgBTENHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682489; c=relaxed/simple;
	bh=o/U+zzexKyj+xzXJo1/YjvLeURDV52lAwDpJtezn9q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZlvzlNogQJPlJ44+Hwl2NTT886F7QZNKBUQ4rtQTVynvQZ2DYG9TIQ+UJSAjZu0Fofr3GhEqIBKEuDjdoMH00V3hgd+rKV2AR8W36mtuJIznHti5zyi5u7U/URdumBzBVOkl3WX4zQevEl4LPTNRCvz5pXmp+G0xvck0QQnh56U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3V/gRKD; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3V/gRKD"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so805986f8f.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 04:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783682474; x=1784287274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MrY2/6NPz+ZxZG1wbYQ6jGIOh/dwQHdPYajE9man0xw=;
        b=Y3V/gRKDX6Jxjk92TQDDkrKQKrb4FRsr/mfx0gCJAlyqYZMNC+WcxesSki/q+WLXni
         aO8PGeomhJnngbD3S6UTqMSUcSxHHZBbsyMz8YCCA+WOiHHWt9hyC7ULsqAaVhovo8Ka
         cs3jmNGDWeh1edIVeFf3A6DGIDE7VBWIMbwv6OnHN4LOnLpNZ2VYNzS0l9OIhLXO8rsM
         B1/byYgH5FSm0YqLWoxbXvLZiKwaQ1/Yv+k2FF1GItyZRB5TFqjIjQE6m2nzZ9ZUOHYl
         hEnQe6WEYrc8W0qYwJgrNwIJcx88/2zOAR4Gi73oaWdZ7nqEIZU0Tp6tSrY8fTn2O93M
         CGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783682474; x=1784287274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MrY2/6NPz+ZxZG1wbYQ6jGIOh/dwQHdPYajE9man0xw=;
        b=IIt8BRoQAm/3SIsEzc/9XH8aU5Su25E3gtUDPsrSlgbkFUE/SJfMwT5qqHuVVBmx9G
         aemmWSJVNN/nZKhoUx2rsm9tJDVES0+6JtqxoPx57mN/ho4OAO50ybedZbpVc22DjkuL
         d7gww7sUz/AK2A4Nk45tbB1LR1xpALV7JAblF/hHCeMugE8cyxT9Df8bjYpzq8NZ1Bm3
         02aWat6jUML20PHIvQbsxdSjELP34HB8EumOzpMdiU8jFyMYl9YGi5jYUlPyp8I08CWZ
         FSt1p+WIqSsaN+JOkkd5vKE0h1NlkmbOIkrG4h8NJDaNVb8iJ2erLjV7xv+Ew0+ADzGl
         hepg==
X-Forwarded-Encrypted: i=1; AHgh+RpQljNo3Fjhar/ZOVXSnYq2kHmXPVx76A/uZsMZGHN7WVP90tE+uIEWE89tVY7PQqlOX4svULNDTAz9BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcek085q9NhrJmE1BAb1jOD6BaMYp4CESLfBOuPS8JXVPPr1WF
	uN5PP76j0vAIUVNrPFTln0fSHJpoeXzEBhN2qziXVYsEG6CjYB/nA45c
X-Gm-Gg: AfdE7cm/EOlOTq57FsHw/obsCqAl3zLyZHG1F9tC99uD/f8jjZReYINqMjBQ1hR3+/v
	kwfJOLVN70nWHep7pNUQ51ILoarfVoIvrDyWtJFYeMblxQrD7hFUCphDNeUoqPLQJqa6zracpFT
	rbMy+henlMZf/PE5LzdU0cw6WafjNraqQbLVJCsoCRKOZaWlMj5i/2onli02BktriV17C1bPmNz
	Ra00wxxs/LxmhTA9pYgNNhQQxzIGVL7HyUldhVz1ITX+XwIgWjfYd+qrOTgBGLQjuUXqu3JYqPg
	rqKzOljmtX6/Vz0czZnznB/DvJ41wMJAivQ8/kB8xcFB0qfmFMlJ7UVsudc+sSYeC61VNbSWrL8
	cMPtVMmDqr37udHtw7zyUotvshaiiTMpxoVx1Zfijnj2rUmnsxvkFF/wicwRA8D3v4MOQWCeq19
	Ll0fhhkhCvM61hwuY6jOUUhy9f07tYFKvEEj+hDx2+KGIVn2BV0Sns/wTUrdZkDsuZ5OhWjsS8+
	Gyp9qLwcAoXE4DGhiNxkABr2BB890nvwOTydPMXIAJ9X9CuFt2rRDVRZyyd/caaiUFJnfhaM7AI
	2t5ZnWB/pRK3jCJ2CNy4PUlUSzY+innmVpKPvuS/sEyJGF775T+gy4E+WUBn64JihFJsuGwXktH
	70WarlNfSWyP0
X-Received: by 2002:a5d:6f04:0:b0:46f:558:a43f with SMTP id ffacd0b85a97d-47df071565dmr11143022f8f.4.1783682474371;
        Fri, 10 Jul 2026 04:21:14 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47a9de1d91bsm64716756f8f.4.2026.07.10.04.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 04:21:13 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] hwmon: emc2305: Add missing device tree compatibles
Date: Fri, 10 Jul 2026 12:21:06 +0100
Message-ID: <20260710112110.466240-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing device tree compatibles for all the variants
so they can be specified. There's at least the use of emc2301
already.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/hwmon/emc2305.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index eef3b021671b0..38034d7a30901 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -762,6 +762,9 @@ static void emc2305_shutdown(struct i2c_client *client)
 }
 
 static const struct of_device_id of_emc2305_match_table[] = {
+	{ .compatible = "microchip,emc2301", },
+	{ .compatible = "microchip,emc2302", },
+	{ .compatible = "microchip,emc2303", },
 	{ .compatible = "microchip,emc2305", },
 	{},
 };
-- 
2.55.0

