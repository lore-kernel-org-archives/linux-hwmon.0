Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B30924061F
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Apr 2025 22:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745015415; cv=none; b=ortAGYuhD5eQgcTXemOeJrNEdEGbMRprx4K0ZS7USmFqvwzZaPCwDcr2AcXSCidNl6fi6JRutkApOMnWAXxyybLH09B18DWvtup/TumT9wIPGe1LFZyWaqH3/E2z6aXhctOKMwWvrh2u2ZCpOYbPDXInor1JhJDtJvqFh5he3FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745015415; c=relaxed/simple;
	bh=05pf/vcGaf4hJhjMpxRSs6UDrgngFUj/LZM7x2S/wgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mj9wM0upPfBBn47uIRuE5ZFZmjXaD2PI6pgcaywI3bEHD2doIheg+rmJNbRVxPJUaHP0NwdH1KcL8iIoGJk0fKrr9/rBgrBVSJbdv9SFPJiGvLt8klKtF79jpPrOOwGgfPcv4as67M0oLQgLqtitOkvPnkKkIMrHtCYaL1gCeVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUXr8vsx; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUXr8vsx"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3018221b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Apr 2025 15:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745015413; x=1745620213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6k+VIJh7ZeLSBxiC8umnY/CCdgV6SWY1UkgmkqxQBLQ=;
        b=fUXr8vsxg2J/iY/w6IgBbjMic+32ZTR80d3Qfwl9NeJGri0TrQbNkTi9oW1BL0dEDq
         c0UM/jDpm+mR1PLXn3yJSC5UOZIg+8E1lqX0YfV+Nx6y2bmb7ud9KJXw5NGeaqkli5C0
         LdwETFBkqRA8bcZFGM5Z4IdUJ///TqSc3ccTLkzrdkILgMt7InzRKOuZCI7SwBJ3KWvQ
         4YGpB2aXIejpcpgo1XJg5Gx5+uYWTEQUbkZ+gIrZguDgaaH5UmZl1L7Dv3eWi7NgUE9p
         igbZO0OyF3ZNWALUcqxDWaKU0pCAEPiE/+ULgSdHNmDucJYWb910sPWZ/KYI+pto8IgK
         4nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745015413; x=1745620213;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k+VIJh7ZeLSBxiC8umnY/CCdgV6SWY1UkgmkqxQBLQ=;
        b=PM3h8UjvJUGYz0kmatYlD43R2gWjytjlistkINDKYLIKULeBvsdAI9JUM2lyG4xLcG
         bSCIK/xSyZatd96fUrMnLjqBix73WRUVZsY1xSDDOTV+UcbmQYIox2UqIbQVXVujw6Pm
         Z8AayIR6UgYXyTq/iBV14xsMyBHW/3U326JNC7F9AcXlwosX8XCnv3BVyHUOIYDGYUdZ
         OJfxA1WQwGGwuYt4BcmbB9wJboVD8ZyXqOrzVZDGT5BgstZjNVC3jhk/yaMZPwiPgdpb
         mftn1ZC7/+UAikV4pey87hclyoF5d7eAyAmjHR3sE6xskEWb7keSS/HXMoW1b8yaU/oJ
         aUxA==
X-Gm-Message-State: AOJu0Yx0MfQGEGXvzhJGHZUZKE9Xp2BqxIAb54tl+nd7rXViidiiwprX
	Fa8SPAIZMdm8EcLXihnyGA2T2rN2PdsQ5Ql/aub13IEEsHKBL43aEEQAmA==
X-Gm-Gg: ASbGnctswNWCpSZfbWOYuDB31md/331QsWqPW7qRNtRUCSX/80ban2DkwGbtluNlku/
	AibzDjNq5rajU2tS6M9x6xzZ51urDbF14FIPudQnQ0EF4rtMZBCnzf//UYFEbcAMD1d1XpRFrhW
	zMA+EokOePp6/d0UeIR0Davonxj8R3BZZun00NDHmGqubWXmyy6KTb/lsF39Urto6zouJ525Xob
	Aog061mP33htNag0zQMmCi5fv3qPWeljXQJ3FQB63J0RStZfwp6d2OmR4UmqQXPNZz5TIeqp0I3
	SFD/tqFS53sawEEY6wGG7XH53EoxD1WYDPyxr/9NEmML1ltVDmQyYoiom7S1hOfGn7OCAgS8aJd
	kCbWTW0z4c0KV0Q==
X-Google-Smtp-Source: AGHT+IFDqFPb0JNna25RYbIdDKbu+bgvlp8oJuO8HNo87VXmSA4ZzvpSSLiJ+r+zIkgwtR4b0yctYQ==
X-Received: by 2002:a05:6a00:39a7:b0:736:73ad:365b with SMTP id d2e1a72fcca58-73dc14cca6bmr5939212b3a.14.1745015413226;
        Fri, 18 Apr 2025 15:30:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaace0dsm2107943b3a.126.2025.04.18.15.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 15:30:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1edc8396-535d-4cdf-bbb7-11d559d4c257@roeck-us.net>
Date: Fri, 18 Apr 2025 15:30:11 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PMBus memory overflow
To: Matt Corallo <yalbrymrb@mattcorallo.com>
Cc: linux-hwmon@vger.kernel.org
References: <985cd95f-155b-4b8a-9fe7-59938d0c2b8f@mattcorallo.com>
 <9e01e3ec-3ac5-4d83-a065-d00d568b9cc7@roeck-us.net>
 <e030f44f-11ee-4739-b9d3-c22883bbbf02@mattcorallo.com>
 <336f298f-497f-4dd9-97ee-50b81221be06@roeck-us.net>
 <1b1eccff-a306-4e17-a6bf-fd3203c61605@mattcorallo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1b1eccff-a306-4e17-a6bf-fd3203c61605@mattcorallo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/25 14:03, Matt Corallo wrote:
> 
> 
> On 4/17/25 9:21 PM, Guenter Roeck wrote:
>> On 4/17/25 11:14, Matt Corallo wrote:
>>> I do not, sadly (though FSP support has been rumored to help out at least marginally, though they haven't been useful for me). Interestingly the (I guess ancient now) pmbus_peek.c script has no issues reading from it (added a quick print on the -E2BIG line and it didn't get hit). pmbuss_peek.c says the following:
>>>
>>> root@rackchill-refresh:~# ./a.out -b /dev/i2c-3 -s 0x59
>>> PMBus slave on /dev/i2c-3, address 0x59
>>>
>>
>> pmbus_peek supports reading up to 255 bytes into the receive buffer.
> 
> Hmm, I'm using this version, which on L622 checks for a length > 32 (and doesn't get hit in the -s command) - https://github.com/jktjkt/pmbus_peek/blob/master/pmbus_peek.c#L622
> 

Sorry, I am only guessing here. The code in pmbus_peek.c is a bit odd, though:
It does validate the first byte, but then it jumps to try_i2c: and tries again,
this time reading up to 255 bytes. I am not really sure if that ends up reporting
an error or not. The comment "NOTE:  this probably won't be visible" doesn't
really improve my confidence that it will report the problem.

>> Anything above 32 bytes violates the SMBus specification. I found that
>> the I2C controller driver should block that. If it doesn't, all kinds
>> of chips could trigger this problem. Do you know which I2C controller
>> is used by that system ? You mentioned an SMBus - USB adapter. The drivers
>> for the adapters I am aware of (Diolan, Devantech) do validate the return
>> length, so I assume you use something else or maybe an out-of-tree driver.
> 
> The driver appears to be in-tree (or at least was auto-loaded by the Proxmox kernel, which is mostly just the Ubuntu kernel). Its a 10c4:ea90 Silicon Labs CP2112 HID I2C Bridge.
> 

So that is drivers/hid/hid-cp2112.c. Unless I am missing something, that driver
does not validate the contents of the first returned data byte when executing
an I2C_SMBUS_BLOCK_DATA read command.

> Still, more generally, presumably it shouldn't be the case that a defective USB device can cause the kernel to memcpy past a buffer? I guess for hardened kernels it gets caught (though once the process gets killed by the hardening the system is still somewhat shaky, reboots dont work etc), but is there a build option that would turn this into a security vuln?
> 

Exactly my point. A defective USB device should most definitely _not_ cause the
kernel to memcpy past the end of a buffer.

Of course, question is if i2c_smbus_read_block_data() should blindly copy more
than 32 bytes just because the first data byte returned from the device says so,
but that is a question to ask the i2c maintainer after we figure out what is
going on.

If you are up to compiling code, it would be great if you could add some debug logs
into pmbus_peek.c and/or into the hid-cp2112.c driver to see what is actually
returned from the chip.

Thanks,
Guenter

