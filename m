Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA065282F13
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771931; cv=none; b=F2Ui2kusqjclv5uGeO4VpUnPH/afJg2iMylBIigx+/uuXBf1gDH/OHB5R2nP/RhthkiaDS2eYokGAL63PvwpNpfSNXzYoMPpr/o9hSGYtIaoyQvEyIY5IHFXqLkK+elRyc3d2fZeZHUxjpiBYr4D+FHFrywZZOYdK+JXtMkUJUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771931; c=relaxed/simple;
	bh=Ipp+MCCK7YinvsJCbSUzcQmor6cQB0RZUCzm1lx++k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4W8QfKpN7XtKuy/xCms2ZUm80B3/mCiaBRolm116h4adKtSNA12SKCgkOhOdUg9yGVs/ptIvWUfQAIfCG2E7QOGCGeU19QymXeEtaMzZ4x0FmjhAsQnq+pvupOU8vQ1sM1tLad568X028lN4XWDIhkhBKDcVmQnv27hHHm/DZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTdCcpTC; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTdCcpTC"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e347638adso4131369a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785771929; x=1786376729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVgpd4PZNZ+So7ScyxntuWilkocD0aj6xFhiwfkcPA4=;
        b=cTdCcpTCHiKVbT1L7PGNswUoqe5BuabRuIR49PkjWrB9DtahNErRcNrmb173pihPaK
         gR/SUpRPtUbOCDA6Dn94Q7u0IRqupU7Kg1bPPnhPlc1/OswA2wfdjJ0Zdk8eP1ifGnq9
         fLtXytrKfWnpSELJ8cJLX3pqyPxv2yygoo44PdvI3GUBpAd2q921P21dwYLRaZsmgQRZ
         G+za9mGC6sr8pe9LlZ7bGHn/CrngpY7oc9bJK/t0YoM0EG7gZwdXsJ60yUFHvuNsHGVD
         7MCVjZiu4n7B7pk/PxY/PJkQYzXh50tSSi/bN8KvXgB4spFuRkB9hu9oPNVf3R3gLweh
         hfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785771929; x=1786376729;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XVgpd4PZNZ+So7ScyxntuWilkocD0aj6xFhiwfkcPA4=;
        b=fK6d8l45ajwkSeyhaZezoCgXAzUPBFWjKTzCwIIU8cWbZEHh/7PF+qgeVQqmjJ8xRv
         cBj5DOaisHO3v0iHkaLawVCCdbubJmvVqT8l44v4Y6uVzEHt93GKWn2NKi5J8UGjK5I0
         wHDgklDUOPo72dIafytlAyDiOv9WzeORBExpsbUtZ5B8fblp6apMdpJT+75bWkGrgEJn
         mGKdpXxbBCF2QzP2kjvuIQ5qUpgYpuWJV1xJrWGUCRyGyGQVxRN5Pa7TtSFo6FdfSo/y
         zSwJJZR+9CSdVIjv5OGJ00ypX5C6QAy4EWcTFldtfWmQ9LPH/cP9+xLsf5ZiA2sTl2Zb
         3R0w==
X-Forwarded-Encrypted: i=1; AHgh+RrrgaosR8iKvXIWQ1kqH0fMylEmLyA2NGPwbqpiYeAdj1bYQDb7PK5rajbCv10QSwDJVy9xPVwUSzPMTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4DKsxHkgxFYVMv3ZThqj+ojEbQn09xtsF74A7Vx3kDP+rsWaf
	2f5sQN2FI3XqidCV4ol1y3TaAiMV1lpVoJRiKeUWtDsmg9rvKOEaIIs3
X-Gm-Gg: AR+sD12PR64V0tZjgyLrQp3zEMfIbYOYxOJJG9QKR58Gpq+VVkkbIY0SxItEw/shdRR
	uc+Zq9tQJtTRVWHBoLTxIX1DGEutzoWWO7fiVXJ7sahtpKPcX2WrsOjoaiz1hsySh91lPBFTsKi
	Qy6axJuHOX4L/bej5bcWBnHVkXQFflmV8r/WBrTZZp4y25GWweVSwRzIn1ZnCu9LAlli6k+Wk0g
	6gCookEmlOqwwjS4dQdbuuRttP+uDH2Fkml8NOYUp7HCkGM1IKnCqTxAuxxLLo0+s+pN1BtgiMD
	FUAnJU9F/6giHVbbhY6eNwJj/wxoZQ1wRzf0i+04qo7gmR7r1KIr3QQ1+jDPhd6c9NWpcRgjBnp
	QozuSyUceJKCzKfPBZovBNPp8T7fdWo+iT9qNFdyw3ZHFGMB7UrIqQ9BlXyZU/Rjb/d/Lb3MEf1
	1Gd+LR01C36yLLwhqg1eNffhuxhIoIuDTJE7dmAzUz4IbYdMz+HnhRxBX+QK2YU7qnD8SO+kjhk
	5iRINNVfJtaXTon9moB2jJxak/QPlbmVAnSEsR0t9KPeR+8JA==
X-Received: by 2002:a17:90b:4c0e:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38fbc5d2f96mr9370451a91.41.1785771928753;
        Mon, 03 Aug 2026 08:45:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febfd8ff8sm19327a91.4.2026.08.03.08.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 08:45:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b8eaf1f3-2155-419e-b396-a094e548e7ec@roeck-us.net>
Date: Mon, 3 Aug 2026 08:45:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Alan Tull <atull@opensource.altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
 <c3e143ed-af08-4a0f-a630-96a255df838d@roeck-us.net> <amtewh9lOgWz0-Nh@nsa>
 <e37df572-1ca9-4c56-a16e-faa44f1ff1cd@roeck-us.net> <amtqPQSM6zsiCh4B@nsa>
 <6287e749-04f5-4a03-a91c-fcc705df269c@roeck-us.net> <amzB2aw_4y6ji9zs@nsa>
 <b48636b8-33d1-425f-93a7-d0b9c4dd86ca@roeck-us.net> <anCsIHUkaL7ckyiL@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <anCsIHUkaL7ckyiL@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/3/26 08:03, Nuno Sá wrote:
> On Fri, Jul 31, 2026 at 09:46:29AM -0700, Guenter Roeck wrote:
>> On 7/31/26 08:42, Nuno Sá wrote:
>>> On Thu, Jul 30, 2026 at 08:54:25AM -0700, Guenter Roeck wrote:
>>>> On 7/30/26 08:19, Nuno Sá wrote:
>>>>> On Thu, Jul 30, 2026 at 07:47:37AM -0700, Guenter Roeck wrote:
>>>>>> On 7/30/26 07:27, Nuno Sá wrote:
>>>>>>> On Tue, Jul 28, 2026 at 02:05:53PM -0700, Guenter Roeck wrote:
>>>>>>>> On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
>>>>>>>>> From: Nuno Sá <nuno.sa@analog.com>
>>>>>>>>>
>>>>>>>>> This is in preparation for adding support to a device which needs to
>>>>>>>>> use it's own read_block implementation.
>>>>>>>>>
>>>>>>>>
>>>>>>>> The chip-specific implementation calls i2c_smbus_read_i2c_block_data().
>>>>>>>> I'll need to know if this is a chip limit or a controller limit.
>>>>>>>> If it is a controller limit, a chip specific override would be
>>>>>>>> inappropriate.
>>>>>>>
>>>>>>> I'll reply from top of my head (did not looked at the driver again).
>>>>>>> IIRC, the biggest reason we need the chip-specific implementation is because of
>>>>>>> the RAIL selection logic (mainly when not in page mode).
>>>>>>>
>>>>>>
>>>>>> Yes, I have seen that. Question is why you use i2c_smbus_read_i2c_block_data()
>>>>>> instead of i2c_smbus_read_block_data(). The rail selection logic would not
>>>>>> require that.
>>>>>
>>>>> IIRC the reason was because the i2c controller on the raspberry pie does not
>>>>> support i2c_smbus_read_block_data(). So I guess this:
>>>>>
>>>>> https://elixir.bootlin.com/linux/v7.1.4/source/drivers/i2c/i2c-core-smbus.c#L220
>>>>>
>>>>
>>>> Hmm, I think we really need a common solution for that problem. Not all
>>>> controllers support i2c_smbus_read_i2c_block_data(), so you are just moving
>>>> the problem from one controller to another.
>>>
>>> Yikes. I actually though i2c_smbus_read_i2c_block_data(9 was more widely
>>> supported (if not always). Not sure if you have something in mind but
>>> one straight way would be to choose different implementations (for
>>> read_block) depending on i2c_check_functionality()
>>>
>>
>> Handling it in pmbus_read_block_data() would be straightforward. Actually, I
>> wonder why it isn't handled as fallback in i2c_smbus_read_block_data(),
>> but I assume there must be a reason.
>>
>> Either case, I don't understand how the existing calls to i2c_smbus_read_i2c_block_data()
>> work. For example, in drivers/hwmon/pmbus/max20830.c, the assumption is that the
>> first returned data byte would be the length field. However, that is already done
>> in i2c_smbus_read_i2c_block_data():
>>
>> /* Returns the number of read bytes */
>> s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client, u8 command,
>>                                    u8 length, u8 *values)
>> {
>>          union i2c_smbus_data data;
>>          int status;
>>
>>          if (length > I2C_SMBUS_BLOCK_MAX)
>>                  length = I2C_SMBUS_BLOCK_MAX;
>>          data.block[0] = length;
>>          status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
>>                                  I2C_SMBUS_READ, command,
>>                                  I2C_SMBUS_I2C_BLOCK_DATA, &data);
>>          if (status < 0)
>>                  return status;
>>
>>          memcpy(values, &data.block[1], data.block[0]);
>>          return data.block[0];
>> }
>>
>> Does the command return the length twice ?
> 
> I think the device is actually the one sending the block size again. I
> went looking at very old emails and found this chain:
> 
> Me:
> 
> "Thanks for the inputs... As I said, I think know what’s my issue. I’m fairly sure the first
> byte I’m reading is the block size. I’ll take this into account and re-test."
> 
> Reply:
> 
> "On one hand, that does make sense. The first byte in a block read transaction should indeed
> be the block size. That said, 0xB1 is 6 bytes long when not including this first byte. So we
> are still missing a byte with actual information. Could you perhaps please share the full
> packet data that you are capturing?"
> 
> The above was me struggling with per phase reads.
> 
> But maybe the above changed with newer FW versions for the chips. I'll
> ask around.
> 

No, I found that other chips do the same.

I am working on a generic function pmbus_read_smbus_i2c_block_data() which calls
i2c_smbus_read_block_data() if supported and otherwise (if supoported) calls
i2c_smbus_read_i2c_block_data(). It should be ready within a day or so.

Thanks,
Guenter

