Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC8113957E;
	Sat, 24 Jan 2026 19:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769281884; cv=none; b=VBTaEBZviGdaw9EsPPmUVA6bzjY4UHaK52BjcneZ3TRiRRStLkQhOzUSGmI61r/1tywxpj+By1njGjXNmNfrEkxU2zGN/0PMrqCN9Z7A62kWY7CxCmtMVVQJCu4+rHdNhs+q2AY4dpr4U5CRzeJoMFC89QdNDx5NW9stnnztKmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769281884; c=relaxed/simple;
	bh=3LE+bKyoDJQaJkfLhsVeKYOCfxuGVUo3FuZVq24iig0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qfk4QJQRuhBO7VEbqJwO7ozDmTYObXhW30PdLzt1TalgHLWDz0ZZ8a10rHmThtvAu2RGx4ImAcrdArwukivmQuYH2fIaqH86H5SURuy+XmmBs3rRyNRexO633V8+7o5aIOzWFi9G+DIHOoONAmRlq03qdWKvH5fpuB745fCkDlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=VzLxHMtV; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="VzLxHMtV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1769281865; x=1769886665; i=w_armin@gmx.de;
	bh=hEhCxPJdtuOk0KzC33bqMTb8A5Y+pRXvDwhpqbJx0iA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VzLxHMtVkH61d21H5PRkkYk+HJ0gEFVw1RTcUAEGFA6ZzNKRuhqIQJolan+x8KrD
	 8fXaaHonkYf3/9BHMpiKoNPj55E1Agi/m0C31l5vbTTG89c5yWUDFDL5HOU530FxK
	 AIY0ePHZzdMkb150nCutSRGbP86P5ZI2Z0rmpfO9AWeUuGXtK83+ErB213u63yd2Z
	 MeAQfp8nnJOA+gt+wHHehUN8xsvLzhHHwHb5yVMJX1rbzZVidmH3djqXOznTaQtpJ
	 CLiYtbQ5kCt2as29zlvQDZTezzXXPavIWltH80H+rHCQZgBxK9tyCaRvw3i+T49Yw
	 skVO5n6tf4qMTDSX0w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCtj-1wIF2c2Gkp-00d3YB; Sat, 24
 Jan 2026 20:11:05 +0100
Message-ID: <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de>
Date: Sat, 24 Jan 2026 20:11:04 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: TINSAE TADESSE <tinsaetadesse2015@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Aq5js3Epyc5fqOQzY1qHlFtlgg2lVVCk2DL1fD3nVJn7sNoi8/s
 ZJsHA5Z3nvWRmqirjvwbfuFmhk5Go2CEjNf+WtwqgKa9It1afW/tJKlykWPkHqFMMlRvn46
 cuOuLuRT5fPvxfxGlyjfeapJ/6wE3pl+dYhrqldRB/MmoGWwoi4DHVBHFzYzgn3drUqnJaJ
 SHm7pd14d1jUEAtyVerMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OU4LbS/TTUI=;xmhD55+nsvBaSMr25Q8Akupm69C
 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

Am 24.01.26 um 15:45 schrieb TINSAE TADESSE:

> On Fri, Jan 16, 2026 at 9:24=E2=80=AFAM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
>> On 1/15/26 05:50, TINSAE TADESSE wrote:
>>> On Wed, Jan 14, 2026 at 5:23=E2=80=AFPM Guenter Roeck <linux@roeck-us.=
net> wrote:
>>>> On 1/14/26 05:07, TINSAE TADESSE wrote:
>>>> ...
>>>>>>> Hi Guenter,
>>>>>>>
>>>>>>> I tested changing the i801 SMBus controller to use
>>>>>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() instead of
>>>>>>> DEFINE_SIMPLE_DEV_PM_OPS() as a diagnostic experiment. With this
>>>>>>> change, spd5118 resume failures (-ENXIO)
>>>>>>> still persist, suggesting PM ordering alone is insufficient and ot=
her
>>>>>>> firmware interactions are involved.
>>>>>> How about the problem in the suspend function ? Is that also still =
seen ?
>>>>>>
>>>>>> Also, the subject talks about -EIO. Is that still seen ?
>>>>>>
>>>>>> Either case, can you enable debug logs for the i801 driver ?
>>>>>> It should generate log entries when it reports errors.
>>>>>>
>>>>>> Thanks,
>>>>>> Guenter
>>>>>>
>>>>> Hi Guenter,
>>>>>
>>>>> Thank you for the questions. To clarify:
>>>>>
>>>> Please do not drop mailing lists from replies.
>>>>
>>>>> 1) I have not observed any failures in the suspend path. The suspend
>>>>> callback completes successfully, and
>>>>> I have not seen I2C errors or warnings during suspend at any point.
>>>> Sorry, I seem to be missing something.
>>>>
>>>> In that case, what is the point of patch 3/3 of your series which
>>>> removes hardware accesses from the suspend function ?
>>>>
>>>>> 2) I have also not observed -EIO in my testing. The error consistent=
ly
>>>>> reported on resume and subsequent hwmon access is -ENXIO.
>>>>> Earlier references to -EIO were based on assumptions rather than
>>>>> observed logs, and I should have been clearer about that.
>>>>>
>>>> Thanks for the clarification.
>>>>
>>>> Guenter
>>>>
>>>>> I am enabling debug logging for the i801 driver to collect more
>>>>> concrete evidence of controller state during resume.
>>> Hi Guenter,
>>>
>>>> Sorry, I seem to be missing something.
>>>>
>>>> In that case, what is the point of patch 3/3 of your series which
>>>> removes hardware accesses from the suspend function ?
>>> You are right to question this, and I agree that it needs clarificatio=
n.
>>>
>>> Patch 3/3 was originally proposed under the assumption that the resume=
 failures
>>> were caused by spd5118 performing I2C transactions while the
>>> controller was not yet available,
>>> and that removing hardware accesses from the suspend path might
>>> mitigate the issue.
>>> At that point, I assumed the problem was limited to the resume callbac=
k.
>>>
>>> After enabling detailed i801 debug logging and testing with
>>> SET_LATE_SYSTEM_SLEEP_PM_OPS() in the i801 driver,
>>> it became clear that this assumption was incorrect. The controller
>>> itself reports "i801_smbus: No response"
>>> both during suspend and immediately after resume, and spd5118 merely
>>> propagates the resulting -ENXIO.
>> Outch, that really hurts, because it means that something is seriously
>> broken in both the suspend and resume path. The device _must_ be access=
ible
>> in the suspend path. Otherwise there is no guarantee that the device is
>> accessible for normal (pre-suspend) operation. After all, someone could
>> run a script reading sysfs attributes in a tight loop continuously,
>> or the thermal subsystem could try to access the chip. That would sudde=
nly
>> start to fail if something in the device access path starts to be suspe=
nded
>> while the underlying hardware is still believed to be operational.
>>
>> I could imagine some hack/quirk for the resume path, such as delaying r=
esume
>> for some period of time for affected hardware, but I have no idea what =
to
>> do on the suspend side. We can not just drop device writes during suspe=
nd
>> because some broken hardware/firmware does not let us actually access
>> (and thus suspend) the hardware anymore by the time the suspend functio=
n
>> is called.
>>
>> Guenter
>>
>>> This indicates that the issue is not caused by spd5118 suspend/resume
>>> behavior, but by the unavailability of the
>>> SMBus controller due to platform or firmware interactions during
>>> s2idle transitions.
>>>
>>> Given this, I agree that patch 3/3 does not address the root cause and
>>> does not provide a justified improvement.
>>> I am therefore fine with dropping it.
>>>
>>> Thank you for pointing this out.
>>>
> Hi Guenter,
>
> Thanks for the continued review and for questioning the earlier
> direction =E2=80=94 that helped narrow this down properly.
>
> After enabling full i801 debug logging (included below in this email)
> and inspecting both drivers, it became clear that the resume
> failures are not caused by spd5118 accessing the hardware too
> early, nor by PM ordering issues. Instead, the SMBus controller
> explicitly reports =E2=80=9CSPD Write Disable is set=E2=80=9D, and any
> block write transactions to the SPD device consistently fail with
> DEV_ERR. spd5118 merely propagates the resulting -ENXIO.

Oh no, this likely happens even when merely reading values, as the spd5118
uses a page register to switch between different register pages. In order
to access temperature data (page 0), you might already have to issue a
write access to the page register. The only reason why it works for you
is that the spd5118 likely already has page 0 selected by the system firmw=
are
during boot.

> With that in mind, I have dropped the earlier patch that attempted
> to remove hardware access from the suspend path
> unconditionally.
> That patch does not address the root cause and is no longer
> part of the series.
>
> I am instead proposing a minimal 2-patch series:
>
> 1/2 records whether the platform enforces SPD write disable at probe
> time (no behavior change).
> 2/2 avoids regcache writeback during suspend/resume when the device
> operates in read-only mode, while still allowing read access to
> temperature inputs.
>
> This avoids issuing SMBus transactions that are architecturally
> blocked on these systems, and does not rely on
> delays or PM ordering assumptions, and leaves behavior unchanged on
> platforms where SPD writes are permitted.
>
> If this direction looks acceptable, I=E2=80=99m happy to re-spin and pos=
t the
> series formally.
>
> Thanks again for the guidance.

I do not know if this is a reliable solution, as the system firmware might
select a different register page during resume. This will then prevent the
driver from functioning.

I would love to see the spd5118 driver working on such systems with reduce=
d
functionality, but i will leave it to Guenter to decide if this approach i=
s
maintainable.

Besides that: did the spd5118 driver load automatically on your device?

Thanks,
Armin Wolf

>
>
> [   13.530830] i2c-core: driver [spd5118] registered
> ...
> [   29.555298] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> ...
> [   29.582447] i2c i2c-14: Creating spd5118 at 0x52
> [   29.590744] spd5118 14-0052: probe
> ...
> [   29.618983] spd5118 14-0052: DDR5 temperature sensor: vendor
> 0x00:0xb3 revision 2.2
> [   29.619662] i2c i2c-14: client [spd5118] registered with bus id 14-00=
52
> ...
> [ 1057.504362] PM: suspend entry (s2idle)
> [ 1057.944405] spd5118 14-0052: Entering suspend path...
> [ 1057.945387] i801_smbus 0000:00:1f.4: i801 access: command=3D1a,
> size=3D8, addr=3D0x52, read_write=3D1
> [ 1057.946251] i801_smbus 0000:00:1f.4: i801 access: command=3Db,
> size=3D8, addr=3D0x52, read_write=3D1
> [ 1057.946866] i801_smbus 0000:00:1f.4: i801 access: command=3D1a,
> size=3D8, addr=3D0x52, read_write=3D1
> [ 1057.948324] i801_smbus 0000:00:1f.4: i801 access: command=3Db,
> size=3D8, addr=3D0x52, read_write=3D1
> [ 1057.949817] i801_smbus 0000:00:1f.4: i801 access: command=3D1a,
> size=3D8, addr=3D0x52, read_write=3D0
> [ 1057.949904] i801_smbus 0000:00:1f.4: i801 timeout: status=3D0x4,
> SMBHSTCNT=3D0x15, SMBHSTSTS_DEV_ERR=3D4
> [ 1057.949952] i801_smbus 0000:00:1f.4: No response
> [ 1057.950215] i801_smbus 0000:00:1f.4: Entering suspend path...
> [ 1059.338647] ACPI: EC: interrupt blocked
> [ 1060.756385] ACPI: EC: interrupt unblocked
> [ 1060.926423] i801_smbus 0000:00:1f.4: Entering resume path...
> [ 1060.926623] spd5118 14-0052: Entering resume path...
> [ 1060.927930] i801_smbus 0000:00:1f.4: i801 access: command=3Db,
> size=3D8, addr=3D0x52, read_write=3D0
> [ 1060.927969] i801_smbus 0000:00:1f.4: i801 timeout: status=3D0x4,
> SMBHSTCNT=3D0x15, SMBHSTSTS_DEV_ERR=3D4
> [ 1060.927995] i801_smbus 0000:00:1f.4: No response
> [ 1060.928477] i801_smbus 0000:00:1f.4: i801 access: command=3Db,
> size=3D8, addr=3D0x52, read_write=3D0
> [ 1060.928517] i801_smbus 0000:00:1f.4: i801 timeout: status=3D0x4,
> SMBHSTCNT=3D0x15, SMBHSTSTS_DEV_ERR=3D4
> [ 1060.928543] i801_smbus 0000:00:1f.4: No response
> [ 1060.928582] spd5118 14-0052: Failed to write b =3D 0: -6
> [ 1060.928707] spd5118 14-0052: PM: dpm_run_callback(): spd5118_resume
> returns -6
> [ 1060.928981] spd5118 14-0052: PM: failed to resume async: error -6
> [ 1062.414560] PM: suspend exit
>
