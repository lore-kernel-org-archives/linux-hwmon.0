Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C03335BBB
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868453; cv=none; b=MK7FZUCmlO+GPZSK74C9690sIh+sZjD7hVFOG0Roo2b/YlCk72VAo/AQcJ037wfXJx03HiYRcxV2i48qA4S/xi7pgDEbWKz5mec8zcxiExd14lFloO3zKpcjGmPGC4MW5WCL1wKY7oLmnl7/T5WKDGq2SUcPgTSwm1H/r9Wxt5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868453; c=relaxed/simple;
	bh=GDxdmW8RZ/iY3x22Q86+ssZ1qzJT5cv1qR6dpAWnqDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VJDngdD8p0EOcn3gKHhXP0gXgtPBZY/tm4Zu/syBNGLbAS9Elz22DhaLZYE0k7ru0uGapqSjtXGR4BbMDplCAPjfdBD4Yl7M9wnmhfkeOYx+03BTM6wWO6K6ERSITsjnvFoNuL0SY5ccepvFLYp6hI0og9iz0UhxY9JM0Gg3fEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gueeHjp2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gueeHjp2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso21837195e9.3
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783868451; x=1784473251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDr8ZoaZhrb9Ys7jyYL3jiIQQw2BeBzMS+/CedSFVMM=;
        b=gueeHjp2qnOQqCgN56gdIMPDvJdVDV98KoZYtjyNvkis2x/8/mYZ2Y4b+X/0LUUQ3A
         huf1l/id7REvp3N/rUMNEP8ESZme3G9PWohVsFJqLlpXG1JOZwIRkqEGy5S5mwxhMTeK
         6HPWHlAgSkIoXnQZHxFoy/nPxQD4haf5KHnJhtRUdv1uFkV3iQdyLWGoMWBOYBVsnHQt
         XQbckPItH5OnmV1nSm6IUeYkzj5/lvI2n6vzidVkT0eouzZN7M41xRZzGZruNScoRQ7l
         1pL3ftHHTiuEr3+UKN/zzMuZXqk401+wSzuYbvygKL47mPFgSBNrR2iC8Lgis0yoVhZQ
         tKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783868451; x=1784473251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDr8ZoaZhrb9Ys7jyYL3jiIQQw2BeBzMS+/CedSFVMM=;
        b=HuOTof6acZJ4I662mRPEnxxPYdl20ztuBJFmcXN7QIFozudueOSbq+Oc5uJjwd2wep
         /fsv5fBaWvUCqvO73LHbB8NxqEOFtx/UQNCSBFzRiiMpo0uB+8KdDzFneI3L2Uvffjy8
         Ip3Z+P+TLPvdMICrrOCf34VLpym8GyBRt6/EmnScHYhBUAPGOAmKQST3iy82WlW+YAV7
         Rs48FGUYIf6gQx7zLVwJacPuEYvPlvw5zEk6dx336YYCKYgI4F3gRNA+mb2rquJWcwdq
         nteIDbZUIPZdUbyQC5lufl4hi+LyusTKXYO6NpU+8cBFcwOCF0YTiNIB5VF2WCaGLl2G
         YdvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4bvDPNr/X8Xr4gDRbXThGv4zs7WxY3IDoJgdJa/spcs2wXACYm4eLScBZq4qP5Ye8TEokIpYfrqDalA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgMoi5k9Qx9MjTsie2vuXfJg98jK4xFkrHk/vWKTUCy72QVTTz
	4M69pmFiyS7q2h/nO2qQb0ckhL5650o99xraDDnfw+OMd3wF+r0gTYiv
X-Gm-Gg: AfdE7ckIqUBZW/kzab693RDMeUv4K1pCDN8cFFuH8ztIwyGfvTt8Z4Fc14MVCrj72PJ
	UxnYvPexUUjdP+spdXsjDPY0PFr7Fv1+H6kdQ8FltH/BJkBTDMdGKFTGlht4oe8LxsxROjE3QEB
	RW9PP2EgcYSKAHa/nbgB+jN0djoN9Gh6YTll0KvfOgBlPMs19Dr7saWhbWV1C9lucOTUQNLdj5N
	5yc0cfEcJe76wu/N8/xBeVRy/9gVDbgFHcp15dSn4L0szyqIjmvsb1svpUglVzo2SZ63xdb787H
	ejN+zp+3IdBj7ffJc9OSMandJr7WSshM1ZXnCVTotSABczox4DYr+jquqP4QGRWx/SlZuaOG7mu
	Vyhi+1fK+ejWPYFuJampBqOl7sDLVR76nmWhsDvOeMN8zImC3KLMpghs+RzSvQ35uueqIdTaUSe
	QdOoaawhsfubssAZR2xVr5Z7q2
X-Received: by 2002:a05:600c:8b72:b0:494:df:8895 with SMTP id 5b1f17b1804b1-49400df89a3mr14702555e9.24.1783868450685;
        Sun, 12 Jul 2026 08:00:50 -0700 (PDT)
Received: from puma.museclub.art ([94.31.117.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6e0e5asm296017845e9.9.2026.07.12.08.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:00:50 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 0/1] hwmon: (asus-ec-sensors) add missed handle for ENOMEM
Date: Sun, 12 Jul 2026 15:05:04 +0200
Message-ID: <20260712130602.1256700-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3: fix formatting

v2: fix silly mistake when 0 would be returned from the setup function
in case of error in asus_ec_hwmon_add_chan_info(), making the module
load in partially initialized state.

Eugene Shalygin (1):
  hwmon: (asus-ec-sensors) add missed handle for ENOMEM

 drivers/hwmon/asus-ec-sensors.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.55.0

