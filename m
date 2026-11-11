Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385733;
	b=cUoAVcxiYlCa9S3TIPzxgqwebZ7FPlSrEnpHmgTA4Ed6xqEEfiN65DJzMj3Z+0YuXCI6
	 WPoqFk+JSq1zqwGL7KV9JNurmxhSwQjcLRX5oHxvYd4H8ISvJ6dnogSY5JNBbqCzVA6nG
	 85fuQu8afZn/CduNGrwUGgAtGEvlwwa++TRxiEA37qDHWJkeYxnec8nVZVmIstq00Z8uQ
	 C1EG6Sl8Py82zvCdUMv6AjOZ35J6YPJRJ3AXxI6SqQwwZvFqIXZxGiqNk2HybAg4/EPAm
	 QhDXKw7P6RK/5UgEpC2ddDG4vlyioNSayGMjKoLXpaaf/BZuTs+FVtcT+VSq0nSmlKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=COi43T72uSgvst2Ku2s94ThMDdsudgyv2xo46Wd8h14=;
	b=dhvF0oe/jAdOCiNbnap5CRTVH30PCaqP+oU0dbnBlxsAs5vUbiJChTnjaprlzQVzAir+
	 7VWICfPCGsQgRiXATkBP2QM/Ne9N3M97NyEduXLD+iBhHd5CUIFaFn1b+yW1DK5KU5pQo
	 Co9fA/farE0p8tkcnBn+8jvDsaU4tFZ+h+2/jCrW6nHWDcCzusRdERQgxhkI5PsCj+QFC
	 YltmzH6Epds0uOjqDo8ztDfIeT7Xh9jFnRe17Z94BQDzssG8GcOXY/2az0qYCgGDfRuCO
	 svFihpejolrj9y+JL6QtV6KdQ+mtj3HNW8XzUDYrB50V13kalxAXdt72XQlbnOWMoHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v0qUeLFd;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6E360A2621
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF6E360A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v0qUeLFd
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so1869545a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 00:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385731; x=1794990531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COi43T72uSgvst2Ku2s94ThMDdsudgyv2xo46Wd8h14=;
        b=v0qUeLFdqRGQ75zbwL5zPUxsSnPAex48KIgU4LR4aCo/yqYvk0sUcZVI9a1Lv043fb
         7gEP2f6aEg9KJnb2CLtb5ZgD7eSIB/80zi+FhXJr4MgY/asM352E4W5wMOFuf8xPfD70
         G66ivnoaRCjtwjr9TXVPRxDt3kU1XGSkMik8bcCks7MVulKoBHllHGFhuj+4zRRlhE3f
         RpdC6WLyjibKrt49xsLM51X3r0kKkfEKPpgy1bNSl3i2pljTeJArG50cBnScFrBmYGlA
         MAE73dRr4XS0nGBLPM/zKWAlowzlpzEVrvpdczoxOIz/xZVX3D/zTS4O+Kt7wSXAq7/r
         ezJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385731; x=1794990531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COi43T72uSgvst2Ku2s94ThMDdsudgyv2xo46Wd8h14=;
        b=yfxI2JzSL/pXJ9Ce/gotCdoJvngz9BMBEAnT7c1rWYjNhq/oL4y+f2aeAtpTctdScP
         0HKqklKZAkGhMKa3oXiNPJtO3F/7xi7yQw7pSrJw0aZ4zkCaw93KhRqWIYMbxkJk0V9c
         Nz8GXc2ULN0zwykX/koE2QGrUGtvrWlmXb67KRsg1FnGLUPWHiftSkARgl9ITmapkSId
         3Q+sN7h7f7oEWLmZPw+wKf6qcj/IGkWj3fHG3t/4CYr/b+9UiRId7bSmEbpRFAyHk5aC
         rOVhblSwew6cVCJKKEPc3kL6wOixYThTKJmAr5t8qWMrASU0C3w76MEzc5EJLlQ3Q5BK
         Mg1A==
X-Gm-Message-State: APuU4Z8EN7bsVnUTsRZt4v35CiUEQ62Ek51QWBImRjynWL5U/U5JexgJ
	EsJyutpYAnulY3IgDXH3/oqgZLSZKLKc6FWZnGg+dUbxyB1tigBzzC1W
X-Gm-Gg: AYBFou1lKHbBpermWq6euTqQYxqx1kneD7wPbFbBcJrLkPkP3BzTxI0kyeMFGIkZjEG
	aP2/Jf+s5Ati1GmKVp70rlbg2d6MeR75SyzsRru260EG0N7EyqrM2PyZPY3sbjrpUKgrZSl6hNz
	1tvW6Oi70MoZqrOg2ZGVaRGvVmT7jELZvyJPs295V2MwKDQTabH40twMRY+R7EPB7xfUoDJYY/9
	4BPOFYE4Qgkowd8WWe/f2nynTa46Z+IPjuozqYKn0qneMo0LaWsTTB830zBq9+R8c+OvZwk6b9k
	pYINP28kPj64vM1Tv8MsU58J/ZEPjFI7Pri9aqOcSAXshjpuqOIFc0/t5AjaAXpTTJxqPJ0hqTQ
	ax8W0uRIRAIV0+XJS3f5ggpL6Eso+2Qs/Wd3h56VOONrdZAV9Qo7NKieBYdzHkaoNwexf4enJq8
	NpVdYpwd9FuDe0t0sMyoqRvLaY6bOPmcX6b6taEgAbeNuXg0POa71gziPAsFL1251ySrF9aUpQN
	yeepvdKuyAqygRfxgCzu7DympagB6KMFyUMIvr2oJcUM7jrtdZtumkODyu4qpXOlTk5Z2q4lEaE
	vJXr6u1lDaW6josKG6g/lfTvY+2GpCnfpokEB4Vy6rz6SQUOnA90aUjnLeIs9aoSc/uMGsXuz0c
	kg4L0e8ICwceUqnRMtMGU+nRchovwhOtZIlzvzxim8RuSrKX642tI5HBa0mzlAJ4TeZnTJp/Ba6
	WxACpCvXQV5xer/I3e6t+yHSpozfoD1CH+B1QzAV+uNUyq
X-Received: by 2002:a17:907:96a5:b0:c40:9e84:942a with SMTP id a640c23a62f3a-c5066dbc955mr119859666b.48.1794385730957;
        Wed, 11 Nov 2026 00:28:50 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:50 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 3/7] hwmon: (nct6683) Enable fan control on ASRock B850 Steel Legend WiFi
Date: Wed, 11 Nov 2026 09:28:34 +0100
Message-ID: <20261111082838.1418051-4-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111082838.1418051-1-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NCT6686D on the ASRock B850 Steel Legend WiFi (customer ID 0x164a)
uses the same fan mode register and configuration phase as the NCT6687D-R
on MSI boards.

Enable fan control for channels 0 to 7 on this board.

Tested with pwm6_enable set to 1: pwm6 written as 255, 120 and 60 gives
803, 577 and 342 RPM on fan6. Writing 2 returns the fan to the BIOS
curve, and so does unloading the driver.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 Documentation/hwmon/nct6683.rst | 4 ++++
 drivers/hwmon/nct6683.c         | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 4c137eda6583..026515c35243 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -57,6 +57,10 @@ Fan control is supported on MSI boards with an NCT6687D-R (customer ID
 pwm16 control the system fan headers that are present. pwmN controls the
 fan reported by fanN_input.
 
+It is also supported on the ASRock B850 Steel Legend WiFi (NCT6686D,
+customer ID 0x164a), where pwm1 to pwm6 control the fan headers reported
+by fan1 to fan6.
+
 pwmN_enable selects the fan control mode:
 
   * 1: manual mode, the duty cycle is set with pwmN
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index d43dcf90048b..29fbf438c04c 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -1539,6 +1539,9 @@ nct6683_setup_fans(struct nct6683_data *data)
 				data->have_curve |= BIT(i);
 		}
 	}
+
+	if (data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8)
+		data->have_fan_ctrl = data->have_pwm & GENMASK(7, 0);
 }
 
 /*
-- 
2.53.0

