Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA65835D608
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 16:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530785; cv=none; b=PqKslffYsZAXGWZo0XXCpvKSHhRIYPBGjkjwsOuDKeAg6v0nq2M4ei+TDNZYBdD5+mj7SON7Rg7WSiPmyx4n8arWNbnYofAWDDcqbaGjR/ucJJvvH50kOeD/b6evoWnahYaZSHkGIADm2TFfZypRtRZFTBVgxLnfS0qhi3iBw7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530785; c=relaxed/simple;
	bh=MS36Vbtz9IoJUWQ6ybnEALAxAIK2uXEX66DgLoMX2e4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8husnSaNUR/sBoxXUX34JiPLodL9Z2ef2qFAZm5Ujy1t5JyLV43cLWFRQjpQxNSftGZgFnu2bBcx3HCpWcO6wcv1kdTgCV0WurUuNOlpFReOmudSXsk6aya/MN3CUi+UaA7l9Z4PQVPikB47lKDxl/Yd968B2gs5iuihrU7Uwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqsTsdyy; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqsTsdyy"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8946e32e534so79337906d6.3
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 08:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769530783; x=1770135583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IGETN8BQjQvU1d8fKq9oPRgzBxD2Cy6kMQ50ogMTDLA=;
        b=PqsTsdyy/cNjgxT6lxOYZ4pgKodnZnp3wmXeCgZu0I6OtPuTlRsGCJrDmrFS4OHITP
         XKaAk78CBt1cI/zFwwHzUmy4VibAjEG+tA6F+mcRWnb4os5emQVKr6CpnkU6S04swWYp
         nSakflW3cC+BSf76SJPSdpcypZ2+wfhle2h61lhsnvZu+iZcurxm9zPWsszG7ZmQoqIZ
         mK0AegEkPqrdeBgSxhfrrJ0loKIrVCQqpFS/3LSq8uQE7mkrDl9EG/W1oYGRQpYpRhxP
         5t2U0P/x7rFHVkeXCjqi/fioulFP7Agch92o3hFexxMDmpJAkSHzB2bDTtWFS4ABLVbl
         U+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769530783; x=1770135583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGETN8BQjQvU1d8fKq9oPRgzBxD2Cy6kMQ50ogMTDLA=;
        b=VT03meW1fajvkaPcItl1OZu8rWGiTdC8yZqkFOMm1TAtBfcNLeuk9OZh++7s6954J+
         6vK/xKJj8SB7edqfaqyA8ybQFiTEuG1P8BSNMmQn6VxUiIlIYgZ1FqxZlgUYeDP3j9cX
         iaJAvpnOCNNG5a7PEAS+aNYdIOf3e/ORyf1TLZO+IXQUmqZYUBDqhVSjYeMgurgiSXvg
         uq3dJ9uAZUo6EOe7zY3MRsrcinyrSzE6+4/u5DQC2LhC9KjBaaC44Fk1Fn2V8A2zcaOw
         6BK12rb8moIvTAeYAZYewpiBsFg3H/Oc/4tHjxxGm9v6JHMvk6hku2Qm/sYUUehFQc4Q
         x84w==
X-Forwarded-Encrypted: i=1; AJvYcCUjvVM7jcIggOYj3BdmxbuHSOQ1xYSQTTclbatXqktlUhV0VVf/aQ+q+JN+ULH2Q+1meCRsoXhg26CBPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYAeW5wzLPzYIrQE8lSCGiij+nJP7Tswe6DMiQ0onc+O/mye24
	sJR6Et8z5/zzPTHnt4drMiOzrDz5DLC1KbkBt9XpessDLOy7BnXA8uftOwJueTr7
X-Gm-Gg: AZuq6aK+3AbMRizzk/JBtl+fddUMV6Op1TviycO32vSv0mTcqRMtpmJEvOznW/sM7cB
	t0iYZja+hGnTXw3Y2bmuK5yLmjSnhJjkf8a8Rj1K2Pq5pplMSEfcpg1xCiVM1Y0xjj1+cQtzTuW
	9vZ1EoSNJvzKjVaug4rWqat5y1av42K6NuOu/PeFGJJ4YAl0EadWMW4pD0iUgkdrIAXg8OrPBFo
	+1NQLPWIXgnmncsgANrFsDN00nKwYMx54TWm3bbiM75pTwhnlKzCeaYp12tH9QLu3RhH09dYYlT
	/QsGMq70m8Z7mUe4+BcBAXQoPWj5JN2Zkm3mdAoD5qkuo0Imf3fSa0ubxMY7BHywAnQkBeGH+Wa
	plerStKKOIMt88MOvaujco7LuJ/k6ffUNinQ4k3/l3br3EG2JnuutKO/vdjvFIIG8Ay0y7lWR2j
	bz9VFjG/SdK4EDx65MafO0hYe7hsTomsbqL/Sesa5k1sN9PxYXj+8KseNFQtvX
X-Received: by 2002:a17:903:1c7:b0:295:54cb:16ac with SMTP id d9443c01a7336-2a870dc1022mr20189115ad.18.1769524415778;
        Tue, 27 Jan 2026 06:33:35 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802de5cf8sm118545305ad.42.2026.01.27.06.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 06:33:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6249756d-7e49-464e-bb7e-11dfba3085f3@roeck-us.net>
Date: Tue, 27 Jan 2026 06:33:34 -0800
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
Cc: Armin Wolf <W_Armin@gmx.de>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
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
 <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
 <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/27/26 02:35, TINSAE TADESSE wrote:
> 
> 
> On Mon, Jan 26, 2026 at 1:36 AM Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
>  >
>  > On 1/24/26 11:11, Armin Wolf wrote:
>  > > Am 24.01.26 um 15:45 schrieb TINSAE TADESSE:
>  > >
>  > >> On Fri, Jan 16, 2026 at 9:24 AM Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
>  > >>> On 1/15/26 05:50, TINSAE TADESSE wrote:
>  > >>>> On Wed, Jan 14, 2026 at 5:23 PM Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
>  > >>>>> On 1/14/26 05:07, TINSAE TADESSE wrote:
>  > >>>>> ...
>  > >>>>>>>> Hi Guenter,
>  > >>>>>>>>
>  > >>>>>>>> I tested changing the i801 SMBus controller to use
>  > >>>>>>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
>  > >>>>>>>> DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With this
>  > >>>>>>>> change, spd5118 resume failures (-ENXIO)
>  > >>>>>>>> still persist, suggesting PM ordering alone is insufficient and other
>  > >>>>>>>> firmware interactions are involved.
>  > >>>>>>> How about the problem in the suspend function ? Is that also still seen ?
>  > >>>>>>>
>  > >>>>>>> Also, the subject talks about -EIO. Is that still seen ?
>  > >>>>>>>
>  > >>>>>>> Either case, can you enable debug logs for the i801 driver ?
>  > >>>>>>> It should generate log entries when it reports errors.
>  > >>>>>>>
>  > >>>>>>> Thanks,
>  > >>>>>>> Guenter
>  > >>>>>>>
>  > >>>>>> Hi Guenter,
>  > >>>>>>
>  > >>>>>> Thank you for the questions. To clarify:
>  > >>>>>>
>  > >>>>> Please do not drop mailing lists from replies.
>  > >>>>>
>  > >>>>>> 1) I have not observed any failures in the suspend path. The suspend
>  > >>>>>> callback completes successfully, and
>  > >>>>>> I have not seen I2C errors or warnings during suspend at any point.
>  > >>>>> Sorry, I seem to be missing something.
>  > >>>>>
>  > >>>>> In that case, what is the point of patch 3/3 of your series which
>  > >>>>> removes hardware accesses from the suspend function ?
>  > >>>>>
>  > >>>>>> 2) I have also not observed -EIO in my testing. The error consistently
>  > >>>>>> reported on resume and subsequent hwmon access is -ENXIO.
>  > >>>>>> Earlier references to -EIO were based on assumptions rather than
>  > >>>>>> observed logs, and I should have been clearer about that.
>  > >>>>>>
>  > >>>>> Thanks for the clarification.
>  > >>>>>
>  > >>>>> Guenter
>  > >>>>>
>  > >>>>>> I am enabling debug logging for the i801 driver to collect more
>  > >>>>>> concrete evidence of controller state during resume.
>  > >>>> Hi Guenter,
>  > >>>>
>  > >>>>> Sorry, I seem to be missing something.
>  > >>>>>
>  > >>>>> In that case, what is the point of patch 3/3 of your series which
>  > >>>>> removes hardware accesses from the suspend function ?
>  > >>>> You are right to question this, and I agree that it needs clarification.
>  > >>>>
>  > >>>> Patch 3/3 was originally proposed under the assumption that the resume failures
>  > >>>> were caused by spd5118 performing I2C transactions while the
>  > >>>> controller was not yet available,
>  > >>>> and that removing hardware accesses from the suspend path might
>  > >>>> mitigate the issue.
>  > >>>> At that point, I assumed the problem was limited to the resume callback.
>  > >>>>
>  > >>>> After enabling detailed i801 debug logging and testing with
>  > >>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() in the i801 driver,
>  > >>>> it became clear that this assumption was incorrect. The controller
>  > >>>> itself reports "i801_smbus: No response"
>  > >>>> both during suspend and immediately after resume, and spd5118 merely
>  > >>>> propagates the resulting -ENXIO.
>  > >>> Outch, that really hurts, because it means that something is seriously
>  > >>> broken in both the suspend and resume path. The device _must_ be accessible
>  > >>> in the suspend path. Otherwise there is no guarantee that the device is
>  > >>> accessible for normal (pre-suspend) operation. After all, someone could
>  > >>> run a script reading sysfs attributes in a tight loop continuously,
>  > >>> or the thermal subsystem could try to access the chip. That would suddenly
>  > >>> start to fail if something in the device access path starts to be suspended
>  > >>> while the underlying hardware is still believed to be operational.
>  > >>>
>  > >>> I could imagine some hack/quirk for the resume path, such as delaying resume
>  > >>> for some period of time for affected hardware, but I have no idea what to
>  > >>> do on the suspend side. We can not just drop device writes during suspend
>  > >>> because some broken hardware/firmware does not let us actually access
>  > >>> (and thus suspend) the hardware anymore by the time the suspend function
>  > >>> is called.
>  > >>>
>  > >>> Guenter
>  > >>>
>  > >>>> This indicates that the issue is not caused by spd5118 suspend/resume
>  > >>>> behavior, but by the unavailability of the
>  > >>>> SMBus controller due to platform or firmware interactions during
>  > >>>> s2idle transitions.
>  > >>>>
>  > >>>> Given this, I agree that patch 3/3 does not address the root cause and
>  > >>>> does not provide a justified improvement.
>  > >>>> I am therefore fine with dropping it.
>  > >>>>
>  > >>>> Thank you for pointing this out.
>  > >>>>
>  > >> Hi Guenter,
>  > >>
>  > >> Thanks for the continued review and for questioning the earlier
>  > >> direction — that helped narrow this down properly.
>  > >>
>  > >> After enabling full i801 debug logging (included below in this email)
>  > >> and inspecting both drivers, it became clear that the resume
>  > >> failures are not caused by spd5118 accessing the hardware too
>  > >> early, nor by PM ordering issues. Instead, the SMBus controller
>  > >> explicitly reports “SPD Write Disable is set”, and any
>  > >> block write transactions to the SPD device consistently fail with
>  > >> DEV_ERR. spd5118 merely propagates the resulting -ENXIO.
>  > >
>  > > Oh no, this likely happens even when merely reading values, as the spd5118
>  > > uses a page register to switch between different register pages. In order
>  > > to access temperature data (page 0), you might already have to issue a
>  > > write access to the page register. The only reason why it works for you
>  > > is that the spd5118 likely already has page 0 selected by the system firmware
>  > > during boot.
>  > >
>  >
>  > Exactly. There is no guarantee that page 0 is selected.
>  >
>  > >> With that in mind, I have dropped the earlier patch that attempted
>  > >> to remove hardware access from the suspend path
>  > >> unconditionally.
>  > >> That patch does not address the root cause and is no longer
>  > >> part of the series.
>  > >>
>  > >> I am instead proposing a minimal 2-patch series:
>  > >>
>  > >> 1/2 records whether the platform enforces SPD write disable at probe
>  > >> time (no behavior change).
>  > >> 2/2 avoids regcache writeback during suspend/resume when the device
>  > >> operates in read-only mode, while still allowing read access to
>  > >> temperature inputs.
>  > >>
>  > >> This avoids issuing SMBus transactions that are architecturally
>  > >> blocked on these systems, and does not rely on
>  > >> delays or PM ordering assumptions, and leaves behavior unchanged on
>  > >> platforms where SPD writes are permitted.
>  > >>
>  > >> If this direction looks acceptable, I’m happy to re-spin and post the
>  > >> series formally.
>  > >>
>  > >> Thanks again for the guidance.
>  > >
>  > > I do not know if this is a reliable solution, as the system firmware might
>  > > select a different register page during resume. This will then prevent the
>  > > driver from functioning.
>  > >
>  >
>  > No, it is not reliable. The driver is simply not usable in this scenario.
>  > This isn't just the temperature sensor code - the eeprom code is affected
>  > as well.
>  >
>  > > I would love to see the spd5118 driver working on such systems with reduced
>  > > functionality, but i will leave it to Guenter to decide if this approach is
>  > > maintainable.
>  > >
>  > > Besides that: did the spd5118 driver load automatically on your device?
>  > >
>  >
>  > I thought that was disabled. The i801 driver is supposed to detect if write
>  > protect is enabled and, if so, it is supposed to not instantiate the spd5118
>  > driver for DDR3. Support for this was added with commit 4d6d35d3417d ("i2c:
>  > smbus: introduce Write Disable-aware SPD instantiating functions"). Apparently
>  > the code to do this never made it into the i801 driver.
>  >
>  > The i801 driver needs to be fixed to inform the spd initialization code
>  > that the spd5118 address range is write protected. The patch to do this was
>  > "i2c: i801: Do not instantiate spd5118 under SPD Write Disable". I have no idea
>  > why that patch didn't make it upstream.
>  >
>  > Guenter
>  >
> 
> Hi Guenter,
> 
>  > > The i801 driver needs to be fixed to inform the spd initialization code
>  > > that the spd5118 address range is write protected. The patch to do
>  > > this was
>  > > "i2c: i801: Do not instantiate spd5118 under SPD Write Disable". I
>  > > have no idea
>  > > why that patch didn't make it upstream.
> 
> I initially considered exposing SPD write-protection as a capability to be consumed by spd5118.
> However, spd5118 already depends on firmware-initialized state (page selection) and cannot reliably
> determine safe operation at probe time without issuing writes.
> Given that, suppressing SPD instantiation in the i801 driver when SPD Write Disable is
> the only solution here.
> 
> Tested the remaining patch [1], and it does not seem to fix the issue, as it is added at the wrong stage
> in the initialization of the i801 driver. The attached log shows that spd5118 is instantiated and fully probed
> before the "do not instantiate spd5118 under SPD Write Disable" is acted upon.
> This confirms that suppressing instantiation must occur before adapter registration in i801.
> Once the adapter is registered, the SPD scan has already happened, and spd5118 has bound successfully
> based on the firmware-initialized state, even though correct operation is impossible.
> Therefore, the fix must be run prior to adapter registration.
> 
> [1] https://lore.kernel.org/all/20250430-for-upstream-i801-spd5118-no-instantiate-v2-2-2f54d91ae2c7@canonical.com/ <https://lore.kernel.org/all/20250430-for-upstream-i801-spd5118-no-instantiate-v2-2-2f54d91ae2c7@canonical.com/>
> 
> 
> The fix is to register the SPD write-disable policy before i2c_add_adapter(), so the I2C core never
> probes SPD addresses on write-protected platforms.
> 

Do you have SENSORS_SPD5118_DETECT enabled in your configuration ? It should be disabled
on systems with DMI enabled.

Guenter

