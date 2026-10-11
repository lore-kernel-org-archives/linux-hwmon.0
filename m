Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E3A30C37C;
	Sun, 11 Oct 2026 22:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791758725; cv=none; b=NdlFZfh8FUwmxOrar5xJpWBvN1qvQe5BLjpEydQM9VKF+3qzY3vh5h9qs4gGpYsyVc8MTCfANBUJRfG/Vwqvxlu/NAbKFyk2Te+ihrhgzsz7Ln30xYQDKmGc8muQF91LcWTzki4QrfOmhvrgRMS73zDL2eLkDL0NCYCB/Q21yFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791758725; c=relaxed/simple;
	bh=MpptPEuUc4Zl2VBSSC8vTEJ/40iYFzZ7PBZi3VinuBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSur/QYEp2yIe6YMfUxYY3lyZ9ZnEv7VwYyUqcrtu1Sx6c3EWkJnMQxukXMK2Vl6qBLxoTkX2uRUh0a6uuBQUQiV6AhCDwhVeZTJRG/kFDniaf9rqmNOx32zm0hdcoe1RiSy2pp/IO+j9RZIG09IZU7R8+b6zz7gue3rSZ8iZ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=otqpWM+5; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="otqpWM+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791758721; x=1792363521; i=w_armin@gmx.de;
	bh=borhQjNfpDYnpe2IAqYuUxRGgmMePdrFvnJNOViapj0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=otqpWM+5SSoYpNT4F4BHhZ9fgzTYMQXGUuuWcpv2oNm7xeID10UNjLr/BenxDTnq
	 Q2P+/tXplj5PdhgTErOQmAj/D6+rshw/XpGIhFVAJsVve/977Na43Im5RioXoJ+do
	 PwVJ9ucc1LQtp0OZ2HRgJ+RGDUSKEls3cXZoOEDB8hN8UvNBbdBFW5ia4tfiR0+nG
	 V8LPVUuyOWQFyFr1eWa6pRcufD2oLTfU5A/2XRVuJ1XcxwKimgruy3c0mSWUZADDP
	 f87+2LSnhgbwtLfCh1fA7aC+W8zj4+xIbrHeAnGnC0WsuUsV2DLWlnPFvv1dKBQh0
	 +vp/mCykUAPj1jqyAw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wKq-1xCkVZ0vHA-008jmN; Mon, 12
 Oct 2026 00:45:21 +0200
Message-ID: <a3db0eec-2da9-4461-9ce7-616be916ea34@gmx.de>
Date: Mon, 12 Oct 2026 00:45:20 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
To: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:r1t2m12Nd6ntIDBw6EEhuMfQL56I3OljhL0d1X+9hEoJngeighw
 o/20gi9eyLaqhG8yq2lsyDKTjCwnPS02/JngngimA3IOmGT1FNmQxLoWzQ0uplqr9ty6S/X
 2wcgIBWdOeEd8RrC+4VzfartoV4evVbyEQb6oa1gx9RlL1vaoVeJGfSJvSqylDBoRV+cBfh
 KLpFUraYJzSsqhZSCIvMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D7YRWOxdSiI=;uNLewr0BScmKeDbl9VCZbzK1JsR
 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
 l8JQZPyCKrKfD7Yecvb0f+xz4PNNo=

Am 11.10.26 um 18:03 schrieb Lorenzo Collevecchio:

> Hello,
>
> I am seeing hp-wmi fan interface failures on an HP OmniBook 5
> 16-ag1xxx. This is not a gaming model.
>
> Hardware:
>    product_name: HP OmniBook 5 Laptop 16-ag1xxx (16-AG1002SL)
>    board_name:   8DF4
>    BIOS:         F.12, 04/10/2026 (no newer firmware listed on LVFS for
> this machine)
>    Kernel:       7.2.9-2-cachyos (also tested 6.18.55-2-cachyos-lts;
> ACPICA 20250807 vs 20260408)
>
> Symptoms:
> 1. At boot, \_SB.WMID.WHCM (called via WMAA) fails three times with
>     "AE_AML_OPERAND_TYPE: Needed [Buffer/String/Package], found
> [Integer]" while resolving operands for [Index].
> 2. Immediately afterwards: "hp-wmi hp-wmi: Failed to apply initial fan
> settings: -22".
> 3. Later: "Attempt to CreateField of length zero" in \_SB.WMID.WQBC
> and WQBE (AE_AML_OPERAND_VALUE).
> 4. hp_wmi still registers as a platform profile handler (quiet
> balanced performance).
> 5. /sys/devices/platform/hp-wmi/hwmon/*/ contains only pwm1_enable
> (rw); there is no pwm1 and no fan1_input.
> 6. On the LTS kernel the same WHCM error repeats about every 2.2 s
> while something polls the hp hwmon device (277 times between 551 s and
> 1165 s uptime).
> 7. ACPI thermal: "Invalid critical threshold (-274000)" and "No valid
> trip points!" for thermal zone TSZ0.
>
> Fan behaviour:
> - acpi_fan (acpi-fan PNP0C0B, "Using Microsoft fan extensions")
> exposes fan1_input. It sometimes shows about 2400 RPM and sometimes 0
> RPM.
> - The fan works normally under Windows on the same machine.
> - I once saw the CPU around 95 C with the fan apparently stopped on
> Linux; I have not been able to reproduce it yet and am collecting a
> temperature/RPM log.
>
> I suspect the WMI query path the driver uses for fan settings is not
> implemented by this firmware, so hp-wmi should probably not attempt it
> on board 8DF4. I would be glad to test patches or provide acpidump
> output, WMI GUID listings or any other data.
>
> Thanks,
> Lorenzo

Please share the output of acpidump so i can take a look at the affected ACPI code.

Thanks,
Armin Wolf

