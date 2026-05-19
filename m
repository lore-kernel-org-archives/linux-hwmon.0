Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495AD2701B8
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151953; cv=none; b=JfQnsU9rSo73RGLEbNNLDfoSozbcAcIkpHbbuPqUW90bMhKLXJjYDeoHrhoJFRl2KYhiC3dLuem8NEQttoFZxvsCQH70BCMero765JMi7aH5MPw8cJPMcucnKVC3O+UbJFHb91fh7WhOV/QmSyBOaBSledVKWYEQCBah2wjteiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151953; c=relaxed/simple;
	bh=7oeVwKpqCxGqOnMbjsP+k2FBysBipybyK2sSj3BSta0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tX8JyfJ6XK8MJcxZ2ZWQXmkcHCG+7RuXPIy8tZZi/Jfh3qdl7Sundp7QoO4ju9DuV1qfOQA24am55wNro0EDvWmo0qKd0azLEq5ZcLS9AnHnF2aTsswSCW6zkOSyu226oDjANM2lfUDb/Hr19hd5K9D8Hor3JWdCSCTg7un4DBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=FQgGJ4kO; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="FQgGJ4kO"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1331e851faaso1492657c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 17:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151951; x=1779756751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PonswPhkAzDBi/+Jp4z7N6H9Ghz98afuWr/1QrXWWfU=;
        b=FQgGJ4kO77jKY8q6xhwk6HsxZOwX3rJWBa3v+NJx4m0MrakbxCRAamMStUDjYYHjPe
         n7WXoMre5w7wxYSFx0pXDvph4r7/N62U7wgc7ydrtOwyj3dKHYtqaUa9mvq+KBJfv96L
         QLZg7Ny+gHyYI5qIghKkp6WuQMHYwbHwY5+a5Ry+nMte2caSB5834Rb8Y3czXspxEYJM
         KUxBW5RIqQsn/o3X49QfE0y6Ms+SV8hGSvkzu3Su8oVcp5PEzjpRsT1JfQf3npfXLxTF
         fSC6SBJB1JR+PeY8J6fjxB3CPMM9YFo+ilKuWlo3BXqpnhe/YXMobz3+3Bnv+95s4zkF
         Qp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151951; x=1779756751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PonswPhkAzDBi/+Jp4z7N6H9Ghz98afuWr/1QrXWWfU=;
        b=l2VnchXtm9OkFhuphtzX8QpWZgGry7Ylsqxz/drZg28KQJJ92jkVhQyHTxaQtu7H/J
         2sa50pszT7fageKbNs47pVo/2TRq06h22b5nlvR6d/d67cQ/9P9AQX6TodKGFEZlgLgB
         yVHQ4J86h6tEett/+fK1JnuG/ZyDLqyyqaoEQDPFOWXe9YdO9rDPwiwoaDJImm9QLNq7
         TCfIc4R5riNtbgddBLSQeiDk/GwGYP+E295oQxr9tjAlmPR10chR6Hs7TZd7eO31QT5Q
         iSK/Yw1hgJ+ExkSqf0IpYK4kR6Neaba4hBXQQv8EyiuZ1UXU5MMojR5+i8IjwrB7BvOQ
         OEMw==
X-Gm-Message-State: AOJu0YwKTeyy23BhICXqntqs++g70sDKXNC7ga+pzJ/JjtxRCQzXsIb7
	9ZOezocEwuPI+g0xOU9H3ybpVEOH/EH5bg2YFUnyMvtYdOM9j8CJLflJvMRiK6qFGfw=
X-Gm-Gg: Acq92OGBkJDRQ8uQahDaOQmB+/oJPrEMquyzioN5g5zcSltLIi5Uj3XZ4S2lh9DYdE8
	tPq72/n/17Z+snirK7t8gI4nGo9MWXr2K9kEW5wBHJp2vfNLpE5aNUNC9vA7Hc5xryPCgtR9hH0
	tG4dlfdx5uHEhs9oxe90AbU3GW1DeFJxCCFx+A1hHT58DvlI3Z7BRSggclziOnULcK2KH8xKvN2
	Js9pgB6Xc9qGJKVKNaYKbua7QDHt5dkiOYLtRRn5iefNdhrCFblS211l+KXZPskdUMIBt9rCxgr
	8IS3Tr2XNsnAt2/3bKo1DJfVM8N7HqfwCgSBXa1Vaex/gHh29sy/wiNPb+wEZGSz1Bo9j0CLJnd
	XK0pU5C7sjJZSNNrDJBhk2bxAooknN+eFSf1Zfb/VC5iauQCCUJgCVAZ20GYWzNavCs8cCIOHsc
	UjFwI3swJLJPWsiVheKY4S+sDQbg==
X-Received: by 2002:a05:7022:238f:b0:135:60db:3412 with SMTP id a92af1059eb24-13560db354bmr3638913c88.10.1779151951380;
        Mon, 18 May 2026 17:52:31 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:31 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:26 -0700
Subject: [PATCH v3 2/8] hwmon: (pmbus/adm1266) don't clobber GPIO bits
 before PDIO read in get_multiple
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-2-e425e4f88139@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=1613;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=7oeVwKpqCxGqOnMbjsP+k2FBysBipybyK2sSj3BSta0=;
 b=xDW5l49mtttRT+LsIzPeEnV6ZnDcneJeKt08CuJu2RFwl+Iq9V4lOY6NCS2cJYZMS5TA1QJKL
 ALlOlTCDXjfAMwewAaxc+gY2de79j3fiY4570urPmwMWQqgOTr/ZOQs
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_gpio_get_multiple() zeroes *bits before the GPIO_STATUS loop
and then a second time before the PDIO_STATUS loop:

	*bits = 0;
	for_each_set_bit(gpio_nr, mask, ADM1266_GPIO_NR) {
		...
		set_bit(gpio_nr, bits);
	}

	ret = i2c_smbus_read_block_data(data->client, ADM1266_PDIO_STATUS, ...);
	...
	*bits = 0;
	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_NR) {
		...
		set_bit(gpio_nr, bits);
	}

The second *bits = 0 throws away every GPIO bit the first loop just
populated, so callers asking for any combination of GPIO and PDIO
pins always see the GPIO portion of the returned bits as zero.

Drop the redundant second assignment so both halves of the result
survive.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/hwmon/pmbus/adm1266.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 11f9a44f4361..4dd67c02b412 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -210,7 +210,6 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 
 	status = read_buf[0] + (read_buf[1] << 8);
 
-	*bits = 0;
 	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_NR) {
 		if (test_bit(gpio_nr - ADM1266_GPIO_NR, &status))
 			set_bit(gpio_nr, bits);

-- 
2.53.0

