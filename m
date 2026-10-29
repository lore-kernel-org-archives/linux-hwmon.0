Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292021;
	b=qJD+Bx9F9R33HjwVACF2EhsvCpiiCP/OiDRHuhb5yhQQHJSHX7kFQrWQ0sWBPg4PwQaa
	 BQGVuetsy6THE5iKFN80EZcNOR2rEKF/4ovAh78D8qSv9ZpVNdCmP5tP5D5DZfThsVZS3
	 7qdn3eX6nDAkwnaI/GnLALagvxlo88hYkqtx//2Sr7QbKt9RzjEfHlJ5JYP0pmWVWStPt
	 1GHc6n/tpxnDKOgXNf/vdD4HnqCQhH+J41UMV73QtOE4hTMp6Jtr11bxAWV5MCC8wQvGC
	 glwLoxZlnDj5SHRKccw33SdjbpN3TJ/St+Gbs0eL8KuQwThsSWEeb7MpoELOtB/kNHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pjDdCQqNHPn33dj87Xo39AE3I9xvG8g94kQz8ZkP6kU=;
	b=gpNvJ625lwbyuzp+3zpOIa8fXGz1xcy9wGmFaIjv2FncU+HhfPQHuvxqk7+Lt+5ppYfW
	 WftCAotwFuD6435UYZ3wpFE6nNnb9+sxi4UTRU1IOTxgfpzI9zwOTj/Zxfn53tZCIgvmj
	 0TB9ODZFo61cFjgqQTmszUNwULbQMO8jWSMNidip0A5RGke33JhZ/blIsKV4GmHceKhzn
	 QWgBeZ2t4peFO3kYr8z2fAtBesWDxkIkSpvCSe3qblrfcm4cHl+CEiQ+QGgJkiPO0tAOr
	 z3WZ0aaxR3+JrGLMFu4K4jVPhm6CKW0lGdRj4KXOSrLzCT52u2YLOu4Jl6AG9StaIWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qe0b3MDi;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679F606A31D
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 16:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B679F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qe0b3MDi
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a1947498bso2451829eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 09:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793292020; x=1793896820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjDdCQqNHPn33dj87Xo39AE3I9xvG8g94kQz8ZkP6kU=;
        b=Qe0b3MDi/tSizz83JbR5cmk6cK0VVvyeSbaH2mTXFgOLuyafjkPrEFaXaiGRVbe2ZR
         ihVBvA9MJczZfgbdo0UFMxXG639WywfEiGo257QllLLD5M2o09H7zGR1W28QuoVri9t/
         teSQ/fMrLvcHECTOzFbPu5cXvqx/W1XcOYPAb0sJsn+iGxdAhYUvWRnhVaKH++Q6zgaD
         NkhkMAta0I+R342hcFGz/ApHqu63OS6PBLFI+glCfUnuqIDQKkPgYPT0Zlf9sGdngGlV
         HeR0SGvnxONujIBHKzh9tfiuLwOgpdV+GpgabkAAYJX4x5yWFLWtt6XEqxb/6ysxsYeV
         WP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292020; x=1793896820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjDdCQqNHPn33dj87Xo39AE3I9xvG8g94kQz8ZkP6kU=;
        b=L8A2yoI9658X7gG0dH42bN6L9uhnDuqZ4wnAjyJlYXTyTZ/gsviA0Oq7yzGmglV7p4
         QdRFE1WUmqV9WyVTpjg911CQvcUoGPdeoFb74PmEe2km0yCsrDNuLyTCbkKhaBFW3CmX
         Aaaxd2LWoSRbygDYzn2H/TLyvYH1onGUh5Pjk4qFsWWjleu5MhHv4LbSt9GUGlgYOzuo
         LSfKttrctqh6AIZ8Ibc+8n352wvjhTg/3b3RQ4Z+gcPLVDtIX/A7b5nzkb1OkOm7iXyl
         i8ZaRNQOvL2d0wKQIwB8YbfawUIIwStdVumvt9Q/bnKeEW9s1SPkoitiD/cGNOpowuJ7
         CFGw==
X-Gm-Message-State: AFq9FYJxzwASMK/bEr3raGqw5uY4tyS7MwKFVHZ+Wb3QNHpgbIY2bYRV
	VPjPIQljZcJlq+OqLkZ4tOHdqpnSVkkXOiYMDz+bmGScT7FJFphvxFd5
X-Gm-Gg: AYBFou2gHe92BjBLvzSFE0XGTCdSXeykrwFMPly7aZiSA8sOcaut/yYMAi4J2nbRMnE
	JEAUfoQA7Se8YOKdWlUJLy29zX3nP85embhrs2xHFKP8yRmwK/MJCripcLaEyhG0AYWweRYIjQn
	/2FYFs6DPPysTfWL32h2vpGHmOG1lFvvlmCzLeNYklfyGg0LBMZGWMnSA+Cnb5z3hZQzaSOJmXr
	3kKGRqYOJC89BV1o/Tif4aJ7klnv0yWbD/u1gk7bqOWdM/RWNknUaxCDlwOGIzHrQ9kw62fHtUV
	d9vet1rgCWbORV7F3ZiFPqc3nVcicSvRn1u/WPBATul1sWRgf0surSGJQ/AAFFKlvoXE5ie24St
	/BjjF2BfrTKyD+ft4S0KrTMkl/byf1MMF+5o7dByeRNV7wn3AqWFd1m1W0LYLX0Y3vaF7Ek6AGi
	aPOPzMr/Mte/l2X4ucaD+8B4Q97hXzENvNgshnXnHmoECRGhnnBfOl7+3wl311bfNYz6tm1fmtX
	ikHqVISQsYzuzHqqFjpyv3YmHnBajxD32He57RIf1m4nuPeYwtHeJqifXVq8InVEISKDJi9XNpz
	M5u8NcVvJ2cIWRVA2x1HAMJ4o2jaYU49Q/tySYCO49tRsqc=
X-Received: by 2002:a05:7301:b95:b0:36a:22df:412d with SMTP id 5a478bee46e88-36a22df43e1mr7578245eec.39.1793292019481;
        Thu, 29 Oct 2026 09:40:19 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a410faa87sm264319eec.26.2026.10.29.09.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:40:19 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] hwmon: (lm87) Handle I2C read and write errors
Date: Fri, 30 Oct 2026 01:40:13 +0900
Message-ID: <20261029164016.338450-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <74e00272-306d-4d83-b6f6-10059ad3a91f@roeck-us.net>
References: <74e00272-306d-4d83-b6f6-10059ad3a91f@roeck-us.net>
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

The LM87 driver does not check I2C transfer results in its sysfs stores,
sensor cache refresh, and device setup. As a result, failed writes can
be reported as successful and failed reads can be used as sensor data.

This series propagates transfer errors to sysfs and probe callers.
Cached settings change only after successful writes; a failed cache
refresh is retried, with alarms already read retained for the retry.

Under ARM64 QEMU/KVM, 46 emulated SMBus scenarios passed for LM87 and
ADM1024. The earlier aout_output regression suite passed all 118 checks.

Baek Kyu, Kim (3):
  hwmon: (lm87) Propagate sysfs write errors
  hwmon: (lm87) Propagate cached sensor read errors
  hwmon: (lm87) Check I2C errors during detection and setup

 drivers/hwmon/lm87.c | 384 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 284 insertions(+), 100 deletions(-)

---
Changes in v2:
  - Address the other unchecked I2C writes and reads noted in the v1
    review, beyond the original aout_output store.
  - Group the changes into sysfs writes, cache refresh, and device
    setup instead of fixing one call site per patch.
  - Preserve alarms if a cache refresh fails after an alarm read.

Link to v1: https://lore.kernel.org/linux-hwmon/20261025150800.49041-1-pocj8ur4in@gmail.com/

-- 
2.55.0
