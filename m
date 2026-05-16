Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179712DFF3F
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 19:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958789; cv=none; b=q1ufaLrWsl6DffIR7SsqgJhxlOuwrYMZP3rp4092htWK32Fj6Prqy6FZ/rvC1W6iaCOkDPyprU2oNcKFsZfKFc9pu2Y7usdSE3rTnBfmrYyXY3l4Km32ZylMNYBeqLvcBuQpf+fFORq9nl2tr+XTrCrkYyn8AKYZPoZn3CGVecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958789; c=relaxed/simple;
	bh=gn2uMmGVqz7bX9M35WbIy51eFSYt1rl4hYvMtRDztHc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=sWSkcbYpZAm7rS+B3VamVXRcWPyzh1b0oNNcSxcO46C0gYj9TEezJIz3kAOZ5c7lLhf5bA6u3JNs5kb3ttBMb3ZT/pPEcY254oa/SD0Wfh3kYHpib3hn5MIW5KtGoakGar8dtJndQXrN37L+ZIBx3P/SbBJlX58oyT5UjAgVyyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Iuma67aS; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Iuma67aS"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c8f9846c8so1050458c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 12:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778958786; x=1779563586; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8MJvVWg0F0H0jEwe7ABZnubh9KyrgWaVRhp78yyYlk=;
        b=Iuma67aSVt8qMWqkGW0rkta/GCsnMGN9BZte5OBOnScGEBGHP8nxDgEPHKlZnczilY
         bd/ojji4yWFZL+AlnXBN+2SzNznUYFvRnl9ySdRM3xPpz6NzNm75z4tIGbyyneCoXvro
         uWm/fLq0ity/QT5EL0wi5Jss/hZmwUJp8ZqUgVnF4oadatY6BKhA52bAMWnYbgbYC4OS
         xNy7ggWNBAagSm2/p9NRwGF6wMM0879RNlMeM83IPJktPaK5BehUMgY7F4cDYubqzikz
         0g5AAAMYY+lxI3tfGF9KlxNgRxVge47PknLY71RVA2JyjITNvQ1zVTew/RNkn7FYxskq
         dSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958786; x=1779563586;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e8MJvVWg0F0H0jEwe7ABZnubh9KyrgWaVRhp78yyYlk=;
        b=BaMjCnvUB62TJiefGgbyCgIdfPPsalVfpM2vhH8rUMvMNl8qKM69h14UrNrTXW8zdl
         6mT1wo0N9ygsvfTDu0jBdY7KLHnZUeZ2t2ihgJskzKo2X16wJjkXswH2ESTY7iaPyvjQ
         s01kW446L99G/LjFFXKCo00sysl9FzzXkhSpQQRcSrHX9X6t6aZ0YMKOKW+Svp6xeo2d
         ULeBiQ+bOrQoP97dLYFKckr+c/Z5YaCIbsfs1iYGATS7IZHDlWC11bQlaIzZmoLDm5mN
         9FNyu+e+TNlmTp7cAkfccM4lSD6luqgLt6tJKTJEMPTpiNtL+EZTlLKwSiCk5ly2oBmp
         EmRw==
X-Forwarded-Encrypted: i=1; AFNElJ8edV5VDIxMqMg8nXYFE8/GK+gWr0Gv8HqpqXsPRHtaDu05U371R6s9SdmjvGAxNiSu6sgPydLW1INugQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNjoZfpJvOxs9wRO0RypKiJIDL+KiNOBr8ayzF+VC0GXUjHZsO
	dczCLD71XGDrUbtSZ7QCACFJ0N9w2vRA6zSeAcJtp0dVqClV8PgzgRBYiL0/C6l3UUM=
X-Gm-Gg: Acq92OFjMjU++xMAGEAThRke5UToNvSqkjaSY94fvsw1OcBoweAh9qvoK8qSvzqdyBn
	UJyMC8Fl+8otR99wBw9u7JEGRRnOmsDrNoVctPqQo9/D3SiVm3sAX61IcQGgcKp0hrg6xE0cR64
	pGPhB8GgGc0wW2txjRdzZ5jZMgJCyeBwe7ZncbiNeHedWV/ibGAlcYDqA2fDcX4IXWy12Jp/w40
	XDku+uvINeFfQOpXRi7KfdaeMdV4TVmSU68uC0pJBUesQSCKew7GLqgLzP17sGOFpekzGQRyGe2
	OulbZpec+QjFF45PSAlZTDOdiSRpDlAY2azE0piqkpcngx/Oq0GN0uACNGur8DPtHIZI3XBtI8N
	ubl2Wko0rh4lapUmBe8/PtUAucbVeQcGJh26NMdiZfo9/JF0nTTJoR/D5VdBGVre2H5j+wuzx9c
	Fi+lHYWSZFjFUdiIL+Y8dMozGlfZQdfCBeuQ==
X-Received: by 2002:a05:7022:922:b0:132:7ab5:6cb8 with SMTP id a92af1059eb24-13504311c97mr4432138c88.2.1778958786004;
        Sat, 16 May 2026 12:13:06 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cb5b3c20sm15046942c88.0.2026.05.16.12.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 12:13:05 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 16 May 2026 12:13:04 -0700
Message-Id: <DIKC9BK2GTDE.3L5O0LAIZAGH@nexthop.ai>
Cc: "Jean Delvare" <jdelvare@suse.com>, <linux-hwmon@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, "Guenter Roeck"
 <groeck7@gmail.com>
Subject: Re: [PATCH 0/5] hwmon: (pmbus/adm1266) buffer-bound and timestamp
 fixes
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, "Alexandru Tachici"
 <alexandru.tachici@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260515-adm1266-fixes-v1-0-1c1ea1349cfe@nexthop.ai>
 <2a3c5a65-e2b7-4159-9d3c-eb6a8a600b37@roeck-us.net>
In-Reply-To: <2a3c5a65-e2b7-4159-9d3c-eb6a8a600b37@roeck-us.net>

On Sat May 16, 2026 at 8:23 AM PDT, Guenter Roeck wrote:
> On 5/15/26 15:11, Abdurrahman Hussain wrote:
>> This series fixes five pre-existing bugs in adm1266.c that were
>> surfaced by automated review of an in-flight feature series for the
>> same driver [1].  None of them are introduced by that feature work --
>> they are all reachable on the existing driver as it sits in mainline.
>> Sending them standalone first, with Fixes: tags and Cc: stable, so
>> the feature respin (v5) can rebase on top.
>>=20
>> Patch 1 fixes a CLOCK_MONOTONIC vs CLOCK_REALTIME confusion in
>> adm1266_set_rtc(): the chip's SET_RTC register is documented to hold
>> wall-clock seconds, but the driver currently seeds it from
>> ktime_get_seconds(), giving blackbox records timestamps that reset
>> to small values on every host reboot.
>>=20
>> Patches 2 and 3 fix two ways the blackbox-info path can be driven
>> out of bounds by a misbehaving slave: a 5-byte stack buffer that
>> i2c_smbus_read_block_data() will memcpy() up to 32 bytes into, and
>> a record_count loop bound taken directly from the device with no
>> upper clamp against the 32-record dev_mem allocation.
>>=20
>> Patches 4 and 5 fix the two ways adm1266_pmbus_block_xfer() can
>> write past the end of a buffer: an off-by-one on the helper's own
>> read_buf (sized for the length+payload but missing the PEC byte the
>> i2c_msg length already accounts for), and a caller-side bug where
>> adm1266_nvmem_read_blackbox() advances its destination pointer in
>> 64-byte strides while the helper is willing to write up to 255
>> bytes per call.
>>=20
>> [1] https://lore.kernel.org/r/20260512-adm1266-v3-0-a81a479b0bb0@nexthop=
.ai
>>=20
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>> ---
>> Abdurrahman Hussain (5):
>>        hwmon: (pmbus/adm1266) seed timestamp from the real-time clock
>>        hwmon: (pmbus/adm1266) widen blackbox-info buffer to I2C_SMBUS_BL=
OCK_MAX
>>        hwmon: (pmbus/adm1266) reject implausible blackbox record_count
>>        hwmon: (pmbus/adm1266) include PEC byte in pmbus_block_xfer read =
buffer
>>        hwmon: (pmbus/adm1266) bounce blackbox records through a protocol=
-sized buffer
>>=20
>>   drivers/hwmon/pmbus/adm1266.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>> ---
>> base-commit: 1f63dd8ca0dc05a8272bb8155f643c691d29bb11
>> change-id: 20260514-adm1266-fixes-853003a0fad4
>>=20
>> Best regards,
>> --
>> Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>=20
>
> Sashiko identified several issues with the driver as part of the review.
> Most if not all of them seem valid, but were not introduced with this
> series. I'll apply the series as is. Any fixes can come later.
>
> Thanks,
> Guenter

Thanks Guenter!

I will address the issues in a follow up series.

Best regards,
Abdurrahman
