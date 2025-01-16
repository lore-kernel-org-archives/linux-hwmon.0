Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976291D63C8;
	Thu, 16 Jan 2025 09:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018033; cv=none; b=omVTGsHwHdiUUr6NXikr2KSKo85fo+sA4oRC2htrVvqS7SZ5hHdFSoXQeUvr7y9HUW1ameTtO6HZDod9XkTZgOh+bsN2++t1d1Vx+vCiqYjDDlMx7RKuZAjwmLWeEw1yCjmr/P+Eqboon2jIX9mrqijVrlNajsUOTN57puLocgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018033; c=relaxed/simple;
	bh=fOeqFQTkz0oO2BRPwDhe1SH5SwiSjxq3MLVleZ38lsk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=okI/Srl2EJtk3XPXYeoHKgdu3IhnZ9AaU3yTKfJ5lIPoBQ/WE2MRvdtG3YcKO+rGNcenk+cQvF73RiKJikghlf2HgxmkZsQeYQU5L1I/MVjWho6XWUghBsEXl/S6TjyZLI0gC1+N+i0KaCwpLkBlVODhrZHFg2P5nzO9kU5eEOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HciNC40S; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HciNC40S"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216281bc30fso15111875ad.0;
        Thu, 16 Jan 2025 01:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737018031; x=1737622831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJmq2jBPXqTXHS4d3A5l/TTPMj4oU+mV4fv8LNswMp0=;
        b=HciNC40S1gZ5MY7f6vov+RvA38TJ+G4PKODcJE8ThLLRrQUzzpU5OIdi+5HyOyIgot
         YRMQ/2E5pgLgiLi/2r+SNvjpU0O8hJGiYLCRTrYBGL6lpFAH+5FmpV3G8L0zd8Dmuv3V
         EyluJK5lQuCzdE93P3qaBxRK/i/BS9Ltc1BmOfEyPrNx7KmRIAt+kT/rF1gmD6+quiIW
         tU25Wf8D23wQ0U/BwX8h4RUom9N1uQgbp7P6l3U0+Cxn/D7538ZyUwoJpAvQ+IsPdSFq
         VYNhEBvlkhLgC8GMM03bsjhS4sncfgqpRheKXit7KmxFILqmQlKEurlAFce7dmiIAZPP
         DPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737018031; x=1737622831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJmq2jBPXqTXHS4d3A5l/TTPMj4oU+mV4fv8LNswMp0=;
        b=TOJQC/GaXWfAQKsVyIrvRylpyXf9ArlihGxh8yDofkusdk6rLZR2AchOkaekCaabDs
         wNS7hvObvONvALFnFFC3utgPlsp1yKppXA6IPCmbq+j0ugK8pmUp7uFOirl95FVaV6mC
         pGY+0IbQsoJFutDbYpL11lsP1E6hKwUSpoW4PVgMKaAq/LNokz9Mp+pRPyJqq+zd6MDh
         B85SLqKPwVdI+eMUQsMBxmNdv2BPS6cYQo4Br77GY7TmJZHMMERwSgj6BB1anwQbh9Hi
         nCiX2EFKpoKUIOQSfh30KrgSp+yI9u83t5oIYLyQFBJs4algzuXSFH91A/mfcbJjJ1RT
         1erg==
X-Forwarded-Encrypted: i=1; AJvYcCU5RtvYvHxIV+WVQcpo1zu2CDFjmbhkLHjq7NNhFYbJtGcRcsKJf0TTGrnZ9hfKxtHw8Rth5FDR0cxL@vger.kernel.org, AJvYcCV7UxksS03Nwnff1JFNdbe3sar6D1oXqLWrROJDHNpsJ23FsDEA9WlX4i4RLzWAKTGQVDKij+7aG2q3eTE=@vger.kernel.org, AJvYcCVFzqnKk4hhToVcv0YU+i8k4CCzRummCC9lAamt6XG20sM6OkBi7GleMX4JV559iyBAS1hdV888avI3@vger.kernel.org, AJvYcCVd0mc9w/+wuPwi60qe/7B9P0LVufyzz04OrLeD4HB1u5G7l5GQAZgvGi+P/OTR4HRaDvVRk3doVkDofz8l@vger.kernel.org
X-Gm-Message-State: AOJu0Yw06uIa+yevGcrn3wlA+sEkmEb1+KtfUqQRTgJkYf2j91BWeMAK
	W7ALZx3n1C2yNenEpp6Fbs+Wszf3RiBdRzyMmbqqSh/LHvFyfqlS
X-Gm-Gg: ASbGncsOb3ZRfB29LzV5ID1UVfxGj/S8uXkw9+eVRWY/UZCbN4NIRlxLyPOPiDEMX8I
	zhlmKj+t6z27cDu7fiMS0JCd4dDgRfBREMSXXIK/BbrR6vbQKDspWY2oumT2baXxmX1CnEQde/D
	Xa84XJO348Y5b9Fy2KTUFVxEhljtEmFDy/d3Z6CHHP4frTwm3g8m/yTM44pONyoRZqx4lk1IGLz
	vlghe4SEfEjjlB5XZcpxkYEoZlq//Bx4yPBcI8XqXeL1NHUBms0J6ns54fqHczQmOoDjn7RpUAK
	XJV74p10uraokEvU5OD0e0xpUQyAZ+BHlAkGbA==
X-Google-Smtp-Source: AGHT+IE0Cpjsxc2FULktw+K/7aT48vNuA5CL68xU1dnTqp5qZWNlDL2RTlYc9qinysHxmjy3YCFy9A==
X-Received: by 2002:a05:6a21:7101:b0:1e1:a56b:9d6f with SMTP id adf61e73a8af0-1e88d134088mr52167398637.24.1737018030752;
        Thu, 16 Jan 2025 01:00:30 -0800 (PST)
Received: from leo-pc.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40594a06sm10395721b3a.80.2025.01.16.01.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 01:00:30 -0800 (PST)
From: Leo Yang <leo.yang.sy0@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Leo-Yang@quantatw.com,
	corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Leo Yang <leo.yang.sy0@gmail.com>
Subject: [PATCH v4 0/2] hwmon: Add support for INA233
Date: Thu, 16 Jan 2025 16:59:38 +0800
Message-Id: <20250116085939.1235598-1-leo.yang.sy0@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support ina233 driver with binding documents.
---
Change in v4:   
  1. Change ti,current-lsb-microamp to
     ti,maximum-expected-current-microamp.
  - Link to v3: https://lore.kernel.org/linux-hwmon/20250115015519.950795-1-leo.yang.sy0@gmail.com/
---
Change in v3:   
  1. Modify the content of MAINTAINER file.
  2. Modify the content of binding.
  3. Current_LSB is an unsigned integer, so coefficient m cannot be
     negative after calculation, simplifying the calculation step. 
  4. Current_LSB uses microamp unit suffix, change code to read_u32.
  5. Some typo fixes.
  - Link to v2: https://lore.kernel.org/linux-hwmon/20250110081546.61667-1-Leo-Yang@quantatw.com/
---
Change in v2:   
  1. Merge the binding files into ti,ina2xx.yaml. 
  2. Fix typo and non-sense dev_err.
  3. Improve program logic.
  4. pmbus_driver_info changed to be allocated in probe.
  - Link to v1: https://lore.kernel.org/linux-hwmon/20250106071337.3017926-1-Leo-Yang@quantatw.com/
---
Change in v1:     
  1. Change to pmbus standard practice of getting MFR_READ_VSHUNT
     through vmon.
  2. Change the way MFR_CALIBRATION is hard-coded to be obtained by
     calculation.
  - Link to origin: https://lore.kernel.org/linux-hwmon/20230920054739.1561080-1-Delphine_CC_Chiu@wiwynn.com/
---

Leo Yang (2):
  dt-bindings: hwmon: ti,ina2xx: Add INA233 device
  hwmon: Add driver for TI INA233 Current and Power Monitor

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |  30 +++
 Documentation/hwmon/ina233.rst                |  75 +++++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ina233.c                  | 191 ++++++++++++++++++
 6 files changed, 313 insertions(+)
 create mode 100644 Documentation/hwmon/ina233.rst
 create mode 100644 drivers/hwmon/pmbus/ina233.c

-- 
2.39.2

