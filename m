Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7B383992
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 14:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787064164; cv=none; b=c9icqLmKB9OPTYuvimxwICvCp/36ujPkp6zewyuE/6W/Ruz+CEdeKLk63GFH0CyFzO6j5z4Hn844Ye3W6If2izcdkGt0TeHSdTQ7fAAvlRYA+5Vb94l6c9/aIQa656S31t4zoYvJPRiSivVNv4dtYLOwhK/PcMTzNJEh/3P0jhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787064164; c=relaxed/simple;
	bh=8J0rbDx9ItXdPpS7Hb3xmyrFm2Szr4Co/d26EqVQquU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtmG5lPjPw19l0bJevensnfZI5cg77ifH56NK9tHHgb5t9RaN0H6CgBE2fJFjuGNQg0z5wONgQEkcieFJ6rCqf9+yYM+9PKMojA6wYsCTSSmhV/cap6u8QrJ1YzAaUxWcAjpSmSop1V1GVrGLZFMZuw5FFnfS/j6CM/pmhD0JDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvgWjd5P; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvgWjd5P"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3918169a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 07:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787064163; x=1787668963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOGG0ti3unzshhRepeEmkLPHEtt5lfjI/l1a03sxhdg=;
        b=dvgWjd5P8SJZMtq8VmsL0FX50UHvOo1/fXHXtyJRRRRqDcfsyAXNvn6C5UW15yp9sK
         lJZnYAlmodPNK2F7Tbci3Lv1B71QKqC8e5eHSsxA8GRRV5vfRu/cYwCzIrlZW/e4XP6o
         ubmOmdrT3W/iSBbG9pNOgk3ecvqu3r39dS15pD+DMiXOvNgveO+a1qli9Es4jRS4eGnp
         1sGWojWAFvK72qk9Fdhv8VqQJ2i81k0Wi+cFSHunlhhW25V30VQ7wVE3M61w61ucD5IZ
         THgN/kgmk+HZ/QXrJPLhX33Hk4n8LilHSTfGmsNz18ixHUQvMis6CcoozpnFwFDvnTkw
         h2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787064163; x=1787668963;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FOGG0ti3unzshhRepeEmkLPHEtt5lfjI/l1a03sxhdg=;
        b=F0BY2bOdNIIXgjPOBWzXofSH4FQyUYYqG0ldU7xaXWFmWQwM7xDJgBS+9yJHBdqlXI
         jBf93+PpbQnH2LA96EAzR61wqhTLN/QORQQY2tw5tA5dWmZAlvWtTeYlcQNsAqNwmrL0
         O8HJLFCHECMulzeCW9KJ3BmNU1s29n8mpljuRoNKjsaPoRG4D+LmnWX2Mcgn6ss7Cpgd
         0qhQZ0TRIKvD12I2VaxyJkT9Zfs76qENKFimdn5v40WO+lgS+2yNID4QZ/LlWzaH/IsI
         5G4+lNhM4HHt0RBwnvScrObxfQGqVWgFk4+JUv6cEnYs9qEh7gJwosWxHSgzhe0gR9VV
         6i4A==
X-Forwarded-Encrypted: i=1; AHgh+RqDF8KYSlJP2OjLj60IcJmR5aUJKlURuuWdofGrUZZKHxkcLednBllRS/apH5bT6XKXg4dAJ9/O6jmuww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT9AcpUNdVE2gruASlXpNdlZAlezOH4h0/PHqa9r/+uqiiAdN2
	KvOoZHOjIe/3dG4N2L0EfU4MzgkO/pL3DALxLAeNAh44oThYhyRQNLr+
X-Gm-Gg: AR+sD13l5nfICtq7mdCZJZNJw+J88inQFACQjyT/PcMLeXf/Q971vo7j3i4odLZSvrR
	VDeThiFmULHGGr2NNEsQ5701NgrzND5qL+p/4QO6ZsAdpIHidTdLhZm9tY4ElROKcWwxLFqKbn3
	9bY4ywZtixqm4AJmLl+yigEcJ6Opkm+NB00iEyLpyGB04ZYLyimLoQHmgQoNxCB4QwYlpnCTLAs
	zUGbW3LHTmuWepmLmE/Jh2+kiT/2m9Pz5IgOQjN6Vu/XonSWibsmRXzx9Q/bnYijvPH2Co8/yNY
	Zqkez2P+JKUc0BuWSw+1h/z3KJy4/YMR6pWvX+LxHetBVok9TxJFM07+7+szhbB0nS0adoXK8Va
	5IXep8fpitS9cNWvOathT13ntrYeQbZrXpOf0OtppiRMt23eZRYnYrKKusrPRedtrjxzvlSxwh9
	c66UULuQa1Qjplv8VmAmGqPQ01C8OW/BnYTkVrQhZ6eURpMAI90j7Kp0+NTKCwJ8S3hM58Nk/Ej
	aSUxcqlaaCTlApxb4pkmFs0aVhyx4rdqYeK2g==
X-Received: by 2002:a17:90b:5884:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-3933b7c3b7cmr39349162a91.4.1787064162690;
        Tue, 18 Aug 2026 07:42:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bbdasm6321887a91.11.2026.08.18.07.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 07:42:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
Date: Tue, 18 Aug 2026 07:42:40 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: lkml@antheas.dev, W_Armin@gmx.de, corbet@lwn.net, hdegoede@redhat.com,
 jdelvare@suse.com, kuurtb@gmail.com, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com>
 <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/18/26 07:12, Ilpo Järvinen wrote:
> On Mon, 3 Aug 2026, Derek J. Clark wrote:
> 
>> The ML patch set uses a guard within a switch case that violates cleanup
>> rules. Move the guard outside the switch so all return paths are covered.
>>
>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>> ---
>>   drivers/platform/x86/msi-wmi-platform.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
>> index dfb65ac8fbf6..33acd448f674 100644
>> --- a/drivers/platform/x86/msi-wmi-platform.c
>> +++ b/drivers/platform/x86/msi-wmi-platform.c
>> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct device *dev, enum hwmon_sensor_types ty
>>   	u8 buffer[32] = { };
>>   	int ret;
>>   
>> +	guard(mutex)(&data->wmi_lock);
>>   	switch (type) {
>>   	case hwmon_pwm:
>>   		switch (attr) {
>>   		case hwmon_pwm_enable:
>> -			guard(mutex)(&data->wmi_lock);
> 
> While I cannot see the code easily, one could also add braces to inside
> the case to avoid this problem.
> 

I don't see the code either, but wouldn't this be a use case for
scoped_guard() ?

Guenter

>>   
>>   			buffer[0] = MSI_PLATFORM_AP_SUBFEATURE_FAN_MODE;
>>   			ret = msi_wmi_platform_query_unlocked(
>>
> 

