Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19522C0285
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128889; cv=none; b=TdzexTcguae1ulZlHEprC2BPAxPw0t0d2NkEL7mbzj5kLQSme6sPvzPD16DBLkPYzGg3EZsVFGuxo0oj5Ni4m/U4Sb+Xq87hHwwD+4algaVC66Mt8OtlLzDuZCc6IrWUnGVNUlxnlf7uF/Tr8JH5UKKJIKF+pRcQywcASIvj2Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128889; c=relaxed/simple;
	bh=Ah9T/D7TaKx90qMGMFHvGj88FNtjPUUx01fez6F8Ylk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ocQpV7S/cPVSnWhzTe0ydh19r4S5uHyzZTGL6yb5LR7B31aw5k1oGm9JMFMtl9G8QOgZIM8VGdBOT6aJ0MEbN55g57cQth86M2BD3COE9DPfZQPUqj2n0/o2gPwfW140z8Ld6xLm6ABPM5ZCkW7MK6RIZQA5bQNhtOt3eILlPJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKB2TQ2O; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKB2TQ2O"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so2703524a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 11:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779128887; x=1779733687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JB4aW/MA1IgHT/TNDmbGBxtQNVtFxmmb6HgdJVp+WjQ=;
        b=cKB2TQ2O+VTbKylCcSN1G75VhmughYVliM8BQHCCjJXalOIWgpNopQ7os85xL+Nd/5
         csAgMmzOqigUjp4x/ALvi0sxwB0x3nvg7yUMDaLk9+CFR1w3rPQkOz13LUQOuQnCnCYs
         zuSQqnHfixmfw7obK6sxqTt/Z/HUuibjeRvmwlG39HY5JlxhVOnZUcAfKZXzCqNx9URv
         7+5bQ5SPJ1NdQS8JPrL1rZsDqpg/KGWCIJDhE0OdUDfo6spnLrjVRuikb1doHhKW1fdy
         rHa9qN45vpRD36ehW6GwHMmpBiRMMWLS9eC6M9++MpRK4GA0OyWb+blDa7OExsOdXkRx
         gHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779128887; x=1779733687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JB4aW/MA1IgHT/TNDmbGBxtQNVtFxmmb6HgdJVp+WjQ=;
        b=m+gvgbm39RxB3iHKh1RAYA+hbOhJODG+0mAI3vHu9KShXYF/8O1gKlA8lPAui7CIiU
         gqUnyIwKYO6MgE7vBYYqIpEr1rsLvZmWfx+KcTmuGFqPA2QJoYclTynpk+nZyQoReT4p
         qVcM5qx2MJfp0NuIwbWTHZIsaWh2Z835VQTd7yjWjyuNh6xOCf76YVyiUfTMOLqt57t6
         UINs8RZwq3s6kVWXTNtT6K8agLLQP1EJzS0YDYxSIhPah+VbyMeTOcntsUmvPBBIPSHJ
         dDGiIxKBqxVMcYgxobiwriI2kShLHCME79dDLVGnKaFAgT36VM2D1jOn6oJvqi7Gt/DY
         KDpA==
X-Forwarded-Encrypted: i=1; AFNElJ99O4w6HJ29rtWWW6QaDXMVWa3qUUAAoOSogZ6XxlnKbNbznWsXB9rl4gxtHf3Zjyfd/2EABM1Tff/rHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr8yh8RRLcFOCXIVI2gucf+sZ5aY6gCKIffv1C7ZN6FgcsoKJc
	6oeDwuxo9v9AoR+2KiK2F0XaUB7FfXxNGnod5hz3ASOJQ5mIU089hlxU3dEJmHKgqxI=
X-Gm-Gg: Acq92OHye6sFxvj/4jDV/BWle6RbB/pOTCFGXA2nxJIVF1AeF0VrYn2G1UoimV7XBaH
	yZZ0Iezf62vXS5uFuVpAV8LbrsSybUxPp47e5z0gNTPJhw+pu3Y/MshFFYyTxzsifrAcmDovoP/
	Y/GY32Lrw8VfVH6HHGfUlUUg0VlKf6Ql+xp6P48pDe3FeyRP2IenBiBg5pEw2v62UtOlUDebnOp
	vNe7kitgIoIFJcej/gv/PBX1DJQpgZYq9BKJmRbCIwQ03VzxW1afVOqkBLxUWjddoQlrBIQOtV4
	gV/XYYEL1sZrrsTGbMOfxUZ7vczHLeASAgUHCIIpJdUrwQhZNd+V97r/+h6PTHiKn5E9VJpS6yH
	sTQjQxSGJev76rf1HMn0x9bImTyI06twwASg9+w6rCYxo5RBswFSe/DA9BQyLjNAuHqq8svUgET
	n+2UXFteiBYUIYsQfkexFfWW3RJpMWHa+RNot7CLpoDF3ai5PWfLQj46s6Nc2v8iSrI+nHcVW1K
	/H+nZrw4vHIXg+tWqlSRF6Rc7lYf4+UxEurfCourVikcYxgXcqs1/GqduePQq6f5qfXcopiEg==
X-Received: by 2002:a17:90a:e7c8:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-369518bad8bmr15658986a91.6.1779128887055;
        Mon, 18 May 2026 11:28:07 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-130-21.dynamic-ip.hinet.net. [1.170.130.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f9d0sm159320925ad.31.2026.05.18.11.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:28:06 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] Documentation: hwmon: ad7314: document sysfs interface
Date: Tue, 19 May 2026 02:27:41 +0800
Message-ID: <20260518182744.1302-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the temp1_input sysfs attribute supported by the ad7314
driver.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/hwmon/ad7314.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/hwmon/ad7314.rst b/Documentation/hwmon/ad7314.rst
index bf389736bcd1..b454e617d48c 100644
--- a/Documentation/hwmon/ad7314.rst
+++ b/Documentation/hwmon/ad7314.rst
@@ -28,6 +28,12 @@ Driver supports the above parts.  The ad7314 has a 10 bit
 sensor with 1lsb = 0.25 degrees centigrade. The adt7301 and
 adt7302 have 14 bit sensors with 1lsb = 0.03125 degrees centigrade.
 
+sysfs-Interface
+---------------
+
+temp1_input
+        temperature input
+
 Notes
 -----
 
-- 
2.53.0

