Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4195D280CD5
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151955; cv=none; b=Vowvfm2dv3YIIjXhc5aGXM1sti65N5G+xKW9CUgppt/6FlfdReetQW2O4h1PAG7LU6Y/fLmCvrwL81tw62FF4UVMJIYd7F/EPeUjjmFdx/m3NSvv57us+h1v9D6eH6368TBASbNZ4dI8tiVNfsWPsYcDuxFV1rhpmTA3RmK7hvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151955; c=relaxed/simple;
	bh=rSPUXzgLQKI1wwnUPptEwKPDreTpZONWfB9dTDbQyy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GkotMsfmd6s4I5wc1lhDJrQz5bImCjR9g25sGbYNwyOKkIqTQjtHqgHkLlg5XF3GaCyQfgmzPZHHULfsO+m1FmzSOQvB6h9yMHM/CNYKsXFWqce9wsUrb+RjrFZ0sYd/X+1JmIuZgrkI9XVYfQiKnSzriP0lOGhVzBK6eHbRrL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=VWxg1iaI; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="VWxg1iaI"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1331e851faaso1492665c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 17:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151952; x=1779756752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkSDV/hGDItXdWtxgXI29OZTMaQsdY9kIYFJD3n6x/c=;
        b=VWxg1iaIkmllm7/M3RQVrTAAgreJ7Od1e5XdYmpfcPojzc+9pf78AIX9wNB4viH3pB
         i7ntaBmNGjQq3nPBLvpIay2n6NbEwwEhp0SW2/DOxhPkQBN24ZfA9Uw/aQrrZzo3XDwt
         kBkcmEdy8U+Hat7WkZCZzAvDIkuFAWz9HKuq1zoX3T1yd0Ffz+s4iaaWKY0X2myde96m
         oNLnBhpCQkBWiB+MyFUP4Pcqaqits7QW3AH1G7ZowoBL09622c1aXMkgVggot7gZqN0O
         4u7LfLr2PZtwh6Y9JHaOoNHCiRs39/JlvJOTqNM78OAdgqOaR/zMPd/gEonJNEswD7TL
         iGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151952; x=1779756752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xkSDV/hGDItXdWtxgXI29OZTMaQsdY9kIYFJD3n6x/c=;
        b=BPmAD/xI6ibXEDtp/xmwpE0H/lVn/xZiVErG822KcxKbl1oLxtKZneUvDRhl2qd3au
         0nFhHkfnPrQHAIO4l661ofNs2cT38WtBVDpdxlrlULxIO9LFYzfM2BufO2VLf1FPy3sd
         9JttLVhZoqo49GPR/5p6eFD150ESVE+o1f9yxepYFYnuz1LKxT6tcKE2ITfhQi3OadMd
         h0+/fdnb2yiaI/fVtmJB9PTDecN6L4Q18kOCm9BzCXF+FsnszIqN/ccZkjhhjQ+FBxSg
         vXaVRS0Y7cT/SIlrQk+8M4FPesy7UKxj6MUJnCC3kjQlMD14om1jOrt4RvfdkS7ixVuQ
         LCIg==
X-Gm-Message-State: AOJu0Yyn7FcWtCcaGHJzVWwKVCT7qqDN/Pmz/1di8KvldHYAko0gcocj
	aPSPKQ6B8mfWUv8hwda2IeUJtZ7S4wfIQSC9DH3tv/CplrxQ446jsnOSa4EZLYTUHCM=
X-Gm-Gg: Acq92OGrfCf6+Hi9bz5JxppowQsaJsQAGLnU5qIeOnym3p7gV99hA82CQt1fRYW7IBc
	LzLtGTa93DAYetgwF1hq/6glvJHmcAZ8yHuq4v9C/iux8qaK1hFz7Yzpo8Y2QaTk/rC7yU+RLrN
	2/FSzbroec6vWx1c7KvAqmsbgxmAdpc0ld8g4UCIPlTjIaCrKwF67R9ea7fhnAUjqG+gQG51z9o
	wI9lF9kqeHQqBTdQJsl1pQvyazZ478hOLut6sZG3Ji3np+8XXWP+K1vaHVY09FZgEt/q2MrDSsK
	4BCxIDYt3bRE/q7oiBaqv7j9jNbqwRnJre5Gt5o3uJKdImTZURsjBRmSRqSsFFZSC+iZfisjKVu
	FsivGMvj/An7aXDu4q0YGc7MvNJxIeNFkBFzGfhd+vKc7y/0wireJmUIh2PTScC+ofkjaM9IvJI
	BgUETytphGeIRtQNupsfPz85MMyQ==
X-Received: by 2002:a05:7022:250b:b0:12c:6dd8:623b with SMTP id a92af1059eb24-134ff500f38mr6567069c88.0.1779151952355;
        Mon, 18 May 2026 17:52:32 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:31 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:27 -0700
Subject: [PATCH v3 3/8] hwmon: (pmbus/adm1266) reject short block-read
 responses in the GPIO accessors
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-3-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=2394;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=rSPUXzgLQKI1wwnUPptEwKPDreTpZONWfB9dTDbQyy8=;
 b=K+8bHGXkf6oBwMcxqjzXElyXNeXhFer71lr5CRjozh8Jex49aLDFwWIl2SefX8JKqfza6NZJ8
 n502WXx0f+KDep2/9UWQR4xrP0ALQwNNexLE2viY6t1it/tkxDIBXGA
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_gpio_get() and adm1266_gpio_get_multiple() both compose the
pin-status word as

	pins_status = read_buf[0] + (read_buf[1] << 8);

right after i2c_smbus_read_block_data(), guarding only against an
error return.  A well-behaved device returns 2 bytes for
GPIO_STATUS/PDIO_STATUS, but the helper happily reports a 0- or
1-byte response too.  If the device returns 0 bytes, both read_buf
slots are uninitialized stack memory; if it returns 1 byte, read_buf[1]
is.

The composed value then flows through set_bit() into the caller's
*bits in adm1266_gpio_get_multiple(), or into the return value of
adm1266_gpio_get(), and ends up in userspace via gpiolib (sysfs and
the char-dev ioctls).  That leaks a few bits of kernel stack per
request on any device whose firmware glitch, bus error, or hostile
slave produces a short block-read response.

Add the missing length check to both call sites and surface a short
response as -EIO.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/hwmon/pmbus/adm1266.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 4dd67c02b412..57cb7d302cdd 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -175,6 +175,8 @@ static int adm1266_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	ret = i2c_smbus_read_block_data(data->client, pmbus_cmd, read_buf);
 	if (ret < 0)
 		return ret;
+	if (ret < 2)
+		return -EIO;
 
 	pins_status = read_buf[0] + (read_buf[1] << 8);
 	if (offset < ADM1266_GPIO_NR)
@@ -195,6 +197,8 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 	ret = i2c_smbus_read_block_data(data->client, ADM1266_GPIO_STATUS, read_buf);
 	if (ret < 0)
 		return ret;
+	if (ret < 2)
+		return -EIO;
 
 	status = read_buf[0] + (read_buf[1] << 8);
 
@@ -207,6 +211,8 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 	ret = i2c_smbus_read_block_data(data->client, ADM1266_PDIO_STATUS, read_buf);
 	if (ret < 0)
 		return ret;
+	if (ret < 2)
+		return -EIO;
 
 	status = read_buf[0] + (read_buf[1] << 8);
 

-- 
2.53.0

