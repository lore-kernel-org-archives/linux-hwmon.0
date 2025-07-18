Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700CD1E98E3
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Jul 2025 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752831718; cv=none; b=LYGuWuod7Y91MCHR6S8NmFgpu15aBuhPv/0XwqsnO1zf4EfKmiiYP1YvcuIj5UiOjECeK/UuSPwWzIDH9h1GIeXZBO+Oyw4n/klKXtm1Mrqrn6O9f88HDkE/UuIbYUTgLSIrsYJXKVPZIRHzBU1J4Ch56QGqkPPS4u/e/7DXoKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752831718; c=relaxed/simple;
	bh=JBTzCB7W7uvvbTVz9rlkuH4KGdOD6IECJb9RqUouDes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EK/Q0ta0mflRbWvJWHead51M+RCP4gzhy94BL0aiCmtfOUcnwTrZLEqyyvoYOruRvRrjqnUBuKwAQRJhGZWRjn6bvo46z810JMhSPZwsDKDO7Fw/5wdhLAuxy259vFOEPS3REtG1t+Tx/dtiKdvg4YRmuLrPZ93KRkUdpCjVTVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIG2cpOG; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIG2cpOG"
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso16368801fa.3
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jul 2025 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752831714; x=1753436514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6UYgwWvjYHIEa0qGI+CiRuFILIHhGJ+eT+h8ne4/WKw=;
        b=CIG2cpOGhrJ4CSewnbDzgzJgrZqRSGZXE89u63py79EBgHqlSPKqAvhEw0x4DkjcY3
         nrD1iI+C3iNOBIBngIo0q6O5yrq+TZim5KharDDjXf/YiTKghTdMvNK/4b9w3kjSkI21
         37Qi4Mf71hi+eZe1peJmcZPvDoT42fxbrR0uaf2wc9sJdN9vNtzBSH8Gf6MEBCSXlEHL
         rKR+L4zFG+WaDe41nNbEAOer884Lo7Rr5RXTC/Zi87M6AbbpLiaxHuDoqmBkNs5p3aaW
         v+dNI2p01Dk0q+o+xEGkf4QnmcJgpC61JGKP+8HXwTq+QMTpq3SnZLk+OL/19O6rm6vC
         WsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752831714; x=1753436514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UYgwWvjYHIEa0qGI+CiRuFILIHhGJ+eT+h8ne4/WKw=;
        b=OG1NAxRQgJG57C3IcHkg/KnuzxJq2LqPbhVTEh3wnTvViFCaOCLTXWZjSbBNXhtouw
         abdrpN8RoNG5YhK4me3VoIxfGczjBGaGvp/qOFionNu1BYl8HLBiD0WkNLUGE/VQ/fPP
         a9Lb0G+J89XQS2DSKiD5/FRUrRcgtm6ScVIcMNG+vBqRIkeXNl7r6hraqlkLsCo4AGOd
         yC8Pvp9TOmmNYQ1VFadpGcAkr4Wrl4TYQgqkg0OVKttPCslcz+U+EgXQ/q1i8PD8Wcye
         ABSnsF/8CutJpGjEvFhzI7Jcn2wmWfUoQh3X2IzdtojdS1WgZItvMGMpbQSn7SKMcLLV
         3ZCg==
X-Forwarded-Encrypted: i=1; AJvYcCXOV2WKwf8uXm5lWH2lTwT0ddOdbPhntM8Bzvn9j84PLC5UCu5m3l6cUKLT13EVopXw0VP+W2zO2VWZaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpkcS1j+BQy0L0DyZh6YhlVYh0daeKGt4TBTgHR9ww51joSm06
	SYk7D055ehpSyw8tvSZu8Erk3wl2v7xcxzj7SN6NZ/Ouj8dBJWYioAyM
X-Gm-Gg: ASbGncsw/6ydio5yJWPTP/kwmb5XtpG/0tFwD3ZL6q+mT24Fekpx74ahTW3DUHvnLJC
	St6NJrVGPSdfA/uP4XCabRih9RFN1xKonPb+wH4phU+D6rm/WeIN3n5Kw7SeACAF3tnL33PV642
	lrZOifZmLSdsavVrv5hY8pr788O4igvyLQ4lEHfyNpJK/pyQgfKbvh3e5/8yUyL//OrdpPfZ7ps
	pgkYNPpz6Y9bKm8eX+ONtygMG3meUzPjQMx1R+/0bJF0hdTOJSzG4CAveW8OVBrK7QA3OehY+v6
	tE9VaYQeNUAcLT+pYDKBvs/vKC8IvPq607sMuH+tjNKz+2E5Z4X/gN16DXQTlmwEwXz12EjCOvn
	Bz9SzHXuAlsF8tOke
X-Google-Smtp-Source: AGHT+IEIjB6TU7qZ1s3x3fkBKcD/aRhsy8BzedzbSrwaTPN8t5ac9bbqylB8p7uWteX+j6ZW4H7+wA==
X-Received: by 2002:a05:6512:398d:b0:553:35ad:2f45 with SMTP id 2adb3069b0e04-55a29729104mr1944560e87.50.1752831714060;
        Fri, 18 Jul 2025 02:41:54 -0700 (PDT)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d7c5c6sm189306e87.115.2025.07.18.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 02:41:53 -0700 (PDT)
From: Torben Nielsen <t8927095@gmail.com>
To: bartosz.golaszewski@linaro.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Torben Nielsen <t8927095@gmail.com>
Subject: [PATCH] hwmon:pmbus:ucd9000: Fix error in ucd9000_gpio_set
Date: Fri, 18 Jul 2025 11:36:45 +0200
Message-ID: <20250718093644.356085-2-t8927095@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO output functionality does not work as intended.

The ucd9000_gpio_set function should set UCD9000_GPIO_CONFIG_OUT_VALUE
(bit 2) in order to change the output value of the selected GPIO.
Instead UCD9000_GPIO_CONFIG_STATUS (bit 3) is set, but this is a
read-only value. This patch fixes the mistake and provides the intended
functionality of the GPIOs.

See UCD90xxx Sequencer and System Health Controller PMBus Command SLVU352C
section 10.43 for reference.

Signed-off-by: Torben Nielsen <t8927095@gmail.com>
---
Reworded commit message as per suggestion by Guenter Roeck. 

 drivers/hwmon/pmbus/ucd9000.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 2bc8cccb01fd..52d4000902d5 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -226,15 +226,15 @@ static int ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	}
 
 	if (value) {
-		if (ret & UCD9000_GPIO_CONFIG_STATUS)
+		if (ret & UCD9000_GPIO_CONFIG_OUT_VALUE)
 			return 0;
 
-		ret |= UCD9000_GPIO_CONFIG_STATUS;
+		ret |= UCD9000_GPIO_CONFIG_OUT_VALUE;
 	} else {
-		if (!(ret & UCD9000_GPIO_CONFIG_STATUS))
+		if (!(ret & UCD9000_GPIO_CONFIG_OUT_VALUE))
 			return 0;
 
-		ret &= ~UCD9000_GPIO_CONFIG_STATUS;
+		ret &= ~UCD9000_GPIO_CONFIG_OUT_VALUE;
 	}
 
 	ret |= UCD9000_GPIO_CONFIG_ENABLE;

base-commit: e2291551827fe5d2d3758c435c191d32b6d1350e
-- 
2.43.0

