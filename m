Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5022336EC0
	for <linux-hwmon@vger.kernel.org>; Thu, 27 Nov 2025 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259728; cv=none; b=syzyMuXeZ0H8AgtDH+/i6hNHyk9GWEhzv/FAFDD2lacZu9MkOuL+e0+Fsxj7OVJ6yLLGKrALBsZC/wsLtMTCb6nRZHxTJHQC9ZaHHm4ghKHLtOrCmm5Q8YYjmeBwF5I95Xi0DGQTSn9RmBT0W7kP0ImDnPCmWucHTD3ojCRSNqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259728; c=relaxed/simple;
	bh=ta5nvtkAvSEQ0YgT7d6P/ibBZiqxnWaoK6Psv3QiXqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMcLSu10b7ulrVQ0zN0GgsAwJXCvXjM9fjGVa/WwjhmRrqeCyboBqdJyFBQFxn+SV9juOLQINH376dg2bWO8uslpYVgLpkgj65ytOJurwOs94THMJOSM4cnWWSvZOJYqrfLezZ4nMYQv9Ocd1GXc4i74Gxa7GKkinGIIHdMCLiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNdwRw+L; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNdwRw+L"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso621621a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Nov 2025 08:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764259723; x=1764864523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8go5ngYUd73cjKuDGIyMFUa6ctvuEnzg99jFKgPO6g=;
        b=KNdwRw+LMlyITikDE03NnFBTKHvy+xLI3xhIaAY4EhkZ+fZKQYcZYMDZGv2ZgXqcyK
         RG1LCX3fKrSU7OXfEKIdMUpdH7BD+m+lfinMODZV1emmVxskBJuP5+5G03+IGxD1RVAe
         jp5cnHjktpDCCqluaTvnvJDJbHuOOkN7/WaDLpSczfmDuEFG7nW+/gQyfrWNXMTQ6Q5S
         UUWHMC0OvmSVglvrl4oskkARsBvugl3IWt+A/9YiAL4pBnYGtmQsy5jh03fHPSUiEdTx
         FQ0K+EX2X3GMFYe/N+nvARoomXOItfsEiLdOvyzv/YnquuEORCRmvJSMeHTk/ErFvCMH
         Pm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259723; x=1764864523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R8go5ngYUd73cjKuDGIyMFUa6ctvuEnzg99jFKgPO6g=;
        b=cZQ4q0viacaOknFQ+zj4UTC1syzYAWhlxa5TIRt7NJKy/nG33iG47BSQUuMkcO6TRe
         wZ6XPXxZN0yZGSQo6Jfad27Em2e7i4Aj0EyQICh1cFHsFYvAN7DUrPsXup/DMYWU9Lpi
         ziEEF48kgl/X1Z5qBNJ0Vzp/z6BYEPO5Z0hSN7BUTQVir/ODQuTRAfgMaAXZCXfuMqwZ
         5B0RVu3rmtonLjbn5zIu1I6+oOAvOoxlBdgJe7DGV5Z1vFoAHAE1mjHBT3qVb+oUXGzg
         SdT8MYdvrqpKlvHF+6weh59tQ9kqF4qi2F7vQJpWHYCWj5btoLdCz5mrwKmNpGLrvwFv
         kALA==
X-Gm-Message-State: AOJu0Yx3n6RK0ica9Xk3CkQ+yRUWrVOn40gSA2RECxkwaSNmR9w34ENn
	IEcdInCwEhgbD7e/mmSi5BFeADQpM6sGJd+er+3IoUaWmu7v4JGz4xeD
X-Gm-Gg: ASbGnctnqFo/v70jrVaAIeKQaXbfsNExN3Yb6o5dO/XOC2H0v9W2oYvabQCfhXMWezy
	nPYFRLmUzHmGggfGEUgAOlz/LbpXARErEyFf3fC/WFfLyRYITa1PsRuBdBYXGTKAo0qOILG2+fl
	yipcVhlNEzXi6ujE6SZ8NatGMLMU9yybRG8SqhHByR+HwH+qUTLdzC657wNqjrE9phDtV+uafak
	RsSdYJhNZjPSg5IUYrGdc3x9aIRzDOtMYCQMZe3XNS1NVODtV0oRfFQjKRFXiWE0ffpAxPRUKbv
	MYWl4okIrVEZFcp9C0mdgcubJIxJR0WEB7ErOBMwi4J3tin/F9KNfogY8WZPZZs5PUlps+t90Rg
	uKf3d5ACIeqmQSq9jDdizrpx8ZPpoe+NMcAIbvA1rFTM3+q7MTHJ/d4gXHaxNFOGI37LkcK4PLy
	Rt6YrhvzOjhwIN5cNKRkq542Y=
X-Google-Smtp-Source: AGHT+IGNzEBkzLWPObgUvVK78LZO7aewF+H131l8nSXj2T2UBjAmy+ewdhC6bKVn3L6oihLw1wQohg==
X-Received: by 2002:a05:7301:dd98:b0:2a6:9ea0:6db with SMTP id 5a478bee46e88-2a719fb9759mr10317934eec.28.1764259722530;
        Thu, 27 Nov 2025 08:08:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965b47caasm7617756eec.6.2025.11.27.08.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:08:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 27 Nov 2025 08:08:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Johan Hovold <johan@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (max6697) fix regmap leak on probe failure
Message-ID: <e837ac90-5d2f-4c58-9d76-d2076ef52f1d@roeck-us.net>
References: <20251127134351.1585-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127134351.1585-1-johan@kernel.org>

On Thu, Nov 27, 2025 at 02:43:51PM +0100, Johan Hovold wrote:
> The i2c regmap allocated during probe is never freed.
> 
> Switch to using the device managed allocator so that the regmap is
> released on probe failures (e.g. probe deferral) and on driver unbind.
> 
> Fixes: 3a2a8cc3fe24 ("hwmon: (max6697) Convert to use regmap")
> Cc: stable@vger.kernel.org	# 6.12
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Applied.

Thanks,
Guenter
