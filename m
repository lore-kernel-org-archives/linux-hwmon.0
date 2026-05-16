Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D437649D
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 20:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778964322; cv=none; b=Hq2STzTH2DPSWPafChyhN7zSVtQyaNa0cUWWSD0SGHcmSXDsJyz/HPA/VeTyB2X1hVEOJKYASqeSaZTLGvHFn05T/+hC4ouH6FhkWaRttt4WhN7y/8qBKfaHR1k+swFbLJrkeL3m/hTIE6gu6dS0y12jCzcLqtqAWIzph2rarHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778964322; c=relaxed/simple;
	bh=RfhWyhkILQ9JdmZHbT+RrfNjTCyKMG4R356hSwJe3G8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/u2MxU+wGkQ8VOkeu3HqC01jx2+xQ0bByojUze1JgFEFu4TMYqdvffk1KMZRVTsJV33ohwQ/nlKUIZLanzS728QEue+4vZdTXeOLk8Fq6xXRXRa+R0Xw5ZqCbS4N8F1BEBc4IEbO7234Z/F7oOoHqcZv+bk2MB3yLM3/lDN3i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ZcgUXt5p; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ZcgUXt5p"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-132c338a537so1362658c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 13:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778964317; x=1779569117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAd95b7/1qRCPRUMfS/TXEKMP5bhCN7d3v6gwbzEek0=;
        b=ZcgUXt5pkLED9dRjEbySF2v7MT+6DaSl7KSguC6Rq8CKXdld+Hk9wtpT5Xs9sCajnU
         TBZP29I0Jmii0ka7JaM4NrRjS2ToJM533aGIR/lp+6KomRGR/AxwN5Tek16pesydCkTM
         jnSTaKuEC3siK2oBXZjVMqEJ3PFO3W2IlAW+Xk5Oqbzl+SKaIlzsDwNgHhNL0BqMHHym
         LcV5lYR3oXKY5UkBNqpe62U9RZCZ3u1qQOYTcFPhfOrDTuwPXKNBX3WGzWz1EWeH3lBH
         ee5Ugz8iaiWC/wC39QDzxIOy7so6xm/sAC2irVGuTDCrqKk+4CSrtCd7PMNH+rnVM+wy
         h6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778964317; x=1779569117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oAd95b7/1qRCPRUMfS/TXEKMP5bhCN7d3v6gwbzEek0=;
        b=Ygxky65V+HJGf3wSvRrLO6M4oJu/WTgHgWitecabX46dyS/LdnxyIZ4hA0jyC0djVu
         WKvQ3kOC7FWgWt8e2kDsZcS3EIAMmOKNVrooVhObgiMKy8uWqdRffEM5owFzSs1ukloo
         81fEdetv5qoKwvu8Rl1SzCeYwqKRJg7X1VapDzhCRGyg/Wl+mgtRyIAkvYT8RjVGvoUz
         2iA96pmpCqa1SzySdfEM7XHMngaSW6vdWN/TFVYr5+1rp/DVFZRNgiChpLCFVlIwWvy+
         bFayw16eBOvsyJ5BjpiYRpOpYf0+VASXiFxIbvk6/GQ9Vd8xB/Ux4bEbJjT1qWcvlR45
         3JKg==
X-Gm-Message-State: AOJu0YyrxWEYPhBBF8rOqxeef6Dtor/SrWBlYSijnRaGrvu0nTDxndQ0
	O5WsVvdbWyJ4IsFl+cw4rgFPv1HEDSzxhIwZbvhbIvzvuMeWn1Kksf2+iLqLBaDRglc=
X-Gm-Gg: Acq92OEHRyJWVIakBehoMHvlq0Zby4Y4eAmvaFjHrxUb4ffuHxQBoiNn81sXKsfiELA
	n210xA8NjuxRBEZTo/8t0/vIkBdrAMgiyfriL+rcsDZb2FZQGKinJQ6QSeshHwCpWzWSA0djEd4
	QuVkdHMY9RHIwKNjHAvdZ7yPwv0RJWc3Pa98TFBZQZIrasvaO3GugvdWjnRLhxMkoeAu4OgkkfJ
	qH9AeuoRy/kC2yh+vcajD6qnIH9t/ramx7blCkhYSE63yxpmlsxt0aBLpXjw7qMkKHJPEwX69SW
	fP10ZfJ/ERjgE6W6U4BSfLzsuus1IWYy2eNOIuhnRNo+lSvNE7K1ViowMpfg523rr0J8OKPrCQU
	P79RC/s819KFZ6DBjWNvmAg+lSJZVaqM+sIFASHewlJHXWxCX/eMPTu/3epZ3VTsspWAPb51rFK
	ah5KbZDG4WnQWyIm4MUuuiP5EoJedqkCmDl1pLG1fhxWV73sw=
X-Received: by 2002:a05:7300:5786:b0:2f4:d190:37bf with SMTP id 5a478bee46e88-30261e7524emr5925773eec.16.1778964316535;
        Sat, 16 May 2026 13:45:16 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302947e917dsm10181189eec.12.2026.05.16.13.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 13:45:16 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 13:45:07 -0700
Subject: [PATCH 2/2] hwmon: (pmbus/adm1266) don't clobber GPIO bits before
 PDIO read in get_multiple
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-gpio-fixes-v1-2-38d9dd39b905@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai>
In-Reply-To: <20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778964314; l=1492;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=RfhWyhkILQ9JdmZHbT+RrfNjTCyKMG4R356hSwJe3G8=;
 b=w7SBG8WKVytyc0UPa0IqJNBMBW0tyJp01IO5+hbO9NQmQBlE6iXe90w1vbz3ZaaylqfT9gY4u
 YEdqDozT+oCAAJQBxYRgvdBEZB0qsql1Lf0Al0oe+SSsx08B+L0eayD
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

