Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637235;
	b=DnNcqy1pzYVDAp2OTuPlUs7yVgTDYZnjbpKGjf+EJKBaGDYiot0MpFlwxSuNbfidJ6B5
	 hs6vZfZDdtH9YdSZm3eMaqMzwDRAJldOOlN29HtzCSfZKAq+jNsc4rVkHzO8sSzFWPNGC
	 7ekCUS3Y5EEwxiRQjpax2kdod61dIft1MD5ADPcw8E4USFFk32Njd6Cs12H3AaAIksQLL
	 sBKMPDSeofLsKZGxfxdja/cFAwRU5sqlP9OQzb6KmCnDWOX3wBty5eK354Gh0nRxBBBbU
	 nbEgsq9i7865b/Sd7GwHJUmIwfnD3YjDa6CP9PJ5305ij7CewxBUOMOWwoWHqjDERew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qOSRe30ygZ0V1oNf2aDJiBMrnpAsY8BZGQBSNSsgkD4=;
	b=fpofCRu5CY1ZhilcwU4JRMlyjadmuvnKnDKbBJAbuP8RrPwoscmhgCGkG0/qRBl5enDq
	 FPyVfytZbLmX1osqMIMRTTxrnJGTd80qTtH3xYnRND4Ulpkhg0mUMuFzWIBT2LUkNGQus
	 0iHApYQZ+yoYQ8VgEZSUnYjmdRUEOkNTFJNrTjBnVsO5DOKJuSKtHOQoWzlm81X5gou0J
	 h8G0533uwtQ9boitxROO1Vk+VkP4PMgz4jeKpuJBR/wCyKh7gIX5YdBrAZwnaUyk+OBBC
	 O/4//dNerjGd+jtOMi0K3Sphz64DdSEKyNJYhUcSTxSWGTFGtYsJtryJvlsxFGGoWZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpLywTYO;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5212F606A88C
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 06:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5212F606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpLywTYO
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3791619605cso3522323eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 22:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637233; x=1795242033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOSRe30ygZ0V1oNf2aDJiBMrnpAsY8BZGQBSNSsgkD4=;
        b=BpLywTYOxSIEVFNoFGesMORxXz8oMXMAjedHZ08uH/Wjr/IjyS90VYJCHgYwvreMY5
         gKN58zWYOGr0AGvsIb9VPFqWDKLqJYgwxkM7Dzxd7GQRM7J6Z/UUe6cFcFWg7OHuebvY
         BqVmDANihYwcjdwBNSejSBMPSFIeFLlVG7KxEYhmjyp6upTvT2Mp6EvHLHH1WIEAhMxV
         asrcfcLxAf7TEazqd1M5cn9XE5v+/EpjbVJVLdLQM95OFKBWfgXo/3ToCqYUtiBOJn0W
         V2qDJ2+SvmWySuypfZrQphP0rkrS8nivV7+ZCug7uZPUmiKQwrJD/xKU8/xXZ1ZTtqQy
         /GlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637233; x=1795242033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qOSRe30ygZ0V1oNf2aDJiBMrnpAsY8BZGQBSNSsgkD4=;
        b=GF0uvF20zDYSrLEP9Acpx8dRlmrR6I/pj5emjk7dG/JDREUZLEbybvH0/ZX6e6iSVc
         aSshASl1vh7VH5jqvmB0C/nmyH68VmVUAxqhX1ulveax6ZAKHDfaEfPkVHAY5UFB3fa+
         tM/fbwYE4bFzWUI+HhGdiJZrVeZk1YvRpfft8kpW3YS7sR1fLuopH/Gl9FYylvqktgXJ
         copKNgbBNZ4+4UuqcvYeKSj1fajl48qKBGuAaOtEElIt45OIYqQt2IpCt3N93cEuQOL6
         mV5DJ6TXWZEYCef8vWFBDYgouJPm54v4YN+rXwANEL7Bp4W2FW43C2DCFuN51f5sILQX
         LMtw==
X-Gm-Message-State: APuU4Z8M/P3ja0rgPwG3f5oXATKT1LSF7xniptBv+bu/FxbGzEDG/0Xn
	q3fT9TOR7YarZDjxxOz9HrXcUiQGiBQyP+i1FbpdXLhPZnViFbzl/DyMe9g2ww==
X-Gm-Gg: AYBFou3dWm9NE5hs/GFrnlmM65XDTyordo5Zg5bE9bD5K9b94I8xGgdB3+zoRTpegAY
	wM8uZVhH7ikKCFCwnlnompGWmavqg8XP9viQF185icbrEjzJP/9xNibVOQecwjkyhlVr2Ym4bYt
	x7Jl/nYXd0SFiGMDhlkPXZK386Jak8rieW5qemo4ZU1zYtWMfa0c8z6MFZjk6xpabJUvg6EKtjJ
	+zFee75AZ2llMqoNz2qQMMEzkbafGElSZih7QK8lyK6oZMdR5/uTQR8/Cqotp8kj8jnud5WiXK0
	GfceV3Bt3p1Au7bszfbmRdu6q8bAgIvgifP3lbg+YYd+NtqIe60X3GNrrpA90wcmLkmynQwXNRZ
	Nk8TnNHh4tQtRjcMOAlWbZtVxPpeGanCnDwbumhH6EwGaNljNfn2UZFGy9FOd6z1/v63e1PE1e2
	Lmqojaz/RzIHgtEnKEmkFWHgoPrChFor3COSIE6SvZZZmy4OC4SXHmp3mdSp+TEqYPSz0miwIUH
	SLMmKq7I78k+DSo/R+lnQu9B/SLOors2UzRG9wliE76lc95nRd73uRctjQEZ5YFq+tqoZrb94QG
	dv5ZcAIbsPuT8n7oTcj+MnMzBt4RHfNsBUOfQQawt+G46C1r2EmOythS0MfrNBgwqEOKiCQ3YMd
	6a27NfUs0GUqW8tuCR2kxvbs/Kmt8W+JRPX/37h6MAVQzDrbsd42ye2HIwhDdYkzrmxVmXo8jDw
	nQdQ==
X-Received: by 2002:a05:701b:4250:20b0:1b3:a22e:b74d with SMTP id a92af1059eb24-1b50312e4e7mr4675395c88.34.1794637233389;
        Fri, 13 Nov 2026 22:20:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm13305738c88.14.2026.11.13.22.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:20:32 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (dell-smm) Reject a fan_max that the BIOS cannot take
Date: Fri, 13 Nov 2026 22:20:23 -0800
Message-ID: <6d3b86acf6713e9286e60ecf788582e840946238.1794633179.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633179.git.rosenp@gmail.com>
References: <cover.1794633179.git.rosenp@gmail.com>
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

The fan_max module parameter is used without any range check, unlike
fan_mult. dell_smm_init_hwmon() allocates the nominal speed table with

	devm_kmalloc_array(dev, data->i8k_fan_max + 1, ...)

and fan_max=4294967295 wraps the count to 0. devm_kmalloc() then
returns ZERO_SIZE_PTR, which the first successful nominal speed call
writes through.

Values above 255 are also meaningless: the fan state is passed to the
BIOS as fan | (speed << 8), so the higher bits end up in other parts of
the request. Large values that do not wrap still cost one SMM call per
state and fan while probing.

Fail probing if the maximum fan state does not fit in a byte, like the
existing check for fan_mult.

Fixes: 81474fc2fae9 ("i8k: Add support for configurable maximum fan speed value")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index e8b4e8a29e8b..24a9172b7fed 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1249,6 +1249,12 @@ static int dell_smm_init_data(struct device *dev, const struct dell_smm_ops *ops
 		return -EINVAL;
 	}
 	data->i8k_fan_max = fan_max ? : I8K_FAN_HIGH;
+	/* The BIOS takes the fan state in a single byte */
+	if (data->i8k_fan_max > U8_MAX) {
+		dev_err(dev, "maximum fan state %u is too large (max %u)\n",
+			data->i8k_fan_max, U8_MAX);
+		return -EINVAL;
+	}
 	data->i8k_pwm_mult = DIV_ROUND_UP(255, data->i8k_fan_max);
 
 	return 0;
-- 
2.56.0

