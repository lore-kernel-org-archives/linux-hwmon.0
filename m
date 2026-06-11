Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444FD357CF8
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 04:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152512; cv=none; b=LcprYfY5pQ2aHuhaCjACLOgkGHrDndZ4PMKctYUQRD2MXFyuOElupR5kb11QRfCZS0tL/HTqxIw3sy8Oev+fo7Oj1BP7vrkjfy4A9jpKqAGjVoHpjilo+Fmsa+araAKkY7+nlwFEnyYxrulLO7eNL6LpuY47AvYaqyE9OlwAcmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152512; c=relaxed/simple;
	bh=NeLU335YU+qZjOD5o+fEvcEvg/73P0GvUJY68fHUEuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXhYW/uVFztg0y8DOoTWd4dD6LH2qG+DDCvjv6+e95cf60ppd0c44WDbVZPjqL2tjBEGwuduh+dzOZMYiv09sU7oqHghvRzqHh+7DxKhWa0cq21Zyk16XhClajs7zJnVCx5rzoTHrdGuRNtieFB8oiRRGbceC05AKmGrL8ZBOYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFN271uF; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFN271uF"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-307263ad0cbso10589381eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 21:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781152507; x=1781757307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EQoZXe3M03sHPZBi+t1afeUIHBXR2yvQW/v9EnhkylU=;
        b=bFN271uFErxhOyfYQPcXepDMNYJcUCisrI/G7yTnzxhS/UxwgzOuAWGtS0n5ar1N4O
         +4quwC/z3L4V5aq5qsg5pj8+qxqP9JWCDLm4tyq9wBsNQfczFOb/YtIVI0OwJCiU/FC0
         VacTykdmzRd6qMeGmKf+dHAKZjnW0IBJNpjdO0ADOY6YY9VnYJP1bdKuXqz0XhWcuMd4
         6W6K8jKLMGSSh4ZLoIbegXZ8AwyyS6NfghGQ4GIgllTVHFXxnEKZZiseqRNIhmTXWRaU
         8N69kyylwDXM9UcI/d3lq+AJD/nBTov52OAYU3NUHyewj0oL9awHdxoFW+/WlACjVlco
         /vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781152507; x=1781757307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQoZXe3M03sHPZBi+t1afeUIHBXR2yvQW/v9EnhkylU=;
        b=a5Q7bXFBxk40Ts4CMHe1nompob2lPUZgpU8b0psxNSN93X49OAvei6W/FIN8LDaLa7
         ER1OjRgjxRj7vnOjbwSnVCSpd0J1DLfb4MaChZgpqj2PYZznYUO938tBBSKo5pdgFYm5
         4I2k0i2sLlSj3ptlPDKaKIyCC2kc7zbOLETJf5APEIvNcU/04Qy/IqsP+gibZKXowmrv
         jLFsE5rq+dlWUG0znh287VRvr+LWieAQngFjfX+1sEGSPb6h4pwCeOVuOTBy2G72Vey9
         kE1m80xr6TZ3tr++OYLlAL8FmBfchnZ+G1fvV6bY20SeW/SBRKiRFIFdZ646c424A0SJ
         8thw==
X-Forwarded-Encrypted: i=1; AFNElJ92XOH8xt6NH4G3y18dcS+4CxRPwdUVFIv+T3VITpFnK0c5x/oh0a0rEphh4VA1ED8Rkq/CtBY5ey3LDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZnY8qGZ9gsaBYqx50lzWryKyDe+zQ268+T8AhVFLPBqx2E9tS
	eaKWcx9J68xQpRoouurGt5jxCa9qH6aN4BchtV/V0xkNkl68z13ucZSM
X-Gm-Gg: Acq92OEe/y7reu4Yeute3c8FpcfAACme3PptpG6BAbyjNuXK1/RQl63fdvG+2h6d6fS
	E92B6PzQ8n/tjZtXyGhJQs6y94CmjsfxDQr1Z+C/9MwttzXYud2t5lPXykl/m/Bt8c5/fsLroeD
	gbHsCw2nBFenNUp8vWojc8yxcdB4jVCJnzMLr297OA5vV6NKLdqdQaarqsXgsyxex23e+EZypML
	Xa7HNHce4WcAnHi7OGwjYEWGHFbVdQ7pAszE62FxKxmWGjfLeeIQ6vgl/p67hRr6cCMYUcNUNTx
	I/BJQdbdlljKyACOKJnak3dUElNcX4qAR+E0gk4pcfvNCm6DX1O1DPcWatpsSouwtIHLJnqcCGA
	LbacdI7tvTRjmdpKCY3etS6j3POc+foUO6oPPYQJKfs6PD5f8+f+yWcROwAN3blkYQ7NfdztAV4
	+IosYd1cdmMw8/0NQu6KBgWFXOBSzSXU9Yu+KXfZ5SXKTsuv2OUzN9e4CRQcXsXT0bCQZARPZmN
	kLMcHpSwmY=
X-Received: by 2002:a05:7300:748b:b0:2d9:db50:c6a5 with SMTP id 5a478bee46e88-30804100167mr1024261eec.0.1781152507176;
        Wed, 10 Jun 2026 21:35:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30806c2f3absm642121eec.5.2026.06.10.21.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 21:35:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <775f22d8-71b0-4a0b-9066-6eb2f62a2f9f@roeck-us.net>
Date: Wed, 10 Jun 2026 21:35:05 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: i801: Detect SPD Write Disable and expose as
 adapter quirk
To: TINSAE TADESSE <tinsaetadesse2015@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260205102942.28745-1-tinsaetadesse2015@gmail.com>
 <20260205102942.28745-2-tinsaetadesse2015@gmail.com>
 <aiaw_mwxbuCqzCtY@zenone.zhora.eu>
 <CAJ12PfPTzHbhaXH3sAnMoE9X8a4rHrpzv2jfdnqqJWXvx+OnGA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJ12PfPTzHbhaXH3sAnMoE9X8a4rHrpzv2jfdnqqJWXvx+OnGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/26 01:54, TINSAE TADESSE wrote:
> On Mon, Jun 8, 2026 at 3:28 PM Andi Shyti <andi.shyti@kernel.org> wrote:
>>
>> Hi Tinsae,
>>
>> sorry for the very late reply.
>>
>>> +/* SPD writes are blocked by host controller */
>>> +#define I2C_AQ_SPD_WRITE_DISABLED    BIT(8)
>>> +
>>
>> We don't need this extra flag, we already do this statement in
>> i2c_register_spd().
>>
>> Can't we just assume that for spd5118 spd write is always
>> disabled? That's what happens in i2c_register_spd.
>>
>> Check:
>>
>> 84d477354b0a ("i2c: smbus: Support DDR5 and LPDDR5 SPD EEPROMs")
>> 4d6d35d3417d ("i2c: smbus: introduce Write Disable-aware SPD instantiating functions")
>>
>> Thanks,
>> Andi
> 
> 
> Hi Andi,
> 
> Thanks for reviewing this patch series.
> 
>> We don't need this extra flag, we already do this statement in
>> i2c_register_spd().
> 
> Based on my testing, the issue does not appear to be in the SPD
> registration path
> handled by 'i2c_register_spd()'.
> 
> I verified that:
> 
> * The i801 driver correctly detects SPD Write Disable.
> * Disabling 'CONFIG_SENSORS_SPD5118_DETECT' completely eliminates the problem.
> * The suspend/resume failures only occur when 'CONFIG_SENSORS_SPD5118_DETECT=y'.
> 
> Based on these observations, it appears that the SPD5118 detect path
> may instantiate
> the device independently of the SPD registration logic and therefore
> may bypass the
> SPD Write Disable handling added by commit 4d6d35d3417d ("i2c: smbus:
> introduce Write
> Disable-aware SPD instantiating functions").
> 
> This would explain why SPD5118 is still instantiated on systems where SPD Write
> Disable is active, even though the SPD registration helpers are
> already SPD WD aware.
> 
> The above observations are what motivated this patch series. Am I correct in
> suspecting that the SPD5118 detect path is separate from the SPD
> registration path, or
> is there another instantiation path that I should investigate?
> 

The detect path [spd5118_detect()] is intended for systems where
i2c_register_spd() is not called. After all, not all systems with
DDR5 support have i801 or piix4 I2C controllers installed.
If your system uses one of those controllers (i.e., Intel or AMD
CPU), CONFIG_SENSORS_SPD5118_DETECT is not needed and should not be
enabled. There are some exceptions, such as servers with a large
number of DIMM slots, but that is not common.

Guenter

