Received: from mx15lb.world4you.com (mx15lb.world4you.com [81.19.149.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C13231A3F
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Mar 2025 19:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741635683; cv=none; b=t5ZG07hCzOuUmxS0vjAgrkrbnBqv2oX4IeMrmatBi66H7x8W251GwnF6DfO6104ALtBoKnH2SieDgbIXFGj2kfnqtLmnIk/RIfbB7Je4uWqK6YPhVjNLP6KEhy5TvYhdjVfttPj2P+QZaKrR7SIcZZz7chRP/5j1KplC2gCm07g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741635683; c=relaxed/simple;
	bh=9EHRqM7pS5EWWU3ePK1+hEs81BC1jrP4OaBrI70sE2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKZFJqpsuk6KAWQk6Svj6x3vfmr58ASrN2KbG8qxIRUkaRfzzlxnXZAh7+PrzwhhlX8lMn1JDOzx9/pkvBClyVamVgg0UHtG88ve3syPDuinzwm8blihu1+040Zh/L+LN9WhkJH6NTi6wp3t/kReV2vCrWY2NHfhw3ZSzDbV3Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=gtXbeRPb; arc=none smtp.client-ip=81.19.149.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="gtXbeRPb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Mj4X2NUtM8XEr5MdfMfjgdgPV89SgtHs6/TbLGnQjMA=; b=gtXbeRPbBdTIeXV/awELD+dZH8
	P/Ays7CURb8h32bbGMBsoXII8ITxpp8AgKLFjThrZaM/fJWX2rBUGyDTf0fpdDJ2f3Y8J8dA/xSZ2
	zBLHrqvF9RQ9+/MH+8Gc5r8swsTSZ7/xxPyrLjiLE8nHYJW5yDMcgg/S8LMuuHQysQOY=;
Received: from [80.121.79.4] (helo=[10.0.0.160])
	by mx15lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1triaD-000000002tt-1M7t;
	Mon, 10 Mar 2025 20:14:37 +0100
Message-ID: <85ea98ad-9bc0-4d86-94d7-c972994e3721@engleder-embedded.com>
Date: Mon, 10 Mar 2025 20:14:36 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add KEBA battery monitoring controller support
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, Gerhard Engleder <eg@keba.com>,
 linux-hwmon@vger.kernel.org
References: <20250308212346.51316-1-gerhard@engleder-embedded.com>
 <54a58308-e559-4007-a751-2d8a8fef29bb@roeck-us.net>
 <aefd126d-2041-4355-b685-7aa5ebf6ff13@engleder-embedded.com>
 <6d6dfcdc-aad3-401c-8845-1da7bfba3b02@roeck-us.net>
 <34604a76-d28e-4d40-8c73-1062edee0237@engleder-embedded.com>
 <57917c3e-7d79-4c6e-b9f3-70e8265fb826@roeck-us.net>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <57917c3e-7d79-4c6e-b9f3-70e8265fb826@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 10.03.25 00:22, Guenter Roeck wrote:
> On 3/9/25 14:36, Gerhard Engleder wrote:
>> On 09.03.25 16:04, Guenter Roeck wrote:
>>> On 3/9/25 00:03, Gerhard Engleder wrote:
>>>> On 08.03.25 23:32, Guenter Roeck wrote:
>>>>> On 3/8/25 13:23, Gerhard Engleder wrote:
>>>>>> From: Gerhard Engleder <eg@keba.com>
>>>>>>
>>>>>> The KEBA battery monitoring controller is found in the system FPGA of
>>>>>> KEBA PLC devices. It puts a load on the coin cell battery to check 
>>>>>> the
>>>>>> state of the battery.
>>>>>>
>>>>>> Signed-off-by: Gerhard Engleder <eg@keba.com>
>>>>>
>>>>> Looking into the keba code, that is kind of piece by piece approach.
>>>>> I see a reference to fans in drivers/misc/keba/cp500.c, so I guess 
>>>>> I'll see
>>>>> a fan controller driver at some point in the future. I do not support
>>>>> the idea of having multiple drivers for the hardware monitoring
>>>>> functionality of a single device.
>>>>
>>>> Yes, the fan controller will follow. The cp500 driver supports multiple
>>>> devices. All of them have the battery controller, but only some of them
>>>> have the fan controller. Fanless devices don't have a fan controller in
>>>> the FPGA. There are also devices with two fan controllers.
>>>>
>>>> The battery controller and the fan controller are separate IP cores 
>>>> with
>>>> its own 4k address range (also I2C, SPI, ...). So I see them as 
>>>> separate
>>>> devices. There is also no guarantee if the address range of both
>>>> controllers is next to each other or not.
>>>>
>>>> Does that help you to see the battery controller and the fan controller
>>>> as separate devices?
>>>>
>>>
>>> Barely. At this point I am not convinced that this should be a hwmon 
>>> driver
>>> in the first place.
>>
>> Here a more detailed description, which I would add to
>> Documentation/hwmon/ in the proper form:
>>
>> The PLC devices use a coin cell battery for the RTC to keep the current
>> time. The goal is to provide information about the coin cell state to
>> user space. Actually the user space shall be informed that the coin cell
>> battery is nearly empty and needs to be replaced.
>>
>> The coin cell must be tested actively to get to know if its nearly empty
>> or not. Therefore, a load is put on the coin cell and the resulting
>> voltage is evaluated. This evaluation is done by some hard wired analog
>> logic, which compares the voltage to a defined limit. If the voltage is
>> above the limit, then the coin cell is assumed to be ok. If the voltage
>> is below the limit, then the coin cell is nearly empty (or broken,
>> or removed, ...) and shall be replaced by a new one. The battery
>> controller allows to start the test of the coin cell and to get the
>> result if the voltage is above or below the limit. The actual voltage is
>> not available. Only the information if the voltage is below a limit is
>> available.
>>
>> That's why I thought a voltage alarm is a good fit. But I'm not an
>> expert and I'm curious about your opinion.
>>
> 
> It is ok, though in0_min_alarm would be a better fit. And, yes, please
> add the above to the documentation.

I will take a look at in0_min_alarm. Thank you for your advice.

> Given the above description, and the code itself, I'd be a bit concerned
> that reading the value repeatedly will cause the battery to be drain faster
> than necessary (otherwise it could be active all the time). If so, it might
> make sense to reduce the frequency of such readings to, say, once a day.

You are right, this test would drain the battery too faster if done too
often. This is why the test is limited to every 5 seconds and this is
agreed with the electronics engineers. I will document that fact too.

> Personally I'd have tried to rely on the rtc itself to read the battery
> status (RTC_VL_READ ioctl), but of course not every rtc supports that,
> and not every rtc driver supports actually reporting it. Just in case
> the rtc in your system does support it, and the driver doesn't (such
> as the above mentioned MAX6916), it might make sense to submit a patch
> for the rtc driver and use that mechanism, since that would be a more
> generic solution than relying on proprietary fpga functionality.

That's possible for some designs yes. I will discuss that with the
electronics engineer for future designs with separate RTC chip.

Thank you for your feedback!

Gerhard
