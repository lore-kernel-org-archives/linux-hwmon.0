Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D5130CD99
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Dec 2025 21:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765315170; cv=none; b=TzgKPvXVIISxHR6/l+wdOS2NbgY8Yc3Bsp5mtAZGFHd4UwN43ricUpnkQP2Eyy1rhU3O4EshZ0UbxP321Hn1bxzBB362lO/QTwl5P3rHzSKynfPdYikM1G3eY/9OhWjmYt2biPutZZcuRSegVnUOYZhhGIHwG72RBJluaaFO3NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765315170; c=relaxed/simple;
	bh=9PJopTTnqLj1ZhQ6CkJPTtVI/sv1SpnklP6dwdtFspU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXzM51towEiwsKxTc61TXPkIq0fWre7orx37abMNpQHcpb0nloU4dRLAzeN3+wQafDBQ3pG1nDKqnlvGqdoSQAMTJURq43ICLkMJjr707gWn2ZqLHMKwCCu/O/+2HMV2gSs560Bi07pLVnoh64i6afRccVzWEkmdDjV/17cM7UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHRThsUc; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHRThsUc"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7aab7623f42so7292829b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Dec 2025 13:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765315165; x=1765919965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eXyBZeAqVrNTw0ijziaQzTxeLPEtR+cB7Y85IdQ2xtQ=;
        b=NHRThsUc7ZBiqBtiTyYelAAxska4ko/bgJHej70iu1YlSTsAFt97YO9jZR7S58X5ml
         EfhGaiF4pK7BndUBQr26HMxwLSJbNkbUXqjzI+4AE5ljBeoPWfgigmA1OmjBile/Wn4r
         tCIj46gbPKQSXf9EUTvK0hFMpdSKqBunxBGGiy0TUjEKVb1HptqwUQWvkTYlSP/Cglee
         EcUZtqb22uUFI8nLJC4h9FwsCOAstfLJO3BGTL0BOo5PVGKNm5mTMiBNNNEYrhglcPVd
         ttwZp9f8X88dhsB1i/cPXJFAz8P6D0cUyrhXU0YJGJEHwnTH14W8S/HChw6mZzOcK7h3
         suCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765315165; x=1765919965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXyBZeAqVrNTw0ijziaQzTxeLPEtR+cB7Y85IdQ2xtQ=;
        b=U36jhbD3Mj/hkV9yPBKWkQZq7DjJ3wYYTS3Czr0FGHTC7fKeVo6Z/RpfizyHW7m0cl
         8+gsOVP865d6vqav5PCNLBHV5Eex2TCXa/51W2uYRsZegCOKAyBbPVP+4U77Z3Xggz0e
         TEvI8RNAv53rCLrdzjaIJmOYUxH/JH6Kyjky8UANKXx9uryeSJCXnWrnjBAQ1UBb2/tD
         79HxGmbtzOSZHYhpq51J3KwyNYDHoIp2HdBi3kDsk66+Zz5TTg+Ykj7+j1KVw/MMQvft
         Lf7hQphLNMO0JqGAFjIRUv/gkaL5Oe+cDKWgj1dwyrxQsGejS20Cq/TRrhUnqZ5EPiIC
         5qWA==
X-Gm-Message-State: AOJu0YworxIzMEiggZe9DcqKkjD15m0lBXAxouOpWNY4hTOrBysG1fN4
	uXdqMCdDAd87LzI/36LfC19Mf3X3hnATN3lcOiaUN6QT6W45XkQ7TU1z
X-Gm-Gg: ASbGncshER7OaUGhsAUM3hsVG2HlZB+F/eVD+6QH+JgrbLyhnRLSQdQfVFuwkpAVECO
	jqqLpwbuAmfYfmpXjBe2GEN7iFIFqRoKzA12B3C70Mw7+KIG9z73+6uexCx9XsUz0dv61qGdDhv
	qHaE8gBdkyFsdL2YEa20oHx+3m3rvNoJaPm2M1nsq/KW017BMNvbw52ovoF2xG7bTT3HWRp7SBM
	gZeSp0aIBDdpwJ6devgKmD+Kg0s+GszwszRD6L1NksjwswCQHPV9YpQsNoFd0M546EvyTJnfCq7
	uwpgdO3KJlas415dtpl+QuzPfDYa27Ww5tzTCrWhVR68bVcgche20US/7Wiu1YvBJrk4S85DG0c
	Y5odmGKrWuEADwZG9sYV7tIVHTtBmV48Ozz1q3hJgtlDqX3KkSpnggR+7UT/yVtwftYTC9DHaxn
	C852IptWTGmJrQNjXfC8dxD3gVh5bMhArq/Raz3/ri31FOHwkJdvBSE80orY31beSwG5caWQ==
X-Google-Smtp-Source: AGHT+IEDZcex0PuG2fxdY6TCN5APbUHrJEwXbSXsRu/pv4hoYVWrCKSX27oQ7cN3BNjdf6ax/38coA==
X-Received: by 2002:a05:7022:419d:b0:11b:8185:abff with SMTP id a92af1059eb24-11f296c8ebamr46638c88.30.1765315164690;
        Tue, 09 Dec 2025 13:19:24 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d46f1sm2859583c88.16.2025.12.09.13.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 13:19:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2683b84f-d7d1-4445-b5d3-bed393de34a0@roeck-us.net>
Date: Tue, 9 Dec 2025 13:19:22 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (sht3x) add support for SHT85
To: Antoni Pokusinski <apokusinski01@gmail.com>, jdelvare@suse.com,
 corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251209175848.5739-1-apokusinski01@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251209175848.5739-1-apokusinski01@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/9/25 09:58, Antoni Pokusinski wrote:
> SHT85 is a temperature and humidity sensor with an interface very
> similar to SHT3x. However, it does not feature alerts (and therefore
> limits).
> 

The datasheet does suggest that the chip supports both temperature and
humidity tracking alert status, which only makes sense if the chip
supports alert limits. It does not support an alert _pin_, but that
doesn't mean that it does not support limits. I'll want to see definite
confirmation that the chip does not support the limit commands.

Thanks,
Guenter

