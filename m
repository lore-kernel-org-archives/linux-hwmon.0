Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE845374E7D
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 20:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779310748; cv=none; b=MK7gUIoofqZAoQLAixsP7QH0sU0TOj8lP7XsM4j1GPmPETgfKj4X9gnp7LwM8ukLTSIL1YYOqw3ghYxvnB8KjBGSj8RJgXHWtN2raqDp2s19Etsi5n4tiaicezg7rlzb2cPNjkSN4yTX+RDdImcnciHbb72yVfDkCd8vNkOs2Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779310748; c=relaxed/simple;
	bh=ixoCgyJrbUFbAAbfJ/JQgZKkSDKCSy3cuaMIsNX9m9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4iydVJ05zOIAYsbvIMJ8gNtMVoJSM8oJR1IiY5ZmLH4Ki94MRdkZeh30ldFhsNsSGuPR+TVKvrkARdhGjJWBQJat4pUlUBq4t1+CxreZtV51ajFD5Em/iS+dMqX8ANHrk0c8aPgY9eitDA4qNtMKvKl0uQitKSqJstxBLmbuO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiwyHAtJ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiwyHAtJ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c827313dac0so2906056a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779310746; x=1779915546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=y7aqJm2QFZkDCNJszE1BVgA4d8GhcjAWMrwClSCja/w=;
        b=eiwyHAtJgFVPxwK+G+TubxBJ0tfRON4qidn/jm4grquEBRRZNC8uABtqwdjNpBfqMm
         OdQgscqBTHDA7PLkQEyXdQ/tOBxAooL/s+k5BeSvwE1lmHDPLzXXC+RRrvWmjT4UxqoM
         Jl5gk0zYHpve72TwSEdvsMSC6f6HBvuqFsc5/8ZdN1tSgK7SIDDOfti51+E8XBJkEWDx
         0anz5H4w98RxWwaJVoyQdeLQ+eJYixyje4g8FHaNXIJ+G+T+cYLHatiUbwneleeuqN6n
         7xOiYi9YwplNdQefUsoNV8TvW17YnIk6+S8z9jyznF+Uc7CFzOqmGlAjVB+/B2oDI07T
         bWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310746; x=1779915546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7aqJm2QFZkDCNJszE1BVgA4d8GhcjAWMrwClSCja/w=;
        b=bjb2Ws/tPeMp8Un/NWzR/34951wU2EEqSJI2VDLkpVBniKx4rxnOjo8OE2WglWGgog
         a59j/ir3pWVZkzAhdhn5BVzNM5WuvlkfEoxSJDjsESYU1F3F/Gwxvuslth2u/fa8/88o
         Qp1nVGphXL7VW6SCewYhYaoHMy6qTTT55tGfoquRpQlv1GZe4JOm4rL24GWLMQeHCh7R
         ymVWzv5+N+Be9IucSoLrFY/FfgncJ4ztY67MGdKhqCMc8j80XA+BON4AUpu2B4wp4r+J
         Nt16Oqf8aZ4064JcjuyouqUsCfJzs7GNQ5vCw/jQgTOwaCArBtkEMPw6SNMKbMBj6PYN
         vMEQ==
X-Gm-Message-State: AOJu0YzX68crTHM3GmCH2AT55aQOnJAhwOLSzMm4yLAHUZ0Hyczj87ge
	jm2xk9Zt203uvbbkL3VJEvGweg/yOASHQieMvaVL/TBW80zl9QeHGkU+
X-Gm-Gg: Acq92OFrZlnSDu88VL93aehdjfuBzDw2WIR1EqHiZUGqFCUdeKnAf62Op1YDalTJE7h
	hqpu9yVW5rXFcgcwfyP21PdmddtkzeJMOken94k4JOWXELFfXl9lbLJjruy/cpAPbfl+ptxCKhp
	NWfSifUusG19gr2Rwo3uPc4QNcqQuDqsgfM8gQUNZ0KVaFsFm0zFNFLH9thrdpzfZeUULOlp32D
	9lTPOUd2k3Mf4sa0dFLXPXe6BTsI5pBarB3cGl5RnvBsBa7qP2RPmmCFjZbJbCdnkumJAANNpNk
	lx//HflQISbHTcdeIwWH6gaQDZpaDNRBd3/Pgcm4KWwL9xCa06cGNXD+JIamt8Hggmrk/Mz3gMz
	iQEDSIodpgpsWW3pzYUGYAU/7rHJMDsQiapYRCCco5iLGdCSAOzPYFT69s443ymvV4SLO0tvJng
	To4Rs5BY/8/EMxNFZh/HfOyX2VCcEuKSE/Vj2uhsEME8Y3TcQaDOf/azqihA2Rc1dcsoTHJ5yR+
	eH6JkT0ks0o2aCkzlMN3w==
X-Received: by 2002:a17:90a:dfd0:b0:369:9469:aeba with SMTP id 98e67ed59e1d1-36a48dfe7d7mr18963a91.1.1779310745511;
        Wed, 20 May 2026 13:59:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3cd96253sm505153a91.17.2026.05.20.13.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 13:59:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1783d74e-6acc-40d2-bdff-9bacbb04032c@roeck-us.net>
Date: Wed, 20 May 2026 13:59:04 -0700
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
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
References: <20260516-adm1266-v4-0-1f8df4797258@nexthop.ai>
 <da0fbce2-788e-4419-8ca1-975311951ce3@roeck-us.net>
 <DINO5GQHP6VK.ZBC2D5ENBYKW@nexthop.ai>
 <DINRCDZ0SHS3.1X4T3VVLSL36E@nexthop.ai>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <DINRCDZ0SHS3.1X4T3VVLSL36E@nexthop.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/26 12:40, Abdurrahman Hussain wrote:
> On Wed May 20, 2026 at 10:10 AM PDT, Abdurrahman Hussain wrote:
>> On Wed May 20, 2026 at 7:10 AM PDT, Guenter Roeck wrote:
>>> Hi,
>>>
>>> On 5/16/26 18:18, Abdurrahman Hussain wrote:
>>>> This is what remains of the v3 series after Guenter applied patches
>>>> 1/5 (firmware_revision) and 5/5 (GPIO line label) to hwmon-next, and
>>>> asked for patch 4/5 (rtc_class) to be dropped.
>>>>
>>>> Patch 1 adds a write-only clear_blackbox debugfs file. Devices
>>>> configured for single-recording mode (BLACKBOX_CONFIG[0] = 0) need
>>>> an explicit clear once the 32-record buffer fills; the documented
>>>> sub-command ({0xFE, 0x00} block-write to 0xDE) wasn't reachable
>>>> from userspace. The patch also acquires pmbus_lock at the
>>>> adm1266_nvmem_read() callback boundary so the memset of
>>>> data->dev_mem, the blackbox refill, and the memcpy to userspace run
>>>> as a single critical section -- the nvmem core does not serialize
>>>> concurrent reg_read calls.
>>>>
>>>> Patch 2 exposes the non-volatile POWERUP_COUNTER (0xE4) via debugfs.
>>>> The same value is embedded in every blackbox record, so the live
>>>> value lets userspace match a captured record back to the boot it
>>>> came from when correlating logs. The block-read is taken under
>>>> pmbus_lock to serialise against any pmbus_core PAGE+register
>>>> sequence on the device.
>>>>
>>>> Patch 3 takes pmbus_lock in adm1266_state_read() (the pre-existing
>>>> sequencer_state debugfs handler) for the same defensive-locking
>>>> reason that motivates the new debugfs files in patches 1 and 2:
>>>> any direct device access from outside pmbus_core should be ordered
>>>> with respect to pmbus_core's own PAGE+register sequences.
>>>>
>>>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>>
>>> The series no longer applies after applying the bug fix series.
>>> Please rebase it on top of the hwmon-next branch of
>>> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>>> and resubmit.
>>>
>>> Sorry for the trouble, and thanks a lot for fixing all the problems
>>> with the driver.
>>>
>>> Guenter
>>
>> Will do, thank you for your support!
>>
>> Abdurrahman
> 
> Hi Guenter,
> 
> Before I send v5 of the adm1266 series, I'd like to revisit the
> SET_RTC exposure question from your v3 review [1].
> 
> The use case I keep landing on is the one the datasheet itself
> recommends: a userspace agent (chrony hook, systemd-timesyncd
> script, or a small periodic daemon) keeps the chip's seconds
> counter aligned with wall-clock so the value embedded in each
> blackbox record stays correct across long uptimes.  The probe-
> time ktime_get_real_seconds() seed (now in hwmon-next) only fixes
> this at boot; the chip's counter drifts after that.
> 
> You ruled out rtc_class and called a kernel-side periodic timer
> "a bit excessive", which I agree, it is.  That leaves a
> userspace-triggered sync.  Two debugfs shapes I'd consider, both under
> pmbus/<hwmon>/adm1266/ (alongside the clear_blackbox,
> powerup_counter, and sequencer_state entries v5 already adds):
> 
>    A. RW since_epoch -- mirrors /sys/class/rtc/<dev>/since_epoch.
>       Read returns the chip's SET_RTC seconds counter, write sets
>       it.  The read has the useful side benefit of letting
>       userspace measure host-vs-chip drift without writing.
> 
>    B. Write-only set_rtc -- writing anything to the file makes
>       the driver read ktime_get_real_seconds() itself and push it
>       to SET_RTC.  Simpler interface (kernel owns the time
>       source; userspace just triggers the sync), no payload to
>       parse, no way for userspace to pass in a wrong value.
> 

How about a combination ? read returns the current value, anything
written synchronizes with the kernel rtc.

> Do either of these look right to you, or would you rather I just
> leave the driver at "probe-time seed only" and skip a SET_RTC
> interface entirely?  v5 as it stands has no such interface and
> is ready to send; a SET_RTC patch can follow separately later if
> you'd like one.
> 
I am fine either way.

Thanks,
Guenter

