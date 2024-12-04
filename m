Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C6320C480
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Dec 2024 14:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321351; cv=none; b=MYjf+23pWavuX1xo1jqBrBJ7nmCytE+Ao48vjecb0Kf9Jd9XI3K1jJyve8syHj4iIBStlk+5XkSpJLZVBYvM9Z6BByg9F0HOnzGJkpmx+Ejy6+EJuqnqrQmaKFRslbFyJnLcz7hpg/EPu1Se6LFXu0oUrVTDtUC2qzUcRhzAyZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321351; c=relaxed/simple;
	bh=lyxNlPKFK0fUfsPZwq96q9xb2ayv6nRF7fY1B72CA28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oBPCUTy894cPQx6ZxifPbNM1DE/Uie6tNdUXf1QtwGaH1Mo9UcjaLhM8jEJlON6w3C6ohoiEZEcvKqG+SWGO6iUXEw40vhIHv0lqCj9nWesO4j7q+297EdGWeVdyD8VniciUPHe9JJVlMDSRq7FLLaJ6joNoJ3yUYLJKZzGhekI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ziycCv+6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ziycCv+6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e1f3f2a6so3387392f8f.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Dec 2024 06:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733321346; x=1733926146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T2laJEmUYoPmzqUxxETrKsHa5VTx3uGueMnpKP0QoPI=;
        b=ziycCv+6DYMoxu8LMQP5+z4uD16JnjzNqtQHiO4mGYd7xxzDf5ZS4qPspJw5gCwZb6
         dmf0fWgFXALSzBulZxwdKimKPYfz2HpTzQ8x86Rapxh46TrvcrgknP2Gb+ta0ZOeIhIO
         MbVomRu7+ecNuA1iyC914Ge60pU5MUgAKTsxYqTukyf29b/xuV6ORoJ/pJWQT2T2y9fv
         qKfA+a+YCXSLNiUKevs6HXkEDnXAliyWZp2h1eB0JktYvngYH2O0AAfM6ot7UM1ipGg+
         TRMGCVxerPHH4JQyRko5LGtCwVxxAyD7hXusVHEwVt00mcqEyFHV0zcDos5UiNcRaJYw
         Rthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733321346; x=1733926146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2laJEmUYoPmzqUxxETrKsHa5VTx3uGueMnpKP0QoPI=;
        b=DfgKblczshi0g4a70nB9/wJ3Vce8Q4PZiQUfaYo/Bb28UbhyjXPg+sFlTlp8LItgvi
         CuclGvLkPCwKYCDeXBvKOD4HmAHJmH+mo4cHydq3Ccor5MiLEOvQ/Up6BFcWf8zL4btM
         adUb2z/bZ3+FD7GX4j+wzxw9fV9d27rFMeaHONprRlJB/tOvdMa84mqA+9NCqNKz/fG8
         dU9w0m3QtX1dZdGrNHI+r++O6LI9shFl/KvclhkUfarXPPXaVclt9iWAss6ooU7YuOUa
         g2JwOIMQkPkrgKfcaVq5cRC5gNH1lu5qvpv9FUz6fp5dBOSSNlqTURqHBe7E7XDeABvU
         bpZg==
X-Forwarded-Encrypted: i=1; AJvYcCVh80h/NDnz0I+LVuGZ/0kGY76Ex+mXdaunlsaB3GwQ9x2yBqv+k/FtQPTznKkTDYmXVw41Z7Ggh0VGVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbvQucQ7BbBKyHMKh6yio4Ji4LhvICP/3sxnauf+ZpJyA5aWvL
	ljNcZ+5bLCmHEMKmOZZ321fuaLlWTEpTC4yvOBkcnKrTf7SUn+yAJcSHHKPxEGY=
X-Gm-Gg: ASbGncvzznSQHB0S57ch9LDE/Iv0v201T70NlhEkHVvyiLPsjfLQaTogli4E/OwmCZ1
	ieyvm64y9BaLh1SU6S6pRuc2wiIrG26EcN8fKtBWfqg+HPs6gTCILMC1uiTmQI2YTvE4nqGDugk
	3Gczl7RSJzAYsDfMKVOz0BCfp3m8FxXAbIWCs/u+K2f6xfyJiwdagfZ3n3wjX4vxlYnut1nI//p
	RXX8HEeX0eRM/oLoQXZkFKmx+CDheU013JxIQQtVhny8yKVM7jygw==
X-Google-Smtp-Source: AGHT+IHOZ7VV8g+R1ZI8ItpgKGutzNjQXQcDDqy8Di2aeZe8v65qtmMVoTe4WdcidoFtf6exZssyPg==
X-Received: by 2002:a05:6000:1ac7:b0:385:df73:2f3a with SMTP id ffacd0b85a97d-385fd3e7b1dmr5883858f8f.14.1733321345603;
        Wed, 04 Dec 2024 06:09:05 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:a61:1a22:4d43:1670])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e90949cdsm12034424f8f.17.2024.12.04.06.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:09:05 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: =?utf-8?q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (isl28022) Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Wed,  4 Dec 2024 15:08:57 +0100
Message-ID: <20241204140857.1691402-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=lyxNlPKFK0fUfsPZwq96q9xb2ayv6nRF7fY1B72CA28=; b=owGbwMvMwMXY3/A7olbonx/jabUkhvSApCrF/EOt66YkF5zR67ld+Wnapyh+uWJZZ+2GkgMFQ QYfqg91MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCR8lD2vxJ/rzFdZPx6JvZd 7R8nj441TCwmVaeWFKnOzXzk03n6o/E5ra7Dr6feuz6z2/ji6Vfm2Xpyvzj0mzyE3zF6VJs+SxB bLhiwtDu5z2Wjr2lg3P0HCnGJclGyk09Wz1OdWpbv+ppri+mCA+nuqVPUbx5o2OcVGeS88dTlNJ 4MpcbpTKe35ab7hVtM/F78drKD5fnTaiW/DYPmdxWzX9g2o2Oa6NdiFQbpKdJhXU3lJeJROY+mP 9YR0bmjK3vL0OfMO1kx2fYUqw0L331/M8HYwC3I/aLHE0uLi7Wfb0x7YLUi6r/7w19rHDbeM6kU X3E04BK/vcK03MKmy/U6bPXL/eMDV3Us2VeYVfTMkEkWAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This driver doesn't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize it.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this driver didn't exist yet when I created the patch that has become
a7e03f96791e ("hwmon: Drop explicit initialization of struct
i2c_device_id::driver_data to 0"). So it's converted here on it's own.

Best regards
Uwe

 drivers/hwmon/isl28022.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
index f9edcfd164c2..04414075afe8 100644
--- a/drivers/hwmon/isl28022.c
+++ b/drivers/hwmon/isl28022.c
@@ -486,7 +486,7 @@ static int isl28022_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id isl28022_ids[] = {
-	{ "isl28022", 0},
+	{ "isl28022" },
 	{ /* LIST END */ }
 };
 MODULE_DEVICE_TABLE(i2c, isl28022_ids);

base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
-- 
2.45.2

