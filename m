Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC6549F130
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399891; cv=none; b=Gn+h5l4U6b3T4R3fpl2fLUFNC7XxGgVC/LC+HwWsouzEfLbkPDNoNVv1IimF85K8d7FPUkiVgllDyJSALakEUUatZnll5Cu3dE0Rzb5wgCoe8XocI9MAeHL0qftiQsMCl2WVc5Ggs54PiY4t7FpgY8QoKbAxaTpNVxALPGQLOg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399891; c=relaxed/simple;
	bh=NMWkk7VqLSEb5X08dhPbCYxV9CArNelOzi5HrhzTRB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRwCKmVKb13nsGR3x34g4JFJUDAoR/DrDhKzq0j5xgcN9rTnRgIOY/y2BY0bWQVuesIhSomQXQV7FCPPi0+m9BZSGEV+gZQbjeKGH+z41qf2p4Da9yaGo2/c1pp9ThJlTry/BCVtupMOFMcJfNWJ4mbDOBmZUvg/Da8nk8uUKr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8ZpZK4x; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8ZpZK4x"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso1199319b3a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 08:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399888; x=1790004688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=80/p2r+sK8JMp9zNzEgv5gzx5JVorvjEM6vLrigBwZw=;
        b=h8ZpZK4xMWTqOqn0FwqEmd00rSPtXSkB2uXS520GtEXk4X547vQ5wSCxBrYebbPUw+
         VDjHsKUDZ8pCxo1fOZRsIavf90DRgWetwNHC1o9t3Kq+VhNGLzYuDF88iCpr5AOJw9xc
         190C1rRzIXf4Y2qkhJVggnqzwC18TkBNdit0LqMe/6RHusZxwmNA7pG8Bh5t70SFln5Y
         miHSF5EMxZOEpNgCRLTPlfofSRzFG71XZA0Rihyc2YWqUdKhRKeaOrXi8ek9QBcM6SsD
         fRzT3wrTuyl7SRyYwaqSOaj/EdpzPJUDXEAAfn65v4Qa9XtNQDaP2hs6o2OLEJTHh5GU
         SXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399888; x=1790004688;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80/p2r+sK8JMp9zNzEgv5gzx5JVorvjEM6vLrigBwZw=;
        b=FJsuDjAIWFY6p5NNgijdJUbXyA5rBj2zV0+RcrvhgttqvNypaRVA5w7LBx4+qYDGC/
         keTCRuBEjj7xxx4SiuG+oAStwfnmd9xjP2+X7rmQq5j701M1dPP6h1sn9yj0AnYx5gwx
         HEXosh1zS+lfWbl8trIO1tgw3JcOBZeCEVcrhbxcSlwusrH2PgwZVnVh91RrzAH7t9vo
         k27MMD6WttjDxRqM23tMJggNZyH/lKest5Lh2vJrjKbAOsvmQKTziLr3VCy92Ez16T0u
         ytxBzuzOd4PrcSi0FOxSdwyyIu7oknoG/wOj+2gvuf8xjRlss7qtLzUjFZEIcok5gFL4
         NR5w==
X-Forwarded-Encrypted: i=1; AKwUvBxfgWlR9xI3jbqlcyGV7diRJscZHclFM5OBEZdRIkcMjMdHbAW/Y988B5unST2/ZpB+OAIiPjBbcptI3Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kXDH8s+vMDrwgF6dLq0DPW9d6pf8m7c49Z6FQjW0SxPWqNLG8O
	MJYOBRgA3zZ4vPk500g3ZPEnAUz+tai1aYmvHjsX23J07/nClW6TVtM5
X-Gm-Gg: AYBFou2zDEc3Lu6gySgTDhmGxFQ8r5GY2jFQqBnvxZJCOdZw0NOd19VACUvTizlywzx
	Dmid/lOdmRw3mt6i0hgJ1bi89ktyE6vhdLRDrQ/wGQeSRcwB6vJFPWUr+aY+BAcLx2XNJZQ0+7k
	ZUsXYFOoer/fbHzLubUXeTWkl6NeYyw1i3opDobnt7ryN4ZKbc780h111zNpKtyn2YdqBzBarqj
	T2nUrzB8yOKYYqw9vAquf9tg3hRM+Cxs9sXngF6F0DFJTTjL55oeJ2QasdnQ2rF6tTygTmnDdlj
	RFcw9R3M3GCOgTWPOq/9bD7qnuQYWajxC4Tvh4E94vdtmSH9rSZUt4RWbz1TBZ9w4vtqr8v6u23
	UiAGxZ8eWiaBMJxHb38uvgq+v9KhGWrd7UWqdN7pGy8utuedno77Tzhtxxwf5qmHgjlzbHTgID8
	nIECaSSWdGcB2ScfQE2MDMvq+T8tNswTXr3JdI1s9pk+heQ6VhhWyT7UeYjIbTOxSkkbrBtstUt
	ZShbOW60DAeaQ==
X-Received: by 2002:a05:6a20:6a0d:b0:3d3:af86:fb94 with SMTP id adf61e73a8af0-3db406baa5fmr6579605637.26.1789399885429;
        Mon, 14 Sep 2026 08:31:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29ebc712sm4804163b3a.49.2026.09.14.08.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:31:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:31:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Rudolf Marek <r.marek@assembler.cz>, Sven Anders <anders@anduras.de>,
	Jean Delvare <khali@linux-fr.org>, Hans de Goede <hansg@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83793) release probe data through kref
Message-ID: <49f5d298-e250-4d18-b99c-aebbfe0ef458@roeck-us.net>
References: <20260914073638.1662500-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914073638.1662500-1-lgs201920130244@gmail.com>

On Mon, Sep 14, 2026 at 03:36:38PM +0800, Guangshuo Li wrote:
> w83793_probe() initializes data->kref to manage the lifetime of the
> driver data. The normal remove path drops the driver-owned reference
> with kref_put(), while watchdog users take and release additional
> references through the same kref.
> 
> However, the probe error path still frees data directly with kfree().
> This bypasses the kref-managed lifetime and discards the initial
> reference without a matching kref_put(), leaving the reference
> accounting unbalanced.
> 
> Drop the probe-owned reference with kref_put() instead and let
> w83793_release_resources() perform the final free, matching the normal
> remove path.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 5852f9609d21 ("hwmon: (w83793) Add watchdog functionality")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Applied.

Thanks,
Guenter
