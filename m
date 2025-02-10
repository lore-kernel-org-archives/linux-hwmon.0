Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9352213AA41
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 04:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739160061; cv=none; b=c5/F1TC/CkqegH54a9t+la1ic+yV2MN/dnFJmIk7QQtKsGAjwZ/Uscv3GZf44GOJgwIwvX1X7HN5SdZUSrBnUCtagWmb0FygkxosV0ISgUyl0loKzbfrvH6y3egfreFplye7z2a5BT0RsNiAZRny6MZXan005IHAqyADb/IteAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739160061; c=relaxed/simple;
	bh=JgJdldh7TQKJ+Eby3Jm1OgByjYrc2ew60erF2cSHNNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibO+sbiINdIOmKfENV3REyVuP/6WthEX+RXudb8dO8esMeziUBdFSdM5zF7i/OJ3K34lHiQ8GCjqoLA5FgJZnnnqEyULR8Xd8aCm6r4vdkiStXORzqXobJmw4CJszCy/C/Lng3KZijtOGpPyqyBuX0Lh6r1XOIQ/zccsvQtId8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8N781sK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8N781sK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f0444b478so54925085ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Feb 2025 20:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739160059; x=1739764859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hlMwcnSPJzL5/n8ZtDUzzXsvF931WBUqtIPXoPBJViI=;
        b=Y8N781sKNWtXrQueuMUUlY1GrHh9YXlfP2M793csjN4yzJTy1mT4S9P+rXl+nVqq68
         P4Ldeev63IneTCfGOpACc3Kj9/8PlHCFu+t/wgPoDSGewUtAkjqTZQprqS8OzueoMsYK
         SPCYDmwEisTl1/G2KCDNrUFhLaKIH3Kzdi3ymzBc5SwytJ/xejsaeAHv7OunfFfJ4GWs
         ms/UVIseNjGKcNaaOccPGgpx2bFPTKtuW2wJWRryzRmmDr3NgnmFvktHtH9MSOvJPFaV
         FQwzYCIMGuVw5DueLz2ZalXJo/4SiA1YtbH9Jhbamhyy+SCnpGFUeglZPqKIg3vqNA1T
         gaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739160059; x=1739764859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlMwcnSPJzL5/n8ZtDUzzXsvF931WBUqtIPXoPBJViI=;
        b=Do+uJO2BOULXFHSb14hrrlvEOFMf0iMbHncnZQHfHsfXDeHPrE2ZftvzeSeI5X2B+b
         dYp3jo13J8enBYrOFGbA8m942fyTjBGiIaqTWLj8dSusBFBlaFOZXSv6xXVGjkAopdzU
         ptPkvurJH5in8SrmxtePMXRAduBAAPAksvv0u+v+ZxuXuS9DvVGfJgRDsMq9jplag8p+
         OaMNiHT3vdDmnx7FTDVOsTAXbZqbv+VHnxV4iPJQnZ0lBOoRbvWvLlOzohVTAh93TTRn
         fnbw24ZfPsnIccnI2OEgyXisdeKBZvYrVTtUH9S9gzC1UjCN2BN+ts6TQwF0MWwzD6+f
         DQfg==
X-Gm-Message-State: AOJu0YyCrDrGAdSQTAIDQvMJsJHR5RwHyLRP1OkK9v4XNNmylUoY952P
	/gs5NPhrYf6Uj8XL8aA+Yur+SQSTSu7yqShYs3L6hoJZCbPXVa/Pv25ntQ==
X-Gm-Gg: ASbGncsuu6bUF68QcSejvVJsNZVMk+hn2lJM4/emfBlTNLIyd1S0I6isXbgelq/QNsw
	b97p6N1Y8ZatTplhwxSDHelyfrtLzY5AWiauVLCSC2GmHSpRoJzQ3T+lWJWCyiKLGsvQxI/MWJ+
	VCJcjCUzyJdmLF5GrbM6BUa2o8xfAgEOdscfNvmQByK1YDaDF7P5vl7zi4Rgoghg62QVgEUfoG3
	8NG8sO0WvnsAjQSz8WtoRACNHZlbUnLAcqoJ7jD6u6JSIP9lOj37ZqGmf6BqkT1R+NHa7ed46Du
	wJ8q1N7lILSSxHtWR6UJkcHzlc7seAhycTFSLs4oue1inK9txe23kJQmi5/vhADU
X-Google-Smtp-Source: AGHT+IHMLRpmL32psFuX1xLGoIv7w9mMTHmu9M/yJcaAypza6XbAqfabKDAnb7Wf3+8cFyERP6vwYw==
X-Received: by 2002:a17:902:d54c:b0:21f:988d:5758 with SMTP id d9443c01a7336-21f988d595dmr46690015ad.35.1739160058683;
        Sun, 09 Feb 2025 20:00:58 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36896b86sm67998195ad.212.2025.02.09.20.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 20:00:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e65a6c76-0baf-4147-8d8c-33bfa994100b@roeck-us.net>
Date: Sun, 9 Feb 2025 20:00:56 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] hwmon: (pmbus/core) Various fixes and improvements
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250209012617.944499-1-linux@roeck-us.net>
 <Z6limkNWqXP0Nq6x@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z6limkNWqXP0Nq6x@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/9/25 18:21, Tzung-Bi Shih wrote:
> On Sat, Feb 08, 2025 at 05:26:09PM -0800, Guenter Roeck wrote:
>>        hwmon: (pmbus/core) Optimize debugfs status attribute initialization
>>        hwmon: (pmbus/core) Report content of CAPABILITY register in debugfs
> 
> It looks like the last 2 patches aren't in the mailing list.


Yes, I noticed. Looks like gmail decided that I sent too many e-mails today
and blocked the last two :-(. I just sent them separately.

Guenter

