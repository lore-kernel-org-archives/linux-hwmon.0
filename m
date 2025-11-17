Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38154257AEC
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 17:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763399967; cv=none; b=FrEwJrDLbehqpu79RNcBpWCrwwt9LyfJf/e4ctiQph4n2+MSVQP6U1fR4gje1xodqfzBFjls40I+INwuqXf5xliRQimjmps4bRrIIRtalUoqRJsaWqT4lrpTAWnPHV3qFSBW2FCqOcqtE/pRFk//trve7kuyaq6/vPYPGthhavg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763399967; c=relaxed/simple;
	bh=2sh+jMQug9349DO4uKeqlAQ7oT61fO2k3C87mD5Abyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gCnvgFylZpa6KRFkOu12tTG5LQjyRVxFQkSZTeii+zZ+/E7Uv8lOU0oYkqa+7MV8raY9AAz4KipzYwUepC27LiK5WmPExiiK0JTAemImlMsZ3eOyviJU9UMx/B80DcoHqF8gBftPFvEhf138K+PQs552GGPL7ZkBPI1R7f/rjZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIYqr2+K; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIYqr2+K"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2953e415b27so47719835ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 09:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763399964; x=1764004764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mw/V8BvwipiLAU7GISIOmf36EH76CrlygPXQY3IrqrU=;
        b=BIYqr2+KE9mToMrkvk5CgmdC3yhbpfSLrAysJ6+qkIY2f0k01hfrXkClMtoZAD3Sqv
         TrAuMP4u0fo9kQ6fgnb/jOoaY0xOFw5ADpn+V8H9TenQ7qnbE4tFnoQy0QcwDMcwp0+b
         cgx+GbB7A7VoJLFVWcdmxaUxclOF7q93g5dXtgOMrp6DEyIFfnPAjtSJNJw9xHt4vzEY
         WJuIQSWIgApU7Sa/Qg9ETDAbbpLw0YJZLPMacEuVBPiNYexf3BRVdG9GTyGyF/vf3G+T
         k5CPYCYUCpMLHuvlVF4C7ud1j8mKhlZ4R6VWCfRZOljDX0OITDyaGLddVxH8xz+STzeH
         9dBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763399964; x=1764004764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mw/V8BvwipiLAU7GISIOmf36EH76CrlygPXQY3IrqrU=;
        b=EmVSrsHAXtV/4lOj/PFk23C4Y1g4vwF1MC9ipJuAXzBNPssz9YpW2I5N3cO/+3ZlTA
         e7OkNpemeamncY3ManzXk/2IQMAifwFZrvJATeXb8lHdMfnSDgFHCQ0BOKOW0MGl3kjD
         Lg2dmnA8RPgAm/sbLOpvAbnXAuS28700/OHc3Yx57gq0/kejeljReV64X9BsezMzRu4n
         BN01UlW9Bx61JIafXDftBkY2Qr19eJruYHST9mHrunv+ZU0/A6CcBzwSWoPhOnkMZFt5
         ys+0MHQUZIHF1LLfrY4Wl3hEHJrS6SWf8L3uDjdXrR5qnBsNV7UmRr9DuyY6PAL488J6
         yImA==
X-Gm-Message-State: AOJu0YwtEF+FL1WAuhyIjImzUhH/HyIwr4+NLZsr5ntL6YA54ad6MmS0
	7y3OuoUJF7V2TEqtewTnDg7rVLvZmpeJCKo99JQYaM8+DEuFA3lY+BTQirTVrA==
X-Gm-Gg: ASbGnct/2Mw6a0HcVqmeAAwuTTSyF2E5I7ifQXwnrRuEGouG8n5cztcYMvK1eXtlqxE
	zuZVBU+njTCKjEuJY4AMsVtUBt/86Ivfrq6H0QiauJ/MT8RT4W4LzZYeGhW1JBn1j4CovLkn+uW
	SIaOcHaw/pQEA6UBf852DupEvL3uGLgQIPBIeVADye1m8xd9YufwIE8nvF5YNsl1PGu/aVhDdlc
	Mp0t8kHfmzWHeprBJCVmzuvSJfjsjJmuND4regLHAxCoQm0N7GV6ltGBihcmHdYn2Cb+xhUNOa3
	vu6JFwuS4uf8jgDdbjD3+5lh+Trt1Jui3qRr2Gb4xCz4ZSB14Bt+B3W8UBe4ZuPaB7M6GbXg7/7
	JkK2fE2sOmIez/W8dGnMiYChw19K+5ZKO2kj4gM2Z26JJkhZGyyC9x/kzOGc7pGEM/50oYelLOK
	v949fJmf45PXFIFfsLjYNqUBDgFcYxpbVPIEl/2NeQhO/2Zg/MEYbDnRuJuqXSvsIjo3LKOw==
X-Google-Smtp-Source: AGHT+IGvfRX6t9Yb5cJVzqh9xA7TM/X3LBq/aJb7BKhCqkTGegrYiczEvCKtPmfjnaKDgNPR3O7Azg==
X-Received: by 2002:a17:903:1b04:b0:290:b53b:7456 with SMTP id d9443c01a7336-2986a6b8906mr149083915ad.5.1763399964348;
        Mon, 17 Nov 2025 09:19:24 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245da0sm145271815ad.26.2025.11.17.09.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 09:19:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cea7a39f-7826-4f91-8389-6477922902e2@roeck-us.net>
Date: Mon, 17 Nov 2025 09:19:22 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] add Via CHA ID to via-cputemp
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: linux-hwmon@vger.kernel.org
References: <20251117.133746.173713564005237147.rene@exactco.de>
 <9e761121-91f7-43b1-9f7f-866acf1fb7ad@roeck-us.net>
 <20251117.174214.275632644162861879.rene@exactco.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251117.174214.275632644162861879.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/17/25 08:42, René Rebe wrote:
> Hi,
> 
> On Mon, 17 Nov 2025 07:44:04 -0800,
> Guenter Roeck <linux@roeck-us.net> wrote:
> ...
>> Your patch does not apply to the tip of the upstream kernel
>> (v6.18-rc6). Please
>> rebase before sending the next version.
> 
> strange, does for me with patch, anyway, will rebase.
> 
> ...
>>> @@ -273,6 +274,7 @@
>>>    	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_C7_A,	NULL),
>>>    	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_C7_D,	NULL),
>>>    	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_NANO,	NULL),
>>> + X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_CHA, NULL),
>>>    	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 7, X86_MODEL_ANY,		NULL),
>>
>> The hard-coded numbers were changed to defines with commit
>> 5cfc7ac7c1bf6 ("hwmon:
>> Convert to new X86 CPU match macros"). I don't know why that commit
>> did not also
>> change the case statement above. Either case, I'd suggest to either
>> use defines
>> everywhere or not at all.
> 
> As this warnings also annoy me quite a bit:
> 
> rene@centaur:~# dmesg  | grep depre
> [    0.992068] via_cputemp via_cputemp.0: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
> [    0.992249] via_cputemp via_cputemp.1: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
> [    0.992443] via_cputemp via_cputemp.2: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
> [    0.993148] via_cputemp via_cputemp.3: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
> [    1.003503] via_cputemp via_cputemp.4: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
> [    1.004619] via_cputemp via_cputemp.5: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
> [    1.005364] via_cputemp via_cputemp.6: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
> [    1.006004] via_cputemp via_cputemp.7: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
> 
> I can finally fix that while at it, too.
> 
> Do you prefer a 3 part series fixing this, the defines, and cha001 on
> top or is one patch okay for this relatively simple changes?
> 

If by "simple change" you mean just calling hwmon_device_register_with_info()
with NULL chip parameter, that won't work (the API would reject it).
It would have to be a proper conversion. That would be straightforward,
but I would not call it simple, and it would have to be a separate patch.

You could of course try to cheat and call hwmon_device_register_for_thermal(),
but I would reject that. A conversion to use hwmon_device_register_with_groups()
would also not be acceptable; see Documentation/hwmon/hwmon-kernel-api.rst
for acceptable API functions.

The defines can be changed together with the cha patch. Just add
"While at it, use defines for all CPU model checks" or similar to
the patch description.

Thanks,
Guenter

