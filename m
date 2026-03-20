Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39792397E9A
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 13:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774014630; cv=none; b=uOPI5xgpsPobTkuyT/5Eh6s4dUUopkW1AjD3JFtAu4cGlvXQD3sBnalj/THFhwlYIil1HDJWsaaSC8hbpSvkxjHvCy/LyK4B/19PZ0UAmiCImlG4T7pb4iIADmz61AQGJpymerg9zaRHzgf0XrvWLhIaaVuPTb0SMrH83Gyg0NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774014630; c=relaxed/simple;
	bh=cGexRqoJV/3mVsDfekflOGERC9SowClg9M429wOox4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JvQqNk1KmndhsunSo67ibKCR/8lNY6a6K5iUHpqTWf6eNYFByTO+8uwR1wrQUupPXApnIjdJfDyBqgTCjF7TZxDNyUkmC/HaSo7kIdrlIPtW4FcjCFgrJNxTUhiNYtERbyg7OsDKXoYpqR990poHbwGGoJOjo61pEEB8UnOdc2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eftOZX1p; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eftOZX1p"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c107ef474fso2094124eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774014627; x=1774619427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lz9s9S5WjAvhM/81WNDTuJooWpTVXnCMez8tW6mKJGI=;
        b=eftOZX1pM5JDWzuQ04TVtRIOE1aF1PHVHWlg51UfwQsy8NvHW/FNGPLWywmbxp0pac
         c+Cj1n6Ye41rQgnilLgoh+kSvUM3HqKMu25KvvHLHibHrG0gPvwVyZgY+GQ94mjJTh1H
         d7Rw/KX/0dW4o1/1NXvFSv9HeOxHR4F0d/7THrSv9NxUmSL33fB/1vFWtGIHCsz7Sq0+
         ih8GiTadi7/W5FON6kLY5SiShs7m16h5HH4qqFquTwGb+MXlzZjOSpmYqnsRXbA+96g6
         EGHT9GHiZy8Kk1nyVb0UPTP06KldoMdM1l/VyNDykqarzCgYQvidaXsZjXonr3QKjePr
         g5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774014627; x=1774619427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lz9s9S5WjAvhM/81WNDTuJooWpTVXnCMez8tW6mKJGI=;
        b=MYJHI09zZ4d4nWhPB1lV8DMosYZ8HEBla95TGB+XR1hSy6FIWhmzAzFP6UekjF4lwN
         6GXvsTzUA16/itcJMVZFg/q1+XLSA67lR10elxIShrmYtdEa1a8GUyamFZdZI57qGUlS
         kaLh1dkVr1PNnvGoqWXI77AOe+sdaZNT89nisVMCXxo5MWzVVHH9Kd7u8gWWFXeRw/HR
         ZGutvkY+P6xG23/0FRM70ZiIUwdMWL5Rpom8dTJB+bmfxuqd0PO0m32LNq1tO5k7f7Rn
         BxunfM3w9FSKjAAQ/pKJGbxdGGmMfRYlIsjOOt7Zlm2QockJB377GiD3Gpa2+lbTuTD/
         mf2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcOYhWMLTu3omkGStlY9jplK92vSDRUzrKljPyqSKY+2OfHNxzrhq4o6AIMBui8S5ET7+D53stnF+Y8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhXE2FTEah9icweJYMyCWTeGPZLbJkFagMPgF+Lls2ndAvPZQ+
	1aSOGg1sWRufwxoR/nvNUz1L8A8qYynEAkrGX8ZNpjSWzJ0X+j8eNrZC
X-Gm-Gg: ATEYQzx9gxg97X+QcOBe3je9ZTRViwqlvVl3HZX2+GXzYFwCW887OJE1/Je1zKA5dHe
	HKHkK0Am957x/4KcxTJEQtm6gwkEJwiiq4r+r5fC8A748oZuIPFBNmSSPEbcF8QlAul/Id7KlWn
	wn/7oHMqXq6CSsFd/DmaqXDvqalrfDuBWKIASQKBavWFQqMJ+0nT1GfsV/krgXE3/vJP2WENJKX
	6YUcHNoKYps+SP8cbwpeN4rEQx5OAsdYAsjbyhrRwpNNlFzadu/L9XRU+PQfOw2wU/pL8R+oViS
	Ufn69RoF+MDQDY86py1d7wQTiK/4ezkheULxXiVqcGikgUWqMoZ/ZbmSb/g0w48FhL1X/vYVX48
	BL/ejXCIze09RgpQ/diSxwsAqgFDATHc23x0bvHvy0vWdtXy4gM7CFhDl97gRWALBUn9SgZp/8O
	lEBl9etFUGVNO5iLOkSky/6oQ+LyPhtYcNcm3ESQEQ3fehc6BeVd65WgTdcI5lULR/FaZ6wlEn
X-Received: by 2002:a05:7301:4198:b0:2c0:e31b:1814 with SMTP id 5a478bee46e88-2c10961ef26mr1587262eec.10.1774014626812;
        Fri, 20 Mar 2026 06:50:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm3100403eec.22.2026.03.20.06.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 06:50:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <677e5093-61d7-4d9e-ab9f-311abda202d2@roeck-us.net>
Date: Fri, 20 Mar 2026 06:50:25 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] hwmon: (pmbus/max31785) refactor inter-access
 delay handling
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260319234945.151487-1-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260319234945.151487-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/26 16:50, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> This v4 series addresses the review feedback regarding 32-bit atomicity
> of the inter-access delay timestamp and resolves the email address mismatch
> identified in the v3 submission.
> 
> To prevent torn reads/writes of the 64-bit next_access_backoff timestamp
> on 32-bit architectures, this series now includes a prerequisite patch
> adding a spinlock in struct pmbus_data to protect accesses to that field.
> 

Here is the AI feedback, which essentially confirms
that the spinlock is insufficient.

https://sashiko.dev/#/patchset/20260319234945.151487-1-sanman.pradhan%40hpe.com

Also, the error check for i2c_transfer() is incomplete.

Thanks,
Guenter


> Changes in v4:
> - Introduced a new patch (1/3) to protect 64-bit next_access_backoff
>    accesses with a spinlock, avoiding torn reads/writes on 32-bit
>    systems.
> - Updated the export patch (2/3) so pmbus_wait() and pmbus_update_ts()
>    use that protection when accessing next_access_backoff.
> - Standardized all commits and signatures on psanman@juniper.net to
>    resolve the From/SOB mismatch.
> 
> Changes in v3:
> - Dropped the u16 -> u8 wrapper type fix (already applied upstream).
> - Fixed a comment style nit in max31785_read_long_data().
> - Added an explicit max31785_wait() before pmbus_do_probe() to ensure
>    proper timing spacing during the handover to the PMBus core.
> 
> Changes in v2:
> - Export pmbus_wait() and pmbus_update_ts() from the core.
> - Use core timing helpers in max31785 to replace local usleep_range()
>    boilerplate and private timing state.
> 
> Sanman Pradhan (3):
>    hwmon: (pmbus) add spinlock to protect 64-bit timestamp
>    hwmon: (pmbus) export pmbus_wait and pmbus_update_ts
>    hwmon: (pmbus/max31785) use access_delay for PMBus-mediated accesses
> 
>   drivers/hwmon/pmbus/max31785.c   | 191 ++++++++++---------------------
>   drivers/hwmon/pmbus/pmbus.h      |   9 ++
>   drivers/hwmon/pmbus/pmbus_core.c |  29 +++--
>   3 files changed, 87 insertions(+), 142 deletions(-)
> 

