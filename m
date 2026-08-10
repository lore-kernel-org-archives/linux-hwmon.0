Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D5437F01C
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 04:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786336129; cv=none; b=GbRwvoqCqG2IeqgzNWEvoFzrMRUTcLMW9fjXvNE72rdtQAxGAZgI8dNqgYZSQMlPl0wHwV0rrOdPjk8tQSw3+x7GVPkvd+MoE4K3olFhQXp1rX3cncA3XeEoXcXQjOAYDwJR2fJ0N4fCOHEn7AIGcioKLqy+HxRid8j4Jw/IkcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786336129; c=relaxed/simple;
	bh=wkVugtm0RK+PqsY5OjF4fBlE5x70gVAyAJs2seIi9es=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qe96GoTh9ckNSHgBVCfMLFN50j+rqV0SBIDgIQ49lwTa0d2oa09YVjt7ZXK/3PifHT84aTrmUqTz5t+Xt/L6QtnwNwobpTdK894E5vqXJlUVTNazvGuJXWDIuEMGgIZxv0IOwPas4oo2QFpFNYPyaFuKp7+Zi2Dboe/dmxzBirs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akVIE+0Q; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akVIE+0Q"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1145799a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Aug 2026 21:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786336127; x=1786940927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pX6MMBhGhY7ZKweNH7lUk+HVieNOWtynN9b6a3M3yBg=;
        b=akVIE+0Qi5UEm8UKi2qA3qGTOxBfhlYstQyXYTrO35vZ3UfXP1V9uSOe/rNZb85KpQ
         vpaO0XaoEb3jdZ99eX8Sh7g6c9CkUE+e6Wen21C9AVVJNUr0vvPnS9T/lFf6Zkrg3+nm
         1xz+kAOJv9c/9th0HShtVyz0xWX29XmTL6/mJxr3t5LUTfqkFC2PXXhKOoVwLFKDkMP2
         vtmIkAIOdCf/G+lTh8OfjH1CUn9ZrSNT2tnAiuvPsCOoy/2vOPM2enGhQ6tYKWYFJOgn
         QuN3GW8/6JN3wU/DCO845e30S6rBV4ukxggAJNbmDps504wZZPKqI5EibwREmrlwmoNc
         oJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786336127; x=1786940927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pX6MMBhGhY7ZKweNH7lUk+HVieNOWtynN9b6a3M3yBg=;
        b=l7p4SgMYcmZ4gPIMvJhEE/RHP4LKJLmNi+mmlOOFN/6y5dts+2hUgSN4UQGtoCx3k4
         FJr+SqjQddtKdRe2uq/FRCkyFn7uYWLwprQNuSNS8LJS+2ynmfHiddwIevYejH6VZk+M
         G4P1U60EZSNJsM/YuBbdLEqXhSo6RF4vySaPxHhRzmK6UXfA5Y0kKgdHt2iyHDzrZ53u
         BeZC6w/HzvLE4QN6MKHFvXAsjHZL7wBBaI9U5lFLuWg0CCALUKDagCa+MyOyDeaCX+Lj
         ooiWa0t09Bj65ZJ5vCNx+LJYpBadm9KhfSpU7iYu5IPg08HPyqQMCKa0I4qLKvyIg9jz
         Ow/w==
X-Forwarded-Encrypted: i=1; AHgh+RrN4kNI/2QDG9mophiUP+c6dUiA2sgtDYacXuXQ4YfMcRNEpMAzc8VBQFAQQKGbQLjR+uGjZf2G8ncpQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXAI2P6wa4dQWsRfzXCU0OvfNIebNpWZPGPlxPmbN6ukW3SVfs
	7uWgb/1EYJo1N6613eazDc76PggxFCD37CqMCM8T8QNfkO7Ho/WxW/dF
X-Gm-Gg: AR+sD12RN5xpTp2WncVKfcvfQsUDrCuEpz5LeHndyVFaE5vxjRegEdGAf2Ih7HKFYO9
	aa8Sq+v5/HzYmNjefO8FI1/fgIDCuCzIFD8Uysct+k/cs+KJTWr97tWNMWKaYePj1MlMwZQCDFh
	ppoCTt5wiCbQ26hrx0wepaenwOqvYZYrPk3quQbIt4ChoW2hVz5fl/80gIUb134DaF2Jzwo4BtG
	DOj2ZBIwJhTlsAFsKSiF3YngH7yXgS1AN+VXEn2VCi29b8AGGL43R4bU9R7WYDmvoEOb1n2gaT9
	iyCtZMLcfeK5mNuBtXxgwtQueouyIuglNx3yAy/Te7RMzIDIfkfIy4YCAShwYhkGMfBm7IMsA+T
	oI3e4jc02vKyuzy1WTJDW5mQDvqt6B3YYbiZU+zwI1BgZAlTO9WDktkXOQx8r1yCxBWy5fY1Arc
	l8qzNrk9rLQvSlhrhP6yqdHcWtMKXyPz+HUr800HANqcnaZ6PSjg4YBtxxie5eZHcgICuce78QC
	sfzZg==
X-Received: by 2002:a17:90b:1641:b0:380:ce69:2669 with SMTP id 98e67ed59e1d1-3928467fbfemr7425362a91.9.1786336127203;
        Sun, 09 Aug 2026 21:28:47 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8d6074sm40890689eec.12.2026.08.09.21.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:28:46 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Vadim Pasternak <vadimp@mellanox.com>,
	linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] hwmon: (max6621) fix negative temperature offset and crit readings
Date: Mon, 10 Aug 2026 11:28:39 +0700
Message-Id: <ad0baddbd6163cf73545c8e9273258136718585c.1786334038.git.congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <9d3a4f1895a47794bb359a2a32fb1ccd6a15812c.1786334038.git.congnt264@gmail.com>
References: <9d3a4f1895a47794bb359a2a32fb1ccd6a15812c.1786334038.git.congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

max6621_read() reads the CONFIG2 offset and the critical alert threshold
registers into a u32 and scales them without sign extension:

	/* offset */ *val = (regval >> MAX6621_REG_TEMP_SHIFT) * 1000L;
	/* crit   */ *val = regval * 1000L;

Both attributes are writable and their write paths clamp to a negative
minimum and encode negative values, so a value written as negative is read
back as a large positive number. For example, writing a -10 degrees C
offset stores max6621_temp_mc2reg(-10000) = (-10 << 6) = 0xfd80; the read
then computes 0xfd80 >> 6 = 1014 -> 1014000 instead of -10000.

Cast the register value to s16 before scaling so the read preserves the
sign the write path encodes. The temperature input path already uses an s8
intermediate and is left unchanged.

Fixes: 92b64580f14b ("hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/hwmon/max6621.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
index ee5898fbe110..3690f2ffe5fc 100644
--- a/drivers/hwmon/max6621.c
+++ b/drivers/hwmon/max6621.c
@@ -239,7 +239,7 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			if (ret)
 				return ret;
 
-			*val = (regval >> MAX6621_REG_TEMP_SHIFT) *
+			*val = ((s16)regval >> MAX6621_REG_TEMP_SHIFT) *
 			       1000L;
 
 			break;
@@ -254,7 +254,7 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			if (ret)
 				return ret;
 
-			*val = regval * 1000L;
+			*val = (s16)regval * 1000L;
 
 			break;
 		case hwmon_temp_crit_alarm:
-- 
2.25.1

