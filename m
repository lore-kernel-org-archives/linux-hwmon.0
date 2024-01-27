Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BDB2C86A
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706373480; cv=none; b=PN+xHEe9N0jeP+zm0+e6a5DJ5n0ks4H5vdk6+32PScE5IKaL9JFM3qs8DH0Nzmx083A1nOoadOL712I6awYnwnjnLBoo2zqhYwZQNxx/AE+ZXrcYumx3wZqJmMmXa+DB+YoXN228EKxIpD6I+Aa9v6J7x11/2wC1L7BDn9523lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706373480; c=relaxed/simple;
	bh=HV9zSslMUtvzMGRcX2dqpmGsuyijtHdwTpxTb+TjEnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrLH8WG4VfTppQ85UfiefOf4Qj/Wz+D/ML7mfVOeDDEvnGhhKhBCvGNTbB2dzAZUNsH4qhgRa+wCG4Ca+2TbQ3JjtF/08dBFZZyLy+f69kh8NEE5nyvGr1XF3DwQJsIvCus1FKiRT1uVlsxrvMHH2RP9MJrpzbUKyggQtTEGwBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qzw+FHJO; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qzw+FHJO"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d7858a469aso8778465ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 08:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706373478; x=1706978278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0KCPCDrZzDh6V1Ex5IOKeE+hDLc+givC1HZARlXekFg=;
        b=Qzw+FHJOH99Fm1V4qDvfci4XpWDH+nQ78bOyOQAJku/hqPbU3QhipqYI4eHnjDjOnh
         92Nqzz/5HiqtrWTxTBugdfO+gWIXzr6jNUDgjLLM7anHBhfuR/9TIOqjtJkSaqvZBXiS
         gGVIkQETIVlDkjFLQLLWc/CCx352xEySBd+0XC0wBOdA4/RLjTPYudsf5xVMyMofPVD7
         oR7ZCf7D/50knFbitQuukHFDzaMv/mQ0U36oOBSnoX8BU/fKildTnBhSOeufqzXFacWT
         fohRs4i5B3qLf/CqUh8DO+MYoUv16OCu2kqtgLlxewp8bdfzehfP9XRFx2ab8ZjAh+rQ
         jE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706373478; x=1706978278;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KCPCDrZzDh6V1Ex5IOKeE+hDLc+givC1HZARlXekFg=;
        b=ZfpY+ZE6hIq4KvMZHMlJyzr6+7/I0aERZsiweLJD5E14smvJsQo9NZ57gMKLaor+2P
         pKPPQP50UITlgxDZSCv11vUdTMWM4tqaHsvV4o7cuF2svpGwO5HfZznorFUZPH6dG92b
         /dtO4MYcqk8m63gDJqLJ/MwW6sEc9RmWLcJSgV/Eu1vk0r1EOTNa4uBSuczAkk6EhuSD
         ugondI99MgEJuRZFHc7U0p8q6+0iZVZY4ZC7w0sCcfPgg/nakZwPPTtV/PRB06U5hb4F
         cp+XbHUok6E5rFItRBjHt0KZcDlChSMFYJVCmgn6mTvWWIJOAmQz1HzWa8y4ArKHVjS2
         tIYQ==
X-Gm-Message-State: AOJu0YzPVSQ5+ov5QrkHo69KWiUyaV7e5Nok0Vh6620PDzhKbGFJr5SH
	xuR5STgf83Ph/TPN3Vr8jUgZWWx+aPsF2h2g691ro/jszc2aPSGQ
X-Google-Smtp-Source: AGHT+IHuSzmq85sVupz7GljsTm6oouAWmHIxaPOWYbNDOA/AKN2l9SpSPS9hkOevBm8sWzhriXn1GA==
X-Received: by 2002:a17:902:ecc5:b0:1d6:f4d7:ed13 with SMTP id a5-20020a170902ecc500b001d6f4d7ed13mr1067385plh.83.1706373478288;
        Sat, 27 Jan 2024 08:37:58 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902e04900b001d6ee9d8957sm2635935plx.281.2024.01.27.08.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 08:37:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e13f467e-d452-48f5-9bee-2e675ac8157f@roeck-us.net>
Date: Sat, 27 Jan 2024 08:37:56 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Remove I2C_CLASS_HWMON from drivers w/o detect()
 and address_list
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
References: <75747c6a-d414-4b07-8f66-5a5cdddc3c36@gmail.com>
 <a15701d4-d786-49b1-9ce2-894dff508679@roeck-us.net>
 <02ab295e-0b2c-41b4-8376-569744b0ad3a@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <02ab295e-0b2c-41b4-8376-569744b0ad3a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/27/24 08:12, Heiner Kallweit wrote:
> On 27.01.2024 17:01, Guenter Roeck wrote:
>> On 1/27/24 07:02, Heiner Kallweit wrote:
>>> Class-based I2C probing requires detect() and address_list to be
>>> set in the I2C client driver, see checks in i2c_detect().
>>> It's misleading to declare I2C_CLASS_HWMON support if this
>>> precondition isn't met.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>>    drivers/hwmon/adm1177.c       | 1 -
>>>    drivers/hwmon/ds1621.c        | 1 -
>>>    drivers/hwmon/ds620.c         | 1 -
>>>    drivers/hwmon/ina209.c        | 1 -
>>>    drivers/hwmon/ina238.c        | 1 -
>>>    drivers/hwmon/max127.c        | 1 -
>>>    drivers/hwmon/max31760.c      | 1 -
>>>    drivers/hwmon/max31790.c      | 1 -
>>>    drivers/hwmon/max31827.c      | 1 -
>>>    drivers/hwmon/max6621.c       | 1 -
>>>    drivers/hwmon/max6697.c       | 1 -
>>>    drivers/hwmon/occ/p8_i2c.c    | 1 -
>>>    drivers/hwmon/pmbus/ir36021.c | 1 -
>>>    drivers/hwmon/powr1220.c      | 1 -
>>>    drivers/hwmon/sbrmi.c         | 1 -
>>>    drivers/hwmon/sbtsi_temp.c    | 1 -
>>>    drivers/hwmon/w83773g.c       | 1 -
>>
>> Follow-up question: You did not drop the class from drivers/hwmon/adt7410.c
>> and drivers/hwmon/emc2305.c. Is that because of the address_list in those
>> drivers ?
>>
> Yes. If address_list is set, this shows a certain intention to support
> I2C class-based probing. Then the question is whether adding the missing
> detect() implementation may be the more appropriate action.
> 

My understanding is that class based auto-detection is in the process of
being phased out. With that in mind, it would not make much sense to add
it to existing drivers. Anyone trying to add it now would have to explain
why it is suddenly needed but wasn't needed before. I think that train
has left the station.

On top of that, at least for adt7410/adt7420, I don't see a reliable means
to auto-detect those chips. Trying to do so for a 10+ year old driver would
only add (lots of) risk for little if any gain.

Those two drivers actually claim in their documentation that the address
ranges would be scanned. That should be dropped as well since it does not match
reality.

Thanks,
Guenter

