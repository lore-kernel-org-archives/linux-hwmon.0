Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F123A5426
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 21:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779314306; cv=none; b=IB8MnueQW0WzYbOTaeFloo/i+c/K7/9xQJkO7XauQABmORaXvOmKeRF0t3SDgplwFUVwm0m7sAHo8Ulo9BklYBeL+G1KzK75dYi0z0BmtoxYFgOi+WG4RBA6LYjdHmxQCeiLtp/ZR86x99XbHBz/SWl9Ky1RhM5WE2A+nIgL1f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779314306; c=relaxed/simple;
	bh=ZJKCNJx/5IZ/imrwcqhHUrotj+Eo0tiqecZnQykyYOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iE1NMXLhkFHBkcb3RcXtR+KKOpKagB+BW+5MLPqkK32Ia4BVTsrtmKkJ1B7zYWOcaGbf4KaPx0c1x+a1qpog2XS1JM50E2xjXvr9mGdMBkp9Bc5KEW6uU9wtuh5INd4PuRmXKs5EUE2CM6hYwaBzGOu7nt1RPkqKpIjKg0bvl44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSEbJw1a; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSEbJw1a"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36a3dd2e66eso186459a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779314302; x=1779919102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=J81DA5Ki03IoGYOcCJh6J9dCQ0EPDVhxT9au4TbcbO0=;
        b=QSEbJw1a+VZ/sKYE33oaSZRwDAu/4S4mZtFTs3U0udssAcEqAJ4X+K/Od7q6jMPVjw
         pQY9wP6kLoeSgTWmiiSxxovrT9UeoA8xwq7f5YTcM7TENPjYssv0PoeOb0cWuWX1U89h
         2TJsL+rugIqnop6Zh+1xskS/oD8nqr0dqO4kfYAG6qDWtu2EEZCvj8GIJL4fAKe9Atwd
         nIwpn6h8ht3xQDp30B3+392466blVxtM74ar2BRJgOnpMQhMciY0EsAAGrtH4W0qy6Ht
         nPil5j744XYcJDots5xYBwaJYpCXe7VhqNps8tIFMIr8/hc7k8Rd4GE/irekdAgQE9K4
         W5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779314302; x=1779919102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J81DA5Ki03IoGYOcCJh6J9dCQ0EPDVhxT9au4TbcbO0=;
        b=JsQ8ovQ0S56m3u2Bbg12y13/TmEfRAJDPyWyiWZHOiwmEJ1VtbDse3jr+udPBY2pCS
         W6tGcKkhObpv0/ie6HIStCoJdr7Fj+GQcpeXxUKqolf9OhliU+JosQm7jjDMEC3tRLke
         XvC6JuRNxWHWS0d+xsyOtAeD/CE7OJ23bLEIqv8NYJ9FZxJjkbAGLLbBXfLprCWz2utI
         k2pPqRXNhF5Sl9OCXmjsQylybU6p9k5FbrkpYDeb9NFktx/YXcGDXbJb/xkTDw4lclen
         BwPsQyPNMwZLe2aHhHEWp7nJrAgRyD1QsggHlvqnSXojohSo9bXNQTIzVWTw8k/p/VD8
         7Ifw==
X-Gm-Message-State: AOJu0YxxtMvSVwYEJktSrmA8MnbMcFzDN7Ws9ksy+1lkxz5PArNLkNa1
	t8k1qLRIz/4GczHKn8W2wEPzoJfVGerS7bMTobDO8o0E61YKsKRsWpg8EnaSbKsg
X-Gm-Gg: Acq92OG0hGoCSBcVCSrld0BcRUjCrwGCjgZsB5un7RVlbSxM+lYTZL/KlStO97K717G
	oAeH+3Axcj4bPgNZcJLk/zSjwcRcM2mTOojGH+p3MOkI7mKCb1TEv7VZmnAjvs8OT7Bi6NUrYT7
	EQqT/PleZidn5pg/s3jXFmnxw8qGCrwVxlvJaHE+sUXj1QQ7AQ2SyEiZg00P88Y/0M2+3DE14mO
	rOmfbWXKzmDq8qxiZmcAMdHro+pVxXt4z2BgYIaD17h1BQk4N9jiADXdXBvwkSypUNHZwHWzOL7
	L1HQtbJLpsZ8Ugdt1wsMUmWw68pxIVKqNVFtJFEAFQtTKOaoy/hH3sSCrm9GHnVY2rskB5Q00yD
	+y3ggfZ4sOEwJKZcFppIqnrPVY0qFjtfEZqboJqEXIxjlGYQUOu+nAjR0gEszG7hLFKyjAFUEEW
	WjW0DNb8UdP7LQIzMIKobTVHowVx1v7o02R1mO6BNnOZPZQP6V+Py0lZTNFfni1pl9KXhXWxuMF
	88ZE/eErwrzkQ==
X-Received: by 2002:a17:90b:528a:b0:368:147f:bd27 with SMTP id 98e67ed59e1d1-36a45758617mr266709a91.23.1779314302401;
        Wed, 20 May 2026 14:58:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3d0d847dsm563006a91.10.2026.05.20.14.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 14:58:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6cae33e8-410a-4ffe-a44f-642f2239323a@roeck-us.net>
Date: Wed, 20 May 2026 14:58:21 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] hwmon: (pmbus/adm1266) add clear_blackbox and
 powerup_counter debugfs entries
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>,
 Guenter Roeck <linux@roeck-us.net>,
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
References: <20260516-adm1266-v4-0-1f8df4797258@nexthop.ai>
 <da0fbce2-788e-4419-8ca1-975311951ce3@roeck-us.net>
 <DINO5GQHP6VK.ZBC2D5ENBYKW@nexthop.ai>
 <DINRCDZ0SHS3.1X4T3VVLSL36E@nexthop.ai>
 <1783d74e-6acc-40d2-bdff-9bacbb04032c@roeck-us.net>
 <DINTFDZ1H8B4.FZ50CYI6WTVI@nexthop.ai>
Content-Language: en-US
From: Guenter Roeck <guenter@roeck-us.net>
In-Reply-To: <DINTFDZ1H8B4.FZ50CYI6WTVI@nexthop.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/26 14:18, Abdurrahman Hussain wrote:
> On Wed May 20, 2026 at 1:59 PM PDT, Guenter Roeck wrote:
>> On 5/20/26 12:40, Abdurrahman Hussain wrote:
>>> On Wed May 20, 2026 at 10:10 AM PDT, Abdurrahman Hussain wrote:
>>>> On Wed May 20, 2026 at 7:10 AM PDT, Guenter Roeck wrote:
>>>>> Hi,
>>>>>
>>>>> On 5/16/26 18:18, Abdurrahman Hussain wrote:
>>>>>> This is what remains of the v3 series after Guenter applied patches
>>>>>> 1/5 (firmware_revision) and 5/5 (GPIO line label) to hwmon-next, and
>>>>>> asked for patch 4/5 (rtc_class) to be dropped.
>>>>>>
>>>>>> Patch 1 adds a write-only clear_blackbox debugfs file. Devices
>>>>>> configured for single-recording mode (BLACKBOX_CONFIG[0] = 0) need
>>>>>> an explicit clear once the 32-record buffer fills; the documented
>>>>>> sub-command ({0xFE, 0x00} block-write to 0xDE) wasn't reachable
>>>>>> from userspace. The patch also acquires pmbus_lock at the
>>>>>> adm1266_nvmem_read() callback boundary so the memset of
>>>>>> data->dev_mem, the blackbox refill, and the memcpy to userspace run
>>>>>> as a single critical section -- the nvmem core does not serialize
>>>>>> concurrent reg_read calls.
>>>>>>
>>>>>> Patch 2 exposes the non-volatile POWERUP_COUNTER (0xE4) via debugfs.
>>>>>> The same value is embedded in every blackbox record, so the live
>>>>>> value lets userspace match a captured record back to the boot it
>>>>>> came from when correlating logs. The block-read is taken under
>>>>>> pmbus_lock to serialise against any pmbus_core PAGE+register
>>>>>> sequence on the device.
>>>>>>
>>>>>> Patch 3 takes pmbus_lock in adm1266_state_read() (the pre-existing
>>>>>> sequencer_state debugfs handler) for the same defensive-locking
>>>>>> reason that motivates the new debugfs files in patches 1 and 2:
>>>>>> any direct device access from outside pmbus_core should be ordered
>>>>>> with respect to pmbus_core's own PAGE+register sequences.
>>>>>>
>>>>>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>>>> The series no longer applies after applying the bug fix series.
>>>>> Please rebase it on top of the hwmon-next branch of
>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>>>>> and resubmit.
>>>>>
>>>>> Sorry for the trouble, and thanks a lot for fixing all the problems
>>>>> with the driver.
>>>>>
>>>>> Guenter
>>>> Will do, thank you for your support!
>>>>
>>>> Abdurrahman
>>> Hi Guenter,
>>>
>>> Before I send v5 of the adm1266 series, I'd like to revisit the
>>> SET_RTC exposure question from your v3 review [1].
>>>
>>> The use case I keep landing on is the one the datasheet itself
>>> recommends: a userspace agent (chrony hook, systemd-timesyncd
>>> script, or a small periodic daemon) keeps the chip's seconds
>>> counter aligned with wall-clock so the value embedded in each
>>> blackbox record stays correct across long uptimes.  The probe-
>>> time ktime_get_real_seconds() seed (now in hwmon-next) only fixes
>>> this at boot; the chip's counter drifts after that.
>>>
>>> You ruled out rtc_class and called a kernel-side periodic timer
>>> "a bit excessive", which I agree, it is.  That leaves a
>>> userspace-triggered sync.  Two debugfs shapes I'd consider, both under
>>> pmbus/<hwmon>/adm1266/ (alongside the clear_blackbox,
>>> powerup_counter, and sequencer_state entries v5 already adds):
>>>
>>>     A. RW since_epoch -- mirrors /sys/class/rtc/<dev>/since_epoch.
>>>        Read returns the chip's SET_RTC seconds counter, write sets
>>>        it.  The read has the useful side benefit of letting
>>>        userspace measure host-vs-chip drift without writing.
>>>
>>>     B. Write-only set_rtc -- writing anything to the file makes
>>>        the driver read ktime_get_real_seconds() itself and push it
>>>        to SET_RTC.  Simpler interface (kernel owns the time
>>>        source; userspace just triggers the sync), no payload to
>>>        parse, no way for userspace to pass in a wrong value.
>>>
>> How about a combination ? read returns the current value, anything
>> written synchronizes with the kernel rtc.
>>
> Going with that for v5.  One naming question before I send:
>
>    - set_rtc -- matches the PMBus command name (SET_RTC = 0xDF), but
>      "set" reads as write-only at first glance, which is a bit
>      misleading for an RW file.
>    - since_epoch -- mirrors /sys/class/rtc/<dev>/since_epoch, but
>      that one is read-only in the RTC subsystem so the dual
>      semantic might surprise users coming from there.
>    - rtc_sync -- describes the write semantic directly, but leaves
>      the read side unnamed.
>    - rtc -- shortest and most neutral; doesn't bias toward either
>      operation.
>
> Any preference, or should I just pick?

I like rtc_sync the best, but I'll accept your choice.

Thanks,

Guenter


