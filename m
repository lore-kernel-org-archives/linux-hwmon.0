Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B597552FE5B
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 11:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866749; cv=none; b=WGOPBK6xsdTSkkX4aKgmkO8+qmdTgT9XI2u4q6XTbiXi3Cn2qex5PZ5lmcpfvaLkDbCDVSa6HvTOw4eee+Wnvtoi6KQBmd25fB0kD5Uej2bex/SaR+qJzlfn0/4HkUChXK1y2uy43/jGyAuq8LHRpX6PW1y3jTWXvSdyO/euQHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866749; c=relaxed/simple;
	bh=CUx/s8hkg1gVyDlADAlhix/90G2SI1ctPJAfGNp8Uvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GAviBMd8HwQLqsPIST6LkhIPIybhS66nnaxDG9P0VhB1L8u+3rxevF5jj7vgDd1npSS+fxPKIb4F82nCQyVeeJip1oIPMsQTj7EbzPfRHZ/veTcrhiKHPQo/0/2ekrdTtZs0piE3K9IAeZ64c+s4AN+TfwkSLPU6c3SoTOmitvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQIGntLt; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQIGntLt"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-485850cf499so2959985f8f.3
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 04:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788866735; x=1789471535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcAHB+OJRZkyP7xzcrkeaf+wc3ImZ+o7m7YDDFY62Nc=;
        b=GQIGntLtSLEKLRXy2Pa+k+XvVxvnbPiZOnDz8DjIoahoJ3DkanFdU0EafWHuivnWZj
         PtDT2m9hoFfXVhbGeKxdPvkx0yzh5SowaqKwu3DBQURSTfkRuDxu97h4Cw3OOBsRiben
         L/p06wixbgDezgFeN7WurKPaCXL6FWMxvr8oqaFz2+DFAW81KZGP5Ozhy3ktkiLpjwmp
         PvWs1gwvEE9mbs+hpqBvuDszb+up9XE1dV8vYuzQcwR68uDoGmxIJHxpB5AvlcESoGPW
         bVlB9sskVoll9ZWndZTBKlXrpFS1m1tlqEN7flKSvO7F+0qqd3v0fWfWlvxBXmR5NS47
         dUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788866735; x=1789471535;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcAHB+OJRZkyP7xzcrkeaf+wc3ImZ+o7m7YDDFY62Nc=;
        b=Y9bgo5dj3ssXumdAQZZ71eZ0GbZ15ypb5qdN1BjeQs54xJl/HetL4pCkcH8Gx+6Abf
         OCQ/m2hSwT1Td9SivbGSBDGQ6JNZC229nXQ0RfBbyk3cjcf2FigJjTTDgYmlUfdf+kv8
         CMRGzkxClzisQWPzEH8AWIh3Icd+k3FwWlwUoo+570r4DGRZqxs9BLGxvqWAuoiliRCv
         6hiArpKL3QRBZN5G18KGn63kFSF0AFyd9PWUIW8PMDygyQkC12zxB5dmMVGZZ9hgs9p0
         WR9ancSj1rMhJez+p8Dv5ysAQlCndIeUjXxa5SeJ+RsNN6vQMSiL1FMuWH8rWT4cdfHd
         dOgw==
X-Forwarded-Encrypted: i=1; AKwUvBzIrtwQGOdXce1TLy0jxn2Y3hZvEJy3C0ctfZDcbRL3SL+iyOo3Ww92Mt/DjgYGmXbJb67V1Soo0wfACQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mxKNkFXsZJQcojYUKSBqy2YZnit9WwXmX/9JiqIv9wja0ndnOL
	LShdwYUpkMRabgjqa8vARJquoj1GKlzCEc58LEwdmD6eX7HCqTCqweTC
X-Gm-Gg: AYBFou0LVdBIpHVYbcpSPn2GLZReMcGJHOppYMCetN6QGVoxiXhzyjYyj//m2dwnV87
	bVnO2Wn7DBvctojsBhzSiuCuLVLul+PB8wlkTSQYm4NLTD1svUeKGrZOGO3bqRJuzM2KwITunvw
	sZIU6f1H/A3GjrrZIrfFlBrOsuICNYBTW3RBqFEVpz2ABPpMuyjFPXAKCWoHtMaSSl9UGOQ4j7R
	CgCtlzuSd7i6Tv8PlqRPBvqt7YmxmUdnd0e9S64W2H82tJpJKAUC+uCIBk3hXFmctvi0LGpuAEa
	bDtsWAgsP3QTPoCIOqjesWzA2D8Ai38NuhVEAwWhlvB2s4nDDQ69RWSYoQrHIIvE2DbxiaTJk5n
	2DBgw/9g1sPki/67Ay+NGvQ2SJClURxm08mvi7lMkwIvIA13y8lG+ldaG9NjfQSjpp4Y4AkIY5B
	oqETThtSg2yI8ZyQbW+uOHYuLzqavDayGqw27FRr3ohgl+B+Nz/vuqMZRv0EgScoOCgLX9lAe/d
	Zm/EdrrCjuZhLF2WZ+UyQCyHTgduqu9Adcqp3OUCvwQ
X-Received: by 2002:a05:600c:1f93:b0:49c:ffa2:1f3d with SMTP id 5b1f17b1804b1-49d0e0f55e5mr129231345e9.30.1788866734852;
        Tue, 08 Sep 2026 04:25:34 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cff8195ffsm333745345e9.14.2026.09.08.04.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:25:33 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: sashiko-bot@kernel.org,
	linux-hwmon@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver
Date: Tue,  8 Sep 2026 13:25:20 +0200
Message-ID: <178886672019.44198.13162841201550866016@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908092805.E15781F00A3F@smtp.kernel.org>
References: <20260908092805.E15781F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Sep 08, 2026 at 09:28:05AM +0000, sashiko-bot@kernel.org wrote:
> - [Low] Missing dependency on CONFIG_INPUT in Kconfig.

Correct, thanks. The driver calls devm_input_allocate_device() and
input_register_device() unconditionally, so EC_LENOVO_YOGA_SLIM7X_GEN11=y
with INPUT=m would fail to link. I will add "depends on INPUT" in v2, which
is also what EC_ACER_ASPIRE1, EC_LENOVO_THINKPAD_T14S and EC_HUAWEI_GAOKUN
declare.

> - [Medium] Hardware monitoring device registered directly from a platform
>   driver outside of drivers/hwmon/.

I would prefer to keep this as it is, unless the hwmon maintainer disagrees.

The auxiliary device guidance in Documentation/hwmon/submitting-patches.rst
is aimed at chips whose hardware monitoring is a distinct sub-function
substantial enough to warrant its own driver. The embedded controller
drivers under drivers/platform/arm64/ register their hwmon device inline
instead, because the monitoring is a handful of registers reached over the
same I2C mailbox the rest of the driver already owns.

The closest precedent is huawei-gaokun-ec.c, in this same directory, which
does exactly this:

  ec->hwmon_dev = devm_hwmon_device_register_with_info(dev, "gaokun_ec_hwmon",
						       ec, &gaokun_ec_hwmon_chip_info,
						       NULL);

with "depends on HWMON" in its Kconfig entry.

Splitting five thermistors, four cell voltages and one tachometer into an
auxiliary device would add an auxiliary bus, a second driver and a
shared-state accessor for readings that are one I2C transaction each. The
cell voltages in particular have to take the same lock as the rest of the
driver: they live in a banked mailbox shared with other EC activity, are
validated against a signature and retried, and are cached so that all four
channels come from one coherent sample.

Guenter, if you would rather see the auxiliary split, please say so and I
will rework it.

Thanks,
Oleg
