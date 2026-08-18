Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF5F3AD52E;
	Tue, 18 Aug 2026 05:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787029228; cv=none; b=nBX1Q07+A0Du0MriSk4pb1e2fAUzhkrjkr0tLxx8+gLRd7KHZ9X/bRTXcfrfesYmvhHyIEyJUzpwT3fLR3gYXvl6TLl0MWOOB+GXu94thZoRUwlI7Hwsv1zLpfMJxGJpXCVil0UbRqogShuWR/4AX0hKjKh6ZKGouLbTTMQNdi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787029228; c=relaxed/simple;
	bh=0eHpiokWB38B2qcORBHyZAHFEgW3x0PusYrSxnunfmM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=otD2DXY0hB6mIQ6JYvEiIGjTC7ByMwl7I0pZ75hCAXS7365LhY4txet7ws3g3Edr9DttjA6f7E+Dhayrbna04U7HWeiNgWCtt1+hgFmrpGQqkT4AKBIIdZyV2iOobeBa7iqo1IitDI88bcoWph00zwMES4m5bK7NyKjEDsCyUwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bas1FqGK; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bas1FqGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787029224; x=1787634024; i=w_armin@gmx.de;
	bh=0eHpiokWB38B2qcORBHyZAHFEgW3x0PusYrSxnunfmM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bas1FqGKYDGXmo986SdO8weKz1K0JEyv/QkzIb4sBNJOj51e92pE22foUdHP5Sds
	 /2bKX4gALXRXgfLDXAgaXSBYRHF41rlaY+HaYL7+7vgoD8E0EwPtk44Ub/cYkgghp
	 traLVe2MPxqBj0Rw50u2W3wiiUOr1+VXd6f/FjZSPJikwxA/uBmdCGbWm+0tUtFLY
	 Agx1fzVC19t7d3gfKmi/qcrpo7JMgsZDRyzdX6rSZAjoi3nS8Z+GITHqerqqBs7G2
	 sfXMJ3az48x/HYJTkjgi1eR+l7mM+IW520hN4z7wjAqxLh31fhhTSmPiI87SMq0GH
	 30Rlk994nz+PuffS+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsHnm-1wg2ew0BVS-014rUm; Tue, 18
 Aug 2026 07:00:24 +0200
Message-ID: <005e108a-a337-4c50-bc2e-aa7d933b7e2a@gmx.de>
Date: Tue, 18 Aug 2026 07:00:23 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hwmon: (spd5118) resume fails -ENXIO on write protected
 hubs
From: Armin Wolf <W_Armin@gmx.de>
To: Guenter Roeck <linux@roeck-us.net>, GG <ggirouard@bungeetaco.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <-r61PJXRNuWsDjnDETHSh2v7ASrtpweJe8hLjf7CbNH8-rQMiDXscPp7F_K2wLsYg0gvrl9gt7M5vyV-rPLIPSuHIKjIUr4ipRD_2jeCsmI=@bungeetaco.com>
 <vPlYOTmuxKCPw1cRvxIWJfqFl7p8endHIMWS9DZwINEUCPql8VLF7GBkmEBMokDKtHop6K5TAPUAlk-17CFWlA8extBUV7XGnuVx1KJK3iU=@bungeetaco.com>
 <1050e9b0-ef6a-4bdb-9510-572c2a93b485@roeck-us.net>
 <jjJPzuDEBRVJ3kZwlt43bdlePFCpQRMREjsEVngkNZLaCQDi9wBEEZb4U-2nvZ67qskaP8WSEbux8AmWenQGHT0WIvFQ6ZU2G4zQl3Lb4Vw=@bungeetaco.com>
 <ebcb1afb-26db-46f6-8e9d-30218190870b@gmx.de>
 <e1d6f669-b48b-4009-980f-a9defe273569@roeck-us.net>
 <d6d4148c-dfd2-499e-a068-85dfa68c2db2@gmx.de>
Content-Language: en-US
In-Reply-To: <d6d4148c-dfd2-499e-a068-85dfa68c2db2@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ngQHPQ44nAP3b+BkMYNyM1lzeKNiw5NuGNcN49AwUqTKuaGBNxU
 Juo20icc8JjMZ10oD5P9CRxKnHJZFpSXyZUZ4cNoxbgqXCv6Exi78oVpiJO36uHUePkDxSB
 fomHp4m66C/qQ1WMximYWtkBLbDnIrlxKbSii7L2svYhHLLKdbBnovxBxHmXn8p0XeyXc+9
 9GKqbbcORQbjjuLvR3ucQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lpCc/csXjts=;GTaIyfNeT50Cxxph0elnV6kP50G
 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
 hE+Vu2YbfW9RAtVk3jwDA/aIxZtU=

Am 18.08.26 um 05:50 schrieb Armin Wolf:

> Am 18.08.26 um 02:11 schrieb Guenter Roeck:
>
>> On 8/17/26 16:02, Armin Wolf wrote:
>>> Am 17.08.26 um 19:03 schrieb GG:
>>>
>>>> Understood - thanks for explaining the page selection part, that=20
>>>> makes sense. I'll blacklist it for now.
>>>>
>>>> Appreciate you taking the time to get back to me on this!
>>>>
>>>> Gabriel G
>>>>
>>>> On Monday, August 17th, 2026 at 12:58 PM, Guenter Roeck=20
>>>> <linux@roeck-us.net> wrote:
>>>>
>>>>> On 8/17/26 09:42, GG wrote:
>>>>>> Sorry - I should have searched the archives before sending my=20
>>>>>> last email. I've since
>>>>>> found this from February, which is the same problem:
>>>>>>
>>>>>> https://lore.kernel.org/linux-hwmon/20260205102942.28745-1-tinsaeta=
desse2015@gmail.com/=20
>>>>>>
>>>>>>
>>>>>> And I missed the obvious clue sitting in my own boot log:
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0 i801_smbus 0000:00:1f.4: SPD Write Disable is se=
t
>>>>>>
>>>>>> So my kernel already knew. Apologies for the noise.
>>>>>>
>>>>> Unfortunately that knowledge is not passed on to the spd5118 driver.
>>>
>>> Yes, sadly the patch series adding support for this was abandoned :/
>>>
>>
>> If I recall correctly, the important part (a=20
>> I2C_AQ_SPD_WRITE_DISABLED flag
>> or similar provided by the I2C controller) was rejected.=20
>
> What? I seemed to have missed that important info. How frustrating.
>
>>>>>> One thing I'll mention in case it's useful: that series above has=
=20
>>>>>> spd5118 refuse to
>>>>>> probe when writes are disabled. On my machine that would lose me=20
>>>>>> two working
>>>>>> temperature sensors. Reads are completely fine here, I get=20
>>>>>> correct temps,
>>>>>> and my temperature limits read back properly. It's only writing=20
>>>>>> that fails.
>>>>>>
>>>>>> Happy to test anything on my hardware if it would help.
>>>>>>
>>>>> That can not be done, as I mentioned in my other e-mail.
>>>>>
>>>>> Problem is that accessing temperature sensor data on spd5118=20
>>>>> compatible chips
>>>>> requires a write to select the correct chip page. If writes are=20
>>>>> disabled, and
>>>>> the BIOS selected a page other than page 0, temperature sensor=20
>>>>> data is not
>>>>> accessible. Since the BIOS can do whatever it wants and may have=20
>>>>> selected a
>>>>> different page after a suspend/resume sequence, one simply can not=
=20
>>>>> trust
>>>>> the status when the driver is loaded initially.
>>>>>
>>>>> Guenter
>>>
>>> Would it be enough if we always select page 0 inside=20
>>> spd5118_i2c_init(), thereby
>>> preventing the driver from probing on hardware that does not allow=20
>>> us to write
>>> the page select register?
>>>
>>
>> Looking into the code, it seems like the device may have been=20
>> instantiated
>> through the detect path. That makes me wonder which distribution enable=
s
>> CONFIG_SENSORS_SPD5118_DETECT because it should _not_ be enabled by=20
>> default.
>>
>> Anyway, I guess I'll have to implement a dummy write operation in
>> spd5118_i2c_init() to check if writes are possible and bail out on=20
>> error.
>> That is less than perfect but the best we can do without a flag from th=
e
>> I2C controller.
>>
>> I'll look into that after the commit window closes.
>>
>> Thanks,
>> Guenter
>
> I already have prepared two patches for that, i will test them on my=20
> machine as soon as possible.
>
> Thanks,
> Armin Wolf=20

Both patches seems to work, but i do not have an DDR5-based Intel system a=
nd hand. Still, do you want
me to send those patches when the new merge window opens?

Thanks,
Armin Wolf

