Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWTw0r1j"
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC33B9;
	Wed, 13 Dec 2023 06:35:07 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d04c097e34so55285805ad.0;
        Wed, 13 Dec 2023 06:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702478107; x=1703082907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Gv34Tavme5rh0rwkfPmK20HvURb3Cowrw/Y5eAPtbEw=;
        b=fWTw0r1jObxaNHGmjfjd5/fBOG5TqgkvEFEkNmPUxWNyYd2ajAlO5AMV2spS+1txW6
         QQIYGg8Mt2Z0eKxGu6kkw/FzNe9LdlbCAGtmKYxOCyp0cgBu7JtlTJQoOSRCvkJLe8BQ
         VfpDgjZM2B/a8we40RPPr/vUKyuSVegVpECl7hpuRjzVwwYrflDht1JIc80ITSHkzBFq
         qdiukA+e7u2lcGj7KIoldM4JxopsTo25aSp6+kJiOblYSNeaOQL62jUthTNAlXch1dUh
         xtJbpd/ZHy/t4M9/HzaU3TxbDOKFW31jfRu9oANOGJ1qzbY9e31HWp2UdVVMAqUfA0fz
         SJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702478107; x=1703082907;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gv34Tavme5rh0rwkfPmK20HvURb3Cowrw/Y5eAPtbEw=;
        b=Wmt946VB+nUgt53wuc2r4WKRUXABrBUlbGFlNLWJQGZOLRbdlvx836AhDYbp1tK3on
         n8/cUw5CU+8Y52MB5V/kwBBoRlSdrGwFcvcKzRcXuWhzLSPO7WU5y5Jn4UP3DKruroYP
         zQylI+LuBixjy3aQ6NyfL5vaIQHkVehVvQZHqd0lwm3nIfoKiuMKlvAYZJhTu8YVS3R0
         HRX2yoBig6oBdBQxa7/bVhtfPzgOPD9Nx1kkFL9XY3yQNpFfvhHaHtmmTtAYfsnraqFR
         v/V8RN5KS5pX71kWdxzY0MTzCb75cny5YxJndLe++V9AY0i4p+3ffPSDu7KY1Xb+BCs1
         2o2w==
X-Gm-Message-State: AOJu0YyybEkf2i5Qv8gPq4vlgb0Z1rEf2HZE62oZClZuEYy0yR8zvxqh
	O4ZVjTGdYc/TuOD4bSwij3A=
X-Google-Smtp-Source: AGHT+IFUu19rXvHzOuxYKuhR8W932AjqZt4reHqTxB17mgRzfc2SaDAHPjj7vGDyeJOPFyVuVgeNNg==
X-Received: by 2002:a17:902:e5c6:b0:1d0:6ffd:6104 with SMTP id u6-20020a170902e5c600b001d06ffd6104mr10330258plf.38.1702478107258;
        Wed, 13 Dec 2023 06:35:07 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s15-20020a170902b18f00b001cf6783fd41sm10588445plr.17.2023.12.13.06.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 06:35:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <505ac1bf-616a-443d-b2bc-a54b3c193757@roeck-us.net>
Date: Wed, 13 Dec 2023 06:35:05 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Content-Language: en-US
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
References: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
 <20231205-ltc4282-support-v3-2-e0877b281bc2@analog.com>
 <a0eb6cb4-b8af-4a6f-8888-fa18f8f1d188@roeck-us.net>
 <d190620900ceda6c2846f3828ee389da917a66e0.camel@gmail.com>
 <436257a1-628e-4a45-884d-348e73d4c5e9@roeck-us.net>
 <38e41d0b92c0cb1f61e7a1d92137cc94a57a7f85.camel@gmail.com>
 <92699a3e-1198-4bf9-b5c0-ea8c5c189336@roeck-us.net>
 <cdf4876c8e5f70d70ac362f79f295cae5e39b1ef.camel@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <cdf4876c8e5f70d70ac362f79f295cae5e39b1ef.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/13/23 02:06, Nuno Sá wrote:
[ ... ]
>>
>> We could also use in[01]_reset_history. While that is originally intended to reset
>> min/max voltage history, I think it makes sense to extend the meaning to include
>> fault history (even more so if that history includes over/undervoltage events).
>> Plus, there are other _reset_history attributes which could be used to reset
>> power/current/temperature history separately if that is supported by the chip.
>>
> 
> Well, I'm already supporting _reset_history in the voltage/power/current channels so
> I can easily extend that for clearing fault history if that is fine with you. I just
> need to document it because it's a bit of an "hidden" thing. The question would also
> be, should I just document this for this chip docs or in the general hwmon docs?
> 

I'd say chip specific for now. We can document it in the general documentation
if/when we get more chips with the same characteristics.

Thanks,
Guenter

