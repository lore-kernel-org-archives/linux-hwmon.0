Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA68C19E998
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 19:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676421; cv=none; b=llvZ+49Hk+xkJiYDQGBxs7uUesJqTVD97ygDafbaS7lM7+s5vN07tATpyBwIhUVVY4O2nbtjOLj5AHQq6wxd4w7uUfZB1m+LpfrNPsgfqVBwOWwvRGZndwOa6awyCipASHNgJPSZolDUonLou57UFxs6KOS78YZKRTiVWuxhqw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676421; c=relaxed/simple;
	bh=BLXyKyJacZNfHaJ6s2f7T8r0SKZ2bLf3mJnh/eIcdNw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=eOqzZXRMbMuINhSnDAadVW118zZJsRq0+8+n7wFZI7slrPNDs4FgtplceATVI677iBaYsYlR5Y+quRJF2ZMnsz6OtAKFoGLMh9IefW6ZP8ZBa4t7uj3mQ19uYDjpzaZF7Rp05I71FDepV+cMnGZL5nmkU2rV2UPdoAmwds0DGks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV9kBh5y; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV9kBh5y"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a86e9db75b9so378557466b.1
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 12:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728676418; x=1729281218; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSrxk6syvqJOjUYFeoicxgMvFVA2Mvo+rgydypVfBBk=;
        b=nV9kBh5y5b3FDYpvWUN+8Q1shmLY8NBFa3vek2cw/HRSYAFHt8mxVtnr6PYPuBw2gm
         u1dKLe3a+QeT/oY3M48KcUkN36Z/YKWtA82wvmH03nHNUfEXioQyC6hKNgFo5dfaIQEf
         EuJvI5+YXiM4vb8MrHH5IWUiubWaF1HbtRYHdsvlQGm/g2IxXRSO92jhDvUZk9Y/TEC4
         Pgwhrj0RHEbXTXGe+GYVf8Q+IeXMWTalSyL9HVBgWpG1nB8Z3ug8LdaDjYum+ZqXhUZL
         HCUZmdfG3daMjLntH3oeDL/zRXzqKfHpCJdwe2EvwgpleOM4Ynzo3YJPEVVaarE42Li0
         zAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676418; x=1729281218;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hSrxk6syvqJOjUYFeoicxgMvFVA2Mvo+rgydypVfBBk=;
        b=s8kowat3/m4bL7E6QM0hzNcZjm9/WQc6Pvp25u2h95ugZKVuUF9nbFlRp0YPd21GFr
         tV6NPMrYdtJ3TdJRo4toS3W6vPbz5C5yeLhGsSesCtIPiCdqr7Ftaj+ZxKfScx7nFIFB
         KXXtjI14kjNiPq6uFA0JPrCGrycVp9F/dHrCQ6WrvLt57RqXmyMaAt1JHse1A1yjI2b1
         5oAEgmS31SPjsXJT1ZyvlLn8XjVxDWu1vyY/xa1lfQOIYu1+laE9ma3+3IQ/0fu+vup8
         vDGpPRcFfqihYk4FXNvplGi9FJFUIILTEv53ESB1Pk8WoyqagF/48/fkC9I/lp+quYZw
         dCyw==
X-Forwarded-Encrypted: i=1; AJvYcCVrlk+SJgmybXzthXn8ZHxQAaUyM9Dh9Q3STeMWHh/kdCrvIF0s1T7xglocPNK+3n5tX3FCoONijb/CsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdp6yoDqzPIAf795Qz5Fxx61RlsY5wq5uhCWgUo9ZmQrOrcpQ7
	1D3OvQKc4bAMTo82cpjj8cqsKvYvB87TWX3TYHrxaAeJYJcn9J8y
X-Google-Smtp-Source: AGHT+IEFNusIGh/+7ZpS5qaXRhD9Azk2eBadg2SYSNFb5MCyVXBFsGe5EvVMIK/fbSmzaQGBUawkcg==
X-Received: by 2002:a17:907:f19b:b0:a99:3f6e:2da1 with SMTP id a640c23a62f3a-a99b95652e0mr302595566b.38.1728676417879;
        Fri, 11 Oct 2024 12:53:37 -0700 (PDT)
Received: from ?IPV6:2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce? (dynamic-2a02-3100-afd7-9a00-94ac-542a-1cd2-c9ce.310.pool.telefonica.de. [2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a99a80dc617sm244735566b.152.2024.10.11.12.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 12:53:37 -0700 (PDT)
Message-ID: <6f43a3e1-3622-4595-a1ec-2b3ad94bdf5b@gmail.com>
Date: Fri, 11 Oct 2024 21:53:37 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tim Harvey <tharvey@gateworks.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Jonas Malaco <jonas@protocubo.io>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Michael Walle <mwalle@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 Ivor Wanders <ivor@iwanders.net>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-rpi-kernel@lists.infradead.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/8] hwmon: Use new member visible in struct hwmon_ops to
 simplify drivers
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is a follow-up to 11fb69bb15c1 ("hwmon: Add static visibility member
to struct hwmon_ops") and makes use of the new struct hwmon_ops member
to simplify a number of drivers.

Heiner Kallweit (8):
  hwmon: i5500_temp: Simplify specifying static visibility attribute
  hwmon: surface_fan: Simplify specifying static visibility attribute
  hwmon: sl28cpld: Simplify specifying static visibility attribute
  hwmon: gsc: Simplify specifying static visibility attribute
  hwmon: powerz: Simplify specifying static visibility attribute
  hwmon: raspberrypi: Simplify specifying static visibility attribute
  hwmon: intel-m10-bmc: Simplify specifying static visibility attribute
  hwmon: nzxt-kraken2: Simplify specifying static visibility attribute

 drivers/hwmon/gsc-hwmon.c           |  9 +--------
 drivers/hwmon/i5500_temp.c          |  8 +-------
 drivers/hwmon/intel-m10-bmc-hwmon.c |  9 +--------
 drivers/hwmon/nzxt-kraken2.c        |  9 +--------
 drivers/hwmon/powerz.c              |  8 +-------
 drivers/hwmon/raspberrypi-hwmon.c   |  8 +-------
 drivers/hwmon/sl28cpld-hwmon.c      |  9 +--------
 drivers/hwmon/surface_fan.c         | 10 +---------
 8 files changed, 8 insertions(+), 62 deletions(-)

-- 
2.47.0

