Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E72C1A724C
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783860719; cv=none; b=ANObE6fRkaZTn7HNaxOqte4v61bbhJtzLba7HTY1Sircw26wD3O/KihibafQdHM3ZLgqokXA+GyP/dPzVk2VhrDrKKPyxO/xOGhBvIWzwWGpYJPta1FE52c7S9BBXMh7Y2moa/r7FqdXTt9ljLMaqx53PTUEcyguc40S55F8l+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783860719; c=relaxed/simple;
	bh=AhmVDzOZEfTRdUkpFP7ufAUfHLiFovckdlg7IXGkf04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BEcehjVLDf+RNkq4AqEToybbjoyOQSUixul7PqCx17ZgfyMWf+SXCBANbvfLIA95+XbD5/SnZMuK+zLJNGpiIAy61UXssqHwt8DipKkteqx6/5mcICCK9aAgFSWxXkizn6vOBDXleTjMtV1DEujU0jijS9MBCbqXsRyXbYuBTaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6jqJoHn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6jqJoHn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso1210497f8f.3
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783860717; x=1784465517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvR1EpkK0j0+5UkcT4876Jxi8k4p/8jVOH70oWDaAow=;
        b=m6jqJoHn5QnxM8rcRVGv4wX8oje9dTxEQHcUo4/5yAkF9wVWgUd5UNQ+s/cbcLfcaa
         eYMplXc08393XaY29uPskqnr4q2+q2JdtK+1dB4XR0cxjQNJNw4lKncEtZLgOYgUDozd
         tTbDgyfKF9UEJDCJKPWeFhzAAK/45wdAPKujRnI8be2yCVEoEmn8n0QoTAuP4q9nhd6h
         uV1WxP4tHU/9FCoNv+xFAIBpqJPmipWzDs7+nGpetMGMUugeC/QcDxIJyaH8joWP7+kF
         rsmV4iRAy2C5PhrqwsEg7MbSRKRHHqH5xgbFO5NHJ0Rd4Pb8+829LRmRaOQhhsUaWbHD
         KnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783860717; x=1784465517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvR1EpkK0j0+5UkcT4876Jxi8k4p/8jVOH70oWDaAow=;
        b=IQLzpmpelgeJIQomUCM0QOxk7Fr9MtxM0qDD25rpv+H+ZMNHoIIU4gwg9P6XYwdF2d
         RkgcmBgMQzgOoGZkGDvmLFm9yuCoubt/gRqJyGnycRkSJH9kcShTPF4seNdaupJnGrvn
         xpTwuPwWLob417UQ6s2Ntex9qNRmv5ffvUmh0HaP1Wnha2nrxbS+OiaX6E9KHybBU5EF
         +szRqF4XpuqCmfGlFuDw38F7MUorNqsXzHWCnKAXbxseEt7rloF1TXlCm0UxdetLyfjj
         ClRVTi0rK3busPKdOpFq3PooHiOdBFeRx8d0ln9OX2JNfisyQBV/S008uc/uJ0Qt68eE
         0DLw==
X-Forwarded-Encrypted: i=1; AHgh+RrECDyWjk88LUu9bcgKqdDX8zEMFS2E2fynzlO5xyizQXfThv8+dyuA26UyONIZ6w94pA7Uot0ISfyddQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDCvmT/Rwz3Vq7I1uI+OwxdzIV4awHou5orOkxb14sdoMQwUdW
	mOziDbUGjZ7EVtaeyHWYxfTtar3Z3oj0/7r4dEKxKYXsNcSqQ3DogkI9jb0FbA==
X-Gm-Gg: AfdE7cmh8YOagUcX0fHB1hH7cL1X631M7R00MrwIfukGtOMZHKJie4IOivljiPWG34d
	ifkTEtk7r551T8hwREzyJLy3NlYPSMHWMcsNKr8Ihfq1ZGxRKyRTims9NNyRpFhWsxZWk5kxLaR
	HfNFqoa4YWxMORfWyi4EzBNNFLGw/J5097gW272ROf/ErpvSJ5nEiP27p3xszV+tiwnV8uSUkAo
	zJgZNhcJbwEbqUmWd0yoAKkUrqqHeYmV22SLng6l2o0/d8ZOx/bPz6XaN0scdrP9jGGHgL7OU2C
	N09yUu5UVWbpYmuvquFrnmqDbt2nxBIohiukJDtTuSo7Ppf9dG74v+EtqcGLojeo7fhhV+z+uNm
	zqMLaO8mzKj2R4lFpL95FN9FHDb+nKVAqPishztbU1oeqJY5E0lXB+vAQ7dA6Qw9ggWLG7uhbZm
	5qLLiPbtmRxBXCZv4aEkzoLBpDvhmPddlnl+NNC+QMlw==
X-Received: by 2002:a05:6000:2dc2:b0:46e:624e:3c2f with SMTP id ffacd0b85a97d-47f2dd029dfmr5955171f8f.47.1783860716596;
        Sun, 12 Jul 2026 05:51:56 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm80165227f8f.21.2026.07.12.05.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:51:56 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) add missed handle for ENOMEM
Date: Sun, 12 Jul 2026 14:51:39 +0200
Message-ID: <20260712125147.1254339-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing return value check in the setup function.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
---
 drivers/hwmon/asus-ec-sensors.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index eb71e41fd4f4..2be8824e3c62 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -1495,9 +1495,10 @@ static int asus_ec_probe(struct platform_device *pdev)
 		if (!nr_count[type])
 			continue;
 
-		asus_ec_hwmon_add_chan_info(asus_ec_hwmon_chan, dev,
-					     nr_count[type], type,
-					     hwmon_attributes[type]);
+		if (asus_ec_hwmon_add_chan_info(asus_ec_hwmon_chan, dev,
+						nr_count[type], type,
+						hwmon_attributes[type]))
+			return status;
 		*ptr_asus_ec_ci++ = asus_ec_hwmon_chan++;
 	}
 
-- 
2.55.0

