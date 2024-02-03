Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83885DF16
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Feb 2024 14:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706969534; cv=none; b=GmYYNYv6wi4S3ugj82GsQywNTHTDMfdM/KXTpq9xp+cSHivtjm+grbUNlD4YPfymblVnjZwmajMuLSvA3zaZcR8xvJs/NUDuAFeITVLRs9CNR4rZK9RUpCPUB+SLHjrfyELFxd3M0KpUodG00riOqJiLTfrjsdzNJKR2znoC8AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706969534; c=relaxed/simple;
	bh=K6PIwbjh4qCkXg3M6RFX76XMXlLA7KONXTmXirazj7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jbrprb+mp+dRkZqENYlPdDt3EI+wpGyRCNpOiXu3mSRtk7m9htVgLrLBLDqJ067R47qH69tmd5A9MzJyL72lP33LBUWwZMbwyBQ18iNsjD24DFzNTcXIKjT0KysTL3O4rCvuNRvCZWbxlYIE/lZ8ac1bYlCFVEo/6u6ARZGMPLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i65bUSu1; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i65bUSu1"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e0341e5720so41394b3a.2
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Feb 2024 06:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706969532; x=1707574332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eEFO3XuvJC4aDvU2xQvLPxI9i4t2fxYN9VTwe5rBqvQ=;
        b=i65bUSu1IMdAEZTX9LM94OV0UkmUJL0XXlNSgEUEGnRleJN9ui00jrFv/fwDSliiQG
         BhjAvQ5Xz43u5H9CjOa2jh+f0xK+MrSJcdCctmzsoLbJ9e5qtbTwiMgC43HtAzXJcz3Q
         K6jOPIg8fpGAmHxxNKTZPJ5o6UE0PNLK6VWi39eznfsonxhrlakW4h0aolfO4t52hUss
         tUUWHmKzCTdTpvGG6SZ4UGQ92o+0M6My2jTYBpzo3rhv+p5TyIongyegDDieXvRfcj80
         YCzHkRcUH6l3DZmp+Xp4X7av+dliuTTZKZo6eBs0ASWYRXTVYyGs9ieibamqRp68a4cP
         LEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706969532; x=1707574332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEFO3XuvJC4aDvU2xQvLPxI9i4t2fxYN9VTwe5rBqvQ=;
        b=HWPhdEqywRTK46DxlMSlJS6cLh7mLkSCoReOrwOzzmAJr3HWST9y3viNVw8Nw2caXl
         MO5RYA6aevZA+stgps3u4R8rhshUDEKhvWj7cxgmL3lZgK/RtLT0/AxUF4K5A7r2xtfU
         QJdy4uxYAUXcUWTRCs5VymSKdrsIFomu4l6Rh+lKb/Jn9BymhPLJCz2TLEUFQQlBRqt0
         aE44jSg0dakACQ4MZr8faCjR4ipYnDtXXtqLgy3CKNWxwGADaMKqPcQklmhdsxbWnfn7
         9lvNlaF1jRyfRV1TJO6u7OcoK8Qdjk62K/q2m82gtnbaIOyqBlZGYObiabkC/jEe5JeK
         D/Yw==
X-Gm-Message-State: AOJu0YykmN/QIvKbXglUX/iKj6F+AlRo90PcR4PtTbNC4+vEK/NcbOV2
	PU+afgXr/7oF+clH6FdzDxwDXl6Le8NUO8+LtITKiJb9Owo4CiH1
X-Google-Smtp-Source: AGHT+IFipV2DF3+kBNA/FWTzlHT4xHjQLxGNLpjvzfmfB06xJy2CeFOqtI5wYQzZ/S0YL8HtNBRZDw==
X-Received: by 2002:a05:6a00:14d2:b0:6dd:8853:ada8 with SMTP id w18-20020a056a0014d200b006dd8853ada8mr15277877pfu.26.1706969532103;
        Sat, 03 Feb 2024 06:12:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWv/p7HZbYli1IVqDc89RuadLlRZe/Hap/YH0W280tmDns5yhzhkp18Vc+juYxB/+4eMAmegLrAqPVCFwwytof2cBdMN3qhdzRglP8GchDHlJ6yt4YVwojWz3CXiOXpdNqh5FnpDcy5oBaS30ftuELlvy5wC/IpbifGqo35LVpjMkmwyETXyu6CFh91gXfQjbDoZg==
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e13-20020a056a001a8d00b006db9604bf8csm3427693pfv.131.2024.02.03.06.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 06:12:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ffd297c3-4ac7-45e5-bf76-8f4e4e9e603c@roeck-us.net>
Date: Sat, 3 Feb 2024 06:12:09 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [groeck-staging:hwmon-next 13/34]
 drivers/hwmon/surface_fan.c:22:9: warning: no previous prototype for
 'surface_fan_hwmon_is_visible'
Content-Language: en-US
To: Ivor Wanders <ivor@iwanders.net>, lkp@intel.com
Cc: W_Armin@gmx.de, linux-hwmon@vger.kernel.org, luzmaximilian@gmail.com,
 oe-kbuild-all@lists.linux.dev
References: <202402031253.JPVKEF5X-lkp@intel.com>
 <20240203125217.4702-1-ivor@iwanders.net>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240203125217.4702-1-ivor@iwanders.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/24 04:52, Ivor Wanders wrote:
>>>> drivers/hwmon/surface_fan.c:22:9: warning: no previous prototype for 'surface_fan_hwmon_is_visible' [-Wmissing-prototypes]
>>       22 | umode_t surface_fan_hwmon_is_visible(const void *drvdata,
> 
> I tried reproducing this, but I think this issue is already fixed in the
> most recent hwmon-next?
> The function should've been marked `static`. It wasn't in the original v5
> patch, but the current commit in the tree (216d66aa89f9fc882) already marks
> the function static, resolving the issue.
> 

Yes, I already fixed this up.

Guenter


