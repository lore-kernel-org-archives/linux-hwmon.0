Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F303C44C50F
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 16:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785516394; cv=none; b=Qs3L25YA7hsl+q87T0v4j02YcLkxTDK3Bd2sJLMZQVoFdqm/GZQMoLSz+AcTsTDLtvc2Kk+ed0aNJLyI3qF6/0WhIGUX3gLbORkR3IGkCj2V3vkj+JivTkXl5nthnawhn1BgaPACpRbtnbk1vE+rjW5S3E5vMzLaiUmHSfyeWrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785516394; c=relaxed/simple;
	bh=buDpFU+GRsJj1Ss2NH8S/x5Gkmd8OPD78dUkFqERDL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bu8U2oAmURg78+bveHvEVNN7LzH/MnnPzjfZ1R0qr8QeNPvSWgpHwezMnohW7mKCPOuujXEx+nWVwwNoUusqJrQEkOlbAWJhiK3V/aLTYcMWzTrDJeTM0FMLS/1bVwqrE3Uay7/3gMrndaS7xDM7m1VbrEW1L2py1OqWqj7uXcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRKAxDLw; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRKAxDLw"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb9b427da2so1576527a34.0
        for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 09:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785516392; x=1786121192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKl76hhPWbrBZzJWAtDQCvA60aTLZqaBfqh0JSfu/Gs=;
        b=aRKAxDLwKaXLTHTr+xMfBBeoV+91VFN5uyFoqCVOzJF89Ezy90b685e5jfEPH5HnyC
         B27wTT1aJyeZbarbiu19TsvtzxcUxdQDMHPUbZD9UWNbAw+A+6NCyVubu3k+tLPyQby8
         o3OsnTX3cIRto4dq1et4FyfexsTNJ0e/SSIdwWZreYPawDja9YT9XMFXRP0vZTxbHkDo
         T69GiYiZZiGE9SB5reKSTLGrMtLTaXb457b/j+nU+Wb1w+Hhe6NixW90q67IyQqWszMu
         IgsQaswiqAtZgLaCKNsKSwm1qA0J+0dg1u/2qlPnEqKkKcaCVQZIm8ix7tQh+nlcejEl
         DUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785516392; x=1786121192;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CKl76hhPWbrBZzJWAtDQCvA60aTLZqaBfqh0JSfu/Gs=;
        b=OzMKiRtOzXdiSsyVAHHcAI1JvTahASGoOwqkA/9jsJIJQB59u06VEAeu5fhqtaQ1Ky
         tlb4cB7AYGDeligRdguWOGiFzJU0qQKV7pgV4HUZr9WMO9tg5DqTzlFAiGHOYsmB3Get
         Ov+sVZtVh2ViR7n/GKy5bn7ZFhOwwxzG4jgmGApnTLxuByUChCxXAD1jYtE0ppUbhlAg
         3ILRrs5GNo2oyxFIZSl8ECR22BzYj5P08UzC1cMki8U+hLQpiz6re7+ZnuWMnO8JHQ5i
         XtinhBz/Fokn+6RO9xrx+WrF0HCofHYIPH9rlJLUTGkRPmYji0kPDt3FsqNYNzlunrq5
         bjxw==
X-Forwarded-Encrypted: i=1; AHgh+RoH2n4oNNqXqo/hjRBi1FePS/AKRsVIkYzcRVILVuHkVb3gRlI20kiNUuqC+sG4gMPTci7y27mXrRYGhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHeD9Px/fzg6I3wr+k1vb/2p/AZdS5tQpWKnoCtgigay3CI/Cf
	w+/txsx8nrrB9OKtX67iRN+lQjkKlSi06sApTnE2Ej4E0pXLHQl3cLVkqyDU+w==
X-Gm-Gg: AR+sD10n1NfvG7BL8y2PNeqMs/M4QVWchE6noVSgRJi37A0sV1RaahZ6rdo1GuscYPo
	oZ3JGYgherRecX9weN298DoKNKV8dI7yZQ3WiyS9mmC2dC0icO9Lhf6mIpFveCD5MZRZH1pwzSp
	5oGA2FTtooxtUKYvhAWxcduNPRp5ubGwP0hRFUdqvIQAgNAeTlCw8de7pvwsLm7vdQRjsJedrcx
	EaJpNWFrmJW+HEMtSZry0vnP3BnoiPqUyvTEjxwcCyJqTpHSno3dm5jBXLcxbCeAu2t5RHw7HbP
	ovAuq1FW75uE0Qr3nEQiol8Cu51D+gkFp57/IfviShiY0+u+/PgjTMngUMlU2dhS/w49jDsrXYw
	9TuPntWMJTFxwcc/9EkZvWb0dboSsganRPJSKkFBM5K3+GNCurP9CXnN3kg8OkZcKV5TQkju6Si
	w0JtvPkLAr+JhqkTS3NIOGi4i6Ys3GuPa3iJmYfSSPPs/ofbgiCkQcBtVil8MFCsHeyShQRIGAb
	3xWozPEFDBedzkWiUc3yA6rOtyeecHDewWrHtGdQ1OyB2V5
X-Received: by 2002:a05:6820:818e:b0:6aa:e3dc:25cd with SMTP id 006d021491bc7-6ae4493c058mr907765eaf.0.1785516391848;
        Fri, 31 Jul 2026 09:46:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae39db1c5bsm1256542eaf.5.2026.07.31.09.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:46:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b48636b8-33d1-425f-93a7-d0b9c4dd86ca@roeck-us.net>
Date: Fri, 31 Jul 2026 09:46:29 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <amzB2aw_4y6ji9zs@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/31/26 08:42, Nuno Sá wrote:
> On Thu, Jul 30, 2026 at 08:54:25AM -0700, Guenter Roeck wrote:
>> On 7/30/26 08:19, Nuno Sá wrote:
>>> On Thu, Jul 30, 2026 at 07:47:37AM -0700, Guenter Roeck wrote:
>>>> On 7/30/26 07:27, Nuno Sá wrote:
>>>>> On Tue, Jul 28, 2026 at 02:05:53PM -0700, Guenter Roeck wrote:
>>>>>> On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
>>>>>>> From: Nuno Sá <nuno.sa@analog.com>
>>>>>>>
>>>>>>> This is in preparation for adding support to a device which needs to
>>>>>>> use it's own read_block implementation.
>>>>>>>
>>>>>>
>>>>>> The chip-specific implementation calls i2c_smbus_read_i2c_block_data().
>>>>>> I'll need to know if this is a chip limit or a controller limit.
>>>>>> If it is a controller limit, a chip specific override would be
>>>>>> inappropriate.
>>>>>
>>>>> I'll reply from top of my head (did not looked at the driver again).
>>>>> IIRC, the biggest reason we need the chip-specific implementation is because of
>>>>> the RAIL selection logic (mainly when not in page mode).
>>>>>
>>>>
>>>> Yes, I have seen that. Question is why you use i2c_smbus_read_i2c_block_data()
>>>> instead of i2c_smbus_read_block_data(). The rail selection logic would not
>>>> require that.
>>>
>>> IIRC the reason was because the i2c controller on the raspberry pie does not
>>> support i2c_smbus_read_block_data(). So I guess this:
>>>
>>> https://elixir.bootlin.com/linux/v7.1.4/source/drivers/i2c/i2c-core-smbus.c#L220
>>>
>>
>> Hmm, I think we really need a common solution for that problem. Not all
>> controllers support i2c_smbus_read_i2c_block_data(), so you are just moving
>> the problem from one controller to another.
> 
> Yikes. I actually though i2c_smbus_read_i2c_block_data(9 was more widely
> supported (if not always). Not sure if you have something in mind but
> one straight way would be to choose different implementations (for
> read_block) depending on i2c_check_functionality()
> 

Handling it in pmbus_read_block_data() would be straightforward. Actually, I
wonder why it isn't handled as fallback in i2c_smbus_read_block_data(),
but I assume there must be a reason.

Either case, I don't understand how the existing calls to i2c_smbus_read_i2c_block_data()
work. For example, in drivers/hwmon/pmbus/max20830.c, the assumption is that the
first returned data byte would be the length field. However, that is already done
in i2c_smbus_read_i2c_block_data():

/* Returns the number of read bytes */
s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client, u8 command,
                                   u8 length, u8 *values)
{
         union i2c_smbus_data data;
         int status;

         if (length > I2C_SMBUS_BLOCK_MAX)
                 length = I2C_SMBUS_BLOCK_MAX;
         data.block[0] = length;
         status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
                                 I2C_SMBUS_READ, command,
                                 I2C_SMBUS_I2C_BLOCK_DATA, &data);
         if (status < 0)
                 return status;

         memcpy(values, &data.block[1], data.block[0]);
         return data.block[0];
}

Does the command return the length twice ?

Thanks,
Guenter

>>
>> One key example is the PIIX4 driver. Your new driver does not support the
>> majority of PC style systems with AMD CPUs.
>>
> 
> I see!
> 
> - Nuno Sá
> 

