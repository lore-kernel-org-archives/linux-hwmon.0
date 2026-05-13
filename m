Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE6440DFBE
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684299; cv=none; b=JzXJSFgsPhvn2fj1U2AWj6u1YMCKPIojubgyrExt7xuzi9lx1Z2ynwOFDz/RNtpyYbgtiY0LUgQQrIE4TMceKze6R02WACq5fUsLr5UEeMruNZZwyQYw2gGuP6u6k0U0AcaCZR5QljuI09ZibwrrdHr9v3LsDvA+KocqjwHSYFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684299; c=relaxed/simple;
	bh=5O3pCTm8go/4siR6UW7KhWj0+BQRYVJVjMwRvScehpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f66rt0NG/lB42fRVX/xRhuLnDqaAfxwWvuh+sAAkkQJ2JoA3ZSEa9kWY3gXn56Z0Y920/Csp0rK1wi0BWKhlk91/qZYMlP6uhUvDK8n7hlegNozI3z8vs9s7+MWeMYrYjOdfJ7amWsdQ8kSvaaxxGhxMF8h66sZVahuwwkXyvFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPmOLZbW; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPmOLZbW"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-134ac81c445so1301519c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 07:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778684296; x=1779289096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=H61Rovecf0gk3IUd9MnUqizjlsmcze7qE6Lvre4+Ick=;
        b=GPmOLZbWn45hzt3hvUsrg/WnSHT03QLPVItRSesJ737no4hUZGzU/nYf06Dgv7Nuw+
         lEtGdn8c2lByNZY7xFPpPRRbYLRQBO1pmb12RI567mfrBNlM5S42hDmkJmO3eVaWGRHo
         +5NFYiOCO8SbOBPMwMOohewlsSDTU5nu8zXQI7cnxOhWoX/c+E+2g/38kTiG70H/kyT0
         OqQ2PAc+hO+r3t/BTQ2qawd734bqwDDAzaVKo2OAqFOY+e4koXyLMqOgJAc7JW+EKjFI
         GaEKXyrWeW4aJbptt0lbLKSZNbd6AJoQIh6jK6QVuRsQHqRkl13GDZPKBfO54A7WlrP9
         rbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684296; x=1779289096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H61Rovecf0gk3IUd9MnUqizjlsmcze7qE6Lvre4+Ick=;
        b=n5KjR3+mtrzwcaoPCjL8FwL+8BBr2whV7EjyIZjZXeOHvdvXRCwxjgRr+pawwzwTM7
         cYhA4pk4D/Y82SlKbohJI9/QVBppteLG8GpZnxo42fXOKR7lIFOMchrwEsufjDXfX+G6
         RUsyUBH4DRAUyBIjMqBr0Mj3TY4wORy3GwZ8akH3/UQawc9/4jUlg+KkYpr8qeRQcQl1
         m40yKZAsJlSBpTe5ZXIadLAhVSNDAABCb1fk6p4QXty9limvV6u7QZRQcWgEJGr/eJ0c
         FGpoc6o02TrRZxRXTiDl4+xMFMHbYMKbTSSw8uuF12Bnsr+090dmk5DZH1duSD3WE7Pd
         bJ3w==
X-Forwarded-Encrypted: i=1; AFNElJ+8K5XeqMeSRm8IQU0QDHMSE43ZkCwXaMkFzMLbXp3M86tmWkwYWypDjzgWnfMl3r0AbAu2k0tYMLzyYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Ca4NSR4QZdNMyJLIkCxLJfCUxfZXbl1bsaLyGaqW4+nnG/Aw
	bE4C4gWdduyrbYYaa/CcevQ5qN4UonxLZ5vQB58sSxDtXtMP0A5GZyfeTOd4kQ==
X-Gm-Gg: Acq92OEpCcpT2oHrfB/omv7jVFgu+6v5s0rhrKdAAAe7S98n34/gXIh4hC7TZlzk79H
	DPBcaMOk5ldx4OeJvOx1JRjiCIBaocZAXJnbjInyNTYpI6EODvJgMYDlbt6pjnl2Uw1lZbU6SL+
	+TPfikssam8pvVZMBOSV783B7Jqfk72XNTttr3vT3NWRIo/O3zIfsMgOaWVc4/PgOzlrRbwtJwj
	W3h/Y014TvxCVa7Wn6LtWvZEAxAYfkPZhIaO9L/du+c0HLGfFBlFHMN2noUi37H8fKzG5UHWiQj
	dOe7NPrcRzVnqBuEBj7ePZdBnfJgA5Sg/1up08a3qGARBkJXeesia1I8Dzz1KDGebUlO5lqEVLB
	VNGFptHR2o93hcuwdFWdiAte0mKdZ2kTv8MFT3iHDUSkH/P5cLhqmmJU5TOPgSwKBjFgG04TmKV
	ytRpqgGyB+YPrTV+Dj6LRuGy/er7HRhlNj2fq0mDlR1H69bmLwaorqDPDMKjH4dj+CyJxYsvAr
X-Received: by 2002:a05:7022:1603:b0:12d:b7e5:a691 with SMTP id a92af1059eb24-1342ee3f0d0mr2410236c88.7.1778684296050;
        Wed, 13 May 2026 07:58:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327865955fsm29826840c88.11.2026.05.13.07.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:58:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <254b59a8-182f-4ad3-8469-4f9e9511d3a5@roeck-us.net>
Date: Wed, 13 May 2026 07:58:14 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: corsair-psu: fix and readd locking of command
 buffer
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <agR9YW7hGTJ_l7ms@monster.localdomain>
 <5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net>
 <bde0fa1e-93a5-4819-aa19-04554c24d31c@roeck-us.net>
 <20260513162135.2893e42d@posteo.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260513162135.2893e42d@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 07:21, Wilken Gottwalt wrote:
> On Wed, 13 May 2026 07:05:41 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 5/13/26 06:43, Guenter Roeck wrote:
>>> On 5/13/26 06:32, Wilken Gottwalt wrote:
>>>> Fix removed locking mechanism. The locking mechanism does protect
>>>> chained commands (set rail + get value), which are two separate calls
>>>> to the low level access function. The hwmon (temps for example) and
>>>> debugfs (uptimes for example) subsystem can trigger that chain of
>>>> commands in parallel. The serialization in the hw monioring core alone
>>>> is not enough.
>>>>
>>>> Fixes: 4207069edbf0 ("hwmon: (corsair-psu) Rely on subsystem locking")
>>>> Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
>>>
>>> You'll need to explain why using the subsystem lock for debugfs
>>> accesses does not work.
>>>
>>
>> Clarifying: "Why using hwmon_lock() / hwmon_unlock() in the debugfs functions
>> would be insufficient".
> 
> Yes, I understand that. You gave me an idea for a nice "hack" that would
> demonstrate the problem. I will try it and look if it really happens.
> Though, my thought process is, that debugfs and hwmon are two subsystems
> which do not run in the same thread context. Each one of them would
> trigger a call to corsairpsu_request(), one comming from a *_show callback
> of the debufs and one comming from a hwmon_ops.read callback.
> corsairpsu_request() often calls corsairpsu_usb_cmd() twice, one for
> setting the rail, the second for reading a value of the rail. The mutex
> protects that chain of calls. I really don't think that the debugfs
> callbacks are serailized against the hwmon callbacks. I could create a
> nice demonstration if I passthrough a little hint via function parameters
> from where a callback is triggered. Do you understand, what I mean?
> 

No. That does not explain why calling hwmon_lock() / hwmon_unlock()
would not work when called from the debugfs functions.

Guenter

