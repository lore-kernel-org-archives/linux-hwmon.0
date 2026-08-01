Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751C234252B
	for <linux-hwmon@vger.kernel.org>; Sat,  1 Aug 2026 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785554006; cv=none; b=uWFIUDmqukN++UYIbdGQRV42apP7dBbSHoFfODjaZijIj5UnsOqetf+hs8xAmS3B1rVZuky6/G0nltwDY00OTlDvR488MJjMTugfe0BD5wtB+c1pHFWg7m3zujHt6I+10bMJEkGyzKKgJnnkB0YGkWNRgsdM40JuvqbWKr5aC9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785554006; c=relaxed/simple;
	bh=M/NbgXygmZlvsXYn7JhUqYNmLBcTfBFy6CdYk+FSEBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKNpHK7p2FU8/8+STUlaPdYqUIWy5AanV9KG6cCL93Tw3m/ttgetbqc6n8uKyc3oQcmP/RqRVAfH9vqRLl8meeuxzs7Q4s7fEKDH3ODMotdg+nQ0+Q8GMHqmWOnUUAM3yaLGZ1hy6h0s1dUp4NSBSC6yBSmTfnsyAu2Lc6J98Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fawJ/OTC; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fawJ/OTC"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51a868b6962so15960031cf.2
        for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 20:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785554004; x=1786158804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OFQi86wobJiii7OnOtEvTy6WOJzLS6xjh5R9rXpZtc=;
        b=fawJ/OTCEqwj1b+9IreOCR+Eg2dKb1+wyflIumzePNtRi3G/tG3PCaXujRFKogzvTB
         TQX1n22PjLKVe1kXIttkQq9ixIBGZpamZgvtkx0u3b7tQBy9BDdjrVZGP7nzMjrpISCm
         ZNk9uEOt+W9863tZ+VvU9sf20hrYQebuchvuc2fxLyIZfamqu5nw4YMFmAXJPi8SqHZL
         7xquiDuNUvixhtaNvcvRvPQ6AQ9lAxfpXbTJ6CMwE1kJVKSRapT5cB+4KbzsaYTrlntS
         XYinKqnphIiu7ei9fKCX7X8HC1fw9rEhpejG4zpbFx3ov5nC5UD/3voCPrbrcH4to4+6
         Ck6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785554004; x=1786158804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3OFQi86wobJiii7OnOtEvTy6WOJzLS6xjh5R9rXpZtc=;
        b=EBkYElRpFmyDu+3XiIrgONdCJbqf6Tk6OrFf3QbiwSFLtOLmSYc3aKLVTIc+UGdxhw
         Ci1y9jnWh8ONOfAlIBx9+VptGwFqAz5+NtWMIgLwvu7Y4F9fUFwKStugPjMbH/1XALH6
         xZC78Ybtgk9Ct9QCqcaKkLkkvs5nmt5idpTjaw8njM4aBvvDJXx44p/pl90e5pQs5+Ls
         IKIFJzizUBnJIYGjHV1BANVtrOEbZeT6bqJCHounUA+nmiVwDBjbFRpS9nHHAkb+jQ8N
         GFBOMa4VGwq0EGA8PJQCNWr8fVZ93wxmkTEQvMsSIMKnyXXYmA4ywmbrE0+1zu2GznLh
         o2uw==
X-Forwarded-Encrypted: i=1; AHgh+RrtiqlhLydZWEk69SxzyBpBIgOannHC+NB5xZ+ei6RIE3+3M0YvRoX/ThvES8l3/w8qQDIRy1JF4rqkMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysnymZyFniXzV9SHmhXUSJMR+O1q994JA6nJgRnMLZWQLuNFhO
	NtUrcPit8oBOrsWTinxKcc62XthrFUAXiz3tdMRT2rJNV7F1fGEXy6Dq
X-Gm-Gg: AR+sD134znDHHnFMXxEwg6CnxuZs0atNzgsamubwUfPJS5TuBKHlcnzf8EDYMLy3wOt
	Di8Ohd0AKpCCbocyCuRrj0qMP0aMoNawGpFxMrM9FL/CsU5A3MQVudkxzDQQLuCV24GVTGbqgk7
	HxnL/FBGedZeoODSdiOdALu1a3Lk9EbT/MTjMtH//PHru0iZuHKNxskxlBZ+wqRBGZ/GwPLL+jn
	GHj2zy7ScFtA0vBO64KqynYah1YlNhjI+LIUOGn+S5Pd6Nhxmzb3E7i8DewM8VopVDkVE6jDfxv
	PChuZ6huVvSFpDkxh1tU1/fxQb5CWpA3iZtd7uy7J1Mikrp6IO4dsG40GZCTyhU9AFzaguYcCpf
	7qyIgUqeSGJ1iRITtP45HetJRyWzNyRNmoKXh38wriXBRj+t6uwqkP3ULr7w5bnr8bnpjZalqQ6
	o9NYLHAZL1vT9apxdXUDNscwHPwiNhRbTy7abUdVMaH43e4tU3F08JEyctmYajQIubfA4WYGf+R
	CvF/aLPKRPbcI5aqOnE3g90ZPgf93c+IERtazrq06ohbuxX
X-Received: by 2002:ac8:58cb:0:b0:51c:88b:d7e3 with SMTP id d75a77b69052e-52b5666b75emr44233251cf.3.1785554004223;
        Fri, 31 Jul 2026 20:13:24 -0700 (PDT)
Received: from [192.168.60.12] ([207.115.103.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908436072d7sm24632176d6.49.2026.07.31.20.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 20:13:23 -0700 (PDT)
Message-ID: <4ac9ffe4-0f14-45d7-9a62-7a5fe7c40bf3@gmail.com>
Date: Sat, 1 Aug 2026 11:13:14 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v8] platform/x86: panasonic-laptop: add fan speed mode
 for newer models
To: platform-driver-x86@vger.kernel.org
Cc: Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260729044332.382862-1-alexyeo362@gmail.com>
Content-Language: en-US
From: Alex Yeo <alexyeo362@gmail.com>
In-Reply-To: <20260729044332.382862-1-alexyeo362@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

Please disregard this patch.

What I have found is not just a fan control method, but a set of methods 
to control active and passive cooling policies for the cooling device + 
a way to cap processor power and unlock it.

The reverse engineering notes are still relevant, but I had clearly 
missed the part where the fan code is in proximity to the code that 
toggles the power limit.

Given this, I no longer think this belongs in thermal or hwmon. 
platform_profile appears to be the appropriate fit, although I will 
continue investigating.

Apologies for the confusion. I will redo the patch with further testing 
and data.

If I do move forward with this approach, I plan to submit this as a 
completely new patch instead since the current subject "add fan speed 
mode for newer models" no longer applies.

Thank you,
Alex
