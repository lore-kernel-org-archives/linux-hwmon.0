Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91A01B425C
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400632; cv=none; b=rTE/LWZqi6urE1UZ5tu/UpP9dB1LmLl+tgUSWYXhlOfMIS5L06b5TrcAUq3wAPY3fyW2Orh/hLD5UAxgWbR3JxJmeM53bXcen3PQhQKfjOJuFEeqt9mnxuOGPXRqISrMcYmuvOml1P4hwpy/eDvy0AqxEKbA9eaQBdu1GF0x2mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400632; c=relaxed/simple;
	bh=4yI3qv1paP3863JGJN8EaT90z7WyLn3BHwc7lsAkj0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=rVqKXGaSHt/jwoqMQ0B3BXufwTVmFcL8fe8zmzG8t0K4DdmeWQERWwKIfkZzmXV82H8PY40EZZz5QGEd43I3G8PU/1FXEjadD5sPRsIRRmBDlLC2r7Dwa2+D3vxoxf+P9d/O8Vg78FCqD8iVJ1qWD6JwugbHEjgGhCZnWCuzIz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoVaa0M/; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoVaa0M/"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1233c155a42so122821c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jan 2026 06:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768400630; x=1769005430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VCTd1UeGbd16C0dw6Flw043UIl8ToTlwb18MsiPCF94=;
        b=GoVaa0M/ob5LP92LuigTci4rwd8AEn98ed69KJrtijjTKwZOQSNe6VaPoot8EdoJnO
         YAeeZCBABERSbrdLMCijuAqwLjBiF5xugIA5guZmDDaahAK6o29OlQBvAScp8e8jZ16p
         NhETAtoS6w1A5u4rclIFGka/r+6IKiSBx9Pocd1XFQqClKUnd+oS25VflweOtoHQNFZ5
         3nfJZOkO2is6fb3N64ZtRXYxHtJaOMJQDF7MjYFv7f9qnJiC8QuVNJ8j57WSYkxvy5Ry
         pj40t0Mwm7Etoij6Ic/g46PzTXzelhXBlU0UfzFDQ4lPx52tXuZra6ISlqkzHiE34sX+
         Ftqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400630; x=1769005430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VCTd1UeGbd16C0dw6Flw043UIl8ToTlwb18MsiPCF94=;
        b=JzgrasMXl20pXlBIS0jBPobnrmBAhluoffQsUWa//lcLoV1xM3KpSkP21EQclis3eu
         3KuJsUTVS2q9Dux1gubWjUq8QwmskicfWcFpQH34IxgxIASN0fmZyANdwNeJLMtyS9V0
         bQWoVaATOkWcnhIkCtZRnYa7Klo/dOUkbNN9LLYr+4X77Sk0TrHw6rCc9nFrLCD4KyAo
         wJlrrO6xXu4oZiV73GJCxqKVbi4QfrMpr5tJRfONxty6vHJ/fnctEEs9w86B7EHjKpII
         zCJsyJsCgYtZEsEdYpNLsGeL6Y88An6+TmfhidPdLt60OOqXDV2zz/jnYAkEQ9dsBXT6
         V8Rg==
X-Gm-Message-State: AOJu0YxKOplRc/juMzGAXih20zq+EuSEk0d1Fb/D4jKBt17qSdJGZc7l
	SaOaMzaHtmttizOG4wI/mQBmZTqQWqwUi2qt+e7B2m7+fCY30hEnB8tlIx9V5g==
X-Gm-Gg: AY/fxX6T343w//eiLw5SCyTg0iGJo3Me+sklmMBI84F30AAQvOI4wA5B+e06kGICDEp
	VfHM+YNEmt34UftzTfpkb5qFjG6U2RtEIdmaAEA30TIXdpTNcOfz/aFCtWx1J9n5qyoRfhTeSFn
	bdcedwDj540qg+Yu4cQxwkVo3HWzJV0iS3rY0iHakr89E0+nA8jEPjfGV8ruFM/ahgvlRVAQpS2
	fdV7X2aj0UXSPR4NWPKSlmst4+VTCK4SqD73Fu/BAveRinH4ZKnWEXChdM83QWaxxmKAHRVnDw/
	IXJR67NXq+tJEWG++1dSdxT98tv7WUv/RBN/T5EJCLZw677Yj0z7GOPfocXE9TcoHkF80HrXOyH
	3y04ZrOEitXWnWhRsFgsZMGDSyEgt0SW83CDx6zJomt4dhhv63cn1IiPMHj3nX8kUni9ezaCTpW
	JFjtJ1uSRNCewK3DGfeCTI7LOEayQfbbW/bArx6RxKI1adEsW0LoIq+J1nMIf5
X-Received: by 2002:a05:693c:374a:b0:2ac:2dfd:9ff with SMTP id 5a478bee46e88-2b48731ffeemr3380034eec.41.1768400629498;
        Wed, 14 Jan 2026 06:23:49 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b480dea94fsm1886468eec.24.2026.01.14.06.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 06:23:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net>
Date: Wed, 14 Jan 2026 06:23:47 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <c36306c5-2426-4a9c-9abd-9f3cdab17ed5@roeck-us.net>
 <CAJ12PfNkde6__QQXMiyBbEoHMbY3efmtsqgbyiKBtBmyfpX5Jw@mail.gmail.com>
 <2740c3ab-7cb0-4931-81a2-30b85e8615f9@roeck-us.net>
 <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
Content-Language: en-US
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/14/26 05:07, TINSAE TADESSE wrote:
...
>>> Hi Guenter,
>>>
>>> I tested changing the i801 SMBus controller to use
>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
>>> DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With this
>>> change, spd5118 resume failures (-ENXIO)
>>> still persist, suggesting PM ordering alone is insufficient and other
>>> firmware interactions are involved.
>>
>> How about the problem in the suspend function ? Is that also still seen ?
>>
>> Also, the subject talks about -EIO. Is that still seen ?
>>
>> Either case, can you enable debug logs for the i801 driver ?
>> It should generate log entries when it reports errors.
>>
>> Thanks,
>> Guenter
>>
> 
> Hi Guenter,
> 
> Thank you for the questions. To clarify:
> 
Please do not drop mailing lists from replies.

> 1) I have not observed any failures in the suspend path. The suspend
> callback completes successfully, and
> I have not seen I2C errors or warnings during suspend at any point.

Sorry, I seem to be missing something.

In that case, what is the point of patch 3/3 of your series which
removes hardware accesses from the suspend function ?

> 2) I have also not observed -EIO in my testing. The error consistently
> reported on resume and subsequent hwmon access is -ENXIO.
> Earlier references to -EIO were based on assumptions rather than
> observed logs, and I should have been clearer about that.
> 

Thanks for the clarification.

Guenter

> I am enabling debug logging for the i801 driver to collect more
> concrete evidence of controller state during resume.

