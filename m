Received: from mx14lb.world4you.com (mx14lb.world4you.com [81.19.149.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843FD1805A
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Mar 2025 22:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741559684; cv=none; b=Az1bI/iarm5OHP7aX02x9tsjBMhBIFHeS69H4Q9dwwOo8of9ABLQiRxk4bdKrjti3vzSMJRurV1IxrC4J2D/ihDkWpgRTgeuIlj9lBC7/1fBy+AxdPX/GkrHiAde22xBgOYCL0T9HYUhCYqyOQ/JJFrCu+oz6BvjBaYtkR17Xow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741559684; c=relaxed/simple;
	bh=ZG7zemHYiXvLSzAYeI8uojvRjMA8KZpAPEgCio7ZaiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pV+b08QUYnCvL1Jk/YIGSDRiLHCJRxnUn+UUmrvxTqBHM5xrfSC4T/PoB+ro1/Q0/5wTBrw7qtQQBO0RxBHCehU+4KRP7bLPQ3lQCaM8mECbFB4v9mpP8KbRdFnd+ITzUAl4E7mn38AqYpO7Qn2/267QaNSxaukfSeaffzUz17k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=rYgucYsi; arc=none smtp.client-ip=81.19.149.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="rYgucYsi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IewZpeqMS4k7aWpLNi0L3j+LFJvXDWofANgIADEl9Ck=; b=rYgucYsi5V/K5LasOzaZFKxpQZ
	Pr4qTcEMOIhxHFlsEyHKgv++kWG0g9aVF0H5owPztGZt/OWo3g3cJrw94pnc/NjQitU/usOnIakMt
	jsgltmZEkjlZ8zPfGrtpuNtSTYKDwNn0NIpDqWManPaiNDIcozdqkZJbcbaE7Ugd+huk=;
Received: from [80.121.79.4] (helo=[10.0.0.160])
	by mx14lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1trOKE-000000008QD-31kY;
	Sun, 09 Mar 2025 22:36:48 +0100
Message-ID: <34604a76-d28e-4d40-8c73-1062edee0237@engleder-embedded.com>
Date: Sun, 9 Mar 2025 22:36:46 +0100
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
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <6d6dfcdc-aad3-401c-8845-1da7bfba3b02@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 09.03.25 16:04, Guenter Roeck wrote:
> On 3/9/25 00:03, Gerhard Engleder wrote:
>> On 08.03.25 23:32, Guenter Roeck wrote:
>>> On 3/8/25 13:23, Gerhard Engleder wrote:
>>>> From: Gerhard Engleder <eg@keba.com>
>>>>
>>>> The KEBA battery monitoring controller is found in the system FPGA of
>>>> KEBA PLC devices. It puts a load on the coin cell battery to check the
>>>> state of the battery.
>>>>
>>>> Signed-off-by: Gerhard Engleder <eg@keba.com>
>>>
>>> Looking into the keba code, that is kind of piece by piece approach.
>>> I see a reference to fans in drivers/misc/keba/cp500.c, so I guess 
>>> I'll see
>>> a fan controller driver at some point in the future. I do not support
>>> the idea of having multiple drivers for the hardware monitoring
>>> functionality of a single device.
>>
>> Yes, the fan controller will follow. The cp500 driver supports multiple
>> devices. All of them have the battery controller, but only some of them
>> have the fan controller. Fanless devices don't have a fan controller in
>> the FPGA. There are also devices with two fan controllers.
>>
>> The battery controller and the fan controller are separate IP cores with
>> its own 4k address range (also I2C, SPI, ...). So I see them as separate
>> devices. There is also no guarantee if the address range of both
>> controllers is next to each other or not.
>>
>> Does that help you to see the battery controller and the fan controller
>> as separate devices?
>>
> 
> Barely. At this point I am not convinced that this should be a hwmon driver
> in the first place.

Here a more detailed description, which I would add to
Documentation/hwmon/ in the proper form:

The PLC devices use a coin cell battery for the RTC to keep the current
time. The goal is to provide information about the coin cell state to
user space. Actually the user space shall be informed that the coin cell
battery is nearly empty and needs to be replaced.

The coin cell must be tested actively to get to know if its nearly empty
or not. Therefore, a load is put on the coin cell and the resulting
voltage is evaluated. This evaluation is done by some hard wired analog
logic, which compares the voltage to a defined limit. If the voltage is
above the limit, then the coin cell is assumed to be ok. If the voltage
is below the limit, then the coin cell is nearly empty (or broken,
or removed, ...) and shall be replaced by a new one. The battery
controller allows to start the test of the coin cell and to get the
result if the voltage is above or below the limit. The actual voltage is
not available. Only the information if the voltage is below a limit is
available.

That's why I thought a voltage alarm is a good fit. But I'm not an
expert and I'm curious about your opinion.

(...)

>>> Not acceptable. The first voltage channel is channel 0, not 1.
>>
>> I did that for compatibility reasons, as the out of tree version of the
>> driver did start with index 1 and there is software which rely on that
>> fact. I saw a similar dummy in ina3221.c, so I thought this is ok.
> 
> Isn't this a nice thing in the Linux kernel: You can find almost everything
> in there to use as precedence.
> 
> The ina3221 driver slipped this in when it was submitted and, yes, I didn't
> notice. When it was converted to the with_info API, it was too late to
> change it. That doesn't make it better, and it is most definitely not an
> argument to make for a new driver doing the same.

I'm sorry, I only wanted to mention where the idea comes from. I will
start with channel 0.

Gerhard
