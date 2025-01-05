Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE782155C9E;
	Sun,  5 Jan 2025 19:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736106954; cv=none; b=q8NxWIP31/S34vBSX+wJju3iZl1mlaW1ooLnueJBpWS1/Pa8txroboX5YbZRIpa9YSEKrlf0TL/Qit0R8oc585cC8TT5ZhPmQk4fjYNCmRK2JSpcq3wgYAjXFlRpD8B/c2FLvuSZ106BBmUqWd7SS6vnk1zL0fENFr9VyyhsBIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736106954; c=relaxed/simple;
	bh=VQ4AZoglesRDAKFtv1E3KHtLtl3qcLaDh3ig1cKWlc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W71aPN6+o6iyeAL9jeULcN5gaTwJ1mQMXYT9W7xJGZ+GC5v7BNQKYQRYVrhEEi9FOtvPs7C9PjlSZ7drJ1OTtkp77iqCPaKynF6DxIGvHF42pxa+HxUGEUXy5ZIiA1A4MJKkXhgcHP3qI0nvCrjXXQQM3OuMt05Gvur6MAcanh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBldADIH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBldADIH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361f796586so142125585e9.3;
        Sun, 05 Jan 2025 11:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736106951; x=1736711751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpaTCNzT+T541hPCx0yKcSnmSLn4z8zUL5h3nPbVQLM=;
        b=GBldADIHhlY2g2a2VG9WLn39lEjUl+IayFKnYz9rIA98JFf/eYNsb4ewWD66haTgU4
         jb4N6oiTHr3Lj48KcxC4MHZk5A5oOikBVDD+gglI6wj45s9TOBGyXXfrtVGFbnM39RL9
         nOXhxpbh5B2tdltxbujbtbtHFKHFBnBb05unYaPFmQdg2g8Lqn2tW31gNrr4j9pKrPQu
         2reJXP4dP7OPJpyBQIHBrW91AKxMCAcky+/nS5r5ZbTlwbznCL9HpeO4ef2ooTkpL3r0
         /Gdvsz6yzfyE/zRrCa7/P82+F4WeBq2g/gvie7gqbxIbOiNFrmW/8f8z0Pti/1d/y+hu
         VqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736106951; x=1736711751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpaTCNzT+T541hPCx0yKcSnmSLn4z8zUL5h3nPbVQLM=;
        b=PKxzS2QzTeY10CJYrIqGPyj6gIV5g9h43mydTc4ynx2YLN1Yuxu0JQd9002EBLwRW3
         abwfPiKfHdFNUFQiBRpG5fo2KYo4uEwcJ7QCiH0Urb+G4C2uwXSwapYu2zNEAlSZT2hQ
         lRiDKq0R7EJHcRifgvrcKtDft5Ma9aRfSAyCGu/dZctg5Y/8ATjO/oFx681bQe0f/b6U
         q7nJdkxu+x33jacyhzmlc/molpNgjWX03XKl57q8BPmxanMYIjru+uF8XC+Ce/PxKu0G
         /WlsJ95iCjHusjACOFmHjPeTIVbN+8VBi0FZW18a3388KsQYtT4uBqDhy/mdywjyYnM+
         T0YA==
X-Forwarded-Encrypted: i=1; AJvYcCVO6eJnTPCCoFFRAV6DxpKlw3Xur+EUTW0Pq9g/3MUQvE5tOF994uSkSWetAzZu7ICHQhFW34cPqKPs/ejM@vger.kernel.org, AJvYcCWziQlZzQp+cbpPGDy5HmFCSD6Vjb5qlPp9MXB4OIBpkRcDuyVWwpkp8yvIBu3A3UfZTpDvqJLOoSoWkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR4I6YAVawXfn2R0RjRcE9vRNs2QUB+qJUSZ28nH4ln8H5ih2C
	XZbcsQEhndYPR3ifvUWCmBJHEEQF6aH2N14d9igrTC8PgdMUDWwL
X-Gm-Gg: ASbGncsx85nXhtWS8UNy369FgvXaOLCsSpahZzDDZMRJrzzjfbZWYtJUMZ7WbyLO9c2
	k8dK6wxEFSSmvuhRay92y+QPE0K0QV+av7WStzNvdSx2+i2J4ApY0GhZL/RE9Z0zAGaNlalc27+
	GQEZQG/bWRwoildO5iVL8gU54btxJ1SFHtxUUNnkSsmoHPCDZUkpIHr6hzw2G5HKRZcajaPQDO6
	Q1HzlxOl/8J1mxVxvi+NRz2yh2+WteAsiD3+kr1DtU3BkbQnKpQqBi/RPUv
X-Google-Smtp-Source: AGHT+IEU0Jvwx0vaJpT0ki4SCTYMMj05oWyCMF2PutAJUTORi3bjyZy0hpSCerbMjLGaCsJtFqyviw==
X-Received: by 2002:a05:600c:1d10:b0:434:ff45:cbbe with SMTP id 5b1f17b1804b1-4366864414amr520384775e9.18.1736106950890;
        Sun, 05 Jan 2025 11:55:50 -0800 (PST)
Received: from dell-f2yjyx3.. ([185.32.209.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1143dsm577778975e9.18.2025.01.05.11.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:55:50 -0800 (PST)
From: Adrian DC <radian.dc@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian DC <radian.dc@gmail.com>
Subject: [PATCH 2/3] hwmon/adt7470: resolve faulty 'temp*_alarm' values read output
Date: Sun,  5 Jan 2025 20:55:15 +0100
Message-ID: <20250105195521.3263193-3-radian.dc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105195521.3263193-1-radian.dc@gmail.com>
References: <20250105195521.3263193-1-radian.dc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested with the following script:
---

{
  # Access hwmon
  cd /sys/class/hwmon/hwmon1/

  # Check alarms
  alarms() {
    echo -n ' [READ]'
    echo -n " fan[1234]_alarm = $(cat ./fan[1234]_alarm | tr '\n' ' ')"
    echo -n " temp{[123456789],10}_alarm = $(cat ./temp{[123456789],10}_alarm | tr '\n' ' ')"
    echo ''
  }

  # Configure hardware
  echo '0' >./alarm_mask
  echo '10' >./num_temp_sensors

  # Test fans
  for fan in $(seq 1 4); do
    echo " [TEST] fan${fan}_min : Min FAN speed ${fan} under limit"
    echo '65535' >"./fan${fan}_min"
    sleep 4
    alarms
    echo '0' >"./fan${fan}_min"
    sleep 5
  done

  # Test temperatures
  for temp in $(seq 1 10); do
    echo " [TEST] temp${temp}_max : Max temperature ${temp} over limit"
    echo '-126000' >"./temp${temp}_max"
    sleep 5
    alarms
    echo '127000' >"./temp${temp}_max"
    sleep 5
  done

  # Test clean
  echo ' [TEST] Final state'
  alarms
}
---

Faulty values:
  [TEST] temp1_max : Max temperature 1 over limit
  [READ] fan[1234]_alarm = 0 0 0 0  temp{[123456789],10}_alarm = 0 1 0 1 0 1 0 1 0 1
  [TEST] temp2_max : Max temperature 2 over limit
  [READ] fan[1234]_alarm = 0 0 0 0  temp{[123456789],10}_alarm = 0 0 0 0 0 0 0 0 0 0
---

Fixed values:
 [TEST] fan1_min : Min FAN speed 1 under limit
 [READ] fan[1234]_alarm = 1 0 0 0  temp{[123456789],10}_alarm = 0 0 0 0 0 0 0 0 0 0
 [TEST] fan2_min : Min FAN speed 2 under limit
 [READ] fan[1234]_alarm = 0 1 0 0  temp{[123456789],10}_alarm = 0 0 0 0 0 0 0 0 0 0
 [TEST] fan3_min : Min FAN speed 3 under limit
 [READ] fan[1234]_alarm = 0 0 1 0  temp{[123456789],10}_alarm = 0 0 0 0 0 0 0 0 0 0
 [TEST] fan4_min : Min FAN speed 4 under limit
 [READ] fan[1234]_alarm = 0 0 0 1  temp{[123456789],10}_alarm = 0 0 0 0 0 0 0 0 0 0
 [TEST] temp1_max : Max temperature 1 over limit
 [READ] fan[1234]_alarm = 0 0 0 0  temp{[123456789],10}_alarm = 1 0 0 0 0 0 0 0 0 0
 [TEST] temp2_max : Max temperature 2 over limit
 [READ] fan[1234]_alarm = 0 0 0 0  temp{[123456789],10}_alarm = 0 1 0 0 0 0 0 0 0 0
 [TEST] temp3_max : Max temperature 3 over limit
 [READ] fan[1234]_alarm = 0 0 0 0  temp{[123456789],10}_alarm = 0 0 1 0 0 0 0 0 0 0
 ...
---

Signed-off-by: Adrian DC <radian.dc@gmail.com>
---
 drivers/hwmon/adt7470.c | 52 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 712bc41b4a0d..afb881385dbb 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -551,7 +551,40 @@ static int adt7470_temp_read(struct device *dev, u32 attr, int channel, long *va
 		*val = 1000 * data->temp_max[channel];
 		break;
 	case hwmon_temp_alarm:
-		*val = !!(data->alarm & channel);
+		switch (channel) {
+		case 0:
+			*val = !!(data->alarm & ADT7470_R1T_ALARM);
+			break;
+		case 1:
+			*val = !!(data->alarm & ADT7470_R2T_ALARM);
+			break;
+		case 2:
+			*val = !!(data->alarm & ADT7470_R3T_ALARM);
+			break;
+		case 3:
+			*val = !!(data->alarm & ADT7470_R4T_ALARM);
+			break;
+		case 4:
+			*val = !!(data->alarm & ADT7470_R5T_ALARM);
+			break;
+		case 5:
+			*val = !!(data->alarm & ADT7470_R6T_ALARM);
+			break;
+		case 6:
+			*val = !!(data->alarm & ADT7470_R7T_ALARM);
+			break;
+		case 7:
+			*val = !!(data->alarm & (ADT7470_R8T_ALARM << 8));
+			break;
+		case 8:
+			*val = !!(data->alarm & (ADT7470_R9T_ALARM << 8));
+			break;
+		case 9:
+			*val = !!(data->alarm & (ADT7470_R10T_ALARM << 8));
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -648,7 +681,22 @@ static int adt7470_fan_read(struct device *dev, u32 attr, int channel, long *val
 			*val = 0;
 		break;
 	case hwmon_fan_alarm:
-		*val = !!(data->alarm & (1 << (12 + channel)));
+		switch (channel) {
+		case 0:
+			*val = !!(data->alarm & (ADT7470_FAN1_ALARM << 8));
+			break;
+		case 1:
+			*val = !!(data->alarm & (ADT7470_FAN2_ALARM << 8));
+			break;
+		case 2:
+			*val = !!(data->alarm & (ADT7470_FAN3_ALARM << 8));
+			break;
+		case 3:
+			*val = !!(data->alarm & (ADT7470_FAN4_ALARM << 8));
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
 		break;
 	default:
 		return -EOPNOTSUPP;
-- 
2.43.0

