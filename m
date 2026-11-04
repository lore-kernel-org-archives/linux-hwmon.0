Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793833418;
	b=fpW4dXNUqRYiVCbZOrCBuYeWZ9LBYpj+ayuSE4SPhPbxZaza0J1Ysi2SgK0lEGENBAsZ
	 fdKKkozRL/h/tOTRAMryUlyRZ8wOuTYr3WM0gbfP7+de31yBfhWD1g4C16Ce7Vr1mnkI0
	 khRiKrNtUnrotnmj9/X+EBpD01/3CDnnauaHRlUwMEtKcPLctmu46u28HpTeur/fiPCDc
	 yy+vEn6ecHwJptO6RcDr950RItK0u5GPRi1InICtFMPeBsfkGM0k7hyEFr+jMM/C2KBct
	 85sjmjRac5sJ3L/V1ElnbAR4v4jdRTY10gdogrqfxVo4TWw2YKxsoFVfalTTDVTfytg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TASN3SRwvlxH6Ri9XmKZPLPt+xWrnD4iUlUH+1j2Dqc=;
	b=p1JiXzqx5+oEHGFZS8TM4aKRpwN5Mb75NzAv3PbVL/GaM0BqYhOQINU6oFFUKA6Ip8Uw
	 NHQAaaGETe04zKQwmtp3eQcRPUo9beB5KClqtAPR/CpbpJn90MUUpWgEr0dHVZWfaM9dc
	 AWglgsVV2cq2Kfj0hrvBMVyN0LvVdLr3oXT5fximvUQr/zeh+QwfyrvlF5B6avBCTOwBU
	 hOvZxXaKAIdQ1Gbvyv/vg7ub0oh855GVZFoxePXgXZ+LbrZbmlmVgOzpFq9N2DC7oDu12
	 brF0zxlMwZJKjjt8h448Paq4WwO1As1zc6DaK3lHJZ3MHpaNGzJvGzzfhPD55iggl+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j0m0znIs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FB4606EEB0
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 23:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50FB4606EEB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j0m0znIs
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-483a66818edso686853fac.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 15:03:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793833417; cv=none;
        d=google.com; s=arc-20260327;
        b=WMeYUbSJ6mg3fNiulinYQtjhlCMz5efwqGPX9LEVWeP4WIYHs/XOVxP950dEW0zybs
         z0BxWlSoU/5AOnIZ5/rfLTkJS+0kYlq6o2BEcYSPx1wWafg3fA3DT1al50D/4VA1yWHt
         wFYeM6Se7vnF34ccvxHzSlMNetcgrvUl/txIUt8Lh42eqwavEz6QS+L2PAKFM2Kq7dRi
         fvKZcmYTlqEEehHIDyKX4r/HbtMRlVaqV8mu9kFbRNsRO8eocHrhjqqENi1bvHO4jQH7
         ejzwD/Wqqc+t1Eel0Lz75s5SvTesiH66MA41nIHe77c0bqmYZphBFBWwBadGdGttCLcH
         FfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=TASN3SRwvlxH6Ri9XmKZPLPt+xWrnD4iUlUH+1j2Dqc=;
        fh=yNiwBQcIB5uupr2r1sAfgnZZ9FUxn8ir9SmPmYax5d0=;
        b=JuMcAmQBQ5owNfy7xjvfDn/z32l7Hz3GU9qvKVwn2JlZcOfAu/LfrJhSRbbX/vja6c
         dVlTyabBiMEWSftXTJB0b6hPFgQrgtRMpDwHX8Geg3N7TnBwiqDFCP+X5xmbl+m90vDp
         9o1ClLrBJbPt+xkMBqjDGSw1L6C78Vd0KZsu6RHbtJ5Z1xmLBP9616uW+cOy/Y6UNXdR
         sosOxT2FwrZYOVBx7Vn8T9546oOPQS2YNWPuNHTTfwsi5Q76tM4RzGPFTK/agI5gIhwo
         Kjknv31YtDPqfoetPD8ujFJp3nfJp6j/RIhEPLHXSH8r8eDRmQdfsO6V59IfXxm0Srhb
         P6+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833417; x=1794438217; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TASN3SRwvlxH6Ri9XmKZPLPt+xWrnD4iUlUH+1j2Dqc=;
        b=j0m0znIsup/qWIeqK4wvvhVN9ewaBu36TG4pQfrMscHx/qzUVos0TO4uX1F7xbjGml
         DOm4sASZXe/m3skCbRgVlUyXNWxBhsHV7hj/hywd8QR6CLOr3ynRwFv/fQ5IZZHXFI7I
         MJE2OhvBqiDzTqUOEozYfh0Z3qwg/D2ERD6oDj7IByy4bxmTtiNb/1eqvLKFHFqKZrWV
         OtYR5zrYLUM24OCkUR2vWBXOs4Y9N1MlEDPP8QzWHPu0euO/YCuyrFySDYop8X04DNXH
         iwmiAopm1uCyKBvyQRL2RKGkSPnAnv8UO5yc03V0eW7i3L9rFyJtvl6oEEnoB1h/AXgC
         GSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833417; x=1794438217;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TASN3SRwvlxH6Ri9XmKZPLPt+xWrnD4iUlUH+1j2Dqc=;
        b=FLSyaFwCeMifsE0RzZN6Pw5sccgK/7kNTIppKaJZJenw//bf3IjYiaebyoR76HdxhJ
         L96ISFGqPZcWe5hbhOt68YknzDs4xzItDUv0ewJoMc2zFWvwQkgaHipDXx3JvCCBx5nI
         RZsmIlDWvVlarCV/0YujTyR+93EUkHSqH8KsieVYNr2FjmADIAO9wbjBTqYs5QD4Yb9o
         iD0cv5AhcB6dS2t3VwBHx8N/RGeCvUpoKhbEOsCfwYKdcNq7pdlhCUoXn745qScrMZsZ
         YqksRUYF5gZZV4tNuef7WG1unsuv3YmtNtuBXtfKiEglSwBPIYszOitZxX61SvTnrGGg
         zkpQ==
X-Forwarded-Encrypted: i=1; AKwUvByuSXvGAyludggpJOEO82+nvLMBlzMrSi6bYVb4RTHhHxdxRxaYehdkoFPpVBhPwrskC7PFmFSU7TJijw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8qHOgclZdrfPPl5zMaA20rICdR/GhACCiYOTphoWZTzmhvmWsS
	GcCBE1m8tT8BWP9DOcj5DQMTYV8+fps94lopN021XqkZRNLFWqm4YHqV7EtNz+DNRR9ccr7SrwQ
	SkqTXHK7HH827bryERM2erOBythrfX5o=
X-Gm-Gg: AYBFou2wgVrYxPtrUCNqoigR8K73WEKCuRDjoTcV/1G95BBTUa933jgOzGrCjYTsCHr
	1DtrO4/7/ZyHBrBlI61HkktW2w7FImK5x9wtiZdXFuY/AC4UvncvwinY+HR/ZHjtSVzg5lijKlo
	wRx/c9LVTFlhsm7Thl3r6xqdJlR/unwtLCLjp5iPZeGzZbFZmwwTWUW0AigJyTrz0PJiZNpP2vK
	swdKbXOmZrpfvEyQ8xFHvUBL88nvrkxj2geM7B3v4XJFgFMi2mYltiNkdxp6Wgp0sZMORv+Akzf
	fCtlYbdaqSnlYcY70or8/EGqpiWJKTBxkbJlxvKeObHn4ACc/3cSBzygt63zpQqQ7eYEH0COG91
	cv3pJrqocrNB+m23gd/GNi6HYLovsX6x9YFQl0S9aoKCFgguQgQKI1ztictAyI4JBbCllCKk=
X-Received: by 2002:a05:6808:15a7:b0:4f4:4eef:52cc with SMTP id
 5614622812f47-5640de2513bmr12203189b6e.43.1793833417236; Wed, 04 Nov 2026
 15:03:37 -0800 (PST)
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 18:03:36 -0500
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 18:03:36 -0500
From: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
In-Reply-To: <20261105-kasync-devm-timer-1-kirtiar15502@gmail.com>
References: <20261105-kasync-devm-timer-1-kirtiar15502@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 4 Nov 2026 18:03:36 -0500
X-Gm-Features: AclHuK8_mptZYAXia0N85GcfAK4F984qFw3tZGgYmiv7d0zdmwUYqklPkOQLZe0
Message-ID: <CADZg-m3OJAhUi8EzBeMQbcKKVTkBBN70mnkGmJzkj2t54xFxDQ@mail.gmail.com>
Subject: [PATCH 2/2] hwmon: pwm-fan: use managed timer shutdown
To: Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Replace the private devres timer cleanup action with
devm_timer_autoshutdown(). Keep initialization and action registration at
their existing positions, preserving the cleanup order. The system
shutdown path continues to call timer_shutdown_sync() directly.

Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
---
 drivers/hwmon/pwm-fan.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 9cabbe9f8..6b02c2687 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -8,6 +8,7 @@
  */

 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/hwmon.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -493,13 +494,6 @@ static void pwm_fan_cleanup(void *__ctx)
 	}
 }

-static void pwm_fan_timer_cleanup(void *__ctx)
-{
-	struct pwm_fan_ctx *ctx = __ctx;
-
-	timer_shutdown_sync(&ctx->rpm_timer);
-}
-
 static int pwm_fan_probe(struct platform_device *pdev)
 {
 	struct thermal_cooling_device *cdev;
@@ -650,7 +644,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	}

 	if (ctx->tach_count > 0) {
-		ret = devm_add_action_or_reset(dev, pwm_fan_timer_cleanup, ctx);
+		ret = devm_timer_autoshutdown(dev, &ctx->rpm_timer);
 		if (ret)
 			return ret;

@@ -710,7 +704,7 @@ static void pwm_fan_shutdown(struct platform_device *pdev)
 {
 	struct pwm_fan_ctx *ctx = platform_get_drvdata(pdev);

-	pwm_fan_timer_cleanup(ctx);
+	timer_shutdown_sync(&ctx->rpm_timer);
 	pwm_fan_cleanup(ctx);
 }
