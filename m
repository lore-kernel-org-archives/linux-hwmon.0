Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F72311C1B
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785257896; cv=none; b=koC9Kr8xKGf0MeEyqYBaQYqmu/WatbfiKNoeYKFoioi60eC9OHbP3AQaTvSoYEn/cMFXAtZDsrBl0jLUWmD+G6T+DXZxx9aAGqyM+JVxH9iZf0CFJ8Srwf3a6MOJ8TbH2HXF7Tv80yMYTApYmyuW0Z7XIYLx88TBPO2sAk6pe0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785257896; c=relaxed/simple;
	bh=vJCIAgCUnA8gtIAB3h4MukXcUJaZitbAJxAQaP0cFtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZlAb/dI9ydix8lu/Mz0/8oCrGR7htedfdD5bE5caATAqfGj9jfLiske6KEpjK7kXsIQxZEa7nkNETWuqZwvdvL0tQYl7tr0FOtL0kYfSwshTTcc4UPMSYYXWYvuxJ61ixJXZAwfSptpKuovQTrp074XQdfk3xywmDWnserq/t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6zraJe6; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6zraJe6"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so39451a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 09:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785257894; x=1785862694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fa/LYPA7/Xkoo++dRTwytqE1SJTv+ovanIbkQn9jNIg=;
        b=k6zraJe605F29C657cScOWXqO5D2tU5DWIwbGGIFy7SHE5RVtzMyDFBWkHqH+P0r9K
         0/DKkgalICToLuc3JbN/kFnq1fOmEwS4STISebqH6kNJFs/adv7L+lhgmZAAy3VbkxCj
         zXRNALT+r6JmcfS5flU2aajHNiqobNRYnN+vT9qm5YpKGHJjJpbxBUGtz9GzaXO1CyfT
         19fZqd+hZriIgVZpBp2jk9zlvu6rOHHESu1Rh+9+0zRhd+SO88/TPPcSLec5Kk29Ypvm
         mESat1+Z1FusUxQgnNMtscprTMS7qo3715AqpXgY8EHDdc7EgS4nY/wiz34tUvYzRHAQ
         ZTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785257894; x=1785862694;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fa/LYPA7/Xkoo++dRTwytqE1SJTv+ovanIbkQn9jNIg=;
        b=PK/Ne2I15MRK8IrlBnGSaGUattdDQuepZepkL1F6+mgLk86E3nEV+7vVmZ3zgD7sSK
         6+VX7CUdBr6woAeSqQ0o8J70wpl9aLdU137PcYTOTyyD+8K1cDSt8PwASRY88J5L4lWC
         WtZdsf6dvztAGG00B5eqnNASBhSYPPjOwlrTQr7Cb0EVrmjtvXggPtF2Fd8bKlL6A9G7
         ZvsyGjFRH2jvzkdJtPmcJBmbeQZsBQBKZeatBRmyw1QcZ7xSWhsIU5lnryb88jCQELKt
         5N1RwLTyYFNUBDfLahNWnaEWWRgSpnqSTxizkPSO1KwtmSJokP3L9ZWdg3REtjd7N5yx
         vteg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6IOHbaslbBOzOy0KrseFZ5MtvMoqgK0ARyIMcaO4VA87J8aEJlDeE4tdNkYwvp1darQwnMbbcDAzkZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJw0KwQiAhs5IOThN7hdkweaPZeZqyH5EkRas8MFJNPMPsYvLn
	MiycrIkDc+FEZ67sT6Qjr0kCF+9bKXgVtv732o6JI1oPpM/rnOSjpt7R
X-Gm-Gg: AR+sD1007T6PMqipkYisrj1aeXV/8zHKHOg/ucFpJTYz7YB/yJkPD1d7SqL5dixSrH/
	2Mv+SWjiJvPC9Tk0exsff8zCMlQh56tEtXhMGVbkMDSTt5KF4f3dLf0C4cWvC7S9mDr8KrjRnDJ
	4+xuXHo1/r5JbjoKH/eA6X2J5zVOk045iJO3GWbc8Zhfa81uhGTU2N8Xesvfmkz2k1s11eSNcBW
	B630A15iYi+gJm+NQYl5TcjGgudYptDga7oCyuW1oQbCWB/CY55gnto+rPSO+lmdmMb2OTgScGx
	8tDOVlkFWF/Gu7q0mueqbw2q1i797dxyP9lvQoAUzTrLldDgyAWpk+sGjPm9dPWtDhN3bKZ4UFe
	k7pTmS4vxwTyHl/nYocWWRTNTJQKpMEw4BmROTJoQtDzzbBiyaHt8itvfylkAaNZP6aYnKWGpnU
	37us+DM0/wpG1SkZndbwVu+NzBlN200jNkyJFFJjMbJkuMaxrIktHjWaNNbKiCQSozmyaTk/Fla
	BifzJionEnsK79/6OhdLd/p4BYH31GtFdXTiw==
X-Received: by 2002:a17:90b:258e:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-38f6a422e25mr3827094a91.34.1785257894487;
        Tue, 28 Jul 2026 09:58:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642fbf74sm1640475a91.17.2026.07.28.09.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 09:58:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a39191ba-2ebc-425c-9435-f0465d1cfbeb@roeck-us.net>
Date: Tue, 28 Jul 2026 09:58:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hwmon: (pmbus/core) fix regulator enable/disable
To: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Alan Tull <atull@opensource.altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-1-224766e0acd1@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260728-hwmon-max20826-support-v1-1-224766e0acd1@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> pmbus_update_byte_data() can return the value of PMBUS_OPERATION which
> can be different than 0 and that can mess with the regulator core
> given _regulator_disable() explicitly checks for ret == 0 in order to
> call _regulator_handle_consumer_disable().
> 
> Fixes: ddbb4db4ced1 ("hwmon: (pmbus) Add regulator support")
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

The real problem is that pmbus_update_byte_data() should only return 0
or an error code. The fix is in the "hwmon" branch and should be upstream
by the end of the week.

Guenter

