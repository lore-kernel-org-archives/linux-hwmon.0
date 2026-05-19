Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834D0261B9B
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151953; cv=none; b=bdwiHyHO5PMY63FbqUN2mE68r5an1yGD3Gjg4HEIq23uo7UGCxMCRwLBuRTxPbL0EvNMbOOy6JvRpCa4cCfkU4uVGHsrKhlnySgIBYvyD67lPf+L2aPHyiktQ6HXoJpEGj29lYHQk03Jkt/PH7/OxBM95dWHK/ZTN7oTbteBO5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151953; c=relaxed/simple;
	bh=UKwTxR23bo/8190Ma3oEAswzHLxiNKOJzcKPyM3XidY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qWFdR61gLjLTxqbEh43MMWQSoVEgcLzP80qDUOEL/w+QzU2qDLIDhCoMBZEauMyKy1VY7r5oM7YUK4CGcHrdAw2UKu2PDJEE1zBdtuY24qBIJ2e7IcgcbvLFc4OmQeg2vz/7Wca1/rFOjM0kyFApexFfil/IGTtS2D3kJrJYo4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=KDQrKJOq; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="KDQrKJOq"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-132830d8281so11559002c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 17:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151951; x=1779756751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewneUiTeW4FFURX4JgSEmHD5g9yyYbAjzLEjC7sMhRw=;
        b=KDQrKJOqDWANIBBqazkc/7Tn+rqj42Ln0vZTvIf3QMUiswXR4TAbNW1YZ4rIJOIESv
         p3Tbw6e9tHRKbgfzvmXlMs9Vru6V1YY8vzVtSMd2AYE4PEBpeGgucIzSo43ZkMrVyQn+
         C/z0/JSQTw3dWykRwUpqlhFEc4/CLEVGr+wXjj1Qg6a4bV52zonueb3Mhd5XIEOE7If4
         IbkAnPyuEEn7ruNPQwcjd+jd86JipRALBX3Yxu3BWD3/siULZxHtddtKHkrP+Ss7R356
         MXJj1dZHCrMh6luFHMFFhFGtBcYC1emEEOPfeC9cNMFo6/dA27qlpcgzSsmB3fcSb4w7
         j0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151951; x=1779756751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ewneUiTeW4FFURX4JgSEmHD5g9yyYbAjzLEjC7sMhRw=;
        b=kD7l+h7qjkpVXjjCfjuPoXlyyZc562B62j36Wi7xakHCEz4BPGcYoi5ORDr0P4lzhv
         IXRUj7x2Uj/NKIqQDryo5Y6ud4MirqRGflRYUBgvb/32kxK+opM8W23DkqzuSDjIMG6r
         stKtl+OTaATjViJbejU996qT8dmWQ1tpWK9Vm/eB9U28PFDAGIqbjoUfcviyxT1uDpRA
         lXffteie34Sv0Tbos/KLmK/mNPoKt6dtW0Xd51brzEAnB2+pNtYGJG0bzZET05bLHqwg
         WXmAVA2cGtZ5aKBEmTjttp0cGD/jTr2/aAQBtIt3UvXoLBFg8rU59S+ClBxHnxtMRe1k
         G7+g==
X-Gm-Message-State: AOJu0YzmoZxlIcCDq9oya7gOjqQe5R8cbP+LFsTvc2irylHK3aQ7j2fh
	N2tNo4teHN0/h16t7PU9xYpT1WgCl8tOtLpN+TGQ9O/JRc8nGExnASNWFa4z80qBv3DJsjAEUaz
	PwaX0UAM=
X-Gm-Gg: Acq92OHoeoGSxnjEhtGJhR1XaGL2/Ut68Lz/2/4YTMdJ+1h/ZBV49zZBLW7PJp2Fkh/
	mNvguqG/qng22FrYDG1JUNYasnDsbR09Vc8UZpwNYqGQ4UEAS29giTpC6jdXUDPW1ttH/jtKvic
	KEscSmMoh08u4rzf6Wo2/hLkgMwjVWkQTc3D3y5GfvY6x0Rds92V0ULG59Z5cHUYAH/GzQa8wwS
	C8jc0dRQJMJ//LUUbnPoiQYr9CagJR0Tj4kAQM9eLux20lsG1DYnarL3lFQl0yrIoEmFrGOjIYo
	XKapJKc1doKuviIkN9CKLUmnhkAQCLBJQxa5JWx2w/aRa7wXpjY0hrcgP/bylScd12/+8n6kz2D
	gapK5e5gJI0la/rjMM271WRLnCaNAq72jGFqsVqIFg4a7RNOquLruKFe1aw2sRd8FBTce7R7fxH
	8hwXKawMc9eNUx9XG3RiM0TMKKvw==
X-Received: by 2002:a05:7022:4183:b0:132:1e01:8737 with SMTP id a92af1059eb24-1350542e5a3mr8640606c88.26.1779151950688;
        Mon, 18 May 2026 17:52:30 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:30 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:25 -0700
Subject: [PATCH v3 1/8] hwmon: (pmbus/adm1266) cap PDIO scan in
 get_multiple at ADM1266_PDIO_NR
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-1-e425e4f88139@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=1909;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=UKwTxR23bo/8190Ma3oEAswzHLxiNKOJzcKPyM3XidY=;
 b=xMhWNO55f7uVRzwHl8EIoXja68oza75rFM5LQtWDh61+3xx1p6acSL1AwhpH5fIuFDmlUhGJr
 K1cQHsXlSqTCoTjX5iLRkRb3K+kf+lgwi4Bd8npwGK39ZvPlUm6AqK9
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

adm1266_gpio_get_multiple() iterates the PDIO portion of the
caller-supplied mask using

	for_each_set_bit_from(gpio_nr, mask,
			      ADM1266_GPIO_NR + ADM1266_PDIO_STATUS) {
		...
	}

where ADM1266_PDIO_STATUS is the PMBus command code (0xE9, i.e. 233),
not the number of PDIO pins.  The intended upper bound is
ADM1266_GPIO_NR + ADM1266_PDIO_NR = 25.

gpiolib hands in a mask sized for gc.ngpio (= 25 bits on this chip),
so the iteration walks find_next_bit() up to 242, reading up to 217
extra bits (a handful of unsigned-long words: four on 64-bit, seven
on 32-bit) of whatever lives past the end of the mask in the
caller's stack.  Any incidental set bit in that range then drives a
set_bit(gpio_nr, bits) call that writes past the end of the
caller-supplied bits array too -- both out-of-bounds.

Substitute ADM1266_PDIO_NR for the constant so the scan stops at the
last real PDIO bit.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/hwmon/pmbus/adm1266.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index d90f8f80be8e..11f9a44f4361 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -211,7 +211,7 @@ static int adm1266_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 	status = read_buf[0] + (read_buf[1] << 8);
 
 	*bits = 0;
-	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_STATUS) {
+	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_NR) {
 		if (test_bit(gpio_nr - ADM1266_GPIO_NR, &status))
 			set_bit(gpio_nr, bits);
 	}

-- 
2.53.0

