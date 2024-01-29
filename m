Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A5455E51
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jan 2024 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706521911; cv=none; b=Jn7v/1mmx1hpuiJ0pdvO/8tUXn1msWis7IpFY9IVXyYjcSnWXd7vyvydT9wmik/0G5Kv5QzHVn6ZYvHGa2S5fLmiE6iO3NnUYAnmOTYJ1c2c0+pMb8WL47w8AKBdannxE8u6dMF4340VTKrCnrmYsYO3WXTqJG8z4vLOguvNQ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706521911; c=relaxed/simple;
	bh=Kx7mrgdwoHFpWZ8SYJT2vW0sGZS22SMPoN7bzCI9ifc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ko75DNxnrqgTTiG+vLDlRaJ4Aoqlg7o+0VsUZFtzFdRwFCjm//O3uaOW7gxcACOMup8Nb3iqrtVJp1vegJxVX97TxHiO3AhxnDyGqFi5KskbuwcZTVYISGme/md/HtGC0Ee7EfgyLL4VJrDLzonenz1MtOMRACRnOEhCN5Wet9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBzup1t1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBzup1t1"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33ae5e7d787so1266129f8f.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jan 2024 01:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706521908; x=1707126708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5b0z8dTheGyz4/sh6F8OA73vxfxOVOm0JjrC5HdCdxQ=;
        b=IBzup1t1XfY3ieRN6NvlMlj9/rtA/wznrkdCRfp3teJ9+BbRsNzQo0oByMDzNOTnU5
         QrgcZb/gsO/CNGD1eJi+7XHJyeytIypoQmAslacGBcLcnE3XQP8UpVsE4g9FsSy+T/JM
         NfRrMfvT2c8AhG0wqyhr7t3aGEFiN7orVwc0uuPsQyCHZGzIMcZODFqkdijUJNdRNaKt
         WhK/g5IehjOcMLAkbvKPy7fs3ySswe0ToKfwAkZi5ES5NgeKg5sfhqyOD+6x7HXnSwKt
         jXQiUTWP4Kfm7JCtRehvLJdsU1qTjgx6eBBB3f8Q+Sf12dEG/EpG1vlZOKcs7Zak9aI4
         63og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706521908; x=1707126708;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5b0z8dTheGyz4/sh6F8OA73vxfxOVOm0JjrC5HdCdxQ=;
        b=CpmUJX8qSQGUkX/7JzGm4DIbUsy3zhqye+mw97WJekbhFdW8oO030IQDkPjegY6c3j
         l1CO7iADRB8EdXr4IQUWDuaZwIDY2V/Humi7seoAYtfI0UryXJl5J36YvyTFzKeXBChp
         ZZgzabOmNdb0M/v0c6zYOV2KBDUWGmuULbN/TPyABjxaj69ggJaXe1yR3b7mHYHRmOpu
         lkzs1nOKqoclA9wfIBTHsXf+wlGdzI1r0r6+y8SdWX5TSdOyv6sqA0LowKOBCmDbu9eJ
         9pAQK+C0wIgVELgXB8QZiGg8trwt3hNep/4yfqorZL6cNWrM0dz6d2rfTAWzO+dPrbP0
         Zdpw==
X-Gm-Message-State: AOJu0YwBL105MJnWGsmDRbzu4RLRw9lEnn/a8aV+hn5WjE1XmF2Q157Z
	+v3RBdjvT+D34hL1GvMx6mazOWsqSJOUamO5SrObg5IzyIg8LuvL
X-Google-Smtp-Source: AGHT+IHr1LVWfNKu4Em/ceLCqsg6QAigyM4KCVJQQlhw1t3+ZlLS0DsSTR3TsuL0eiQ4sz3eDGvkLg==
X-Received: by 2002:adf:d1cf:0:b0:33a:ed61:b043 with SMTP id b15-20020adfd1cf000000b0033aed61b043mr2091969wrd.44.1706521907886;
        Mon, 29 Jan 2024 01:51:47 -0800 (PST)
Received: from ?IPV6:2a01:c22:7314:6100:6024:4c94:48b5:a1d8? (dynamic-2a01-0c22-7314-6100-6024-4c94-48b5-a1d8.c22.pool.telefonica.de. [2a01:c22:7314:6100:6024:4c94:48b5:a1d8])
        by smtp.googlemail.com with ESMTPSA id l13-20020adff48d000000b00338a3325331sm7619900wro.69.2024.01.29.01.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 01:51:47 -0800 (PST)
Message-ID: <947d6b95-63fa-4695-a26f-932c5e5fc060@gmail.com>
Date: Mon, 29 Jan 2024 10:51:47 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Remove I2C_CLASS_HWMON from drivers w/o detect()
 and address_list
To: "Hennerich, Michael" <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "Sa, Nuno" <Nuno.Sa@analog.com>
References: <75747c6a-d414-4b07-8f66-5a5cdddc3c36@gmail.com>
 <60283451-7e83-48da-9f70-b4bb327ae8cf@gmail.com>
 <CO3PR03MB6774E72E555582B03BCB8D1D8E7E2@CO3PR03MB6774.namprd03.prod.outlook.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <CO3PR03MB6774E72E555582B03BCB8D1D8E7E2@CO3PR03MB6774.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.01.2024 08:40, Hennerich, Michael wrote:
> 
>> -----Original Message-----
>> From: Heiner Kallweit <hkallweit1@gmail.com>
>> Sent: Samstag, 27. Januar 2024 16:11
>> To: Hennerich, Michael <Michael.Hennerich@analog.com>; Jean Delvare
>> <jdelvare@suse.com>; Guenter Roeck <linux@roeck-us.net>
>> Cc: linux-hwmon@vger.kernel.org
>> Subject: Re: [PATCH] hwmon: Remove I2C_CLASS_HWMON from drivers w/o
>> detect() and address_list
>>
>>
>> On 27.01.2024 16:02, Heiner Kallweit wrote:
>>> Class-based I2C probing requires detect() and address_list to be set
>>> in the I2C client driver, see checks in i2c_detect().
>>> It's misleading to declare I2C_CLASS_HWMON support if this
>>> precondition isn't met.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>>  drivers/hwmon/adm1177.c       | 1 -
>>>  drivers/hwmon/ds1621.c        | 1 -
>>>  drivers/hwmon/ds620.c         | 1 -
>>>  drivers/hwmon/ina209.c        | 1 -
>>>  drivers/hwmon/ina238.c        | 1 -
>>>  drivers/hwmon/max127.c        | 1 -
>>>  drivers/hwmon/max31760.c      | 1 -
>>>  drivers/hwmon/max31790.c      | 1 -
>>>  drivers/hwmon/max31827.c      | 1 -
>>>  drivers/hwmon/max6621.c       | 1 -
>>>  drivers/hwmon/max6697.c       | 1 -
>>>  drivers/hwmon/occ/p8_i2c.c    | 1 -
>>>  drivers/hwmon/pmbus/ir36021.c | 1 -
>>>  drivers/hwmon/powr1220.c      | 1 -
>>>  drivers/hwmon/sbrmi.c         | 1 -
>>>  drivers/hwmon/sbtsi_temp.c    | 1 -
>>>  drivers/hwmon/w83773g.c       | 1 -
>>>  17 files changed, 17 deletions(-)
>>>
>>
>> It seems MAINTAINERS needs to be updated.
>>
>> Daniel Matyas (daniel.matyas@analog.com) The email address you entered
>> couldn't be found. Please check the recipient's email address and try to
>> resend the message. If the problem continues, please contact your email
>> admin.
>>
>> Ibrahim Tilki (Ibrahim.Tilki@analog.com) The email address you entered
>> couldn't be found. Please check the recipient's email address and try to
>> resend the message. If the problem continues, please contact your email
>> admin.
> 
> Right - thanks for pointing out.
> We'll send a MAINTAINERS patch shortly.
> 
Günter did that on your behalf already:
linux-next: 10e70ab10802 ("MAINTAINERS: Drop entries for hwmon devices with unreachable maintainers")

> -Michael
> 
Heiner

