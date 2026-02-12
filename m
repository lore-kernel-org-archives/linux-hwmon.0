Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8C61A275
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 06:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770877119; cv=none; b=gJsHAHbEC3JLZpWP4CRC4wYhaAl+BAtFp7cpyRoH5wLXd2SypjGrTEY6ngyUOeJtlgZuYK/RvCJOAHlWg6HG2qjIAQrb5mDyEaLMJTT7wZLixcNkdAKBO7bgnb/UGOwJ3EdMnrB8vQdch8YNGpPdkYnpdHAOJZWRZ/dun0FTf70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770877119; c=relaxed/simple;
	bh=ZFcJnx//ATQAf2RyWH6AiEiCIrYCw8Z2tww0tECWLPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvKKD5DoEwqVXyiHxSBJiq4ABuqXKPg/q9ptW7SpE3C0Ez4NbXsHxqNribnxF1Un9z4KzP84PLNLYaa6dfde9w0i7+B6eWLnBxc5oCCp4ImunS6yaYfkPs1DQiNmoX4aZ6FbZypqWxucuThVCN8N/MqX1Q6ETVg4F828LwWRGfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeRJFwpb; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeRJFwpb"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b86671f87eso1216664eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Feb 2026 22:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770877117; x=1771481917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1OzRi9UeJ2fiscaRy+FzuugxFWydCPErXw7KGxejOpE=;
        b=jeRJFwpbWmQmgbxlqNTu7SJU/A+8Gi6ev7n+I8+wetHoD4F04P3PtVZIRYlxuDkYgA
         uCuud6FBEZYdp6bTqDF8WHjFIAu458hbITHQ16DlZ0O0J8opK8WPF+mnWf2V+tOKdCo5
         7xB3AIU2W2AM07K4qR1yMI2CwwM/hrA68MjeIX23yYjgZdmyQhsWQHxcTtgGiNNi/2Um
         BncGtNF6kRDGZvR2PwBXcqmwcY7lhzWj1CD0bWphApyMXLaMYT9dF85sN2OUCOy6muTz
         INeSBYW48nJbtg1QfNTwVKsLcqZy6pG3Gsc7gkXiq5rGRp2twm7YAwqitfIXbGY8kjni
         TkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770877117; x=1771481917;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OzRi9UeJ2fiscaRy+FzuugxFWydCPErXw7KGxejOpE=;
        b=ZW4SUN4Q3FXuitw0NWe+5hGP2/V4auqxp0lDQLrpLzVb/tQU7JlRKIOpmIdDrlv4ug
         Q5M26XIW54lMYqwbyKBrHXVR54IOcVDcxXgrmAfU1AxYobxNw29NXq/JNedktXxvCCck
         y6iO35TDhpYdZ2EPC2X7HH7Lm9XB2SOTr0LX6F8SGY981IVQ+tICR1S6aBuyykCXGMyg
         4yYGS9rY6urHxgHGhcDVmbbDx/w8c35ji2jQwQfpVYGO60+QJsV3jyGaileb3YX5zF/I
         K31lYIlZzPRKyNvhkcDEx/yrsgdY30YuKv83+M6uQvyLgWgB7mb9Iv6TTIu6AxRm0iWI
         yECQ==
X-Gm-Message-State: AOJu0YzPD4v7q+8Hf82pO9yMeWeNen1z5gGlrcfRAbgMgS8jaqvBoGP+
	pBcSXXLY26H0e673/sRhNgTXjSsLZ69eLPBpUNsAHssYNxKgaF2qQQkOQmsMDh6w
X-Gm-Gg: AZuq6aKybp4drEH0arngazWeKmcLGh9cYZSFqcn9OXWqTUl5ryXQ42JN02ue9rA1BwY
	7Z7aGx/wpztpzqGnErp/LkH25ZChTJ6R+h53DBkfIV+PF+gZSOUtAnhKgxv/HBHTINNyDgDNOj+
	04USpvqwwYBkNNN5eK0DCMD6znFW4wzPOHUNhB7ZIn5/mIXTMtPIPuKGta4VLYkDirEjv49mSuh
	lflN0NCa9rcoyJ9YHwOkWZ7mV8C3BAozDbtQBczpZXUJKjQRWyV85jfbmLP2f8zWBsIdoFnT9hX
	ADC9QJDwkBxGB5rE+0oRxLNSFR9gXUjwa21GRirVRE76cy//3/NUuuD3CZ2xcgq8qqhhsHcTCBY
	eRu2FmhmSsNwhmRmaQeU0K+OJmp/v7nEV5XDAQCFGQJeGKtMLRoQQj/LO7moa0oTxjPSwld5Lz2
	gpDcKcFnAbiGMDEh7Z/qlIUPbfp+IYHw/2f7MHm+O4TWxtVNG8CYeWA13/+eAHNd18BQXBWSXGK
	oso4qP3Xik=
X-Received: by 2002:a05:7301:d1c1:b0:2ba:ae6f:8149 with SMTP id 5a478bee46e88-2baae6fa4e8mr198968eec.16.1770877117124;
        Wed, 11 Feb 2026 22:18:37 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dce80f9sm2888479eec.23.2026.02.11.22.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 22:18:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <69fb1060-a07d-4c99-803d-56b9a557e863@roeck-us.net>
Date: Wed, 11 Feb 2026 22:18:33 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (macsmc) Fix regressions in Apple Silicon SMC
 hwmon driver
To: Nathan Chancellor <nathan@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 James Calligeros <jcalligeros99@gmail.com>, Neal Gompa <neal@gompa.dev>,
 Janne Grunau <j@jannau.net>
References: <20260129175112.3751907-1-linux@roeck-us.net>
 <20260129175112.3751907-2-linux@roeck-us.net>
 <20260203080619.GA1329615@ax162>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260203080619.GA1329615@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/26 00:06, Nathan Chancellor wrote:
> On Thu, Jan 29, 2026 at 09:51:10AM -0800, Guenter Roeck wrote:
>> The recently added macsmc-hwmon driver contained several critical
>> bugs in its sensor population logic and float conversion routines.
>>
>> Specifically:
>> - The voltage sensor population loop used the wrong prefix ("volt-"
>>    instead of "voltage-") and incorrectly assigned sensors to the
>>    temperature sensor array (hwmon->temp.sensors) instead of the
>>    voltage sensor array (hwmon->volt.sensors). This would lead to
>>    out-of-bounds memory access or data corruption when both temperature
>>    and voltage sensors were present.
>> - The float conversion in macsmc_hwmon_write_f32() had flawed exponent
>>    logic for values >= 2^24 and lacked masking for the mantissa, which
>>    could lead to incorrect values being written to the SMC.
>>
>> Fix these issues to ensure correct sensor registration and reliable
>> manual fan control.
>>
>> Confirm that the reported overflow in FIELD_PREP is fixed by declaring
>> macsmc_hwmon_write_f32() as __always_inline for a compile test.
>>
>> Fixes: 785205fd8139 ("hwmon: Add Apple Silicon SMC hwmon driver")
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
>> Closes: https://lore.kernel.org/linux-hwmon/20260119195817.GA1035354@ax162/
>> Cc: James Calligeros <jcalligeros99@gmail.com>
>> Cc: Nathan Chancellor <nathan@kernel.org>
>> Cc: Neal Gompa <neal@gompa.dev>
>> Cc: Janne Grunau <j@jannau.net>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Thanks, I build tested this with all affected clang versions and saw no
> errors. I cannot say if it is correct from a hardware perspective
> though.
> 
> Tested-by: Nathan Chancellor <nathan@kernel.org> # build only
> 

I would have liked to get some feedback from the driver author,
but it looks like that won't happen. I will queue up the patches
for v7.0.

Guenter

