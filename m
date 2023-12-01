Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRZSYMiB"
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04172CF;
	Fri,  1 Dec 2023 08:36:12 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d05e4a94c3so4651585ad.1;
        Fri, 01 Dec 2023 08:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701448571; x=1702053371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Xwr1MgtrJpApwYL7b0E1/Ufr7UsEtcFTk0rkOsQWyZA=;
        b=nRZSYMiB9w9rVUu7+q66JCP5HM+6t4BQHqmVwEkcQ7nmm33zJM+u0Mpn2vWMQVN1BL
         DoNAFOxaBiPa1xeUpz9u/kWLBNLkJFv5S8DBGDgJy1hTiTcnqJ4wQkX0E9W6Jm+Z8j0g
         7AMc2tpj1lBeEiQVZVjmImNrdWrLXf3rWVerwsacTG/TReg2jjr2ClrGUPfqoOVbhzXP
         bd/0TAw5l3dLsnhlSigOC/YxGcuwo3W++p8b0nGYdDTt9WQLFphCMt+z9x6t+Fj36sXs
         f/2NYlYFguSGDyy6k9GHlei535y7HNfqHBe4jJOtni+fRC9kZcbz2P9ttw+DZOfdjWOx
         o0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701448571; x=1702053371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xwr1MgtrJpApwYL7b0E1/Ufr7UsEtcFTk0rkOsQWyZA=;
        b=MzR9R7D+w9mG5bj21RCto5x722KRxJGvma99CwxSuzitpGvKHZ14whzlhHmrIT9mOy
         pr8PL0+E9f0yiVEm1yHvXP8yOIGMTI5VsoTKxAU9iIJBx4YkPgWH2vi+1U0GmqiZrYnE
         QTo3/etpPWqHHbLMEvwhJYKeDDXIpggAUA6tkMcSjMrTIwXWmZNRmIpk4fEENfuKhQZV
         oA+9tPnhW4PINBx566jgK8Kwr6ttG11+Dx3MqFZ3A2xg1JvTRupX9n7lO+DDVO6RiDqD
         x3FavMkwkHgheZ7H9oyFmrg8jMwlOlXiGzgnMGFPf3tB0yESwUvvNgHObIupCnQsp+2y
         zrJg==
X-Gm-Message-State: AOJu0YzFz364irQ43AsPeDe6yqrvuFymWxK+YO9rj1Z5DFtrFeBjniwz
	c++GukPhTDq4XLNYHPPOLU4=
X-Google-Smtp-Source: AGHT+IEHq56ixIzfeu7Q2B+2S7nDo/Q25TA1WQLmWnOOOpIq1kjBf2znviu8pcl3BDmgpqdGoPuwyQ==
X-Received: by 2002:a17:902:cec4:b0:1d0:265:6a2c with SMTP id d4-20020a170902cec400b001d002656a2cmr12474114plg.11.1701448571423;
        Fri, 01 Dec 2023 08:36:11 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e23-20020a63d957000000b005b7dd356f75sm3303315pgj.32.2023.12.01.08.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 08:36:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8717e2d2-1138-40af-b580-c54662069dfc@roeck-us.net>
Date: Fri, 1 Dec 2023 08:36:09 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Content-Language: en-US
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
 <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
 <ZWiP3i80KnVk9qyx@smile.fi.intel.com>
 <a4bd59df0c5bc1be5d0d6f11b968fd61a59ee2e0.camel@gmail.com>
 <CACRpkdYz+qi42Pz8CgeWybksC0edaVux6rcEhwzjDWnWe9Jr1g@mail.gmail.com>
 <61a8f54835c10db7a9c650ee2e3706b47382c634.camel@gmail.com>
 <CACRpkda55HzPqus5KR-t=xEBkkdND5kYZj1sHdxK+j6QwDUPRg@mail.gmail.com>
 <b761d2497462664d541779857398b2aa893cbee5.camel@gmail.com>
 <ZWoABzufPkdXnrMT@smile.fi.intel.com>
 <7dc3f137-6073-4262-afb5-439d024bbbd2@roeck-us.net>
 <ZWoIrVAaE04Zs6Xy@smile.fi.intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZWoIrVAaE04Zs6Xy@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/1/23 08:24, Andy Shevchenko wrote:
> On Fri, Dec 01, 2023 at 08:04:12AM -0800, Guenter Roeck wrote:
>> On 12/1/23 07:47, Andy Shevchenko wrote:
>>> On Fri, Dec 01, 2023 at 04:24:35PM +0100, Nuno Sá wrote:
>>>> On Fri, 2023-12-01 at 14:40 +0100, Linus Walleij wrote:
> 
> ...
> 
>>>> Yes, that is the only thing we have. Meaning that there is no hw setting to set the
>>>> pins to open drain. Open drain is what they are. That is why I'm not seeing the point
>>>> in having PIN_CONFIG_DRIVE_OPEN_DRAIN implemented.
>>>
>>> At least you have to implement error for PUSH_PULL mode and other modes,
>>> so from the (core) software point of view the user should be able to ask for
>>> anything and get an answer from the certain driver that "hey, i do support OD",
>>> or "hey, push-pull can't be supported with this hw".
>>>
>>
>> It seems to me that this is heading towards a mfd driver. I don't feel comfortable
>> with all that gpio specific code in the hwmon subsystem.
>>
>> Maybe I should request that all hwmon chips with gpio support must be implemented
>> as mfd drivers. I'll have to think about that.
> 
> Or auxiliary bus?
> 

I don't know. All I can see it that it is getting way too complicated for a hwmon
driver with embedded gpio support.

Guenter

