Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BBE568FC1
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 17:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999274; cv=none; b=qAPXxveF77JbNPbsThejfJyoifvLYJs9ia//Lr5v0Zzab6UCmPdsQpMk3qAYXWJzLPb8l85kPSbcnBmxg4ZcaH9U/cBFesYmFY39On8v7n63rgesqNn9YUHJOYyccnOjAKzBGnW+X4seWSKBsDxF90La7sMMtEgxXDkKnhH7ZcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999274; c=relaxed/simple;
	bh=KvOj9elpd3Jkkeq08+mMPj08ZLLt/WtGD9D/KXwwPtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AizziKFmqzGoXiqBI019xJtFY69QSA/EWiRa9sJreEf/P3z3ioiCHEsCn4A+jhGG5Gso6JJA17ua32hQg1GswEMzc2kjqNXfTvB9RJOvKssgbtp0vgeH6lDozypCqIPX/btXHOLzqUMy8qbRJbxDRoJCgeoVpm8sVlV/2uihLt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rzHpeQw7; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rzHpeQw7"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e62319cfaso136166066b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999266; x=1792604066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VIDYdGNKUB1e/3PxpKxX9vkb9H1F2shBQcc4U18udes=;
        b=rzHpeQw70CqFBH5BcQnWgLlrhk+PFdX9s+OfBP4OoFXBpjRsgGfcoocZzeaBWIej/h
         xkFTtxg9ZlIporAcKwrgHJ9U3kaDqSjvsgkMs1OHSXKwoFzofgGUcDGMGyI0Dz0ot/jI
         Gm+iNu/mVyZ/YD0W/i70vGNrLGvz1Mzj3VW+F5CqtaC+SpJb52wRdkdX3C1QoeoDRhri
         ahSuK/QGAdZMlYYJoYmNjSG3dnjYIfe9B7aX5OL37/AwFeB9pURU0gcYDZw4a2564DgI
         JtAyRCpxuydiovLOux1fcg40pO2dIYCedFW/esgLmfm8QjM00fBeZSQzEXj6x5NPzZW7
         Ye9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999266; x=1792604066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIDYdGNKUB1e/3PxpKxX9vkb9H1F2shBQcc4U18udes=;
        b=x0xPcGadYhpF2JKmUR/MitLx9B3suj0pvqHsZrpfv7Asf3U9X/JhouoiOoYrNtD90W
         Kv5TQQ35Rf7z7jb58k7UFyn2t88FPk4qLTWd0LwmBkXhz9Yqy5U9S/qPH1mGqsUlLl+w
         nRGvnJhej+CK6G6KXqgA9IC9sKUx+SlG0IORkhHQ9FUrXPJ08L9jgWZxZMU26pMdLXFd
         PugBub3TEOg2u0aUB5eVI4G12ZG9BCBe7X3DOBtk7jRLN9iNn9BRLJhohkXGmFyNHPHu
         XSJjnhS0/x/DopSXCTiTbwgR6wznWBxIgetILevYKL/yum0x5X0eOyHi72O5bCIMnfTK
         8FRw==
X-Gm-Message-State: AFq9FYLm8z43kZExOcdXIDVWcK5xWpJKHWW3FUS4lkzcPnl/RcSmRGug
	a6KAcPuI2HXeb3t58+H2X7Xkfn3h6KwKE8Bcrp68rYqCXOwOP8P9FzDR
X-Gm-Gg: AYBFou2nAB14wAH8/cRXYUPye9uetQJjsWLQWYUxzAgJou9R5DYTez+YfR7AfUqqHCX
	Rk0o7KZedeVighrl3k1XxgEFJuDaraZpt/kNwAoszMxu+6sM/RKaLhmgB0UbUkDF0AuZyQ4HWm+
	qWXTz8cJGU2WA8r9XGkxLa9TTOvpUiZwT1GUTcssdlY9DWrTH4+C5iKE1rAeTf7hyf7UvZ0a4gM
	DrOpdm4dz6wzKOZ4joJ91ZADuUbf8ftIASYQmgk/y34emNtUTObRyE34CuIl9msffJj7TCDzV1S
	06OdduNv3gmlO4ATDvlURL1VVLcUqEyZCiS/Nv8ZVT9JlqsolMMxw+pydNt65oeY6tU7hTKFkbu
	rndqPJSDmRl/w037CExwfJ5RtgvvHm8bg1hDkHUpezzHakZBZvJGD56v0DhDzCBYQFJ3gYD2rpi
	YGGqXmfrFBsdrpnL8clNpTEJuW4q+hZVOWY9kN6vOG3iFY6TRtjaTlLi1tiPPpREfu0avwfg4UW
	hqoJN39LLHO8kMy
X-Received: by 2002:a17:907:c613:20b0:c33:dbe8:291c with SMTP id a640c23a62f3a-c33dbe82d08mr732381966b.20.1791999266201;
        Wed, 14 Oct 2026 10:34:26 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:25 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:07 +0200
Subject: [PATCH v3 08/11] hwmon: chipcap2: balance regulator state
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-8-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=2089;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=KvOj9elpd3Jkkeq08+mMPj08ZLLt/WtGD9D/KXwwPtw=;
 b=QBCfaQn7DzynwXDeiqhHQI1r1lSPXZSFg54KCEy1PoEQxlhK7WhZEOc26YvOQVA2c8kZYJxqz
 pNulMyiwcLSBvv2Z/jykYA5tIosoMDoM7BJ1wPJWMZdnNghuaalLfbf
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

The current implementation does not guarantee that the calls to
regulator_enable() and regulator_disable() are balanced.
regulator_is_enabled() might return a negative value, and an always-on
attribute in the DT might break the symmetry anyway.

Add a regulator_enabled flag to keep balance within this regulator
consumer.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 837b1830f2e4..952789fdb9db 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -91,6 +91,7 @@ struct cc2_data {
 	int irq_low;
 	int irq_high;
 	bool process_irqs;
+	bool regulator_enabled;
 };
 
 /* %RH as a per cent mille from a register value */
@@ -120,7 +121,7 @@ static int cc2_enable(struct cc2_data *data)
 	int ret;
 
 	/* exclusive regulator, check in case a disable failed */
-	if (regulator_is_enabled(data->regulator)) {
+	if (data->regulator_enabled) {
 		data->process_irqs = true;
 		return 0;
 	}
@@ -132,6 +133,8 @@ static int cc2_enable(struct cc2_data *data)
 	if (ret < 0)
 		return ret;
 
+	data->regulator_enabled = true;
+
 	usleep_range(CC2_STARTUP_TIME_US, CC2_STARTUP_TIME_US + 125);
 
 	data->process_irqs = true;
@@ -147,11 +150,16 @@ static void cc2_disable(struct cc2_data *data)
 	data->process_irqs = false;
 
 	/* exclusive regulator, check in case an enable failed */
-	if (regulator_is_enabled(data->regulator)) {
-		err = regulator_disable(data->regulator);
-		if (err)
-			dev_dbg(&data->client->dev, "Failed to disable device");
+	if (!data->regulator_enabled)
+		return;
+
+	err = regulator_disable(data->regulator);
+	if (err) {
+		dev_dbg(&data->client->dev, "Failed to disable device");
+		return;
 	}
+
+	data->regulator_enabled = false;
 }
 
 static void cc2_disable_action(void *data)

-- 
2.43.0

