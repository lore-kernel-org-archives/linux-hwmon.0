Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8228437455
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 17:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282290; cv=none; b=u06eITVnexaloMy7meUcjqFInDgDYgBNDqudcdwAxnxevcYE4gB2oyHge/7aMp8stsTpTEHVrYIhwJx8Dq9iU3FsKLc4xg910giLhs2XdsFd+jxw7EXk124+56UAiMbPSHTlwIXZxa4JRvITNY+h3ewWjh3C3U0ZfnPdlVb0eok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282290; c=relaxed/simple;
	bh=sCpWrPyDgUHrOQNFUMCarIYxnoz7IFzUXJsBXRnhj6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oL0M0lTEQZ+ZwaQXqybNXjRyHUlVqwGh5OMX9aUaJ55bfwNTOCDoE9642+DbM4e6iPxg5+OAiZGc7pjxmkVb+1JOZlI9ZnTuissBG5e/vprcoC+SP/yitwIJebqqAPVpH6ThfSe3KBPVLZDKlvZxIvLdTPd4PeEoeKncx4gpdhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/3fR6z1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/3fR6z1"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84eb992a881so59557b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 10:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788282288; x=1788887088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imFY8trppO3hIGZZKMCrA2RTQJSgFofoaspMJZY20Kc=;
        b=A/3fR6z1sKuSVIP0sobezMBbK3FVsDhh/KVVEslUH9YCMxNPNHexs5dI+AWBJv8DTi
         p9KCEsyGrCLBMqbH0CUM/XPrVZ/cIKRyK7y7AlM/KaLv4aXA3iggyoO8/3gwAG6OvHX5
         vN3/6Y5QvJtpUTaV0ckFILmhbmAe9vYixm5oOsF4Mcc1EdDv+OX6YAKv4fslHCEkFO7p
         T0B1H5nCAH0T0kGpTGnZCvP6f5bss0P7IWK2g2tXWoDdfo90pRMXKnnVUIyV3XrhMo10
         Bev1coBZpE4/KkGPfAfvRDPu4UXX6CjiZCwhm5PjvzUTnGXxK7mSPN3DWv0CuaRH0pPE
         uw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788282288; x=1788887088;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=imFY8trppO3hIGZZKMCrA2RTQJSgFofoaspMJZY20Kc=;
        b=SZArP75KTDN14fq0ASTMwwp7ODdSOf1oAVNBXYPopg7DAxdUa88hPZ4fNcWTH2516T
         aJ86fp1cZaP/AYkOtx+oDgNXJKXGHrQVXpDF50Mg8hvPCPS7FpI1PjnKrN1aSuZZytIJ
         1PXsv8SPAKIE/0LQmNAdvKzHJq1e5xZymo1W9pgdn3DhJML9TQWbTv43VSP4lTJ16wSm
         XQ/+unn57A+tPRBhA/gH18zyWPcQZDTYIQy883/kErUVtgwAU58jewGmwtaOiniEY9GI
         z6cScIu15QC6Yl+xk3vQZlcQAEGzZa3WBy9vZJub140rxfEQ7qJd7LnyRf16WoDiejF9
         UV1Q==
X-Gm-Message-State: AFuF++mnBt9nhdP35LZfFbT3CaXlwmIb5CDIr/jvO5SWT0A399tY5zRl
	ZVEI5BPrdXk3N2ciwyxqEZjvlbI4W5MGy95c6gs5peL6z5nKoGyXEjjeQAepOw==
X-Gm-Gg: AR+sD119BzhA0Pm5PGub8v5eXoKzJcpM0VMtEwHcmYr8I8JPhNqh3m5w6Of6k/jdsyL
	Qhhi2X3psIasaAkYNCXFApyzYb+R8fW+DqmRUgP97bJ7dAA0QXNfC9v1JWc80bQdDIda8WyVMHN
	NwDOlfK3IAR/zIt6lBARvWqBakP/aGbJ1OvMt0HkYKX5zG8rUGWPkFxDGa5/IPNSLcPvnuqNLho
	PzdvV7akrMAhFzL/rY2y6+K6ylZr8Ts97NW3zJWlWWY7MzCWrIOOsa7eDcS0z6tSFlrLcV2Y404
	yvcmgxUe2sQmhogiGAZeUcoZooi4/i4oqu3VVjVoDPyOsiMTmsg4eGzCOdv7bdx3ndF6UTf9uq4
	/uKDT5vSPUcWLHZ7nfpOxWM/c/17ryKRKaG6hGPur3zauV7pPDGJ5bAYkL90UfpA8J/kA0BDnUU
	thrpw/wPGtlGwfOQQ3E4G8YABx7PUkQBM+CgadYd8MUxXNFS6J77dQmyZLvkEb6xh8wJCwds9c1
	wpBQTFaPdotcbui5Nrw1LRC3GObjDDjs8j7bQ==
X-Received: by 2002:a05:6a00:c90:b0:85c:e16c:a1f6 with SMTP id d2e1a72fcca58-85ce16ca283mr2208698b3a.24.1788282288254;
        Tue, 01 Sep 2026 10:04:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003af05sm187109b3a.37.2026.09.01.10.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 10:04:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5c17ea39-c479-4f88-adc6-9a86f3dfb96a@roeck-us.net>
Date: Tue, 1 Sep 2026 10:04:46 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Matthew Bettencourt <matthew.bettencourt@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
 <ee284272-0da0-45b6-a3be-c76822e5d54f@roeck-us.net>
 <014b9438-e9b7-4be1-b816-002e83a068a0@roeck-us.net>
 <37132c40-aa82-4df1-b5ce-337601f3c085@gmail.com>
 <3c4e9f59-5272-48cf-a4a0-eeefcba955a9@roeck-us.net>
 <763a8b30-8548-4ff0-a1e9-8e74bbfe9b02@gmail.com>
 <6e8761aa-67ef-4624-834d-4b9d0ce729d6@roeck-us.net>
 <9753ed80-5666-42a6-b04c-99b9ef9326fe@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <9753ed80-5666-42a6-b04c-99b9ef9326fe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Matthew,

On 9/1/26 09:31, Matthew Bettencourt wrote:
> Hello Guenter,
> 
> I added additional logging into the piix4_transaction(). I will put the function call on the bottom. But as you guessed we are seeing not just MR11 corruption but also can trigger on other addresses as well. I was running the suspend/resume cycle and caught on both MR11 issue and else where. Here is the dmesg log output.
> 
> --- Other PIIX4 transation ---
...
> [29287.881787] [ T204580] i2c i2c-12: [PIIX4 REGISTER MUTATION DETECTED] Pre: (CMD=0x1a, ADD=0xa3) -> Post: (CMD=0x01, ADD=0x45) | DAT0=0xff
...
> [29312.945873] [ T204570] i2c i2c-12: [PIIX4 REGISTER MUTATION DETECTED] Pre: (CMD=0x0b, ADD=0xa7) -> Post: (CMD=0x01, ADD=0x45) | DAT0=0xff

It may be a coincidence, but the two failed accesses are exactly 25 seconds apart.

Would it be possible to drop the messages except for the failures and run long-term
accesses (for example by reading the temperatures and/or the nvmem continuously) ?
You should find the nvmem at /sys/bus/nvmem/devices/0-005[13]/nvmem.

It might be useful to know if this only happens during suspend/resume cycles
or if it happens all the time, if it happens randomly or in specific intervals,
and if the failure pattern is always the same.

Thanks,
Guenter

