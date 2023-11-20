Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkuFRqMw"
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F278810DC;
	Mon, 20 Nov 2023 07:03:14 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5b31c5143a0so46934457b3.3;
        Mon, 20 Nov 2023 07:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700492594; x=1701097394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CYIKMW1J9FAo/mzs4NB7u6IHF7+VDMv2OSpqHWwBWcU=;
        b=TkuFRqMwrJR2xZ4Z3gD4cgqe4m8fqOEHEiqsCWv0F2HbksCayohULx0dQR2Wq2/o2J
         NNuVycM10me90DCqaNvv2BzmOB5/08YK9vyp7352Hfq4pfgxuqw5FT6JEKwdFmZ8oZjA
         SXnfs3vCIblOlOl+a+Imc+BPYY93wf2osa+b4Cav9KsOtN4d202o2JdkLnA7BkaZ414R
         Yi368bQuSkvHXIJnVIlQwoEcYkDaai6l/eqQkL3+Fj6LQcQXLSaIREGITb1J8Y2R9nj3
         E/LUQ5M0lOsteGaMJgzPb0oEn7KrLJLlM1ejB9gbr5EqmcRIHqbaOUxGiL+WFYurlvqU
         4fNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700492594; x=1701097394;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYIKMW1J9FAo/mzs4NB7u6IHF7+VDMv2OSpqHWwBWcU=;
        b=FE80jY9bn33xsr5ANtbe8mBR4I9viEuvscO/lKCljuuHlZ7EgUJHOv+yyS9onb1wmP
         ldiXzuufkAlQvFITD8RB5haYcKqA1/OTEewcYHgnPOIvCAndhizATYB+NZgL/Th3GhYy
         h/OQnlAxjn7W3BDzJ3LklVm96gZO3goKmKRUhpNR+DPEQNBu1j9yiJm40p8abHyfwbIJ
         AAdky2frJBlvvdJ3iNCEiseQHKvlidzhBChgsZUjGX50gGJ/mXUtGooaYVOt9P3t3cQV
         GwgH4insIZ3LYFlXf4ao0GQ4J7ALcLAkjJAvNPOC7Oz/raYwT2hSSKf4bsyij/WjX5TA
         whfw==
X-Gm-Message-State: AOJu0YxLPbMj3349WiZlPOhjF5qvwJlqTrc+UGx9qwkpFfXPIIN+94en
	6FQRPOdKu6bYB3IY1OVImkw=
X-Google-Smtp-Source: AGHT+IGNVNQSAGxOxR6Zop6TS2EZsdhsc6h0S1S8oQ0l3Yd7tzXa1kN8rx3p6xd5LJXS/AJuO8WqBw==
X-Received: by 2002:a05:690c:f93:b0:5ca:8979:e65d with SMTP id df19-20020a05690c0f9300b005ca8979e65dmr2415786ywb.1.1700492593933;
        Mon, 20 Nov 2023 07:03:13 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x23-20020a81af57000000b005caf9e3dca1sm268067ywj.99.2023.11.20.07.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 07:03:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <012f0a82-8e75-42d4-a240-19ea67cb91f5@roeck-us.net>
Date: Mon, 20 Nov 2023 07:03:11 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add LTC4282 bindings
Content-Language: en-US
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Conor Dooley <conor@kernel.org>, Nuno Sa <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Conor Dooley <conor+dt@kernel.org>
References: <20231110151905.1659873-1-nuno.sa@analog.com>
 <20231110151905.1659873-2-nuno.sa@analog.com>
 <20231110-astronomy-nicotine-02c798d42910@roley>
 <65060d844b4cdab02079a05286b506740623ed53.camel@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <65060d844b4cdab02079a05286b506740623ed53.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/23 01:32, Nuno Sá wrote:

>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  adi,clkout-mode:
>>> +    description: |
>>> +      Controls in which mode the CLKOUT PIN should work:
>>> +        0 - Configures the CLKOUT pin to output the internal system clock
>>> +        1 - Configures the CLKOUT pin to output the internal conversion
>>> time
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [0, 1]
>>
>> I really am not a fan of these types of properties. Part of me says that
>> if you're outputting clocks from this device, then you should be a clock
>> controller. How do consumers of this @clkout@ pin get the rate of the
>> clock?
> 
> I explained it to Guenter as he also argued about this. I'll wait for more
> feedback but it's likely this will just turn into a clock provider, yes.
> 

That wasn't an argument, it was a request. If the chip acts as clock provider,
it needs to register as one if that functionality is used/provided.

Guenter

