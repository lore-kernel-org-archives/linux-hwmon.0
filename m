Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEDF3537E0
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 20:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778964319; cv=none; b=b/j2aIcEG9MqPGYjy6wST+ZmWH7++qKupkxJ0tSIMiUaUvv/2vPOWg17gMIRQgwHmg7Qby9QN8yJQQ+VLTGsnp7MVO29rXcB+Kjk93Youv8ZDJ0705fDSRIZXag1D/cf5dQ5euO0n4mY56VU2E99eJYawHI+A9lEd+xHCb68/uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778964319; c=relaxed/simple;
	bh=ZA9YwSMOB2P20GluMrii2imNU6EYpgFSSMjGH9Xw3dg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VvUTRHqztcgrJMHmkJ5BYZqDpvJJ+uQdVm2S/+MOSVw417vcjvWokLcX5nz9pN3VWN/+ny+8OaYQCmZDGW+CAOaxW1kXun9xjTZGsP25XiEBIrp4g/LWJmy7K2nnnIkz1sPBlUwYV+PfP8MTGaYNhq02vqKRi34dbMKSWKw2SfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Bu6GlWwK; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Bu6GlWwK"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso985811eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 13:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778964315; x=1779569115; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uVEabIThyai3FEuPEZ337FSXUM+wr3XkJNz0zdLoyBg=;
        b=Bu6GlWwKbUbz6QdjrElJsr6PeCUjKBBhOR9St3e8Nooq8aYDsWly4zsFyFPTVopRBq
         5ThBFw5ofrpUGe4EASDGDMLcPZ+Y6IzkB8Jsv7yIXzmkkNjb5p8ZGbA6smDV1QvAYomn
         7rHPZNErTFzc/AvRtXg+8Mlv8K1hMpPo7PE5K5QgGG7mAqZasZChoV9FkR63ZCLt9ZeY
         sR/P1bxWsV9ELh/SRG8cwq6eaXE24QmlQuiZfH62YwmA2Cu8zAqfgBFQWO7LZaF9Yr4r
         /Q/mibS+VnA1DccwBEGLJu/JQHUz21lDy4Riu8xr2f+LVA/uB806tnuUqn/EUSZFX7nH
         HHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778964315; x=1779569115;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVEabIThyai3FEuPEZ337FSXUM+wr3XkJNz0zdLoyBg=;
        b=mPa7XF8GQxZ9vsPiC9OuAlqtFwCPHp5vPONnv48/k+0+kXLE236Mmc0I35Hsf8EKka
         aaJmHcIUAk9hbVwhC6lstvzjC4TnAV6byxdZ9IOe67R6kXb+dR+3K2Fj8fxfpCUKW7d6
         lR/tMcUVsryl6GwMtI4e4Vu+A3rfEKqPFq2UIhMw7aCpdXTJv8kPFQghRhcp9Jo2QY+v
         IVuiNIXBxLRLVZShJb/bjA1EkYE5kcRKS8Hzneytl5HHiGp5K9RplA5cdWeY2ZL6BfIq
         HH3LkoqbFkr6YyLKPJ7E3idawSOcqOM22pajkyApuGCNxbAmLuAnUTCuj9iCRQfMoUVH
         59DQ==
X-Gm-Message-State: AOJu0YzXEjVnQz04br9yiC2wVUCoiE5+0F4ym9X4IQcTfujYBcKraMmO
	EhZnhZ8x3MoswNIqZLoDalX72CJ1uAFr4iG3ds2zvFV+EyulzJ5VN9mQERcLrjoSYkOrxW8AOvk
	d+jU1jVg=
X-Gm-Gg: Acq92OGbgXqMJksQEeENG28qPUyHdLkVE/dcIj82yrVFjeG1a88dVvC2PD0jIQwYOBm
	fTG/dtnJdSfxXZjMd0G34xNmQo5zcugyzTbOCpBtONvYo6pm0uQW+P7Cg+lOaxoDAv1iZHuaKcr
	ol7uOoMMb+OpASsjsCzWDOrc9UzZiBUH6EBErS6LZt9XhDslInAy70+94frXTs4tK05upg1QE1K
	KeedBPlYF51XNA8UnuVG9r7KDt+MqPUTW6V90Ab3aNwB9Q0Cg3xqR8EN3f+9hp6eU6Nd9GzFWDN
	gz2RfPRQKJuUYmitz6xf8tLMzGubAvh6pWQhtk/VM1eZTeYgGSZGBpXad2B9rqXNqKChF5EfQrD
	JUKwa7yHiLOIk5/LcT9j5fr302nVBo62ruuj+N+nsxPowXUeM5JTZmnkipaxPtFspWDOnbLzWz4
	spjwCnxGNVZITudNLaie+9rkCkKg==
X-Received: by 2002:a05:7300:7255:b0:2d0:239a:23c9 with SMTP id 5a478bee46e88-30398677161mr4329663eec.16.1778964315089;
        Sat, 16 May 2026 13:45:15 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302947e917dsm10181189eec.12.2026.05.16.13.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 13:45:14 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH 0/2] hwmon: (pmbus/adm1266) adm1266_gpio_get_multiple()
 fixes
Date: Sat, 16 May 2026 13:45:05 -0700
Message-Id: <20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFHXCGoC/yXMSwqEMBBF0a1IjbsgCRqwt9I4yKfUEvyQakUQ9
 27U4eFx3wFCiUngWxyQaGPhecrQnwJC76aOkGM2GGWsqrRFF0dtrMVu4Rlb3kkw+ujroJUrg4E
 cLomeIXe/5rWsfqDwv5/gPC9EsrNWdgAAAA==
X-Change-ID: 20260516-adm1266-gpio-fixes-dbdb9c10a4c2
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778964314; l=1681;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=ZA9YwSMOB2P20GluMrii2imNU6EYpgFSSMjGH9Xw3dg=;
 b=z0KvGRAxXpGOxnVQJ8+lQLLDDEZfwJjhR9BPUurGOwkSyhYJbKkmLxtUr/8RYcMHV/DH4CI/f
 x1zOnDpQDRfBMFvH2tY91AtqKMe5KnIulhxqJZVaU6Z15l4sYF2D8aG
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Two pre-existing bugs in adm1266_gpio_get_multiple() that landed
together when GPIO support was first added (commit d98dfad35c38).
Both are reachable any time userspace queries multiple ADM1266 GPIO
or PDIO lines at once via the gpiolib char-dev or sysfs interfaces.

Patch 1 caps the PDIO scan loop at ADM1266_PDIO_NR (16) instead of
ADM1266_PDIO_STATUS (0xE9 = 233, a PMBus command code that ended up
in the bound by mistake).  As written, the scan walks
find_next_bit() up to bit 242 across a 25-bit caller mask, reading
out of bounds and -- if any of that incidental memory contains a
set bit -- driving a corresponding out-of-bounds write to the
caller's bits array.  Flagged by sashiko in review of an unrelated
fix series [1].

Patch 2 drops a redundant "*bits = 0" reset that sits between the
GPIO and PDIO halves of the function.  As written, the GPIO bits
the first loop populates are immediately discarded before the PDIO
loop runs, so any caller asking for a mix of GPIO and PDIO lines
sees the GPIO half always reported as 0.

[1] https://sashiko.dev/#/patchset/20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Abdurrahman Hussain (2):
      hwmon: (pmbus/adm1266) cap PDIO scan in get_multiple at ADM1266_PDIO_NR
      hwmon: (pmbus/adm1266) don't clobber GPIO bits before PDIO read in get_multiple

 drivers/hwmon/pmbus/adm1266.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
---
base-commit: 70eda68668d1476b459b64e69b8f36659fa9dfa8
change-id: 20260516-adm1266-gpio-fixes-dbdb9c10a4c2

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

