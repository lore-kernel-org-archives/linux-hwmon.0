Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514CF25A2C6
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200127; cv=none; b=huZeGSKJ5BAWnn5FrVTfoTvSInYpFzMir/Rs45MWZss4UIJS04nc0UaHm4bUVBiYjWKBZu2FMqGfSeuxkhRItYGQgk2fHclKOhuJUdcUdEoiEmlFu25S+FH4F1mWrEhRtVMhAbi2WX4/qx04puL3GXbsV7Ra2rRQwJUqE6rdt2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200127; c=relaxed/simple;
	bh=UJGH0jRYORx40X/gDUchYR8DMZlrZHXlJU/TV8esMls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hp4UKrXF5zBOo+DUH0odJxY5LuoiNmyACWvO3hJzGBj+zESLk6dAuXbv5haEGxjuXdF1eKF/g6qI8S8GCKwS8WhvCccUmd/cI5alGED6t7+JCEk5T2rthVHn/3b722EZMGBZ+HfI0l+/dpnEQX/vgZN1GUmUJnkfVFYlkszFGk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcPfEs0n; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcPfEs0n"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8453427d3f4so3383380b3a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785200123; x=1785804923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Swsp/1FQZty4jaHkgPfMtsKFiEtaMfZZDCjaBuzFbzk=;
        b=jcPfEs0n6hkiIJls0EC8geRNnJzSXF84R8CdAkUE9lsCvYCCJBOX8Ta2fuWQdIyIsj
         nJLYqhKpUd+6DRzbBK7yrJn+kl+zsmKbvgAw7nNH2DOsvGN8l91YVTmWuKCRcK6Y5U4S
         DK6Xo16nlZneSfuuZvHkSV/1CAM65XZKHzjfNGxLJOQF3jZgxxHrfU6v3tw37r77qW1X
         dGaJSbC03ZlQHwcDShAQ4+p5f+CTtE+tiXSDfZA9/DvhezQ/Kd4rQLat5tVpnV8auK2n
         hkLHHZBjEBgsmzl9MfkG3h2lyqiV0TKQRBPnfp59WVbF+G8nCjLGZAp6ooNiw7Uw5ajA
         uS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785200123; x=1785804923;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Swsp/1FQZty4jaHkgPfMtsKFiEtaMfZZDCjaBuzFbzk=;
        b=iTRWyi7y4TrVSrTPSckcd+ugoZJwKxZVrrr9zBCE/31175H9qTj+jwcZ4ako9cOIS7
         GNFNfYrB1kqsRN4zNl2OOL3Mac9JEpn5bLdqv20HH0+pVvIdnSl3g5iKCdkDtEotbCpD
         N9Y1hSCGKTq4h4i1FoBmJg6Jn50zSuYrBB4N9kWy7z28UzI5r5dDen+MT6iQl2cljE/+
         6y0SvLfhYykM8WT3CKX/E0Fy8ovDEu+G6lHOGHYJ3zEqJ4yWVw6BaNmZVDbintDTmjxs
         GOjaeIrYfxliIRQlrBKY+y8B1HV6/f/4CNcJn/IaFPn0WG0WbZrY0Vi7r1v9uX1fOubW
         YFZA==
X-Forwarded-Encrypted: i=1; AHgh+RqtogsS9S9q0r0Rg1i+A9cyc12X0pBDhwbVD1Phqx+Zn5vd17PslPm+1EX+XLC22Uy7+uoHVXp3PrxC9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUzbbmENbLlWL7e7a7BSakzTjH4kSkoH5A0wswRGQLfCOQ5LLp
	yrff3wvIx5hr/yfQ1oITR8LOLdS9NOldFn7GlkqSypmKYlZrNg+HkQ5M
X-Gm-Gg: AR+sD11Gn7e4Ii5BKxcd74FTHVJ3DziVPP17mArnPi3QExe4vMhQtlu/ojLC0s7WyeC
	TqNYQtHFleG5PK6axxmJDKvHVu4EO9G3BiqTcEyP/cReJYNFctxsrFgjPr61z/5p75pCnthobhz
	uew/X7WS7vwbNLwNmRbKqStnMPAHPUuL388Cdh9GTjSbZMKZC15VYPY55SLBwYG/UIo5agcAahY
	C7djvGjE9XLBwmpUGMz8e+duaQAyeCvgA+5j6r0lyMjxbOPs3ZDXwtHdknVJUiLO6hlvq0ye8mf
	xasivBg3qMDowSg3rBzUd2GD8TIPx62cuiXnRxJLGp5kc2lidEVtke+IACY62u7uZ3bUI94yHUn
	FdcMXy1pUAtqZ2DvNloYdR+39Iy3pEnqFMuoyLEzE0puHbTwHNfVGF47U2XdKDFHyJlah8/ktVB
	OdjporylaG+ved2JNM9BRB+YVQFAjuWmzw6QC4
X-Received: by 2002:a05:6a00:3ccc:b0:84e:165:da66 with SMTP id d2e1a72fcca58-84e933d55d6mr156173b3a.55.1785200123327;
        Mon, 27 Jul 2026 17:55:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53282e6fsm3615835b3a.24.2026.07.27.17.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:55:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 17:55:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	"Mark M. Hoffman" <mhoffman@lightlink.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v2 3/8] hwmon: (adt7470) Fix busy-loop and I2C
 flooding in update thread
Message-ID: <d00ca64d-5a11-4659-806e-46a40f1de458@roeck-us.net>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-3-598e38a46ba6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-adt7470_fixes-v2-3-598e38a46ba6@gmail.com>

On Mon, Jul 27, 2026 at 09:22:19PM -0300, Luiz Angelo Daros de Luca wrote:
> When userspace configures 'auto_update_interval' to 0 via sysfs, the
> background kthread executes schedule_timeout_interruptible(0), which
> returns immediately.
> 
> If 'num_temp_sensors' is concurrently or previously set to 0, the
> msleep_interruptible() delay inside adt7470_read_temperatures() also
> becomes 0. This combination forces the background thread into a tight,
> unbounded busy-loop, hogging the CPU and flooding the I2C bus with a
> continuous stream of transactions.
> 
> Fix this vulnerability by raising the lower limit of the clamp_val in
> auto_update_interval_store() from 0 to 500 milliseconds. This guarantees
> a reasonable minimum sleep window between sensor updates, protecting the
> system from intentional or accidental I2C bus denial of service.
> 
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/r/20260716213252.EACA71F000E9@smtp.kernel.org
> Fixes: 89fac11cb3e7 ("adt7470: make automatic fan control really work")
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Applied.

Thanks,
Guenter
