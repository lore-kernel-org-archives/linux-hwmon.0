Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGAipQUD"
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840CDC1;
	Mon, 20 Nov 2023 07:00:56 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5b383b4184fso49527787b3.1;
        Mon, 20 Nov 2023 07:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700492455; x=1701097255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nj2P2FBgOkHgEYC2eXuTIU7/YhJKLWMATJ8DvnuKIV8=;
        b=XGAipQUDRaQqAc+6+lPCZIReNwPGQJzqY5Fi7SH+hcpNdL15yBQv10YWEgPpwCEeh8
         xhlyOTINzfglAbLf2C1dzca+iK7WWUrf53cDsJdDSQWUadoGcGxCrzi7QEvu5xTc0JOQ
         Cj9/O57u4enuePQIABfDFA8wCCEV/3ODkKbjS71nQ/+ATzqpP8hZXC2wLt/qSET8NNHe
         ZlF12DXX+bvwFYHIZi8X6rwrrmP9H2tz0fRvEF4B3+PH99LQy+thb7EzlR8ChRmBfIvZ
         3MLIhZXS3LcPkuK8WLo6vCWpxKERmM0LHesqClOYJKTWAFDUCFp6JP869yWtVbbv5Val
         iBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700492455; x=1701097255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nj2P2FBgOkHgEYC2eXuTIU7/YhJKLWMATJ8DvnuKIV8=;
        b=Fk/U/7nhv9MYqk7u4pQKbofVrrZ3DWSWpXtrFBYnmJCj4TiuaD7RpeLJBcJ0GggeCA
         r/aianSoA97idPGh8gAoR4CWFzedXP6/IICxEymL7ux5Zy5ROhFA4x/aB/lqrcq9bCYI
         WNqfkt1I2Intlvi8m++awGEIhafoyEOQ2o6FhdHbnJqK2FSd5ahzDJ4jT6r90HE/MzRh
         hx567xXB7Bdf0QqCbdCzR+n5bEIOC5EW9YcjRGb6lxeVhwS0RRFXMpX7ckuTt6ozLfjc
         7puLwks6MOnJTZ0j+HnJCSn3QKaFi5Pzq9cr4pREk+S4aHyqc2sRTaqG1h1u0Xx3B7Rv
         8L/Q==
X-Gm-Message-State: AOJu0YwjdVCM5PAC/OZaC/jfVY9zi+7ecuKp9lXFtAy3lQDPl/LoStdq
	pdZjgedzum/jry5VWW99C2vlXUjzS1Q=
X-Google-Smtp-Source: AGHT+IEPzXqvjkbeToWr6v43nfgW+61m3YSx+DoK0H5ueRQ1rr0TGJXLeWcwQsoOcBWCQ6eUlXamEw==
X-Received: by 2002:a0d:fb86:0:b0:5a7:be61:d52b with SMTP id l128-20020a0dfb86000000b005a7be61d52bmr8360083ywf.24.1700492455479;
        Mon, 20 Nov 2023 07:00:55 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l186-20020a0de2c3000000b005a7be2919a1sm2380792ywe.14.2023.11.20.07.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 07:00:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e3cf1182-47c6-4b2d-b5ec-1eee07974b51@roeck-us.net>
Date: Mon, 20 Nov 2023 07:00:52 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Content-Language: en-US
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Nuno Sa <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Conor Dooley <conor+dt@kernel.org>
References: <20231110151905.1659873-1-nuno.sa@analog.com>
 <20231110151905.1659873-3-nuno.sa@analog.com>
 <ZU5fYY81L_qSmQWq@smile.fi.intel.com>
 <581aec9c6313e3885aae8b1e12dfcc9f392716db.camel@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <581aec9c6313e3885aae8b1e12dfcc9f392716db.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/23 02:13, Nuno Sá wrote:
> On Fri, 2023-11-10 at 18:50 +0200, Andy Shevchenko wrote:
>> On Fri, Nov 10, 2023 at 04:18:46PM +0100, Nuno Sa wrote:
>>> The LTC4282 hot swap controller allows a board to be safely inserted and
>>> removed from a live backplane. Using one or more external N-channel pass
>>> transistors, board supply voltage and inrush current are ramped up at an
>>> adjustable rate. An I2C interface and onboard ADC allows for monitoring
>>> of board current, voltage, power, energy and fault status.
>>
>> There are plenty of ltc42xx in the same folder and a lot of other chips.
>> Have you checked that none of the existing driver is not close enough and
>> brand new driver is indeed required? If so, add a respective paragraph
>> somewhere (cover letter? TBH I haven't read it, it's fine if it's already
>> explained there).
>>
> 
> I can double check but not the last time I looked into those drivers

They are all different.

>>
>>> +	/*
>>> +	 * AVG = E / (Tconv * counter)
>>> +	 * We get energy in microJoule, hence dividing it by microSeconds
>>> gives Watts. Therefore,
>>> +	 * multiplying by MICRO gives us microWatts.
>>> +	 */
>>
>> Here you used long lines, somewhere else, much shorter. Please, choose one
>> limit and be consistent with it.
>>
> 
> Yeah, maybe not too consistent. I'm still not sure what's the convention in
> hwmon (I mention it in the cover).
> 

Patches should pass "checkpatch --strict". Other than that, I'd expect consistency
and common sense, but that isn't exactly spelled out anywhere and would be
difficult to define. Personally, I would suggest something like "use limit of 80
columns for comments and otherwise try to stick with 80 columns unless it results
in odd line breaks. In that case, feel free to go up to 100 columns". Do I need to
spell that out in Documentation/hwmon/submitting-patches.rst ?

Not that anyone seems to read that document :-(. Sorry, frustrated maintainer
speaking.

Guenter

