Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E0A2EDD40
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261551; cv=none; b=ukwkLOcDksNVjQeCR+43dektFu4xWoThEMi+IreBQzkdKvNSxSBswQowBVFdohiStjJrl3ft+kDW187LYvq2yqnbZ3ldXuGmN7GydhA6kKZrO2Ip222Svl+Qz1U8wrUpDuVGYxu7U7egQWKc9D8fz/U8Rn0WdG8oKjw67tZNGqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261551; c=relaxed/simple;
	bh=lliJBxWPVpTyAyADuND4uizRjwTZjzpBszsInexQ9xk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ult3bLiP1GBSzi228E8lqRfD9CRflR3mlxGNj4ORkoFh9ZjDLTBNMNFLMtlqBODLUwfKWSEXIdRZ1yEuJUMsrOP2SvlhjBcNX2S1W7pXRp+8nrNvq0r6iChg5Isl//fhS9MTgUimOHYOrasxg74iMkPDGxawgO/ANqBd9tMi5oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgjbI/x6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgjbI/x6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d9201076b3so24887935ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788261549; x=1788866349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKCwP/Pbd6Ew8Fb5KHjt4jiEpKf9mj8Tkki/SHF5sis=;
        b=MgjbI/x6M+XBwg1NyuTTDO5gBDl1nxrMe/ImMnkGeLYCJIpH8t7VYpTqbFw5gIrNsv
         zDbV7p0F6XRr9epQSrCms9PDde8fWHInsrSBK1zlmirOgLXS0Y7IvKBfqXfv16zhvylb
         UiK8uN92AwkTHnTtABNwnHV3NippblsVVg/50wlhnk3PAiaN0KqyjtfFAO8hS3unqxal
         7hNQ05r8tQYlNJo/XBXTQXpuBWcg5Ra7eSy5FK2plTNuCPWs2huv8e/Yacry0fYdBwBT
         O+Z6rm35iowhiKST0dslZSe/ImAanMfj3V9tQu5mgDfA+XhHx6QHd6ysnYZaxHMNzShs
         nLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261549; x=1788866349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKCwP/Pbd6Ew8Fb5KHjt4jiEpKf9mj8Tkki/SHF5sis=;
        b=gdKFykOovgraMjqro+YJUYEN8kpdXJjg4q8YjfngL/o1j8yuf1zjLZ7pqwdtcPqbeP
         uqErF4rcs9qSRo/rdyO3mGyQJkt+fDGs99OBRU+VRk2nVmvYDsd11t16F3EDLEzENQsu
         XLhIC9ho3+a69MfqTw6h/6ZDCpcRB0QnF7DPG9N52EziyAmj3T4Gd8PqZmF92cICPVLA
         2WFoO85yFav/Dbl16ZqfP35ZZp8lSTdvytadnoyv2+cV7Nmncar7P6F5VBokeEw0Jf2B
         3MUU3dHoV+Ztcs1K+lOgG50tKNfKXsHkaL0G+RBH1y/jUr0oNGV+HlwFabLMKikJo6vU
         RdUQ==
X-Gm-Message-State: AFuF++kQ/K3A9HpsFmiR4ol/kK0p3MguRVlAo9U5CwYT4H/clh6HD8VY
	Mjn+EDy4VF3VZ6vUsUxAlQeXmWAn9LFQYxbFag0xFTVd21bJgYZE3oG7fOWWDg==
X-Gm-Gg: AYBFou29HAMADQhhvGU+Mz7GS13Ms/OjWrsJOLaPrO2G2jF+p1fLoQzRuzNf29RYgby
	8rAUf9pqMqGg1p2515GBEXOb1ISvt725TGM43DUcgKrkNfBjs3Lv346F/6Gldfi021owLlgR823
	NIPR+Ll1JmZVVSGALp03f9LAAP+bk8CD8TNwKuakyUthNJ+Fud9Un0oyTlRoFBoyCe5gzhloU7f
	m9rLVqFl9EEWupGOdR/naTX5fuyWonTS+QY+rUyqDQTp7KrVRrxyMSql0kpt8M9PuOosaWHvsld
	plrcKzYQfTiqXjLnAVnE915Ff2qKslDzo2wXOdxxfAHOHP/6hk2xYzM3K5uFrGt93M+UARs0Cr5
	sun8SCIZ6ALv+FijGitqtnKzeSxSeqlidK1oW/QfCOyydY2rBtzpuOFV54OAakuigA/NuB7X92r
	b5nwtp4vsZN4rSiN7BpmRX8OMeqt6M9ABbRGznrlPvRZ/DwIXwDX7mHVKIbjmwv2EkdAADweeiu
	lt65A==
X-Received: by 2002:a17:902:d4c7:b0:2d9:2fc9:5706 with SMTP id d9443c01a7336-2d94a75c161mr95526035ad.2.1788261549334;
        Tue, 01 Sep 2026 04:19:09 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598c1cb4sm50333625ad.81.2026.09.01.04.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:19:08 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
Date: Tue,  1 Sep 2026 18:19:03 +0700
Message-Id: <20260901111903.660681-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_enable() runs unconditionally in probe, but the devm cleanup
that calls pm_runtime_disable() is only registered when control GPIOs
are present. Alarm-only fans never get it, so unbind warns about the
missing disable.

v2 fixed this by switching to devm_pm_runtime_enable() and moving it
before gpio_fan_stop()'s devm registration, so LIFO teardown runs
gpio_fan_stop() first. Sashiko/Guenter correctly flagged that moving
the actual pm_runtime_enable() call earlier opens a new race: hwmon
sysfs (pwm1, fan1_target) is now exposed while PM is already enabled,
so a concurrent sysfs write transitioning speed 0->nonzero can call
pm_runtime_resume_and_get() successfully, and probe's own final
speed_index check does it again -- a double-increment that permanently
blocks runtime suspend. In the original code this same race just fails
cleanly with -EACCES, since PM isn't enabled yet at that point.

Fix this properly: reserve the devm cleanup slot early (a small
gpio_fan_pm_runtime_disable() wrapper, registered right after the
regulator is acquired, before gpio_fan_stop()'s registration) without
touching when pm_runtime_enable() itself actually runs. The enable call
stays at its original position, after hwmon registration and alarm
init, so the race window is identical to the pristine driver -- only
the devm teardown order changes, restoring gpio_fan_stop() running
before the PM disable on unbind, exactly as v2 intended.

Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v3:
- v2 moved the actual pm_runtime_enable() call earlier, which fixed the
  LIFO ordering but opened a new race (Sashiko/Guenter): sysfs exposed
  while PM already enabled. v3 only moves the devm cleanup registration
  early, leaving pm_runtime_enable() at its original position -- no
  behavior change to the race window, only teardown order changes.

 drivers/hwmon/gpio-fan.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..8b28f0d58c63 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -524,8 +524,11 @@ static void gpio_fan_stop(void *data)
 	mutex_lock(&fan_data->lock);
 	set_fan_speed(data, 0);
 	mutex_unlock(&fan_data->lock);
+}
 
-	pm_runtime_disable(fan_data->dev);
+static void gpio_fan_pm_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
 }
 
 static int gpio_fan_probe(struct platform_device *pdev)
@@ -553,6 +556,17 @@ static int gpio_fan_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(fan_data->supply),
 				     "Failed to get fan-supply");
 
+	/*
+	 * Reserve this devm slot before gpio_fan_stop()'s so LIFO teardown
+	 * runs gpio_fan_stop() (needs PM enabled to disable the regulator)
+	 * first. pm_runtime_enable() itself still happens at its original
+	 * position below, so this doesn't change when PM actually becomes
+	 * enabled -- only where its eventual disable is queued.
+	 */
+	err = devm_add_action_or_reset(dev, gpio_fan_pm_runtime_disable, dev);
+	if (err)
+		return err;
+
 	/* Configure control GPIOs if available. */
 	if (fan_data->gpios && fan_data->num_gpios > 0) {
 		if (!fan_data->speed || fan_data->num_speed <= 1)
-- 
2.25.1

