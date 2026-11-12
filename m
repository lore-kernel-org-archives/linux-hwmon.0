Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499515;
	b=ItRwCIoqCiINnx5RPWXxSxXs89Ay5CbwJ7lSGl9rGV6RnQWaAJDt57wnJn3tojicJTKi
	 FUybaB2BkBZAeqWPm1zHOKtBvANtWogk4l72vhVNBkotHP2W6kBCihspR1qM/HqQa56PI
	 lZLKiCi2TYLB+V0vsI5dNmEKdk1neS3ofeDMWa3xwgzxTCN4PUJcBOkNn0SlBXgBsBFPg
	 8xRkLt3H3JYBpo8XaI7tTo8Jb3MOi0bIOnpVC5/nbSFfJ+u6oa2TQ1xIcDYHl1oaekudj
	 6DOp/VDpl8DVPn1HEeqDN25GAi85kzi3IgBBLKM8v6iHT9oFvgFSEBBG3tHG2Kq1PZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GqVMC0wC5O4rqtGbrG6Pdff5be1hDQg85nj0i72Ii/g=;
	b=w5WRDXAH64j5aaTgtTtUup6mPoXosOW2e/wuuNsFyva7vjQtkljVgFCbWuBCdYrYRIzF
	 gapwPj6FPh6FWOZuM02j++31ePOzEdhX7vbajr1PoI9adYMh0q2yCaFvKMhPwgPyDOskV
	 iGDaMilkjHeKeb4uKvVxRuRTv1FT/1ueq2ZLUNM1l2vCG6QwfVGvuWrBjip6rISZZUzgo
	 Jc5jnFENERKDmREOIGM3umzUsuQHV94pif4BP979MV75/dccSMiphmqtSOrcxcgpJvs5T
	 1rWK/9c8veQQE2vxsqMvFbTrnenr/kTys59BEHLXXqD/mzD2DdooJYexeMjhbomT0SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMdNuNUX;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D19A606A330
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 16:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D19A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMdNuNUX
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso47923575e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 08:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499513; x=1795104313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqVMC0wC5O4rqtGbrG6Pdff5be1hDQg85nj0i72Ii/g=;
        b=NMdNuNUXSgyTtbIp1Px92Wy6CYT4KOpXJgb6wgX89IVDpHoiYLq5H46PE8QjI+60WD
         BYzg8cYdLB5BJCFJeioM6ktUkZ5hJGqFqII5TNJddyAbHC+zGM5HCx9aJ+prHEHOK5rN
         5hkMbwaDIUhnIDgZ0SFLKSRrUSxKTDcaC/NJ9lhtjB8KcY/14VQTtmzet3b4eJwypnOX
         875fu9USDLNPRYKo8OLfzIHOv15/2UJ+6qsWAp9SYQgnOgFvQ5UOynDfdhUpa+ZG3iAB
         4eZs0J9RtrQjQohKAvzrq0byVRLR+bUoPjVnvXeaOWa3hxJ35qsy7cWddzh0WdeOEMqB
         vqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499513; x=1795104313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqVMC0wC5O4rqtGbrG6Pdff5be1hDQg85nj0i72Ii/g=;
        b=Fn3w3rWT0Cn/kmMgJuyen7/D8dOpaeZIP+NW+KYnf4I3J9+nD79ucXOGAVRvAeWzGq
         s1L+cXjynhg/F1CqgwVZ8/b82f9pHyXT+cByIcn9mqirHtWcllx0/4v5ov5QhTPHswMI
         jipTQ0LI2oHnn0nI2wBZFIvu2SOI8UJBTlDhp1dnS8FvB+AgAEaFRuhVszsA3zjw3Uwm
         8yO+oK0vQfj9pqHFljH4wEHofgQV9u0jRqDP+e7FNieJeZXGnOGBRs5JPKgBhYbKjsJ1
         1oAfGGaxdQxW8ZfxxjWAfpSNSdc0M9m9VsgqNs8hjN3RbtUj0soK/APvHI7KVB1nMW+N
         L2mQ==
X-Gm-Message-State: APuU4Z97E5ZJNYMSBJXXQeSpJL2TQiUSBKj6dwubnQ0WycLg4f5XHAHv
	CRjY+v8m/zxwsGVCUPEw2V6hHMXuEh2xkPh9NYWsFeVuWKsQY9BVoyBw
X-Gm-Gg: AYBFou3agOiGDtCJ97eq3pajSaICAGtekcToNjY3d2h55i+os8V9gdspNgjAn5sfNp+
	wKuJwX6WJALFZW9b0R2NPNKhZX0HM1tj3ySa40L5UlSY42JHM60uJnJeABC2dzvGXtdZ5wHBW4T
	McyxLmrWU+pbpcO2/WOMJTbqJobUDlc5rakY7/fr5GeAXmiFwmG8t2EL/YdHbMAvoxDjDsCcb2l
	f5T5absMjKbzZc45lkEZFU4mSgKbDqeXrcZ/bcBuz0O+Yy962K74Ng0wLND/HDtT+BvLl0X7E2+
	5x2xj5KV4IVTAMFicxI17ES2NY/jFJvwdhb58E+whctq2FRnsD46mPgraER/ulIEXjJte6b8zzh
	53O3QIH9jzNvLo2h8P4vZPxvXFOCfd2xwA+z944cEQ+1TzbBm5LCu2YpWrwWVPY4ys+/4f5ORXa
	j1BmFQKe6SWZheafCoBXV+RM09NMv2lTT3aTwgymuyn6JaJDtticm0Rb8bpf0bM0+hjLFR3wX7k
	4J5Q8fz8EQemXjjSR50QwQJjnoU2ACwlzDuRS9jrcunsNitiNsbkfaZt78Xd9EiQtiB9KO2aQpI
	2cgyvKPNfSGKV7GZbIbMIg==
X-Received: by 2002:a05:600c:3491:b0:4ba:761:97a1 with SMTP id 5b1f17b1804b1-4ba093aa693mr118356885e9.14.1794499512628;
        Thu, 12 Nov 2026 08:05:12 -0800 (PST)
Received: from sd-lap ([212.104.214.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm88361955e9.10.2026.11.12.08.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:05:12 -0800 (PST)
From: Shady Abu-Hussein <shady.abh@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shady Abu-Hussein <shady.abh@gmail.com>
Subject: [PATCH v3] hwmon: (dell-smm) Add Dell Pro Precision 7 16 PW716260 to fan control whitelist
Date: Thu, 12 Nov 2026 16:04:47 +0000
Message-ID: <20261112160447.136279-1-shady.abh@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111172707.84072-1-shady.abh@gmail.com>
References: <20261111172707.84072-1-shady.abh@gmail.com>
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

On the Dell Pro Precision 7 16 PW716260 the firmware fan control
cannot be overridden using the default SMM method, writes to pwmX
are ignored and pwmX_enable returns -EINVAL. The firmware AC fan
policy also requests speeds below the minimum sustainable speed of
the fans, so one fan repeatedly stops and restarts every few
seconds at low load.

Add the machine to the fan control whitelist using the
I8K_FAN_30A3_31A3 SMM codes. With this, writing 1 to pwm1_enable
disables automatic fan control, the fans follow the requested
state (0: off, 1: ~2500 RPM, 2: ~3950 RPM), and writing 2 to
pwm1_enable restores automatic fan control.

Tested on BIOS 1.5.0 with kernel 7.2.15.

Signed-off-by: Shady Abu-Hussein <shady.abh@gmail.com>
---
v2: Use real name in Signed-off-by instead of a handle, per review
v3: No code change; adding this changelog, which v2 was missing

 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 5ec487843..250d8c1e6 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1687,6 +1687,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident = "Dell Pro Precision 7 16 PW716260",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell Pro Precision 7 16 PW716260"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{ }
 };
 
-- 
2.56.0

