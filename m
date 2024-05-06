Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C694155A24
	for <linux-hwmon@vger.kernel.org>; Mon,  6 May 2024 15:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715011190; cv=none; b=eBPMmLl1JWt5wzxDeBMTx+sORfvSxb1ZQXlBFWoq0nv8H9UjdvroDSaJI3DXewZOk1YATPvb0Kgqcu4uaOyuuAvu7l+C7saZVYGR939YzrRXeYy4WxQ0bu9p80YVvW0L5zFS2c3b1apCHSkbgO8jmZVT6gZDOJ5dVxOIxzNiB24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715011190; c=relaxed/simple;
	bh=YMGGVsUIjQf2VgBWC3RcoqXjDkrx5e5yS87wvjb9cGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IbBciqnVZ6GjbNMH902yGIKNItu6ypIrsPsUTUruF/+nhNGIZcrAxt5fV6rd2976yBDVdXz+YEYeQEfMT/9HSBNNdzjh97KnLy+v0p12gdihLKPGqwi4yzFZkyqdeaLj3rcNtgBDNda10skm0JaRl9aEY/XGgh83p7+V8AYvK48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tW6Un03S; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tW6Un03S"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6f02e1fef90so1126372a34.3
        for <linux-hwmon@vger.kernel.org>; Mon, 06 May 2024 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715011186; x=1715615986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAGwrecvGXteCvVGgA1e1GYVTjqsSEm5aVyfdJzjWYU=;
        b=tW6Un03S5yPzK5bOr32OeYKYXFzw2CXlk45RC0ra5TsXkKs7c5pcHt1LNvqCVTrq6S
         qDSZKoS94JRkOrKN31d86+e7ruHxWiR3DafyaDFonn4EYZKZMHNy/JK8/vqJgmtTbl3D
         ZlS+FQZgvtpbDUIPgIIc2vMfHWgGQ9Ok9LsjlEwRjTHS+XAay90cRl0n8JbRHLimRV2Y
         DRWWMyaeI5wOcElV0Pvs10E547Qj8duYCgHT6ZaUSTCGDmk7cLrnKYwO3YwLXwgUD9Nd
         iCSqKe7ZJRwJWjfu46o61S8rcOGjCvAREyvuKchjcv8p9drS3SnbJfG/O2hcxtxw25FY
         Y1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715011186; x=1715615986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAGwrecvGXteCvVGgA1e1GYVTjqsSEm5aVyfdJzjWYU=;
        b=IREO7i/QFM9VuAyJqPakhT1Ylmaa5+T21+zWrWPxfnfe67DPO5tdsAZ2VSOI6sr8FE
         19Q4l0xZgrD4kJ4TxPhrJ7nYx9qqsmOB7+Kpm3bYypmcE5YUvXE7nseDuIDcudnPhDj/
         jMX+EuvdwA4dirny807lxz6vZDBaIiXWvWLW/rFyPxAMHRgKaEyGWX9wWU6/zRcn3duT
         hfk+oB+0t0OUpnGZ4WUqCAjFWL33vehnizlVD4sahr4UXtmtGk+IfZUv12UHXtyV56Lt
         yDRm+z9O+VJnrUW7SX5qQbzkJhS519r7/F8V5RGLtKbl56hQwjVL+yXCtXkkcjKtIef9
         hBkg==
X-Forwarded-Encrypted: i=1; AJvYcCUDeM7tW9KFtnUwJEpe0j90t8++yRCjjEC1d71uSnjQ5MRO1EvOOeDLKDkD4e2s9OED+qOXHRc4TSpYpXUzBfbsMVPWIClFu+vTXhQ=
X-Gm-Message-State: AOJu0YwGCK38ZHbIacHertYZFrYPUJNSkvLxhXp6feEWxx8ClnYNqwmw
	igSQlf1zl3/hQkzGyESTKSnKj82nZxlAT29GFrnqGDOIBesEzTwOwiqKeFSouYM=
X-Google-Smtp-Source: AGHT+IGrx6LK+UeWJ0SHFwCJ9zDahTjHANduPD+Q8IbM8JODW2Y00gTfXonztlGCeDkcRCJG5sgsNw==
X-Received: by 2002:a05:6870:f688:b0:22e:98df:9a2 with SMTP id el8-20020a056870f68800b0022e98df09a2mr12386001oab.8.1715011186287;
        Mon, 06 May 2024 08:59:46 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id e17-20020a056870451100b0023c82e5be0fsm1955226oao.7.2024.05.06.08.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 08:59:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] regulator: devres: fix devm_regulator_get_enable_read_voltage() return
Date: Mon,  6 May 2024 10:59:15 -0500
Message-ID: <20240506-regulator-devm_regulator_get_enable_read_voltage-fixes-v1-1-356cdd152067@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506-regulator-devm_regulator_get_enable_read_voltage-fixes-v1-0-356cdd152067@baylibre.com>
References: <20240506-regulator-devm_regulator_get_enable_read_voltage-fixes-v1-0-356cdd152067@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

The devm_regulator_get_enable_read_voltage() function is supposed to
return the voltage that the regulator is currently set to. However, it
currently returns 0.

Fixes: b250c20b6429 ("regulator: devres: add API for reference voltage supplies")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/regulator/devres.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 4f290b9b559b..7111c46e9de1 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -193,7 +193,7 @@ int devm_regulator_get_enable_read_voltage(struct device *dev, const char *id)
 	if (ret < 0)
 		goto err_release_action;
 
-	return 0;
+	return ret;
 
 err_release_action:
 	devm_release_action(dev, regulator_action_disable, r);

-- 
2.43.2

