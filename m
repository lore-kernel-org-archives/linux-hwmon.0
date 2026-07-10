Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC634C815
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694043; cv=none; b=RVYVhUshLlrmvwR5hzErZo3FaufZzeo1LMQesa32Wb+3RmJnyuOWEfjL6rfsxsJ+dcO98zg2R6KkMvZca9wrbOWaMbCP1JavS6Di4/QwFz8MTs95tfWPK6xRJUWohTBGtnBfj/oK3W+I4fSjFbQ0opdhtXYNq3ARTzYWZqrmACM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694043; c=relaxed/simple;
	bh=oWnyKNgXT9hQ3hmnVWVhIFPqv2g0D/g9rDjoSziBoPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdmQegS6Lz0Ua++R7lns+JQAPPscFiWfhoti5+hPbDUbOla4xL2Ta0yU2kkn35fbu78m2US1jWItvFKuy9AAUKiCHeCquX1CAR3feSd4GIt0kqMN0hfMFumCeEVXxLLS9Hbov8+PBhTgi+0egIcjgAVD4RgAHHXzDDqAtrs8nBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RghPqUa3; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RghPqUa3"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c89636920a3so543777a12.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 07:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783694042; x=1784298842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++GM9zRsq8EYveZjIz6AUNmZGDynDVzPPgPWTkYnlSE=;
        b=RghPqUa3zHwZrjCq8dzq/oEor2Jvfzv7+I1+B5JUmg+JfGcGRp11gYYpbp2Jr8qCBw
         xof/4wXJNvVPbVUYIwCUhJuHWfv65ShLbpqezE+ShiaB7nfVp6YeAMitdkoNlFyYThxh
         LOq+Eg/tCTyGJ0dPok7bvxRlrn0TKABkxEkyL6mYzwjz4l2K1qedjvnfFVKPTmpv5FO0
         Ol+H1BegV11tu9mhgEJsIhzOK+HHplyB3Jg3DSYg2+LNIemczWI0ZqdX+Zrtfw4fN/O5
         ICDDnnt8Z3P+18o4SY4Th9iHj4j5FA6uHQEr4Ouq93V3m/HC3+H0J1nqsIp5Pb2bus7M
         1FSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783694042; x=1784298842;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=++GM9zRsq8EYveZjIz6AUNmZGDynDVzPPgPWTkYnlSE=;
        b=RO/zAKBHcwa/2C1+95Z+5jlBKqfJUKBw24S0zbHQzzYxBCAM/MDP5Frn/FHa52PHIy
         +3B377TjJeQai8fZT6ReNwWRml1Fm+j6AXmSl4uLtqZGwLgkgkedQhSHAoKsZjpFc0JB
         vZm/Pu0YQbnlLlKrPcxZIAdwj+rjr7nHzmbrRi+U6RPgchwGTQ4E0IsmlgNRhYJ0oq9R
         u0R/2bmlqnhG80sYKHIEWazhbX8aBZCT+f9s3Rb8US+XGxM7yrXY0IjTsSZc1XmU2UQR
         TV0qh12he5AMcoTTNOjnwR7KFncua0Zvow2pNqSvxUPwmbvZOZrvpNuyu7siUOhpkiuw
         9CCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVRxcV8s3AMZ426hoJa5cFPQB1EAUPxjmDTvIA7hOMuM9QVS6xMEKciv/1FZ0wkbm/6+CzS/99pq4Tfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Mf5YtoMNiC7o8h5FqBu81DqYzH/qcAOi+InVhEcIElrnQB2I
	vM4m4weO4YZ33h18vBXZIbbntwXQ8TKVMz85mlf4baklg0CbvUKSftll
X-Gm-Gg: AfdE7ck68JLiQv4HmS16LJaMREx5oO/YNvzdU8IDW9LxtPpISGTOnpI9hCpwcoYOjTP
	ZmQgOek+jHuRY8eRz2HLbiyUi/LCvwdPm7oFFP+YGa08IRNe568xjjZ1WMyS/vZ/iC6tJwgW787
	0KqBVm02s3Pw4CBFRADAuyAg/2gBvt4k0+U4MDyE1hM3PfMRfvM2jshloU1SY48V+UGXeioO0bn
	6DZ666bZ77KZKIqqMQBIfE1j+05wdIjf5LKkkQSr0vWYZhgBeoNtjLtJ4Y6JAo1kZERQhPReWiD
	jQqYoPBAyuJP+uB1U1PncEfCC1rB392xOo0DplMS653DXmMOf+wTg60vRR8IQKrYkkWZcUrxY9+
	nSJohO9q5acuufKfavx9K2UePUhApTGjmBX6XM8wzVz3cYIxlrq0H9o2eOWHFgeCf5C5u4mozH2
	X7JhqE0WfCpLuS3tx1iyeHo3q8+xjDXfxCXUGfgBSLJZN8mdOI6skt5KoOJLqVuQ==
X-Received: by 2002:a05:6a20:c996:b0:39f:2dd0:65d5 with SMTP id adf61e73a8af0-3c0bcb7f203mr14802111637.39.1783694041662;
        Fri, 10 Jul 2026 07:34:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm75482500c88.14.2026.07.10.07.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 07:34:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <48f94b33-5540-4084-a1da-7d5b5c02e415@roeck-us.net>
Date: Fri, 10 Jul 2026 07:33:59 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors) add T_Sensor for ROG STRIX
 X870E-E GAMING WIFI
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
 <20260709204037.1998433-2-eugene.shalygin@gmail.com>
 <ce6bca91-ca18-4764-a268-1429b41fb918@roeck-us.net>
 <CAB95QAQSevPFXHxJ0yGonjXee8-qG2KWUKW5YDT+C4Fuji33qQ@mail.gmail.com>
 <5bb24169-6d8f-4401-8650-2a04bf49a2c5@roeck-us.net>
 <CAB95QAQeLSxETxQCi7A+mwzq+HaceFxzsDuDGzNEuDjdd0jRRg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAB95QAQeLSxETxQCi7A+mwzq+HaceFxzsDuDGzNEuDjdd0jRRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 03:10, Eugene Shalygin wrote:
> Guenter,
> 
> On Fri, 10 Jul 2026 at 11:03, Guenter Roeck <linux@roeck-us.net> wrote:
>> Do you expect me (or anyone else) to be able to deduct that from
>> the patch description above ?
> 
> Would it be OK with you if I simply submit v2 with elaborated
> explanation, and add those blank value to the code later?
> 

Yes.

That makes me wonder, though: Are you sure that the negative temperature sensor
values are not really error codes ?

Thanks,
Guenter

