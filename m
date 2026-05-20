Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D05F36A35F
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 21:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779310944; cv=none; b=Jow6sJTDyo3oZCkZ54v15V96qAa1RgcZU6YUzBuY3k5t4bFQaC78MiccSY8djPzx/z/F1bjjx6ILVhyZVa7JfholjtAV1m22SkjEvUzV3FQtbVBp6+5VjByHHx1YgX3KEx2BgEoNYVImykmIt5PpVKLnRgLNj6zRjcZKV3kMbTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779310944; c=relaxed/simple;
	bh=xQKB7CIE4VjzLRBLwlAbP2vGsCXOBhOpQ7c6EF2CKLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7TnS7e/T5pY6S7CD/1e/fz50XgkJhVyqM5P5hsc/39tCdft5IKnUnAmLgEi0H8hYg73JmadNBVusW7os/2gD871FqJn7iQeibquYmu/SIFKYW7ndDmCCpOg4CirXue33Ry2OoueyplIPN2l0UGtFO5xHgXh02mUpvhOvfm/GGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqjDNPNP; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqjDNPNP"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-367d88b9940so3497252a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 14:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779310942; x=1779915742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VTmur95naqjnIgZ5hp+V9rZ3PhbDCDGfUxAndYAErTI=;
        b=jqjDNPNPLM/k9b2VPgVn87eYxyoKlXdJAFG2HsLjT8M4b0irp2E21xk40tCs42R8bv
         u9f1bCCEJPr5tMLsqrCzGFeQ/Q544utaqnbuEw3RzMQI0IYb5qroZyKiPCPzCqLxNQjy
         uHdp9Fj1b0MtMWr2ftjffKONGBICREs6dSjRy6xYLC7ShtBphPRUUJmU8E/Jmsxvq19r
         5ufNv46sGpobwlxPM132It+Zxy5h1mN7RYvnvlttghyl3Fau4GdG407bzDyWAjWXQtqE
         V3eE/Yg6frk8bemEhrPPXPRSuhEHSmEoDS0geJ8AuS0kr0DQNibejSx0WLQi0MUhVtFC
         XC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310942; x=1779915742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTmur95naqjnIgZ5hp+V9rZ3PhbDCDGfUxAndYAErTI=;
        b=WVG3bmR/f+5ZiCKZBvduNz5DC10j0jxQ3DvStUbnc6lB3X5OE3OZHf3xlfMs5qeuQt
         U4thCi87SjLkCCI8C74+pDZZJYxWjXsmebHnlRp1LfAypJNE1OAOhswVbNw4Bfhp9rSW
         TrbxJbTzrD7spn2pq+PoTuRThp7eHLyJDrDA24dcbjWa4ouo/495EIWyJ6j8F4lYb2e9
         lYH6PCvpR0XJnRSIuBvURFQr/all77xlvmWe2uojuB+nxWMe6akSE2lyvcLKXS3zoHvy
         bPmfHjUJ4eBff8yEP820VleiUfvsyDA1RzQpSH246qMcPyvgOB3K3tAY118HOpoX5XCw
         PZ/Q==
X-Gm-Message-State: AOJu0Yz2Vy8xnRC0aGrQMBZPrXMUiDCHdZSD1BcTWn7243Do1QhGJc+7
	2o048wa6jI/NPRXTsv4Du61jHkcAE/A783C52WfpsN5OWd+9gXtF9It8
X-Gm-Gg: Acq92OE7WTyMpdEKofiyXc1PSNyOj9y2RkYhi30Wm6+squbR6JJWEzB/3JPY0ybWudM
	mfXXriYVipq7IDYSpw0khHMdsytNfF/Vq3pITYMvArr8CoMj3yaxITjJcFObrskyvKZ8VC7r4Qs
	lmd0joDx//e9+evkTtqYsCteNJDMf2RijmVfAEF1qEeX3zr4RbEgCh2+9qQiC5Ozpib/flmGbUc
	nHNXeDNnkcsCF2umVSVhUPE22m5RK31TeE4qY8HHUKKBfpLZfAYobACuo9HqvCx1xcv1fKWY4CR
	Jot8YxSqt8G5wUOxswI5ShzxrQYlpuH7ZZfWXDMvlgPm4EB3ASlCB9+K8T8htW3wif+SMuJSNNU
	G2Bz5hbbO+vbqGY8nBxv7JhtDFxCelLtc08v6wzUZuR2r8zIlDId5FUJehuEtzCGUdWiYQQKL0C
	NnS7D8V7a53s24BYqF6MfPdpmNx00mIohs+dEPhy1NnY5z2GpiYJ70C5fjM2ESk7hGBpA2zP28
X-Received: by 2002:a17:90b:5245:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-36a4562f4famr149583a91.23.1779310942284;
        Wed, 20 May 2026 14:02:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45627582sm26232a91.1.2026.05.20.14.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 14:02:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c11e0bdd-0684-4312-a7e6-188f3f6437b0@roeck-us.net>
Date: Wed, 20 May 2026 14:02:21 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: nct6683 Add support for ASRock Z890 Pro-A
To: =?UTF-8?Q?Reiner_Pr=C3=B6ls?= <reiner.proels@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <4eee938d-e4ca-427d-a161-aa9ef737af3c@gmail.com>
 <7ec1cd4a-c094-42a2-ba60-e6cc7d82e7e2@roeck-us.net>
 <ef137927-4626-44ec-9726-019be9347d2c@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ef137927-4626-44ec-9726-019be9347d2c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/20/26 13:46, Reiner Pröls wrote:
> Here the patch as attatchment
> 

Sending a patch as attachment will cause it to be dropped from
the mailing list, the AI review agent wont see it, and I
won't even look at it.

Guenter

