Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2751B5EC9
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 16:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724950619; cv=none; b=JUMgkiQawBueU8MChVcLfmYpTsiTmzEeLI8lXsWfEiMSSLVcYjKRT2QliUPGwyP5eVIncSKfE9N5gKxeTeVn6+IvtFbaIDGms2QKVn2l3AlQUNoERM/oaxdDj57toCEWTF0LdxQxnXfX+b7TW7hcel/8408E5+OhLraJHA/reyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724950619; c=relaxed/simple;
	bh=Nfw7i2GWs7Qclr8VK7ccfi4LSRUBxYSI9pF84T6R8+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EXlM88oaZmMJyfg99Lk+FeUj5h0RyrmJS1aq1v+DgDaficZ2E1Z9b1Lzb3vHMnIhbnpIcwuaRx2TQSSEy4r/FvpZdSM9nkMi4bhphHzoZ+EOXnz7seW4lYD9SE2EnNAv+Sp63nvG6lSGj9W2pcFjiwj4qPR+Iw7S/bAHEqwEc+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVY3r9oz; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVY3r9oz"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7cd8d2731d1so558223a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 09:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724950617; x=1725555417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mGhjBHUbMqTCklhWmusGEbbm4vSthlUEfHo+a3GrpaI=;
        b=FVY3r9ozX7uazLlcR2cQjUmg0xKHnRYaZz2c9/lBym1Lw2gbC4O06AM0ON9g/CznHC
         Y/R4G23Iol5VoxKYDomr0miyb+tR0yWO+Os/A42YFDchxMsyw5ELq5Tz905zoQA18Eyt
         rNb0H8RtWKoMeV2qUeAF6Ix/xZsMAcZdUckpxTc12G3rAL2lfIDM0CPQGZPJh4oCOkke
         2Zdfs5N3TxuicXpfrlvV1dgNA5Z+wh2w7eK3cImVlt9mtRDB+/NcZ03yJ8jSvyYdhyLL
         vMyhabWJt4AcqucaKhk3TKWRJoDIePUckjBoD4xPlBrcbvRYb0BrLaI+t/ggjg1m6y6P
         h5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724950617; x=1725555417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGhjBHUbMqTCklhWmusGEbbm4vSthlUEfHo+a3GrpaI=;
        b=gV6jM9jbvyOF4GCnKvY8kV2Y1HIPwsTIqbrz3uS4UycbF8zLpVwtOpj46U7Pk7PXCF
         God+Pt8TCZHpXCH4+xS/1Aw4woBhBkejO8RL+zXM/G0+q6orwbobsJl/LHWjDCVbcCV5
         wIsE2DhrrubYl+jMt86BW7R6B8MowWZDA0O45xeED8PwYB/n9Ydq+qhDawc3hwtWIDZ5
         VvO+VyWt65UikNXpcgj1mG0wn0ix9MxB5vIYHuvhx5YiPmaWTn5Giy+ke/pKqbjHVl0z
         UwT8QbvDOrpkD3eQWz5Dz9oMNUZ7R/dKR28rmRhNdGxs9zo7HzoEngvyKcPoXLG44cUA
         MVhw==
X-Gm-Message-State: AOJu0YxbKJCje3r/WXZGUCTlmQdPmN2P/03fdA0vgyd2PO9+cyzWlKf3
	VQyvAZi+5IU+7fx0F3TTzw0BIiHYegnxNjmfV9tNJt+DLXXfVIALvavePg==
X-Google-Smtp-Source: AGHT+IHbgJIN51T0OVQhSEyDma5ffkmkTuRDEd3WTNgMlevdceLuCCQ5hdjFQIn1wgc4/xFg0zhtDw==
X-Received: by 2002:a17:90b:388b:b0:2d3:b976:e304 with SMTP id 98e67ed59e1d1-2d8564e3842mr3490314a91.41.1724950617251;
        Thu, 29 Aug 2024 09:56:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8446f3b1csm4410370a91.54.2024.08.29.09.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 09:56:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fbecb1e5-32f2-4d74-95c5-ef7b2c2dd5c4@roeck-us.net>
Date: Thu, 29 Aug 2024 09:56:55 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] hwmon: (ina2xx) Fix various overflow issues
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-9-linux@roeck-us.net>
 <ZtCLy9Y20v2lxwqw@tzungbi-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZtCLy9Y20v2lxwqw@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 07:55, Tzung-Bi Shih wrote:
> On Tue, Aug 27, 2024 at 08:34:52AM -0700, Guenter Roeck wrote:
>> @@ -301,8 +307,8 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
>>   		val = DIV_ROUND_CLOSEST((s16)regval, data->config->shunt_div);
>>   		break;
>>   	case INA2XX_BUS_VOLTAGE:
>> -		val = (regval >> data->config->bus_voltage_shift)
>> -		  * data->config->bus_voltage_lsb;
>> +		val = (regval >> data->config->bus_voltage_shift) *
>> +		  data->config->bus_voltage_lsb;
> 
> The change looks irrelevant to the patch.
> 
> Either with removing the change or not,

You are correct; that is not needed. Dropped.

> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 

Thanks!

Guenter

