Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1C9351C29
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 08:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834913; cv=none; b=XVNJU3/eUc3De4toRc6Po/wpttFRwuEmyG+C8vlBJA1wuaLBs/s3flTg8XibWNHzhSs65ZRV6ZLu/PvLnRpP86Z63L3MbaV/I7vCmcUKvVfU7SmGS7r48pomVvJuapykJ8eLJCxVVG7KLjgY6aybjhW4jRGOHCouAilE+8wZSUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834913; c=relaxed/simple;
	bh=Pnd808UBff4GjC+i21qzNAko299+7qljAWX0u/GlnyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lPcNu/I2dzgj5gFlbRM2J496NV7c9XPLKQh5g2+d1c6XyXuvuTXaPso1kAEfh56aFxe0mQPEgeyoXKAM3DdMGDXSPTuRGXBOn5Awv9Eq02q8V2gGou1nrTL37Tiyzj0ifZNwUHRZ3/qQXBJPy3JhPKKibK8D1QSoX2erzK2Uqzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9kAMB+K; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9kAMB+K"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f0ad52830cso13241733eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 01:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778834911; x=1779439711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=T8BhEeyim7dMCP6Y9mo9cuIYca3GTiBV7wuxQ8auLf8=;
        b=a9kAMB+KRfv5jvytSHy9hvlLFk1Iz/lIh7Iy7VCQdqV5lRKXYYAihzAZ6XK99C8eZ9
         7fC/Kql/3TJl0qZ4gmfZyWAuajFW236Mp1cKRPps/mEOz/IikiOH6LiB1UEPMW/ryYpV
         DlGyHOBBfFsfPgw0O/VSu5FFhXC5ejo5yjLxNdVfpF9DubqgOsrM+e4zMCViKR91z4zW
         axvSy41bkVCB2h84QMOk22ytikO4pgb4kljqWHm6EZd6uDZ/CGJ6ZUi8ZhGwm0/zhGdW
         5SIdhW8pdX6vRP6s4+BPDXOFIe6HIAntNqgdDyJO+nwzLrvMowDwf9GqUJ8Pny2mTGoe
         mKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834911; x=1779439711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8BhEeyim7dMCP6Y9mo9cuIYca3GTiBV7wuxQ8auLf8=;
        b=DK+kSTH+E5BC74RHiLgIdGl3xlT9Dined6SyIxAUat4ClOVM8yrqa5X9c2tZdczbcO
         o+w1HAiSpDcYsFEMUVo1D+6aCvF619XZMzIbEg6d6YJmgqZwyk1eqF0iabLJVHLfwCZw
         H8qeDjzVFreEVSwBDKmJj8X8eJKzK3vw+jqtAVToHD15UFv9Ofz86rnhydkYYSb4+vkK
         bzk9dCMDIiJlnHrFkeCJMVJyMvxWDpEpueYd9WDuxZl0ULjR9dMOtHayl9okpa6Y1Fxs
         VKt6YgAXHOh6yFDwPESBXsih7gOgxvOHi2zULAKCRRP76vF+cFvlO6UtRoztuuC1xHfG
         UzMQ==
X-Forwarded-Encrypted: i=1; AFNElJ82hV89aLn4rO4z+b8y3bCO8VOV9DndckY7mHhBPDwdv0c4zgx0Dd5D4QOYQzgonYJRYI3ch99pdcw71A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb4/EwqPkK6q5TX2XvfYG29eg5DnWxQ8Wk2IU4KIQImNUfm2nF
	SCawjOQGa6abx6lvYtV1UnxUPwkYf4CafAATT/OPtgtfFRIqn9Ahy3CoPxGxeA==
X-Gm-Gg: Acq92OFXBl60NfkmuT4mjIbah/PRlML/UxcIXvBv0i2gyIgshJaRgPVdpN20edQPoYu
	xz3mRPUJ61+zpO5G0H0ynI5BAwQPRUSFPAUj+Vak3h6xtm+l83Ttd6wiCuA+ZlGNg+y8G9kLiuJ
	+Drnkf5MhGqLZ1TuXkGFM+Erq0qGLCMToTwpEtgrcCVty7iLYtANpxyKLPcGFJqfGeT+tu1/+I9
	lhHJSbxHeHFRxLbCKDM85l3wwW19bNhnF7igc9fQVvjZGSGgH/Q08Y6tub3lZ86Us1idpZVa2Wm
	IxfG+goWhkw63630aI1ETWq5EzbKTkCE4eD5U/qGDpr5hYhZ/BAMSA9QalojVRpwNJQYVD87fTp
	exrhI6CpC+0N9kZpIJ/NTwkrjvCRwv4qDJpnelX55qdFtl7NAt2oZAoPXGnczFFDRqTeWOx03eE
	CiYxqCxDScKBXhrfw1GB1lMoJdBK5tjoVKeJxPz2WT17ZeIxkIRUZEg95cShBUQLWgku1d8QI1
X-Received: by 2002:a05:7300:6c12:b0:2ef:8b72:1b9 with SMTP id 5a478bee46e88-30397bc0584mr1725169eec.0.1778834911436;
        Fri, 15 May 2026 01:48:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500726sm5808336eec.10.2026.05.15.01.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:48:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5f598d37-deff-41b0-a81b-c618f0ab3339@roeck-us.net>
Date: Fri, 15 May 2026 01:48:28 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: lenovo-ec-sensors: Fix NULL pointer
 dereference when DMI match fails
To: Kean <rh_king@163.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <c808d5bf-b166-432d-864e-db0536a3f4e3@roeck-us.net>
 <20260515081010.32812-1-rh_king@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260515081010.32812-1-rh_king@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/15/26 01:10, Kean wrote:
> Hi Guenter,
> Thank you for the review and for pointing this out!
> 
> You're absolutely right. I realize now that my patch was overly
> cautious — in normal operation dmi_first_match() can never return
> NULL here because lenovo_ec_init() already guards the probe behind:
> 
> 	static int __init lenovo_ec_init(void)
> 	{
> 		if (!dmi_check_system(thinkstation_dmi_table))
> 			return -ENODEV;
> 		...
> 	}
> 
> That said, I tend to follow a defensive programming style — checking
> for errors and returning early whenever something looks even slightly
> unexpected. This is exactly what lenovo_ec_init() itself does with
> dmi_check_system(), and it's also why we often put a return (or break)
> in the default branch of a switch statement. So I added the NULL check
> for dmi_first_match() as an extra sanity guard, even though logically
> it should never trigger.
> 

Maybe other subsystems accept that nowadays. Historically it was considered
waste. I still consider it waste, and I won't accept it.

Guenter

> I should have made this clearer in the commit message. The patch was
> meant as a defensive sanity check, but my description made it sound
> like an actual reachable bug, which it isn't. That's my mistake.
> 
> I'm happy to drop this patch from the series if you'd prefer. Please
> let me know how you'd like me to proceed.
> 
> For other parts and the format issues is my mistake that missed the
> --strict to check the patches file, I will send the V2 version, hope
>   get your review, any problem you can tell me, I will feedback and
> tested as your requested.
> 
> Thanks,
> Kean
> 
> 

