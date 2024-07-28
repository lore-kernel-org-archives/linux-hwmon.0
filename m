Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C937C28F5
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 05:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722144167; cv=none; b=JJ3Eahrf5yuOgNMBT4wgNImZDX6h6pSu2Y3Eyyozvlj3cSPphyKLwC2dYkWT8WnBTJJm6bRK7QjBY63aERgL/K3PqACfTV2DU99i7OvywhYaGvCi8hJ7Mf7f/8LR9EwgVh9o0MtNa1erNbLLp2wCXmtgAWUYH1klgZW5MbC9ggo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722144167; c=relaxed/simple;
	bh=G/MCi3Jl+qmgjc+58k1mTelaeoaN1kG1lTUChShS1tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5kM8H3Wlsn4AKYS54cyywcOP3SgJHbLoL4oBU63HysRdqaOYZmXOnE6YssYIglc4xhKBOc1VikYsx3d4ryg6H7nHyo5C7Ph3RPkC/UwLrm03Tx7DMvLtPERhforJgufUDJI8wjNZZKLT598cKue7VVauVULqWjdOEuc7aOnmvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFL1k5Ep; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFL1k5Ep"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3db23a60850so955532b6e.0
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 22:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722144165; x=1722748965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=x+uaYjqWutD0vdaJ53oSlN/Tb8Eq7MFJY/yAOVMIKxI=;
        b=hFL1k5EpycAACDSLhJYy1XFYJmuFGtqIxyeE1pExTn4YRDkZJN4tc5YbrD5PXZx+Aj
         EfflV0hNh1jxg/MknxOSi0J4BfX13k5A+nCYHm6FTtv38Y2EGLODYCDcUylsxsrOhbqp
         nXK2LUm2ax3W8kR8fCv5tPjqA53mpucBEsvYONb8rUD83TOAc5RiOH9IqHdhHVklUTRL
         Hd9uy/D23pFMbc7Sqs81Vb4giGwu4hkmKtKWUTYJitU8FRxF8L9/nQz433o/6W+gLu18
         8A6fzxN8xnGNTLUv5fkHkzpT1Poa+toZAW29D6LF+H7jTi2/WatcTTqb1VRvvq1Jzq6u
         44Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722144165; x=1722748965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+uaYjqWutD0vdaJ53oSlN/Tb8Eq7MFJY/yAOVMIKxI=;
        b=qjU9Q6tsqOad2SbjBwxm3XS7rck5eEHEy9cE/hRp6qSvPUuOkc1CgTZZ0tvPJ5cBSj
         /ycPt/q9cvYJao6o6yxO8cb7eoL+s2Hc5FngFKQeWEBKTRa1uxoFDZBfPuH6Bv7RcL5b
         qOa25+sZfOmKiFd04pooxqSqxZI4NVl0NnlHjy/xzncy9cQ4gT6oiDsdlQPjXTSHp87r
         QHVeyQQNh1OrFSbj3QbeVSm3mfe8NOrl5VqB7n4wi9IJOJ1fQHMi1Cyo8KxD3cQtINxz
         wuBuTabaVvw7TWluzA4gevU/DgTFzVJRiulKx/xlLnz2Hen8wcv2liIiPJLdEbmBqrH7
         oKFA==
X-Gm-Message-State: AOJu0YxWBD6/doBFEGVLLiyJfInHBbPvejfNUgNwKt/B8wE9M+TMGpZq
	ILyoxcUflaCcTEJbmE/85JeticXkqRz1+T6SSwjRBKluBSPkTR5nODtcjg==
X-Google-Smtp-Source: AGHT+IH3eKTrnKAwmJWFzoxrngmDD3C81A7Ww3/jLRC5+LSZYzD23r4wIrwjTy2kx/GgnWdoW0pyZw==
X-Received: by 2002:a05:6808:1919:b0:3db:1d85:a1b7 with SMTP id 5614622812f47-3db23cd0438mr5584808b6e.29.1722144164811;
        Sat, 27 Jul 2024 22:22:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fdb31dsm58743075ad.287.2024.07.27.22.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jul 2024 22:22:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b421990b-3594-4a7a-af83-71c5f21891f5@roeck-us.net>
Date: Sat, 27 Jul 2024 22:22:42 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] hwmon: (max1619) Convert to use regmap
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240727143820.1358225-1-linux@roeck-us.net>
 <20240727143820.1358225-4-linux@roeck-us.net>
 <ZqXIXfsOQ-39VMsy@tzungbi-laptop>
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
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZqXIXfsOQ-39VMsy@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/24 21:26, Tzung-Bi Shih wrote:
> On Sat, Jul 27, 2024 at 07:38:17AM -0700, Guenter Roeck wrote:
>> +static int get_alarms(struct regmap *regmap)
>> +{
>> +	static u32 regs[2] = { MAX1619_REG_STATUS, MAX1619_REG_CONFIG };
>> +	u8 regdata[2];
>> +	int ret;
>> +
>> +	ret = regmap_multi_reg_read(regmap, regs, regdata, 2);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* OVERT status bit may be reversed */
>> +	if (!(regdata[1] & 0x20))
>> +		regdata[0] ^= 0x02;
>> +
>> +	return regdata[0] & 0x1e;
> 
> Why `& 0x1e`?  Original max1619_update_device() doesn't do that.
> 

Bit 7 is the busy bit, and the other three masked bits are reserved.
Maybe I should make that change in a separate patch. What do you think ?

>> -static void max1619_init_client(struct i2c_client *client)
>> -{
>> -	u8 config;
>> +/* regmap */
>>   
>> -	/*
>> -	 * Start the conversions.
>> -	 */
>> -	i2c_smbus_write_byte_data(client, MAX1619_REG_W_CONVRATE,
>> -				  5); /* 2 Hz */
>> -	config = i2c_smbus_read_byte_data(client, MAX1619_REG_R_CONFIG);
>> -	if (config & 0x40)
>> -		i2c_smbus_write_byte_data(client, MAX1619_REG_W_CONFIG,
>> -					  config & 0xBF); /* run */
> 
> Doesn't it need the initialization anymore?
> 

Odd, that got lost. Thanks for noticing!

Guenter

