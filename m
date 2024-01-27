Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22482C6B8
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 17:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706375243; cv=none; b=hIg8lgeAiYL/4VLhrQibZVD8umlHY+BFzaiJJnUXI7m+RwGtxiWq6CRYPnKXeA17hnxiSdMRGXG8z4WD/MleugMzJHmMToyXjvzgdN1KtmVbOImwbET2d51ghvJ2tUwbLCfuSCQCd0zqaFyr4Y4M3VxMt8E2hEC2l7/AMa2OWm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706375243; c=relaxed/simple;
	bh=3jsF2A7RRkNlQnUdS0IVCIMSUulBYCx6a1AA1DTNZs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gVcoiXbtpam68pvEHTMpiAOHaIy8pGGS/SAPJh+R7F84CiOVeUKcaQbokWSjBYIwdyeuKSn7hWJ7XiWN9fwZ4WUQgLCxUklwt8EzMwtKirmALXk+2q0ePlX5mkNFxz0BF0fLjLTd9PHFZHIozFhYj+snefYL4vX7y5gVoqvXuo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxsepOFm; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxsepOFm"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33ae3cc8a6aso528371f8f.2
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 09:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706375240; x=1706980040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EjOge2q1fldX07fj+kE61mHXSlCQ8kO8UwNfEi9WJ6w=;
        b=jxsepOFmqXTe5ZtkA6K3AALw0AtR4jsUVqX8+If9eONGcpVNsn5fmggU0IDU3KSXq/
         LuSNCbIuOk++REvxF/7qvhtIRKLhDByT2STw9EU8KmWUxxLHc4sPMhFKsNM8qXkQ02Ja
         rZcXKmhTVHk7VJoNvDDwuMNmQxBpkERqRZ6HhrKt+bB4QMooDGMEY6Ml+w+Zi9AvWafd
         +fZrs7c6yOrgZn3b4xnbz6Mj5ryhx0gBc4qZfoiu7wR8q6VSMlc7WKiTFX6xhjnwY5NK
         Y0hGRAJz20ST9SZjW0cR7qpQHPL0h+imSWcfQo+dTmgrPiT4NYlerXbRpiXe+9qDgCQ0
         JuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706375240; x=1706980040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjOge2q1fldX07fj+kE61mHXSlCQ8kO8UwNfEi9WJ6w=;
        b=MBjt2kPerZwsTVWPuHMeSSCUE8hHsH8bB1qqf1G+J8Sbi0NsUMs+zmEZHqV/OxC9QC
         8dZU/0ibFHlBDGIlglCY2DCYb4yhCzBJ3NZaZgec4VgbxXDo2aQSwZaPu3vM7PGQB+43
         jbQq9IA033uNNzhRWKULaPgtkBQ/G8suhOav3gieLPL8AMQwRm+NgxX25Vab5N0w0VBo
         S0aW9mcdsFTvsW0gChDPi73b4APlxka/haM9reslsunJsZ+7NoUxXbfpfk/QAQD9tq0A
         VO0PnNgy7Hk65+QOEyrJhehStl8CPrcJIl0AXjoJScsqOO22ck/1ASmd+HUU19Nv0gmp
         sDXQ==
X-Gm-Message-State: AOJu0Ywqc9yHeTjkwcV+14IRr2fPNT2BZeKxFS74b2zbZF9zOwOLck7E
	z1Nw74a98ZpHWwCWiQl1ORAhyfOrNdWcov8qNcHadEsGy8pHSXjy
X-Google-Smtp-Source: AGHT+IFQHN1Mron4NhMxZNELngGnGpQNZWyLVdzbxnNdvYNuUMUpwDEM/BFXquEMYBfpLaII0h67Zg==
X-Received: by 2002:adf:f802:0:b0:33a:de63:8a1b with SMTP id s2-20020adff802000000b0033ade638a1bmr1474383wrp.21.1706375239572;
        Sat, 27 Jan 2024 09:07:19 -0800 (PST)
Received: from ?IPV6:2a01:c23:b938:5400:11ba:857c:4df8:38b0? (dynamic-2a01-0c23-b938-5400-11ba-857c-4df8-38b0.c23.pool.telefonica.de. [2a01:c23:b938:5400:11ba:857c:4df8:38b0])
        by smtp.googlemail.com with ESMTPSA id i13-20020a05600c354d00b0040e45799541sm9041400wmq.15.2024.01.27.09.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 09:07:19 -0800 (PST)
Message-ID: <8140e7dd-179f-4a4f-bac1-f67930b0f05d@gmail.com>
Date: Sat, 27 Jan 2024 18:07:18 +0100
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
To: Guenter Roeck <linux@roeck-us.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
References: <75747c6a-d414-4b07-8f66-5a5cdddc3c36@gmail.com>
 <a15701d4-d786-49b1-9ce2-894dff508679@roeck-us.net>
 <02ab295e-0b2c-41b4-8376-569744b0ad3a@gmail.com>
 <e13f467e-d452-48f5-9bee-2e675ac8157f@roeck-us.net>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <e13f467e-d452-48f5-9bee-2e675ac8157f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.01.2024 17:37, Guenter Roeck wrote:
> On 1/27/24 08:12, Heiner Kallweit wrote:
>> On 27.01.2024 17:01, Guenter Roeck wrote:
>>> On 1/27/24 07:02, Heiner Kallweit wrote:
>>>> Class-based I2C probing requires detect() and address_list to be
>>>> set in the I2C client driver, see checks in i2c_detect().
>>>> It's misleading to declare I2C_CLASS_HWMON support if this
>>>> precondition isn't met.
>>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>> ---
>>>>    drivers/hwmon/adm1177.c       | 1 -
>>>>    drivers/hwmon/ds1621.c        | 1 -
>>>>    drivers/hwmon/ds620.c         | 1 -
>>>>    drivers/hwmon/ina209.c        | 1 -
>>>>    drivers/hwmon/ina238.c        | 1 -
>>>>    drivers/hwmon/max127.c        | 1 -
>>>>    drivers/hwmon/max31760.c      | 1 -
>>>>    drivers/hwmon/max31790.c      | 1 -
>>>>    drivers/hwmon/max31827.c      | 1 -
>>>>    drivers/hwmon/max6621.c       | 1 -
>>>>    drivers/hwmon/max6697.c       | 1 -
>>>>    drivers/hwmon/occ/p8_i2c.c    | 1 -
>>>>    drivers/hwmon/pmbus/ir36021.c | 1 -
>>>>    drivers/hwmon/powr1220.c      | 1 -
>>>>    drivers/hwmon/sbrmi.c         | 1 -
>>>>    drivers/hwmon/sbtsi_temp.c    | 1 -
>>>>    drivers/hwmon/w83773g.c       | 1 -
>>>
>>> Follow-up question: You did not drop the class from drivers/hwmon/adt7410.c
>>> and drivers/hwmon/emc2305.c. Is that because of the address_list in those
>>> drivers ?
>>>
>> Yes. If address_list is set, this shows a certain intention to support
>> I2C class-based probing. Then the question is whether adding the missing
>> detect() implementation may be the more appropriate action.
>>
> 
> My understanding is that class based auto-detection is in the process of
> being phased out. With that in mind, it would not make much sense to add
> it to existing drivers. Anyone trying to add it now would have to explain
> why it is suddenly needed but wasn't needed before. I think that train
> has left the station.
> 
Good, then I'll send a patch for these two drivers too.

> On top of that, at least for adt7410/adt7420, I don't see a reliable means
> to auto-detect those chips. Trying to do so for a 10+ year old driver would
> only add (lots of) risk for little if any gain.
> 
> Those two drivers actually claim in their documentation that the address
> ranges would be scanned. That should be dropped as well since it does not match
> reality.
> 
For emc2305 that's right. Documentation/hwmon/adt7410.rst however states
"Addresses scanned: None", so here I wouldn't see a need for a change.

> Thanks,
> Guenter
> 
Heiner

