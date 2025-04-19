Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8D47080E
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745089519; cv=none; b=lw28KhrMEiKd2o3qfqe4Txwl1/m+uxcptpB3Xrqw5vpUyPWsti8y9ziXzG1NxMwmOrE8GY+LBYVwahn1dEItVWUddUPMi2IINKHoKmRae1iUQwle6rtuygus85bqqj8HSb18zpGG7wWOJVNmn7JKv+vq2RIfLcw736jwUMeasoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745089519; c=relaxed/simple;
	bh=sGdSh5GzswJ5p5liNk1oPdLfGFS9RJ5iXIQzuozbH+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJrDl1YO50GtH0it0VUNSPaHvDluE47OS6Xikrl4PSh/Br546pnfw8hJR5ltFhLHyUyZa6kHKBcJaVYZphUZ+nKBF+RZaT7ggyLJqoSOZW+2YAi0EVi8FBzFFkjbEzZrXsySVuSzmk/ae4rEQUUBaGeco90bTpH2/XIZ786o+UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IH3DjLKC; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IH3DjLKC"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2264aefc45dso46986855ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 12:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745089515; x=1745694315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8kBk9bCoy8X/XIybnSHfXOwxQpQEH64bvj/aD/TILh4=;
        b=IH3DjLKCn4XZh6UFbA68Xa3HRFtyXjvqvkyU/CTV9u/BnFsFUAc9dQRsKEMEVwmFLd
         4vRom5L8wevEma58pftU0wHGk9r2n/WXZdDy3hhIQdfrbbtM1p2Le7D5mtjxeBgwu17O
         h0YknfCf87om71LhhgO29RenqcnznndJSKpULembplMx+qvDKVpMV/IFsXpNZdKDzIRA
         BehgAn5eJE3JTH89/8PeZLFV+PSPBRvQDU7zQcVXlZshlbVVc2BvXw/TwCPuEDU+smMX
         bQanIeUCbUXcZYnQMEfV87zxjDU3JzLvE+nYyQNBm3XJaDXJ5c+VMgul+M9Q2efKg2aL
         ObLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745089515; x=1745694315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kBk9bCoy8X/XIybnSHfXOwxQpQEH64bvj/aD/TILh4=;
        b=LtGXF6R+yxKHzXVztUuhuorziDZU3Fx7Iyn/kUiReE9QvEcn+pxJYtO0sYnQn3Irg6
         6bcEUxmSBnTGsCzRTxF19mvPz2l9z1nBuqHDDdVztZ+Kfsvj/25l/kyjKK6zR/5qPWFH
         KSmS/IOoP50Ond66rL6iTcrL08SzzcgVLOvK11ea5e9jEbyibjv/giFc56YTZC21wvTQ
         fNsgvOpVi+h/BrxVHdioydg/JTP5U8QnqJEGp+gE6XQVFeOesyKxeuMcFxOZkbrRTOyO
         74bkEOie/o/KO6aYvHwZfluO6MWsergDX0WY9iyovm3rwPZn2POV15JjnYCmwVfFpWOn
         46kA==
X-Gm-Message-State: AOJu0Yx9kangfikAvwuHxIyKQN4tGPjd46N9V9JbrP5dEQBXLp/1hWAa
	9UnnB+mKLKBA45WNA3dphIV/b6sZrsKX0rKqViRboDd1IQ+rE9qy4dN38w==
X-Gm-Gg: ASbGncvc7Ebnvub7RvjkQkgIRyA0TH+SF4gbFfwfDdyOl8IdUXQyZSKVFZU280F1Xt9
	0sVXXUj5ECzRNY8sEJJ3r3HUhWwkm9Qhf5j2eotiEqCJX76tnnk3Z0Itg81ZetpF0G0ntmW/jMn
	G+cWzQ1+ZssVk/mc6tIGwmmNACEBFFxG2eZndudldvCVciGZ/CUGRti1GxykzX89z7ZRmIn3/uX
	hdYUC4cBCxtuka1yGQTYmPWQyvU4SD/75UPfa4Uv87nCx0T27OtIAscM8UWFfRvwLWCvEqDX2ks
	fhxAidvHnEc3Jdc7/CHh8gUDsAnxLi7EIbSUkFRrKZIxhxrQxU4D5ikRTKICjsUSaktG2VVMCVV
	AGVPUe6CzowUdZw==
X-Google-Smtp-Source: AGHT+IHo6XJ5TH3p5TL/llK/ha1vxrYg2c20IYeX9MY/7y125T/Y5htSVYlGIro/IrPGJF0P4iYDWw==
X-Received: by 2002:a17:902:ecc8:b0:224:2717:7993 with SMTP id d9443c01a7336-22c5362062amr93572725ad.45.1745089514928;
        Sat, 19 Apr 2025 12:05:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb48e0sm36924315ad.155.2025.04.19.12.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 12:05:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <84258b48-03b5-4129-bed5-f8200996f2eb@roeck-us.net>
Date: Sat, 19 Apr 2025 12:05:13 -0700
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
 <1edc8396-535d-4cdf-bbb7-11d559d4c257@roeck-us.net>
 <cfc2b3c8-3f94-407a-a4d5-e7d81686eb2d@mattcorallo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <cfc2b3c8-3f94-407a-a4d5-e7d81686eb2d@mattcorallo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/19/25 10:53, Matt Corallo wrote:
> 
> 
> On 4/18/25 6:30 PM, Guenter Roeck wrote:
>> On 4/18/25 14:03, Matt Corallo wrote:
>>>
>>>
>>> On 4/17/25 9:21 PM, Guenter Roeck wrote:
>>>> On 4/17/25 11:14, Matt Corallo wrote:
>>>>> I do not, sadly (though FSP support has been rumored to help out at least marginally, though they haven't been useful for me). Interestingly the (I guess ancient now) pmbus_peek.c script has no issues reading from it (added a quick print on the -E2BIG line and it didn't get hit). pmbuss_peek.c says the following:
>>>>>
>>>>> root@rackchill-refresh:~# ./a.out -b /dev/i2c-3 -s 0x59
>>>>> PMBus slave on /dev/i2c-3, address 0x59
>>>>>
>>>>
>>>> pmbus_peek supports reading up to 255 bytes into the receive buffer.
>>>
>>> Hmm, I'm using this version, which on L622 checks for a length > 32 (and doesn't get hit in the -s command) - https://github.com/jktjkt/pmbus_peek/blob/master/pmbus_peek.c#L622
>>>
>>
>> Sorry, I am only guessing here. The code in pmbus_peek.c is a bit odd, though:
>> It does validate the first byte, but then it jumps to try_i2c: and tries again,
>> this time reading up to 255 bytes. I am not really sure if that ends up reporting
>> an error or not. The comment "NOTE:  this probably won't be visible" doesn't
>> really improve my confidence that it will report the problem.
> 
> Sure, that's why I `printf("BAD LEN\n");`'d there but didn't see it get hit.
> 
> 
>> If you are up to compiling code, it would be great if you could add some debug logs
>> into pmbus_peek.c and/or into the hid-cp2112.c driver to see what is actually
>> returned from the chip.
> 
> Sure, of course. Obviously easier to do in pmbus_peek if you have any suggested logs you want. The device caps output is (and still never hit my BAD LEN printf):
> 
> ./a.out -b /dev/i2c-3 -l -v 0x58
> PMBus slave on /dev/i2c-3, address 0x58
> 
> Inventory Data:
>    Manufacturer:        FSP-GROUP
>    Model:        FSP520-20RAB
>    Revision:        (null)
>    Built on:
>    Serial:
>    IC Device:        PIC24FJ32GA004
> 
> PMBus revisions (0x22):    part I, ver 1.1; part II, ver 1.2
> Capabilities (0x90):    PEC, SMBALERT#, 100 KHz
> 
> Supported Commands:
>    00 page                      rw u8 (bitmask)
>    01 operation                 rw u8 (bitmask)
>    02 on_off_config             rw u8 (bitmask)
>    03 clear_fault                w nodata
>    05 page_plus_read             w block
>    19 capability                r  u8 (bitmask)
>    1a query                     rw process_call

pmbus_peek uses the query command to determine if a command
is supported or not. It doesn't try to read other commands.

>    1b smbalert_mask             rw block
>    20 vout_mode                 r  u8 (bitmask)
>    30 coefficients              r  process_call
>    3b fan_command_1             rw s16 (LINEAR)
>    79 status_word               r  u16 (bitmask)
>    7a status_vout               r  u8 (bitmask)
>    7b status_iout               r  u8 (bitmask)
>    7c status_input              r  u8 (bitmask)
>    7d status_temperature        r  u8 (bitmask)
>    81 status_fans_1_2           rw u8 (bitmask)
>    86 read_ein                  r  block(6), Energy counter (DIRECT)
>    87 read_eout                 r  block(6), Energy counter (DIRECT)
>    88 read_vin                  r  s16 (LINEAR), Volts
>    89 read_iin                  r  s16 (LINEAR), Amperes
>    8b read_vout                 r  x16 (VOUT_MODE), Volts
>    8c read_iout                 r  s16 (LINEAR), Amperes
>    8d read_temperature_1        r  s16 (LINEAR), degrees Celsius
>    8e read_temperature_2        r  s16 (LINEAR), degrees Celsius
>    90 read_fan_speed_1          r  s16 (LINEAR)
>    95 read_frequency            r  s16 (LINEAR)
>    96 read_pout                 r  s16 (LINEAR), Watts
>    97 read_pin                  r  s16 (LINEAR), Watts
>    98 pmbus_revision            r  u8 (bitmask)
>    99 mfr_id                    r  block, ISO 8859/1 string
>    9a mfr_model                 r  block, ISO 8859/1 string
>    9d mfr_date                  r  block, ISO 8859/1 string
>    9e mfr_serial                r  block, ISO 8859/1 string

That also means it does not try to read mfr_revision or mfr_location
since that is not supported. The PMBus driver in the kernel does
try to read those (it doesn't use the query command to determine
if a command is supported or not).

My suspicion is that the power supply returns something (but not
valid SMBus block data) when reading those commands. If modifying
the kernel to find out is not easy, another option might be to
enable smbus tracing. Would it be possible to do that ?
Another option might be to modify the pmbus_peek command to read
those registers, or maybe even better to use i2cget to read the
data directly.

Somewhat unrelated to this, it might be time to revisit using the
QUERY command to determine what is supported. If only I had an endless
amount of time ... oh well. When I wrote the kernel driver, none of
the chips I had available at the time supported that command :-(.

Thanks,
Guenter

