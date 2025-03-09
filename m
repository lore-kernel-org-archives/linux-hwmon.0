Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1B710E5
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Mar 2025 15:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741532654; cv=none; b=Jtzn28dr9ddionszimhJme/ZQEkfGjPOZ3/6/+CGl7p0c6L8tgxuFWubPJyIIaPjkO+mBQwj7Y07Ajh7xL0GAI8U7v1s2n7WNd2UPb2EizL84Dx1Y8QwI+BU2hZ9xeUisYnUYpi2YQbZ0lcMDGaXe+AMTKiPQUo8f7zxgqzy9w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741532654; c=relaxed/simple;
	bh=sOcuKN/m980d4tY+NrauBRzcSntJd4RuSjwQpDWi7rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kisQgsvkaUDcw1JIgY6Ud1Tzt8cLKT3YkHuidUTiVJ/+ztn2svctsx9URicfcGJh6LR0PksU+ZHrFEf6G/8UCzjZ+NMbWlqN6u6lrGr4f0SwYbJZH1rcdLyWdlD1EJzfW9AnqfEGxufFHkZyAoUIG4EIFEvj6XqGKb8KIADvsOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlGVQ8fn; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlGVQ8fn"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223594b3c6dso59138485ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Mar 2025 08:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741532650; x=1742137450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=24P/3KgBpnNd6IcDeWG+q5nPHIiIrAry9aiLBOLpAKs=;
        b=AlGVQ8fn8/VD7V6xBbx+f1DH0RdIDb8fQGGduJS6CpDhU5LhMRF702bM1oeLJb9wl2
         HE4BRizkiWcBn+cJ/3AGYWezvmtm4zbWBFlR874xZ1EydZvCpXp+D1sScPvkVSkgVkc+
         Nbe6m8is67MQKxKaP9l0gZ9PoHDuDUeaBeu3iu+5WrDcdcR+JQkzA+XHJs7O1tCnuy8u
         A1Z+CZXdT8+Bmdms+RI8bPyZtNoIl82hhFwNNnpx+LyUUM9YtdkbuPTMxbhP/zwpI32H
         cnosIO+eV55a7Wvf9fLNiiu+Vi48TVDx9y9ha/hkMQ6veZC0RHW+NeWwte4bGvtGDEji
         //Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741532650; x=1742137450;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24P/3KgBpnNd6IcDeWG+q5nPHIiIrAry9aiLBOLpAKs=;
        b=DRlWRgtuMN6i/pNDVCAED9VWcoH7z5fzDRBVVRZVnoGrioV3X+nrCEPpCpw0d8l008
         3oTxioSU7WxWlHmliSCcQmQL/Bjkp7V9FBxiFtI2wERM7oQrJ+BPzOHZYQrCb2PyBvKG
         CJhK5VVxWL4OtPzw84XYy6vBX9lYm+Egir6lkDUAaJu0Eo+L6BnzPJqvZNZ/gqJwbVbP
         wibx3bFlV4veCvuR45rgVjvNW633FzFfFKNgYn2Fpb9rUYrdkpMX1ekodY1cH66S9UmW
         USo/XCGRGoByj9zVEdcsHjTejqs0ni0mFfJte6rYp5K0UDsDfBdfLlDI6ZT34uTclsmp
         2AfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+dH2JsHOW2h47wyU6tPVxVTzgaG1NlgQkum6siRjyU6YMYyLW/bIDT4cEcNdjzJKAsF+lMeWof5e2rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN8yYocHUY7q/K1PH1xME2IYBZ9P6U25TcX1yXJUa2DxQz4Zo1
	+NEZupM/0E5JrDQ4+2NbbgLdGepzTDLWK1fR1/8Iea+qLyVS/gv+dFct1A==
X-Gm-Gg: ASbGncu1p2A9hWlOCe9wXLYpKbONDm4Z1A2jvALpVD4T62sZXvzxEBZFlCxi688wJsx
	hRxV72D39zprLw3vthZkSFdnrG6o4esUSIToGocrIwgW0ENxYtPBgfVHGKsOH1izUkkKDC0tBir
	+LAkhGnRMEXWitETykZcoOFlJw0Th+4GFmGvyxw8D88VTe2/OYBtUn5PkVuC/rp4KIajSZpmxIl
	oRScCPZFEwG8tVQoUGoIAx/Z+uC8cKd9Xw2eZfk/HRClVg+B32hiZFLgcRyMGoK6wgw9nruPVoF
	I2aFm3l188dzx7IpLFn0Y4KlsWLWzbkTfhUUcs5aSvBvRaYhv9k0AVwyKmm37XuECekdD2KWX4h
	9NT1DDaCsqKV2QzNOsw==
X-Google-Smtp-Source: AGHT+IE6B5ZbzxB6y/6cfvuosXNTTRQby9HM1fnZm/DiJfDRgbNVyhsgjDlSVBZFo/tpIH9xEcifmw==
X-Received: by 2002:a17:902:cccf:b0:224:194c:694c with SMTP id d9443c01a7336-22428aaeb6dmr210134225ad.28.1741532650354;
        Sun, 09 Mar 2025 08:04:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e9f86sm61368135ad.83.2025.03.09.08.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 08:04:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6d6dfcdc-aad3-401c-8845-1da7bfba3b02@roeck-us.net>
Date: Sun, 9 Mar 2025 08:04:08 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add KEBA battery monitoring controller support
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: jdelvare@suse.com, Gerhard Engleder <eg@keba.com>,
 linux-hwmon@vger.kernel.org
References: <20250308212346.51316-1-gerhard@engleder-embedded.com>
 <54a58308-e559-4007-a751-2d8a8fef29bb@roeck-us.net>
 <aefd126d-2041-4355-b685-7aa5ebf6ff13@engleder-embedded.com>
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
In-Reply-To: <aefd126d-2041-4355-b685-7aa5ebf6ff13@engleder-embedded.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/9/25 00:03, Gerhard Engleder wrote:
> On 08.03.25 23:32, Guenter Roeck wrote:
>> On 3/8/25 13:23, Gerhard Engleder wrote:
>>> From: Gerhard Engleder <eg@keba.com>
>>>
>>> The KEBA battery monitoring controller is found in the system FPGA of
>>> KEBA PLC devices. It puts a load on the coin cell battery to check the
>>> state of the battery.
>>>
>>> Signed-off-by: Gerhard Engleder <eg@keba.com>
>>
>> Looking into the keba code, that is kind of piece by piece approach.
>> I see a reference to fans in drivers/misc/keba/cp500.c, so I guess I'll see
>> a fan controller driver at some point in the future. I do not support
>> the idea of having multiple drivers for the hardware monitoring
>> functionality of a single device.
> 
> Yes, the fan controller will follow. The cp500 driver supports multiple
> devices. All of them have the battery controller, but only some of them
> have the fan controller. Fanless devices don't have a fan controller in
> the FPGA. There are also devices with two fan controllers.
> 
> The battery controller and the fan controller are separate IP cores with
> its own 4k address range (also I2C, SPI, ...). So I see them as separate
> devices. There is also no guarantee if the address range of both
> controllers is next to each other or not.
> 
> Does that help you to see the battery controller and the fan controller
> as separate devices?
> 

Barely. At this point I am not convinced that this should be a hwmon driver
in the first place.

>> Either case, the attribute needs to be documented.
> 
> You mean the documentation Documentation/hwmon/, which Thomas Weißschuh
> also mentioned? I will add it.
> 

Yes.
...

>> Not acceptable. The first voltage channel is channel 0, not 1.
> 
> I did that for compatibility reasons, as the out of tree version of the
> driver did start with index 1 and there is software which rely on that
> fact. I saw a similar dummy in ina3221.c, so I thought this is ok.

Isn't this a nice thing in the Linux kernel: You can find almost everything
in there to use as precedence.

The ina3221 driver slipped this in when it was submitted and, yes, I didn't
notice. When it was converted to the with_info API, it was too late to
change it. That doesn't make it better, and it is most definitely not an
argument to make for a new driver doing the same.

Guenter

