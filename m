Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0F435F172
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 21:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786656036; cv=none; b=YMZVF4IpRHKcWhPIhseT/Z2QvzR1pylIFayPrbPrcU5xiSeNKwxijW+lV6AnUKA5bOXOucdLC6imV9ieOGYs6sT//JiHJgZMWsqHWjvHCQVG+hJCbPSpUanqvs9lgpmUtmhAgdP5c8Lx/A5370PTnQucXsL8fz7id7FPxu9sElA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786656036; c=relaxed/simple;
	bh=CybgFQe+3LKwO+ojdV6IbLmwtUs6c1R2LVZh9Nd58to=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oJ4j/Y/2gGERl6ZR9kaS375hIKb07quoDiuy4Jv19c+hUbTGZ9zR2aOf10Idh+c/1Sm34mj8mV5f7A1W2xZMOMlE0ClTTVQrBN72dM9OKU0MsDVxUuy55kKjoeb/nPkuQFc56lCYPRSiGPoDJyz00W6j8vl4al7/tKNt9YaiMy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFXZdZEv; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFXZdZEv"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso2291198a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786656029; x=1787260829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIkgaHZoj6aDIeZUHMoRey9Gqj9yPB6NQRSWVTdMP0o=;
        b=aFXZdZEvvV9wyXrubcdwanrf2ks/Ko2yNIDlZ18UarLNFfDUkqntuCCKo8ni/LEnyY
         AFw3lPircDG9c3EqlhPvprrzwjAx+vrMBtO69kC1PGfaDLbthwZsxbp9fdgETm0EaNr8
         KI1VvCRXUWAUMiixE7LVPAZ48cSaOMtJbw8NIulkOdpj262dmv2w2b7Tp9HowtZStQV4
         9ib+ERRCbbL/O9Jj76i46NXyGnJbWtrO+tFwBP7rLpZ+oJzB7PCstzWEz98HOlcGuhK0
         /NpZYC7Y4FrAqMBJc3JP3Bqt+jZCpxDksGt0ADqArM+ykkdCzk9LSs/agniUGJnp4Y5J
         oRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786656029; x=1787260829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIkgaHZoj6aDIeZUHMoRey9Gqj9yPB6NQRSWVTdMP0o=;
        b=ME4IxEuKswuDwhB1SF/NQHrfmwjFDYlG2fDTt8vlKe4SDsLiyYtzNfDMoaHNzSdL0/
         yvUMSDlahlcbdRxpld5FDUkPvdnC3lqrQqmEWT/WMEdXyInwxjAf6ZslfX0kdxFmaIvh
         koy7oA0oHRBNvPTr/BLatKOJmwiH6KZrYx2OlzvSTiFQnKt2vZPgTFSz6n46sDfRaV0v
         JQ7P+Rq/63BWVxmUmrtq2EgsbcfckBuBwf1NQiejwXmmDPdEU4ytNCYpz5usJEhgcZVV
         uQWlDgchBVDp0zeMAUK1dif0Wdq0clEQH6uPfxSmgS7u5NPNx4x7n1WUm0xtR4zp3xEe
         /ZhQ==
X-Gm-Message-State: AOJu0YwSunGZ58BskDoQ9f4nCTHsbZHQEuHCYbU3fVpXrayjfsR8dK6S
	6w+DD/95P1SI2Blbgrje5opRWOpKM4fL07opnkTdqjRjno3yDBLA4cO0lZnKuVXHF5Wf
X-Gm-Gg: AR+sD13nvdpnWa387/HUfRq9HBLwIsOCn+OcKN51uTrsbSXnfxBt/FcpcWNJcc3f4AN
	5O8tR4cByNT30xBGRMy1RG++9+bacOQN3ASDDhRIu4gM3KxDkNGhlxhRGRK43MihcxagCva6oVD
	p/nI+qxdOIz6VvMxWNUC4XeM421w6J5Ri7jYQhFJo4XL6zA5/XxRVWf2uMSU8efF7EqO/PQNiGt
	7MQuMouqseYP62GmUivTmIH6HGurx8hJUiB6280ftboBY8DfuiO2Ttt1f67ycAWTH1otkK8xmOJ
	M9kt5gmYcd+wVgT6jkG2/nZfSXhXZkqTz3BGT85rO9o3+O0n4XO1MZrcHNMEGvbH0XLXhzdNr0d
	UaAq5mksqbhVZ3hQVkpw1YvH+bBzCvunbrIuwKxlgnDHc4r1edsz72szi3UcuVcAMOcaEVGEeUp
	7ZC3ggeaqQpMOvIe9NcpkuMKFkPpJgko+niteNDiZrTuT8dwITZ/zn01uOrTkDxo6i/hJ9cHGH/
	b2rKYUyXRXIP0AmwL5V9YdPHRJMWK3n0QDUww==
X-Received: by 2002:a17:906:ef01:b0:c0d:7c31:26a9 with SMTP id a640c23a62f3a-c212a22bfcfmr50240866b.2.1786656029024;
        Thu, 13 Aug 2026 14:20:29 -0700 (PDT)
Received: from arch.tail2fcf52.ts.net (223-143-146-85.ftth.glasoperator.nl. [85.146.143.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21233a12e6sm32475466b.12.2026.08.13.14.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 14:20:28 -0700 (PDT)
From: Mark Sercombe <sercombe.joel.mark@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Sercombe <sercombe.joel.mark@gmail.com>
Subject: [PATCH] hwmon: (w83627hf) fix out of bounds read of PWM register array
Date: Thu, 13 Aug 2026 23:19:50 +0200
Message-ID: <20260813211950.535148-1-sercombe.joel.mark@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

w83627hf_update_device() reads PWM registers in a loop bounded by a
hard coded "i <= 2", i.e. three iterations, for every chip type. For
the W83627HF, W836X7HF_REG_PWM() indexes regpwm_627hf[], which only has
two entries. The third iteration therefore reads regpwm_627hf[2], one
element past the end of the array, and issues a read of a non existent
PWM register.

The W83627HF has only two PWM outputs (datasheet registers CR5A and
CR5B, corresponding to W83627HF_REG_PWM1/PWM2) it has no third PWM
register, and the driver correctly does not expose pwm3 for this chip.
The function already computes num_pwms for this purpose, but the
loop did not use it, and num_pwms itself did not account for the
W83627HF having two PWMs.

Include the W83627HF in the two PWM case and bound the loop by num_pwms
so each chip only reads the PWM registers it actually has.

Found by smatch. Compile tested only, I do not have the hardware.

Signed-off-by: Mark Sercombe <sercombe.joel.mark@gmail.com>
---
 drivers/hwmon/w83627hf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/w83627hf.c b/drivers/hwmon/w83627hf.c
index bb993bb09f40..e2cb7e8aeae3 100644
--- a/drivers/hwmon/w83627hf.c
+++ b/drivers/hwmon/w83627hf.c
@@ -478,7 +478,7 @@ static struct w83627hf_data *w83627hf_update_device(struct device *dev)
 {
 	struct w83627hf_data *data = dev_get_drvdata(dev);
 	int i, num_temps = (data->type == w83697hf) ? 2 : 3;
-	int num_pwms = (data->type == w83697hf) ? 2 : 3;
+	int num_pwms = (data->type == w83627hf || data->type == w83697hf) ? 2 : 3;
 
 	mutex_lock(&data->update_lock);
 
@@ -506,7 +506,7 @@ static struct w83627hf_data *w83627hf_update_device(struct device *dev)
 			    w83627hf_read_value(data,
 					       W83627HF_REG_FAN_MIN(i));
 		}
-		for (i = 0; i <= 2; i++) {
+		for (i = 0; i < num_pwms; i++) {
 			u8 tmp = w83627hf_read_value(data,
 				W836X7HF_REG_PWM(data->type, i));
 			/* bits 0-3 are reserved  in 627THF */
-- 
2.55.0

