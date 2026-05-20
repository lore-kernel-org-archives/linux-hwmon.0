Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF3937B40E
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 21:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779311902; cv=none; b=TkCIdeVp2BaFcIAfOL7IUgwI3KWD4twtae2jZ8Mu/QZFGEzZCF7j+CYWlbuzw8l1Py1LNW83llYqdFd5PydQFr2irU0Pe4AOUurPOs1xIvZsmyDEYA2ze2L1mu2A9wGXcDsAoV2DfxbJrUYzwFMAtroOgJFgurNxUMElKMJQ6Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779311902; c=relaxed/simple;
	bh=2qBAJakZ99cnOL/2UwFpo8VxRhNqhAyyDd3DXmJ7Fcc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=o5dQ0kMQM5VeqhsB/Xni9hQT4Xa8NJJR+o9Er0nbppVfxBxiu8zG0xBMTKmJ3vN2X9McmmYVCE8PJwZws/KdOfMWXrtJ+UsCdohVojIlR53QYnyXP8TvpzRrR0DRZoE6uDR49MrE3ozHg1JofrtbrGXA4TybqmuSJA1d2MZhHYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Yf8PAX5P; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Yf8PAX5P"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12ddbe104ccso3865940c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 14:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779311900; x=1779916700; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Tf2Xd147xJ0sNfv/d8vxtKV4pEk11pNA8lNnJlbJZM=;
        b=Yf8PAX5PGIAB+58vF1DTGHYBfhfzNuCxJkKOhA/X4nILwk5+ll+fuR0YF+64WfTHkr
         3l9cAhZzeMxMMladx+FkF5vtnWfn6cOW7YqCt6ficI3TVA6CrwkHUEQ0biO6f7qV3GkP
         9L7Xg96mtLUmjB9GnHgZM6jBHg6/hHCD6/wIdldxHNLckT7t1onOlxf7w0kzc5wFudIY
         bX55Xgqks/9Oj/MA3orWI1LBpVAWVoHHuWysODNRKUJtugUA81+XD6FL8JhH7JgCcKJM
         VG4VmkjVrAXzrRT0TjMRkoPA8HWfs2JwMbqXffqoHZ8q03JywRcXJWinMoz2nAZ6yp3R
         ro+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779311900; x=1779916700;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Tf2Xd147xJ0sNfv/d8vxtKV4pEk11pNA8lNnJlbJZM=;
        b=oTHapyj5tqa+r8lc1/Y99Va2K2tNs/RK5hou51O60s5XTOgCVLbFxNIL7hoLDq6Ga7
         A2AS/UP2dmGVoD7H6j0T2jg+QNFGO+jzSgGWqfgyfo5HTIm+qShRFIZLdTsHFUE+lSmc
         I9GPLgx2vN0RJFvJdOEPqcCrkkA7Av11OU2LR2SEpO4N1xSZ2MfgJkCs7hhGaejQHr6R
         kWNQ1IIH/cKCUkU/j12yZlLYluUJAWSFd2OFfBxVqdN0YOfix0JFDQ+d5UpMIOhHvNG+
         o3z05bVhB99fmHU5MQCcly/B4Cu/QcCDzGB0ghi9XhE7xGvyg0nJWqoq7+638jixzo+2
         Cvqw==
X-Gm-Message-State: AOJu0YzoKMWwMCsX+jYqsg5q2TNxrRiEVwzTJIxkvX17vRLhWQlrKsvx
	pwMrDZruHmR2uQ7XrA2RI1HZi1zQ5CIvhvbnjoWYwjlH510ziqIXrLAa7WLAAlu39tE=
X-Gm-Gg: Acq92OEKaIqFAEEGgTrpApwMdH6sL800Qx6PI3ogjdGnM9UlEcsd6W8Saz9giJMHf5w
	hDOBHyq8Bs+Kqqyzk5g0Y4XzipU6Yh0WB+SyaKQn3hr9Yv94FztjREzuO3sY8BtotbbROQD9JN7
	IsoreVVD7yKa7Ky5fHB2vXmmqVzmLfvdDnMN1+gUNBHGoluKX4rwn8WbNY9ZMgWZrlNpHrGzRZD
	FwEzt5hC7MiNQuF4hZLnN5qYj9PU1SP6tKlm5sow409Yeb1RcT4tbihY6KZeTpz04Q6csAafxJq
	OoSjRxnwB038c1a0jfAeN2Ojw5nddJjjcgZyl533YDUuY6UExB0ijXcchSiL6dvrWZal+PbIJ2z
	6WYpvNmGr2PtO9Nia5LMpT2M5N0io6Dcy+HB3LyYNzKXlPx6RO6fPuYoUVWYPJgjkU++H4+rDoU
	wDAtqLbUGrVTvr0mUBtb1j9Lk=
X-Received: by 2002:a05:7023:b10:b0:12a:8ea4:252 with SMTP id a92af1059eb24-136327f23d5mr182452c88.4.1779311900270;
        Wed, 20 May 2026 14:18:20 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a67csm26481338c88.13.2026.05.20.14.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 14:18:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 14:18:18 -0700
Message-Id: <DINTFDZ1H8B4.FZ50CYI6WTVI@nexthop.ai>
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Guenter Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH v4 0/3] hwmon: (pmbus/adm1266) add clear_blackbox and
 powerup_counter debugfs entries
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, "Alexandru Tachici"
 <alexandru.tachici@analog.com>
X-Mailer: aerc 0.21.0
References: <20260516-adm1266-v4-0-1f8df4797258@nexthop.ai>
 <da0fbce2-788e-4419-8ca1-975311951ce3@roeck-us.net>
 <DINO5GQHP6VK.ZBC2D5ENBYKW@nexthop.ai>
 <DINRCDZ0SHS3.1X4T3VVLSL36E@nexthop.ai>
 <1783d74e-6acc-40d2-bdff-9bacbb04032c@roeck-us.net>
In-Reply-To: <1783d74e-6acc-40d2-bdff-9bacbb04032c@roeck-us.net>

On Wed May 20, 2026 at 1:59 PM PDT, Guenter Roeck wrote:
> On 5/20/26 12:40, Abdurrahman Hussain wrote:
>> On Wed May 20, 2026 at 10:10 AM PDT, Abdurrahman Hussain wrote:
>>> On Wed May 20, 2026 at 7:10 AM PDT, Guenter Roeck wrote:
>>>> Hi,
>>>>
>>>> On 5/16/26 18:18, Abdurrahman Hussain wrote:
>>>>> This is what remains of the v3 series after Guenter applied patches
>>>>> 1/5 (firmware_revision) and 5/5 (GPIO line label) to hwmon-next, and
>>>>> asked for patch 4/5 (rtc_class) to be dropped.
>>>>>
>>>>> Patch 1 adds a write-only clear_blackbox debugfs file. Devices
>>>>> configured for single-recording mode (BLACKBOX_CONFIG[0] =3D 0) need
>>>>> an explicit clear once the 32-record buffer fills; the documented
>>>>> sub-command ({0xFE, 0x00} block-write to 0xDE) wasn't reachable
>>>>> from userspace. The patch also acquires pmbus_lock at the
>>>>> adm1266_nvmem_read() callback boundary so the memset of
>>>>> data->dev_mem, the blackbox refill, and the memcpy to userspace run
>>>>> as a single critical section -- the nvmem core does not serialize
>>>>> concurrent reg_read calls.
>>>>>
>>>>> Patch 2 exposes the non-volatile POWERUP_COUNTER (0xE4) via debugfs.
>>>>> The same value is embedded in every blackbox record, so the live
>>>>> value lets userspace match a captured record back to the boot it
>>>>> came from when correlating logs. The block-read is taken under
>>>>> pmbus_lock to serialise against any pmbus_core PAGE+register
>>>>> sequence on the device.
>>>>>
>>>>> Patch 3 takes pmbus_lock in adm1266_state_read() (the pre-existing
>>>>> sequencer_state debugfs handler) for the same defensive-locking
>>>>> reason that motivates the new debugfs files in patches 1 and 2:
>>>>> any direct device access from outside pmbus_core should be ordered
>>>>> with respect to pmbus_core's own PAGE+register sequences.
>>>>>
>>>>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>>>
>>>> The series no longer applies after applying the bug fix series.
>>>> Please rebase it on top of the hwmon-next branch of
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>>>> and resubmit.
>>>>
>>>> Sorry for the trouble, and thanks a lot for fixing all the problems
>>>> with the driver.
>>>>
>>>> Guenter
>>>
>>> Will do, thank you for your support!
>>>
>>> Abdurrahman
>>=20
>> Hi Guenter,
>>=20
>> Before I send v5 of the adm1266 series, I'd like to revisit the
>> SET_RTC exposure question from your v3 review [1].
>>=20
>> The use case I keep landing on is the one the datasheet itself
>> recommends: a userspace agent (chrony hook, systemd-timesyncd
>> script, or a small periodic daemon) keeps the chip's seconds
>> counter aligned with wall-clock so the value embedded in each
>> blackbox record stays correct across long uptimes.  The probe-
>> time ktime_get_real_seconds() seed (now in hwmon-next) only fixes
>> this at boot; the chip's counter drifts after that.
>>=20
>> You ruled out rtc_class and called a kernel-side periodic timer
>> "a bit excessive", which I agree, it is.  That leaves a
>> userspace-triggered sync.  Two debugfs shapes I'd consider, both under
>> pmbus/<hwmon>/adm1266/ (alongside the clear_blackbox,
>> powerup_counter, and sequencer_state entries v5 already adds):
>>=20
>>    A. RW since_epoch -- mirrors /sys/class/rtc/<dev>/since_epoch.
>>       Read returns the chip's SET_RTC seconds counter, write sets
>>       it.  The read has the useful side benefit of letting
>>       userspace measure host-vs-chip drift without writing.
>>=20
>>    B. Write-only set_rtc -- writing anything to the file makes
>>       the driver read ktime_get_real_seconds() itself and push it
>>       to SET_RTC.  Simpler interface (kernel owns the time
>>       source; userspace just triggers the sync), no payload to
>>       parse, no way for userspace to pass in a wrong value.
>>=20
>
> How about a combination ? read returns the current value, anything
> written synchronizes with the kernel rtc.
>

Going with that for v5.  One naming question before I send:

  - set_rtc -- matches the PMBus command name (SET_RTC =3D 0xDF), but
    "set" reads as write-only at first glance, which is a bit
    misleading for an RW file.
  - since_epoch -- mirrors /sys/class/rtc/<dev>/since_epoch, but
    that one is read-only in the RTC subsystem so the dual
    semantic might surprise users coming from there.
  - rtc_sync -- describes the write semantic directly, but leaves
    the read side unnamed.
  - rtc -- shortest and most neutral; doesn't bias toward either
    operation.

Any preference, or should I just pick?

Thanks,
Abdurrahman

