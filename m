Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D2A2FBDE9
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455535; cv=none; b=X7DiYjSbv5ps507kAVM3Z6oZXyOU3DhsfuLS/pOKDWsQV2JVQJM3ymZrlhpO4hgW6JxJITG/Hbs3/gWkAz6MoqgTFo/M5wgUzo31CBsDY30PmpcWmA41QudzWeIjJwtOahAUZWAKeTB0kJyEBUCsxYU64dWctNrCJ34S1ZN3j64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455535; c=relaxed/simple;
	bh=c+mUIUVu8JHQwnN1qI7Jejcj8dIb1RXsRmV7MZ+XuI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lZpkNc381pRGAt9AuSVkufkUV/r0Q5LyAC+3W4nKegnkuoViiFjyeXP0K1nEsXWoQe7Z2ORYhLwbyYf7iZ1gCRz9dWCRArZ2PMOnBm3hzEsJdmPtqRUMS6b/YmPiXTcy52vf0O8qAIrAvHoTcP2IR8qixP7YzZuh1TVzU1MNbGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuDG2haz; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuDG2haz"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so4366951b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455533; x=1761060333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiDG4MT8CEq7ZxR8AimubpJuLaph5HFyCwkqjlbZVY8=;
        b=YuDG2hazoJGxEXJK+9FfDFd3wrxzAKDd8sOMN35PTAbBhDN3LIWE5iNUpUC+4vS8lI
         rfXZ5hwhQ5DoPIGpm59lxABK71Kyu4P8wt8qIdnDkn/5R6nExMYBA90BAF8vZjTfWqDa
         o1/7u6q/FDPv1kOzAU4Fv1KezGF7ml/t/JH4pYGyHkA8L8gZqADX+yy/wmS31NCA7ZLx
         JdD49f+6uJyxdFaxmFo+LUDNV8nwv1HTJaYWFu3t/RVaHA8wqDLylw49zcIEEWn9Auj9
         0agRqd2Yw9P9yamLzwC4g2k6hlp7KK0tPNeLm5MCR6zMt1KmTf5VrlZx3rRiQyXqsSft
         KfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455533; x=1761060333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LiDG4MT8CEq7ZxR8AimubpJuLaph5HFyCwkqjlbZVY8=;
        b=YinafwNQCXACYw+hPSWEIoy7VIYjwixrURQs86SMaA0RwTH6nw+k43+WqoPmmITPEd
         v2ZfY8RInNW7Xwffnsx4QrUgTceyTgGUD2zl1rAV9x21zqQKF21t5pNTRq0DMlNiMBrs
         cZ0HKuoA8kmWvOOzDnb8qBmxHrn/9h2aWUegC7qG4byoKqu9GubqTivwCSxnU6Zy2HID
         9rpGYbG+0+0HXaM35hdJJp4nOCw+nl9JifIcow6Il6y4qLOGt5BkF24khrPWINH1okdL
         CKnXBZBPhzdlnWFcTZya8VTFAD4TCRD5f8TvJePbSHswc7j1GO6JYB+o4Ohr7jS6tKAR
         cO3g==
X-Gm-Message-State: AOJu0YzC3Sk1BBXtdOPNSFpO8nodj3dYMXHtjQXW0gfR2R5mknsMFCzB
	Rdv/W0/OpRP0xc4//nGSsaXeu6WsHDFOOVcmgg182vJ64HkZgtQ9DAkk85bb0g==
X-Gm-Gg: ASbGncuV7MWnsCjgbAADkY+5Q2k4IMtR5UEKZVSDIzvh0DCQsnAct3cnUWDjOqbB/e/
	SMVeZyXB90woLPWV9cygkWXoGUKVVkaA1XYFTtWgQlgrkjP2WzlAKszbxkU/GRagaYyiTB4FbLm
	r9zqzjT+wlohx0YlBu4GgccCUgjAjItPzvmzSRpjgfwjbmhO0Kgin1EmllpEwjnxAJeSGdBg9tc
	oSKNbcnmRx+Vhy7+cJEdXm24pRCW0+0fqqKABzBm6h068mJ38L/9ktdF2ihSDEtyQKPwjFq3xUm
	lPEsGrvTPRakTh54tbfdakqcMDqWTUueRdVe+dDs6bYYUMcPSzIczEUi4c/PGUPl8wprkbRPTzX
	IhU/DbUM4NWVYRPkCHzMOdsaSPIFoiFkY2wM/eLQSZNW4Ob5lRwCLPQ==
X-Google-Smtp-Source: AGHT+IFmjmgX888YFrG1+lYqa53MyvTEbPzj2vckjZ0CEKOHhF+6diYive3E16djvbJwy/neRGfYBw==
X-Received: by 2002:a05:6a00:a0a:b0:77d:13e3:cd08 with SMTP id d2e1a72fcca58-793859f64aemr30411877b3a.5.1760455532521;
        Tue, 14 Oct 2025 08:25:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060bc2sm15623261b3a.3.2025.10.14.08.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/20] hwmon: (drivetemp) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:25:04 -0700
Message-ID: <20251014152515.785203-10-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/drivetemp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
index 291d91f68646..9c5b021aab86 100644
--- a/drivers/hwmon/drivetemp.c
+++ b/drivers/hwmon/drivetemp.c
@@ -102,7 +102,6 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <scsi/scsi_cmnd.h>
 #include <scsi/scsi_device.h>
 #include <scsi/scsi_driver.h>
@@ -110,7 +109,6 @@
 
 struct drivetemp_data {
 	struct list_head list;		/* list of instantiated devices */
-	struct mutex lock;		/* protect data buffer accesses */
 	struct scsi_device *sdev;	/* SCSI device */
 	struct device *dev;		/* instantiating device */
 	struct device *hwdev;		/* hardware monitoring device */
@@ -462,9 +460,7 @@ static int drivetemp_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_temp_input:
 	case hwmon_temp_lowest:
 	case hwmon_temp_highest:
-		mutex_lock(&st->lock);
 		err = st->get_temp(st, attr, val);
-		mutex_unlock(&st->lock);
 		break;
 	case hwmon_temp_lcrit:
 		*val = st->temp_lcrit;
@@ -566,7 +562,6 @@ static int drivetemp_add(struct device *dev)
 
 	st->sdev = sdev;
 	st->dev = dev;
-	mutex_init(&st->lock);
 
 	if (drivetemp_identify(st)) {
 		err = -ENODEV;
-- 
2.45.2

