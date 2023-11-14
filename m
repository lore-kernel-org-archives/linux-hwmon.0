Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024DE405DB
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Nov 2023 14:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnNYjLPN"
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D9719B6
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Nov 2023 06:16:16 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53d9f001b35so8579616a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Nov 2023 06:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699971374; x=1700576174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H0bSGPchqfN9CxyPh13Iokvu0hmCeQtU6WkRF/v0Dqs=;
        b=ZnNYjLPNaxUbltez3BRKI0CWDQITdrieczJxR8DHavo6dmMt2AtP+hZxVaZTPpybPj
         a5Ddzp15N59huKo/eduQEHIR7GHMOrRykTy1LqXDj7XkUmkwzb6dQPkVwNGN+jOJFcMt
         SD+MiGGPgdQ4kvd78lGi3tNaQFK8aW66sndF6Q63IFpNZMBbOvQtbtuBr2jz4dOl2xv9
         45pdDfLtnARJ8wRoBWyoEaXEK4lvU+wCHWd0UZsACuxetGraBMdH7k9Kyjq9js6yRlBW
         dpVFBLRgtQMB8/Ne+wlDObR/OPRVj4pSi1yPc+TbGjt9/dDsLsYpToBUKlyA3v1Z5ICj
         46NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971374; x=1700576174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0bSGPchqfN9CxyPh13Iokvu0hmCeQtU6WkRF/v0Dqs=;
        b=XvSHG5UxlEnWghfignoN7X0Ks1UIbs2WujtLykbxGdVNkDxOr9KZdjh3qwH2YOVR1x
         a0I7gfvWK+qMSeytYV4jLc5bDZwL0VhTF4aMzvFMdRjE2zPvC3AqDCz5SKtlSlR9uQrk
         r4ECjyxFPf/L+YFOpK5r/w6XY2Le/qSm5D7bm+NzFb/CyuLgCxP8a2Mxhe/8tWpFwyfE
         jbXHEAnt641FUGvCEXGJbtJKH+uMSgAUp6gU7uMAgmP0bNLwueZQvwRhj/88bcdmaI19
         dfZx+cPmzX3hO9OUWGSgMcjaCh5LeovUHgKQBYXVybS3Ya+CF8dWcDTDpkXUVBlCv5ct
         ZWtg==
X-Gm-Message-State: AOJu0Yxa9AmbGg00PMuVGBjgwzV/kwfhWHf/LuRElOHrHrw6iGotALH0
	tqwrow0T517ghXlcHFlOunTEcpv/wUI=
X-Google-Smtp-Source: AGHT+IHfP0RXrlR92e41TQ++n5XqIfArPWihvNYZbRXOaJQHEL3m9BLwZ/HtOKePyGOOKbkiosoMoA==
X-Received: by 2002:aa7:d5cd:0:b0:53b:9948:cc1f with SMTP id d13-20020aa7d5cd000000b0053b9948cc1fmr7708924eds.12.1699971374404;
        Tue, 14 Nov 2023 06:16:14 -0800 (PST)
Received: from ?IPV6:2a01:c22:774d:c900:c14e:307a:8e88:ee47? (dynamic-2a01-0c22-774d-c900-c14e-307a-8e88-ee47.c22.pool.telefonica.de. [2a01:c22:774d:c900:c14e:307a:8e88:ee47])
        by smtp.googlemail.com with ESMTPSA id m14-20020a50998e000000b00546d9d81ec8sm5264861edb.93.2023.11.14.06.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 06:16:14 -0800 (PST)
Message-ID: <0a156edb-8955-4775-accf-ff5abe32a8fe@gmail.com>
Date: Tue, 14 Nov 2023 15:16:13 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: jc42: Simplify pm ops handling
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <23f24d6d-ae79-4014-b4df-dc19ddb88e3f@gmail.com>
 <a9b99531-cd00-4d4c-b046-cdd2e8ef202d@roeck-us.net>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <a9b99531-cd00-4d4c-b046-cdd2e8ef202d@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2023 14:53, Guenter Roeck wrote:
> On Mon, Nov 13, 2023 at 08:20:49PM +0100, Heiner Kallweit wrote:
>> Use pm_sleep_ptr/DEFINE_SIMPLE_DEV_PM_OPS to simplify the code.
>>
>> Note: Apparently conditional compiling based on CONFIG_PM
>> wasn't optimal, it should have been CONFIG_PM_SLEEP.
> 
> Maybe that is apparent to you, but not to me, and I assume it won't
> be apparent to others either. That warrants a real explanation,
> not just "apparently".
> 

See e.g. pm_generic_suspend(), it's NULL if CONFIG_PM_SLEEP isn't
defined. Another hint is the following from pm.h:

#ifdef CONFIG_PM_SLEEP
#define SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
	SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn)
#else
#define SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn)
#endif

CONFIG_PM_SLEEP implies CONFIG_PM, but we can have a setup where
CONFIG_PM is defined but CONFIG_PM_SLEEP is not. In this case
jc42_suspend/resume would be defined but not used by the PM core.

> Guenter

Heiner
