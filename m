Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A79C35203D;
	Thu,  3 Sep 2026 22:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788475644; cv=none; b=jR+Vci7UXeMF31klcIQ9M9oihurK/1V3UexkQpIr4DKRMiTI0yLU0AFmy0jjLVuzS4FtsoEkYENL0JSeeNwrEQHzvFdJPTJeSitW/iGhA3biBzWexo2HU4nS8Upe6ozjgBVmmJYbyr/1fKj7dIt8PzwLbTtm4aGdZlusX0V1NhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788475644; c=relaxed/simple;
	bh=Fw/39VPGJMV+S1rqX3otK3BY/RkIua46XLFzdlV95GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYCuiBJ0Be3qmpMJcMU8FlWbxXeTaDKLf2CDIAGHAYSwQjJafG2fzJD4g03lTwlT42MUSN2+w9op7SB0xgQL+oyHtRvuFa1VsWO8JNh1oruLEyyyIec8C1dMcrlU4IJDJ22+VksnrG04Qr8Rvtl8pEMyCrc5RIpfXma8Dnlsdwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=HE6PwqNy; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="HE6PwqNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788475622; x=1789080422; i=w_armin@gmx.de;
	bh=Fw/39VPGJMV+S1rqX3otK3BY/RkIua46XLFzdlV95GQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HE6PwqNyW7NDKDPdNVusjiaTTUMyqvbYzw2xiLfsaP3o+OS6b3AXN3KUouo9z4xE
	 TpiQt9r2Ksu9LIIZbZXffxZbwZ5Mmyl31sqRG3y2ifliwXuHh7ZlCeqBWejhkwlEs
	 1KXdOzSDLuN3MDegWNsd8EVfWhGDL9Ft8JSHssLoq7iIT3sgwuzfPakfBGQAjn6gD
	 3BfMHRvaRKLH807FXPXVZ01XPbf4ZGLANzjaKXkwu5dzAmldk6JLakUPsrp8Nrpqi
	 j7Xn6i0kjRT8A1pRWv9V6vNFOpQcv7oVhjEinPQsrUaRLwgQOuDRUreEFTOojN9aJ
	 Tjq/JXbbufaQvFhQ0A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2aD-1wd4Wf2E23-00ijtw; Fri, 04
 Sep 2026 00:47:02 +0200
Message-ID: <02dc7eb6-6d0d-4c0c-af10-b831d3f8ba06@gmx.de>
Date: Fri, 4 Sep 2026 00:47:01 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Guenter Roeck <linux@roeck-us.net>,
 Matthew Bettencourt <matthew.bettencourt@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
References: <46191fa9-fa4a-4c16-b618-2c0c6dc09102@gmx.de>
 <531be24a-bad0-40f6-8e30-3d4da565afcb@gmail.com>
 <a2efdc40-c73c-4892-9fea-9470c0f9823b@gmx.de>
 <0388506d-9ddc-4825-bf28-95c8eef219b6@gmail.com>
 <57a05dea-3cce-4ecf-bbe1-ab7464f8c224@gmx.de>
 <a5d32ab5-f545-4e11-bf0b-88d3eaa68890@gmail.com>
 <474a37bb-0774-4710-8458-ea28d7c54c89@gmx.de>
 <c81e7caf-d3e4-4212-be9b-ec35d0a04086@gmail.com>
 <c096b0d7-90c2-4d91-9776-9f109679c309@gmx.de>
 <7ca2e621-e0a1-4eee-bcd1-2ded610f1beb@gmail.com>
 <cff09168-9a88-494d-bc82-d9a5e4de22a7@roeck-us.net>
 <e1a6a91d-d03e-4e7a-ba7b-9268284ce7e8@gmail.com>
 <5480c69c-8e98-443e-96d7-30e64e886373@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <5480c69c-8e98-443e-96d7-30e64e886373@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+UDIw/3/2HiqIOSOnHgU9KGabzFnHwuwpxWOM3pra72mBzxjyCP
 oY4k55nvU6yBXRZfJbxPam8dj1Mg5JWQpq81uGXnYNlq3b3qEANNcrfQHmVYwIcIjLJ6ita
 tMF68LPJUIwapb7h7NViDHVPfkN1GaHuDe5sAD+7w4bFUjh8uR+7h/OO9iaY4psYjqQSNq1
 2ApaZ3e+IptZ7Zqwr9BOQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RuAnbtgxKpk=;btevXHpyDer61GBQZoiT8B8cF2l
 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

Am 03.09.26 um 23:05 schrieb Guenter Roeck:

> Hi Matthew,
>
> On 9/3/26 11:25, Matthew Bettencourt wrote:
>> Hello Guenter,
>>
>> =C2=A0> This system [MSI PRO B850M-A WIF/7600x3d] does _not_ have a=20
>> problem, or did I misunderstand the above ?
>>
>> That is correct. I was unable to replicate the issue with the MSI PRO=
=20
>> B850M-A WIF and 7600x3d. The MR11 registered never got corrupted=20
>> during sleep/resume and I never saw any piix4 errors logged when=20
>> using my piix4 driver with the additional logging enabled.
>>
>> I never swapped the CPUs as that was more hassle than I was willing=20
>> to do right now, but if it something that might be useful I can=20
>> probably try that at some point.
>>
> I don't think that would help. From all the reports I browsed through
> so far, the common denominator seems to be that the affected systems use
> a X870 or X870E chipset.
>
> Anyway, couple of ideas:
>
> - Do you have the latest BIOS installed on your system ?
> =C2=A0 Some statements online seem to suggest that the problem
> =C2=A0 _may_ be fixed with the latest BIOS on at least some
> =C2=A0 of the affected systems.
>
> - Please boot the affected system with "usbcore.autosuspend=3D-1"
> =C2=A0 kernel command line parameter.
> =C2=A0 There are some claims online that this might resolve the problem.
> =C2=A0 I have no idea why that would be the case, but I guess it does
> =C2=A0 not hurt trying. Of course, if that _does_ work, we have yet anot=
her
> =C2=A0 mystery to solve.
>
> - Do you have memory with RGB-anything in the affected system ? If so,
> =C2=A0 is it controlled by the BIOS ? If yes, please disable the functio=
nality
> =C2=A0 if that is possible.
>
> Thanks,
> Guenter=20

According to the output of /proc/ioports, the root issue seems to be that =
the ACPI firmware
drives the SMBus controller and marks the affected IO ports as reserved, b=
ut acpi_check_region()
still tells the driver that the IO ports are available.

I already CCed the ACPI people to take a look at this.

Thanks,
Armin Wolf

