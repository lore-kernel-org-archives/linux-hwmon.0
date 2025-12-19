Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC36D21ABC1
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 16:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162796; cv=none; b=Uo5lN8776yxJdvpYdeRuroVIxAQ4PdlMUTr+3P+8gb3wUHBxhGYEAQfCvNTCCxalhxFBeaOwM/BGoDBIM17twcM+zGu30A2oIW+VIFNN9IVkf7REeIIix+3n96x5ZPvEaaoVHvRFxKV6aLY6WEMtStcAD2r+QulksN3bk/CsOsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162796; c=relaxed/simple;
	bh=nEWig0tzDzm5xt5qbQdNxcn2sf9/LJNik+ZHwFfkeMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rD5Rp/qIOh+Wzp1mzAWU/nqMenhWwxTTZPSfwT7YddLT+dT5DeH600As5Zu01o9EfMa1z/Bt05r/Z6AQ0rvkVWn72eklN+oR4OYQzyoDqCcUQDs0rwbKoE/sx7ko5XKUE/bZov/yxkaYEZ1gobaLm9nHXRRRDDW7OeHNcIN3GAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwCWsr5A; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwCWsr5A"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-11b6bc976d6so4497434c88.0
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 08:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766162789; x=1766767589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAWmfdrICg8ZLplR/r0+EyeQdxGsUfKd2Ck8KmKZVd8=;
        b=dwCWsr5AyxJXrGsifq/yNY+MWazHWKGpJMOm4l7X2UXMGrcJXnKv3hxTri0E8FL8II
         8jtw5E8Msls3zc1OFIMqv/P6jMYlytw1XUXM5CzAK+Ka67a30VxeU54qpfem7cm49g8d
         UUEPzihWyCDZ/k0ZFatn7vAmRlUKUgrLNbjFXhtXjM9ESfiylmxKorbw7GTgzrpm6KCT
         wJnvyPrILP0rnA5UcfmoplO4q76abeG/4IUq1A9TELETmigGK7hA6ETHHZQW6z+puycC
         qpjsHxU69ANxf8R4zAu9OVk+ZP6JNYWLtXRaJHujP1k9xDKYPTlpeS5XpICp7jHTfouA
         jcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766162789; x=1766767589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vAWmfdrICg8ZLplR/r0+EyeQdxGsUfKd2Ck8KmKZVd8=;
        b=p+fVq2tf+0nM+LPILEiJqdbZvL1JVAHDF+GsoYnVcqPFllKNGUZBgsSal9thpaR0Vb
         o7ooxr/vpZ1tw/fE94mPnNa2YpZJGDrJBVCeKZnrmCBC2D3GMtl7gKb6xcNr0YKccQ4L
         BJqDT/pexW/JQBrIoVBZy9n8HrGeHOOUt6DNnbES2stvV5S9BNIrVEVpjG9K9I/MoF9d
         K1Hk5EAX5F1RhliqWL0qiieosouLKQgB6R3Gxun+hF8uqGPCz2sqf4Bkpq2jAtyORPMQ
         vELtRQ8b9nPghk+295SG9ESVcsq8t9L9J4XW9UVXxU5PXBiP2C3XjY3jtfNTaknE9zTZ
         QhQA==
X-Gm-Message-State: AOJu0YxPb0CAUktU1PThIjjiC/s2a2sMf42N9vwojB6YZX3kGoc5Gt15
	OuFZieXfOsHhD0ZW+b8NZ/HNeFHxPLSP+gGQovJ9Wcx/gjgG6Kluun3V
X-Gm-Gg: AY/fxX4Bv0TWchaCMQwdlD/XyRbsuWcbp9KSiqiyb3dIPWa695hWygRq37fs4hFwiAD
	OT170RfPKekAHomrWDggwHMxpIqSYF+l+x68kJiTIFGZIc7ePvMnHhXDtr9CeD+5HKR2bFwAvJH
	XVSFvcjuWlaN7BXCe7IrcAHGg7KvSYMmUkY6NE7ddJj89ZrYExQ8N5XP+u5kaSTIBfC8sLRrwbn
	sM6c6cr7Xggk5wBqYaWE23AVCh/Y7O0EKRsSFB6+/yXS8Tm02uBFZFxlEDhCxDhzPZb+byJxDeI
	lUG5nX4gzDVsKWhykd37mZx0xqQz2kvVH4509orxs9qrI9MXi9+Gq0Tgv1x6+neS96k/VRecQgh
	TvBAX1ir8FQlBn8keg9Vn3x1NY6f9C96bkgySbZXkr9czLODL0SZkGfZpH9q+9PWVfGZW5KnfpN
	Pp+dt1YztfoNwBGQZr0H2U9kZVtjz4citc0OU=
X-Google-Smtp-Source: AGHT+IG1HixaMJN/f4zSgXemZdRM4ILY5woLNMAxId9KZMJHOVo2qzJQ9Mfj59NqX9zUU62BE6BFnA==
X-Received: by 2002:a05:701b:2818:b0:11a:468a:cf9b with SMTP id a92af1059eb24-1206193ce7bmr7608646c88.9.1766162788756;
        Fri, 19 Dec 2025 08:46:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de25dsm7546547c88.7.2025.12.19.08.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:46:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 19 Dec 2025 08:46:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: Fix wrong return errno in *sanitize_name()
Message-ID: <f8e31366-a469-4513-90f3-65d8ce5e8cd4@roeck-us.net>
References: <20251219-hwmon-fixes-v1-0-21b29097ea3b@gmail.com>
 <20251219-hwmon-fixes-v1-1-21b29097ea3b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-hwmon-fixes-v1-1-21b29097ea3b@gmail.com>

On Fri, Dec 19, 2025 at 05:48:14PM +0200, Kari Argillander wrote:
> Currently if user of *sanitize_name() function gives nullptr for name
> they get's ENOMEM. Logically it should be EINVAL.
> 
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>

Applied.

Thanks,
Guenter
