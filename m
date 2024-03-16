Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0F318E1E
	for <linux-hwmon@vger.kernel.org>; Sat, 16 Mar 2024 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710602394; cv=none; b=BRQXmuwvyrDZF3YwaJ4V2o+CWXwzel5Npf3c2wibe7DebS/vHW3Y45F3euF2F2dbQojABkIixS+77AXZpnpenUoQcJhmaztOYD0W6kbwg+7fYbeHkDXOkrcvKnYKSHFm8Gq6GnQ7Nlh+IVCKyX9vPQS/gvd2/UpebErzJ24Bk34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710602394; c=relaxed/simple;
	bh=+vMqjJzzDyT26IAva+aqksoCWPDPVw9x4bZOl6c6S18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OLuzil7BUE58XU+fC2JMeLtWWmk4c+atAqgTpMhMIt/UtwGLgoSLA5GMrGN+Mf1NIkscoWqk4Ea20v6RmV5eOJxXCTvVrzYRtoajA25bcxwr3ERXERUJ5l71YByEJAZKQUAvI3O919IZt3IL8VvXaCFjzIJgpjdJv/kXmBJedc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAvBwlZk; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAvBwlZk"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5dc949f998fso2332534a12.3
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Mar 2024 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710602392; x=1711207192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BSC/e3A1eTkjNdbCV19CXxB36ERRiKVvo+Q0jqhUORI=;
        b=bAvBwlZkkiJYG+6VpsHvvbNyS1abn5syFDBJkn6VNxJDlB31IN+AeEPmAdbRd7/4Nn
         FiT1I1yP/xfh+jjNmBTgf6RTs7YIG38uSl5G7w53gla9kyR8H6SFNAUQ2nSFlo/s6hM8
         WOl8OUW1Mj8Oxh7nq8ksMEJmFSMeQpq+Mja7TCxaqQkkc8tlh1IUHC1AkQ2RWSAiT+b7
         bn5LFBJ7vM7Q3AzKXt8cFpWLSajYp24GfV0JkYx5Fp2RJof1ZjZAm8NRYzhBH/QJxvvX
         DE51U/4PL4pdbqW+STJmzFAkJXoyvVrx7faKtAeXEcyn0v2poOPetVIblWKs7Vb1Qs49
         oI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710602392; x=1711207192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSC/e3A1eTkjNdbCV19CXxB36ERRiKVvo+Q0jqhUORI=;
        b=qRZoKOp8HLm6k+Jpj4a+yw6qZsE1a8XAKjtBWWrwgLy7YI7su8wV1SvlbcT9MxpSk9
         hiIkHaoVbUe2NI+IrEO1cGxHB3OmeQBNBvRBJCeNfDcomALKlQPeaZJrqOjT0ILGpkgq
         +aJPDjgWLapT8dkUyI/T50Cp3PqRmIjOlhINDPqzczFLm6S8Kt86D7QzTs1Th+oODwSQ
         o1zkd/hACiX7TiAogCr6yPkQ5ZAQVQiT81kS1vdSGoU7f3JdFYeb66yxmRHvcTNdDjng
         ogHxdEISnQc1Dg03BzMWUKK68RWz8Jup9QiN9GpcxbIFH8avlH4FobIzdhIX7ffdgV+l
         VAHw==
X-Forwarded-Encrypted: i=1; AJvYcCXVrINIkr1zBRVy5/c1TeFsRuBgxIhG3dRojsh4wXQJ0w6po22R7JB2bMY/jGYBZAzmdfPJ/0wgmEJlCzJhxvMtYOr4fDlaSz8nu6Q=
X-Gm-Message-State: AOJu0YwGvLFL5cNxRQ3wnRHiuLwFRUOpCWw4nnm0L/BhfRYPRpcUdRzl
	62Xbic1OeOdCzjKyXSRwGNGUxhQybgb7PzJmdxlfU2iWAgWeln7m
X-Google-Smtp-Source: AGHT+IFE4LgLcQrALLx3mE2lYCKs5V0T31IGHKG40gkiTVfvVmoaQbt8EYyHHFJldBpHvlRbVab/Pw==
X-Received: by 2002:a05:6a20:94c7:b0:1a3:5763:932 with SMTP id ht7-20020a056a2094c700b001a357630932mr1039936pzb.57.1710602392015;
        Sat, 16 Mar 2024 08:19:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id fb12-20020a056a002d8c00b006e4f644dafbsm5049125pfb.129.2024.03.16.08.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Mar 2024 08:19:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <41213d44-a72a-40e3-a858-4a66a3107139@roeck-us.net>
Date: Sat, 16 Mar 2024 08:19:49 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] hwmon: (pmbus_core) Relative encoding of vout related
 commands
Content-Language: en-US
To: Lars Petter Mostad <larspm@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 Lars Petter Mostad <lars.petter.mostad@appear.net>
References: <20240315151855.377627-1-lars.petter.mostad@appear.net>
 <7fe93aaa-b0ac-4952-a5ef-f42b6053b42e@roeck-us.net>
 <CAC-Dm24yn_aeTVjRofst+NGtdzhDDhtouJSxY_bw3yCwZPb1Jg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAC-Dm24yn_aeTVjRofst+NGtdzhDDhtouJSxY_bw3yCwZPb1Jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/16/24 06:33, Lars Petter Mostad wrote:
> On Fri, Mar 15, 2024 at 7:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 3/15/24 08:18, Lars Petter Mostad wrote:
>>> PMBus 1.3 allows for relative encoding of voltages in certain output
>>> voltage related commands. I'm starting this thread to ask if adding support
>>> for this, either by me or someone else, is of interest. I have made an
>>> initial attempt to add support that is adequate for my needs. I have
>>> included the patch for discussion. I don't expect it to be accepted as is.
>>>
>>> I'm working on the software for an ARM64 based board that uses the
>>> TDK FS1412, which uses relative encoding. This is the only chip that uses
>>> this feature that I have access to. I only have access to this chip on this
>>> board, so I'm only able to test it on this architecture. I have to use the
>>> kernel sources from NXPs LLDP project, which ATTOW is based on kernel
>>> 6.1.55. I'm not able to test on a newer kernel at the moment. The board is
>>> fairly expensive, so I don't dare test setting voltages. I have only tested
>>> monitoring voltages.
>>>
>>> In relative mode, certain output voltage related commands (e.g.
>>> VOUT_MARGIN_HIGH) are encoded relative to the nominal value (VOUT_COMMAND).
>>> If e.g. the high margin is to be 10% above the nominal value,
>>> VOUT_MARGIN_HIGH is set to 1.1. This factor is encoded the same way as
>>> VOUT_COMMAND (i.e. as indicated by VOUT_MODE).
>>>
>>> I have been a little unsure about how to best organize the changes.
>>> Decoding the relative values requires access to the current value of
>>> VOUT_COMMAND. I decided to handle it the same way exponent is handled.
>>> I placed the relevant information next to exponent in pmbus_data.
>>> vout_mode_relative is true if relative encoding is used, vout_command
>>> stores what is believed to be the current VOUT_COMMAND. As exponent,
>>> vout_mode_relative is set during decoding of VOUT_MODE in
>>> pmbus_identify_common.
>>>
>>> I decided to assume that VOUT_COMMAND is not changed outside the driver,
>>> as this is also done for VOUT_MODE. VOUT_COMMAND is read and saved during
>>> pmbus_init_common. It is also saved to vout_command during
>>> pmbus_regulator_set_voltage.
>>>
>>> pmbus_regulator_set_voltage usually clamps the requested voltage to be
>>> between VOUT_MARGIN_LOW and VOUT_MARGIN_HIGH. This does not make sense in
>>> relative mode, as the margins move with the requested voltage. This part is
>>> skipped in relative mode.
>>>
>>> pmbus_reg2data does the actual relative decoding. The pmbus_reg2data_*
>>> functions return the register value multiplied by 1000, which in relative
>>> mode means the permilleage of the nominal value. If we are in relative mode,
>>> and the current register is one of the registers that can use relative
>>> decoding, the permilleage value is multiplied with the stored vout_command.
>>> Currently, the vout_command in pmbus_data is stored decoded, i.e. 1000x and
>>> rounded to an integer. Better precision could be achieved if the
>>> multiplication was done inside each pmbus_reg2data_*, before the rounding
>>> to integer, but this would be a bit messier.
>>>
>>> I welcome comments on wether this is of interest, and what is needed to
>>> get it into an acceptable state!
>>>
>>
>> My major concern is unintended side effects. In drivers/hwmon/pmbus/tps546d24.c
>> we "solve" the problem by explicitly setting absolute mode. Would that help
>> for the time being ?
>>
>> I'd prefer to get some experience with actual chips (meaning evaluation boards)
>> before trying to provide a supposedly generic solution which retains relative mode.
>> I ordered a couple of evaluation boards for TPS546D24 variants. The evaluation
>> board for FS1412 is a bit too expensive for my liking, so I don't really want
>> to order that one. Do you know of any other chips supporting this functionality ?
>>
>> Thanks,
>> Guenter
>>
> 
> I did try the solution used for the TI chip by using i2cset to write VOUT_MODE
> before binding the driver, but the command only returns "Error: Write failed"
> for this address. I guess this chip is relative mode only.
> 

Yes. I looked into the datasheet. It says the VOUT_MODE command is read-only
and that it only supports relative mode.

NCP3286 is another chip which, as it looks like, only supports relative mode.
Unfortunately there is no evaluation board available for that chip, but
it does mean that we'll have to add support for it.

I'll bite the bullet and buy the FS1412 evaluation board. I really don't want
to apply a change like this without testing myself with multiple chips.
This is one of the PMBus functionalities where it is likely that chip vendors
get something wrong, and playing with VOUT can be critical.

The PMBus standard suggests that relative mode should apply to the entire chip,
not just to a single page. This will be one thing to confirm. Of course that will
be difficult to confirm with only two chips to test, especially since tps546d24 is
single-page and fs1412 is always in relative mode.

If anyone reading this knows of another chip supporting VOUT relative mode,
please let me know.

Thanks,
Guenter

