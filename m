Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1AA314A60
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 04:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778820491; cv=none; b=gleBKW/Hs8hqFU/FUf0rWzueW79Jvz/RTP7kAZoRXw9+KmvIbrjRtmBXDu6hAlhhZ7e9FTVBh6wLsSR+OC7y4XaFInxWS85kSz6B4Owp5ooNlhwvpJq254GFBhVsA9a7UfSj3Z9Jcp3omr729A46Nr++Nh8lpUSmomYWABbPbgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778820491; c=relaxed/simple;
	bh=dhyrXM/5JYjMYUDIBzjJI6Ng7vQ8aoRh/YDj+P6QFH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgReFsFKNHWoudhDgu9EbBtQ4N7iWeqSnxSbA9zijGamVpgYbBI8Ye3DTzEgHD++Rcz485DYEhYALDgsb237rEDRdRp+iDqiXuYRiDBcDBchP7bUp6jxEtHsS3X0OdgKVZodJ+bw9UPVDGWXxKdg00LZHpORNhoq/KeQpXJf1uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sy5HmyDh; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sy5HmyDh"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c1a170a50so12331608c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 21:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778820489; x=1779425289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GYNAsu4Uu+JEMA3VuvkXUxd2Or1h+GLx1dngNmNLI4=;
        b=Sy5HmyDhJIEFA5vnQZT2Feo5JD+bq/eNcc1pfCc/wAGE9ul1DrI7eTMKSfAGv+Zdjn
         cmvh5ABt0ljrSeIG9XEuo53UV7btguPDoEfuHy1qfoX4Dl7sJLb1MFcuETrMA4LXvcXY
         bPF+KgQItYbMw4ytcyf6gNHlM8q8+OM3u761bBiWhCdHjRdWfdNI7o4Fp9l6wzzEQWl1
         SHg9tiORjvqeIQ3OF1ChYD5aOukbV3zva67498StpVjPKWT54x3WJxHw6DQktjp+Z7fd
         8UyRioSQzbiD98IazoZcDMgOnM97pkF3K0SAahOGdFzcQrsN+lYUTxMxg0xU5gxUAfQ6
         bTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778820489; x=1779425289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+GYNAsu4Uu+JEMA3VuvkXUxd2Or1h+GLx1dngNmNLI4=;
        b=cBRUKn5DglJEpP37+wVlD0HiSAHR1mJOr2z9wZs9ZQTohA3AvSrPHdDsSQjPBXxB5X
         LYjfMy9PI+cPRi+YxeufWAbRTSe2Ex+Tai4sP/tC9DMLexN9fLpu+baf+opSHXgFBc32
         2o3QgrVxOGFDT3FQ5XFys8Sc3uV9MdbRe73p3uu1nbDG4wVYGrG458J5Xp0P74fWV60M
         cWt85pHk6NknlFc+k/kEpXnYiXl3B7wun/RorPN+r+VDatc77pkR99xwdeosuQYKddh1
         KcPkIivSRUBnkspmASaZyrV+rQ2MOISif8Z7bVfowaXNSbUUZpDLh+N9tNkk9R9/czqW
         oDeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/aVxXRaWiHbaw/WPXTjS/PWw+kSgwmxVIj2v4BR3xBAWyYbbXmByY0dpCVRDvZ/vyDs92gcPmPw3EzDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWokX8PNHriVYxNn1NphzbWwQNcqqxvteaxIgLz8fFApvj/Vgj
	2fbCHSgHRkctKwGNUsRA63l64bwjr0owLsGGA2yoPhkun7Epg10WQcd6
X-Gm-Gg: Acq92OFPz+M1Unw/YGdeJ4KZjelUuTajHJyPMFTsDLE6nGIwmxjHfetGYuXbmr1gkJN
	9dl65HAx4Df4yA+yr61M3pAiuvlpN1bX0E1km8VcaMnlhYRw1YrjJ6LQ7EKoSFwB/IegLHzYdNh
	OIz1Ld5GW6hMn2ngAnr3RL9LnqzPvje99JLmYwlJIehecbfeU4YOS6aYTepc681XNu+ADbQ2dSJ
	Hk7/0Ir+8yKZ26s+LCKnoe0sh5fssU1PUq7qOn0AGiitoZJspA9zn3kAvRCp9rJP6qawjS6rbBx
	11hN/6YI3YYZ4rNEkb3Dx4GH5+Lt6R22dX3RZwk54x3CUB0NYXFs+50c8335Ud279qrJzVzI/Nl
	EBg2+HRNM8jVgw+RWBjt+9pLOI9fjWls1BO/OfcVObqLZj0YObaZhqv6XYTJTzayMwrfCyNnShL
	yfghYJCioe6PSuVqqE/U296Ng5YobOS4lYQcJA
X-Received: by 2002:a05:701b:2611:b0:135:1be3:a4a5 with SMTP id a92af1059eb24-1351be3a68fmr68030c88.26.1778820489254;
        Thu, 14 May 2026 21:48:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed531esm7717795c88.8.2026.05.14.21.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 21:48:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 14 May 2026 21:48:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Alexandru Tachici <alexandru.tachici@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 1/5] hwmon: (pmbus/adm1266) add firmware_revision
 debugfs entry
Message-ID: <53fa7ca2-a2d1-44a9-8d15-48ecae68d3c9@roeck-us.net>
References: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
 <20260512-adm1266-v3-1-a81a479b0bb0@nexthop.ai>
 <c88265fe-deaf-48e5-9caa-e70f0677e7f9@roeck-us.net>
 <DIIXOTP9ML0G.RVVC1XIP3IF8@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIIXOTP9ML0G.RVVC1XIP3IF8@nexthop.ai>

On Thu, May 14, 2026 at 08:35:23PM -0700, Abdurrahman Hussain wrote:
> On Thu May 14, 2026 at 6:42 PM PDT, Guenter Roeck wrote:
> > On Tue, May 12, 2026 at 11:56:24AM -0700, Abdurrahman Hussain wrote:
> >> The ADM1266 reports its firmware revision via the IC_DEVICE_REV
> >> manufacturer-specific block-read command (0xAE, datasheet Rev. D
> >> Table 80). The first three returned bytes are the firmware
> >> major.minor.patch fields. This is useful when correlating field
> >> behaviour against ADI release notes; expose it through debugfs
> >> alongside the existing sequencer_state entry.
> >> 
> >> The standard PMBus MFR_REVISION (0x9B) register is already exposed
> >> by pmbus_core's debugfs auto-create path and reports the
> >> manufacturer revision, which is a separate thing from the firmware
> >> running on the device.
> >> 
> >> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> >
> > Applied to hwmon-next.
> >
> > Thanks,
> > Guenter
> 
> Thanks!
> 
> Status of the remaining three patches:
> 
>   - Patch 2 (clear_blackbox): v5 will extend the pmbus_lock guard
>     up to adm1266_nvmem_read() to cover the memset/refill/memcpy on
>     data->dev_mem as one critical section (per an automated review
>     of v3).
> 
>   - Patch 3 (powerup_counter): v5 will take pmbus_lock around the
>     block read, same reason.
> 
>   - Patch 4 (rtc_class): blocked on your reply to my "drop entirely
>     or loop in linux-rtc?" question [1].  rtc_class is out for v5
>     either way.
> 

My understanding is that there is no in-kernel API to inform drivers
about a rtc update. No other driver seems to need this.
I see a number of options:

1) Use ktime_get_real_seconds() in probe, just like every other Linux
   driver using the real time clock does without problems.
2) schedule a timer which updates the clock every hour ? day ?
3) Attach a sysfs attribute to the i2c device to trigger a time sync.

2) and 3) are a bit excessive, so you'll need to provide a specific
use case. "Because the datasheet says so" is not a use case.

> The same review on patch 2 also surfaced four pre-existing
> buffer-bound bugs in adm1266.c (stack overflow in
> adm1266_nvmem_read_blackbox(), undersized DMA read buffer in
> adm1266_pmbus_block_xfer(), an unbounded record_count loop, and an
> out-of-bounds memcpy() in pmbus_block_xfer() using a device-supplied
> length with no caller-side size knowledge).  None of them are
> introduced by this series.  My plan is to send them as a separate
> "hwmon: (pmbus/adm1266) fix ..." series with Fixes: tags first, then
> respin this feature series on top.  Let me know if you'd rather have
> them folded into v5.
> 
Separate series is ok.

Thanks,
Guenter
