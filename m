Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F9043C07C
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278174; cv=none; b=gsmJzWQ3QlBS0dnszFKr71E+WaLc3tzlZWjZYiMgsiiWBIqos2ctITSYuyXiXsfnsA3Ze58dcmDGOKkhl5vV7n72uFa59Icgs7tvwJWZNPCuIqcy5DrT30EoVrxQapgbXZc8xsQBSOPm3RhdnLHXzoM3BvTyY1uw2jKPzgcVwko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278174; c=relaxed/simple;
	bh=xL2GjFAGG+M+DKtjSfBerPGFIXTDA3oaUi8SIZUVRG0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CPq5bngRY6ZSVE+cjt+arG5zEgjAgIKvSrEaVONVt49eNkYKrwNGD8Pk6ZnOMJFpnEv9ctH9JykVPlYtvnIxiaSIMw9EWoigZebB+we+yNzr8DEwWqMZXbm3rG4vYOrUalMj9e7lkeiG5P24X2yWF1SJAlWMVgcscubaTOOaCHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E99P6O6a; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E99P6O6a"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39266382df6so4285457a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 08:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788278172; x=1788882972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+/q0MGF8EVE3jvGCj+N5OzmksgkuJlJQSWpflw+hxc=;
        b=E99P6O6ahrYCea2BQOpvZEYkGl4F/2oZ+6VfW4oU/klzjbUgdOYbDnEIofNMQ4LG1I
         vi13YU7OCPBZoF9H9JL3ZScQXunp8GunOdGIErey4hZtXodCneQ6UpfVCNcrJtu6oEsu
         Spp5uqRk/0hu/WJTwRLG3OjQQqgquSt+jQBVsTHfzKJJic6VpdMLmUF3LTuTMmsdo3Ok
         fSZWD4GetjU18HnTTcXWefF5ixIbOc91x29HHPsR310DX6Mi2rAUeoLNkCnwA0sX+QFp
         8AIakS/W3WLvbCZmOVRXotCPPoyxi3RHMJIXJaDByXHkOsGCV7RvydpNGQ8xWPB3jSOL
         nnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278172; x=1788882972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+/q0MGF8EVE3jvGCj+N5OzmksgkuJlJQSWpflw+hxc=;
        b=F9KRALijzngBJZgHlU8OB6UAZXEo0SNpgpLvEEJD6t56j52uWwfsVUL8H++5v1LjKM
         iLEW+OHL+QDbDjTJtyUwqTaiDzzMpkkJQhUpoVaVM7Xxr8VLawUM/tvay4DRkyrSe9VQ
         ZlhgxojqLuJPffysXLtMVquTGXa/te0CO3USXiuhw+JbcjgIgZPs2u2MlbiV+ii7Ur6O
         1Qwf0Gmun3tGeaEKQHE1GoLvjyvWnWXxVFvJmKKf9xhyBg8PN8UQwqBVDTEJQOh99sjJ
         XODM4N4t+IbfeQi/7aSF9pzKgMNaLcjrzhb/AqeFwlFwjBsQ0/kN1Gaaq2SvnQcFKh05
         jCJQ==
X-Gm-Message-State: AFuF++k2DgxYmZ7Uzq8+ZkNaAOGHi1evMXrCcN4uLA0cZMElDDjfjhZg
	RUjpjdtoZGyJYYY9zZy6jqgfCpNN3no3VlvRWjhj4SrxKFCTQxEdoFZpyhNlWw==
X-Gm-Gg: AYBFou2fJvpUE6ywezqkrELvUayWBD93/986nIVZMSH69HswVOMYC9BTDopUE0YiXmT
	eRE+glbeSNoUJN4MH8Q/Ar6kmnyfokYI8bSlQngzxcJM0kw/7f0fOy67paXY6L/7wUOjGZGIqwa
	0QhbVa+Du0/8eg3iEOJ9Q3Ze031PB3iymA6XCIazbkbOrRCFRiEjzl94/1d4WY9OCQMEl4j/GhS
	YsImNSI9+MhDOaBHCfxQgGiDAxLyxNl0XLGf4jAhkjlX2x+J6TbFpR57tO1RRN78IPdxJCbyhWb
	PdC4J2PeV+3kaiWHfavoJWQn9veBvghSDYM7mEsqVnrytxD2zbxBATAeSKumv7rqM8beoQtVtFA
	n3R9fkRFQLeYinMYqwXp19ugyvmdZHDjV0NWetqmHl0xCE6YBQiRRWSstMKi+uj52qAeZdKR45L
	8A3Py+4rRWILT7HkvT8XSwGjz+2x1SHhMZ2BXneu6k4NpzpJFNps46hCtXVbKDEYPSD8yR6Rl/o
	vzLkMmVrMys
X-Received: by 2002:a17:90b:1806:b0:398:9be6:f997 with SMTP id 98e67ed59e1d1-39907e1214amr12867981a91.22.1788278172251;
        Tue, 01 Sep 2026 08:56:12 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([42.116.29.172])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b58c057bbsm24289475eec.19.2026.09.01.08.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:56:11 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Nishanth Menon <nm@ti.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Sashiko AI review <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: (gpio-fan) take fan_data->lock in gpio_fan_shutdown()
Date: Tue,  1 Sep 2026 22:54:04 +0700
Message-Id: <20260901155404.1532092-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_fan_speed() writes the control GPIOs one bit at a time. Every
other caller locks around it; gpio_fan_shutdown() doesn't. If it races
a locked caller, the GPIO writes can interleave and leave the fan at a
speed neither caller asked for.

Fixes: b95579cd8795 ("hwmon: (gpio-fan) Add a shutdown handler to poweroff the fans")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/hwmon/gpio-fan.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..10c91bc33b02 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -606,8 +606,11 @@ static void gpio_fan_shutdown(struct platform_device *pdev)
 {
 	struct gpio_fan_data *fan_data = platform_get_drvdata(pdev);
 
-	if (fan_data->gpios)
+	if (fan_data->gpios) {
+		mutex_lock(&fan_data->lock);
 		set_fan_speed(fan_data, 0);
+		mutex_unlock(&fan_data->lock);
+	}
 }
 
 static int gpio_fan_runtime_suspend(struct device *dev)
-- 
2.25.1

