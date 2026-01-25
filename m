Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EA92F1FEA
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Jan 2026 22:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769380617; cv=none; b=r3zqInlohzGyRdfWidEA/+qCdT+lLJ0icU1Dv4zTfOps9wPD5Wibj30q9qYTx+hD/8zE+/92I24XvpJmHBCpF091BvO5kPbKIcorY3EYkE3Ev0DCNhttFTCzSOd3I2kUQSs5PX9FPxKOF0cacG3rPkOqoI0eAqeHJoD3xRf9dFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769380617; c=relaxed/simple;
	bh=myue1AHEg51xIJUs2KWqupM0G7AP/qyEat5TdBMMw5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCH2OOaqQ5HUNMbrM2IIK6HCjdlutBfwMNds/R7/A7vv1hKv2mqsiSXRVJwqp1qbkmeDq1xsWNy94ijgakVY311XOIJdo/8xUl7+7lCe2OCwd6PYtslIk8p8MmhsZprd/yoEzs5uxoXoEI5BPkUng9tcgfLGzaGn4ce1PIzevhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXpVNIan; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXpVNIan"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12332910300so6463310c88.0
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Jan 2026 14:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769380615; x=1769985415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=L3AKLX/TXgS4dYM+MFq9xjB3L65chJdv+DT9jN4MpwQ=;
        b=OXpVNIanrmTyVDCJkTGRzKjU53n/0SZWZpYA5UdFfeRUCyA5AG3nwZFxpAiuy2il7h
         F5lXJNv4goYNFz+KM0KbJuAxxx+xFF26vGnd6YhiyJrp8G+ZdSIYi9BrA1cYuc82aHMK
         URul3eLHwZiMVAyy8Q0ZooENHO4F2+iq/Iyo0y3hjZOCUv5ml1wADgIcsL6GW240QvYr
         tuFsqgxaOHqB9CazLdO++nzziwRsevbRrPLBIqn+Z6zCMcnzH193J6wlp19XAf5Q38nz
         DwQgyMr7kBb38FY2ShO6o5AvY/dUm6OMAOKEYvasJf3LGuKC/99sAyuwU67e3IxuXcRd
         rzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769380615; x=1769985415;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3AKLX/TXgS4dYM+MFq9xjB3L65chJdv+DT9jN4MpwQ=;
        b=FkSIsqOmGjS3TiVAxLw7lXeHjB2ZoJVR+M3RFOK89PhHVTh8y1oqkqCPpY2iAQ8VAM
         yLE7ppPFQPNd1g84k4xubEcBnu8jlkX7fIXQwlDQjKmjb9evsmRQ0cZSeli0N17oMSNx
         dMrcsk5s0Qf3nuIRvLfJIXl6GV5xWkrvsxZZqSPSrNbMcRVRchFG4rL52V5snj9OBBZT
         aPR+9VHtzdZnO85kQmAsvJ8NiWaEjfPVIHz8OAfb5EQmTtb3zOIXuYPR1yxlJT2T9qoI
         WvdmFtgEcgZix7yHVAqd7r8zqkZkeah5WjUE4ClQ5MGSx3oR4Xu09ti02Wc74ZTpv6JM
         Dd0A==
X-Gm-Message-State: AOJu0Yy6RRq3peBbZEZQHBH7+SvrpZM4utOckxcxonEQqzeBZH4rz2Zs
	R53BM+Yqz8g4aclHbO+Td1PatAQEoSCDs+YvNENEwa8vOmGNcf0DnhOw
X-Gm-Gg: AZuq6aLLrESe8wNkmxgFc9zBgczIS/wHjFD5xxEFwEN9h1j+PvOBTT++3l+QuTOGQeL
	KySY/SJryJaVOqYNQb3OLACsQDi5rJbpjaOxAch5ApgkTY0gIuLfnzLwgtJo31pOXQ755pd9wed
	+vB0NLHbV3B75F1VlYy3AyMR0XwmwM3jNQWt5P01JDdHru6nCDgU8N57UBjOchRwVOZipoQlaep
	O1r0YxyubGPPQg+bt+PfqsyXiUuWH3sLtynIcVS99632wWV1RgFU2NDHuSwBPRqA7G8Z4tOh0fg
	Xa9ia0NdK07ZyixlrHb11oLQHqE1eyDADhtsMPIjnxp0Q5sAq/6b08jz02DIjwkSIOjRrkI2Z2P
	Y2sPxYMghIunmA2c2lJSNsFLmbfR0ReqnOgBLeBHWfjP1zspSYNUu6aFMHRc4go5H/V69i7K9mu
	ETYocmAfefXQMvCk8uLbSspGE3WqNorZDIpmn4rvp40oYSOtSe7mufOFt6vbZHPHqwSIDYRr4=
X-Received: by 2002:a05:7022:2389:b0:11b:c4ee:66b with SMTP id a92af1059eb24-1248ec8d447mr1042928c88.37.1769380614892;
        Sun, 25 Jan 2026 14:36:54 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a6f5d10sm11989938eec.15.2026.01.25.14.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 14:36:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
Date: Sun, 25 Jan 2026 14:36:52 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: Armin Wolf <W_Armin@gmx.de>, TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <c36306c5-2426-4a9c-9abd-9f3cdab17ed5@roeck-us.net>
 <CAJ12PfNkde6__QQXMiyBbEoHMbY3efmtsqgbyiKBtBmyfpX5Jw@mail.gmail.com>
 <2740c3ab-7cb0-4931-81a2-30b85e8615f9@roeck-us.net>
 <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
 <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net>
 <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com>
 <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net>
 <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com>
 <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/24/26 11:11, Armin Wolf wrote:
> Am 24.01.26 um 15:45 schrieb TINSAE TADESSE:
> 
>> On Fri, Jan 16, 2026 at 9:24 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>> On 1/15/26 05:50, TINSAE TADESSE wrote:
>>>> On Wed, Jan 14, 2026 at 5:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>> On 1/14/26 05:07, TINSAE TADESSE wrote:
>>>>> ...
>>>>>>>> Hi Guenter,
>>>>>>>>
>>>>>>>> I tested changing the i801 SMBus controller to use
>>>>>>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
>>>>>>>> DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With this
>>>>>>>> change, spd5118 resume failures (-ENXIO)
>>>>>>>> still persist, suggesting PM ordering alone is insufficient and other
>>>>>>>> firmware interactions are involved.
>>>>>>> How about the problem in the suspend function ? Is that also still seen ?
>>>>>>>
>>>>>>> Also, the subject talks about -EIO. Is that still seen ?
>>>>>>>
>>>>>>> Either case, can you enable debug logs for the i801 driver ?
>>>>>>> It should generate log entries when it reports errors.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Guenter
>>>>>>>
>>>>>> Hi Guenter,
>>>>>>
>>>>>> Thank you for the questions. To clarify:
>>>>>>
>>>>> Please do not drop mailing lists from replies.
>>>>>
>>>>>> 1) I have not observed any failures in the suspend path. The suspend
>>>>>> callback completes successfully, and
>>>>>> I have not seen I2C errors or warnings during suspend at any point.
>>>>> Sorry, I seem to be missing something.
>>>>>
>>>>> In that case, what is the point of patch 3/3 of your series which
>>>>> removes hardware accesses from the suspend function ?
>>>>>
>>>>>> 2) I have also not observed -EIO in my testing. The error consistently
>>>>>> reported on resume and subsequent hwmon access is -ENXIO.
>>>>>> Earlier references to -EIO were based on assumptions rather than
>>>>>> observed logs, and I should have been clearer about that.
>>>>>>
>>>>> Thanks for the clarification.
>>>>>
>>>>> Guenter
>>>>>
>>>>>> I am enabling debug logging for the i801 driver to collect more
>>>>>> concrete evidence of controller state during resume.
>>>> Hi Guenter,
>>>>
>>>>> Sorry, I seem to be missing something.
>>>>>
>>>>> In that case, what is the point of patch 3/3 of your series which
>>>>> removes hardware accesses from the suspend function ?
>>>> You are right to question this, and I agree that it needs clarification.
>>>>
>>>> Patch 3/3 was originally proposed under the assumption that the resume failures
>>>> were caused by spd5118 performing I2C transactions while the
>>>> controller was not yet available,
>>>> and that removing hardware accesses from the suspend path might
>>>> mitigate the issue.
>>>> At that point, I assumed the problem was limited to the resume callback.
>>>>
>>>> After enabling detailed i801 debug logging and testing with
>>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() in the i801 driver,
>>>> it became clear that this assumption was incorrect. The controller
>>>> itself reports "i801_smbus: No response"
>>>> both during suspend and immediately after resume, and spd5118 merely
>>>> propagates the resulting -ENXIO.
>>> Outch, that really hurts, because it means that something is seriously
>>> broken in both the suspend and resume path. The device _must_ be accessible
>>> in the suspend path. Otherwise there is no guarantee that the device is
>>> accessible for normal (pre-suspend) operation. After all, someone could
>>> run a script reading sysfs attributes in a tight loop continuously,
>>> or the thermal subsystem could try to access the chip. That would suddenly
>>> start to fail if something in the device access path starts to be suspended
>>> while the underlying hardware is still believed to be operational.
>>>
>>> I could imagine some hack/quirk for the resume path, such as delaying resume
>>> for some period of time for affected hardware, but I have no idea what to
>>> do on the suspend side. We can not just drop device writes during suspend
>>> because some broken hardware/firmware does not let us actually access
>>> (and thus suspend) the hardware anymore by the time the suspend function
>>> is called.
>>>
>>> Guenter
>>>
>>>> This indicates that the issue is not caused by spd5118 suspend/resume
>>>> behavior, but by the unavailability of the
>>>> SMBus controller due to platform or firmware interactions during
>>>> s2idle transitions.
>>>>
>>>> Given this, I agree that patch 3/3 does not address the root cause and
>>>> does not provide a justified improvement.
>>>> I am therefore fine with dropping it.
>>>>
>>>> Thank you for pointing this out.
>>>>
>> Hi Guenter,
>>
>> Thanks for the continued review and for questioning the earlier
>> direction — that helped narrow this down properly.
>>
>> After enabling full i801 debug logging (included below in this email)
>> and inspecting both drivers, it became clear that the resume
>> failures are not caused by spd5118 accessing the hardware too
>> early, nor by PM ordering issues. Instead, the SMBus controller
>> explicitly reports “SPD Write Disable is set”, and any
>> block write transactions to the SPD device consistently fail with
>> DEV_ERR. spd5118 merely propagates the resulting -ENXIO.
> 
> Oh no, this likely happens even when merely reading values, as the spd5118
> uses a page register to switch between different register pages. In order
> to access temperature data (page 0), you might already have to issue a
> write access to the page register. The only reason why it works for you
> is that the spd5118 likely already has page 0 selected by the system firmware
> during boot.
> 

Exactly. There is no guarantee that page 0 is selected.

>> With that in mind, I have dropped the earlier patch that attempted
>> to remove hardware access from the suspend path
>> unconditionally.
>> That patch does not address the root cause and is no longer
>> part of the series.
>>
>> I am instead proposing a minimal 2-patch series:
>>
>> 1/2 records whether the platform enforces SPD write disable at probe
>> time (no behavior change).
>> 2/2 avoids regcache writeback during suspend/resume when the device
>> operates in read-only mode, while still allowing read access to
>> temperature inputs.
>>
>> This avoids issuing SMBus transactions that are architecturally
>> blocked on these systems, and does not rely on
>> delays or PM ordering assumptions, and leaves behavior unchanged on
>> platforms where SPD writes are permitted.
>>
>> If this direction looks acceptable, I’m happy to re-spin and post the
>> series formally.
>>
>> Thanks again for the guidance.
> 
> I do not know if this is a reliable solution, as the system firmware might
> select a different register page during resume. This will then prevent the
> driver from functioning.
> 

No, it is not reliable. The driver is simply not usable in this scenario.
This isn't just the temperature sensor code - the eeprom code is affected
as well.

> I would love to see the spd5118 driver working on such systems with reduced
> functionality, but i will leave it to Guenter to decide if this approach is
> maintainable.
> 
> Besides that: did the spd5118 driver load automatically on your device?
> 

I thought that was disabled. The i801 driver is supposed to detect if write
protect is enabled and, if so, it is supposed to not instantiate the spd5118
driver for DDR3. Support for this was added with commit 4d6d35d3417d ("i2c:
smbus: introduce Write Disable-aware SPD instantiating functions"). Apparently
the code to do this never made it into the i801 driver.

The i801 driver needs to be fixed to inform the spd initialization code
that the spd5118 address range is write protected. The patch to do this was
"i2c: i801: Do not instantiate spd5118 under SPD Write Disable". I have no idea
why that patch didn't make it upstream.

Guenter

