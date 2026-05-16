Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98BB38F642
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 23:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973538; cv=none; b=hMK3is+bH8nKD1paaNEEHnM+ggtV4gYZWSgwsyoOdMZmPyxLxCUPw3sowaz0Kqqk3BNuT9i2i5HAv5yRpYtu+7NnjpQEuYVF7OdIM731fqQrZUpir7MhWOWcRolFE0W+xnFn+MOzJjSCPTjORwjP5lvke1nBudULVvD8YcsBWyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973538; c=relaxed/simple;
	bh=thK+U+aplsDzvE5oAtB1E2JzEzfbWfLwgItKOTLlb8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YhB1DGHGfiVz/VOmg1+GgbjKhl0wlTPZjkts2QKGh4jrdpBg/xQ8iH7I4LGKT7nchD1gmrop+SqnSup7gE1YJZZP8CuBk/dy0iPcfTLcFdlkqHTT+ffOyjvsrlBg63yrpvQrGqNd/KsClZyoDo+mHzM7RYkh6ZrFPWzPkgKauzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ec3/zuIy; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ec3/zuIy"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-135200bc7d2so1909432c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 16:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778973536; x=1779578336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lN2ucZVsVYmHc/fedXjm4iB8oy6SqWjHFEKRvCBYgl8=;
        b=ec3/zuIylWmNyF4ErEUEVXgMmIZWo+JOLC3mR3s4sYlWLNLP7EXm19bK9tzxHaCLs8
         MXZtVOdXix+6pFRluYMmDZ6HEz95E6qJScPMjIfazPsrfM6lNswYXwASLXdrS0pmeJhU
         olaseSqIkBibR37kkl1RJ8G9FipEtHaozvN6sZtf6Ht4mFNQLvRr7Z61tDdToHyEwaSd
         nnIqdJhZRT9BxWaW9e19gdjE0GuhyHqjm+wzjzfmqG3ZhGGhE5vs5hTcz7z8VKoa9iKO
         d+PbDOXiNfE4tqdwES1VX6ZnrmLrg94ZYNcOMLF5kHv1inog50bTgiZh1Z56xfzzZUIC
         zwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778973536; x=1779578336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lN2ucZVsVYmHc/fedXjm4iB8oy6SqWjHFEKRvCBYgl8=;
        b=LNXDhh+QumO6QTtnM23heztf/AEkYCmeqdVsJ42WxBPlxyeYXOETdOynuDctLedBB1
         PxLKGLkJac0X/WVULSKo2VRAHCo9AgaDOjeBVQVky2fAaVcSiXrPStkuJEq1gxZemNrY
         KFZ3+c7fivtjfM6ekINArWYxUT/QkTcvCLtQdYT2Z23kC8L08M418IEZ84dBNIStzrm+
         CsVUV6isCfCYO+MosAcPTgM6U13Z6f1yLeLlZjYl0ksF/ZIW4g7VNnAZtk160XSUSBen
         pbSLC8jguDHmB6BeKj9CVQLhsvuQXlm7tPAMFpaTdUHQTA3vI5EW2+KX+Y0ixiXcmOci
         mixA==
X-Gm-Message-State: AOJu0Yw1UJsauQzzwSlFvWAA65Nuv4pN9XjZlCDyTUItFrnSxHHGb85J
	2Ri2vSRvwSyIM0b411F+W1NLeD5MKRQC+k29nItT2Meatr47Lyram77CI4xzNDQGRIs=
X-Gm-Gg: Acq92OHRtqfAR4ge28BWeVe4ctctdp68w6Uqti5txAb5WXit2zr0vRzr+3eb2GF7C4w
	ksTb3+eVNhTHGsX8n3Hr/a0a2WK/eaMzzSbSu3Yg6MD0ShHOm+5hY3ffUpmUonUSXKhWJ7s/Ukf
	xvxn88PiqOQLPqhYaat1MQeldDBRN0NUmpvxcD1ZsUNxK3bRDkQ8oqBvqE+msaUl56ThzqY8LA0
	Xzh9OgYpNsbVw7aFB2olKMgjHo8ceE+EsNTtXVR4iA28qjPEjPGWxk24qMLtSL07E9CXA09V0y5
	L9T74nPce7Xda7D7ZoEUV4eZA46w5pr5H8d4g3Hk2xZc5EVmPddr6RP8cXT7+rTZivB/IniMMPg
	u2gjnB5LI8vzKU9Js/EcjABjOgOYhQYxssLkSMlYVmDKKSi1FSR1DqvFKJyeTr3jcDILridEZbz
	g2vJpF6gJCeMow3uBHq6sF9iRK+A==
X-Received: by 2002:a05:7022:1e11:b0:12b:fc21:874d with SMTP id a92af1059eb24-1350484e801mr4444938c88.19.1778973535989;
        Sat, 16 May 2026 16:18:55 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm14722254c88.2.2026.05.16.16.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 16:18:55 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 16:18:47 -0700
Subject: [PATCH v2 1/5] hwmon: (pmbus/adm1266) cap PDIO scan in
 get_multiple at ADM1266_PDIO_NR
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-gpio-fixes-v2-1-801f13debcb2@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778973534; l=1733;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=thK+U+aplsDzvE5oAtB1E2JzEzfbWfLwgItKOTLlb8o=;
 b=I6OAmp2RxAcmwLKzCCeOM0Ia4BG/LH1GF96pjVwPwoMjmJ4TSDJyB1AHR0JHVt+dP7eMIaj2K
 NhdRaP+yjdTD/X4ye+j9la+4q7uttfOlXCOP5UXtUkUe2KCqXBCVi0f
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
so the iteration walks find_next_bit() up to 242, reading up to 27
extra unsigned-long words of whatever lives past the end of the mask
in the caller's stack.  Any incidental set bit in that range then
drives a set_bit(gpio_nr, bits) call that writes past the end of the
caller-supplied bits array too -- both out-of-bounds.

Substitute ADM1266_PDIO_NR for the constant so the scan stops at the
last real PDIO bit.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
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

