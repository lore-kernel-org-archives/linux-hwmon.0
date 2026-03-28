Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E812FA0C6
	for <linux-hwmon@vger.kernel.org>; Sat, 28 Mar 2026 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774722027; cv=none; b=DisPkwMjRUdzkI7yCj2tvH9H2rJgwToeMuQR+wgmrA7s+0sHJGl4tWa0v2wo+O+tZIKn2cS0IigqYPK8dY96fEJhHw1zrFskTDzfR7+iA+pZVf7Um1eZSjTGkrBY6w2Yo2LccZUF9FheT5dWoudSJGTbnJwkIRXC8ztE1E7BMfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774722027; c=relaxed/simple;
	bh=3cuAVWfGPKwOISgT6kDCXaQrrMcgTGcMtitM6erSNEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oYRN+rv+GgCXQZmKkUQ8i7mOjFSeGwEXZwX8Fh8VL9NwmUDG8XGOlO1rbRbh8Rmi7SUSoqFzhrh5opF3aBnaN/ppLBkyaxFhwvXgBf1PB/coULen8UpZ8ak9sMq8B/73xkpEoCBW9t0ro6awVVTlErmhmAsinZ9DIz8IX/9kXH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2zHccaA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2zHccaA"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ad9516a653so14278715ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Mar 2026 11:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774722025; x=1775326825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tSLPvbUPYYLr3Q4Z127CizQQ1sGU1Hs1CyeNu6dXEk8=;
        b=h2zHccaAQnqIrqbnRYe7gS7wpT0rbynvpCdk2X2MIITEjPiGgPGbTzbhWxDAXS2Hwy
         sMGMR8giB/gPrx86v3r1n6+yLTDkxz68civTkhIxgP+orxHH0VIwczBxcYg3SyZ799r9
         5MrmttY9Wj4EPIEb5MRyUiiLijgGkjZveK395NOwF0oOUlpBYuaj1a4SfK/NgJvxcNj6
         VYu/ft+pRfW4Y7uwTWApYdwaAEG1duSVXreQNtD8bbfAmzd7YSYVi6ASNTFDjYp8896M
         sugY6sJkMS3yAwt1ois+8RBIK1/UVvlzqQuw1Od4iRC3F0M/xyFLr6Uv7ozmfkRh9vsy
         BUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774722025; x=1775326825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSLPvbUPYYLr3Q4Z127CizQQ1sGU1Hs1CyeNu6dXEk8=;
        b=OSLHXgruyaqCp+6503RBQf+e8yE4UeGqUYzTitydhE748GdQOl+soVXUES0XuakEt0
         frjiR/bG0hoBBFSLUsf13fCu70LfTlJY7sOKXzEzQEHsMJ2/GnDuvHWk6FM1XhO5UnG2
         /BKnVUHQKaLxc83I60FPG22UJWJMD+QjhDYjBuLohP7sycSD79yu6HCCaEvSY5NA/msA
         QoX+2mmXqXnJN/QbKn0+BNh3qgcrQFueAq5Y1Jr1zBuhuRhAWvsDUUliIIGnRCbN8pvn
         gvoaJKHLTq7ybkBevCV3sBEHgIu8NnRQjN//TFuzME6DOmCAoBBKDicPHozRemekkyJ0
         9X2Q==
X-Gm-Message-State: AOJu0YwCskK0z5WIbSfkb3jbHRD/sLiWRaMBebEeGZ7zS+dVr9nY6ks7
	hZ9PWMPzYxWCiI8qnRhyirWSTlkCeSzhUGSPHdSuZ15z2fKy63HbIz/i
X-Gm-Gg: ATEYQzzVgS/T4fgopk/3PeIvsYtjN5378ARcVAwiaoe87E38w8EH3ZdDH0ZYjin41se
	vhKJ+f62itdNy9snxdWe5Pi373mFTS1rP4vhPjFcHeUT4vBTOQb+FieEShvNNLgGHNFy/rswJbO
	MO7Ca+5Poktl69zuuUv8R+I556GMbWYFlMNRkyV/bU8uOY2m//OXhzN+PkazybeEoGPF981o89P
	YgOJP5ex5jyE7Pw/HRTMFEZ8jMkYH1wE5bqTOkzyAH7fNMpJB8tL7EEEVuo/2xkvamrie/BFwi1
	VfVns5mwH0jEUHikBa+Bk4VdcrsYZsyTQbpnj3Xqg3TF0TaXX2NyBwg6RwLpMyiJFK8yxvraujI
	2QpsqG0eKWaiq7vYkBlvSiwvLCLNRlIOVfa3E73fKgzLTPdmzNDJ0YKnv796MbMBjCyPA40oYxP
	S349Wxn2kn2SATKCtSQSpXUlx+LkvdnSFr/zaAZalYxWSFC1i2TANW2rKuRL+f0bMOEg==
X-Received: by 2002:a17:903:2f87:b0:2ae:7f84:79e3 with SMTP id d9443c01a7336-2b0cdc40b8cmr70081005ad.16.1774722025127;
        Sat, 28 Mar 2026 11:20:25 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([115.96.68.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427660c7sm28451665ad.44.2026.03.28.11.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 11:20:24 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH 0/2] hwmon: (ads7871) Fix concurrency and modernize API
Date: Sat, 28 Mar 2026 23:50:13 +0530
Message-ID: <20260328182015.220298-1-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses a concurrency issue in the ads7871 driver and 
modernizes it to use the current hwmon API.

Patch 1: Adds a mutex to the driver's private data to serialize SPI 
transactions. Previously, if userspace read multiple 
channels concurrently, the driver could overwrite ongoing REG_GAIN_MUX 
writes before the conversion completed.

Patch 2: Converts the driver to use hwmon_device_register_with_info(). 
This architectural shift removes boilerplate code and delegates sysfs 
management to the hwmon core:
 - Removes manual file creators (SENSOR_DEVICE_ATTR_RO and ads7871_attrs).
 - Implements ads7871_is_visible() for dynamic permission control.
 - Replaces the sysfs-specific voltage_show() with a 
standard ads7871_read() callback.
 - Defines supported channels via hwmon_channel_info.

Tabrez Ahmed (2):
  hwmon: (ads7871) Add mutex to serialize SPI transactions
  hwmon: (ads7871) Convert to hwmon_device_register_with_info

 drivers/hwmon/ads7871.c | 91 +++++++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 39 deletions(-)

-- 
2.43.0

