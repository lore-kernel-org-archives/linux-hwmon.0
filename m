Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB652580F3;
	Tue, 18 Aug 2026 03:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787025070; cv=none; b=Kl/6bzn6sifqAMrzVrEWJPyOr5IkFZgljZmqxDAYZEc5Q1PDIYfGjoix94WyU2OMFvPTl0LF2wkTKeVpVx77uqP8kysCFYVAi0o7ILNeBTZd7qGB0PvCnI2Zs1rv6sHg2+OJoWwARZ/Gz/Hj5E7QR05NvszozCu9AdqeeEBQcv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787025070; c=relaxed/simple;
	bh=xubF4+NOjwFj9rkNdmrIvu9wJyQnmgdb4J47gEE8T4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojbbPKD+/GnVN23h8mnXZRJjW9MOkAFuk5dwnZ0O61E6CrPFEH6MeQNVHnykrNO8j1xBFJeV3QEzVrfbXRvGxymD2vfWJChj2OlgLTxaEd4zHLB1g07a+fOK3uPhUCcOEooCS1mSGwF43H83rJ1qQZSG7no/0GfY+dddJgB00m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=sRBIvOhS; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="sRBIvOhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787025051; x=1787629851; i=w_armin@gmx.de;
	bh=xubF4+NOjwFj9rkNdmrIvu9wJyQnmgdb4J47gEE8T4U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sRBIvOhSF2hzyP/r692Qo+Equh3OsUBXbdEONFhryga9ssv1m4IzfUDahcW90gh6
	 1MPwevUOVJsFdbYfa3JS/GrDLHNhgz14MVCoMQC/VlBlK+8f80uL1tEGbi4QXlu+8
	 2yaumAxo0I8rp+Sq7YJBacXa97lKqC8xwhkQrPUpyIaTxaBpWa6QL0R1zyxHE0U9G
	 Or39kD6/InwkAc2mKCAN4W/O9VdhUjZwVtuJ7N4cmekA4VdRcPRdS+mwcr+PnMSKE
	 SNWqZ5ltEGEo2+LSJlx3J8xvKEtnDI/VQa74h2ERaGGAmHoLNw2T7Ca1nNF86fJYE
	 PSEyY35VyIwg5w4kgA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnpns-1wbi8f0pGE-00jcEJ; Tue, 18
 Aug 2026 05:50:51 +0200
Message-ID: <d6d4148c-dfd2-499e-a068-85dfa68c2db2@gmx.de>
Date: Tue, 18 Aug 2026 05:50:50 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hwmon: (spd5118) resume fails -ENXIO on write protected
 hubs
To: Guenter Roeck <linux@roeck-us.net>, GG <ggirouard@bungeetaco.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <-r61PJXRNuWsDjnDETHSh2v7ASrtpweJe8hLjf7CbNH8-rQMiDXscPp7F_K2wLsYg0gvrl9gt7M5vyV-rPLIPSuHIKjIUr4ipRD_2jeCsmI=@bungeetaco.com>
 <vPlYOTmuxKCPw1cRvxIWJfqFl7p8endHIMWS9DZwINEUCPql8VLF7GBkmEBMokDKtHop6K5TAPUAlk-17CFWlA8extBUV7XGnuVx1KJK3iU=@bungeetaco.com>
 <1050e9b0-ef6a-4bdb-9510-572c2a93b485@roeck-us.net>
 <jjJPzuDEBRVJ3kZwlt43bdlePFCpQRMREjsEVngkNZLaCQDi9wBEEZb4U-2nvZ67qskaP8WSEbux8AmWenQGHT0WIvFQ6ZU2G4zQl3Lb4Vw=@bungeetaco.com>
 <ebcb1afb-26db-46f6-8e9d-30218190870b@gmx.de>
 <e1d6f669-b48b-4009-980f-a9defe273569@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <e1d6f669-b48b-4009-980f-a9defe273569@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8jTZ9VY0BsXxKAzjRUcpeodVZf4fPVW24iRvU0oNcRgyYXuclCQ
 yvczvXwktiwxIpKLB/L2Xs/pJ51VGc8XE+5q/7xRUfkhB+xFw8WNGXVW7Ak3CdffVG/n97z
 xyIJBHCib9k3ZzWvI1KUqHtZzw7bEAFOruQLCGOOzZmTxvnd0hs0d5SkZ8iCDepy2sxd6G2
 /2H8o3Q6Cv2RuStfSN/ZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FFZeLG4nyWc=;wFq7PVR+1vNVniKpAHSW0oxO2qd
 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
 qyR/QBP4q/soOe6LVXFUvon8LJ5E=

Am 18.08.26 um 02:11 schrieb Guenter Roeck:

> On 8/17/26 16:02, Armin Wolf wrote:
>> Am 17.08.26 um 19:03 schrieb GG:
>>
>>> Understood - thanks for explaining the page selection part, that=20
>>> makes sense. I'll blacklist it for now.
>>>
>>> Appreciate you taking the time to get back to me on this!
>>>
>>> Gabriel G
>>>
>>> On Monday, August 17th, 2026 at 12:58 PM, Guenter Roeck=20
>>> <linux@roeck-us.net> wrote:
>>>
>>>> On 8/17/26 09:42, GG wrote:
>>>>> Sorry - I should have searched the archives before sending my last=
=20
>>>>> email. I've since
>>>>> found this from February, which is the same problem:
>>>>>
>>>>> https://lore.kernel.org/linux-hwmon/20260205102942.28745-1-tinsaetad=
esse2015@gmail.com/
>>>>>
>>>>> And I missed the obvious clue sitting in my own boot log:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0 i801_smbus 0000:00:1f.4: SPD Write Disable is set
>>>>>
>>>>> So my kernel already knew. Apologies for the noise.
>>>>>
>>>> Unfortunately that knowledge is not passed on to the spd5118 driver.
>>
>> Yes, sadly the patch series adding support for this was abandoned :/
>>
>
> If I recall correctly, the important part (a I2C_AQ_SPD_WRITE_DISABLED=
=20
> flag
> or similar provided by the I2C controller) was rejected.=20

What? I seemed to have missed that important info. How frustrating.

>>>>> One thing I'll mention in case it's useful: that series above has=20
>>>>> spd5118 refuse to
>>>>> probe when writes are disabled. On my machine that would lose me=20
>>>>> two working
>>>>> temperature sensors. Reads are completely fine here, I get correct=
=20
>>>>> temps,
>>>>> and my temperature limits read back properly. It's only writing=20
>>>>> that fails.
>>>>>
>>>>> Happy to test anything on my hardware if it would help.
>>>>>
>>>> That can not be done, as I mentioned in my other e-mail.
>>>>
>>>> Problem is that accessing temperature sensor data on spd5118=20
>>>> compatible chips
>>>> requires a write to select the correct chip page. If writes are=20
>>>> disabled, and
>>>> the BIOS selected a page other than page 0, temperature sensor data=
=20
>>>> is not
>>>> accessible. Since the BIOS can do whatever it wants and may have=20
>>>> selected a
>>>> different page after a suspend/resume sequence, one simply can not=20
>>>> trust
>>>> the status when the driver is loaded initially.
>>>>
>>>> Guenter
>>
>> Would it be enough if we always select page 0 inside=20
>> spd5118_i2c_init(), thereby
>> preventing the driver from probing on hardware that does not allow us=
=20
>> to write
>> the page select register?
>>
>
> Looking into the code, it seems like the device may have been=20
> instantiated
> through the detect path. That makes me wonder which distribution enables
> CONFIG_SENSORS_SPD5118_DETECT because it should _not_ be enabled by=20
> default.
>
> Anyway, I guess I'll have to implement a dummy write operation in
> spd5118_i2c_init() to check if writes are possible and bail out on error=
.
> That is less than perfect but the best we can do without a flag from the
> I2C controller.
>
> I'll look into that after the commit window closes.
>
> Thanks,
> Guenter

I already have prepared two patches for that, i will test them on my machi=
ne as soon as possible.

Thanks,
Armin Wolf

