Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B55E219A8A
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 20:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774470694; cv=none; b=X4NMBNUJD0oBEGRikAqNMkRfhsU7++wgdftkNhNMlbKctzyUMKKmUNJs3aVQiZrmDJZkpu4NUbWSo8yVtzYz4+1EDlLo4iBS+AsCToWYLbf0jDTEE0fRJEw+VeeCA71UI7S59ICNN01H13t+zS1NlwqNAUyCbiuNXzBjvtZW2zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774470694; c=relaxed/simple;
	bh=mPGS8ssznz42hjE0/hDxxLEJzQ4ir+gUbv85lnLW5k4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LPApGY8/DefzOpzva1K4V7XLUlRGt9a/DxH4mos2QhNsYnwKHeZ2TuQF+4NFcyybQlB2ps3C2lA8ZSiwgNMpXt+5hnT7E2jju/8IbbeUrtktw+lfqpDtfzX5NVXcLATnZ4zsbFlUDTL6oLu8zJSQxTtEQXu6H9q/fjTpdxehev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MayK6H3Y; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MayK6H3Y"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12776bebe9fso481715c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 13:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774470692; x=1775075492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xJnxt4KORogRvmFZ2UTWZllOpDcuCpwby7oiniMsKZw=;
        b=MayK6H3YcdY1PccKfy28K67rkeY1VDz7gTX6EBD6nq/O0Q0yFkdtv22OPQNq7wUkwZ
         lVTXZ7RPg8drK7LS8I3BrZIjd58gCy060Xn9pJhGgAtbsNBsGJWdk2DvF31ro3duKEWi
         szjw7ZKJ4sjmljpmJk/zbdJ40CEsBayBJTeqNLpgtyraWtU1zMkIhqPIyb3IyG/V9SxM
         Mzq4SAxKwie7F44IuO2lnzbNGtqfASj9B9iXnsWuo2Mb0hlJtheY2EXfS8sDVca1Raix
         b0Ybo6sHpzEn2bGEfelVWvYZ30tVy1JM3IPJFm7leo7S3/cOfLYTrOT6CKAXBBisxA9d
         4j/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774470692; x=1775075492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJnxt4KORogRvmFZ2UTWZllOpDcuCpwby7oiniMsKZw=;
        b=eOgZRqiO60K6OXrYxi55PVuVmwXN7TXdNsprHUA30DPdzDKeGW4YplE8WjxHN7v+PD
         9gzYpao0TA6FeEn5q6BpiEMJ0/Uxd4pBp0cVHMyBS6R/2T4mWzhCr+8e5dB70HH1iBO0
         ovxgKveTLeskw7jy8q7ahEnVTpqwobKy5w4zSVxks5HttP2P2G+N4wXAxFGagfHjTGpg
         e4pahVHMOok77fonSZkqQ5iSYKvPuLIIDew9KDO0mf3+f1lK/33zgkxpd4MDvsfCsVb/
         eCLrEYu/wId/fiNJ1fCXlbeMNnISTlQpXEq7vVWGjGzUcOKmNmZYWnS+O6/CvKRtBXTb
         B41Q==
X-Gm-Message-State: AOJu0YzoLuk3Qv0VVq3LURLz8RzkiMrxWdiEqVeZEUe1v23pxDvKng9y
	zKA/Cvw/kxJLEdjWKe3D+kqW9nDrijHYCPucN64q6P426UMWlwUVawFl
X-Gm-Gg: ATEYQzwxdxIxCDN0P/Cy65NaT3kXpRtA3OzfiDLlf4yxSiL+YS7Kz4Pd3ka87XD79YR
	OF5hhrT9W6PDzsCUW9VJRhDOQLiIeApNLsLfepQQaMua+mzhaC7kPiPPRIadyHj2SNW5uSveLqp
	nr8gTXPFOU/jO6YM04emjCsqtIMwgqcW2bX6idvhZuiBP3/P1c4OD5nuVfbSdBnxiknLb57XF7/
	zW8wQXyWbml/OXYOMG6LN/LUWLwJ4d6f5pv3cq3r78Fr6syYh3sGw2WdzD8H43vomXp6YZvg3sf
	82Jlj7kBkNyP3iSBLrMno9zPRg5xm7WKOAdpu3qVsnJ05amMdLceoi+RYsSTMUxYOsTD7XPUAo8
	M+R2wyh4xvU5R0nGWunq1VG7eno+kd1crXEUtnEVy5CHltVcuTNE64QLiUkfAMUIApkFSOw+ZRt
	PiBONa3C2OCjiKIExm3HKNx+IQiEGITjU2Pw0C1jBSwtwR1LF7rAabFlReGnF2mtALBgU+n8nx
X-Received: by 2002:a05:7022:6607:b0:128:d6ed:e898 with SMTP id a92af1059eb24-12a96ee3660mr2522212c88.29.1774470692424;
        Wed, 25 Mar 2026 13:31:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa6e5beb2sm1006951c88.1.2026.03.25.13.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 13:31:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e1f203c3-494f-48b1-914b-994d4d834016@roeck-us.net>
Date: Wed, 25 Mar 2026 13:31:30 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] hwmon: (pmbus) PMBus fixes and improvements
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260325181631.17259-1-linux@roeck-us.net>
 <20260325202522.119591-1-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260325202522.119591-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/26 13:25, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> Thanks for the clarification on patch 3/5.
> 
> Reviewed the series and happy to add my tag.
> 
> Reviewed-by: Sanman Pradhan <psanman@juniper.net>

Thanks a lot!

I'll apply the fixes to be included in 7.0-rc6 and
queue the locking improvements for 7.1.

Guenter

