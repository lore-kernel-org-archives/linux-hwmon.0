Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hox28uLk"
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4AFC1A4;
	Thu, 30 Nov 2023 08:28:47 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6d7f3a4bbc6so641388a34.2;
        Thu, 30 Nov 2023 08:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701361727; x=1701966527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6Feztg+g52v23IIIFsl2xN0DuqcuOIyGInnTOm6/5Og=;
        b=hox28uLkwRfGDwuMsVIE/TKEctobEdanI794cF4u17k8PExKPuSsUJsDrEzJQcq43M
         pq1LRjp7OltckNSk6qJo9Idptmo5TPaWBUC6pyOCWcscGgUYYxQotZR2/xo0fRK58jGn
         tMCXJioUDeiSTNcsMMpKVFaXyGKj63MK2OHzBmG93O0Ta/40xhMZ71zbMGj6CMos0Vm1
         rHvfc6YtKdx5NPDxM/3DFMjgFQHgmg5BjwrzJfY083s+KoMVdnax/W+WmrqDn9bfHqvE
         +GvDA53wG7kDs4bu+FU6XxAcI8jwt9sbRclN9oWSEo7lDCHN1d+dKOd3OeQhnH6jkdFi
         AUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701361727; x=1701966527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Feztg+g52v23IIIFsl2xN0DuqcuOIyGInnTOm6/5Og=;
        b=LWERzszp9OqfhxCanfGoAfCRuGNj+XDJjQlf1/UwEs2ETiX27HU3GEdzEMjVFvveOg
         LBU+KUYwC9qmgpewMYOOVUQeZYaSNRRi+Y6B/hLIAkybPY28sDeN7yMmW355QHwIHB/K
         nMjern+A5kI1t8o66Rd6eit4YqCEGbLjEo+mPlWcygVZdY0nSisI/7sWygsKQLd+BGFE
         JdqkWJP1mBH99Mkk/YZzYihxXxlEfdVCo3zAbnvz68Pnji9wGSoL6cmHpw07p7/6hzOI
         0iEg0l0FrzZ46+DuIR8541qEXtm4D9eP+mrvLuQP4FenxiWO3WuE3Ct5OS9IJmWh4Hhq
         /9pw==
X-Gm-Message-State: AOJu0YwNmeQWeDNKazenXlWf7oJcYgbIdIaoq0MxyvaYU+3/4GrVudey
	YTPOWEs4X76J7ByUeapPjOM=
X-Google-Smtp-Source: AGHT+IGlNCZDBSy454SHtxZztiYGZAhudb6T9mic8i0jrgHLvGbgX9Q8yJqQela2dLdhcw0o+yvZFw==
X-Received: by 2002:a05:6870:46a7:b0:1fa:1355:da45 with SMTP id a39-20020a05687046a700b001fa1355da45mr26573033oap.11.1701361727131;
        Thu, 30 Nov 2023 08:28:47 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id os21-20020a0568707d1500b001fa619a3fd9sm326404oab.52.2023.11.30.08.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 08:28:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <27eee509-5f0b-4777-abf5-a86378760d2a@roeck-us.net>
Date: Thu, 30 Nov 2023 08:28:44 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Content-Language: en-US
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
 <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
 <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
 <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
 <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
 <ZWiP3i80KnVk9qyx@smile.fi.intel.com>
 <a4bd59df0c5bc1be5d0d6f11b968fd61a59ee2e0.camel@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <a4bd59df0c5bc1be5d0d6f11b968fd61a59ee2e0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/30/23 07:20, Nuno Sá wrote:
> On Thu, 2023-11-30 at 15:36 +0200, Andy Shevchenko wrote:
>> On Thu, Nov 30, 2023 at 11:20:32AM +0100, Nuno Sá wrote:
>>> On Wed, 2023-11-29 at 21:55 +0100, Linus Walleij wrote:
>>>> On Wed, Nov 29, 2023 at 5:08 PM Nuno Sá <noname.nuno@gmail.com> wrote:
>>>>
>>>>> Cool, I actually thought that having the direction + get/set stuff would be
>>>>> weird
>>>>> given the fact that we can only PULL_LOW or HIGH_Z the pins.
>>>>
>>>> There are several drivers in the kernel that implement .set_config(),
>>>> it's existing and should be enabled if it has uses.
>>>
>>> Yeah, it might make sense to support it specially for the input case. AFAICT, if
>>> I
>>> use the .set_config() (but from a quick look I think we will need to add support
>>> for
>>> it in gpiolib for the high-z configuration), then I can't use the gpio_regmap
>>> stuff.
>>> As the driver stands I don't think I could do it anyways because setting gpio2-3
>>> and
>>> alert requires to write 0 on the register rather than 1. But again, I'm still
>>> very
>>> suspicious about the whole thing. The datasheet states:
>>>
>>> "GPIO1-GPIO3 and ALERT all have comparators monitoring
>>> the voltage on these pins with a threshold of 1.28V even when
>>> the pins are configured as outputs."
>>>
>>> But we can't really set the direction for gpio2-3 and the alert pins (only
>>> getting
>>> the level and setting it as PULL_LOW or HIGH_Z. gpio1 is the only one where we
>>> can
>>> configure it as input or open drain ouput. Bah, I'll try to see if someone
>>> internally
>>> can shed some light on this.
>>
>> I have better proposal. If these GPIOs are not needed for the main
>> functionality of the hardware, can we just left it out for now and implement
>> later if required?
>>
> 
> Well, I did spent some time on the gpio thing so I would like to have it in but yeah,
> no hard feelings if it does not go in.
> 

Problem with that is that it may end up not being used at all ... and thus start
bit-rotting immediately.

Guenter

