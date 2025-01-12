Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B029814D2B7
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jan 2025 16:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736700374; cv=none; b=mlQpIEh5VF9cu6gbwe8VElNlATnATKN5dV4rXQaoo/KRBOGV860X2boXnX7FQW27qbMUtbvrfS2A8NXOyBW4auETHmnCGgue4Sas3sDjxS4n1hQgi3D7KTRgz3GzAjzIxlul5j1jRcozaQLfVtI37FLn9lnsjVK2+aHrWxNW4fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736700374; c=relaxed/simple;
	bh=w0gnLGc3JDvRchv1/SIS39VSt2aM645O9GNUnq+MlWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htEXhZ25eyRI/p1dVIjdDA1A4h1Vjirv6d0S0axSmlR17EXBxm/xPN482HGLh9pEaSYncq2UtYQl9qkL1y3QKbIMgnFKbZze9xKGlS63hFLtfLgvRiEI01XHf6KjhKsH6PpCEqm/IjLDZNuQg/pS4wtQCR9AjzKr0dmsSHm4LEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iY0v+rsP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iY0v+rsP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21680814d42so49045295ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jan 2025 08:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736700372; x=1737305172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aOLZMEg3uLXks+CgJsIkwenQJDYy1LPtie6ePRnPrh4=;
        b=iY0v+rsPaqmzhWMsX/XM9Y0rHenOtsR8n/eddim2ipSZSWDinuXcJo7OR+dfQlNDS3
         akWZXjYqiPvO8NNz+ucPv/Hj9I9ZEtIfo4aB/QgZTpx13g9H8u3A610otENFAFjjf/D+
         2ULGVnlS3q3o6q7DnTkmIPpzq8KZk8GifS/VPXZBf9S9Ht/L37Qop8UiFb7TpTAw/4lA
         6Jmb/u+7rspSis50tH8JNLaxlN4cla3j3VatFzYXeUzX8hK6DMYozhpr6bKHie9e//eq
         oivHikSLS6KI2D/SOd7TOGHhvzIGgVlppKh9fefitIAsWA0f+0ioutzIVY4G4NFIvo9c
         LxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736700372; x=1737305172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOLZMEg3uLXks+CgJsIkwenQJDYy1LPtie6ePRnPrh4=;
        b=pkrEnbSq/3eFwL7ikD1rT3laHF6RHvTi04sWKERwJoZKiIwXd35jdDbQzJTEfjN5D5
         Dec2Ar4439NdC/A5F08hz1KQymMAmNU+mBLfViE+obuu+YfwkImxkEr5TxvaxGgr2hKQ
         d8TH0cm76ALEqTRuFzgxRAlFSdBflVGqRUAB0LAFnbVgWYpC5kq2+hpcpA+bXzo7Cwdf
         TMzkyPWTRRUchGitmlfV0BPKy3JoDhvjSTOqhwLh7S+Tg3xhJYcGp+D5nqG65pUHbVGZ
         Fhelg757ELXWR4hZd57fmFYWsn2Tm77kkdXP1D4V7sJ5LRIFbfd/uiQJiFBKMkOXahr4
         oFJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3B62+Ft8AgU3k0E7e2QpVEX3Md3pnGbfBG5lazLfuCFYjgOU3QJRATgDvmG/9FETzkHd2oDJOxGtnJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2SUvlBLT75RfUkTuDtbwrzV6Qenbu7UFA+1FCzQqY1pPp40W0
	jx1dEmwT6dOn0NW8/lUYm1krJ3WSEdu/3wJMhhfjicUOthodg9xL
X-Gm-Gg: ASbGncuY4zXT1+QgiC51QQKe9Ed2+ptXYQIQoYmQNhAjVhrEwG7n2Zv+P7tmvxLSrdL
	lZ2mT1fJ/hjia1tQTTyXVREMiEIZzJ4maUskQ527cQmwURJT9DySYn0XedROgsczKSbfk4VWZ6t
	xVEj6OBthlFP/X8PvBQUCDKBd9v7BLGXoSDhsHnaC42GsifsZsbOS6iuMViR1Q0XyQRuv5vbJj5
	HewFaFjbA2fOyUoicy+DyeyoN88/ecMLFEXsVtcydyHuHK1JEQdJz74ODT93NfRIig4PIlMFyQJ
	C4BBx5Q0UkhcnczbnSbNxKNgzsvDig==
X-Google-Smtp-Source: AGHT+IGOUwjz7/zHVUc3nq4kcxd5Hsb09kViJ1GMOKEKAOx325Z8NMk0P2bWwOoG8vUC7KkKjztSAw==
X-Received: by 2002:a17:903:11c9:b0:216:2426:767b with SMTP id d9443c01a7336-21a83f4250cmr288158365ad.10.1736700372007;
        Sun, 12 Jan 2025 08:46:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219aefsm40210775ad.107.2025.01.12.08.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 08:46:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <543a7c55-cc06-4825-a37e-29017fb4fe3f@roeck-us.net>
Date: Sun, 12 Jan 2025 08:46:09 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [groeck-staging:hwmon-next 41/43]
 drivers/hwmon/pmbus/dps920ab.c:205:21: error: 'dps920ab_device_id' undeclared
 here (not in a function); did you mean 'dps920ab_driver'?
To: kernel test robot <lkp@intel.com>, Denis Kirjanov <kirjanov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
References: <202501130056.dNRlSRuE-lkp@intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <202501130056.dNRlSRuE-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/25 08:15, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> head:   ffd30617d9ea248f5766778227bc2b59ee2e691a
> commit: 139c3e32b53bdb1ee06f2f67adeccbcb4ad9288c [41/43] hwmon: pmbus: dps920ab: Add ability to instantiate through i2c
> config: loongarch-randconfig-r131-20250112 (https://download.01.org/0day-ci/archive/20250113/202501130056.dNRlSRuE-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250113/202501130056.dNRlSRuE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501130056.dNRlSRuE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/hwmon/pmbus/dps920ab.c:205:21: error: 'dps920ab_device_id' undeclared here (not in a function); did you mean 'dps920ab_driver'?
>       205 |         .id_table = dps920ab_device_id,
>           |                     ^~~~~~~~~~~~~~~~~~
>           |                     dps920ab_driver
> 
> 
> vim +205 drivers/hwmon/pmbus/dps920ab.c
> 
>     198	
>     199	static struct i2c_driver dps920ab_driver = {
>     200		.driver = {
>     201			   .name = "dps920ab",
>     202			   .of_match_table = of_match_ptr(dps920ab_of_match),
>     203		},
>     204		.probe = dps920ab_probe,
>   > 205		.id_table = dps920ab_device_id,
>     206	};
>     207	
> 

I dropped this patch as not even compile tested.

Guenter

