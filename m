Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794134038;
	b=a+KVYEW4EGTY1OfXeYYZCTUqMmlRzm1gA7UmCbb7dmQTReoHfYwQ1/sus5lsPyOGtVgr
	 Gu1swkWJ93hQr32s/JxG3U9B1IdrSVtq1aOnKAFjPizY+38/lq+OrWw/O+UXGx8T59iCA
	 uaFAGvZfmWoTH4LOYmWGQ6WYVibZKokVlDpLZgLahDoGY5wslpztbK/9LbyS06eIWSqyS
	 hqfH72RrPDC/7H/+vCU5S4beCqP5+KqAqwxVRFS2Ki7kd9t9dhrRHk21hRJK0LQhjuuAN
	 bNHlh+U/WQoxQGCj4jSF09ZNdxsJ/YihRYuhH7Je47vnBh4+pF6TaWFB5emcScO039A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794134038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=glvGrWRT1QN/fE8UGYdsbVnUnNT1CZIwbxztIXMB48g=;
	b=eN0Ku0Utz7SRUfm/FFvS1VgQzPkcSJBkKPgyFJmWl7xkRIRjERm6z0D6Ng92MTLt0AR8
	 rfx1TylvIuF1kUcFrgj5QDesE4Wwa+5iRx1eVvaBjJ0g/JrNTv3fRUzVJQk2ysq949lgI
	 VjcteDJjC2L051C0q0xstub31liZcKVytCAI0fM6H2j2xgI+KAhlqL7pDUENc3g3Z2A4R
	 yfWkyrbX59+zq3442gNwbs+iFV2qQ0o22TYzj/nm/DQjtMM3ij3wSr4cEaVrEDmDJZx5V
	 jy7v+GAGUM4geQW6hb8tbh0GlCbR350Ws5xt26QSYdVjLi+BcMmWbF60ShL38HAfHcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZyBVlwC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74CB606A321
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 10:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A74CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZyBVlwC
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso44161fa.1
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Nov 2026 02:33:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794134036; cv=none;
        d=google.com; s=arc-20260327;
        b=c2+WiZGdGhdSqdf9t19bes7NW09c8EhgG78YAgkqCsHcVz788cJ3Fl9hYilECYYEVG
         uzYn7MMc5V2i5Zmq4baxi7/vQ653hl1q05oZ5P6Y4f7TontYNuiwdTWg6NOUIMnlndT/
         NmRmxK/M2w93JRnMgh4aNJMOProSdMB5R3CXMSeKe3xrQUoSg6MgtplQxkgtjJEvNPua
         ImK+huOb6yjqEBXC5gYnl0rpnXduiKmZHsMxxaRjmDYqDKVn36Zgg5BR8Z6N68Jy8V4e
         TLn9VchGxcnBR8QFK9w4mrN4Urmh3zkEsRPaSMdKb7/VI95pjgR7S2O7m44co68U5HSg
         beAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=glvGrWRT1QN/fE8UGYdsbVnUnNT1CZIwbxztIXMB48g=;
        fh=vZzzr1H82KPWgLWyYZqIHDZx+g+jXN5vSm4c6JWkhi4=;
        b=keja6a3iwBBD7G0dyUYiwx5pQRSULnxxBnqC8ylXJ0Q45nf7Jeykt9Jn98Ibdlu60s
         sCoM3MY8aR+0xx8cZSsasn6XL0wD9PfWyuX+kt0eLt/utrZWf/Rbur0Q5Ft0wQOuIIog
         a4pJu7RbEA/B/K4VODzWUGJ2E+EkAGcbheXvEzxxuvALLZyzqmYhMkxvkGHg7on7qMGj
         06LScg5uhrHlRkqFp0S6idOcq5iFysfeSgTMoD/72FsBIOGXs/sVL9sdV0i58EIVuHFo
         yyGesTHDAkAt8Tjs5f86wReZGkaGpjnPGTCRuITeGrnCItdzOikN5jcU6NH8e91T6T1M
         CfXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794134036; x=1794738836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=glvGrWRT1QN/fE8UGYdsbVnUnNT1CZIwbxztIXMB48g=;
        b=aZyBVlwCf3HtdIM+1sV0UWQdH2oSFkOc7HO3xGCc2YUHvHTXKYT7khh2XIxyNQ+mtv
         ASKuqDjU8ERXQwDKG9KaoDqfPNad9Ukvu/lAl6xSetw/JW7T2bE0av8FKX0Rsdq8Bkhk
         qFIx5stGz4MeP50q2tDAwKTLMmrax8Dp/bj9D9D0sIWULCizXkZP4q9MriCyyWoI0TFv
         SbG2YCAzt5VAVm9BKTHlVK9CTS9aYYhZgtNifmVAFMTo6qxN1QmDa6v1YVinqxIeXQXA
         N1/Wqf9Rc7JpqFLKV2qx6vi+v7qRbszs4wLnkL9fYoVjOX3qdUPV0ltxmtL9qIjtaNT+
         2T1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794134036; x=1794738836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glvGrWRT1QN/fE8UGYdsbVnUnNT1CZIwbxztIXMB48g=;
        b=XfKjbQFWNhRsMfC/6KgXdSDWoOMboGZQVAm6y9zgF25ZN8mS1crgbsL9jM5Jx8QOyd
         59AIikywz+FcsiNJvsJe6raZ38SvRKq0OI96uzmHtaczJl31hWRjvNNvuA4q0X1znbDq
         YkKXxopadTE3nbNI/9VPNtoFdO23qDR4rCiJ5x7PFg6VodGtB25+Pmv4/QfU8uzrgw0j
         hbq+B5wP8yjZ8bCouf4rWlKBPvUgkeO+NuwAo1FMXVuuIFuPoRlxOXz1kMQYIRJUXepw
         eI6s/isYUGiSLaK222AT0MAxCWrJpUpcNmUE993TG7CO1V/NGA0TDkI0lnVdF+Hs+ZWN
         NCng==
X-Forwarded-Encrypted: i=1; AL+hErHR6FZgo17rRGzVR62Udf+kHQpoSQgYgtArhqKdVlUFrAa+gG2ignIJdaS3rlPORHT2c/eFLsREiMJ8uA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+lAWVhMnDlv6DDXrErj3NkB5sbQgv3klcduRWQ8nq0c2+rb9sU
	QILEnVBekDLFkLKHCPpFLJSVe7186akLZPtvXJJASIdVhhFRWgrMcQHX6SoJtADfQ43jRtvvT8L
	aCCNCohWIAeMXzxUsqkfbBBSITKoAApA=
X-Gm-Gg: AYBFou1xoPa2nXU/f/jmW6hMNCp87miwqFTgpA6h03+RW8rfSNeFrlHw7cAf+n1aHSJ
	0J8rWMsReZY2HGsoJUmASm97Ftz3fAbr+KjUfzzhvmrERvLT1J+Ln+TrSnnYjhvfZ7BTqfmty4d
	lZvvAV2RRNK+43S03DN+9Uh3mlSaBm6miR1BF+mM0EGedUkPoSuSkQns05kfzfY+yGi6gYBXs9e
	mmh7jrcLQUiYxC2smIeHpjtKqkWLkrRlAS1C4IUnYIyqybSjde4LVd3Z2az/OYv+i8vcIIJrXQd
	cRG0RXAMVFQb9eEcOqUFw6WVYVhM7JAEpJl+Ap3hy5IVhCJVCxunVQEensWlj+6H39VwpHwptS3
	dg1GDopdXEu4bSW1FoSNZDtgaw6WNHqN4aJHsGw3MZWe0sEfS5TIzH01uhC2gxcYMDujmgg==
X-Received: by 2002:a2e:7a04:0:b0:3ac:ddd5:55ee with SMTP id
 38308e7fff4ca-3adfa3a50cbmr2094571fa.2.1794134035626; Sun, 08 Nov 2026
 02:33:55 -0800 (PST)
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
 <atJc2J2hYrdI_Eun@archlinux>
In-Reply-To: <atJc2J2hYrdI_Eun@archlinux>
From: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Date: Sun, 8 Nov 2026 11:33:44 +0100
X-Gm-Features: AclHuK8RS4vQ3n6u4Bm4vCHvO6Hnt7D0ObPsJjucxe4puVLCmB39UPpPrbPa-oI
Message-ID: <CAPvUaSqAnLYVuzcq6Zq=hRp6JBoo8upjrsy=LSxnLdXuTyHDaw@mail.gmail.com>
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Subject: Re: HP OmniBook 5 16-ag1xxx: hp_bioscfg output and fan
results on all OSes

Hi Krishna,

A quick update on the OmniBook 5 16-ag1xxx (board 8DF4, BIOS F.12), in
case it helps with the HP side.

1. hp_bioscfg: the driver loads and registers hp-bioscfg, but the
attributes directory contains only Sure_Start and pending_reboot.
dmesg shows: hp_bioscfg: Returned error 0x3, "Invalid command
value/Feature not supported". There is no fan or thermal attribute, so
I can't read or change "Fan Always On" from Linux.

2. Fan behaviour: it isn't specific to the kernel or the OS. With Fan
Always On disabled, the fan stays off under load on Windows 11, Linux
Mint, Arch, CachyOS LTS and CachyOS 7.3.1-1. A full-load stress-ng run
(all 12 threads, platform_profile=3Dperformance) reached 92 =C2=B0C in abou=
t
35 seconds with no fan. A 2-thread run reached 83 =C2=B0C with no fan.

3. Timeline: BIOS F.12 has been installed since the end of July, and
the fan behaved normally until October. HP PC Hardware Diagnostics
UEFI still passes both the fan speed and thermal tests. A hard EC
reset and BIOS defaults changed nothing.

I've also reported this to HP and asked for a warranty repair. I'm
happy to test any further patches or run any commands on this machine.

Thanks for your work on the hp-wmi fix.

Lorenzo

Il giorno ven 16 ott 2026 alle ore 19:26 Krishna Chomal
<krishna.chomal108@gmail.com> ha scritto:
>
> On Fri, Oct 16, 2026 at 09:06:03AM +0200, Lorenzo Collevecchio wrote:
> >Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
> >OmniBook 5 16-ag1xxx (board 8DF4)
> >
> >Hi Krishna,
> >
> >Thanks a lot for digging into the ACPI code, the explanation makes
> >everything fit: the missing GMCF call for HPWMI_GM, Local2 being left
> >as an Integer, and the -22 coming from that.
> >
> >I also tried your suggestion about the platform profile. With
> >HPWMI_READ/WRITE the errors should not appear:
> >
> >  Before: dmesg | grep -c WHCM  ->  3 (the three boot-time errors)
> >  cat /sys/firmware/acpi/platform_profile  ->  quiet
> >  After:  dmesg | grep -c WHCM  ->  3 (no new errors)
> >
> >On the fan: thanks for confirming that acpi_fan reads the EC value
> >correctly. Together with hearing the fan on Mint and on CachyOS at
> >idle, that makes me fairly comfortable that the 0 RPM readings are the
> >fan really being off.
> >
> >Your plan to query the fan count and hide pwm1_enable and
> >fan{1,2}_input when it fails sounds good to me. I am happy to test it
> >on 8DF4 whenever you have a patch, and I can rebase it onto a stable
> >kernel tree on my side if that is easier for you.
> >
> >I also tried 7.2.10-1-cachyos: dmesg and the hp-wmi hwmon folder are
> >identical to 7.2.9 (three WHCM errors, then the -22 message, and
> >pwm1_enable still present).
> >
> >Thanks again for the time you spent on this.
>
> Thanks, I will share the final proposed patch on your Bugzilla report
> (222138), and leave this thread for others to pick up the WQBC/WQBE
> errors.
>
> >Best regards,
> >Lorenzo
> >
> [...]
