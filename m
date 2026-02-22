Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3293A1D2;
	Sun, 22 Feb 2026 19:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771788209; cv=none; b=Yk6ef+MLiOXDV3Q0eIVk+z2nOP2qrtp1QRoTiIOJonkFsYAFqjZy4yNoyoyxeuE5t0z49nNtke+gEJWE5x6u4hb0rL8cfK6yH1JqxFDlxdAEdYWkh+gaM+SURmr/EuqewZjpZMSZ+wU57gNlaVNrWSpIUi0lVH7eBF4iKZ0X3AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771788209; c=relaxed/simple;
	bh=jhSN5X4hAIM9zu82LweWQrwbTKA8/2m2Syp3RnAsM2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nn6+nWIZVbckjQmIENpPB5InAv72vKZe+eLORacPoRZ73FmjWtNP1/VX+gW4AADJ6kjqM2u2R4Y+5jVYweEv2WyAKx4PTAuoqhi3DMHYz8JYsKeiJjzSM3eWt0QhVKQmO7uYCi9Bo9n6HSBprUihPVROcxhCAyRyHtInYfS5K8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=asmuXqVu; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="asmuXqVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1771788205; x=1772393005; i=w_armin@gmx.de;
	bh=jhSN5X4hAIM9zu82LweWQrwbTKA8/2m2Syp3RnAsM2c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=asmuXqVuTA6ODmM2uqRh/mK1ImL1PZHEh8COKQ0D2wL28IusxT8jwHlt0M6co4Wm
	 euNDQ26GDqPHC0pPa96A9fKKeJtDYe3kHdAXUDH6H2K83FhjxsH8Bc7JWgyIZ5pQs
	 rbzhm3/BxUVfcpgdiX/h8AiSj/S4axN/dO6K4xxCJku1qWDScF4w4rATInn+cAPNp
	 2C0p1UN6n3XhdDFAyS5DqUtA5wv9V+fpPDH9C67CBrIoBXmX5MP+4yecg+xSfTsMH
	 A0weUxeyAuz9T7kWyS2dalNGHSg/x+qyAN7pGEvECUHh2M9KkKPX8V4avKf6V6qi8
	 Mb8ynvAq5BoI8VDysw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.226.35]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6KYb-1vef240Nq5-016HSl; Sun, 22
 Feb 2026 20:23:25 +0100
Message-ID: <85d4081b-5765-4198-9339-637658d0327c@gmx.de>
Date: Sun, 22 Feb 2026 20:23:23 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/REQUEST] Support fan control for MSI Prestige 15 A12UC
 (16S8EMS1.107)
To: Guenter Roeck <linux@roeck-us.net>,
 Lorenzo Ferranti <lorenzoferranti04@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <CAK-2s0=4PfPXe5GUKY3NSkKZb6Biax6O5kM5SH4t_YhwzLM9EQ@mail.gmail.com>
 <61c69c54-5218-4c53-8bc9-4032d2967571@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <61c69c54-5218-4c53-8bc9-4032d2967571@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R+EN+MXpTKmTuFVe+gELKuJa3Q4STIJfgAgX18WLSyNi3wPBdsv
 BzSwt/63jVvpYasHAedFGgeIXXJnmN1rtEKfQkR6sl9CVuDOpGPj1xc73h1O30Ll5DLvzrT
 wSarqDPxsesHsFO11Nrc+W4iDZnw3Bpnf8dpOCS/0nr3Kj4hV0zVSGl4L41KtE4AXs4lgTl
 RySkEP+MyWh2/Xo6+2sdw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5yn71TJ3qaE=;Xo9gR7P9z4iNu+Y0Gm4Q6zKYVgc
 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

Am 21.02.26 um 17:25 schrieb Guenter Roeck:

> On 2/21/26 07:36, Lorenzo Ferranti wrote:
>> Hello,
>>
>> I don't know if this is the proper way of asking for a patch for=20
>> msi_wmi_platform driver.
>>
>
> That is a platform driver. While it registers a hardware monitoring=20
> device,
> it is not maintained as hardware monitoring subsystem driver. All=20
> requests
> should be handled on the platform driver mailing list (copied).
>
> Thanks,
> Guenter
>
Correct, thank you.

Lorenzo, i can take a look at the control center and try to find out how t=
o enable manual fan control.
There was a patch floating around for adding this feature for MSI Claw dev=
ices, but it eventually got stuck.
I will see if i can find something in that direction.

Thanks,
Armin Wolf

>> Anyway, I recently switched to linux on my MSI laptop. I noticed that=
=20
>> the drivers can correctly get my fans RPM, but cannot set them. For=20
>> example, in the CoolerController app I get the message "The currently=
=20
>> installed driver does not support control of this channel".
>>
>> I am using an MSI laptop with:
>>
>> =C2=A0 * Model: MSI Prestige 15 A12UC
>> =C2=A0 *
>>
>> =C2=A0=C2=A0=C2=A0 EC Firmware: 16S8EMS1.107
>>
>> =C2=A0 *
>>
>> =C2=A0=C2=A0=C2=A0 Kernel: 6.18.7
>>
>> =C2=A0 *
>>
>> =C2=A0=C2=A0=C2=A0 OS: POP!_os
>>
>> =C2=A0 *
>>
>> =C2=A0=C2=A0=C2=A0 CPU: 12th Gen Intel Core i7-1280P (same as Big-Nicox=
)
>>
>> =C2=A0 *
>>
>> =C2=A0=C2=A0=C2=A0 GPU: NVIDIA GeForce RTX 3050 Laptop
>>
>> I tried loading msi_wmi_platform=C2=A0with 'force=3Dtrue', but this doe=
s not=20
>> enable fan control. I also tried looking at the msi-ec driver, but my=
=20
>> firmware version is not supported yet (but I am trying to get it=20
>> supported).
>>
>> I would like to request that this firmware ID be added to the=20
>> supported list for fan control in msi-wmi-platform. I am happy to=20
>> test experimental patches or provide further debug data to help map=20
>> the registers safely for this model. I sent dumps of my EC and ACPI,=20
>> I hope these will be useful.
>>
>> Thank you for your work on this driver!
>>
>
>
