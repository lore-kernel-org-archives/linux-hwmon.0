Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCA936A03C
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 19:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768332853; cv=none; b=a8462j6l94rh6BKaTCsctVSmYJjgu16H4tS5Cdb0TctutA9KzDmdqxmzxbeG/gh0au7Ko4eykFiM2LbCjFouQGhYMaY3HoAjSV6+w9suP3a2pbc2BI6TZn09pWjwRdN1tDkBnjB1laAgSWwaiSbYi7ND4XlyYQ9OZRtm2HPuKmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768332853; c=relaxed/simple;
	bh=IIo3otIxkfWJsBMWTGV/E/M9oIHe6PFfFb01Xt8ExQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d957ly6NqM4Mh3necwUT2IfFw3y+NZihuZiTnBgBhwxa9W0CBNRJvaretYnGqGzGccNJE2H+/1iSt9pTXortOfbtXjy5PEE6aGHFlo0Mb2iuaEbDmjqNUNDjBcUZnyBRRDOPcbBf8SAQQ+BHoPRt86u6mEbs0xoierZUCcompco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4ZCsUFC; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4ZCsUFC"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12336c0a8b6so36123c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 11:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768332851; x=1768937651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lNRTfn/LBULUcHzAuHF2bpPQhwFc1fpfLEYpoQ9g3A=;
        b=V4ZCsUFCiBjF113EmjmPhUvQDsEJnyRXrwTPpbMG1xSOeyMpU/cfgufbYGicbRFtvY
         jOE2tm/3+Uw4x+lvLLj6pf7vuyfX8uPwhm2v7U28AzTBMTP7NQAN0tUcOHdZxR3W5QrH
         DzsOi7B/3Popo9L+CgOTAW3nszTjyJqLBtNMxZI7+6HtlX9+piuzXIhLnHKzDhkM/iGN
         y13YlwERqXIqsoeaubYdQ5x34OEwAXfnVI+XWnR3u2kZyXqbuuyZAKtVSmd0MC3ZMnVX
         GfGuUpP/Ee+8SvRUpfOP1pXs5I9mBulOp8w7wjOZuq00njzgEpqbrZv/TX0krAFbyrbc
         0d7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768332851; x=1768937651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5lNRTfn/LBULUcHzAuHF2bpPQhwFc1fpfLEYpoQ9g3A=;
        b=uoK9fZuG3hAGO+IXfTHsXH0Y7BXZxurXYzO0L08FC4P7wEzgRoBSNhQ0xWt6G1PL2u
         Xk5Xxy2hQNbwhHWbXIYWj/vRDbGR/AUiMvM9H3BaTGnK9zFFD2uwL4Fq9oqZWqB5aJoz
         t49uXJrPNuQBMDFPTHTBxOwbLnrefWm7HCbozOvfBAxyMM50aM4YTHFyyXhtrb/4Q2NY
         6XLCOrKVldPy23SnMkSPE95AF7JgjCl+14sm2mWAw0dNqLeKak1QbHus4wysChD2AW34
         AUhdnupn733z7Tk8y3Ush5iJ4pb4bzzOdqblo/S3U7ZRRpI27Vlb6KgL8brvGrMwizXG
         IRDw==
X-Forwarded-Encrypted: i=1; AJvYcCWMAN7xFRbtlYx6RBM5nbzQlssA5sJvY/SUIeW36ZWms+yjSyZ/5PYVRvAAz5zL9cIGEpWrpINCpeimlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG3AmyrjiujjpJEvbHKih05h5XJA1Jhwz0hJU/JRurVQHSocuS
	81WajR95OuA9NqYA7/NV4F8AYU8/kK2tGuwvR4uDI7Dohn2HWPPOAgQnnHugsIR3FRguJQzgvo5
	fFbK3lXK6VXH/U/A0yhkyR0m+ubTAtO8=
X-Gm-Gg: AY/fxX4MWL6OXDXpro7zzTQtUr9gPJb/iupstDG1N+jBX8/loFtrNWUnwH6YTMEgVFW
	55vPwWB1sPehHVtyclk8GSz1C7aP7khPxE09qGTuxE39txDlK40tFtU0xhDsq4b47NfK1oFsISs
	NB4hRnjvj9ObNCWSSw/7nb4sYdHnaYPjY9V2n4Os6MJK+ChcX58d5alSe225mAU+MgMIJQ2Gw/Z
	JeNHpfDhFSnvlE0gyZWLOjOvzgbnWSyZEIPlq90J0xQLWQh6iOEwqtfnblU+Jqs8EEY6KZA
X-Received: by 2002:a05:7022:2207:b0:11e:f6ef:4988 with SMTP id
 a92af1059eb24-12336aa7dfdmr155061c88.36.1768332850771; Tue, 13 Jan 2026
 11:34:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <d08f3edd-f5bd-4e6b-b174-e768d42df281@gmx.de> <6da5b1c1-bbe5-40a8-8363-3213265fe848@roeck-us.net>
 <a43a785a-2b43-4588-8fbf-5eaec398acb9@gmx.de> <43ea9f60-aa92-4c2f-b263-6a952a837a19@roeck-us.net>
 <2469185c-a1f9-42dd-a03f-5755c3d5ac09@gmx.de> <0724f25e-64b4-46c8-8def-2dca1b335d24@roeck-us.net>
In-Reply-To: <0724f25e-64b4-46c8-8def-2dca1b335d24@roeck-us.net>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Tue, 13 Jan 2026 22:33:53 +0300
X-Gm-Features: AZwV_Qizoz5nJwuxnkHGSf5YtNecWQ6h9tUv8P0FBnF8IhSutU3WY57dg-To_Uo
Message-ID: <CAJ12PfNg_q5m8tLo_ofVgE7fTr4uVDzVuLSTe202A_8ygRgQAw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C errors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 10:11=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 1/12/26 10:22, Armin Wolf wrote:
> > Am 12.01.26 um 19:17 schrieb Guenter Roeck:
> >
> >> On 1/12/26 09:46, Armin Wolf wrote:
> >>> Am 12.01.26 um 17:36 schrieb Guenter Roeck:
> >>>
> >>>> On 1/10/26 14:27, Armin Wolf wrote:
> >>>>> Am 10.01.26 um 18:19 schrieb Tinsae Tadesse:
> >>>>>
> >>>>>> SPD5118 DDR5 temperature sensors may be temporarily unavailable
> >>>>>> during s2idle resume. Ignore temporary -ENXIO and -EIO errors duri=
ng resume and allow
> >>>>>> register synchronization to be retried later.
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> do you know if the error is caused by the SPD5118 device itself or =
by the underlying
> >>>>> i2c controller? Please also share the output of "acpidump" and the =
name of the i2c
> >>>>> controller used to communicate with the SPD5118.
> >>>>>
> >>>>>> Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
> >>>>>> ---
> >>>>>>   drivers/hwmon/spd5118.c | 8 +++++++-
> >>>>>>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> >>>>>> index 5da44571b6a0..ec9f14f6e0df 100644
> >>>>>> --- a/drivers/hwmon/spd5118.c
> >>>>>> +++ b/drivers/hwmon/spd5118.c
> >>>>>> @@ -512,9 +512,15 @@ static int spd5118_resume(struct device *dev)
> >>>>>>   {
> >>>>>>       struct spd5118_data *data =3D dev_get_drvdata(dev);
> >>>>>>       struct regmap *regmap =3D data->regmap;
> >>>>>> +    int ret;
> >>>>>>       regcache_cache_only(regmap, false);
> >>>>>> -    return regcache_sync(regmap);
> >>>>>> +    ret =3D regcache_sync(regmap);
> >>>>>> +    if(ret =3D=3D -ENXIO || ret =3D=3D -EIO) {
> >>>>>> +        dev_warn(dev, "SPD hub not responding on resume (%d), def=
erring init\n", ret);
> >>>>>> +        return 0;
> >>>>>> +    }
> >>>>>
> >>>>> The specification says that the SPD5118 might take up to 10ms to in=
itialize its i2c interface
> >>>>> after power on. Can you test if simply waiting for 10ms before sync=
ing the regcache solves this
> >>>>> issue?
> >>>>>
> >>>>
> >>>> It seems to be highly unlikely that this code executes within 10ms o=
f powering on the memory.
> >>>>
> >>>> Guenter
> >>>>
> >>> AFAIK the 10ms are associated with the VDDIO supply, the VDDSPD main =
supply is different from that.
> >>> I just want to test if this device disables VDDIO during suspend-to-i=
dle.
> >>>
> >>> I have another theory: if the SPD5118 somehow looses power, we might =
still need to manually put the
> >>> device into 16-bit address mode using standard 8-bit i2c commands.
> >>>
> >>
> >> Uh, no, we can not do that. I tried. Changing the access mode causes b=
ad hiccups at least
> >> with some boards. They interpret that as a memory configuration change=
, and the next warm
> >> reboot will end up in the BIOS. Then, after the RAM configuration is u=
pdated, a cold reboot
> >> will again detect a configuration change and BIOS will be entered agai=
n.
> >>
> >> That does make me wonder how the problem shows up in the first place, =
since the BIOS
> >> usually does access the SPD5118 during resume, at least on my systems =
with DDR5. Granted,
> >> those are with AMD CPUs, but I would assume that Intel BIOS versions a=
re not different.
> >>
> >> Guenter
> >>
> > During suspend-to-idle the RAM stays active, so the firmware does not r=
eally need to access the SPD device.
> > I meant that if the SPD device is configured during boot to operate in =
16-bit mode and looses power during
> > suspend-to-idle, the firmware might not reconfigure the SPD to continue=
 operate in 16-bit mode after resume.
> >
>
> This would be a severe BIOS/Firmware problem. I'd really want to see evid=
ence that
> restoring SPD5118_REG_I2C_LEGACY_MODE is necessary on resume before touch=
ing that
> register. Even then I'd want to see evidence that touching it doesn't cau=
se
> problems on a variety of boards before actually doing it. After all, we w=
ould not
> know if the register was reconfigured by the firmware for some reason, or=
 if the
> chip lost power and the firmware didn't handle it.
>
> Having said that, even if there is evidence that the chip can lose power =
and end up
> in the wrong mode on resume, I'd rather check for that condition, issue a=
 WARN_ONCE(),
> and disable the driver instead of touching its configuration.
>
> Sorry, but from my experience SPD5118 access in general is quite fragile,=
 and not
> touching its configuration was the only way I could find to make it work =
reliably.
>
> Guenter
>

I experimented by configuring the driver to observe
SPD5118_REG_I2C_LEGACY_MODE and SPD5118_REG_TEMP_CONFIG registers
before suspend and immediately after resume, prior to any
driver-initiated writes.
Across multiple suspend-to-idle cycles, register values remained unchanged,
indicating that the SPD5118 does not lose configuration and
does not require reprogramming of legacy/16-bit mode on resume.
Resume failures correlate with temporary I2C unavailability rather
than loss of device state.

Since the device configuration remains intact across resume and the
failure correlates with I2C availability,
restoring SPD5118_REG_I2C_LEGACY_MODE is neither required nor justified.
For this reason, I agree that restoring this register would be unsafe
without broader platform testing.
