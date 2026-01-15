Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2483BF30C
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 17:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768499160; cv=none; b=rzViOtT6atmhDuAoEGcklCLn56t7bFkPOgQo/2FeK0vlq1xwKzkiFPY29pSflzEswYNxBdQZKo7gYcD7a6dulYRVQIBImP50FfIbAEt4OR5pThJIvZ51CGAnOjbtnyDUz+Til/oebbJ8DxQZAp3PzWcm0JlmBMUUYguzBbhVRwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768499160; c=relaxed/simple;
	bh=eKra1XvgHJ6SvqIF7FxO0dT7Y08CORzoHEoAaCLzxLk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=bJOqNZp86AEJSfVPJGh514qgboQifcKgMpt3w1NTxnQBbcCnIJi7ycdjKYv0de8vgikylrhkmy9LqYEynBnd+9njnDxCONZn9TyU0CAZI0nya5mJuInGyT1tyDfdYegtZYKpiQYa32fw7Qa6C8/cWRpH/cesD39AsBvXs7XsEQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNVRipF3; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNVRipF3"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12331482b8fso3776969c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 09:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768499157; x=1769103957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yeLijAMC00pKoA2EXm21lHoj40uToeif1T9tBKkAUjI=;
        b=KNVRipF34Ss3z88W1lwJKocoh+h9AH0Rj5nXo3HVHUYsxCpf7lUCeKlbWiPv1tCJFi
         NQ0QlZbF9JrHqCpGVZGts2X6kGeVqBi8f6vDO1zDMdZJz68ndG29VKFeEfT68uK6OoO/
         pWfaCxqrjYtYYgjRIqiYzlQLXCiP3CXZ0ceZB8SYeXsiWEdD9LqP89ZgiUL3T8MsVUCw
         mnxtCHVjtu/cWYVINg7lxP9TetOU5FaNB4D0aFnvnPTXuow9yM/ECi9VnAPhJj83TRb1
         vt43UpmxavT58E7Fry6HfzA5Pq2HZLGJfIGRojHToNdRcfdgoQ80yTgRI5fU7xWuy3W/
         XE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768499157; x=1769103957;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yeLijAMC00pKoA2EXm21lHoj40uToeif1T9tBKkAUjI=;
        b=ORQ6tqwDg2lTKbXwa9XyBF6gCtq+lyVXNV8R3WlVeIZhp7N6eNfdu7HWjnAaLpCQVN
         c5fT+giCh44YBRyABf0xOQRp8iUJdz2kwYAwgnsfYvMfVj1vkpvUikFsPm4+PTtiI9On
         JEhncXqpSsavZYpn5Nnq3vt4+3jxSJr4tEHCkBfh4oELsWrXb0vTD0VS/9Tp6iXUbi4X
         caYrhU9lDD/Xo1OQott3An+sysTd/0D4tzgcZRlKvTwsF7f3XRMGp5zwWO+7rjPrnrCa
         wXm9PrlTX0ZdHJOokU1r4EId0W7oLvd0l2dC4yvzoe2pmP0BgWs8S9uwKY4Kn8zwQlpA
         CpyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8+Q7Ktjeg63EC3gMOUb6KxcmDgeX/RsetcUO02XUTK2gNA2e8hu48UIZ9/EEIr0IqGDkfGUPkfiJZ+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2LiJi2Voo7cCf/i+QQqfxmrQiCZ41hX+JiQocXY2D+sd5tBG5
	qGhfEMNK6qjBTtf8u+5OjZiL5JNKXTP3u0SeWNXzNUuEOoQ6/J4wSJDd
X-Gm-Gg: AY/fxX7e2QwSgfE5C7NYECEkLg/aq9aw8SSTrfuF9uhSLyJnQuMXBM6rMK90KoRrr5i
	adaRbI+taxcbAGxV0zfyNEJxQn7CKaqQT+hsGlg2ZwnPea1j2yAWoIUGFtyZPTw9oyZQ05uXNPa
	Sx/ZzKp9icHDtI1ygN0dOvjbnuT4CqMOVdI317f5Fvm6AWN+ZzXm4LHLCZhtpFzuV8RvOHMKbuS
	i3iU21yraqzw5hhxySYAhpqV29Z8D72asmSyKJZ0L0lU1U/PCaambQe9FZQdUz2sesv8UOJwLQG
	ZV6ZqG8boyT+/I/pPqvjFDPNBRPYk6TZH9I99p4VwAsPFwTZ4BTYcF8hKVPyTkKo48c1WwslUhh
	FHBZaPUlL05kDLwUHqvGP4k9Ki0102pOEkPSI7nosUXLKBmw//bqV+UrRyK7dd9++nDIlpx/hob
	HVLmGnW92MzdgTRNC8fFJP2EFUXTQvkbkyZa/oam0th8+M+WaM6MJyQr53MEwcZ9909Zsfyeg1e
	HlE1gKycQ==
X-Received: by 2002:a05:7022:2385:b0:119:e56b:9590 with SMTP id a92af1059eb24-1244a736f5fmr650686c88.21.1768499156676;
        Thu, 15 Jan 2026 09:45:56 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10c3csm167330c88.15.2026.01.15.09.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 09:45:56 -0800 (PST)
Date: Thu, 15 Jan 2026 09:45:55 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v9_7/7=5D_platform/x86=3A_lenovo-wm?=
 =?US-ASCII?Q?i-other=3A_Add_HWMON_for_fan_reporting/tuning?=
User-Agent: Thunderbird for Android
In-Reply-To: <9ff2b73e30f06be69b6c0b72b91a19d766310db7.camel@rong.moe>
References: <20260114122745.986699-1-i@rong.moe> <20260114122745.986699-8-i@rong.moe> <DFOQB6DGBKBZ.39JQKPB7XDSJG@gmail.com> <1a9909f4083d85736a1e28067517ae0899e462f2.camel@rong.moe> <DFP7SAGSD32N.3SIIV8JMYHWRM@gmail.com> <9ff2b73e30f06be69b6c0b72b91a19d766310db7.camel@rong.moe>
Message-ID: <59A79FD4-0A1C-4FFE-B4BC-D24588785717@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 15, 2026 8:57:42 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Kurt,
>
>On Thu, 2026-01-15 at 08:58 -0500, Kurt Borja wrote:
>> On Thu Jan 15, 2026 at 8:03 AM -05, Rong Zhang wrote:
>> > Hi Kurt,
>> >=20
>> > On Wed, 2026-01-14 at 19:16 -0500, Kurt Borja wrote:
>> > > Hi Rong,
>> > >=20
>> > > On Wed Jan 14, 2026 at 7:27 AM -05, Rong Zhang wrote:
>> > > > Register an HWMON device for fan reporting/tuning according to
>> > > > Capability Data 00 (capdata00) and Fan Test Data (capdata_fan) pr=
ovided
>> > > > by lenovo-wmi-capdata=2E The corresponding HWMON nodes are:
>> > > >=20
>> > > >  - fanX_enable: enable/disable the fan (tunable)
>> > > >  - fanX_input: current RPM
>> > > >  - fanX_max: maximum RPM
>> > > >  - fanX_min: minimum RPM
>> > > >  - fanX_target: target RPM (tunable)
>> > > >=20
>> > > > Information from capdata00 and capdata_fan are used to control th=
e
>> > > > visibility and constraints of HWMON attributes=2E Fan info from c=
apdata00
>> > > > is collected on bind, while fan info from capdata_fan is collecte=
d in a
>> > > > callback=2E Once all fan info is collected, register the HWMON de=
vice=2E
>> > > >=20
>> > > > Signed-off-by: Rong Zhang <i@rong=2Emoe>
>> > > > Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> > > > ---
>> > >=20
>> > > =2E=2E=2E
>> > >=20
>> > > > diff --git a/Documentation/wmi/devices/lenovo-wmi-other=2Erst b/D=
ocumentation/wmi/devices/lenovo-wmi-other=2Erst
>> > > > index 821282e07d93c=2E=2Ebd1d733ff286d 100644
>> > > > --- a/Documentation/wmi/devices/lenovo-wmi-other=2Erst
>> > > > +++ b/Documentation/wmi/devices/lenovo-wmi-other=2Erst
>> > > > @@ -31,6 +31,8 @@ under the following path:
>> > > > =20
>> > > >    /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<at=
tribute>/
>> > > > =20
>> > > > +Additionally, this driver also exports attributes to HWMON=2E
>> > > > +
>> > > >  LENOVO_CAPABILITY_DATA_00
>> > > >  -------------------------
>> > > > =20
>> > > > @@ -39,6 +41,11 @@ WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300=
E``
>> > > >  The LENOVO_CAPABILITY_DATA_00 interface provides various informa=
tion that
>> > > >  does not rely on the gamezone thermal mode=2E
>> > > > =20
>> > > > +The following HWMON attributes are implemented:
>> > > > + - fanX_enable: enable/disable the fan (tunable)
>> > >=20
>> > > I was testing this series and I'm a bit confused about fanX_enable=
=2E
>> >=20
>> > Thanks for testing!
>>=20
>> Thanks for working on this!
>>=20
>> >=20
>> > > Judging by this comment and also by taking a quick look at the code=
, it
>> > > looks like writting 0 to this attribute disables the fan=2E
>> > >=20
>> > > This is however (per hwmon ABI documentation [1]) not how this attr=
ibute
>> > > should work=2E IIUC, it is intended for devices which can disable t=
he fan
>> > > sensor, not the actual fan=2E

I agree, it's just for disabling the reporting of the rpm, not for disabli=
ng the fan=2E I didn't catch this before=2E

>> >=20
>> > Hmm, what a confusing name :-/
>> >=20
>> > > I fail to see how this feature is useful and I also find it dangero=
us
>> > > for this to be exposed by default, considering the same could be
>> > > achieved with the relaxed module parameter, which at least tells th=
e
>> > > user to be careful=2E
>> >=20
>> > Makes sense=2E I will remove the attribute and mention such behavior =
in
>> > the module parameter=2E
>>=20
>> Also, it would be worth to mention that writting 0 to the fanY_target
>> attribute is auto mode, right?
>
>Ah, yes=2E
>
>> I was testing the fanX_target attribute and it does work as intended,
>> i=2Ee=2E the fan speed changes to the desired speed=2E However, every t=
ime I
>> write to this attribute I'm getting -EIO error and it always reads 0=2E
>>=20
>> For example:
>>=20
>> 	$ echo 3550 | sudo tee fan*_target
>> 	3550
>> 	tee: fan1_target: Input/output error
>> 	tee: fan2_target: Input/output error
>> 	$ cat fan*_target
>> 	0
>> 	0
>>=20
>> But as I said, the fans do reach the desired speed (an approximation of
>> it):
>>=20
>> 	$ cat fan*_input
>> 	3500
>> 	3500
>>=20
>> This is a bit weird, but I haven't look in depth into it=2E I will find
>> some time to do it later=2E This happens on a 83KY (Legion 7 16IAX1)
>> laptop=2E
>
>I'd like to fix it in the next revision=2E Looking forward to your
>progress in debugging :-)
>
>It seems to me that the corresponding ACPI method did not return 1 on
>success=2E There should be some clues in the decompiled ASL code=2E Could
>you attach it in your reply? The HWMON implementation was developed
>mostly based on my understanding on the decompiled ASL code of my
>device=2E I'd like to check the one of your device as a cross-reference
>to see if there are more potential bugs=2E
>
>> As it seems that you can change the RPM in 100 increments,
>
>Yeah=2E That's also true on my device, but I am not sure if all devices
>with the interface behave like this=2E I'd prefer not making such an
>assumption=2E
>

fanY_div maybe makes sense here, defaulting to the known 100 and adjustabl=
e with a DMI quirk table if we find devices that do 200/50/20/etc=2E?

>> maybe you
>> could look into the pwmY attributes [1]=2E I think it is a better fit f=
or
>> this feature because pwmY_enable allows you to select between manual an=
d
>> auto fan control [2], and I believe some user-space tools already use
>> this attribute=2E
>
>For pwmY, I don't see the point why the kernel should adapt to
>userspace tools=2E=2E=2E If we don't have to, don't be overfit=2E
>
>For pwmY_enable, it is only a good choice if we adopt pwmY=2E It's weird
>to mix pwmY_enable and fanY_target=2E
>
>@Derek, may I ask for your opinion here? Should we adopt pwmY*?
>

All the platform drivers I've written used pwmY/pwmY_enable and fanY_input=
 for reporting speed=2E There is additionally a pwmY_enable mode that sets =
the fan to max speed=2E TBS, I think it's a fundamentally different interfa=
ce=2E

>> On the implementation you can use fixp_linear_interpolate() [3] to
>> convert between and from pwm duty cycle=2E
>
>If we adopt this, I could imagine three ways to create a PWM-RPM curve:
>(1) PWM[0,255] =3D> RPM[min,max]
>(2) PWM[0,255] =3D> RPM[0,max]
>(3) PWM[0,255] =3D> RPM[0,a_large_number]
>

I don't believe this is canonical for pwm, normally you set a fixed speed =
with pwmY, let the BIOS handle it with auto, or set to max speed with the e=
nable function=2E Fan curves would need to be under pwmY_auto_point_pwm[X|Z=
], but they're usually paired with tempY_auto_point_pwm[X|Y] to set a speed=
 at a given temperature, not necessary to restrict a min/max=2E

Docs: https://docs=2Ekernel=2Eorg/hwmon/sysfs-interface=2Ehtml

The nature of pwm is that a fixed pulse width determines a fixed fan speed=
=2E It is necessarily a single set value=2E If you want a range, fanY_[min|=
max] seems the way to go=2E

Using pwmY* will also collide with the fan curve patch I'm adding after th=
is series since newer devices have a 10 value speed Y at temp X curve built=
 into the WMI interface=2E Not insurmountable, but I'd rather avoid the con=
flict so we're not matching on GUID or something like that=2E

Cheers,
Derek

>relax_fan_constraint=3D1 definitely needs (3) as the fan can spin
>slower/faster than min/max_rpm=2E I don't want to create scale mismatches
>between relax_fan_constraint=3D1 and =3D0, so only (3) looks viable to me
>in any case=2E Hmm, we are creating a weird PWM-RPM curve with two
>plateau [1]=2E
>
>> This is just a suggestion though, I know I came in too late to the
>> discussion but I just got this laptop :P
>
>Happy hacking :P
>
>ThinkBook (my device) only implements few Legion interfaces, so your
>information here is very valuable=2E
>
>> [1] https://elixir=2Ebootlin=2Ecom/linux/v6=2E19-rc5/source/Documentati=
on/ABI/testing/sysfs-class-hwmon#L297
>> [2] https://elixir=2Ebootlin=2Ecom/linux/v6=2E19-rc5/source/Documentati=
on/ABI/testing/sysfs-class-hwmon#L312
>> [3] https://elixir=2Ebootlin=2Ecom/linux/v6=2E19-rc5/source/include/lin=
ux/fixp-arith=2Eh#L145
>
>[1]: Typical curves look like
>https://www=2Eoverclock=2Enet/threads/are-voltage-controllers-for-fans-ba=
d-and-pwm-controlled-fans-better=2E1627409/#post-25993378
>
>Thanks,
>Rong

