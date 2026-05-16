Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D4C37A49D
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 20:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778964323; cv=none; b=qftkgNY350GPI6nyFrIX5VG7pdVPXNzIi5kvdtqiwx4oekYAevQnnNVa9HsMvDdFXQPIxHHvBVwud6C07PKX42CsSx9LWr+esGsUBfTg/i5a0K7W4CPqfBjyIQ7DEbLjW4WZ68eS4jBr+JN1ecvM3PlxwT1Vw3xXUnM3DiiCpeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778964323; c=relaxed/simple;
	bh=thK+U+aplsDzvE5oAtB1E2JzEzfbWfLwgItKOTLlb8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LA/mOJw3rl4NlL9Q109aWu/cQ2tgR8k60v9IrZeY+31xjYKyjSLWZRbyS4o9aYnJxOTxxaiD6ONQ2VsYMzY6OccNPvCf2IcEcYSX9d8po7D09MQGouvV1C5oEc0UG5wMtPw87j1hZxhVvhEptJhd93dbsLt3SKoaeCjAi/ctcQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ZCdoBKlP; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ZCdoBKlP"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3025d725a05so3523470eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 13:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778964316; x=1779569116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lN2ucZVsVYmHc/fedXjm4iB8oy6SqWjHFEKRvCBYgl8=;
        b=ZCdoBKlP2IBwldcKYmxqIQ0gAOx7ZbuEWUsF0Z7HucEx+ipTHfTctxv/bVkllEygb9
         cmx7eIbKql51eurkJcpJwXi5EAG/FaeDXpEw76qUkby2CXKx9zUtr7rePwhml/HHdMaE
         Qqe6ZUb8iQaZ96mitufci0jFLdXCiFlYzHg0l/Bpvf796fMKsjK/B70/X8Mq2c5YM1kA
         S0uf/+sAOsF1zIoxuGnGiVvYsDEoIz+PSmmxLVq7PXwvrW8wVbJnqXC0tuWUjAGk45TU
         xaIduO903BY/XERBCG4hyzwy5gydXMsEnCd4HH4esfQjNjY3mL0rvSklYvIV5IESkjCf
         GSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778964316; x=1779569116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lN2ucZVsVYmHc/fedXjm4iB8oy6SqWjHFEKRvCBYgl8=;
        b=YZgsZtVoUgdac/9feAsfOmLgsdWRL0SCZEqNKJjdmkGUugeP3i5t9RPO8BTKLtI+2D
         n/DIUoDXGRRHYpylPW3q1ySIxNcpgCpa5dMKrLAIrSYlM/n97IIppoE1C35XaHddtXiF
         1Yhlsg4tPEOTwTnDl8O45JwlLXNAVU2UPJyKYrEzDKFqkIF1zlgosdCbCKo86L0JUWN3
         dkJhpGeodfmmgLd4OkUaIgBUb4MxsIbr0klQhEMtxEGDQ/DA8icOQ31mXrbZyn29xd5t
         7lPUWkEqiOf8n37aDZ3sVdMteXp55Ogfpt9MyBrveGUkLcsoeyRGH/LeslZ5WRv2oUKH
         uwoA==
X-Gm-Message-State: AOJu0Yw2Bg7whjcn7Dtklwr5bmBwvK1I5KIL9isgBMlNbWQX0j1XfzSi
	HZ8e77jRcbBJE978DOmXBuug1trycKoO6hqXTEChbJ04945EtsruBHDJpqV9RS6iC0gQT/7J9RO
	x9Xw63r8=
X-Gm-Gg: Acq92OHq/TCsVq6WJr1FvLiNFpouQMAujs72QavgcMP7NKjkL0R8NMMBEzMWXxgwhqo
	IYQlCl8UDFHGAmWcldSlyCN6mJQT6KfTzIyeqzWGBcvljF8zyHVO0kXSyUEkIkUFTZpuhFCwa4Y
	OZLLSMBdhIzmc5PEtt9nsMxdwOaxRBZrT+mSoGMW9kIGqtgmZsQa5B6oGhhoNmQLHNsSXDzelJe
	mEtBj6ifi8Wp8LVna/TSWtvAqEpzhPzRw29b36fXXxcJ4Mzt1yr68FSSk6KnBVEtL5W+pOJCK4T
	GofmcEX9WzIHmc2y58BJhXqrkCzwnvZJKLLehcivOlzM/CyJkKs2msVLcHj61nBZtt3DHL4Hn4o
	fXS2yAdj2p/pmwkLPU8Srj6r/LC1IWzubmqKcywb57YW/jyLZD2jbZQWS4gbRYH7ZhyzHc1VYlU
	zy8jRLkv8btSMhNlh2sDIpc0Ocxg==
X-Received: by 2002:a05:7300:be17:b0:2d8:7302:d21 with SMTP id 5a478bee46e88-303986010e1mr4012564eec.16.1778964315801;
        Sat, 16 May 2026 13:45:15 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302947e917dsm10181189eec.12.2026.05.16.13.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 13:45:15 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 13:45:06 -0700
Subject: [PATCH 1/2] hwmon: (pmbus/adm1266) cap PDIO scan in get_multiple
 at ADM1266_PDIO_NR
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-gpio-fixes-v1-1-38d9dd39b905@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai>
In-Reply-To: <20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778964314; l=1733;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=thK+U+aplsDzvE5oAtB1E2JzEzfbWfLwgItKOTLlb8o=;
 b=BjxUI7bCnZQeFpZr2VOSAEtl2SLHMs+Oa3mHpajmk0LAPHOhdXEZlhdAym/1bSbWC3erZwg9R
 mT6xHQTW0CMC+SUgxRZG1FK3c7FXPaM2P+/QHUrJpOofreLG2DY6l2t
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

