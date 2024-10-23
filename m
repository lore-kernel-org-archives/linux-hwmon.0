Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4861C830E
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Oct 2024 15:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729698607; cv=none; b=nsTHvFyhOsQmUzzh/jYb0TSWdqSIakCn1x1Uit+YDKbFoBuFWTjPha9ZKXo37I5kqT8PCR2L6qv8jZNAT1RM2R7n8XOwHOO2Ow9wD950ToEPo+umCEDAF5OrM4QKEG73CfFvB4Gzk1E23xSURuichfuuidSIi4M3eA3+0jUDkSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729698607; c=relaxed/simple;
	bh=qJAqQL53I9JhU1//pGmBr6zzJ8utCrFA84/MJJnK7d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCvR4mRsIp4Gi6fxVK4ydAxRzo6KieBOVbJjJqID5kCatHtqGUAbZp292x9NmU4X3Tvr7soi/pFFP0jqgqF6CAR4VaK6Ksz3gGhjakH0lv/nNLtOhWpOH0YMxGWd4fph+06RLgoJhWukUREc8l+WXgpp/Y9e5wWo/Czt1IeEb+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+AzavUm; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+AzavUm"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7163489149eso5341816a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Oct 2024 08:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729698605; x=1730303405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=F6djbOMjor+RzU8DgIL8LPehBCXnBkpUOZQCXxYrXR0=;
        b=S+AzavUm4joXvOs3NPreQVlQMfm7cA7buISuPR6PuFRwvGYMtgtyHVpfdSrfPiGN+M
         50YOny29r5acTZz4fhNqPANr32VjW4WQPQpR+/EeIuAxnAR9erDCXoPkrKBZNPtziX2q
         REggjP0lgal1MjTtLRbgNFXcGIFq3AWfRBus14awgJchx9IDNuwn/l/lyWRu5JJ48P+m
         oRq0vSMMAQAGDekecWBBtgHXia/VF7C3t0yeWeMowZprYvh6iKwltlFS57TEE8m3NvSB
         9b8rIKnmCoBGC2BYzh4X1I8AuWbjlFhwuYO+RD6c27FJfJiLU3vfj+GygAv7zobe8ihQ
         UuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729698605; x=1730303405;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6djbOMjor+RzU8DgIL8LPehBCXnBkpUOZQCXxYrXR0=;
        b=cY01Vu9FvZr9njV5fNtN01AHmFIisNUjAHoEzSNWRk5JWaJGQUP/cVz7naVGuELWon
         knPmuU0QsxkAjp69R4hbAAHg9ZAblKmY86OHqqJ7NSGg5cIOyKEMoRzhDuov+9fXeB5g
         Dx3REPVIx09jZJGOdbG741vbnC4Rf7bqWhwQhGONZQX1Zn2yEG4riGQ1sLwZxrfK61qr
         gp8bffxweUItsIaYZpVlXsm3I5SMWAcOlNgWjiXxAzWV1QIS2nU9bbpgPv+3dbRHVvfv
         IoeP3GHbK3ZJnCMSu1fPz3NLrOCipxQK9p2FINzdAq8j+nJ6mOO0knrG5v5iisLCfLyA
         RvKg==
X-Forwarded-Encrypted: i=1; AJvYcCVcACLUwGMRSJGmf6OSLg1HJRUiei27SjvATOryEDkkVdrh64ZGBVyWAqozYcdpFYzaZxUGkfqe2DO0aA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyve8Frs0Spo1KPZb76x8X/+omCQlfsjz+MJJLwUIpGpR7vutF2
	qCmDZp6gHavodED6kZ7KTEw2DD6Jdhll1LMgNGs1zlawP1gS/ESf
X-Google-Smtp-Source: AGHT+IEwa/C1vOiK/y4fMKbNZNfA6HMeH/GaQTDYv/Se2HZ9z0UsqCD9OqAC6B8/hqHZYYq/K9vR9w==
X-Received: by 2002:a05:6a21:1690:b0:1d8:b81c:4e10 with SMTP id adf61e73a8af0-1d978ba05e2mr3669311637.38.1729698604612;
        Wed, 23 Oct 2024 08:50:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13ea197sm6483523b3a.163.2024.10.23.08.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 08:50:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6f8eba9b-0f3e-49f2-9cff-140037318f96@roeck-us.net>
Date: Wed, 23 Oct 2024 08:50:02 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (pwm-fan) add option to leave fan on shutdown
To: Rob Herring <robh+dt@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20210923023448.4190-1-akinobu.mita@gmail.com>
 <20211011143421.GA2374570@roeck-us.net>
 <D056E665-7386-42E0-8A16-383B66FA3179@aspeedtech.com>
 <OSQPR06MB7252105381A0A3E8E7B80F6F8B4D2@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAL_Jsq+yvRXAfZtVXHJjVZPd+n0x9E=KWyX6-+-M9OC_NJfBew@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAL_Jsq+yvRXAfZtVXHJjVZPd+n0x9E=KWyX6-+-M9OC_NJfBew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/23/24 08:24, Rob Herring wrote:
> On Wed, Oct 23, 2024 at 1:08 AM Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>>
>> Hi All,
>>
>> I found that these patches have been rejected.
> 
> Where did that happen?
> 

https://patchwork.kernel.org/project/linux-hwmon/patch/20210923023448.4190-1-akinobu.mita@gmail.com/

It has been a long time, but from the available history I guess I marked
it as rejected because the DT patch was never approved. That is just a
guess, though; I really don't remember.

Guenter

>> Is there any other reason why it can't be merged into the mainline?
> 
> I don't see any replies on the binding. Perhaps that's because it
> wasn't sent to the DT list and it doesn't get reviewed if not. In any
> case, lots has changed in 3 years such as we have a fan binding now.
> 
> Rob

