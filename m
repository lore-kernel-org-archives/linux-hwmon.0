Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601731D52B
	for <linux-hwmon@vger.kernel.org>; Thu, 31 Jul 2025 23:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754005315; cv=none; b=baMXJzKDlfirZgmLWAIkjegaIR2i2ve4t4BWX16K+KGbmEf+XJ8WOSTOgGAs1UWyLZvDUCBC62Ih4wgAN824mmzOtGBjZMrGvcoUJr/HSFnx/ulHboHc2kcHx9/tkRvRNw2Qr2fjuB34NAVx2vQWj0JFkxlGa+LbFd5sSVD+KAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754005315; c=relaxed/simple;
	bh=pFzNZOO7jG4UEzq5K2DZsCFedes5J07emF5hmCApCVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGLUjtmMhOurOKuIn2mRysK+RrIagBo2iuvhu7umtT3NYyJUMZ+GOc7pc+4SA6kUdU3VC+Glt/I1UgqeiQPtW0gD6jNyqMZEN/kXsstZWaRbU9UWRfp7JN2sph6WLCXpVneHUzdSsEUXVbKZ7J08Nkek6/UQlw02tGFA7RFScYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/SyMogS; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/SyMogS"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76bd6e84eddso1131159b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 31 Jul 2025 16:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754005312; x=1754610112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o67sWNrA7e6K9/r2CYxhCQEwtzTIc+hlRvO6r7PCbK8=;
        b=I/SyMogS861abhpT2eulZtXGFsY4Q8vNIQ5RvORo1bLT7Qpy5nkoc4cN4zR7LiBN6H
         9ioRLhwdfx2P+ilkzpFlYqt8J/tbixtuKRUcjcHlOx+Atg4BIY01kvkc7T3MjnNx8zwA
         CqzXJZNCeNYXI+Sk0L76GbrX3y0pt1ar36O+9jJ+WDhwLqxePOV2UBIdbOSHXKpBtrf4
         GfCaepUHbEKJE1aLqrGQM/xVrRwxctnqCArpnYmij7J277c8lYwW2gWLOqvoKhwxMAJU
         w1sHWj6sS0cBcjZX5U77o3JkcW1c+EkmeKgv1Hunef1DHoHDQKF8yP6PH/Q6fzX+q/8A
         yP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754005312; x=1754610112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o67sWNrA7e6K9/r2CYxhCQEwtzTIc+hlRvO6r7PCbK8=;
        b=UBQfDNMmAQJLOayORa+KUpr6vUT1uYD9dZ9iWUEwtJ7HLXoQhho0M0zjEPUFTMXvdi
         2elnrvc63TM8Go2DLZ1mXHca/YFKCC2N0vZzw2lORZCVa3o5e9+RBmSc+lD0nrfzdikR
         w3m0oo46NozVmDPxnE2n+ZwJowy1E9+2DcF5jI+HM2W24/m/+nJiPzHs1Wzcf5b55CZD
         48/O4aCJTSlomNpKnRmXfMhU7ZUSta0/Gkb2Z8YyJsDE2IO6mrfWKb1SeeEO4ggNUqt2
         OjXHpQd9VkgKpGDSAWtwjUyS+fUMYQ8CHPDMCuNpV7xhnrjlbe04EvtDxA+dQMUP3hDK
         zkmg==
X-Forwarded-Encrypted: i=1; AJvYcCWdqpJ1xdtYtPJ9zmHCdcj/VVefBOqaxVirvifyKv8hn75NzwXpXrGGqxhDUSLL2t4G1O6TPTNdj7VktA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlrqhl1pd2D3VvNViykp7aCuxgiq5I46sHGBxw0pDsIXRMjmQU
	50Y2HbwpAXkb8sPklbw/lUr/45a0S+uLj+KgRu9Eniv3ziIzkDkRDPix
X-Gm-Gg: ASbGncvvrDKV2Q8OlKYaMNmppqT73Dpbm55q5BdK/ob2GTcM3yQStzaoL3JKFLUf+pu
	s/vrq/RWy+UtWum7mpk+kayZlbkkAKASZaFpdqJEZpZ8VcnT5IktjniYJpY4T+Ai9nQxSolofYk
	rcqBCyxbVhFYGwj/eNZagMDFtAvr+OGj1gukugSazJkIfwLSP5bHfPUVo9FgSpjd783PqnKiQ5c
	AYBAmnQmQWx/d72e92TsO+p69LiENkpwNCmrKuBe1KE7EfcEuwfRzN+9eL548xZkG+GTlgilsqd
	m4eCiaGMNzDyTZod6dZwWbqg/XvEhDHpyHoTQP5kLgyyfoug8CuJoqk1TNfFtlJWINouulqg49u
	Eq7UXhntsVaUDR0JCu9HLGDXTd1rV6xdmkKP4RWMdbd8pbw==
X-Google-Smtp-Source: AGHT+IF/GeOLOVe7r5F1XY/5Fv0uRbRiKER99K5aFduOKWVeS43qdU2L8q4CpUJPlCEROvTmVVTBeg==
X-Received: by 2002:a05:6a00:3e0c:b0:75f:9622:4ec4 with SMTP id d2e1a72fcca58-76bdcf1db98mr975745b3a.20.1754005312478;
        Thu, 31 Jul 2025 16:41:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd2046sm2528191b3a.106.2025.07.31.16.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:41:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 31 Jul 2025 16:41:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vadim Pasternak <vadimp@nvidia.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org, idosch@nvidia.com,
	razor@blackwall.org
Subject: Re: [PATCH hwmon 1/1] hwmon: mlxreg-fan: Prevent fans from getting
 stuck at 0 RPM
Message-ID: <c3f94916-39e6-4787-91bc-ea818e2b836a@roeck-us.net>
References: <20250730201715.1111133-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730201715.1111133-1-vadimp@nvidia.com>

On Wed, Jul 30, 2025 at 11:17:15PM +0300, Vadim Pasternak wrote:
> The fans controlled by the driver can get stuck at 0 RPM if they are
> configured below a 20% duty cycle. The driver tries to avoid this by
> enforcing a minimum duty cycle of 20%, but this is done after the fans
> are registered with the thermal subsystem. This is too late as the
> thermal subsystem can set their current state before the driver is able
> to enforce the minimum duty cycle.
> 
> Fix by setting the minimum duty cycle before registering the fans with
> the thermal subsystem.
> 
> Fixes: d7efb2ebc7b3 ("hwmon: (mlxreg-fan) Extend driver to support multiply cooling devices")
> Reported-by: Nikolay Aleksandrov <razor@blackwall.org>
> Tested-by: Nikolay Aleksandrov <razor@blackwall.org>
> Signed-off-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Guenter
