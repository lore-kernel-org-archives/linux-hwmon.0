Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2575E33D6ED
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 23:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778370555; cv=none; b=ufVD9YH2AMaydOzRc54M6VcbXGDqTNFtwP5eFVoivsffy1+ZFDOMPNUgca2o1R/atIdHYrt78n09T8tfLA4AdUJoUtxAn7lziaHptIL57sMgmJItuEO+eKFbckSPgVdIn7m1J/YBXSLLaMSJBEWaNspXKKVJBVmM4zRM4eVqYiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778370555; c=relaxed/simple;
	bh=i4Ew3TFk8QqfcI27UkzQ3iewKY+U5LsR4omixEmQBCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BH8J55yGrGEcUxvjDj70fo0JSVUPEFhnauiltBWTwIHHntV8ttzJJooehuEtAgvS8H6ONQwvA7vgA5y5FJATUsAlGinaNNv03IjPT4wV6AdhJyvdhMariMETDvfonPMPJbwUVd2n3XwZ7wybddGUP1GKnAr/JmdIyTkmewtW6Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbcAc5AR; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbcAc5AR"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c80148ae949so1324575a12.2
        for <linux-hwmon@vger.kernel.org>; Sat, 09 May 2026 16:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778370553; x=1778975353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qTWs0LqAN8p0BSW2QxB0AUxJatTBkeIozGkYaF1zL/k=;
        b=FbcAc5AR+FfgHlIOQ0X77VEpqDhyowMAKZna5oKzfkdPkQlWhUUHeb/VIzadtzjCkp
         HwXRWI86ldJ4krOTKVoYdgOcniEjE3VPf77t6lqIlE4g/6E19xA+j9ponHbG0w0VTyzW
         0aop7ZK1rv3jg0tyGInc17YT+8AFwcorthh1auaL3LHp8G9yzGKNe0AnnQ+Q9gDCwl7o
         hqVT8FCFWZ8LTKOrG7So2UbYFHkvbI6qx3OnNr3Gy+ztL5n/WXruixk69gSY9xFguN0J
         7x+fV99VhuP8LiSKKPcQkDL7AeV1S9DwnsTfqjitos+QhhWY/NKMtZsTtn2sQsOzMq2Q
         FfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778370553; x=1778975353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTWs0LqAN8p0BSW2QxB0AUxJatTBkeIozGkYaF1zL/k=;
        b=FyNPvbA0yYYfk0boRFb33OwEWChXkFOTwR/3hYZNih7T1Fv9dQlfvKYcptElKhiRwY
         aM6ZkU33W4kwT8J+04SFWpF4MDuob9N2N+T6QUa1+kK2CuCw6ilEzPg1Nxzs2SLWyip8
         iKCU4HXNY6H0vsHhXZQqqNLphLA21R3OhbHrxlUxXwMhEzpbsu/N3FVsVP7FfEjfwff3
         0nXaPKYBe+vDAN1rTFlOpqCd9AbtpMSPLB4MpWa8Hpyt4WZoERXAGrWaQOx3cUcTmw1f
         MkCPKSaZz0BhIsO1WskUe8a+pdD2IzGIo5IFAPxlP4hCiXnZCAtrfLkMfWR+T8Wa5AeK
         VbGg==
X-Forwarded-Encrypted: i=1; AFNElJ/D53fp2/ulH0vTEAV4X/SUshHgpaihbhPiAsvX9BhvEl6WBlwt1l/lsEgvGWs8AMjR2XB83PVUrYIwzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNfG5iPPtx/yQXbDBc9q0kpaDKGWqbz2Rlm3W4Ho3OVaMQtEQN
	VniEj2QJNwe30cLiU0Dt/KJlP+Qi0o0kqimkrFSCYcZpZHstmfsacATC
X-Gm-Gg: Acq92OHL3PmHxroypERvYZjsY++ndgVvCECojkxQMDWM25xYwBheYskaVrBdYoaj26+
	1zUgNqYE9KC5Lpr0pAPVv1WeweDdcJodBXq6VP3hnB5yUCFaYt9zJJVBfnFzTcBStGbYy3lDK/O
	FWZDjSBdpH8OWj4dyxfGYeXkWrVdT6/xi0xowmeRP/pnVjuE+GkT2+b7dtuUgKhUF2gpGuPbNKm
	mpHAhGGnthkNeKHIBFQ13TsUu6D7+hgC2mKNoGpEGyrVFK6bQzWumxnoH0R3tgoPAwQXX9hkei/
	gcfPG+kVyJUFboiTetMKKxtf1fSu9sAshgSVe7dxFoNzxUT0qaCeuFUY1LZtqUR5PwtXsYeehmJ
	IXYVSqMxNxkYGeJ6VHVaSO87nqhzcbWGfCFIxfMeJdAfHa19J/23Yn7A+y7URtJ+xBmSBP++1HU
	YkUIDzcgtmngF3t8RnMJ8unhCkZ+LsHp5UmfJkDVjXvPrjh7sDOXFWgA1qOj9HJrxc36mus9/L
X-Received: by 2002:a05:6a20:6a26:b0:398:7c6b:8615 with SMTP id adf61e73a8af0-3aa5a901fb6mr20211628637.6.1778370553337;
        Sat, 09 May 2026 16:49:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771018bsm5248935a12.17.2026.05.09.16.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 16:49:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4a886ce7-9ddf-4fd2-8c39-a4c97373d168@roeck-us.net>
Date: Sat, 9 May 2026 16:49:11 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] hwmon: (pmbus/adm1266) RTC fix, blackbox, FW rev,
 rtc_class
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Alexandru Tachici <alexandru.tachici@analog.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
 <53d965b4-ab1c-4cb1-9fc3-c99538336d53@roeck-us.net>
 <CAGYn4vyDi8Z2i4mvuEZEP-nXCOO-X393=UuaogWJ9k3sXhQ8nQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAGYn4vyDi8Z2i4mvuEZEP-nXCOO-X393=UuaogWJ9k3sXhQ8nQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/9/26 14:58, Abdurrahman Hussain wrote:
> Hi Guenter,
> 
> I didn't see any feedback. Checked my spam folder and nothing
> shows up on the mailing list either.
> 

Your return address is apparently

Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>

which I guess ends up in /dev/null. I don't know why the e-mail to the
mailing list gets filtered out.

Here is the feedback:

https://sashiko.dev/#/patchset/20260508-adm1266-v1-0-ec08bf29e0ce%40nexthop.ai

Guenter

> Regards,
> Abdurrahman
> 
> 
> On Sat, May 9, 2026 at 7:14 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 5/8/26 16:33, Abdurrahman Hussain via B4 Relay wrote:
>>> This series fixes a few issues in the adm1266 driver and fills in
>>> some gaps, as listed below.
>>>
>>> Patch 1 is a wall-clock RTC bug fix: the driver currently seeds the
>>> device's timestamp counter with CLOCK_MONOTONIC seconds, which makes
>>> blackbox record timestamps non-comparable across reboots. It carries
>>> a Fixes: tag.
>>>
>>> Patch 2 writes the 16-bit fractional-seconds field of SET_RTC that
>>> the driver was zeroing, restoring sub-second resolution on records.
>>>
>>> Patch 3 exposes the firmware revision (IC_DEVICE_REV, 0xAE) via
>>> debugfs alongside the existing sequencer_state entry.
>>>
>>> Patch 4 adds a write-only clear_blackbox debugfs file. Devices
>>> configured for single-recording mode (BLACKBOX_CONFIG[0] = 0) need
>>> an explicit clear once the 32-record buffer fills; the documented
>>> sub-command ({0xFE, 0x00} block-write to 0xDE) wasn't reachable
>>> from userspace.
>>>
>>> Patch 5 exposes the non-volatile POWERUP_COUNTER (0xE4) via debugfs.
>>> The same value is embedded in every blackbox record, so the live
>>> value lets userspace match a captured record back to the boot it
>>> came from when correlating logs.
>>>
>>> Patch 6 registers an rtc_class device backed by SET_RTC. The data
>>> sheet (Rev. D, p. 22) explicitly recommends "frequently send the
>>> time stamp to the ADM1266 to synchronize the UNIX time and reduce
>>> the time from drifting" when running on the internal oscillator
>>> (no external 32.768 kHz crystal). With this patch userspace can
>>> drive the re-sync via standard tooling (hwclock, chrony,
>>> systemd-timesyncd) against /dev/rtcN, with no driver-specific
>>> sysfs ABI.
>>>
>>> Patch 7 disambiguates GPIO line labels on platforms that fit two
>>> ADM1266 devices on different I2C buses at the same slave address.
>>>
>>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>
>> Please address Sashiko's feedback.
>>
>> Thanks,
>> Guenter
>>

