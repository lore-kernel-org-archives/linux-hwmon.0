Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FF3490C1B
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 17:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786728645; cv=none; b=CLKKER1gEBpKcHtFxdTeeQPhLB2SBiso/ufgXnnXvwG0maq7EF1X57O1hlzbDANmb6qE42hl/K/KDd7lAtKLVivgH7oKYRsuIFBtCOICpKvUIzwAp/wYy5Ey2VJiGNRkS4ktusqZxfTRHMoCwi9LXJO9Mg5lxd3/RxeeAMId3tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786728645; c=relaxed/simple;
	bh=ZMmE6HnybGXuW/OUMPqOr4Ds53IAGZtGSGwj9udzJOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pB1k8ZR3uMvamxozM0oDp6KNqcY0mjw1dIXqHXPX6SCgp4HbPC4sbbe8AKOghjLnTZsOx8hJsrSwSTLgew3yk5d2kUyOHnlRrCBbngXerDkIOt4euVzoxL8bIjDo4l+iN0TXylY7O/RwmSfZOSDikbVqU0kv5b5jQGnfaSY/eXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f97oTlWG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f97oTlWG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4980dc26022so13913825e9.1
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 10:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786728638; x=1787333438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QubrOEDi3lm/FL4BqCrGlULbQHcdMBDdc4OsupKoh8o=;
        b=f97oTlWGt/D+Der2gC92NOdtUO++OWllQA+3K6wVTZQ1PZZe236REgtNvGSxf+TVke
         cGA+CJnXRUIr9rUDMIe5GHq06YlmnBAE7edkcJP9Nj2A7VMonNXMtfea8PYL/Y3JnESL
         bCAO0NtWGBHU3wuY4PIV1ysTnKv6Tgg76ZQZ11v31n6SEkXs/Wwo91Xgm8vD4QrtHiEe
         cj8VukDkVPQOIu/fQMARFD8NPHuLRCezVrKAtNPQz91toSQNIhOqp1CPm7G6NmZJQDgY
         2ozfcqKr0mh289P7wbD+0I7ryyw0e6fMGSGZ/AeoLpwC6Ir37VEuxqG86JepbTA5yjAC
         3ffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786728638; x=1787333438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QubrOEDi3lm/FL4BqCrGlULbQHcdMBDdc4OsupKoh8o=;
        b=jvWk7mr2JfRYsW1fMzW0gw0CHfdGMWJaJ5uGd+Oy2Ba+ojKlD2TWvbk5OwJnbanMW1
         Zbd7UgEZLmsCtvViEni1bWuwSd31U1HhKcFl2f1U8HCIYCxcepfAcqHuk9TEMh5/7div
         P1U88B8oB12vezRVwPFfv/8F4Edq8wdZh7rvOO1q4CIk6LfxzZqyFQLbJrI+LAMgrBjq
         /W9C85ERgxM9ItSgMuCvahQH0adiNUAPYWkf0LV0++IgTILgXKW9W9Vlpmki8aO35X6N
         JU9CgRdyjcmI8uugOY9wJOTcKzImu/wmhpBCOpxXFeXP9wHY46KEUP39CZVO6UxAC1co
         yidg==
X-Forwarded-Encrypted: i=1; AHgh+RpQOmNMUJFLvySzpC2rtdjBJZymekkX6NUt5mu9ug86gsRd9SB3rhbemZ5LQ21iN5Fwh4Ou3fyS0XI2yA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx15x+KK9DbclKGwkn5J33IPBHA4k4XBqp2FywrY/PEzNsluWxx
	UQXd2mFCdYtCdAAbLMKuZlQNVOLNIxXOcb4qW8M8C2SPAZWULfd0Uztb
X-Gm-Gg: AR+sD12xLnZBJRxWF//8PgS/Py3ggvKH+gssvhigh4DKl0+lHMXotvXSHmGzrLT8XCF
	Z5i3U5Q0RgaccmCoHWHVuzROydfEj+aWNW2R1fEwD7AkFI4lz/C6Vd0EcHAhAZfRca7c7uaI85I
	vy7r4ibC8xpWoyNDpzYROkW33/+TG2fAwCYILCoheDqHJfxpgMQKTmzQm6rEXv9yrdIAVMwwIJz
	eT53vaPn6iPp2panc76SPIChjcHTRWWZ5+c4EdAmb+UrIwgkQW3fj0cheq1wPGx9IL09VOqa2kx
	4nddy9ltKrmsTi2ICC4NUwojP1LbKyDGHI8K+gB9SbOedzWtkUpVUVsAlAKzqVwbt9G84M2Vo9X
	RwE2ls1rAqlLYS7mwg5ltxLLKDgMiPkVFdlLgCAvS0RWVmKtPtkMjBeMZTsU6uWIeSGc7bZzxiY
	xgCgDi6+YydgM+E4r9fCCkWXuBuVRT1bYxIw1Vh7gL5lkIidlivaUobVntyIBmQWGFnCnNmHFpx
	0DD/63eR/nxTFero8xTj43AdughQOdfpDI=
X-Received: by 2002:a05:600c:3f06:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-49987961c32mr113672865e9.9.1786728637436;
        Fri, 14 Aug 2026 10:30:37 -0700 (PDT)
Received: from [192.168.0.32] (cable-178-148-247-5.dynamic.sbb.rs. [178.148.247.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49989ae96c1sm43136255e9.12.2026.08.14.10.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 10:30:36 -0700 (PDT)
Message-ID: <1dd8a04b-4627-4a3d-b432-ff4c5589bfca@gmail.com>
Date: Fri, 14 Aug 2026 19:30:35 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] hwmon: (asus_rog_ryujin) Add per-device
 configuration
To: Arie Miller <renari@arimil.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Will Smith <github@notthatwillsmith.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-2-renari@arimil.com>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <20260812103532.395049-2-renari@arimil.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/26 12:35 PM, Arie Miller wrote:
> Move model-specific report offsets and capabilities into a device
> information structure. This prepares the driver for coolers which use
> a different report layout or do not include the external fan
> controller, while preserving the existing Ryujin II 360 behavior.
> 
> Handles an issue reported by Sashiko where an id could
> be missing driver_data.
> 
> Link: https://lore.kernel.org/r/5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>

Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

Thanks,
Aleksa
