Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE3724A042
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Apr 2025 23:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744844539; cv=none; b=Z08fwzDXClTM+lg1vFoOoqEMUDqSqEqMeGrw4o8oGsUS/kWd37Gjt/9Q+yPDWFLF5nr4kRJ3OqI/tKSPG/Zz4COgLnHI35BtHDrg1HDrtoLxhcHhzGJBUNZO2FdWVzs4KXMAB/cZxfdpCTjaJmOI/M/xJ3MMR50AQjyNDXFNSVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744844539; c=relaxed/simple;
	bh=fWtti9w8UDG1XVNFyZUKhSAcywIg2345H80HPsGPyMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDlxOfpvPbLKSmwt2rIQYU2xyLyND8+9IimZ8blu7vwuaf/q+717E+n75Z2QQRrnHNUE6k6VG6Jje2mg7gBTIrWkOkivZz39yK863k9tfWcdBzB2N+bDKbPkEFTuxvCgwmOG82rYYuPwGffYfl63KtwVoLRO1+PHaAcSZwtxQf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPWQgege; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPWQgege"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22438c356c8so2151695ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Apr 2025 16:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744844537; x=1745449337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=C1A2u/0nBSYPB57dZYj8qgLj6Sv5QbZ69xzB4LE+cA8=;
        b=RPWQgege5adrYNNLZgj9SzbxJq/WgrBwRWBYSOkzXoKGjII/AGtQvaCfDDvUfgIkzM
         7UpBPSWiC14p8HjZCbxtW5xHSjA+P1bC6kH1r5iCQ8bGhrJlkKYf7+PEYkfrQ7Wq3oKW
         3G3yDCmQ6Uqydrt1IHPmvcPO14vcKz3H39SEKG3mTIpPR6n1+dLjmDkG3aa1Ubxpljja
         UQ6T5sU0GTchDsKFqSAZM7eKW0QZVuPxN08eI68FnF5dYtLpw6J0C7TQ4IZO2bztHFOr
         KeAXl4Qyd+zZz747nGdZWiVdfl0iq8gOdk0RyAQYIWrR5mpUEUZu39Xfzl7xIlf+UWvk
         C9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744844537; x=1745449337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1A2u/0nBSYPB57dZYj8qgLj6Sv5QbZ69xzB4LE+cA8=;
        b=QWs6yXAU/Him6zabc02fn1WVnTwsMlGslz2X09/JgRQfPYGffhWp84R3qY4WL/Obqc
         fEklowVHqKvvOrMI1MWf6aCPQO46Og1QgTk0BYWYNP7pLPXBwqZxC34Zhf64hbqUZVeQ
         DoqCGyFjcEhbhXJzK67oe3nksWcOI1ejrE8ja48x4lQfZNhOdk/kAxQg/NM/mlnQnsGB
         dMeiYCmvAqFlmOBFQuBWy8iyT1v6/6Go68Ik2zL3LRGmXuEtYv5BPnQF/yizCExecQhg
         Z0kgrb7goMnVK+DTKMJtMatENeK0n/+2X2mCj5+pnku8w03g/9X7eX+wVa9s3w49HM0W
         RMzA==
X-Gm-Message-State: AOJu0YxMXECQNRzSefAoeSSO3zE/XHeM+123G71ynsyzf4iDHHAiwMxl
	gXDNrOQaubA3ioTvYJ40YWqS+TmuuwroIf2la+iI/o48XTxjEwGqyC8Q4Q==
X-Gm-Gg: ASbGnctrFHAjMlir/sokd9I/M8BuRAIL2QyfMY8P3BloExIYemS1mZHCfzAGeZ4M37s
	V0NwAm5JGJ/0q9fGwoO0J3XcPlgMOB2y6mOFX5q2MSUSlaW6V3qxr7jrTaaHkJG+afoC/Dgs/2P
	Wr6k93BHFYPmx+qmDQLQPytggs8Mr/CQ1nbFctHIM/fP52rojbcBQnZtBN0ovt96QvslQ6zhgbx
	8VFe8eym8LJ1tk0LtxF3YbEt90wWNpyahVHCN4TWzfnA8k2Zzf+PmK3cf/DoA1aV9L2ZNf90jTt
	wEfHGP5GZogI6nHUmOk4kIsT2rCv7ZYyd4GNUkKTnEwECDPhqOeo+Q==
X-Google-Smtp-Source: AGHT+IHr/ln10RawO2HTh+G938qzfXmdlR7p6teFtiMBgp57yeCikB4vALj5oIbIoezmoej1fbFeEg==
X-Received: by 2002:a17:902:fc86:b0:224:11fc:40c0 with SMTP id d9443c01a7336-22c358c509cmr55174605ad.11.1744844536866;
        Wed, 16 Apr 2025 16:02:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcc04dsm20065355ad.200.2025.04.16.16.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:02:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	kernel test robot <lkp@intel.com>,
	Johannes Cornelis Draaijer <jcdra1@gmail.com>
Subject: [PATCH] hwmon: (aht10) Drop doctype annotations from static functions
Date: Wed, 16 Apr 2025 16:02:14 -0700
Message-ID: <20250416230214.2016863-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

doctype annotations of static functions have little if any value.
Drop them to silence 0-day complaints.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504161919.duDL1s2X-lkp@intel.com/
Cc: Johannes Cornelis Draaijer <jcdra1@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/aht10.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index 312ef3e98754..d1c55e2eb479 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -94,7 +94,7 @@ struct aht10_data {
 	unsigned int meas_size;
 };
 
-/**
+/*
  * aht10_init() - Initialize an AHT10/AHT20 chip
  * @data: the data associated with this AHT10/AHT20 chip
  * Return: 0 if successful, 1 if not
@@ -124,7 +124,7 @@ static int aht10_init(struct aht10_data *data)
 	return 0;
 }
 
-/**
+/*
  * aht10_polltime_expired() - check if the minimum poll interval has
  *                                  expired
  * @data: the data containing the time to compare
@@ -140,7 +140,7 @@ static int aht10_polltime_expired(struct aht10_data *data)
 
 DECLARE_CRC8_TABLE(crc8_table);
 
-/**
+/*
  * crc8_check() - check crc of the sensor's measurements
  * @raw_data: data frame received from sensor(including crc as the last byte)
  * @count: size of the data frame
@@ -155,7 +155,7 @@ static int crc8_check(u8 *raw_data, int count)
 	return crc8(crc8_table, raw_data, count, CRC8_INIT_VALUE);
 }
 
-/**
+/*
  * aht10_read_values() - read and parse the raw data from the AHT10/AHT20
  * @data: the struct aht10_data to use for the lock
  * Return: 0 if successful, 1 if not
@@ -214,7 +214,7 @@ static int aht10_read_values(struct aht10_data *data)
 	return 0;
 }
 
-/**
+/*
  * aht10_interval_write() - store the given minimum poll interval.
  * Return: 0 on success, -EINVAL if a value lower than the
  *         AHT10_MIN_POLL_INTERVAL is given
@@ -226,7 +226,7 @@ static ssize_t aht10_interval_write(struct aht10_data *data,
 	return 0;
 }
 
-/**
+/*
  * aht10_interval_read() - read the minimum poll interval
  *                            in milliseconds
  */
@@ -237,7 +237,7 @@ static ssize_t aht10_interval_read(struct aht10_data *data,
 	return 0;
 }
 
-/**
+/*
  * aht10_temperature1_read() - read the temperature in millidegrees
  */
 static int aht10_temperature1_read(struct aht10_data *data, long *val)
@@ -252,7 +252,7 @@ static int aht10_temperature1_read(struct aht10_data *data, long *val)
 	return 0;
 }
 
-/**
+/*
  * aht10_humidity1_read() - read the relative humidity in millipercent
  */
 static int aht10_humidity1_read(struct aht10_data *data, long *val)
-- 
2.45.2

