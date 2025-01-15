Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D1423243D;
	Wed, 15 Jan 2025 01:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736906183; cv=none; b=iRKunEWBpTzzIbrcd09FkwK6qSm7wX8nuYBjWkVAE1stpxFdCY4zy2DisUjQ5CFNytjJuMX0unJQ0wd60Gh9lfLE2Fk85hRr8fNNE6nLaPQlxn1DbJ82+odEEv36uGJHDcO4Dqaht+ZmLFLeWHgZPn8cHFwsCySt75FQ55Issnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736906183; c=relaxed/simple;
	bh=imfoAf17lHfM1IT8K2KPYSlFBxY57wzX8jcVDSWUUdo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RvBxZ2wINDPWbB6pTm4nsglKAOzmO06DE8Ub3cTUvCIzvbBE2drqPWjFdWUuY2tKJYeCKmBU3RIUG5uKjpTnW415lTrY1bCjrhF0c3RMffhPAD9hMDYR/0YaxosC+2/JZKdscXFxVo0zhQjqIepnOlV+MhmvPs0pxSUH/KjnJW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tn1/G5VY; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tn1/G5VY"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21670dce0a7so134081415ad.1;
        Tue, 14 Jan 2025 17:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736906181; x=1737510981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cdPdXOsn9tYdTyrxjcOb60RqNaBCP2F3FZbxVZ/ScWY=;
        b=Tn1/G5VYiPqyrJ72mGlm5YC/qhwq8Nj1OMlAa/SqyMatTNbCCfrN10lbHG6hmK6NqE
         C9MdGJ1H9b+zzH26CKH65Jf6kK4yhOy3dLJ8CZ4GpEwNqzLHVbFlHrZLM04+Pt84Hf4V
         Z2GY2jduWdLtfNrn6ZV0r+a/bN8cM03Ck+JyGX71AfnkUcObe56QMDdDWwMUBctJ0zlX
         mwtjMgIXbsqvsfUpBDlU3YCI0p55eAbjFN+7KkF74kVvvztkPKxD7tBOG1rGZMnsPZcU
         Muq3dGhdLLdmHy+K0n+S6Jc8WXoMMf2NFsXUREWMVBfKazKtITNfg2FA3OkiQbK5zao5
         OShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736906181; x=1737510981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdPdXOsn9tYdTyrxjcOb60RqNaBCP2F3FZbxVZ/ScWY=;
        b=TbGTpjZHECJ9m5Vrely/P6UO2bJ5wYt0GpONwNGuu45FMZ3oCRC+j95lRdKj3Qc2kD
         69mBw0GE9x0tXTgOzauRUzm7aHx25o6HbnyG4HwYFuYIJKmWDrzvZiJlhgOG8A9Ajw5B
         vz9B5lw52ueDkyyQA9wOM5b8pEqzj0/nbjL/Kw2Vj7aqeIsxRBbdDvZDlsqbfmzsOKBu
         mLnnNpC2K/8UFMgNFPnIHTfZS2oq2IovLF9EsHOoOuSw71L4TIPUbtxSd1EnEi8BxQb1
         4MtSrlMsQDmMwDA6tbapktaBqBNRpm9glVt2CjKoePZD/Zx5dUuxask2CHHAXyBWLBhI
         A6lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsa4hGN5i7b+Tkyd0dI5JyaPtGxZ1l2OyhXYa+0wY0GlM48DOtoAoAWBUwfZgSnC04V5P4XK/cXMFpjAY=@vger.kernel.org, AJvYcCV7GmbmXzBiA6ngrzKYtJlp4CcgDlCas1W6pniuUSdh1Yoh9xMoGgRraKkEdlrDGuVM2v2r3HvvyXn3@vger.kernel.org, AJvYcCXk/6MSYJ2RmAJpq+7SKpaAVOzq0jjr0v5GIstY7sKoAxgpV8HZ9S/h190yWcxVjoSG9nxC74e+CWHF@vger.kernel.org, AJvYcCXklIHwGsMAjYichF6fiwFvJB21kF0p//+bKDqs5/HekRtguBNlO6DftDGYJe/hYiSMBRen+mAXFnRlSLHN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy5T1C3a5AQqwLvezdDVX3MXnFWKWghLjW5u9ZdkLhecvg/PDx
	RKg6n1ZbYc1M9jioywzJl4ygxYRZPSK1INGaopATsdcKtWts+cRl
X-Gm-Gg: ASbGncupEnmkeWFWIzmqb+Wpnrz574bT2YKRI9YmSSDUgIx7D+jMLvk4j1fOlRhlKHX
	mTmYxL/FFj4rl67eEmeCIcpyC2qi78L/erQy5oVh145h27mRqAlTo20/MOBGanMTGLqBTkCgIW4
	4s+jyj1Hi3V0LgBlwJHahlsm+pRyysg09Z/qAHDrySy9iQMORkxxdp2pvi8K4ngE8wVz/yf2E46
	Eu8XPlu715jmHiORNmMj3+ks7YrxTLZOvsrD8Y5+AvoIaMLM7GzcBx02twVgLgXTi5fZ2NDOGSX
	mStAYsQBpbE18snswj94gPHdn17ZX9141qs1sw==
X-Google-Smtp-Source: AGHT+IEDWODr5b/x+9gF3ywBqQqyPG+a23Wbut7noGI+1V+Wj59b7ksWF6R6yxyCpT88fglCVoUPEA==
X-Received: by 2002:a05:6a21:7e02:b0:1e8:a374:cee6 with SMTP id adf61e73a8af0-1e8a374d574mr30757151637.6.1736906181305;
        Tue, 14 Jan 2025 17:56:21 -0800 (PST)
Received: from leo-pc.tail3f5402.ts.net (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d402cec11sm7943328b3a.0.2025.01.14.17.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 17:56:20 -0800 (PST)
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
Subject: [PATCH v3 0/2] hwmon: Add support for INA233
Date: Wed, 15 Jan 2025 09:55:18 +0800
Message-Id: <20250115015519.950795-1-leo.yang.sy0@gmail.com>
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

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |  29 +++
 Documentation/hwmon/ina233.rst                |  77 ++++++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/ina233.c                  | 184 ++++++++++++++++++
 6 files changed, 307 insertions(+)
 create mode 100644 Documentation/hwmon/ina233.rst
 create mode 100644 drivers/hwmon/pmbus/ina233.c

-- 
2.39.2

