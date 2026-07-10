Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C736368D4F;
	Fri, 10 Jul 2026 21:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717829; cv=none; b=nLhUxj5pPDC9Qel3mn6Npx2ADFNbBMv6g9z/6cp6hF4lwycJZlcmlVKpxpBRJ4EE0s8dWDKIbGIDOks5tS47LHZ3yr/7Py1ql4JWhIKdXLWh4baeW48nMxNSp7AEwA6dUpz6s5NXN6Qh+7hVG4b22jcU/ys8bvLNE7faAooXWGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717829; c=relaxed/simple;
	bh=Xa1BmOHlHVxAo8ZdNzFPUh5vttGADAftNGZFRuvFvRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nRVAGCg3aU65f72pAtV8iVCTGe5mplBN++PUt+sBEd8+hKoIT5XGwk591/J+b3GNtYqEPZ8+VA6/HEWR7C0KocVXHqfnTsJvx68A2/eR+uw/TzfAhEwGJfgGXSJ8Mp7c9t6zGPQrhTLmMOcJrfWThoLmlOz3piho1MO56b5MwQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=uBWlXsff; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="uBWlXsff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783717807; x=1784322607; i=w_armin@gmx.de;
	bh=r5jRc8RBauCguBU8CVrAoqP6AUKv9anuO27QZbRD0jM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uBWlXsffGpYJliISJ36cTrB/rlCFH83ge7/EFTRJaG+8PU5Fv3wn+wDrw5TXO0VM
	 EYHojnwKC02yWs+gwCrb1mnveBRDBdkzGXLtcP9UH/vuK9V/ToB7q3oGH06rtYYDq
	 CaFEeb4ZRQM5zOFx1PR1MKFSV39wyhRu3mkl0E8pcvRCrf+rHJ+WqkUGMUaPzjmfZ
	 7vSzsQVIfFJsB3JXQ+/c7tSHfEbF6ZGtXvH0Hx52IW4N3PpaGP1ec0Mr/4iEXlSbC
	 BdvVQG7bidI8ZW+A4dknF/SHNf0xI5EnDG1yqDX+BuKfp6LSBQYtzvPNPVWpPPPfQ
	 CE4QHqxSNlcam9iYLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMobO-1wRj2I3bBU-00Xqug; Fri, 10
 Jul 2026 23:10:06 +0200
Message-ID: <5fff5c16-691d-4009-add6-1a38aec3a4b1@gmx.de>
Date: Fri, 10 Jul 2026 23:10:05 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hwmon: (applesmc) Convert to
 hwmon_device_register_with_info
To: Guenter Roeck <linux@roeck-us.net>, Shih-Yuan Lee
 <fourdollars@debian.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260710123236.10508-2-fourdollars@debian.org>
 <99c83d9e-129a-4db1-b0bc-dba75c07708e@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <99c83d9e-129a-4db1-b0bc-dba75c07708e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LmjUJisobMP//eBjjNyhH065+DOY9zbYPr32p5XtGhDURz0NsV7
 XrS+qeUlEPA0FamC9eayp7ESrM0wuyX4K6rYmG2S/QX/jHkgIOWYTNsEpdaasD0wrlxaxOQ
 mJYcoPcSXjiMufH+M8rPfSEHYKcRgTOTWY7253Cu9VVWSTYv7TOL/iCwEUijzjbsrml25N+
 UYIONpjDzXUG7iK3DLmDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kmn54oJI6+c=;isEJUZ7qpZEV0I/OuKzXXX+3oHl
 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

Am 10.07.26 um 16:01 schrieb Guenter Roeck:

> On 7/10/26 05:32, Shih-Yuan Lee wrote:
>> The legacy hwmon_device_register() function is deprecated and triggers =
a
>> warning in dmesg during driver initialization:
>>
>> [=C2=A0=C2=A0 24.706091] applesmc: key=3D620 fan=3D0 temp=3D37 index=3D=
36 acc=3D0 lux=3D2=20
>> kbd=3D0
>> [=C2=A0=C2=A0 24.706270] applesmc applesmc.768: hwmon_device_register()=
 is=20
>> deprecated. Please convert the driver to use=20
>> hwmon_device_register_with_info().
>>
>> To silence this warning, convert the driver to use the modern
>> hwmon_device_register_with_info() API.
>>
>> Because the driver creates all its sysfs attributes dynamically on=20
>> the platform
>> device, we define a minimal struct hwmon_chip_info with a single=20
>> temperature
>> channel and implement a visibility callback that returns 0 (hidden)=20
>> for it.
>> This satisfies the new API requirements while keeping all existing=20
>> sysfs paths
>> and attributes completely unchanged, ensuring backwards compatibility.
>>
>
> Novel, but that would completely defeat the purpose of the new API.
> NACK.
>
> Guenter=20

Agree, this deprecation warning should not be silenced by using cheap tric=
ks.

Lee, i think instead of abusing the hwmon_device_register_with_info() to e=
mulate the
behavior of the old API, i suggest that you use the new API to replace the=
se two calls
to applesmc_create_nodes():

ret =3D applesmc_create_nodes(fan_group, smcreg.fan_count);
if (ret)
         goto out_info;

ret =3D applesmc_create_nodes(temp_group, smcreg.index_count);
if (ret)
         oto out_fans;

Basically, you need to dynamically allocate a struct hwmon_channel_info ea=
ch for the fan
and temperature sensors. Then you basically use the new API to create the =
standard attributes
for you, while the non-standard attributes are still created manually and =
passed using the
extra_groups parameter.

The non-standard attributes are:
- fanX_safe
- fanX_output (should be renamed to fanX_target to comply with the standar=
d sysfs ABI)
- fanX_manual (should be renamed to pwmX_enable to comply with the standar=
d sysfs ABI)

This changes are not exactly trivial and should be tested on real hardware=
. You should
only attempt this if you have access to a compatible device for testing.

Thanks,
Armin Wolf

