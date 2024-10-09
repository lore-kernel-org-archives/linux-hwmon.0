Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50C0183CC5
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Oct 2024 20:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728504142; cv=none; b=suhe45D45F2nYXZ4bbi3ng9idBamBD1qE3cDB4HfCH6xucEl/N28t0YBZRl8rtdcjlIwjiJP547s2weM0p8a03Rysb1REtWcIirnksxzVg5tGuwVg4Bcp1k4/wx9VJosVkgbnV4F8rCPx7Hqy7CvBx7L7ffUhOcJRLeM+Nuf5/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728504142; c=relaxed/simple;
	bh=x/Ou+XFddJO1lFDbG4ZZDJdZ1c4twwfeLGIWaZROXbA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=kDXCjl7/ldBYk8G+XMETZ1yddAjIa8IPMOiKDkY0o7JSkKTBZ0AOOMcsywvNXHhMbGItfStD8Xpf6+/1stCQ49dcogIXDEvzKyz0na3gxYjcBcK9QQAawWRNGu5tJ3cYMSFZA86jLw5V9ENdcxINOsU2upndk4twT1IV+AaPego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P17Lhvcy; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P17Lhvcy"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a993302fa02so31521966b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Oct 2024 13:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728504139; x=1729108939; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vmjfhu8rgH390NbPUQcSwNodTpch+cQzDRf14bb6zeQ=;
        b=P17Lhvcy/Y5/f5n7t2o5ET4vSsNPOZpARXQyukqLX4W+qOOfTGAELPKm/vsEgyDCK+
         vrhKNKLnFtoTD939YacYFSESZ0X08LU54xlYe1smBJAWdFNNggoVJ+Z3VOQgRrPlKwqa
         uU43cpYLKcr9zs57zG9StRD67W55p+72FTSiY/a/AZ4xsJ+lHMv2WXvlrbIDSk6Iq4ti
         P8stTmFbaNmRJnX24v7uHIRNzK2D7v3OxLzyS7C4bQjlPSfDRcOVRJBVttCGl/BlbwWv
         xvxFmvPSouTpDMLkHbSbeYfM0l6tnvc0dJd1OPU5lrnuDaVU7pM2tXx0jOOPPCkqWjt7
         YtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728504139; x=1729108939;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vmjfhu8rgH390NbPUQcSwNodTpch+cQzDRf14bb6zeQ=;
        b=n+L7Ra0Pg2I3GlTi5ifbogjmUK2l3QsZp2nPNUGiBEaF9YpiXF7BsDAu+3yF/BSS07
         foSxNt94HEYRXc1LBqqYkpudh8XRIJ21vjoEWBRmhuscXngZ50/pK4f691R8bxupC0jw
         urLOdRmi0Wu7gxKLOPNLBwhdofL6AtC5Tu71Nr8xqQ1jPG350zTrBZ3UBTffplIt+XPj
         OBQM8/ASA1wSplD5RpBgzCkdcOC4GpngsMUR2pgW+RRbJC/lV1Rn8iK6ydbNMK5sn2vp
         pAN8aKMpKeG4UYJaMrFqATCd0OMBYxWRsliMZF5hRBTV+OILL9EzfdbFOhKdrhtmFaAE
         s8aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzno7zsKsD2OLW+1/T9cBWa5R7L0n2p/S+aNervu+s2CBDoeGVOWStB1kHDJlGWh9zcCd5WU7+15DZIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSNr/6nBRDidqV7qVeXjyMfpjlRKAc1HnKggS9lNisMsV75MhK
	O/lMkjZpHKBfWnyhMOKglW2UetmkHPeSy9rFyUXwFoKXhJJZW7iA
X-Google-Smtp-Source: AGHT+IGuSigFiXRDukGYMxhE9xOCL6LlE7ZvgsQ4m6sKYJOHRWtXcHWnQ+gsBgaJ9OzsOqOydREX7g==
X-Received: by 2002:a17:907:c7e1:b0:a99:4261:e9f7 with SMTP id a640c23a62f3a-a998d25a375mr347553866b.39.1728504138856;
        Wed, 09 Oct 2024 13:02:18 -0700 (PDT)
Received: from ?IPV6:2a02:3100:b338:6300:ac71:eea5:34f6:504b? (dynamic-2a02-3100-b338-6300-ac71-eea5-34f6-504b.310.pool.telefonica.de. [2a02:3100:b338:6300:ac71:eea5:34f6:504b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a992e78498fsm701977966b.107.2024.10.09.13.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 13:02:18 -0700 (PDT)
Message-ID: <3aecbfc5-e11b-4425-9c6b-88dac2d32945@gmail.com>
Date: Wed, 9 Oct 2024 22:02:17 +0200
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
 linux-rpi-kernel@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/9] hwmon: Add and use helper hwmon_visible_0444
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Several drivers simply return 0444 in their is_visible callback.
Add a helper in hwmon core for this use case to avoid code duplication.

There are more drivers outside drivers/hwmon which would benefit
from this helper as well.

Heiner Kallweit (9):
  hwmon: Add helper hwmon_visible_0444
  hwmon: i5500_temp: Use new helper hwmon_visible_0444
  hwmon: surface_fan: Use new helper hwmon_visible_0444
  hwmon: sl28cpld: Use new helper hwmon_visible_0444
  hwmon: gsc: Use new helper hwmon_visible_0444
  hwmon: powerz: Use new helper hwmon_visible_0444
  hwmon: raspberrypi: Use new helper hwmon_visible_0444
  hwmon: intel-m10-bmc: Use new helper hwmon_visible_0444
  hwmon: nzxt-kraken2: Use new helper hwmon_visible_0444

 drivers/hwmon/gsc-hwmon.c           |  9 +--------
 drivers/hwmon/hwmon.c               |  7 +++++++
 drivers/hwmon/i5500_temp.c          |  8 +-------
 drivers/hwmon/intel-m10-bmc-hwmon.c |  9 +--------
 drivers/hwmon/nzxt-kraken2.c        |  9 +--------
 drivers/hwmon/powerz.c              |  8 +-------
 drivers/hwmon/raspberrypi-hwmon.c   |  8 +-------
 drivers/hwmon/sl28cpld-hwmon.c      |  9 +--------
 drivers/hwmon/surface_fan.c         | 10 +---------
 include/linux/hwmon.h               |  2 ++
 10 files changed, 17 insertions(+), 62 deletions(-)

-- 
2.47.0

