Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E3F329385;
	Mon, 26 Jan 2026 09:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769420457; cv=none; b=dD9kLEOgshccf8ltYM/5xrrystmGJD962ZSXJPshFCDxqH/DmqmC0zNOVloynbOiqzk+RQ3K1oV8V6U4nZcZ2kBcIzoWiK0gPc+yzELE8IPp35QC1CmmaahtSGZv7/A5FzWYjZSLFwA6htR2URT8jNQ+Xx1Ie6clRAkFhVkUAcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769420457; c=relaxed/simple;
	bh=BFgCN2VEHNtOvA57Yck5DlvuFlLPp9lmEQWdsy+S1xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ppg+W8aokRTz2xWKmo594jc4bx7zjG4OfMsV7PmY0cFef8taiu1kbmsD5fkox9B2ppvyeufi50ow9yKcopjmvaVqfsu2qQQLiFYyH9a7KlZTErQmvDfvRMH+MRO67TJkXw+zRspc0bhXcU7otPaeBJ2GcE3vPnFOBdDHk3ElavE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pK42hWzR; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pK42hWzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1769420453; x=1770025253; i=w_armin@gmx.de;
	bh=BFgCN2VEHNtOvA57Yck5DlvuFlLPp9lmEQWdsy+S1xk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pK42hWzRQEhu7CljEb3KGgmie7vaoIR7o1wTpzQ/J//qYAs3Jqo3zPQTGTj8mfp+
	 pGvUhKXwocon0XqJww8nymPgR3Oi1ZMIiMt+34BcSrlocMv5HW8/TXuoLuWzH2lgv
	 nSQSD3XfBgCsV2T0Jqfw9hZ2lM8Rz8FaWkrGCI18iSB+KlY3Jc3m8gW3X76wIu7aF
	 70fKavJmqeS5sCdjQ0idyr5IJOiWcOxJiyMUAZ0e/rliRK7DgyfQIS9LLwHHHZ6I1
	 4uPs6sJ2iQPkasJafYwOBMkJGX0/ODc383282wD7E7kIR6izz14DapbEVnF5PWEMP
	 x5cbVG1DbAPdD7RSFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.119.44] ([141.76.8.172]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ykW-1veEYF2TB8-0089Xk; Mon, 26
 Jan 2026 10:40:53 +0100
Message-ID: <995092ad-7b99-4edc-b0eb-b4a3d3f5b1fd@gmx.de>
Date: Mon, 26 Jan 2026 10:40:51 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: Guenter Roeck <linux@roeck-us.net>,
 TINSAE TADESSE <tinsaetadesse2015@gmail.com>
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
 <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ky5bzFy+xinJlmdSVgeAR7XMV+TFiETtpJ95swTJQvkKM4VueJ6
 bChsswA+Bdj+wsZft5Fk2DA5tHk/GOwXuHqTabh7jwVEweWgX6P6BycrkjOJ/vLrkW4KIvz
 OforC08R5q0nr2ipcxBakqT1TJ/ZCdtZM4xBI1Tg03TPwNXsEbPY+MNRqqGhCIigkuyrgGK
 aVEU+VOGZnIndM8hAlDcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NoHXgmqzlQk=;6Xc/UpC7bTnmNr+TVy+dEMP4dL0
 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
 vdhiTiUPmZO+sqCigyAj

Am 25.01.26 um 23:36 schrieb Guenter Roeck:

> On 1/24/26 11:11, Armin Wolf wrote:
>> Am 24.01.26 um 15:45 schrieb TINSAE TADESSE:
>>
>>> On Fri, Jan 16, 2026 at 9:24=E2=80=AFAM Guenter Roeck <linux@roeck-us.=
net>=20
>>> wrote:
>>>> On 1/15/26 05:50, TINSAE TADESSE wrote:
>>>>> On Wed, Jan 14, 2026 at 5:23=E2=80=AFPM Guenter Roeck <linux@roeck-u=
s.net>=20
>>>>> wrote:
>>>>>> On 1/14/26 05:07, TINSAE TADESSE wrote:
>>>>>> ...
>>>>>>>>> Hi Guenter,
>>>>>>>>>
>>>>>>>>> I tested changing the i801 SMBus controller to use
>>>>>>>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
>>>>>>>>> DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With this
>>>>>>>>> change, spd5118 resume failures (-ENXIO)
>>>>>>>>> still persist, suggesting PM ordering alone is insufficient=20
>>>>>>>>> and other
>>>>>>>>> firmware interactions are involved.
>>>>>>>> How about the problem in the suspend function ? Is that also=20
>>>>>>>> still seen ?
>>>>>>>>
>>>>>>>> Also, the subject talks about -EIO. Is that still seen ?
>>>>>>>>
>>>>>>>> Either case, can you enable debug logs for the i801 driver ?
>>>>>>>> It should generate log entries when it reports errors.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Guenter
>>>>>>>>
>>>>>>> Hi Guenter,
>>>>>>>
>>>>>>> Thank you for the questions. To clarify:
>>>>>>>
>>>>>> Please do not drop mailing lists from replies.
>>>>>>
>>>>>>> 1) I have not observed any failures in the suspend path. The=20
>>>>>>> suspend
>>>>>>> callback completes successfully, and
>>>>>>> I have not seen I2C errors or warnings during suspend at any point=
.
>>>>>> Sorry, I seem to be missing something.
>>>>>>
>>>>>> In that case, what is the point of patch 3/3 of your series which
>>>>>> removes hardware accesses from the suspend function ?
>>>>>>
>>>>>>> 2) I have also not observed -EIO in my testing. The error=20
>>>>>>> consistently
>>>>>>> reported on resume and subsequent hwmon access is -ENXIO.
>>>>>>> Earlier references to -EIO were based on assumptions rather than
>>>>>>> observed logs, and I should have been clearer about that.
>>>>>>>
>>>>>> Thanks for the clarification.
>>>>>>
>>>>>> Guenter
>>>>>>
>>>>>>> I am enabling debug logging for the i801 driver to collect more
>>>>>>> concrete evidence of controller state during resume.
>>>>> Hi Guenter,
>>>>>
>>>>>> Sorry, I seem to be missing something.
>>>>>>
>>>>>> In that case, what is the point of patch 3/3 of your series which
>>>>>> removes hardware accesses from the suspend function ?
>>>>> You are right to question this, and I agree that it needs=20
>>>>> clarification.
>>>>>
>>>>> Patch 3/3 was originally proposed under the assumption that the=20
>>>>> resume failures
>>>>> were caused by spd5118 performing I2C transactions while the
>>>>> controller was not yet available,
>>>>> and that removing hardware accesses from the suspend path might
>>>>> mitigate the issue.
>>>>> At that point, I assumed the problem was limited to the resume=20
>>>>> callback.
>>>>>
>>>>> After enabling detailed i801 debug logging and testing with
>>>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() in the i801 driver,
>>>>> it became clear that this assumption was incorrect. The controller
>>>>> itself reports "i801_smbus: No response"
>>>>> both during suspend and immediately after resume, and spd5118 merely
>>>>> propagates the resulting -ENXIO.
>>>> Outch, that really hurts, because it means that something is seriousl=
y
>>>> broken in both the suspend and resume path. The device _must_ be=20
>>>> accessible
>>>> in the suspend path. Otherwise there is no guarantee that the=20
>>>> device is
>>>> accessible for normal (pre-suspend) operation. After all, someone=20
>>>> could
>>>> run a script reading sysfs attributes in a tight loop continuously,
>>>> or the thermal subsystem could try to access the chip. That would=20
>>>> suddenly
>>>> start to fail if something in the device access path starts to be=20
>>>> suspended
>>>> while the underlying hardware is still believed to be operational.
>>>>
>>>> I could imagine some hack/quirk for the resume path, such as=20
>>>> delaying resume
>>>> for some period of time for affected hardware, but I have no idea=20
>>>> what to
>>>> do on the suspend side. We can not just drop device writes during=20
>>>> suspend
>>>> because some broken hardware/firmware does not let us actually access
>>>> (and thus suspend) the hardware anymore by the time the suspend=20
>>>> function
>>>> is called.
>>>>
>>>> Guenter
>>>>
>>>>> This indicates that the issue is not caused by spd5118 suspend/resum=
e
>>>>> behavior, but by the unavailability of the
>>>>> SMBus controller due to platform or firmware interactions during
>>>>> s2idle transitions.
>>>>>
>>>>> Given this, I agree that patch 3/3 does not address the root cause=
=20
>>>>> and
>>>>> does not provide a justified improvement.
>>>>> I am therefore fine with dropping it.
>>>>>
>>>>> Thank you for pointing this out.
>>>>>
>>> Hi Guenter,
>>>
>>> Thanks for the continued review and for questioning the earlier
>>> direction =E2=80=94 that helped narrow this down properly.
>>>
>>> After enabling full i801 debug logging (included below in this email)
>>> and inspecting both drivers, it became clear that the resume
>>> failures are not caused by spd5118 accessing the hardware too
>>> early, nor by PM ordering issues. Instead, the SMBus controller
>>> explicitly reports =E2=80=9CSPD Write Disable is set=E2=80=9D, and any
>>> block write transactions to the SPD device consistently fail with
>>> DEV_ERR. spd5118 merely propagates the resulting -ENXIO.
>>
>> Oh no, this likely happens even when merely reading values, as the=20
>> spd5118
>> uses a page register to switch between different register pages. In=20
>> order
>> to access temperature data (page 0), you might already have to issue a
>> write access to the page register. The only reason why it works for you
>> is that the spd5118 likely already has page 0 selected by the system=20
>> firmware
>> during boot.
>>
>
> Exactly. There is no guarantee that page 0 is selected.
>
>>> With that in mind, I have dropped the earlier patch that attempted
>>> to remove hardware access from the suspend path
>>> unconditionally.
>>> That patch does not address the root cause and is no longer
>>> part of the series.
>>>
>>> I am instead proposing a minimal 2-patch series:
>>>
>>> 1/2 records whether the platform enforces SPD write disable at probe
>>> time (no behavior change).
>>> 2/2 avoids regcache writeback during suspend/resume when the device
>>> operates in read-only mode, while still allowing read access to
>>> temperature inputs.
>>>
>>> This avoids issuing SMBus transactions that are architecturally
>>> blocked on these systems, and does not rely on
>>> delays or PM ordering assumptions, and leaves behavior unchanged on
>>> platforms where SPD writes are permitted.
>>>
>>> If this direction looks acceptable, I=E2=80=99m happy to re-spin and p=
ost the
>>> series formally.
>>>
>>> Thanks again for the guidance.
>>
>> I do not know if this is a reliable solution, as the system firmware=20
>> might
>> select a different register page during resume. This will then=20
>> prevent the
>> driver from functioning.
>>
>
> No, it is not reliable. The driver is simply not usable in this scenario=
.
> This isn't just the temperature sensor code - the eeprom code is affecte=
d
> as well.
>
Ok.

>> I would love to see the spd5118 driver working on such systems with=20
>> reduced
>> functionality, but i will leave it to Guenter to decide if this=20
>> approach is
>> maintainable.
>>
>> Besides that: did the spd5118 driver load automatically on your device?
>>
>
> I thought that was disabled. The i801 driver is supposed to detect if=20
> write
> protect is enabled and, if so, it is supposed to not instantiate the=20
> spd5118
> driver for DDR3. Support for this was added with commit 4d6d35d3417d=20
> ("i2c:
> smbus: introduce Write Disable-aware SPD instantiating functions").=20
> Apparently
> the code to do this never made it into the i801 driver.
>
> The i801 driver needs to be fixed to inform the spd initialization code
> that the spd5118 address range is write protected. The patch to do=20
> this was
> "i2c: i801: Do not instantiate spd5118 under SPD Write Disable". I=20
> have no idea
> why that patch didn't make it upstream.
>
> Guenter
>
Good question, do you want to send the message to the i2c maintainers abou=
t this
or should i do it?

Thanks,
Armin Wolf

