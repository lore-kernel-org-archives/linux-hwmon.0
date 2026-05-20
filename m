Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45906200C2
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 05:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256022; cv=none; b=cjUzRLs9zCYvty9ZSedTQKBP1NZ1yfaxgrVOyOcJ8IRk75SEzDtLOYmktE1yFjUNoVqscpHfpyCd15NttwMR0j3vH7RBO8OPQRT5r+hGl0qFwG/fz9d9s0RdXGFIdinTIb7qHLIQheLlR2TJuj0u3DMzTzEtMwRDUWIDhY5O0fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256022; c=relaxed/simple;
	bh=QPcqOJG94oweAnv3Ku2mLnd5cWp2n5c3khvOT2J+uDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jr8Sdjk3Vl11ZM9KP02z3sfTAcOifUVCO0YExQrzJWR5jL71AhVc+S4iiRV5QfBZHN1mL4tmR/LYuAAMLWrDr10XwqswS9Nhr0oM7OisYW08Lm+1FwrlMhYCm+D/MAa/lPFVOCQwCI5oiV9amQAhxGPG7jNbNjD/OHmv7ErMVH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTYGpYaR; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTYGpYaR"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f33ae12f97so1630602eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 22:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779256020; x=1779860820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=95XuvVfir7/dycN57uY6vwTIw3bLwgAABLiAfkp1y7E=;
        b=PTYGpYaRZ3WiUmt10pmRz1/03seOq+fl7nQEkU3aJMuHvkIf3fIwAmyB/QnWbfJsev
         xzJyPyZgPUT4Qaj8CoF6qGzX8L28+hLwBnNKK7SiGTmbLEJ8DYXpHsSK8vcU1PYftQL7
         /Tv1ohdS0ULZtcaujpb9Jj+hsT8RjjWfa7HHuZPnLLP9j+PX5l8HxObDFCWPkxJRgEEQ
         WnnZfe9kUoAFmsddpwBQYBsXizxDeCsjuceAOKoYevQGycmYrrT2Qit6Wy5RhbXFEEDn
         SfVLJrRJcOigSVILI7mRzpdVw2jEDhe7r5ObNtoh8HxTnElpshu/qQiYKmpNB7TiSjWv
         XbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779256020; x=1779860820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95XuvVfir7/dycN57uY6vwTIw3bLwgAABLiAfkp1y7E=;
        b=lWxajZ2Z/Yt93538wBpiqwip9E+K3dCsVDjxWbIRARHoMxkH7eb/t6u6art4KTcyND
         YOcw0AiuKeF7Ga6OCUj1Cnz8GjCq+W/I7wnrp5r1UoSmuTKtxjcgkRlWAf+HPBEMHeHa
         XVo5IfH5XGgfGqzVgZaC2TiSGu1PuX63PLHQPxdcOf3PX0AhNTItCcLGL/phmIwZoSXP
         8xBgWgixyRVfstjOKDLlaxxwCuXLxOGrSR9BtMpbu1LmyfV8bJ9rKwWIgfhPnoviQ/2O
         33sJ8aRlnWrzhm8AZkBjtuA5eZlHsM8fgl5WsHCpH+auRb9Nnu67yd4RA2INd6ObyrZ9
         g1zw==
X-Gm-Message-State: AOJu0YwJUgOrwgel4Bjp1UCoGo4gRRqhKl/4ncppLlEhbjMCe95B9NDa
	7N671HWj8jODY+jkhR/q+KRE7Lay1ou6lWQN00i93/LwuSPE09qBlDIq
X-Gm-Gg: Acq92OFUw6Jl9El/3erRMs6RWXWkdRlEMYl3HfU45Hn9D+RSHi45ZHw1NnDVqbcpsQK
	YeX2CraMDMMpR1AD22Vke++YThZvhE99osMyyBF8jUQxVvrZxlrQDcsNvlL0vIP+elJU4eTTpbH
	8AbkCm6rjY5wmCozWYeI5WxfMI+Tbh7G+xlI21X1sOMFoOvDQMAZN134I6DYaI9WmgHwiR8RmqE
	lc7IHO7HZzaInaWg1fUUkPEeIYSgijKvX3PRZVgYkd7HBfOAxkps+NyF9yB0w/8dlT9+idFUNXJ
	rNeRKMHXguZ0PDKql2zXQl383L8Z/hxs+ynVjk4Slo7cjieZTR5M2ZkFQBF4VRYcAnzOZzfudbW
	BWl54iUq0tds2CoNgg6hOrL+y/3m4QXrnwZv5mvlMybloNL8cSeInrN0E7kG7jDeLFfD8ROHCbl
	YruBhU8Su6L/O97YU49av1zRK8JPJW690FNl22J0jGYVtYtOE/430yLNkTzGEfCUp42YkZkEXa
X-Received: by 2002:a05:7301:6089:b0:2ed:e16:6b4c with SMTP id 5a478bee46e88-303986a9647mr11396908eec.34.1779256020063;
        Tue, 19 May 2026 22:47:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcc5asm17890186eec.22.2026.05.19.22.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 22:46:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5718e677-b0a8-4335-939e-949dc9888bc2@roeck-us.net>
Date: Tue, 19 May 2026 22:46:58 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (coretemp) Replace sprintf() with sysfs_emit() for
 sysfs show functions
To: Dongyang Jin <jindongyang@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519065220.2348524-1-jindongyang@kylinos.cn>
 <d4ac610a-b34c-44aa-8e7e-b27092390c63@roeck-us.net>
 <636141af-f4db-4d11-9247-b175b575a0de@kylinos.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <636141af-f4db-4d11-9247-b175b575a0de@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/19/26 19:14, Dongyang Jin wrote:
> You are absolutely right, and I apologize for the noise.
> I misunderstood the scope of acceptable cleanups for legacy drivers. I will stop sending such patches and focus only on functional fixes or updates for drivers that specifically require them.

Times change. Until recently there was no AI code review, and it was unknown
that the code is in such a bad shape. We have to concentrate on fixing bugs
for the time being.

On top of that, it does appear that people started using AI to implement changes
such as this one, even though many of such changes could be implemented with
a deterministic application such as Coccinelle. That adds additional burden
on reviewers. While AI is good at finding bugs, its ability for fixing them
isn't that good. Result is that those cleanups can not be trusted, meaning
they require extra scrutiny. I just do not have the time for that right now.

Thanks,
Guenter

> Thank you for your time.
> Best regards,
> Dongyang Jin
> 
> On 2026/5/19 23:16, Guenter Roeck wrote:
>> On 5/18/26 23:52, Dongyang Jin wrote:
>>> Replace sprintf() with sysfs_emit() in sysfs show functions.  sysfs_emit()
>>> is preferred for formatting sysfs output because it provides safer bounds
>>> checking.  No functional changes.
>>>
>>> Signed-off-by: Dongyang Jin <jindongyang@kylinos.cn>
>>
>> I consider this a nuisance patch. Nothing is gained from it.
>> Can people please stop sending such patches ? It gets annoying,
>> and I don't have an endless amount of time to review it all.
>>
>> If you make a functional change or fix bugs, cleanups are welcome.
>> Otherwise, I'll barely accept bare cleanup patches for drivers
>> using the with_info API. Otherwise please leave old drivers alone.
>>
>> Thanks,
>> Guenter

