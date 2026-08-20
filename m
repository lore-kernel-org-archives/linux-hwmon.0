Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED7A446827
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231408; cv=none; b=A3xxMuDsUl/vQPlL34+kGTY3PRwVFr9uwqeeH0vMTNnSTqQ25lr52n9sDL1bMptI751IjUYLGBhwBSpzvT0DRYmc3jroaH2GADoEsillh3czdL7x5fvVEvsFymwvufSROsgeksxYbVWnZva3jU+uamRZJeiq1iUcaXmxZ+IbvnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231408; c=relaxed/simple;
	bh=PyPQPdKz3OhtBacfFMsQhP2CFNLVRj0RxGqo4UtPA4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBw03D+6wPyfkILavtznefifEnXkYhT2jSsKc8xjt7duSdnLkDi20zx5qoGVv28Ck8e1Xhjyi8jPF2nqdLGR2kIKVdyxk2tszdTtfq3kQSfw2eAmIQSA0hOkzhqylShv7TtHBrYwCA0tMlFgkGisluoJwyFt5ml3QoU+rMkXRPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MeYHWaM7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tV7yuM/T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MeYHWaM7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tV7yuM/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787231404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YiRPmyoOxA/J2diOjaCkkj9Ix5C+gpQyyXhZIIsszc=;
	b=MeYHWaM7Zh58y1LBwYKLC+GKlwlb07P271xZwBnYWwgHZogY1vFzCsGZ7i0S3IBQxBvpbo
	UsMMJIAlghX/TXF9/t1jXZBqrYO7ybHRgnERq+oqC75A9qw9FL3I2rvyHFU6REzwhc4L19
	nhdhEX0HAkpC3A6GaLK9P2aJUEFVYI0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-TNABjefXPx-7WmzjgiKk9g-1; Thu, 20 Aug 2026 09:10:01 -0400
X-MC-Unique: TNABjefXPx-7WmzjgiKk9g-1
X-Mimecast-MFC-AGG-ID: TNABjefXPx-7WmzjgiKk9g_1787231400
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936cadb0e8bso189356085a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787231400; x=1787836200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YiRPmyoOxA/J2diOjaCkkj9Ix5C+gpQyyXhZIIsszc=;
        b=tV7yuM/TAK27RgmehL7sF3jOK7nFx4fNSGdpoumjOoWDhEF5R2lnG8F1t3is2akJIe
         30m5nT3RPI48ypKj0/zHHuFkrsg+7XY3rfaLT3PaST9OENLyYGhAKbi/Qr0RtzvWGEIH
         kJ4TNBjXZB2XiwBlICJqMjOynY6oMm5zp1QTzDuK5BxPATXPWKNgq0E9cfx8ecjkH2ep
         24X9EYDM044t14guCOHN6tcNDhqIiht6S9WD6bEz++34Q7hqH7CqjZL5LacKfavSfEKa
         Ry7BK8ef51hdc0MmLXPFb/Lpgp2OAx8u4Uwm7CjVLQtr/glt5ecSxZu/wa59PL9clDI5
         PIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787231400; x=1787836200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YiRPmyoOxA/J2diOjaCkkj9Ix5C+gpQyyXhZIIsszc=;
        b=sBAsJHag9pH3XwdwKzzp477vQLluHj+5XrTh9Nb/Zy/ij6TCk8Z+9eXUkejCosXzP6
         g5whHUTnuZbJUB1GOLx14xVKo3QD5fAnpoJUacnbEGQER40jb7uLr2iFJ2b+9nmHOfIC
         nwWakWp5uF/9AsrGPl4oAHoKO/Nj0Fb/q0f9iXF8mDl42tv4NDzua6PwVovu6saVdajt
         lGwrbwy7uAdnkR7OHRnB5ztamOfDRmOy4/37uHVExZw+lgEkEKoQAP49ssBZNue09GKC
         s/S43UOAjGHCjdE3rOKl5lmxtdeXxm/HbBWk57Ju1bcCDBrvt9tcOS0znJeO4Yi+5/JI
         Vj6Q==
X-Gm-Message-State: AOJu0YzY7uHC0JpxU/OtznUOBEgRCkxlp3pAU/0SfvVpeJxy53cSzHTP
	vv8amtJT5//Gomzh+BQ9/ADRXKcoyU9BswoBHe8QKgcs8StmYHGw75/4OfyGLTtiaglPsMwx7iv
	6dc05JOHbsY54uV/kDrCKEQ5jy1sGsC2n7JhtzKAxv27Cd8RYxRIWbxVsexLDD6N6
X-Gm-Gg: AR+sD11Ik2beJ5P1ASQ1L+d+02aLmZVin8XcgNhS0sF3BkbVpYgX0wfiaDgWZTnchto
	fVGaEZ0Me2y1h+o7Ime9GI44gBbj9JJgBV9CBL47JNQM46vC4q8Gz74QpubSEpH24/uRBeoFpYv
	kGkuDhT9OZe0NRSS5ne7uqlwNmznVJRyg28eZsmAYUlwW1WYRLUcNM8oAc3MuT5FWfR4D3VFZZg
	hxWMsUtem2v2/nJIeh42j2+4ZWCvg5yYKsY8GIAd0cVYaiXFt5JBq9eIdSz2IRoidXbQ16bwcgW
	/VTHnT61WV619AEfU7DVleRC2iplUKNstFETgCcpfLTMQdj8PDwlGm2vVLxHiLufq6lVZzTrBp6
	ggwSNycFv9p63q6/YJVRpprFd8dOfbH/Z
X-Received: by 2002:a05:620a:2904:b0:930:a38d:4030 with SMTP id af79cd13be357-9371e6acac8mr1072775185a.29.1787231400376;
        Thu, 20 Aug 2026 06:10:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2904:b0:930:a38d:4030 with SMTP id af79cd13be357-9371e6acac8mr1072765685a.29.1787231399799;
        Thu, 20 Aug 2026 06:09:59 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937204ba087sm364217985a.21.2026.08.20.06.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:09:59 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Date: Thu, 20 Aug 2026 06:09:21 -0700
Subject: [PATCH v2 1/4] hwmon: (ina2xx) Acquire hwmon_lock in
 shunt_resistor_show()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-1-fdce35abc41e@redhat.com>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
In-Reply-To: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Lothar Felten <lothar.felten@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jared Kangas <jkangas@redhat.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787231395; l=1190;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=PyPQPdKz3OhtBacfFMsQhP2CFNLVRj0RxGqo4UtPA4I=;
 b=epfLXpF0ZX49t91Ptxb7Uy4m2e3YGQYhE6BToUiYbm6b4nTcH5esDz8oe1/1YDHG/9e5oCJL2
 sRhrSZx218/BkQDpObEAluokR6nk7xrMaBCUwTesE45eK6zy9rC+7DK
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

shunt_resistor_store() currently acquires hwmon_lock to set
data->rshunt, but the corresponding access in shunt_resistor_show() is
unprotected. Acquire the lock in shunt_resistor_show() as well to ensure
proper synchronization.

Fixes: 3ad867001c91 ("hwmon: (ina2xx) fix sysfs shunt resistor read access")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260729162836.89BDF1F00A3A@smtp.kernel.org/
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/hwmon/ina2xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index c4742e84b999d..f6c63ce1ef193 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -859,8 +859,12 @@ static ssize_t shunt_resistor_show(struct device *dev,
 				   struct device_attribute *da, char *buf)
 {
 	struct ina2xx_data *data = dev_get_drvdata(dev);
+	long rshunt;
 
-	return sysfs_emit(buf, "%li\n", data->rshunt);
+	scoped_guard(hwmon_lock, dev) {
+		rshunt = data->rshunt;
+	}
+	return sysfs_emit(buf, "%li\n", rshunt);
 }
 
 static ssize_t shunt_resistor_store(struct device *dev,

-- 
2.55.0

