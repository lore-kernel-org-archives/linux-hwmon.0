Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFC1387593
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277031; cv=none; b=hR87pq+29kvpsxHMFRv/0PtxqM5505WpWIEybMJnSG2OJeC+l3D3ao6NFIRWvnpvbvoMVTqfalID4Sj9esEPNAmi5PBagushukIyy6y+qnZ7SKRacecLxKY2fOBzt7H58OJPOCpWrztrpDBzTfnLSrD37cSuFu51zAPhy/cw89w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277031; c=relaxed/simple;
	bh=TjnRYqm+07dz1JIPm25P3R4cWx82uCOBLAu76ZxLyi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NrzJybUWCc64qMmurTJhe7CIkiSe1rF9Ou7iYvmRqf33Qdo2F8YNe3RqruGEXVutnaAOLpd0LWXhbq0dwCmcOChro2jXG+7lpNRuVWYG27wBgxEyD9D22aB+ekzX9E4v7YNeN/LRUqdv5k1vQVg+K8MmEwwhJwXZOvUF6Vh7KrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwLMrotW; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwLMrotW"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1271257ae53so232309c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277030; x=1774881830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Mw89EmH8qUZwnDDKLdU6WpDiI5F4oXbKdFeBF7Ff7+U=;
        b=TwLMrotW3myMLfFGJSG13fjjpfaRDuXSdFuAEUJX/vmi7BR/DKudjNteOmtgvdS5nC
         PyFsc05VjToM6ue0SIKiiSW7U553IJF65Wj7lHR+O7xEVkMzDKoxHpwPl9qoIo+/1JPT
         /eRovJ3QszJzi7Cc7ZJOkpe0tdtzbxs0ctsUqDd5edmVYGqQiS3er8Dwjb5VD3dFYAd1
         GrpzQgnsBdoDR0C/qofAZwOVSgwwnlXtBh9xcZ2LoQW4rFvb4A7EOHTua7PuVvHhUcXR
         gkCZRK+LK7XlXWMtyLlfOG8fp59QRGbT0S0Owv5guK54x/MIIsVEEe1O2Yx9UPwB32UL
         nJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277030; x=1774881830;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mw89EmH8qUZwnDDKLdU6WpDiI5F4oXbKdFeBF7Ff7+U=;
        b=q7HW2/NqTxXMj0hpt9INlKKN831RBQCE9KUVfjBpDozamRHDMu+rqw8kEt4L38EBtA
         AJ2CaAKrrlRfk622u94bhL2khsl1H+mcIAKIcAp8p3UlsjTlPAN5y0clqvDXyI1+GzuW
         ndZtGPtKZoNXHTsIGTyUIxcRNM7geEo6rWT5Tdn/gFO2uuMOmqj5NjgdGJCtlCeia6GZ
         fwSKxjdlQPkJEFOK+rSMK98OsHORnjDgkcMy3cgZbZz8Ebpi1ps8keJx4DN/lTUrj08F
         U5k33Q/fXxwX053fDGgL7sRUJXPa+J/r2v7MH9r8EE9u9Nt7LeHoazclYvRMKFh0ujj2
         drOA==
X-Forwarded-Encrypted: i=1; AJvYcCW1sHnsWZLfy79jgVJXGPAASf3jWA4WNT/lYnPgeZ/V4e5SXYMqAkxCtSo0C++5z+kcFMhjECLJKJhkJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiJsI6dgoOLZjD/VXhjXAM/ZHh+Hkv1gwYH5bgsrVeRt/swf9i
	DSRJO/s257gqPJrkW2PhUUSKYFJOVeih2X5NP4P/VxRQomBOM21guA9Q
X-Gm-Gg: ATEYQzwQqO/HiepF5aw2Lkg0+q2xD8k8VzFd7R4rCLzaOijNei8ewVDHbbF/HyoMHby
	D+2JP5AADFr7cJwgy1/6IHfRFsbixjU4JFCoAg26BtWSIAQEBUwjBi9BFGwsXUWg8hMfjEHXOrh
	apMZatETKEEUoEHi43KoHvHYAtnGiRsxFIiS3Mod0h1dUwvnqHrpcunjQ4MqHE6Wad7Pbn5QYYZ
	Rh00lVTpfMC57CdX6Ocn0itBvtCm7phM7h7J8QOHT5Wa91QayDKtVRuPAFB0fwGQOKumVMqXXnH
	mZPIOgMhv7UwkByDVwaAxPqQlK5X+eCvDsdMcqRclBTQOccwuj5ravtYjAEWEJVDx/9EKWAQjCz
	cXVXAMYcBLQvLsdDRS102+8eakDKddWJcFokIQBk0J4MA7tYVFRAqeoUkx+qUk1r9OBBK7lKGcp
	seTpcsz4J6DHyxIEvlfKoV668eHeouQKPZa6f42UT28q7adKmjsT+vz3ejMg1n7rkmYCLbwcf/
X-Received: by 2002:a05:7022:327:b0:127:5cd6:fa45 with SMTP id a92af1059eb24-12a72684c44mr5788964c88.14.1774277029439;
        Mon, 23 Mar 2026 07:43:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733e794esm9375194c88.6.2026.03.23.07.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:43:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <72ba643e-c716-4332-bff0-f9d12add0cc6@roeck-us.net>
Date: Mon, 23 Mar 2026 07:43:47 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, florin.leotescu@oss.nxp.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
 <20260320152959.1575978-2-florin.leotescu@oss.nxp.com>
 <8a8d2991-cd85-4aed-a7ef-a90b0cd10fbd@oss.nxp.com>
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
In-Reply-To: <8a8d2991-cd85-4aed-a7ef-a90b0cd10fbd@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/23/26 02:10, Daniel Baluta wrote:
> On 3/20/26 17:29, florin.leotescu@oss.nxp.com wrote:
>> From: Florin Leotescu <florin.leotescu@nxp.com>
>>
>> The EMC2305 fan controller supports multiple independent PWM fan
>> outputs. Some systems require fans to enter a defined safe state
>> during system shutdown or reboot handoff, until firmware or the next
>> boot stage reconfigures the controller.
>>
>> Add an optional "fan-shutdown-percent" property to fan child nodes
>> allowing the shutdown fan speed to be configured per fan output.
>>
>> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
>> ---
>>   .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> index d3f06ebc19fa..7bcadfab9fc4 100644
>> --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> @@ -54,6 +54,12 @@ patternProperties:
>>             The fan number used to determine the associated PWM channel.
>>           maxItems: 1
>>   
>> +      fan-shutdown-percent:
>> +        description:
>> +          Fan RPM in percent set during shutdown.
> AI review suggests to update description to 'Fan speed percent' or 'PWM duty cycle in percent'. This could be an easy update.
> More important question here is how should we proceed with the following observation:
> 
> "fan-shutdown-percent property is already defined identically in pwm-fan.yaml."
> 
> Guenter, should we move it from pwm-fan.yaml to fan-common.yaml and use it here?
> 
> Our initial thought was to add have it merged in microchip,emc2305.yaml as it is now
> 
> and then factor it out in fan-common.yaml in a later patch.
> 
> 
> What do you think?
> 

Both are fine with me, with slight preference for the second approach.
Please do whatever gets approval from DT maintainers.

Thanks,
Guenter

