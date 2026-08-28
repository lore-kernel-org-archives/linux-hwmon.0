Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC37D380FFD
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914345; cv=none; b=Z1ixM/0kamMt52E0S7Rm/1GkaxbvIdRG0qri8UEZj9zpDcbtvquZ5p92c2qcQhR/QdOMmZuy2+twACf2746LqRUBCMhML2VpISSx7NRHnhctFJmn7lHXiY7V403p37BWRNMrSa8NSsiftRRAEF0GYgfYnyPGlnFvsc3UEdno4RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914345; c=relaxed/simple;
	bh=pG1VnjiqgntQGI0qK/is14GUuCFDGLN/BKAmijvarkg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=acI2owA3P9VL1Ba4LfgdQrSO84VbhJeoFWxzB3qgaliV2n1ty3GCzdW11UvHqU5WhLu5VvrJrNheB0klGtR5yGjo7JzVEHU84fLqI6WoZy9SJpPMvL15s7pKpgwdHSQoB1o6/1YwCFgSPurEvWzS37LYCmVlRvEVfJKAa3sByUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC8u1rC0; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC8u1rC0"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-382ef647e20so806479a91.1
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 03:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787914343; x=1788519143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iB6uEQEth2jXEYgRwt8eutJkoVjS6z8bcTn8n0MIRls=;
        b=AC8u1rC03Buk2Vf/vP9iYZwX1SE/fzF/KU0cEYVn5hnQEMMWcqjPNRRRCspDXENKhV
         52TFk/FZCptFEz45xZSWuxXGbUnPHiZx2cRka+srkY3GmNbMu/MsoHVvxoHcpwBmIHfU
         bbeATpNwHb8qHdUOcinDcTu1yq2rOk30dFOYCK5rDnTiZJnkKHRYr4ZhWdcHxaAy6g8C
         WlYbrA/j/pCPDjmZldxXSy1lQFoZ5L5FmY3MN+ghwisYFAgWH9RUAvuQbCfNW/gkoUY/
         /1AQkfdUhK40C9i2qJOGhFpWrPHM0OtgWS8iIwjCfXbFiv1gF5XGqoaKksit6Qb0qtIU
         FTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787914343; x=1788519143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iB6uEQEth2jXEYgRwt8eutJkoVjS6z8bcTn8n0MIRls=;
        b=EOJb1jGLgLdh5nvpIfmJ37FOAoJkTdq+1BIuo9US0jLO+XpH92b1IIthk0dRdTLhKJ
         cUQec04FPnx3Rjbv8dxjB5d4wAMjRzZunhCjqVhUwJaavw6todRKBrcJIx4emQ7e/wfg
         oL9Y1I3rp2x2gV42SJ1pexTHRhb2Y0FzVL46182Vc/FGRSAkZl2nD7tTVS3SRpfAKLKZ
         Wi7iQN6ibIPYjYSNaD7T1GaCrLbF1bn+CCUgD22er82jSg+hPPvVoUgm2Ibfhl+yMk3B
         eJb4aHUUq+xw32OLO3i7DinIEODaiE+LY8FMiSNyeAw8mheJnXQsjryImbzECsRD8No1
         HCfA==
X-Gm-Message-State: AFuF++lpgLd10Ei+xAaGg2JorrPLduJbUFIU7EJtCdOSxxf+k/sn9axG
	h49wUKL/KtL+IBen0D2KV37FU9UicrYA7/gm4FdEB8/j/jC04cLYDNyGznl12Q==
X-Gm-Gg: AR+sD11/UBkuvijXHruCQxtP8NAOmAuKB4ZCfncgElhxdx4T8DM3rLnpCD2BDDa4Oea
	fdqble//tZFYQ8IB2vaAo+bxrMATRBgDN74dtyFLrFN86Eh0UasdEBUSCvJ4FM44+eeWocBE653
	J+1RZ8lRKRBFsshUKZh4bo3TSGFsw8IqUYRN2yAXEumJ3BpPJSxCSJvsajWnLuAt4EwY+n0aaru
	oUyOi7eIipJGsUk+djryOQ+BKv2uPc96MPIz3k34iDpi9ij8srBdQmUWc3ThHczl1mVQBTj/AOD
	0FfU7GrSLQbzMMIvMe8spLyK69ZFL1k2XKrZKR3Z0m4ouZmJLkh1WE5nG9sJaPX/il9s4s6iuTh
	lHutVVhpfziNLX1VKjkogfBaHYK9b27PULI2rg4Dzq6a7hMLelP6lBaSMl4qCGZpTK0664XK8zR
	psdyatd9SjlGPb2wO/cWnn6e3ISRcL6G4VEDUJ2gO7jX4J9g+jSF/aJRTh8HsahVhM8KfAOdvdj
	g==
X-Received: by 2002:a17:90b:5405:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-396d0de4c19mr12284740a91.6.1787914343069;
        Fri, 28 Aug 2026 03:52:23 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([42.116.29.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc08266sm2063274a91.11.2026.08.28.03.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:52:22 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
Date: Fri, 28 Aug 2026 17:50:18 +0700
Message-Id: <20260828105018.2392383-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_enable() runs unconditionally at the end of probe, but the
devm action that calls pm_runtime_disable() is registered only when
control GPIOs are present. An alarm-only fan (no control GPIOs, alarm
GPIO optional) is a valid DT configuration; on unbind the runtime PM
core warns about the missing disable.

Use devm_pm_runtime_enable() so disable is automatic on device release,
and drop the redundant pm_runtime_disable() from gpio_fan_stop().

Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/hwmon/gpio-fan.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..0bd5561b7a40 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -524,8 +524,6 @@ static void gpio_fan_stop(void *data)
 	mutex_lock(&fan_data->lock);
 	set_fan_speed(data, 0);
 	mutex_unlock(&fan_data->lock);
-
-	pm_runtime_disable(fan_data->dev);
 }
 
 static int gpio_fan_probe(struct platform_device *pdev)
@@ -581,7 +579,9 @@ static int gpio_fan_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	err = devm_pm_runtime_enable(&pdev->dev);
+	if (err)
+		return err;
 	/* If current GPIO state is active, mark RPM as active as well */
 	if (fan_data->speed_index > 0) {
 		int ret;
-- 
2.25.1

