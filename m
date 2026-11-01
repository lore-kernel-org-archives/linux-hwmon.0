Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793566654;
	b=4agOFVhhfU2aYWHM77fUFigD4w5kx+o8FPJ679rvLAFCgAl2RQbkiUO+A4HTE0u+hdvy
	 rYwP2PG8v3OkdD/LVkNKYorx7MYGiDAQHxXEvzwK6DkwK004JLVlgOxhn6gcJYVZol9hM
	 bILXxdeAICgE33vRQi2OZWmhVJR8W4+MXbBSgZzgRowgnDLhZ08M8B1r37/xIWa3i1XbL
	 hRfLaPVAudAZ+v7B5ih5vKLfVhokzYvhEbuqLfPcPw8953m+v9rxgMu1pbDBJHVHUOGNo
	 FI1g5LbrjjAt359l/GXokw2DWNZyk7e/ga2R0CvCz7riWrf/HBXujN+gcfUjr3jD5/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793566654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QPohgoPuf5d963Y2G/ZdUa/zMplXrQUxWQ1kLVkoHy8=;
	b=QftwL0wJNIRwXOOrcH/W1NrsV680L2Xn5ucJV4mQzbwU8NvEuxfgBBCqug/s/WqUEtaH
	 Qu3BNF0SPd5WUWDdDEG7RuVU58PpW9iRLqm2gY8eF/0i1/y5vO962zxfcOVY6WU9FrAQH
	 rPGVh/cv3xN4uLvtVhNubUr/KmyfLporkzwXp1iJAHFDbxla+nB+Aksmst1yV8KlMKWVc
	 D27y7CSdpHhBt0ZP8Iy1flVCK13AEQzrpDMsNtcywqTRUB4ayoLcYAAKOqq0fPFH88673
	 3P/qw7lxJeG+mbvUsXomk3ZpHgPx37aOwzN+wzc6w3Bb/fN8t1xcM4isy7J0ZJlcIYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=PfdrVEH9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC1D606A327
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 20:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC1D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=PfdrVEH9
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1061730a91.2
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 12:57:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793566654; cv=none;
        d=google.com; s=arc-20260327;
        b=Vl0bZzLAsxa+91GBNbOysDIAftYzEhdTvPTW4lCGKSSyQNg6K1wXl7JvHQHGHq5xPT
         bxRKbrmSy768Vqs46dO7KOMGCSN32BZEwcrnycNspR4pCYn0C3ZBv1Mu+QN8TbNrZpNm
         8Si24WayYyAvCTA1KFrCzM7OWm8w424BQow7EW67L/O35cVnTIxWC+EKWU9ersmrq/Mf
         d1XNus4LFubN/p2tO2po/6IExnKxj8QdoxUsbWrHWqh1BjK6ngo7xMUfGpDwIYciIZMz
         XxOGooXCESVa7bdZESZRYZykZwNYZB/+QAG7a1xPQTLK9m3MDK9++Gm+8yVRUpfUaA/w
         2EPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QPohgoPuf5d963Y2G/ZdUa/zMplXrQUxWQ1kLVkoHy8=;
        fh=RaWQypBYheB1AH/ID6q0ccP5qXBJMqJCGgpg5gGm6ak=;
        b=FOyRsANyRVR3Zx8Rfpgqm32g2M8l+9m/w18SjVvtlqb2jC1YE4qKKdCksJn5miHJYV
         ZB/5QJsSVe7izxinDhiskv2bTPBXJecWXRwD27IOF1pOOxFcTMjsa376gz5KL3aIlngY
         /IdD/6Mbnv5eHD584FFYPETirKn1qghDDyE2C6E4nil2Xb5aXk4z1QOwY6cIW1ltPqec
         O6lkvCDENe6DD+wKjHW9D6+p12dev0ZxHPs5E/Q3rgdJoF/DUxXAd3mCYUznns97GhjT
         X1Ib48S92/lGeqMjr/dr9daOD1esXFlwbkR68JgURH/R1S7zONHjlTT7++p4cXs1bxt8
         NOPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1793566654; x=1794171454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QPohgoPuf5d963Y2G/ZdUa/zMplXrQUxWQ1kLVkoHy8=;
        b=PfdrVEH9VF8i06vBnK1r/kJ3TMJdZ9l7DDBY/wtcVylKvRxCBH1W9o3zCCh/oHrGe9
         NoSgsSmDrqewDYraCvEDVnf78u6oGK7DKAUl4sewkY5yys4PRJ9Eu7vxxDKHAKlupVrX
         As/P+kqU288ALl4t/nSche2fXbeQZDR2BHKavCxMJiVvacpiXP8H89/UJQdmLxeiwOFA
         hKX8uUJh5cnrDbAvtsLIRVX5r+Hrvsz3MKJofUMr08xfWAK53NN30fdiReZfaxgdcF6P
         737nLz1BSfoWe4/UJFCFOmOpASN9iUC6WCSRRdxcwIdfdi2EeAUkZERg7kCJ4lwxom6a
         +ezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793566654; x=1794171454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPohgoPuf5d963Y2G/ZdUa/zMplXrQUxWQ1kLVkoHy8=;
        b=Ki0Ryelb36WX8DEtMXi+1cku7+pOYLHFX4npjvFb9DnK6kuSjIyhrgAAuPcyrZI4m5
         PVtBW3Q46cwUDIC6s8C+cUp6nFY8j1e7KIUjdzRl7f7NIKVm+OP21IIZynga5VOXrthG
         W6lqoNvnSj6AbVjAVsA/xYshYji14zz2CsLLhTS5SxuSQZLM6z1Vymw6JI4ZKIu/yS+D
         xIPAqX+N8C6FaF2sC8kb4tCAd2cOFCWPSNSbDrHiPJIStucpvwvHw3W7NmIZIfDesxwP
         oLqev1sHFLii7DuUJiILVkk1QQUJ+eP8ecd6pEIvieFeyX8xj2mKpVmyzDWZ1O+IWgpv
         JSUQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6Ccx0ylCeQ1cKlUfrLOjbIWfX4biuNfEXCvJEDoOhZtqzJzoUfQvP5oq6X+d8dAjMWA0ofiCfpsWxSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0G6Y4ZOqWdymP1GDPkGy2KrP7ThKMnZzjhi1EpaM6CrqwTyTd
	1QhyHnwJ6T+AbhcpZ3Scd8AplxsS8xIuQDkOyQGL7k4UWYayd768j6vLezwTRY6MTsKLXsF/9rE
	FTu+X+IKndhMQuyrDt5cc1JftC24ryELtihY8kz/GfVTRb+U5WUAp2AGSGA==
X-Gm-Gg: AYBFou1VvyfoIv2w1tzrm0xaH+qHjU7xOunNPPJLGbrme5+xYpp63dSin3qZ34JfLSq
	x/Z3aamox5vrmvkP8IWWj3zXFT9NI2Kwt3u+aNFIvokWsyQuVxRhRBpLvY1SwkVWQvH+FudAcRw
	VhPUUfkuhwblZc1gVSKoOAq9zDFDnLcdvGWTLGUxNUef/VMJvymei8FTmdcIhX0l8fYuFzsn3JJ
	dVaBCoS1D/UzY9JQNZGsImPkZvEj8bsf9qdsQcGMmVPIv65gzPrnEoud95WQhXUjAcb/kSs58zN
	OT/c3gSVfMecjZviZaiCCYAD6Yxvt98GcZD4L71JNsV2GjwNJ+mzJlrMjexlpi0uKQfpNjoFI6+
	rxrO7tAxrPrcuqxiT2+zgJexu26aRRA5dTsK1Tgo7vw8EaNT8ve9Ii6cXJLoq0PI0u452mvhaiO
	7EGTORr9WUdOSU6Bg=
X-Received: by 2002:a17:90a:da86:b0:39e:21a7:5df5 with SMTP id
 98e67ed59e1d1-3ae897f61aamr6786067a91.24.1793566653699; Sun, 01 Nov 2026
 12:57:33 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <03055ffd-d015-4810-8b8a-678821fa6dcc@damex.org> <92e3383e-26f8-4bed-b487-1c52f6c4f420@roeck-us.net>
In-Reply-To: <92e3383e-26f8-4bed-b487-1c52f6c4f420@roeck-us.net>
From: Robert Marko <robert.marko@sartura.hr>
Date: Sun, 1 Nov 2026 21:57:22 +0100
X-Gm-Features: AclHuK85M4-bkzt8KtwzbjCxHOMk28x-2V4KLSaVQEH_PBp03_WXhAeiSslNHY8
Message-ID: <CA+HBbNE1qs8VBGXyZ6+4mmawi67RN-8RYVQU91hoGBWVfu60nA@mail.gmail.com>
Subject: Re: [RFC] hwmon: (tps23861) PSE-PD support, extend hwmon driver or
 move to pse-pd?
To: Guenter Roeck <linux@roeck-us.net>
Cc: Roman Kuzmitskii <roman@damex.org>, linux-hwmon@vger.kernel.org, netdev@vger.kernel.org, 
	o.rempel@pengutronix.de, kory.maincent@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 7:38=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 11/1/26 10:02, Roman Kuzmitskii wrote:
> > hi,
> >
> > TP-Link TL-SG2210P v3 (realtek rtl838x, openwrt) has two tps23861 for P=
oE.
> > driver is hwmon only. ports can be enabled via in*_enable sysfs, rest i=
s only reachable by poking i2c directly.
> > i would like to control them through PSE-PD instead (ethtool --set-pse)=
.
> >
> > i made patch for openwrt which registers pse_controller_dev from hwmon =
driver when node has pse-pis.
> > it does c33 admin state, power status, enable/disable, voltage and powe=
r class.
> > events are polled.
> > only ports with pse-pi node go to auto mode, and in*_enable is hidden w=
hile PSE is registered.
> > https://github.com/openwrt/openwrt/pull/26330 (tested on openwrt 6.18 k=
ernel)
> >
> > openwrt reviewers asked me to check with you first which way you prefer=
:
> > 1. extend hwmon driver with PSE-PD (like it is done right now)
> > 2. move driver to drivers/net/pse-pd and extend it with PSE-PD
> > 3. something else
> >
> The hardware monitoring "enable" attribute is supposed to enable monitori=
ng,
> not to enable some power delivery or network (or any other) port. That "p=
ort
> enable" feature using the hwmon ABI was sneaked in, and I am inclined to =
just
> remove the upstream driver for severe ABI violation.

Hi Guenther, I am the original driver author for tps23861.

Sorry for the ABI violation, that wasn't really clear back when it was
being written, especially with no PSE subsystem at all.

We can always just remove the enable attribute, the IC works in auto
mode by default anyway, instead of dropping the driver
as it is still useful for monitoring.

That being said, ideally it would just be moved to the PSE subsystem.

Regards,
Robert

>
> Guenter
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
