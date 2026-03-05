Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1F0378D8E
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Mar 2026 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722026; cv=none; b=fBLFibop4wmxi7Zx8pcaDqBt9Ta6nimV/u+jG/lrmfo6XOp8kJuKFUdNtFidHmxuJZ0loxc/yGPl850hxHX64lzJwA11UsNyQy/P0zvCzFNYIKUOak7bDij1esWgOM9p9VD8IhIiyEnLCEZ+vEWKg2K62do4wBUapn2ZJaklc/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722026; c=relaxed/simple;
	bh=uBxvabcAKKc9GycYpWhTNkvX6gKDgXPi95h/49nUPcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwAz7kZuaQBmjS+fDAb60UHaXrObh/mwpMKG6jis2fl0xNodRpl2KlOgfUYqT5TTOxzZ+O7kHDOjDJNyr+/66nbtBr4Oit81dw7u9hKC0TaGRg3WKOn+N6YiGCk+5bz+3JhiLgwI7C2lS1YmkFPey1AMHICNevUXfHknjo/20rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGhuVJdY; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGhuVJdY"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba895adfeaso7172990eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Mar 2026 06:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772722024; x=1773326824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mepahCioLN4Jzp1BA0LfxlHW1z/eoqVkae7lBDykJ7Q=;
        b=EGhuVJdYAKt+7Z8N4iT6Cf/P6Doa6tATISTFTcA77CDBgKfNPln8qtUzD7TFxqgI7Q
         zlO75JntMHT9BX9P0Hzq2hC5C9T55Z+S6YtBkdFJ/7AdrZulEM4RrjAPe6ECskS7AQkj
         6PjHKV3ZPIMY/2sGELB3RiJIbTnjmITrsnnzKJX7uy+qQ35SY1s4n5G9/N3bRYuG89bV
         EItQHnGWLwW1gbinqSSTRY3BPF1Lo17DgnBCg+0f1mpR1QQp0mvOJcM7OtdazxNbCM6S
         +hOGrW4I+bkw3kD3wW8Rk7/FOEuU6UdUXcBpiB6ni3zYx5CuIFffW4eDcIj7i3Om7UKL
         afhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772722024; x=1773326824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mepahCioLN4Jzp1BA0LfxlHW1z/eoqVkae7lBDykJ7Q=;
        b=O6R5ZFxosE8zOwE85/DjuUvoGl/QIWTlEVOublfA3BV8zif4bFpxRYPfaXvmIq5EKs
         VI+0kCD2V0EfcOWo7JfyUynre7AQySe9sO5inmq4x/lZ0uxpOk+Mc3sBVUp8wydDdwGx
         M1kkzvxifM/UV/qvjDMy51zTTawKXmkZaiNRnO20XOsp+9Essjm3rQnHM6aFtlGfhnUk
         dlaJcI8BwxrVC+CMT+6fvsRY5opRM/Q4gFS1VafBKKwNbPu+xt0ntnraKzyz6H4pxBRo
         rzzyVfzXGrFYS7IZ6gRMwnsbGoTRyukQPiphbPKTXDCNs+eSTAJ6lPOrfTjYe8lmQK6M
         tJNg==
X-Forwarded-Encrypted: i=1; AJvYcCVIezx1Jkj2Wzwt1sGXOgDmkOeJs0JDkXj2PW9GzflYyfg9nwiFPQGMslZYadlzjJVJPZS8jJNP/fWbvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwK9bUi2MNpKALzy09DrjPdDPxPTSF84fiffHXvUUUcFm/U309
	PRpqDDjTjTfYvKKEkGaaWMFfSyVXmvmpZjHuFeYdUYq96UiFSIj8+aGf
X-Gm-Gg: ATEYQzynpjlsCSVdiRXsuM5YG5XzphWn/vcTkQwhokNrNJod9Kgc5bX86kocuYMQIOl
	ZPd5knuf+Ik5TjS7qhD0OLkXd9VzNc2b+bhPl957Q2eIPka/QPkzbYoMkynVi9Qf9i+dthE1Qlp
	AU9HRAroZV8oyxliSh0mraYcfC6G+tUWER/NjOzEZOCiAj+DmifHCrwK7sWWamXjrgkc3eFN/sv
	QoaCv5RO9IW7LeaX0M7ak/qcWBPa55VcvbRtiLWZPt1g9nHuXufv5jKf62OHDjcJkbkkDqNx4+0
	YqHCwNwb+9V8yDu0UWVx4Q5FNb00Ig63YR8w6iANoVuypWVtHkQAh7k4L+/d4L9Fzup40EEfMA2
	EXzM0gg0jdRy9xBFz/NNmIJvTV3l3jB3WL7EA6CwJtj+z7xaUrB2G24Vb/QUCeNVNwN0zJxoy5G
	gmZWJIVRgF51VwqGOD1EYYEwVWzPbeaotYcKXJ
X-Received: by 2002:a05:7300:a887:b0:2be:2b8d:3992 with SMTP id 5a478bee46e88-2be30fa55e3mr2534933eec.4.1772722023898;
        Thu, 05 Mar 2026 06:47:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2c9c67dbsm3900031eec.19.2026.03.05.06.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:47:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Mar 2026 06:47:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Huan He <hehuan1@eswincomputing.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com
Subject: Re: Re: Re: Re: [PATCH v2 0/2] Add driver support for ESWIN EIC7700
 PVT controller
Message-ID: <be51fbe2-d2c6-4421-b268-2c2b34128f34@roeck-us.net>
References: <20260128101400.859-1-hehuan1@eswincomputing.com>
 <1a08e50a.362b.19c4c20db59.Coremail.hehuan1@eswincomputing.com>
 <e648565e-59a9-4270-bbbd-7c53f5f65c6c@kernel.org>
 <2c43c2a.366b.19c5017e58a.Coremail.hehuan1@eswincomputing.com>
 <0183a68b-f8e9-48b8-b77f-5ae0a048a2bf@roeck-us.net>
 <46752141.375d.19c5ae8161e.Coremail.hehuan1@eswincomputing.com>
 <6803a67f.3e27.19cbdb318ff.Coremail.hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6803a67f.3e27.19cbdb318ff.Coremail.hehuan1@eswincomputing.com>

On Thu, Mar 05, 2026 at 07:12:37PM +0800, Huan He wrote:
> Hi Guenter,
> 
> Thank you very much for your detailed review and valuable feedback. I
> apologize for the delayed response.
> 
> > > 
> > > # Commit 6f4d5698f334 ("hwmon: Add Eswin EIC7700 PVT sensor driver")
> > > 1.  eic7700-pvt.c:487: ERROR: Unbalanced clock refcount with Runtime PM
> > >     > +	pvt->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> > > 
> > >     Using `devm_clk_get_enabled()` enables the clock and registers a devm action
> > >     to disable it on removal. However, the driver also uses Runtime PM to manage
> > >     the same clock:
> > > 
> > >     > +static int __maybe_unused eic7700_pvt_runtime_suspend(struct device *dev)
> > >     > +{
> > >     > +	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
> > >     > +
> > >     > +	clk_disable_unprepare(pvt->clk);
> > > 
> > >     If the device is runtime suspended when `remove()` is called:
> > >     1. `probe()`: `clk_prepare_enable()` (Ref: 1)
> > >     2. `runtime_suspend()`: `clk_disable_unprepare()` (Ref: 0)
> > >     3. `remove()` (via devm): `clk_disable_unprepare()` (Ref: -1)
> > > 
> > >     This leads to a refcount underflow and warning.
> > > 
> > >     Fix: Use `devm_clk_get()` and manually call `clk_prepare_enable()` in probe.
> > >     Ensure that the manual enable is balanced correctly, or rely on Runtime PM
> > >     (and `pm_runtime_get_sync` in probe) to handle the clock, ensuring
> > >     `pm_runtime_put` balances it. Since `check_pwr` needs the clock before
> > >     Runtime PM is enabled, you should enable it manually and then possibly
> > >     disable it before enabling Runtime PM, or keep it enabled and let Runtime PM
> > >     take over (but ensure `remove` doesn't double disable).
> > > 
> > >     A common pattern:
> > >     ```c
> > >     pvt->clk = devm_clk_get(dev, NULL);
> > >     ...
> > >     clk_prepare_enable(pvt->clk);
> > >     ...
> > >     pm_runtime_enable(dev);
> > >     pm_runtime_get_noresume(dev);
> > >     ...
> > >     pm_runtime_put(dev);
> > >     ```
> > >     And ensure `remove` (or devm action) disables it ONLY if not suspended?
> > >     Actually, simpler is:
> > >     Don't use `devm_clk_get_enabled` if you use `runtime_suspend` to disable it.
> > >     Use `devm_clk_get`.
> > >     In probe: `clk_prepare_enable`.
> > >     Register a `devm_add_action` that calls `clk_disable_unprepare` *only if* the
> > >     driver is not using Runtime PM to control it? No, that's messy.
> > > 
> > >     Better fix:
> > >     Use `devm_clk_get`.
> > >     In probe: `clk_prepare_enable`.
> > >     In remove (devm action?): `clk_disable_unprepare` (but this still has the issue).
> > > 
> > >     Correct Fix:
> > >     Do not use `clk_disable_unprepare` in `runtime_suspend` if you used
> > >     `devm_clk_get_enabled`.
> > >     OR
> > >     Don't use `devm_clk_get_enabled`. Use `devm_clk_get`.
> > >     Manage the clock entirely via Runtime PM.
> > >     In probe:
> > >     `clk_prepare_enable(pvt->clk);` (Temporary for check_pwr)
> > >     `check_pwr...`
> > >     `clk_disable_unprepare(pvt->clk);`
> > >     `pm_runtime_enable(dev);`
> > >     ...
> > 
> > We will reproduce and further analyze the clock refcount imbalance
> > scenario.
> 
> Regarding the Runtime PM issue potentially causing clock refcount
> imbalance, we have investigated it and will address this in the v3 patch.
> 
> > 
> > > 
> > > 3.  eic7700-pvt.c:368: WARN: Spurious interrupts on shared IRQ line
> > >     > +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, PVT_ENA_EN);
> > > 
> > >     `check_pwr` enables the device (and thus potential interrupts) before
> > >     `request_irq` is called. If the IRQ line is shared and the device asserts
> > >     an interrupt immediately, the interrupt will be unhandled (spurious) because
> > >     no handler is registered yet.
> > > 
> > >     Fix: Request the IRQ before enabling the device, or ensure interrupts are masked
> > >     at the controller level (if possible) before enabling the block. Since `check_pwr`
> > >     relies on polling and ISR clears the status, moving `request_irq` is tricky.
> > >     Verify if `PVT_ENA` has a separate interrupt enable bit or if `PVT_INT` has a mask.
> > >     If not, this is a hardware/driver design risk.
> > > 
> > 
> > Confirmed with the hardware team, the PVT_ENA register has no independent
> > interrupt enable, and PVT_INT does not support masking.
> > Enabling the device before request_irq may generate interrupts, but the
> > driver disables the PVT module (PVT_ENA_EN = 0) and clears interrupts by
> > writing PVT_INT_CLR. In practice, no issues have been observed.
> > 
> 
> For the spurious interrupt concern: after confirming with the hardware
> team, the PVT_ENA register has no independent interrupt enable, and
> PVT_INT does not support masking. In the current implementation, enabling
> the device during check_pwr may generate an interrupt, but the driver
> subsequently disables the PVT module (PVT_ENA_EN = 0) and clears the
> interrupt status by writing PVT_INT_CLR. In practice, no issues have been
> observed.
> 
> Could you please confirm whether it is acceptable to keep the current
> implementation under these conditions?

Yes, but please explain in the code.

Thanks,
Guenter
