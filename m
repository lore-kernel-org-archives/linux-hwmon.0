Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE4469DE5
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 22:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708554143; cv=none; b=QfSftdQlpo8XOdU245aHQGzN2QeNPKb1OKx6ABihuZQ2Zi6VV+L+u3qW2CPp/JhsNhB9F64aESANIBxUJeS0OayWwJ9ydoZklIjHkkB5fhCN/YiQDLeq71CLdYOC3lUYWOXZWwpxBWDyYQ5iUA0OcZuQCtGyoBBJNdqE/Ze+Q9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708554143; c=relaxed/simple;
	bh=xgoSZxBoTyr14ctpX9PyUiVGyYO5/hdeSg7H91HvxzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HeUXOvYHEU0GOW077e6erv8FH1NxfWwI+O/2Ev3+41iZ5Ky6t8sN5vWLKSHCi65nkpGBCRazyRR+7MWYl87t5rSK4hnejjmwHkPG69x5HhygjaUHC135+KPkjMp3wWS8TqxBKGDGgh5yLADri+Pyj5r9n2FOUTvLsThbtxe8Uj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdZq8gKf; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdZq8gKf"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c02b993a5aso4379679b6e.1
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 14:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708554140; x=1709158940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vQBkqTp9TEZNdbYRsqkKLMJxx9MJK7SVCJl0ma3arvU=;
        b=cdZq8gKfqd2ulh2Lz3yDd1y3ldztpWm2HEdng0w9vfA6SS0HR/WiKQBuIF8qPNh41d
         5TRQgdkmhpNIxZUDSZQ7ZuNHK6yoWbpDY58pxxxf9Ph44KTY77QrzUnYS+4tyQbXFPP6
         8xJ2jCvK4aF92HvdETXcXhPGF0qvrYbR0BqmY0pVBTf2vVS//1ihKycMGuSQGgUqk4VE
         PhE5opHt2qrbWpuFOozomK0wpQlFAxQOLjaNNInnfAER2nm+dnmQ7F3KyQCBtvzRErCT
         y2nDmH2xYH92IOaNxyEaHhGMBTQFHjP14iKLkRlQfd82T+8owNr2ckSwDvHH77DlHqx0
         MZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708554140; x=1709158940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQBkqTp9TEZNdbYRsqkKLMJxx9MJK7SVCJl0ma3arvU=;
        b=n8XBKWCthbJhoh4tNRYjyzL9ccpYJZlO004h+U9nyUCaF2JJd2ul6yGNG0bBq80LYU
         GWvvfLRagI9eP4PkKgYUOSy/V2398KzO6CvqJgpB4ULQ1ejMVoPz+ZAMo/k1smABYrJH
         n95ADOkrFBtWGTfXik9zVo6GIziE8yDCBd5GQx3beuN78jUC68F9dVFbRQ04OGaDZFns
         evVk2nl5Mfy3SLUVVCLyHrYn11y5WfrV/AuPdOfxr0wbQHkGGq07jES0biPRS8Phf4Q6
         xjFbG+QYj8acsZMxpA03+vk+YDXuRJG8gjikVXqdgC7Ghf+N/UBe0GIWEp7v5X1PR9HN
         JceQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMeu80a+itMgG68zESHKkApUgbChCJCZO8EPJy4OxAPRXQbsV81mBMAeSniXzhjunEdauyU3PgkOm9u6stmXoQ/GLIxitBTrsrhrs=
X-Gm-Message-State: AOJu0YxAhWcyxHZOU+Im9961Mv0dKL/j1pG5REeenDAEw7JqptNGRMVr
	O0Ci08euFGeRT2Dii9h/0vMVSy+WAWwtm7OvocKtEzwsOpGj/UHR
X-Google-Smtp-Source: AGHT+IG7WgKSY91Rqp4jrzVRTtMZh401mPDILPVfiJ+DOoBs06IqXjoWA9ngLSUtJgfqXlI4mXRzAg==
X-Received: by 2002:a05:6808:d49:b0:3c1:5a43:817c with SMTP id w9-20020a0568080d4900b003c15a43817cmr11809131oik.15.1708554140618;
        Wed, 21 Feb 2024 14:22:20 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b4-20020a62cf04000000b006e4701c0aedsm5703379pfg.213.2024.02.21.14.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 14:22:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b29177ac-b9fe-4ab8-8725-4edf3fffe8f8@roeck-us.net>
Date: Wed, 21 Feb 2024 14:22:18 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nct6775: Fix access to temperature configuration
 registers
Content-Language: en-US
To: Ahmad Khalifa <ahmad@khalifa.ws>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Erhard Furtner <erhard_f@mailbox.org>
References: <20240221141345.2231350-1-linux@roeck-us.net>
 <bb7eab62-6f83-49af-8ac4-516a991b99bd@khalifa.ws>
 <934b2230-e44c-4332-99c5-71dc64f7a185@roeck-us.net>
 <da0d203a-e22c-472e-856e-18a31a8231dc@khalifa.ws>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <da0d203a-e22c-472e-856e-18a31a8231dc@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/21/24 14:12, Ahmad Khalifa wrote:
> On 21/02/2024 21:59, Guenter Roeck wrote:
>>> Tiny note, i is in the range of 0..7 on nct6798/nct6799 if I
>>> follow correctly? Still 8 > 2, well caught.
>>>
>> Sorry, I don't understand your comment. Yes, i is in the range of 0..7 on
>> nct6798/nct6799, which triggers the failure if i >= 2 because the code uses
>> the NCT6779_REG_TEMP_CONFIG array to identify configuration registers,
>> and that array only has two entries.
> 
> Ok, I think I was following correctly, just thrown off by the comment
> on the bug report thread about i being 0..11:
>> The range of "i" is 0..11, and the size of the reg_temp_config[] array is 2. Oops.

Ah, ok. I should have said "the possible range..."

Guenter

