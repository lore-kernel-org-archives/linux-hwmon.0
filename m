Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794235966;
	b=ViFZk9vprrhqbp+T6+D4nQ6t/5VK98gjyCK02nUoiqCuPtqW/x902ORoSzm3dVJwYSLk
	 R808lD3j86zsK+mJpSam3clF53b22RZbbMvy3OhebPAggZ/Tax5cywJImAUsE6newAdnu
	 cpkBzq7ulRDdk10Ct/Ajed4WqBL6xpkpBVNbGfwvcoK2Rw0KGE7WSND655dyuzMyPySHS
	 Bj1qo21t8GY+bjwip4IaPVozL5JsPtVJUlEy8D7cuBJbVtTQpZJl1jr1YWYdAgPx79Ztk
	 3tt7WCI3DZNgNiRVV4N3M2Qq7WJ+rkJ68tpzp6gurVYghXtVZ2fdY/TuxEl/tSC5Wow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ITI1Hu+sB84O3i5CuT1vzHZvkT3z53SspgQZfJcrRIo=;
	b=d8TOtd598oop0HQP4EJmwuFswAPlSEC3JAm9gKAjT/eKJHAiuj7TGJD+pWhq3qVuHuzj
	 JVZXiXZcTteAMxw8g86nxp9HiAc/PnWuRFscS+TcDKgnJMKgF36wKCfz9AyG2n/bNJak1
	 RjHf5SEuQJrh8Swl9Ob9fY2+mCJqkAtIEyK18GbAvM4hQ32/UCLJ06sUk6b88ErvhpZsC
	 TbmFEAz3XB/oqzNI4hYmqM4ayMEbP6q8QncO/sqNsvzDgQF3zDRG8OI2OYfu1zeii8B+q
	 Wjk3v/mE44uZEbGrI+FnSmpwmvUIxkat5TqqDTVeSP12+CqQWSt9mehrIU7HWejDrzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qUJhtjWh;
	arc=fail smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7DB606A322
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 14:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC7DB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qUJhtjWh
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be4b29df8cso97203e87.2
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 06:52:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794235964; cv=none;
        d=google.com; s=arc-20260327;
        b=Wf7rkPUQNnqujD6+UGzJFQqRNd2Cby40IKTaq9tQw8dezv/o4+W2SotzvP2hwiYpLH
         12MYVRw5UOtZODYAfjRQKMAJ1CjTkhvLQiVvRXxyByEs5zOoerUeWXffYyX6WU5w0K7w
         WtP4NDrRN+VWbZOFqOwe0JIwuAQjotOqRXe8jo4/Yc0XqWhdVwUNBHgcgOl5BLLOqaX/
         a9ydrdg21x9jaYX54VinnJToeQYS1AvYT2QdnhaAICnmZFZvgt17rd27Io7v8qR77FBk
         +R3fXF3mERp4bYvZkFwW/6FRhqZ9Ky1G9JO99hfYyvyyUuMViFYMY8Um1KevnDFNJJ9r
         JIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITI1Hu+sB84O3i5CuT1vzHZvkT3z53SspgQZfJcrRIo=;
        fh=3Aaxkm+W3XkrmDcAPBzhajhoBwcazHVh2VfgtpVibO4=;
        b=U6Z1n4tzkrwpmd+EX4kGQWV5hMYdwUaLTti6W1ZYG29fil+lMGMf/+c4/uiguBLIa+
         ix/tJYVlJb+2UD72ecu7RjE2oUm40SdRMSlH1HBTmQWDy+MS3KLEgO5o/G0fx0+MtqG3
         fGGEan1lQPu4+6qvc1Ii/TWipwtlM4byimKwo1sHRBo7pHHxH58Y5QKyUAvOFNEX7rQ0
         uD5cWBYiOdFIY3febwh8ENWB2ACla3+nXxQvmM1mKc+XFHl52O8EidXxjeDlTv+M9JLz
         lOy2WtjrCwkWTX7Hw1+NDNXSaRHQt6JN/EVh5Y9kP8nKAdbIKshxD6g9IRNEYNmHbwCh
         Fl6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794235964; x=1794840764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITI1Hu+sB84O3i5CuT1vzHZvkT3z53SspgQZfJcrRIo=;
        b=qUJhtjWhIhdzF7W5AovdtbZkCdE9BAe1MVigA3VBPmxBPDKpi3deDeHMhAHDkDR6e+
         E0paQjhaVaGlVPWYMmSdeo+v4wJHkWJfHfriqBsiEWwPdR5DJozRtVoFllXoeg5e1Xgp
         zfq8bgQtmkTdkPNQeQs4ILXyP8/1Dq7lU08j7EjamquaWAkFY7fSVgW66EMseMmU6k/n
         s8Xo8YyrvCBk4zCWF2sD+3jsoUePmO059Z18g/otKtaj+sPitCmYd15wAZmGdfY8eLV4
         cGRuMKwRHbC+1fJ+KXMPxsr6cn1g/c69FJF8/nR4Q4bDgaAcPVraQ6J2xzPGlT0gDAvm
         O9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235964; x=1794840764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITI1Hu+sB84O3i5CuT1vzHZvkT3z53SspgQZfJcrRIo=;
        b=ooDYgstNleUcE3c2EK2VniY/VKEYMThbkghGVLtWXecH9jbdn2/uW2xvxLM9uWJjQ/
         b/vyJ3SCGO0IW8FejweD1M3Mzvjj6trNJpmbctLCD2OcUqJzqrb3jevm+4mqmU1SPbGc
         JgGVWuoD5jHUgzYnCtY5xBZ9WrkLaKUAT0svZq1a+z408Bx5oApW+kIYxv8KbFd4u7pk
         uosXbrHQi93IYXl5I9+oZL9E/47ZslbroH2XxYfhFOw5GBMpDfivKYQ/gZZ44IC/3CMy
         mU04ROVkuM76KmOGZpOtt6RkGxuBqlGFA3GBxUPRYfI9RLpEcXSZxnbTVCnEtiTHvats
         Speg==
X-Forwarded-Encrypted: i=1; AL+hErFPfrbZ9tWX0E6LtBOVCEDADAodQXxWL9c3RANnfbMFaMqzmJusBuyMjtjymYkQavjVaYfITwD9/d1dag==@vger.kernel.org
X-Gm-Message-State: APuU4Z8oIqFZUcNZ699DQlq+MYWt0ImVML4E2v+L3RR43G2e8pZEe7iP
	aq5xwFtXkPf/zXsOVIknO+Lhq90/CMvGIlCEPb7xOybXtoJTu7G1w5lNN8npSpfUj1vSfcjtaMP
	QjdbiMzbMbMIIik31vpQbS07vKq85jyo=
X-Gm-Gg: AYBFou1UqHlQWmWwnhU/cRNpTlwJe4bi/6r+h4eRrxqkwxtttU7v9GysSLwkmso8nLM
	xuEReoJzpxTffcNXrzU60YLiiGuNKgdAFsA+EUOq0cRlLme4PzTYP8nxXfRIjp3ybFySsHdzS1Y
	ZdueWYwSWSDfYFSYryoN9v3rYgl9vwM272UPz1bVgp9hrJHeeunlyVHhRSa7H8HFYaNlc0A5wZ+
	fzMuDgFKW1E1I9kqjeXbr6y12qpPB438/tdZZysgd3q2L6gXiHl0vY1P57bKvQYR4sXz8sT9sEW
	M1mRcimdhrzLJvfdQzAkwYLJawPQR91mC65UCXPEQjE2nxCQqLRJ9lxbq9/civItPV/PqWK95CV
	zyyPt2cyDmFJIiDlyYWaI/dcQf97s+SivB/dY/VaBXgMU+ea6mQHBPiDUMSzBoP7BNRnYPw==
X-Received: by 2002:a05:6512:6516:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c14bf215b5mr1121239e87.0.1794235963672; Mon, 09 Nov 2026
 06:52:43 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>
 <asxTYBiGy6lf6-Ki@archlinux> <CAPvUaSo-ubCOCYYPadY1C23y1Fd_AAhQLuVKWRa6F1XVh6mk_Q@mail.gmail.com>
 <asz7WqGzukhkYHGD@archlinux> <CAPvUaSrbWrBuvAi3R02xC8w8M5Yh97pVd3-+FBXLp3mPgG5cUQ@mail.gmail.com>
 <as0bOFOoaaw-smyB@archlinux> <CAPvUaSoBgAG=MX93vMhfEiEk5bYXGydFsGn8CpoCu_QVQRPTCQ@mail.gmail.com>
 <CAPvUaSpPVYc-5M72G0Hf9JPsbdAp2-4f-p5OetYbMKdLqm0PXQ@mail.gmail.com>
 <atEh9Gon95EFIq76@archlinux> <CAPvUaSpq2d5hkxTaqAL6rBoeHct68Y37C4nSpV+goGZ-QwrCsw@mail.gmail.com>
 <atJc2J2hYrdI_Eun@archlinux> <CAPvUaSqAnLYVuzcq6Zq=hRp6JBoo8upjrsy=LSxnLdXuTyHDaw@mail.gmail.com>
 <CAPvUaSpk3wKyedtwcJpKFeQ_DGRJNa2-wXwVGSzX_bCadWozsQ@mail.gmail.com>
In-Reply-To: <CAPvUaSpk3wKyedtwcJpKFeQ_DGRJNa2-wXwVGSzX_bCadWozsQ@mail.gmail.com>
From: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Date: Mon, 9 Nov 2026 15:52:31 +0100
X-Gm-Features: AclHuK-yHGm_OgM6tGld76Sat-ACVbH1JP4rJO3Tsa8gtHhtCjb26go9NshVU-g
Message-ID: <CAPvUaSpaKUk2Tp2N-0RaaMYUGoYYkTeVJ0As6YxFPRsd_MmXqg@mail.gmail.com>
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Subject: Re: HP OmniBook 5 16-ag1xxx: platform_profile reads "custom"
at boot, fan state carries over from BIOS

Hi Krishna,

Some additional findings on the OmniBook 5 16-ag1xxx (board 8DF4, BIOS
F.12), on top of my previous message.

1. Fan carries over from the BIOS into the OS. With Fan Always On
disabled, if I enter the BIOS setup first (where the fan spins), the
fan keeps spinning after boot until I write platform_profile. On
CachyOS acpi_fan reported about 4000 RPM at idle; on Linux Mint
(kernel 6.14.0-37-generic) it was 4100 RPM by my observation (sensors
did not show a fan1 line there). As soon as I write any profile (for
example echo balanced), the fan drops to 0 RPM at idle and stays
there. I did not check the RPM for each individual profile.

2. platform_profile reads "custom" at boot. On Mint, before I wrote
anything, cat /sys/firmware/acpi/platform_profile returned "custom",
which is not one of quiet, balanced or performance. After the first
write it reported the profile I had set. On CachyOS the profile reads
quiet when I look after booting; I have not yet checked whether a
service such as power-profiles-daemon sets it at boot, so I can=E2=80=99t s=
ay
whether the firmware reported custom there as well.

3. This may relate to the hp-wmi message at boot: "hp-wmi hp-wmi:
Failed to apply initial fan settings: -22". I can't prove the
connection, but the initial fan setup failing and the platform profile
starting in an undefined state seem consistent.

4. Thermal zone 1. thermal_zone1 (TSZ2) reads exactly 20.0 =C2=B0C on every
boot I have stored (17 Oct to 9 Nov), even when TSZ0 was 54 to 62 =C2=B0C
at boot. During a single-core load that took the CPU and temp1 from 27
to 49 =C2=B0C, zone 1 stayed at 20000. My journal only goes back to 17
October, so I can't tell whether it was ever different. It may be a
placeholder value rather than a real sensor.

Separately, the symptom I originally reported is still there: with Fan
Always On disabled the fan does not start automatically under load (92
=C2=B0C on CachyOS before the BIOS reinstall, 85 =C2=B0C after reinstalling=
 F.12
and a hard EC reset). I'm not claiming these findings explain it. They
look like two separate symptoms of the firmware's fan handling: the
fan does not stop on its own after the BIOS handoff, and it does not
start on its own under load.

Happy to run any further commands or test patches. I can send full
dmesg and journal output.

Thanks,
Lorenzo


Il giorno dom 8 nov 2026 alle ore 20:09 Lorenzo Collevecchio
<lorenzocollevecchio17@gmail.com> ha scritto:
>
> Subject: Re: HP OmniBook 5 16-ag1xxx: fan stays off, thermal tables
> invalid, results after BIOS reinstall
>
> Hi Krishna,
>
> A follow-up on the OmniBook 5 16-ag1xxx (board 8DF4), with some new
> data after reinstalling the BIOS.
>
> 1. Reflash result: I reinstalled the same BIOS with HP's official
> installer (DMI reports Insyde F.12, bios_date 04/10/2026, i.e. 10
> April 2026), then did a hard EC reset. With Fan Always On disabled, a
> stress-ng run on CachyOS reached 85 =C2=B0C with the fan completely stopp=
ed
> (acpi_fan: 0 RPM), and I stopped it there. So the firmware reinstall
> did not change the behaviour.
>
> 2. Thermal data from the firmware: on every boot dmesg shows
>    ACPI: thermal: [Firmware Bug]: Invalid critical threshold (-274000)
>    ACPI: thermal: [Firmware Bug]: No valid trip points!
> The only trip point Linux exposes is thermal_zone0 trip_point_0 (type
> hot, 103000). There are no active trip points. Both lines are present
> in every boot I have stored (4 to 8 Nov), before and after the
> reflash.
>
> 3. A new intermittent error: ACPI BIOS Error (bug): Could not resolve
> symbol [^^^^NPCF.DTGP], AE_NOT_FOUND, followed by Aborting method
> \_SB.PCI0.LPC0.EC0._Q37 (AE_NOT_FOUND). It appears in only 2 of my 14
> stored boots, one before the reflash and one after, so it is not
> caused by the reflash and not present on every boot. It seems to
> depend on an EC event.
>
> 4. Fan state: with the fan stopped at idle (0 RPM),
> /sys/class/thermal/cooling_device0 (type Fan) reads cur_state=3D1,
> max_state=3D1. dmesg also says "acpi-fan PNP0C0B:00: Using Microsoft fan
> extensions". I don't know whether cur_state is meaningful on this
> firmware.
>
> 5. Still the same as before: the WHCM/WMAA AE_AML_OPERAND_TYPE errors,
> hp-wmi "Failed to apply initial fan settings: -22", and WQBC/WQBE
> "CreateField of length zero". hp_bioscfg exposes only Sure_Start
> (error 0x3, feature not supported).
>
> I'm not claiming the thermal-table or _Q37 errors cause the fan
> problem; they are just firmware bugs that are present alongside it.
> The fan stays off under load on Windows 11 as well, and HP's UEFI fan
> speed and thermal tests still pass, so I have asked HP for a warranty
> repair.
>
> I'm glad to run any commands, collect more logs or test patches if
> that would help. I can send the full dmesg and the journal output.
>
> Thanks again,
> Lorenzo
>
> Il giorno dom 8 nov 2026 alle ore 11:33 Lorenzo Collevecchio
> <lorenzocollevecchio17@gmail.com> ha scritto:
> >
> > Subject: Re: HP OmniBook 5 16-ag1xxx: hp_bioscfg output and fan
> > results on all OSes
> >
> > Hi Krishna,
> >
> > A quick update on the OmniBook 5 16-ag1xxx (board 8DF4, BIOS F.12), in
> > case it helps with the HP side.
> >
> > 1. hp_bioscfg: the driver loads and registers hp-bioscfg, but the
> > attributes directory contains only Sure_Start and pending_reboot.
> > dmesg shows: hp_bioscfg: Returned error 0x3, "Invalid command
> > value/Feature not supported". There is no fan or thermal attribute, so
> > I can't read or change "Fan Always On" from Linux.
> >
> > 2. Fan behaviour: it isn't specific to the kernel or the OS. With Fan
> > Always On disabled, the fan stays off under load on Windows 11, Linux
> > Mint, Arch, CachyOS LTS and CachyOS 7.3.1-1. A full-load stress-ng run
> > (all 12 threads, platform_profile=3Dperformance) reached 92 =C2=B0C in =
about
> > 35 seconds with no fan. A 2-thread run reached 83 =C2=B0C with no fan.
> >
> > 3. Timeline: BIOS F.12 has been installed since the end of July, and
> > the fan behaved normally until October. HP PC Hardware Diagnostics
> > UEFI still passes both the fan speed and thermal tests. A hard EC
> > reset and BIOS defaults changed nothing.
> >
> > I've also reported this to HP and asked for a warranty repair. I'm
> > happy to test any further patches or run any commands on this machine.
> >
> > Thanks for your work on the hp-wmi fix.
> >
> > Lorenzo
> >
> > Il giorno ven 16 ott 2026 alle ore 19:26 Krishna Chomal
> > <krishna.chomal108@gmail.com> ha scritto:
> > >
> > > On Fri, Oct 16, 2026 at 09:06:03AM +0200, Lorenzo Collevecchio wrote:
> > > >Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
> > > >OmniBook 5 16-ag1xxx (board 8DF4)
> > > >
> > > >Hi Krishna,
> > > >
> > > >Thanks a lot for digging into the ACPI code, the explanation makes
> > > >everything fit: the missing GMCF call for HPWMI_GM, Local2 being lef=
t
> > > >as an Integer, and the -22 coming from that.
> > > >
> > > >I also tried your suggestion about the platform profile. With
> > > >HPWMI_READ/WRITE the errors should not appear:
> > > >
> > > >  Before: dmesg | grep -c WHCM  ->  3 (the three boot-time errors)
> > > >  cat /sys/firmware/acpi/platform_profile  ->  quiet
> > > >  After:  dmesg | grep -c WHCM  ->  3 (no new errors)
> > > >
> > > >On the fan: thanks for confirming that acpi_fan reads the EC value
> > > >correctly. Together with hearing the fan on Mint and on CachyOS at
> > > >idle, that makes me fairly comfortable that the 0 RPM readings are t=
he
> > > >fan really being off.
> > > >
> > > >Your plan to query the fan count and hide pwm1_enable and
> > > >fan{1,2}_input when it fails sounds good to me. I am happy to test i=
t
> > > >on 8DF4 whenever you have a patch, and I can rebase it onto a stable
> > > >kernel tree on my side if that is easier for you.
> > > >
> > > >I also tried 7.2.10-1-cachyos: dmesg and the hp-wmi hwmon folder are
> > > >identical to 7.2.9 (three WHCM errors, then the -22 message, and
> > > >pwm1_enable still present).
> > > >
> > > >Thanks again for the time you spent on this.
> > >
> > > Thanks, I will share the final proposed patch on your Bugzilla report
> > > (222138), and leave this thread for others to pick up the WQBC/WQBE
> > > errors.
> > >
> > > >Best regards,
> > > >Lorenzo
> > > >
> > > [...]
