Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE72351C31
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779306027; cv=none; b=HohYFPgY8xHRN0tulLYVnJ4lwkgwpcZh3RBo9dwcAfGl1br6AckxySZHAVUkai5ekQUiO7JOqrcf5ybo5iDxEZu1a306aJLqomaMV41Yw5vVTJQYY6KNS1U4waiGQ4BaaQaP5nZHxB7sifBQOW+XhDQ4+3/MBLZw9yZmz/2QV2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779306027; c=relaxed/simple;
	bh=gD9FvkX53JUVKNkxLtMwVrYMxYM+/fehb1JKmOS+44k=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=FhAlDGCwRk3BTmjLjYE2eI8ExIDynlB/a+sxT1myAqzyE3Nu0vZIwbrtivK1/mdwbQJh01L/LS47WSeY1dLCSL3Nol6TGlMx0BaPFxROfOzkEY2u6End1iOtdEjYQG76wbJWooeOoBjCcGuvYKqjZfKGxBle+W0fRwkLVHhYsN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Dxf59BCA; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Dxf59BCA"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13621cca8f5so783748c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 12:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779306023; x=1779910823; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4Z6auHD47mpoadC6kfYBTYbgxuz8kIYh8F1YtTA+WM=;
        b=Dxf59BCAl0XpbIGF1c/lwwesAU9E8b2K1YxMXU2qiof8xPs2rtb1NaYAUAlCgFxZQe
         /lFnFv+hJgGM8/ZZ4OgswZAJ6KqG/TTirNvb2Huc2RxB5gDP8YiDVl1A/i0/sU3yY7Dz
         5h7hSw/bpXcseF4/9d0aTRG4o7WsI449/uHOetL2igOnwmbOETCIEvumQ+twJWEzjdmt
         5rBfAMZltD2LZBZZLn2j09h1YPJCu1+d0H/yRqXMztcCidRH3zibMs5Plr5lDBTcLBbG
         z7A/ExEcg3Bh7tV15/bDJhMkgg6KJKyYAZ80EwzG+7mgvgxhazJ+1FxkTuKl9tVo85J2
         lbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779306023; x=1779910823;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4Z6auHD47mpoadC6kfYBTYbgxuz8kIYh8F1YtTA+WM=;
        b=I2Kl0MW1Zb6ExVDAM9oa4TrmqyVChyhhdQFmkaWlkeGD90PUb4YdT34xNzTH3331R4
         ELWCB2DueYfNYEOXeLuVHU8ARQzFOHgU+VZjAmd0ee7VjKANheKAAREssxmzmw9tGuA6
         PexuXHQsReZVjeTtQ0tAzFtV3HHaK1KxyxBFXdtzlBOHq4lWf8qB5Lknd2OGGhyjVnlV
         6yLFtDoIs+4y8uVToQAjhjVAJKshQ+Q7Vn4XG+ucF1gzfLzRmu9pTequQd/ZeGHdQ5mZ
         PEvbbWJjkiDRNNY20pKJDIbhTTRixzHrjzDDr0ry9cEWlU5t0liVM6clczGEA8UbLWSS
         j6XQ==
X-Gm-Message-State: AOJu0Yw+sKGdU3c/qtlKWxbELzAazX1hUCekvS/XEzWwomN7e0Sh8/s9
	3hjJ8u8/5YTFleJt+JkbDtNKoM6kZTnnJzUiQf3B/aYmXkTAMoNzDJ3slHFLmxGXXwU=
X-Gm-Gg: Acq92OFQ6IMMab/CH7lnR+XNF/QA6xzBRPdN+Tn14g3ltYDa6yiNsV6g5KPzC51VtEB
	xcUhYe6r1aullBRO+x/820KxXdW791y0hNbyKj+emNgcjcaRM1RfCEObsF5s+v6Z0cSePVvWU2S
	Zwqn4sS2Flm5YUoua76LQ3XjXsoG1ouzfJCWE8ah74g2/SFGiCgOeHGh4ItVwYfGXz8x/zT6meB
	EQEvaMpRLcvNbsI6bfmh3tYDuansZsD4RKHEz4KEodw09vbTQxEnDxjRGxYUr27th4OqtFLoLF8
	09k2wmUPFwvPQep/GYvcN5g/MjmoCJfyGxSSa6/MhvfxkHOxH9FXbf9IC3Oq1hs6lST2yDbM8+v
	NkAJg9S9RDtyFJKyomss/EzfnUBhN7nV4CVltWD2nKUbZYYzjyP1oRhBTi7rLiPROsdHLTc+2y9
	EY46R6mH/BItPY6ojI69+4SkCgXmpyyBXcxw==
X-Received: by 2002:a05:7022:311:b0:128:d34a:320f with SMTP id a92af1059eb24-13504625a7fmr12415188c88.12.1779306022775;
        Wed, 20 May 2026 12:40:22 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdce9fasm22637332c88.4.2026.05.20.12.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 12:40:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 12:40:21 -0700
Message-Id: <DINRCDZ0SHS3.1X4T3VVLSL36E@nexthop.ai>
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>, "Guenter Roeck"
 <linux@roeck-us.net>, "Alexandru Tachici" <alexandru.tachici@analog.com>
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Guenter Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH v4 0/3] hwmon: (pmbus/adm1266) add clear_blackbox and
 powerup_counter debugfs entries
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260516-adm1266-v4-0-1f8df4797258@nexthop.ai>
 <da0fbce2-788e-4419-8ca1-975311951ce3@roeck-us.net>
 <DINO5GQHP6VK.ZBC2D5ENBYKW@nexthop.ai>
In-Reply-To: <DINO5GQHP6VK.ZBC2D5ENBYKW@nexthop.ai>

On Wed May 20, 2026 at 10:10 AM PDT, Abdurrahman Hussain wrote:
> On Wed May 20, 2026 at 7:10 AM PDT, Guenter Roeck wrote:
>> Hi,
>>
>> On 5/16/26 18:18, Abdurrahman Hussain wrote:
>>> This is what remains of the v3 series after Guenter applied patches
>>> 1/5 (firmware_revision) and 5/5 (GPIO line label) to hwmon-next, and
>>> asked for patch 4/5 (rtc_class) to be dropped.
>>>=20
>>> Patch 1 adds a write-only clear_blackbox debugfs file. Devices
>>> configured for single-recording mode (BLACKBOX_CONFIG[0] =3D 0) need
>>> an explicit clear once the 32-record buffer fills; the documented
>>> sub-command ({0xFE, 0x00} block-write to 0xDE) wasn't reachable
>>> from userspace. The patch also acquires pmbus_lock at the
>>> adm1266_nvmem_read() callback boundary so the memset of
>>> data->dev_mem, the blackbox refill, and the memcpy to userspace run
>>> as a single critical section -- the nvmem core does not serialize
>>> concurrent reg_read calls.
>>>=20
>>> Patch 2 exposes the non-volatile POWERUP_COUNTER (0xE4) via debugfs.
>>> The same value is embedded in every blackbox record, so the live
>>> value lets userspace match a captured record back to the boot it
>>> came from when correlating logs. The block-read is taken under
>>> pmbus_lock to serialise against any pmbus_core PAGE+register
>>> sequence on the device.
>>>=20
>>> Patch 3 takes pmbus_lock in adm1266_state_read() (the pre-existing
>>> sequencer_state debugfs handler) for the same defensive-locking
>>> reason that motivates the new debugfs files in patches 1 and 2:
>>> any direct device access from outside pmbus_core should be ordered
>>> with respect to pmbus_core's own PAGE+register sequences.
>>>=20
>>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>
>> The series no longer applies after applying the bug fix series.
>> Please rebase it on top of the hwmon-next branch of
>> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>> and resubmit.
>>
>> Sorry for the trouble, and thanks a lot for fixing all the problems
>> with the driver.
>>
>> Guenter
>
> Will do, thank you for your support!
>
> Abdurrahman

Hi Guenter,

Before I send v5 of the adm1266 series, I'd like to revisit the
SET_RTC exposure question from your v3 review [1].

The use case I keep landing on is the one the datasheet itself
recommends: a userspace agent (chrony hook, systemd-timesyncd
script, or a small periodic daemon) keeps the chip's seconds
counter aligned with wall-clock so the value embedded in each
blackbox record stays correct across long uptimes.  The probe-
time ktime_get_real_seconds() seed (now in hwmon-next) only fixes
this at boot; the chip's counter drifts after that.

You ruled out rtc_class and called a kernel-side periodic timer
"a bit excessive", which I agree, it is.  That leaves a
userspace-triggered sync.  Two debugfs shapes I'd consider, both under
pmbus/<hwmon>/adm1266/ (alongside the clear_blackbox,
powerup_counter, and sequencer_state entries v5 already adds):

  A. RW since_epoch -- mirrors /sys/class/rtc/<dev>/since_epoch.
     Read returns the chip's SET_RTC seconds counter, write sets
     it.  The read has the useful side benefit of letting
     userspace measure host-vs-chip drift without writing.

  B. Write-only set_rtc -- writing anything to the file makes
     the driver read ktime_get_real_seconds() itself and push it
     to SET_RTC.  Simpler interface (kernel owns the time
     source; userspace just triggers the sync), no payload to
     parse, no way for userspace to pass in a wrong value.

Do either of these look right to you, or would you rather I just
leave the driver at "probe-time seed only" and skip a SET_RTC
interface entirely?  v5 as it stands has no such interface and
is ready to send; a SET_RTC patch can follow separately later if
you'd like one.

[1] https://lore.kernel.org/r/20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai

Thanks,
Abdurrahman

