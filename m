Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73771B580A
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 16:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724949944; cv=none; b=SBH+eXqA4NrGmXiNO5UYZ5OEypTDwwZCJKMXGudJhOH56Xs9Jag54aiLe6dpA1rc1ASWtzgY/cuplIZYC4Vy9zF5K4HeXd7TRFFPTvldBKWYwEsMk29/R7337Jqp6M6dJEWEGlIPX9ac0uJzdhDpG0HdfvFmjC1mcq/v/E/x6pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724949944; c=relaxed/simple;
	bh=eBRnlfafRiiOQDitPcSY/cHCGAfSQEUVWg8oyZvrHDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXYsxnhcQCKwm3X+sMMfT70g4f0FsB9apPmyBU0o/3B9RcjyYwi53Ao4fV0fVnGwx1gj2ZT02BLPd9baNaKwsgah9MkVvHF748H5EIfRJJ6Y0eU5NxEH2vtQZ+Emk1T/uxq54anKP4yI4m3fw4gVYxcWmuTFuIwWNdcinRiIxc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7lHpP2E; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7lHpP2E"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20219a0fe4dso7348195ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 09:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724949942; x=1725554742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wg3efP3pcNpkBWQIBOsZ0CaZhvobXZ1xz3gu8GLNRao=;
        b=f7lHpP2EggmWmewwLx3hGFWiimTvznkSKjLhRBUvW0MbGcKQng8AzaMpqSJCtwzM7O
         KgPXtoPT5cNMcEGAZaSDB3ByC6rAJbN/mzS09YjO1GgFtbJeeoYSKhjqCHUiVMbpv76x
         LlJnFWDnq4kxAu7IrnYQI1Dqw0fli1eg/t3MNXcnWtQwcv9dlsBj1f0TMsYirrrFVksn
         ktNNeLFNvjsnmqxxKZ1j56Y/AT7rKHQ8nXCNeNtJHdFb8P7npn6VOCPjkVIF0LoJlh6P
         R3DdwyFnZduVVcKTEPhPMkemCuOpRny/ydVgCzcukoXohUR04Gz1syxLtIMt3/mA9XaT
         2/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949942; x=1725554742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg3efP3pcNpkBWQIBOsZ0CaZhvobXZ1xz3gu8GLNRao=;
        b=xOVjIHAT+IAfgGego8kSOFSXctvcciOkhJV5A42i1ZgMwNiCBTMntxJOa4XR/ByQSq
         gVCbsQAU1aGcIoqozAqCnk+kdJGwVDzJdXBgiXn/QgB8o+2hn5PbmlmjiUL4jauz40Xo
         OnCTMlIlKfgUtQePZOArz9P11MuD4nRnZb7f0+Vd6pGwM69Sl4WpqGYxukWEYG1YKFHj
         Fs4Q8ncthT3lgCVmEZzak7H0dIhdOBI9Snn1b+mXe7YxlcUmjrhXaSZSErBSA1evC2jS
         V4xLuoneC7giNkAXUIk8W1W62HluSHEngy8Ulr1AJCE5MRam+RilVPsinBozJe4weJtZ
         PTyQ==
X-Gm-Message-State: AOJu0Yx9+J3FS4ivsPXflWJCUkK55eIDvjsl3Ijlmve9TvdlZX6CPPUh
	Scugs0QZfqYFVUGadAR9cMzCtXpQQ8DsRPscWnyJj5rcVgPiSNhVo5T4qw==
X-Google-Smtp-Source: AGHT+IECexLM2rCUCQV+ppIYVeuHiHfj35MHbFCxywqM6teOs7lnO1oTNElRW61E6GhuOL2z4xvIdA==
X-Received: by 2002:a17:902:d546:b0:1fc:5462:7eb7 with SMTP id d9443c01a7336-2050c4b167amr34453505ad.58.1724949941981;
        Thu, 29 Aug 2024 09:45:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152cd998sm13558815ad.80.2024.08.29.09.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 09:45:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c2ae37ec-26dc-45bf-a750-d7d2a32475ef@roeck-us.net>
Date: Thu, 29 Aug 2024 09:45:40 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] hwmon: (ina2xx) Re-initialize chip using regmap
 functions
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-7-linux@roeck-us.net>
 <ZtCLpWh-o_n82dpq@tzungbi-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZtCLpWh-o_n82dpq@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 07:54, Tzung-Bi Shih wrote:
> On Tue, Aug 27, 2024 at 08:34:50AM -0700, Guenter Roeck wrote:
>> [...]
>> except for bit 4 which reports if an alert has ben observed.
>                                                    ^
> With fixing the typo,
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
Done, and thanks!

Guenter

