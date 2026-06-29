Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E393803F7
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 19:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760672; cv=none; b=O39ezCD9acBlmwC4N41E63iBtytxRvS5dr9cuZOf7LMZJxifD1Ung8RP1l6V9gcuU45aOvLMrryvaV1PvMhEAzYQaQnVbq9ZYZg7LeHVoPov1DWq3Cy85WABX+9T2sCuvUSxHwJY+9oGwIAaDr3vKkLJkOSBfKkM+epmL2wOow8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760672; c=relaxed/simple;
	bh=kdblPCOGXaTGl7yZ6R9wu2yUo3KZJ0fjKjmlgmItCI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jIceg535N7Q6rezu/LkrOYvQ+OHiWAUMg9WXwkfF89SDCTC31xvHHiI2W5RHEGYF3JlUOmZAznZZlsGAaxwgA68m4UxC3kRvAVwlcNRFnX6Uv1gr9qGl8c/E7jZjcC0KzbXSG8aru0LD2dkLYEn5v5UD/U02HNbct8Iv/QATuGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qHddGQe6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHddGQe6"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46066e640easo2070115f8f.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 12:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782760669; x=1783365469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQX+REvUREvT7qbaKL41arO3MGXYR/ufA0BB9H4xgPg=;
        b=qHddGQe6ySjFZTp2IzE2Zgojg6w5jSMgSVPCMQ59NXTtteFxUMZvsmq4KZURS0+B/k
         +c2NhJl32UBdFfWtJ3vHL4jYEaBrC/7cE2QXBxSTts6qbo1dD+viP8hdFauF/bHdjgkH
         sXyOYZMBOfFA82Bgc1mLiRND1YfKNXs37M8226d33XJxfi7o+nS4hnd7dYm6pj/xTJ+T
         hCeO5eG0UhmoTgjj0yeRH6xUpZDB123bZR/1fMOcK/8mvE+s4XCIsHHMNqH05EEzaq94
         4vcR38u3gFCOjcuG+Ufy6FfzCjBgWa/3rh9gjVeYG2VY1b7hcP3Npf2ETYfSwrqOEfxn
         Z7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760669; x=1783365469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lQX+REvUREvT7qbaKL41arO3MGXYR/ufA0BB9H4xgPg=;
        b=YeBvyFQ+HL60ZNnMKvASYAimE6GO2qop+BxGqu0NnXDF08ApwCaZaSEkXvaxp2mot7
         wdxBO1auzonGgmiw14ni8qRTpeqVUfHR0Z79aSyqHV3o126Z6jsrWJ9l9CPxibKkB/57
         qBdeHtx90HfKFd218/x++97DGAJFAecTrO7gDI1UpAs2/SaEdVq4rLYzR7UgKd2sXUWN
         h16iyWX7ByPNAKQMIBcZeKxuRLT4KAcrRZ5dIYOhsm8gptSSitOuxLTDPT65vdYEcjIb
         XSuaVWHao0eLJRoHeLcgRzTgmg3hpB8HCMxlPkletT9QkCt4uP3EInzeLzodoCtgw9De
         Sodw==
X-Gm-Message-State: AOJu0YxnE9kLgR6vGWPV988Pc8ja1kQbcMlMvHznc/0gMngiWXx2Muhl
	5OugxTOYLvfTkLbNC2VMf3kgOgf6GMmHBtqSIRyvIR1DtYCipSDDpiKqMmX1XA==
X-Gm-Gg: AfdE7cn+YTXt5R4k/Bu/Wo8xLqh1/ExVfq2TrAZr4F0Vvm93FXt4pBWTuoEvH90/0O8
	P2Q5/39zk1j0Cp53mo/BwnPiDAmc7Wb4JTIo4ofD0yVPM5GKXLowrGTb0yw9SyjjFtqBdhxCSYW
	/ie5mg5Lvne7MQMm5u2w9omkYp01zuBV/U+5uObS5IMTGE4F1nDQ+Wxl5LbslW8gGX2fP3z76cu
	PK71RdsptuU1xfSe0u6HMl8jX9K1PsZ0UECdu1sE+VnMluXlNl5PJBvl3k5+sRX+0kXA01TyrHs
	5kHUAv0ZDdOZwXvZa/0EjtDObyLP2ntaT+Sb6Vq6J0i5zTc+JJ4L0fGpNwlQmMlLCCv69Q1FwlD
	I6q3rIkEnQFaXPR7yPl/UIedUtbfHTShFXxgACdGUxEg17w2CpPStJpNoQV3hThg2X8nnx5AyLP
	Rh2QrhMKL16Jm6leALl+2ioUqj8UV+xd44M5v/Otc5NN55MbQ+yfT0FoVPYuvZFAcJqmd9WzctL
	F3x3jWAId0Y+btBba2oTFmquMbqC64kgLTR7kk0davGPdt95EYE/oTEpoU1Z9hMsxo17ra5Y4ss
	J1UZWuiiq31QPm9OM7qQ
X-Received: by 2002:a05:6000:460d:b0:474:fa2e:c94f with SMTP id ffacd0b85a97d-475505f3339mr886185f8f.3.1782760669176;
        Mon, 29 Jun 2026 12:17:49 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cdccsm259568f8f.24.2026.06.29.12.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:17:48 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 29 Jun 2026 21:17:40 +0200
Subject: [PATCH 2/3] hwmon: (ltc2992) add missing 'select REGMAP_I2C' to
 Kconfig
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-add-kconfig-deps-v1-2-8104df929b1a@gmail.com>
References: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
In-Reply-To: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782760667; l=857;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=kdblPCOGXaTGl7yZ6R9wu2yUo3KZJ0fjKjmlgmItCI0=;
 b=TwZgEW9tjN1sLAB3jmCcOLBAJiWWCwv8wDRDVLL5laP56OjkvtqfqX9Ql3QNloSuFLYzS1Q4Q
 BspBuITZz0qCFrWG/dDECus5q6/FIwFwMvjW8xt1WbP77vcVPDxelMm
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

The Kconfig entry for the LTC2992 sensor doesn't contain a
`select REGMAP_I2C` parameter, causing build failures if regmap
isn't selected previously during the build process.

Fixes: b0bd407e94b0 ("hwmon: (ltc2992) Add support")
Cc: stable@vger.kernel.org
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/hwmon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index a908e22bf166..cc593fbfa4cc 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1098,6 +1098,7 @@ config SENSORS_LTC2992
 	tristate "Linear Technology LTC2992"
 	depends on I2C
 	depends on GPIOLIB
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for Linear Technology LTC2992
 	  I2C System Monitor. The LTC2992 measures current, voltage, and

-- 
2.54.0

