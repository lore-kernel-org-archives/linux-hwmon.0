Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4EA3403F4
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297019; cv=none; b=W1TuTGQcSD9ydsfIfuD2VQzRD7fTMke7FdTS7/8JaVs54FgXH2w1vIDvw2t+9FNspRpUL9iNSupdnESXzk10EfjWKyjkxs4QQYxt3Yz998ATsrdyUdyawHi2JC31wwxM50MH0Fnd/oD8Wk9ncwbztC2POIqM3QiYa+y55drPvIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297019; c=relaxed/simple;
	bh=WRjV1fblvYAQ22vZ0eqwhU4cl3qJbPBDiN5/spvOquc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=ZNiBaQNFzTBYe3xYIiI2Y7MEmJl6hKjd7JhMA6KEf+RyhIKWVaoZnqbp2tmE0uZnbVDzFIkUnn5Sn07JsbAHqjfWlAE9mnshBj0sD6gqi8tEARmm1RBLK+fROXrML5/pZlgGLE/d7E7Knzu9RpZWCnxhJaoIzwTQkSKLEMJoiAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=kgOTCnr4; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="kgOTCnr4"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c8f9846c8so6116190c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779297017; x=1779901817; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRjV1fblvYAQ22vZ0eqwhU4cl3qJbPBDiN5/spvOquc=;
        b=kgOTCnr4iddIuKdp+BhE9fK9Mt2bZ3S3aRzEufl6VclCT6WQtDrrHJfXV4ylSnT/DP
         p2tClAHROUpnRwN2haiaCqw+Z6RELm3JvNYSD/X96OOPV3//cYAfxYFbjb1anueF55d9
         /4x9oyv5mAMU7NG0lN/mhqcpIkjiJNZCPd3iUsB0bLVv2Rhw8XdsstEGPgRwwHCTMxaQ
         MF5IwEaekIEZbTBawcb2d3f3iuciQYU489ZUNWyNUWg0Ez5PeIRSGjd42jxUQdX10Hso
         PLZZv0U2C91V+3R4gyRlfp0Ziu/jF4jokg1K/X+TO662jk53gvw3g0gurppH+E7989Su
         kSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779297017; x=1779901817;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WRjV1fblvYAQ22vZ0eqwhU4cl3qJbPBDiN5/spvOquc=;
        b=ZQijIXgmSLBJEnXfhmoir7tzihJJhfRVJxLXiqeMJsYu+j/v450TzxKVueK5zob49r
         OqIWEPvqjNkAnS8JGfgBR0GbKhQ/JPFEwUMle9av29zr5gbjgL4nldFWwNrgERmH+s7Y
         XjEHhpD5H0UG2JzeBdTwZxdFHjJHUXTC38aYzUAPKsdy3ZG+LO32MIswKqZzAr7p5T5i
         GvLSNdEavs0v9lRURMX5G82y03nz6VAgznM/izz0qNVRW3XQpICxWZEooDb6kVhZeZ5Z
         e7nReyURqlmex7FL5ET1SncPAE8fH6RLUFqSrElqJy1Tty9TVDhMapQg5wjrcFUk+dA1
         7ymQ==
X-Gm-Message-State: AOJu0YyVW7shy1KD18VTjX1QXsSZe3pu4wcFq5fdlb/J6m3jG0Sd4NRh
	CJegXNe4OCsDAK3cHIjdVEbMQOSkjYsVAQHA6LBD/SwWl/Br92ge1p1DX3Gt5Pi4ZPU=
X-Gm-Gg: Acq92OGYdnUkPtx+4gw/1yBeL7pX1O+DwO8TU/SvW+8iuPhRDilUbeSzvroZapJFsML
	AF30yoqqwF/Zx9wYF9ag7oGArpcQHC44sPtXK0BWLh9QAe/voioozFXGY6q7ZWpMQsS+2Q5tRw5
	gfLtamY86orM85+gl5PBusZIAUX2C2Q0dRdfuNXlfOQ5ZI/vjEKUY/hgxLG0Q+FRI4V4drhOQ2m
	FAqcB0FCeI0K3E8oRbe7v+lPrjZgd8LRkx4aKmWBlTP1/zMIqBt9XlHSz4bwB1twjsrSTkgpOBw
	iSJKr/Roa66eISW707OX302VVNIyWCXcAoJOZWw/BTiJIm4+9EnQ4rCqreBkYh+l7zrzaDg+28Q
	Jk7Buy8H83Bz9TyY8O5G8D8t0HLUgT1qmU7CZXIFjBLlnezgLbTcYqMsydy63wFyiEIg0I/EjqY
	0k0V80ezQmih7WPS2Yw5Ekk2k=
X-Received: by 2002:a05:7022:40d:b0:135:31e7:4e62 with SMTP id a92af1059eb24-13531e75045mr8225611c88.13.1779297016998;
        Wed, 20 May 2026 10:10:16 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm26085229c88.2.2026.05.20.10.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 10:10:16 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 10:10:15 -0700
Message-Id: <DINO5GQHP6VK.ZBC2D5ENBYKW@nexthop.ai>
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Guenter Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH v4 0/3] hwmon: (pmbus/adm1266) add clear_blackbox and
 powerup_counter debugfs entries
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
References: <20260516-adm1266-v4-0-1f8df4797258@nexthop.ai>
 <da0fbce2-788e-4419-8ca1-975311951ce3@roeck-us.net>
In-Reply-To: <da0fbce2-788e-4419-8ca1-975311951ce3@roeck-us.net>

On Wed May 20, 2026 at 7:10 AM PDT, Guenter Roeck wrote:
> Hi,
>
> On 5/16/26 18:18, Abdurrahman Hussain wrote:
>> This is what remains of the v3 series after Guenter applied patches
>> 1/5 (firmware_revision) and 5/5 (GPIO line label) to hwmon-next, and
>> asked for patch 4/5 (rtc_class) to be dropped.
>>=20
>> Patch 1 adds a write-only clear_blackbox debugfs file. Devices
>> configured for single-recording mode (BLACKBOX_CONFIG[0] =3D 0) need
>> an explicit clear once the 32-record buffer fills; the documented
>> sub-command ({0xFE, 0x00} block-write to 0xDE) wasn't reachable
>> from userspace. The patch also acquires pmbus_lock at the
>> adm1266_nvmem_read() callback boundary so the memset of
>> data->dev_mem, the blackbox refill, and the memcpy to userspace run
>> as a single critical section -- the nvmem core does not serialize
>> concurrent reg_read calls.
>>=20
>> Patch 2 exposes the non-volatile POWERUP_COUNTER (0xE4) via debugfs.
>> The same value is embedded in every blackbox record, so the live
>> value lets userspace match a captured record back to the boot it
>> came from when correlating logs. The block-read is taken under
>> pmbus_lock to serialise against any pmbus_core PAGE+register
>> sequence on the device.
>>=20
>> Patch 3 takes pmbus_lock in adm1266_state_read() (the pre-existing
>> sequencer_state debugfs handler) for the same defensive-locking
>> reason that motivates the new debugfs files in patches 1 and 2:
>> any direct device access from outside pmbus_core should be ordered
>> with respect to pmbus_core's own PAGE+register sequences.
>>=20
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> The series no longer applies after applying the bug fix series.
> Please rebase it on top of the hwmon-next branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
> and resubmit.
>
> Sorry for the trouble, and thanks a lot for fixing all the problems
> with the driver.
>
> Guenter

Will do, thank you for your support!

Abdurrahman

