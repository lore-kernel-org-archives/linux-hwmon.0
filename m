Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15FB34C802
	for <linux-hwmon@vger.kernel.org>; Sat, 18 Apr 2026 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776520152; cv=none; b=LKZbNJ7jHnHg/8iBgWymzN22BStp9cz8GA4TWpk0FcjgMyTkmh6GFklr2t54gV0tJanASU1D3m0eo2r3wFOYywj6cE9E/3FjpVL+myslWpcNt+uEuLfdee0R8A4YnjUZntloUfjOlt9zGNgi9FHtLRhFxetDEbDTGoJ5Lcy9ra0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776520152; c=relaxed/simple;
	bh=WJBMIG5/xSIpoll6EZ01bf1ie6+5xpSUSn/iEZl5jvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILk6WinWkZ0pOPXqwfgz5paLgAFpBAplLggZP2VNdcpnPa/IlwMqCL+WBh0t7guYwzwlP+zGJGiamNLc8zaHTehznDgBgqzzsyJw7/xHJCYkjF02gkheDOsyVR7gt8T0tD9kLlnsUFVJLTE27rsve3UGREWbQ5EIDuU6Snte35A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJauzixL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJauzixL"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2addb31945aso10990415ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Apr 2026 06:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776520150; x=1777124950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cw9L9dh8KPubE20lqwwNlVLp7RIEYKinMaR0nmvgiDk=;
        b=FJauzixL0xBsMruXY/hOPs+WX737HQug2Na4rTMGhYRDRUTKosg/eQEsQrKktBkwSh
         virqgWGia4clPtB4n8Gf/UrOPIlv96vEo2c4C7YKFdJ45b0sh8mVp0UAhGRG9ATrDR2Q
         U8CGTnAqLpiwRzRqfsfegb4yPVcAUjzpsvskvs5pSgZtwrV2ErWjoN1I/OpzkIDxAIIj
         J7ISxI1riQW/zZWYh325gzvnEvNVDx2O1p/NQYrDg5daYNDHLNCWUo05kAbq5z8k/zo0
         iHH/JtMCEVAiaWcbRUi9LV10ZMFsw/3YnXea4z2LvOIbq/KKcvTG/u/t1/oI7bKmrxyk
         7d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776520150; x=1777124950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw9L9dh8KPubE20lqwwNlVLp7RIEYKinMaR0nmvgiDk=;
        b=lkriikp6MBjoSuKpFxim4OSRneu+98XrLs+Xc5Q+LjYGuDLP9sjKqbYzPMss9Xh0BC
         IDVH3airMhMWJe2mCvbG9syy3CnjGdZ0sc2q5Aw0Qjls5zsaUV+Faeldy5U33tr+fthP
         r2MouUs+zKe31II9NDmfmMbymp6ei9TlnsbRCOfE27O6y0+O0b5k1sypLLjo5Or3fDoq
         XqEkkOKhZvJnZYiQcEa1z8kWwYdCuDnPK0L28jAW6LQUWdt2Jv37ohV6awZJW0HvQ97i
         bhNYMi3siFi9fkWMeWtNAw49Oh+QtQlNDKVFyfDhtbgS72bTv6Vko8IE4wreCd/JYZcq
         pXnA==
X-Forwarded-Encrypted: i=1; AFNElJ/pO/7p7pF2fo4aGefNdORXzUaKmA8MC61EOH3Fttx1jFgvSusbCXv2xa75Uwr+wIfhY5gj2tS7gSyCkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyclZm4VjQlfOPI9QaTZzpWWBUO0Dk9ZuaK2mu/twVIaKCnulYA
	Wo1fPpQS9aDGlmhRBmLoSpkmZEmhNgRjSQgh03U0gasKyeIx4ggHbK1R
X-Gm-Gg: AeBDiet0jv98bKJggAbOMUXp0P0FwbAQ0oCVqLUCn6LCDjPJf4ZNE/XpeF+feGkNShJ
	zLt2iJc+rQAgojkatd6rCvyEMjZKf4PD5NxYguVuHAMJ6x1vUtMDqm4dmR6m0aMICW1+Ry00UKH
	hpJWcoeTNtEtckcEahrb+YBnKpCqGGc9LaClOEwx3zimJWlPt/ctgjplcU2DkWjIWDa9k4g59hs
	fJRJKWFmyQQrScpWsn/M8z6QQR1vVtMC71tJYTZosqddT60QIO8BPX62gwF2s4J4YEWiEQMFL+F
	0LfkQHYuiHTh7CBZ3GjmcH81Bp4pbM8kZTfP1l3NyOiGVTQr9M/b7lNB6MkgVAaEdB148eAGp+z
	9k3tXksuM5gCld5RzrW6yNR1ROcurXnWDNP7Vqpy/bFdaYeSPL57lTYXFORWTKYyHB/ADqwMmZt
	SDGKjVYwwXfP19QNx7h9Rm2d2rDGvMItYUq548MIPHPOoUQRD/5ZgqnuXjJQy5x60PzHw1qeE/m
	ulpWzcjyv4=
X-Received: by 2002:a17:903:1988:b0:2b4:5cea:f618 with SMTP id d9443c01a7336-2b5f9e7823fmr72155245ad.3.1776520150147;
        Sat, 18 Apr 2026 06:49:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa30047sm50598735ad.28.2026.04.18.06.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2026 06:49:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <27b467c7-7ca0-4198-b4ea-efb38f2ac787@roeck-us.net>
Date: Sat, 18 Apr 2026 06:49:07 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hwmon: (yogafan) Massive hardware expansion and
 structural refactoring
To: Rong Zhang <i@rong.moe>, kernel test robot <lkp@intel.com>,
 Sergio Melas <sergiomelas@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
References: <20260413060931.31091-2-sergiomelas@gmail.com>
 <202604180539.EuswNnjG-lkp@intel.com>
 <b876cbcce7763041d93f9cad28b8aa4cac0a001a.camel@rong.moe>
 <fed0feb4770f7fab8d4336eb349d8703839e8ce4.camel@rong.moe>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <fed0feb4770f7fab8d4336eb349d8703839e8ce4.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/26 04:23, Rong Zhang wrote:
> Hi Sergio,
> 
> On Sat, 2026-04-18 at 18:31 +0800, Rong Zhang wrote:
>> Hi Sergio,
>>
>> On Sat, 2026-04-18 at 05:37 +0800, kernel test robot wrote:
>>> Hi Sergio,
>>>
>>> kernel test robot noticed the following build errors:
>>>
>>> [auto build test ERROR on groeck-staging/hwmon-next]
>>> [also build test ERROR on linus/master next-20260416]
>>> [cannot apply to v7.0]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Sergio-Melas/hwmon-yogafan-Massive-hardware-expansion-and-structural-refactoring/20260417-063319
>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
>>> patch link:    https://lore.kernel.org/r/20260413060931.31091-2-sergiomelas%40gmail.com
>>> patch subject: [PATCH v1] hwmon: (yogafan) Massive hardware expansion and structural refactoring
>>> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260418/202604180539.EuswNnjG-lkp@intel.com/config)
>>> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604180539.EuswNnjG-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202604180539.EuswNnjG-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> drivers/hwmon/yogafan.c:712:6: error: call to undeclared function 'wmi_has_guid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>>       712 |         if (wmi_has_guid(LENOVO_WMI_OTHER_MODE_GUID) ||
>>>           |             ^
>>>     1 error generated.
>>
>> Hmm, that's a bit troublesome. Usually we should have been able to
>> declare `depends on ACPI_WMI if ACPI_WMI' (new syntax since v7.0) or
>> `depends on ACPI_WMI || !ACPI_WMI' as an optional dependency to prevent
>> such an issue, but there is no static inline stubs for !ACPI_WMI...
>>
>> I'd suggest declaring `select ACPI_WMI if ACPI && X86' in Kconfig as
>> some drm drivers do, at least for the time being.
> 
> Of course you'll still need to guard the wmi_has_guid() checks behind
> `#ifdef CONFIG_ACPI_WMI'. Just forgot to mention that.
> 
> Hmm, in this way `depends on ACPI_WMI if ACPI_WMI' should also be OK...

I don't know is this is a misspelling, but `depends on ACPI_WMI if ACPI_WMI'
doesn't make any sense.

Guenter

