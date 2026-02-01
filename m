Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DDF26AA91
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Feb 2026 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769963382; cv=none; b=qGrS0dDGVuz+WSDfudxyerzFB83uQqLFl3a1rK3rCTp4PRc74RpN41dila0jSIWe9v2b0vDXunSdQwvY+mHTlUJMltNELwHjBXRtMqZS45wINT/u4JGSow2t57D3SYBv9zj9jJcqPcmEgcU2HHYTXfVTtXQmKvQINU1CQrhazN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769963382; c=relaxed/simple;
	bh=f4WorJkEFfpgpP/dYPOBjPT8G0+Ehtz6vzeRRXWbAOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLGcnyugJCEbHyM/oGVk4hqlcOEMug6x+SSAACLg+wO73L/8eEG/+F1TyQKjSibPdk6LyyBZPTAged15Qqltzfp/3oa2t2ly8pkKFQOIi+M0LTxpUQPjyvxf55vboIHzDKWglapikL85fOEix/epVfIyh3VCgkQCkJIqKlH/Gc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvqZ2LAS; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvqZ2LAS"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12460a7caa2so5638710c88.1
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Feb 2026 08:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769963379; x=1770568179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7SMlu2zjjpqT9gsmbMcpyHdNrcc6xO/sHyKLljB6gIo=;
        b=fvqZ2LASLF6ZAOpyihgEB63ydwN1jcD69N141CJanTqMrJbKNSaTzhLmbUtqokpW9j
         c6HwBOewcSPlBcLmw+yQBW1ejhN//0bfW6DwbK6hIRenGMvoOGYJZurqHZzEY5KBsngW
         m2vJikFNTjt5yHCu4k0gHPPwzfgFq4l+LkuKzEGSKDB3GQ+v28kBPWkAVx+dAqddhfN+
         9okYU0RPqJTtSByQlCISvOcCkZzuH7M8XGNTN+lhmdweDCDrYhH5OELj0p3I3Uo9102B
         JH2chR5Cr7rLCozVZtvVLKvWHuZs2B6jGjoYEJSTKvw+plg20OCb/vGpcHPOoiwc/Gn5
         4vMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769963379; x=1770568179;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SMlu2zjjpqT9gsmbMcpyHdNrcc6xO/sHyKLljB6gIo=;
        b=cPVY7yd3QFE3MYAoOK+4jb3VCQ0cVLwXT03qqMgJBeiHRCWjEhSDDy6FJgH9lE5+nr
         VKCg0ZiA6OUTEEuFNqccEFDzpfoPbubxL4RP0RgUJOikhcMi6CNpJhCrNGXgqtl1EzsN
         JP12cKjY/8iXPOKvuwWNYPppqmw+K9yI5YPOLmMYZSbnA/alYxjiaDyUd0foHMXfrop7
         uYUJgBUuiem7JVDHbdmIJ6fp7jdlBj1ZMzNACpuKnnWf/LxScNHomy0txPmaoO+BCRdp
         t/FFRNVLhA0P5DeYUkWoqWq9GaaQDCQ9c8YWz92WbGwyHF3f9uSxjDjbL5IUpBAoW1i1
         B+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUss7l/KFxKHbEiT4ejcSctQkw37EIuHO9Io7pnOdTknzJ8G5bPZuYDgS1SQXgAM3k6Vl7M9Oj3sgMwtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0T5Ki5+2nnZi12ekjr+hrX+Ou68CUuYo6Lb2x5r0Jz1aeMQ9I
	6EMdxwiAJLZaL0bIP5dQ141R8A5tPxtmAAWPGZNLR1J1spj9tqfb50KK
X-Gm-Gg: AZuq6aLbpyajRsWG0gWRvxHmDi7zBEZh/warnkmo6fvOB9t6Sq0D88eiNo3qfaxEnal
	Ql2MaQo2smm5Jx3ZmWjU8zsd3OpRkS9GlseOvKx2cNhxux/ZQLj/guHjHaaIHkwf4QCrPsoGxDv
	KoUjPxMW12A4sap+exIsII7nJO3eXjvJwh4EqYFVDKqQ10Tcozdaey3CsIrnTo6dQcjogrnP/8u
	e10aZALBoGAl+08yb3vRuAwBszBrL1W/1KAKh1MB/MxuYb7DLZY2NnHKN7ABxZ3z9jV3j6omdRB
	cymitpdQBuovpmR3hq2SFe7U0ledfFzCobVtzlBwpa2S/y3vUEK8u3oroTDSr0f0Pk/0Z1ggx9j
	56M9JtQl2gzMSsfCF8wCCJO1cuQ8UD957+jlzC3CPvociBao+F5Ci3kFa0mFJeVFamD04WYatYd
	zOCNkd3BUDri8IrscbygCMvWWh0ZAd3aBXVInS+rSRX2L1EproyXfy1wTuDoWyRXpvYrBopks=
X-Received: by 2002:a05:7300:a984:b0:2ac:21b5:f43c with SMTP id 5a478bee46e88-2b7c86db7e2mr4500491eec.20.1769963378864;
        Sun, 01 Feb 2026 08:29:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16d01c4sm18304426eec.2.2026.02.01.08.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 08:29:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2565161d-4393-4f2d-bd09-83a25515aad1@roeck-us.net>
Date: Sun, 1 Feb 2026 08:29:36 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: In-kernel hwmon read:
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, jdelvare@suse.com, lgirdwood@gmail.com,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alistair Francis <alistair@alistair23.me>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
References: <20250920114311.291450-1-andreas@kemnade.info>
 <20250920114311.291450-2-andreas@kemnade.info>
 <79aa98fe-b9b6-4210-a556-d33863f0129a@sirena.org.uk>
 <20250920233307.0c425863@kemnade.info>
 <473e217a-c6b3-4ebc-895d-85beab50267c@sirena.org.uk>
 <20250924090023.282ae450@kemnade.info>
 <b68d40d9-6ea9-49a9-8a2e-8b899f33340d@roeck-us.net>
 <20250924195358.16bbd90c@kemnade.info>
 <e6c8f022-ebfc-459c-806b-f75618f65916@roeck-us.net>
 <20260122152306.6211995e@kemnade.info>
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
In-Reply-To: <20260122152306.6211995e@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/26 06:23, Andreas Kemnade wrote:
> On Wed, 24 Sep 2025 12:16:14 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>>> But what is the hwmon equivalent for
>>> devm_fwnode_iio_channel_get_by_name() + iio_read_channel_processed()?
>>>    
>>
>> Assuming you refer to the exported functions for in-kernel use, so far no one has
>> expressed a need for it. The best solution would probably be a hwmon->iio bridge,
>> or equivalent functions could be implemented and exported.
> 
> So first analyzing the need of such an interface. I think
> there is a need for such interface. The need just gets masked by some hacks
> to be able to divert to other interfaces.
> 
> There is out-of-tree waiting to be upstreamed:
> - rockchip_ebc driver: Display on PineNote, uses iio_read_chanel_processed()
>                         in combination with an out-of-tree iio temperature
> 		       driver
> - mxc_epdc_drm driver: Display on Kobo/Tolino ebook readers, uses
>                         thermal_zone_get_temp() now.
> 
> In tree, there is:
> - drivers/gpu/drm/tiny/repaper.c
>    in combination with
>    Documentation/devicetree/bindings/display/repaper.txt
> 
>    Code excerpt:
>          if (!device_property_read_string(dev, "pervasive,thermal-zone",
>                                           &thermal_zone)) {
>                  epd->thermal = thermal_zone_get_zone_by_name(thermal_zone);
> 
>    and thermal_zone_get_temp() to tune refreshes according to panel temperature.
> 
> 
> 
> The example in the binding is:
>          display_temp: lm75@48 {
>                  compatible = "lm75b";
>                  reg = <0x48>;
>                  #thermal-sensor-cells = <0>;
>          };
> 
>          thermal-zones {
>                  display {
>                          polling-delay-passive = <0>;
>                          polling-delay = <0>;
>                          thermal-sensors = <&display_temp>;
>                  };
>          };
> 
> [...]
>                      pervasive,thermal-zone = "display";
> 
> 
> I would prefer to be able to use e.g. pervasive,temperature-sensor = <&display_temp>;
> or maybe <&display_temp 0> if there are multiple sensors in the same chip.
> so that dtc will tell me when there is a typo and avoid the thermal
> zone layer
> 
> So what are the options:
> a) provide similar logic like iio/inkern.c for hwmon usage.
> b) automatically add iio channels during hwmon registration.
> 

b) _is_ the hwmon->iio bridge. Add HWMON_C_REGISTER_IIO,
and register as appropriate with iio if it is set. Then add
HWMON_C_REGISTER_IIO to all drivers needing it.

Not sure though how that would look like in devicetree for
in-kernel use.

Guenter

> looking at the iio_hwmon bridge we already have, it depends on
> iio/inkern.c so for a  hwmon_iio bridge we need a) or b) anyways,
> so I think a separate bridge device/driver has no advantages.
> And having a devicetree node for the bridge would be bad because
> we are then describing linux implementation details instead of
> the actual hardware in the devicetree.
> 
> Regards,
> Andreas
> 

