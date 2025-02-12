Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D178F54
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Feb 2025 03:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739332774; cv=none; b=lDKnWZJZjsYEadpaDg+ehsfdkCjBmrpuhQ16QQfvIcoKOE79EAEHKLNdXwXnDNICYy18gBDNelqwnaaN/lcnka43AGrGLRtmA9X5u0e4Q0reGgIM9Z3i22BxqiOFgPz88FPDLEBqgKURo3Z6PZPS/8oRFu7HPImpwYaSsrkhGI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739332774; c=relaxed/simple;
	bh=kH4bxQ+xb4LQ8LzVDbKLM1PSG1uRtcdWBxFyclvhF8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJ2nzyU64QlP40So02okkR0BMrix3ZnOspt9mCn9UUGyQk8C+79lck1Lzn2ZvVBmHHtS+6Kjk8BfKT8JtjRfqfZKdC2ry1oAFDm05h7OsefdXAkQ/mdBK40X57qSvcpGMX/fPXuAkAMp0V0xMLhh7/Si6Xh5cxAnAAoj5EUiHoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WD1P1VVa; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WD1P1VVa"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f49bd087cso86311965ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 19:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739332771; x=1739937571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=F4gOR5bHk8KfCLqhqnrwb8uf7apME1577L9i/Cx1w94=;
        b=WD1P1VVa2ElF5DW8bMDphzLOPCTelzgLgQ3w0Ic/nMYoiCjnv6ZZ02Au2CsImwlLb2
         X4nK0i9z7QY8T2cERZy3KOJmL2z6MTWUWEVztuT6lceQRxiCzRDTal4rYhuObrGsYtB0
         XnSn5GHj+uu7z31/DOoSERrKN8neG419IuPMUKwSJNjbzBT5gcHZTIsIj5ktIkZqSErE
         LUlwPTrkLN/JhqFWcelJI3jxYW97/j3ueiFWfzYo+4BexHTTb17UHXRAWK7dkwL5HRLG
         n8Sn8z6W8RNYoo+OQ+cPFmYZBB+VNatZPAg5huxCpUDiQEjRte8rD4xqoA2lm5Ghie/R
         GV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739332771; x=1739937571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4gOR5bHk8KfCLqhqnrwb8uf7apME1577L9i/Cx1w94=;
        b=TqN7tX9fEcpcfOzY3nFrmNe5sg9wvEix7A1413AXCEFClJNqrn6GsuwoqK74tETzrN
         YMnVhrVzNRGFc5l2ZqDUe+7R1uc9ZH0YGxZVAhRzue1DCarkx8w+JE1Fl7HyXJCUdR5J
         1eKrH08rwu7FmtZd030fCB6xAR6+qwgjbIibopyVR4rByNPf2KX1nuCo3r+hlaaOdxsP
         pAL4Kl4rh6Gqr83PFcWhIqi+IOsQi1W4nkhfy5z8dqqJRM3rQou6BD00OCwEaJZLrTBR
         NfBG2y2eu0Cikkrrt5legDuHp6EDBQoyxZYCvZ8v9B2gxojybqOZzLBI9s4O5E6gpn+J
         IoRg==
X-Gm-Message-State: AOJu0YztFeecDEqV80pOg0+my+poyrdhfCrIEQp6MMBEQjzGIXKQDM8s
	sQTBhla6CFCqiuewP3j43qoptpniHnJ7EvySJTwfp4IP+gIdcODlfv7pUQ==
X-Gm-Gg: ASbGncsfpBEPrZMakRx6Qs2+c/HcajtieJQLmBReUD/dEcIkviUS8jO1Lx8D1u3+3Ie
	SJyPnxpVOnGw4cPr86P3eyGPjyq1krSgRwsLdLTL0kZFglYprivcIfyX33jFjY7taOiQ6SGAaAc
	suRmWYUGA+VutJnKJIlzBzBfJZ9TTuEaUHQLNLuxtb7C8KuDvMGebRmB58q5GosC2ZoKpFSWXRh
	YibYmPKFHqtM4Wm0whtgpMDswI6zEDpPr4OjzXwM76kNcC0AQJe1QiTW6Ua9wILQ18EnujRKu5c
	b7MjmheVpKOl0j51TAf08y79+W8fzBHOnP5JX1tzULxlE0MCt5NaVqizIf7DNmyh
X-Google-Smtp-Source: AGHT+IF82GQN0r5u9D6yoHVTkUXLPBgl2AfCi0ltE/emCuR9KwdoxKN3lkr8ye3y3l9/6m/TUzKVVg==
X-Received: by 2002:a05:6a00:804:b0:730:91fc:f9c4 with SMTP id d2e1a72fcca58-7322c43a997mr2956343b3a.24.1739332770831;
        Tue, 11 Feb 2025 19:59:30 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7309569d5e4sm3841018b3a.162.2025.02.11.19.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 19:59:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <171782b9-d2ce-46cb-baa5-259a55d1252a@roeck-us.net>
Date: Tue, 11 Feb 2025 19:59:28 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] hwmon: (pmbus/core) Report content of CAPABILITY
 register in debugfs
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250211155240.2077464-1-linux@roeck-us.net>
 <20250211155240.2077464-9-linux@roeck-us.net> <Z6wbnoV_Pb0uvTlh@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z6wbnoV_Pb0uvTlh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/11/25 19:55, Tzung-Bi Shih wrote:
> On Tue, Feb 11, 2025 at 07:52:40AM -0800, Guenter Roeck wrote:
>> Report the value of the CAPABILITY register in debugfs if supported.
>> Only check if the register is supported if PMBUS_NO_CAPABILITY
>> is not set.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 

Thanks a lot!

Guenter

