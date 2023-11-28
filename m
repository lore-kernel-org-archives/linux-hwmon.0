Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqqwOf+2"
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA374AB;
	Tue, 28 Nov 2023 10:03:49 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cfc985c92dso22823005ad.0;
        Tue, 28 Nov 2023 10:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701194629; x=1701799429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=t34+zNByVczgqctyRV+yQUYE4kIPs4CYhcIOcWoRV/Y=;
        b=SqqwOf+2Gs8RxgUzfG8mXtWwPQ37l4jejudYJvwdomJkALhUC/FxWLickumuYv2ZwN
         QEtIh+ivUi8QqmPCyiNUheQe1QR+jCjDNTQrq6Ozx+XFRNKP2NFOtEq/p3DVleXlpt1Q
         0BGnhGatnBUDYQyMXmlYHdqAQonIrY2h70JvLW+OV9xvYvi5pq0voewqXHdC+54bngwx
         s4YKO3DfbZ+BwoKoFrCA5gWYeyDrBoec2GCWa6VgbNKoH/2HpixXNGpvXFqAD1rpIkZE
         nuEXkHBMFrUyUGRDZp++KqayXN7swNGBcGxXsPvjXt89muhenICASnHpcfrR+cF63iiD
         AfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701194629; x=1701799429;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t34+zNByVczgqctyRV+yQUYE4kIPs4CYhcIOcWoRV/Y=;
        b=CFB/uGM/VemJ6sKHa0IbET1TqR87rRon/qG5pzoNBgTGTv4HxkdxKqLuTjDAGTjBi2
         FUgjh2v1Y4Eq2TRAFjLcwNmZOam+SwzQlQ482mQCv7FS8PgCvQkO466Uo4SaqdJL7H1+
         IWxZwvictEG1cFX4dwzw0nMDzAmmg6P0gem3VnN4HhpgmZQdmqCn5pBhf6tnO+VBfyKb
         Lvzq2HSPZ1mQVb1QiFWy3zomtP1NguO2ESxfSM4KSiubVHfghhRO6r/AJbH+UkaAPF/u
         ei7k+IB63O0xrNQWjhz2A2jbw0srJnIH8GyKZvzfnpjhLJOHreBIgwp4P5GWBv3xIjHM
         OXUw==
X-Gm-Message-State: AOJu0Yxmsk4o0r0mF+x016GbJ2ZUGmAgSLnLO5rkiH5QRg1LJCCCpWsd
	kNjHNlyrzUWR0+0t+NcXa00=
X-Google-Smtp-Source: AGHT+IGizhYWi7d1Q8ggW+eEPShcC+V/3yGbM6htn5BsIkta4XVgm4DOPyxZLvQU6Zzxir+TJB53ew==
X-Received: by 2002:a17:903:41c8:b0:1d0:955:b5d4 with SMTP id u8-20020a17090341c800b001d00955b5d4mr1464503ple.33.1701194628965;
        Tue, 28 Nov 2023 10:03:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x19-20020a170902b41300b001c7283d3089sm10513428plr.273.2023.11.28.10.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 10:03:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cacce41f-f1c0-4f76-ab24-c6ea8bb0303f@roeck-us.net>
Date: Tue, 28 Nov 2023 10:03:46 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 kernel test robot <lkp@intel.com>,
 Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
 <202311250548.lUn3bm1A-lkp@intel.com>
 <fb2aaa4c69c88738499dfbf46ef93e3b81ca93cb.camel@gmail.com>
 <76957975-56e7-489e-9c79-086b6c1ffe89@kernel.org>
 <ac950d01-d9aa-4fb7-810d-b21335e4cc94@kernel.org>
 <ZWS90GQTJWA7DrML@smile.fi.intel.com>
 <bcc5da24-7243-42fa-a82b-48851ce17c0c@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <bcc5da24-7243-42fa-a82b-48851ce17c0c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/23 08:50, Krzysztof Kozlowski wrote:
> On 27/11/2023 17:03, Andy Shevchenko wrote:
>> On Mon, Nov 27, 2023 at 09:12:14AM +0100, Krzysztof Kozlowski wrote:
>>> On 27/11/2023 09:10, Krzysztof Kozlowski wrote:
>>
>> ...
>>
>>> Wait, this was not even unusual test, just standard compile, which means
>>> you did not do basic tests on your end. You must build your new driver
>>> with W=1, smatch, sparse and coccinelle before sending upstream.
>>
>> Well, sparse is lagging in development, for the last year it's at least two
>> times it broke kernel builds because of being not ready for the new stuff used
>> in the kernel. Do we have anybody to sync this? I don't think so, hence
>> requiring this from developer is doubtful. Otherwise I agree, that basic
>> compilation with GCC/LLVM must be done.
> 
> Sparse still detects several issues and handles lock annotations, so it
> is useful. But if you disagree with that part, I still insist on Smatch
> (which is actively developed and works great) and Coccinelle (also
> actively developed).
> 

Quite frankly, for my part I would be more than happy if people would read
and follow Documentation/hwmon/submitting-patches.rst. Most submitters don't
bother. That doesn't even mention building with W=1 (the much more optimistic
me who wrote that document several years ago thought that would be obvious),
much less running any source code analysis tools . Feel free to submit a patch
to strengthen the wording there. If you do that, it would have to be more explicit
then "run smatch" or "run coccinelle" because hardly anyone would know how
to do that.

Until then, there isn't really anything to insist on. I even had submitters
react angry when I asked them to follow the guidance in that document,
so I won't insist on anything that isn't documented as requirement.
Quite frankly, most of the time I'd probably fix up issues such as missing
"static" myself because I am tired having to argue about it with submitters
who don't care.

Guenter

