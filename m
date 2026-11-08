Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794164978;
	b=VC4EzSxPBSH7aFmWYLa2kd2iiC4B4IXpHbmHZ4BQIVHADepc+fS+whkAW4kbiGrAyvyt
	 EPyzMQBz7AQdgqNaWN5wyZCOZFaxcjjKv2rp5w4WoRVyFOWBIT8UUXRU15mHFSsxBQ+k/
	 zuknGqrH8Ay6p40RLzCbr32YbbB/ZcdkkVwpF029h+s5Lk2ugP26vFTjUU4QAlKdxREzg
	 ySnEWMeGEjr5s/2bE2Xst+bIOD9lJm4GUzJAHt9zCUcXO1p/3VDHBl4oxhmoukxIQvG7w
	 fqqacPWfexCZRCx+xMl1whjydArtYJo/VnzEYX/fiQmixMvyH9wcNYU/XoABFtg9oYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nVPhrKJfbSmpnE1ryW+os71+IdLIXTokbMOzIHpkGpM=;
	b=fOg5AvM+SHGXdHrmGcLGpcE/PIEL7v3IqI7vrgqHfCnf8mM/YqnEVO4L+cHxVgf5jYTi
	 oKJyF/r+FFTXAFvonMNXK8NZOlwOchNC5Wxi2JpTzDMzaPeDycuAt26Abeb4ODW0V8fik
	 nxwjECnTsgzi0PoWxkEMgPIjWnOw08nFFWKjtDczHY6WiWl11GiGIMzxUa8kndD9SDvd0
	 cu5hdVnt+2apiVnzPgg7usyTNS3IG/rYYEgLPIA8yWuyUKZ3RkBFlVABC/sYghG5loZkw
	 na57aGpxRw9ImQpBgLyq27UWnA8bhD57/0KgzFSaXebiuOPAO6XIyo7HEgwL3WHBiNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyqhPkoJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0638606A321
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 19:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0638606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyqhPkoJ
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14b6ac47eso30906e87.0
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Nov 2026 11:09:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794164976; cv=none;
        d=google.com; s=arc-20260327;
        b=NUr9p9Jk/Z4vepjwBGT4CXi5ukgAWrKRcliO0vMUpBIu9j3zqA68H2OhfXw7qbbn3o
         BjdJddKx2CW3xF+OEBMCb27JIcww1H5TtMj1QLXynKf5Isex75RJAGQG1Ewia02AXFol
         nmfdiQRWtZlzfm5gGXTfvfmqAPhVaX8xvOJaRnj9/HpnMumIfh/EFeTSE3eLpzrW1Vwt
         1Ok/g3EnbO0GEVQsG9B2wqVxpt6w9eNAM76SsNcMG1YwAIZhADVbhtFuJzE7YTEtL6E1
         kmiPUmryV0UBzALCfTtc8zIOYRJxsWyZEOVkSEVDo/OKyu5nwcAmUlF6tk7sx90Kycf2
         HDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nVPhrKJfbSmpnE1ryW+os71+IdLIXTokbMOzIHpkGpM=;
        fh=4TUtG43XbRkSFzHRr0sKmYhHgEFQuWgHb1iuzG4tPkY=;
        b=FaBNT38h0r87xb38XJKrfHRtDalu1nLVwHy8rbKc5wIHqrj5JRV06de++MLeXF2J8i
         /wOeKekGS4Z2ALToF0UQ5LZ+Ibnsu5QgT595MDGKgTw3nLRed4oXNuVrv5MDnRkukma+
         i34D5HGOFRbbqRWhAh70lVBUrt8utLSPqCcm2fsFI+uiJCqetMCizSvnawt7+aKPDJ63
         61XLPjup9xrULA+y3oiuEIRyyeDwuSKDUHopSMuAcEnlEwsAmLa8E7gCUAmFnWjNjt0t
         O6RQuZEAFzRDGHwSdij47MiiIxsiULfjrB8d5kZCuFoXfFCV0hqtNVaNH8tYtstQhfWn
         S8kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164976; x=1794769776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nVPhrKJfbSmpnE1ryW+os71+IdLIXTokbMOzIHpkGpM=;
        b=nyqhPkoJf4ud3o1TNoUahdgrSk8UAzNFro6L20LwdXi6pzsG1JFYz7/hq+yiq56Sos
         hIdYfIn7fBJakdI4m+bmVlv2y9vUaw91XeEMXFwCN8sKIUaSHTq9ec2wFyGVfwnFT0r/
         jRS0GMBjeJWcVqAl4vWKAMXmmzuHhp3dGlsb3RyGYTUlN1GB39Wqp+pH/S7ri2ksB40S
         mOul80aft9gc0KlaHVkXRUMipjiiw3PzmpaLddu4ZdbKPo+vFwtprGd+EM4UB48OkEK0
         tJEN+w2HClt45BB1n+TDYkVMWWZuZu74L/iNF9FE01IrMjVd6fGC/0U2X2oatkpDZsoj
         oCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164976; x=1794769776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nVPhrKJfbSmpnE1ryW+os71+IdLIXTokbMOzIHpkGpM=;
        b=BJvLesvT/dH6dFz5+riCzYsBoAL+++YHeQtE9PzV+SZqImXMbv7F1X3w83+5okA2OW
         mTx1RSG7T6fsD3HOpVfV7RcavgnHvlM/AVgZ4xpHYnoYWUJnx7BVJOymwh+DQTls+/Jq
         ZRQqsbYItnHyi4H+QWgZbPfklHr8QgDTpo70GynSPAD4YCc18Ef9tSG89FbgNBq9pKu7
         9FV/eTLRrEipST63wwoNjSGs6P6gJZYISe+bEuoUzFdYlnyTS2AoFM0Z0NuPCcWC3hjs
         R72k1KONkxUtBfuEGrNRqeuWsAEKuQ3tezhxsul1uGG9oH4s/fMs2mMa+YtfK/UW3/cH
         fjoQ==
X-Forwarded-Encrypted: i=1; AL+hErGZ/YI4hnV4PUIYx2POneR97SsQN8ivP3gRu82ZCbVxy0yMdFafQd8Gt0zdLUt4iYdZyTDmt8VHSheMZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ktx4GYRQToqtQ4ZHY7V8RMfyw0Mk5/GQK+qpomsW9DuItOJQg
	7/oXx36xUIBhiwNzyAa0d+5Uuhtvbac+NUdNzdbYxuJsVgI00c0nE56AynUyHM9e+qOn97GwTvy
	2fEJfnDON2RdqOWSYz2k2uV0/KOTUPtw=
X-Gm-Gg: AYBFou35xnn+PuPVGM1wrMkoXztto0/pyLaZW4CSS+rceff1Q79lf/P9iBKfiFwweW5
	J18Hf87QkOUoZC2AVfa+4WTpVeEuGvaWt5wQn8x/CVPZEJSIokp7iKs6QcH4tsA4buxbentnIrZ
	/MTSKOHjIRIULk0297lFDytVfrshe1xe1REn/j3ooZTU7xb24PB8y1Gps0CvwtT7VQ4U9XafbIx
	lHXUzqOCL/CDeAbhUZg7/vqd8L2BPEqyk1lLdPJRLdUFWCBXzh12lOD/vuvMuWhXyMKlxcampt2
	JXKCE0QGU9pCfFVVGnlFhURZDLzRmF292L9GOrjtIb+SY7wMDTSVvrdlf5JfJmHoynA31EcsFAx
	UvyOj5Dk+nYa4Ag89c3ZeIJ5LJ7Gt4FLoheITdbK2mx1eHK6FH356224DP0zy76CRDVe27wwktb
	3DOb0MHDMsxUl8K8U=
X-Received: by 2002:a05:6512:6516:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c14bf215b5mr451239e87.0.1794164975540; Sun, 08 Nov 2026
 11:09:35 -0800 (PST)
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
In-Reply-To: <CAPvUaSqAnLYVuzcq6Zq=hRp6JBoo8upjrsy=LSxnLdXuTyHDaw@mail.gmail.com>
From: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Date: Sun, 8 Nov 2026 20:09:23 +0100
X-Gm-Features: AclHuK_FNAfGTAsVxz4a8U8h_DJnTbqCdNj-mRMbyDEevkGVnR6kp2dma-lgvo0
Message-ID: <CAPvUaSpk3wKyedtwcJpKFeQ_DGRJNa2-wXwVGSzX_bCadWozsQ@mail.gmail.com>
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Subject: Re: HP OmniBook 5 16-ag1xxx: fan stays off, thermal tables
invalid, results after BIOS reinstall

Hi Krishna,

A follow-up on the OmniBook 5 16-ag1xxx (board 8DF4), with some new
data after reinstalling the BIOS.

1. Reflash result: I reinstalled the same BIOS with HP's official
installer (DMI reports Insyde F.12, bios_date 04/10/2026, i.e. 10
April 2026), then did a hard EC reset. With Fan Always On disabled, a
stress-ng run on CachyOS reached 85 =C2=B0C with the fan completely stopped
(acpi_fan: 0 RPM), and I stopped it there. So the firmware reinstall
did not change the behaviour.

2. Thermal data from the firmware: on every boot dmesg shows
   ACPI: thermal: [Firmware Bug]: Invalid critical threshold (-274000)
   ACPI: thermal: [Firmware Bug]: No valid trip points!
The only trip point Linux exposes is thermal_zone0 trip_point_0 (type
hot, 103000). There are no active trip points. Both lines are present
in every boot I have stored (4 to 8 Nov), before and after the
reflash.

3. A new intermittent error: ACPI BIOS Error (bug): Could not resolve
symbol [^^^^NPCF.DTGP], AE_NOT_FOUND, followed by Aborting method
\_SB.PCI0.LPC0.EC0._Q37 (AE_NOT_FOUND). It appears in only 2 of my 14
stored boots, one before the reflash and one after, so it is not
caused by the reflash and not present on every boot. It seems to
depend on an EC event.

4. Fan state: with the fan stopped at idle (0 RPM),
/sys/class/thermal/cooling_device0 (type Fan) reads cur_state=3D1,
max_state=3D1. dmesg also says "acpi-fan PNP0C0B:00: Using Microsoft fan
extensions". I don't know whether cur_state is meaningful on this
firmware.

5. Still the same as before: the WHCM/WMAA AE_AML_OPERAND_TYPE errors,
hp-wmi "Failed to apply initial fan settings: -22", and WQBC/WQBE
"CreateField of length zero". hp_bioscfg exposes only Sure_Start
(error 0x3, feature not supported).

I'm not claiming the thermal-table or _Q37 errors cause the fan
problem; they are just firmware bugs that are present alongside it.
The fan stays off under load on Windows 11 as well, and HP's UEFI fan
speed and thermal tests still pass, so I have asked HP for a warranty
repair.

I'm glad to run any commands, collect more logs or test patches if
that would help. I can send the full dmesg and the journal output.

Thanks again,
Lorenzo

Il giorno dom 8 nov 2026 alle ore 11:33 Lorenzo Collevecchio
<lorenzocollevecchio17@gmail.com> ha scritto:
>
> Subject: Re: HP OmniBook 5 16-ag1xxx: hp_bioscfg output and fan
> results on all OSes
>
> Hi Krishna,
>
> A quick update on the OmniBook 5 16-ag1xxx (board 8DF4, BIOS F.12), in
> case it helps with the HP side.
>
> 1. hp_bioscfg: the driver loads and registers hp-bioscfg, but the
> attributes directory contains only Sure_Start and pending_reboot.
> dmesg shows: hp_bioscfg: Returned error 0x3, "Invalid command
> value/Feature not supported". There is no fan or thermal attribute, so
> I can't read or change "Fan Always On" from Linux.
>
> 2. Fan behaviour: it isn't specific to the kernel or the OS. With Fan
> Always On disabled, the fan stays off under load on Windows 11, Linux
> Mint, Arch, CachyOS LTS and CachyOS 7.3.1-1. A full-load stress-ng run
> (all 12 threads, platform_profile=3Dperformance) reached 92 =C2=B0C in ab=
out
> 35 seconds with no fan. A 2-thread run reached 83 =C2=B0C with no fan.
>
> 3. Timeline: BIOS F.12 has been installed since the end of July, and
> the fan behaved normally until October. HP PC Hardware Diagnostics
> UEFI still passes both the fan speed and thermal tests. A hard EC
> reset and BIOS defaults changed nothing.
>
> I've also reported this to HP and asked for a warranty repair. I'm
> happy to test any further patches or run any commands on this machine.
>
> Thanks for your work on the hp-wmi fix.
>
> Lorenzo
>
> Il giorno ven 16 ott 2026 alle ore 19:26 Krishna Chomal
> <krishna.chomal108@gmail.com> ha scritto:
> >
> > On Fri, Oct 16, 2026 at 09:06:03AM +0200, Lorenzo Collevecchio wrote:
> > >Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
> > >OmniBook 5 16-ag1xxx (board 8DF4)
> > >
> > >Hi Krishna,
> > >
> > >Thanks a lot for digging into the ACPI code, the explanation makes
> > >everything fit: the missing GMCF call for HPWMI_GM, Local2 being left
> > >as an Integer, and the -22 coming from that.
> > >
> > >I also tried your suggestion about the platform profile. With
> > >HPWMI_READ/WRITE the errors should not appear:
> > >
> > >  Before: dmesg | grep -c WHCM  ->  3 (the three boot-time errors)
> > >  cat /sys/firmware/acpi/platform_profile  ->  quiet
> > >  After:  dmesg | grep -c WHCM  ->  3 (no new errors)
> > >
> > >On the fan: thanks for confirming that acpi_fan reads the EC value
> > >correctly. Together with hearing the fan on Mint and on CachyOS at
> > >idle, that makes me fairly comfortable that the 0 RPM readings are the
> > >fan really being off.
> > >
> > >Your plan to query the fan count and hide pwm1_enable and
> > >fan{1,2}_input when it fails sounds good to me. I am happy to test it
> > >on 8DF4 whenever you have a patch, and I can rebase it onto a stable
> > >kernel tree on my side if that is easier for you.
> > >
> > >I also tried 7.2.10-1-cachyos: dmesg and the hp-wmi hwmon folder are
> > >identical to 7.2.9 (three WHCM errors, then the -22 message, and
> > >pwm1_enable still present).
> > >
> > >Thanks again for the time you spent on this.
> >
> > Thanks, I will share the final proposed patch on your Bugzilla report
> > (222138), and leave this thread for others to pick up the WQBC/WQBE
> > errors.
> >
> > >Best regards,
> > >Lorenzo
> > >
> > [...]
