Received: from aws04.crawford.emu.id.au (aws04.crawford.emu.id.au [3.104.176.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1246D7262B;
	Mon,  6 Apr 2026 06:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.104.176.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775457090; cv=none; b=WhG2zcM4P+KTJhpJgzFBcfsG50GdmVgTuoNawOV5dNlrugLTHQW0XucQK3uef5NnQuAEZlV2cjf5ZAWswGkUfq4X38jHlwYRzQzuL895VlYvByWiBN7SE+m7d5ksac2okmghM/eFngfDTxwVsna3nTCgum9Bm9jipnDzPyQpOx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775457090; c=relaxed/simple;
	bh=B1IJln3ANcAhO7YMPlKwGStu3H4o3qAUN1gSGCin3Xw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QHT8eo0i0JYpSr/a6X7pgaXT+yDHHBkGJJ1ETZsb1xNS+KOtryRCq28qwu10/KwDJ2njBzMkIwBSyO+chvM4XAZlby41cCYx9MIDZgrdLfnUxNUfNX7hBExx6wQ8ibS3L5RteKObxVvOGBvbe9x6EfSomazRCvATOsKNnGYbN5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=gegsGCUO; arc=none smtp.client-ip=3.104.176.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="gegsGCUO"
Authentication-Results: aws04.crawford.emu.id.au; arc=none smtp.remote-ip="2401:d002:8602:7600:226d:bee3:e34:781f"
Received: by aws04.crawford.emu.id.au (Postfix) id BFB925AA6C6;
	Mon, 06 Apr 2026 16:24:11 +1000 (AEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 aws04.crawford.emu.id.au BFB925AA6C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=a1; t=1775456652; bh=Yx4r6syyAANXZY8ErzaZ5yAYRqoUc9iIqLifZb3kOTQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gegsGCUOLWQ55ueN/x6eEed7yTcrMlTg6Auix2hl97mMfwEun5pXa5dUEMuxES5Ne
	 q8TYLvEP0mTxGchT/SWmYXXQECzF8ZdrW7/dfeFuwSa8cyCttrhCdai76oAsy9QaEK
	 0Crm66lnVP583HMIU5FK9/KSyH6zDSSPj+StIsFmLPwmKfPWesc4Do9HFt9t+/co1g
	 +aL4tA5SEursgUGq36tcDM4fCBTDHRe9ezfSmd4qMGXlCQdfDGi5KwSBG5kfpilGwA
	 xwExXpe/kvFSfiU/YNT+8ILys9/uAd7F6b3DTz3GBS3S36BAtnOiTWBUxB2nCjQevO
	 WK9sqOclrreQQ==
Message-ID: <697248f496c0871fed950f3a9e16a9cec1cf0148.camel@crawford.emu.id.au>
Subject: Re: [PATCH v3] hwmon: (it87) Add support for IT8689E
From: Frank Crawford <frank@crawford.emu.id.au>
To: Markus Hoffmann <markus@thehoffs.at>, linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-kernel@vger.kernel.org
Date: Mon, 06 Apr 2026 16:24:08 +1000
In-Reply-To: <20260322103301.18112-1-markus@thehoffs.at>
References: <20260320144323.4870-1-markus@thehoffs.at>
	 <20260322103301.18112-1-markus@thehoffs.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.4 at aws04.crawford.emu.id.au
X-Virus-Status: Clean

Markus,

On Sun, 2026-03-22 at 10:33 +0000, Markus Hoffmann wrote:
> Add support for the ITE IT8689E Super I/O chip. The IT8689E supports
> newer autopwm, 12mV ADC, 16-bit fans, six fans, six PWM channels,
> PWM frequency 2, six temperature inputs, AVCC3, temperature offset,
> and fan on/off control.

Sorry about leaving this until now, I only just noticed the small
change within the patch set to add fan on/off control.

> Give it8689 its own GPIO configuration block in it87_find() rather
> than sharing the it8620/it8628 block. The shared block reads
> IT87_SIO_PINX2_REG and either marks IN3 as internal AVCC or skips
> IN9. Because it8689 declares FEAT_AVCC3, IN9 is already marked as
> always-internal before the GPIO block is reached; applying the PINX2
> check would either create duplicate AVCC labels on IN3 and IN9 or
> incorrectly skip IN9.
>=20
> Also update Documentation/hwmon/it87.rst and drivers/hwmon/Kconfig to
> document the newly supported chip.
>=20
> Signed-off-by: Markus Hoffmann <markus@thehoffs.at>
> ---
> Changes in v3:
> - Fix AVCC/PINX2 conflict: give it8689 its own GPIO block instead of
> =C2=A0 sharing the it8620/it8628 block. The shared block applies an
> =C2=A0 IT87_SIO_PINX2_REG check that is incompatible with FEAT_AVCC3:
> =C2=A0 it either creates duplicate AVCC labels on IN3 and IN9, or skips
> =C2=A0 IN9 while its label remains visible. it8622 (also FEAT_AVCC3) is
> =C2=A0 handled the same way for the same reason.
> - Add FEAT_TEMP_OFFSET: verified on hardware, temp[1-3]_offset sysfs
> =C2=A0 attributes respond correctly.
> - Add FEAT_FANCTL_ONOFF: verified on hardware, writing 0 to
> =C2=A0 pwm1_enable is accepted.

While you say it is accepted, does it actually have any effect?  I'm
told by someone else playing with this chipset that this feature does
not really do anything, although it also doesn't cause any operational
issues.

> - Add Documentation/hwmon/it87.rst entry for IT8689E, update the chip
> =C2=A0 list in the Description section, add IT8689E description paragraph=
,
> =C2=A0 and fix the in9 note to also list IT8622E (which also has
> FEAT_AVCC3).
> - Add IT8689E to drivers/hwmon/Kconfig help text.

Regards
Frank
