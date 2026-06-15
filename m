Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F3818EB0
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 23:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567325; cv=none; b=sNpBtpbbUq7ETKFL1D1JBq5TWjYIpyAdcBkX1sf1CqJ7+4frisHfbtrdnyd4EhS3JoZaDSsF9u4THFwPcRhDZHt0zcB6xqBKUAgHV4ccG+I3Ml9PwjMPg+ganbwRoDWlqnVHPpu9hHGqOVWAYgi2oJ5k2KXOmEg734JnhWnLzhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567325; c=relaxed/simple;
	bh=RFpD8aOnyectNOwSlCL30Cb8cVy+FaGSaOX9kOnaZQc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XnzxSbPpz9FpyjpgRZ5RjWpChtSKLwaJCG5ozzLngrWc5sWKI0hTNLLxQLCMxwa91eYnxncQ9Hs++78AoYCbtkBAlMgx/of7Gt1y/qxZ8TgVFS6xLBjfnN7kLHVgiA4UycYyc9+rzFUNtRoUaaEm+EGL0JFPWSW21hIAOddUW6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcoYJ6Ah; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcoYJ6Ah"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-138501f8c04so1870394c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 16:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781567323; x=1782172123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BB/jBPHXntj9wBqlIzI1axv+UQMh5wWiIAnC+YDUcec=;
        b=gcoYJ6Aho+U94xatGjcwS2VMargerBPB8yljY6AXxeR+S4DpdP3I49REjQ5akS+DBy
         XFncvVuESWEa/Ru+vz6UBCQfxl206FDa5I+dnjyY5+bSIlWJW1vHMH9hMoLvk7Fe55K2
         kiFPLvhB9TK1hogFYHOLDlsMsDBJYkXI+G9r1PUKqH5FWuvSnfq+iu+k5YJHqmCFiEO0
         NExzS+ExAP5ugBNtfmIOZLs2xEPUhVWwGTn95FXZRF6xXxl+zqKqyYSuVkNXNyvB3kKD
         0R9YgPHcheX8wxghO9rHY/b/uCbpppDvASHuHktl5BRP9W0qA54FX2aymR+vyLMAnvST
         y82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567323; x=1782172123;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BB/jBPHXntj9wBqlIzI1axv+UQMh5wWiIAnC+YDUcec=;
        b=Y/7hppIL1cxu3BYFNd82ATrQ/SIwxRxMaYiZPaIspbwVS03l+nXvkK8MTaCHU08EsY
         DLrBI+Rg78r9CQg2zwtLAZr73Qnd9+w8jJHFBC2N5iJP3yI097K5duYtTjgm7XyLr1dt
         5o6R8MY0Q+Kl8/j7CP+rpF+3x0gd0IqQm8QVM5jqvOfv7p39R0Om+GeaoW7liERb6gA4
         1NVn350DqzFmVvpgaaefK21AJkdig9X2xshsAyEddjaZGLNE7tigdWSRkWujIG2zUJbe
         epAD+Paz9AUdTQmeecrNtS241HdobLurYza6wBrU6MuoLqGX537u0TCgMLAUPboHXgqM
         gAYA==
X-Gm-Message-State: AOJu0YynSPmH/B79EGyvOnB1PEk9MrSjlLHTPRIo8oF3LKBs4RmhK9M+
	OQdA9P3Ypwreh7SXyWEBGHbM5XxMrl3tyZOXmwcQPCIqhhe2D2dwcYDTgtJa1e4t
X-Gm-Gg: Acq92OEQ4Y6vddX09GNIKr6oLwitF6URHP69Wh+RDfhA+lyuWr8FP4IHyK0N1PCLsfR
	3xfEi1xd6JfOubeBP2FD3AJbjMT6MEE7Mu9whFMmnzcBZC/qJ7rvJkTXv9ik4VUWymPnAJOqYYQ
	rUg+SF5+iwQIvgdZzDG3Qm+WmER30L5UCDiMJmBQ/43+ZmHnDMam9VD0Bwi48Huf6dLoswYbbB5
	RY8DDPf43+++3MSQfRJkOkkRj6wkQ1vkmy7QGvHxSH9jfwP1o59E06PmTTRikIYcannN9SO1cJU
	ujMmP2zHYYSysP0aH9rG1+h0pWteSIAZZ4OzHelGARz1bg+zROVQIYucN4d4EIQPr/EjVSEs+Bb
	pJdrJF54HF37BHferqRaUkZ9aDlXwE+YyVhL70W7JPwX+0zfE/bUgR6g5v70CeUwfPg9PAh8IVY
	OZykVdt2eE75S81PhP+eKpYaSpOfWk8e6EonJJ5m55BpsBQILdm/bPg4FbBcbygvlFzEn7zw80
X-Received: by 2002:a05:7022:b8b:b0:138:2b3b:8b9a with SMTP id a92af1059eb24-1386f3920eemr5865620c88.23.1781567322828;
        Mon, 15 Jun 2026 16:48:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b91a4c7sm11633523c88.8.2026.06.15.16.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 16:48:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3628d678-e2b9-4687-a70b-907daa2055dc@roeck-us.net>
Date: Mon, 15 Jun 2026 16:48:40 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] hwmon updates for v7.2
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260615155926.1959207-1-linux@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260615155926.1959207-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 08:59, Guenter Roeck wrote:
> Hi Linus,
> 
> Please pull hwmon updates for Linux v7.2 from signed tag:
> 
>      git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2
> 

There is going to be a conflict between commit 91660aae2f864 ("x86/msr:
Switch rdmsr_safe_on_cpu() users to rdmsrq_safe_on_cpu()") upstream vs.
commit 4edc7d45abc4b ("hwmon: (coretemp) fix coding style issues").
The conflicting code in hwmon-next replaces

                  "Unable to access MSR 0xEE, for Tjmax, left"
                  " at default\n");
with

		"Unable to access MSR 0xEE, for Tjmax, left at default\n");

so just take the upstream code and replace the two-line text
with the single line.

Thanks,
Guenter

