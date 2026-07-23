Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21433263C8F
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827112; cv=none; b=atqtilfu6nzfU8OAUFP1EI9uzPTkItwPzAtWBgjwkJ3njJKB+6FhGmsJsnmM+6stbC6m/ATADiadzWLpSd0Yfjtsl4jpG/CX5J5fM/+joOdsLk4a+Q/VVQ0pVHn69EZQ1H2Aukx/k+9UJqGoII3SJjpFFME/13P4gfCSvtVdRzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827112; c=relaxed/simple;
	bh=zGPimF1oO6azFhOM/7DTDQwrY7SB+YOS9F6PLxUOcug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tz5JJeP0ohZYUKSchHzKMqH2oY+pzT4LO7AFjYVAlfeE//cPM2ruSuTJ/E3dMBoqY9lfscDPyFw2z7JlGYREmJlptX1I8fQTrKN83awB7LcDlHFzXgSuUacXw0VlekaFMXD0KC3KkBYmMBKmYDpbCFRKrab5E0fOtDV8YlJL5TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGowPFzt; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGowPFzt"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8486ac3f347so822274b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 10:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784827110; x=1785431910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QKYiYC0rCiJb7QH4dTCNiWIbkF1YTyo2tbQ4SRrmFHM=;
        b=CGowPFztOftxTiw5LwKmxVAMcdf5VYz0eUuAP7JZI8V+ydJ+gMDJSyOOtDcFOrWLkB
         gp+WxmFLzLIYr5y4GeM3TqUwk3Y9MtO9DhO/WTS49DJ3YeCwhszxx3aW/ryHCNUL/4fN
         dvofqko4GJl2y6JdZyfyDOg3XAEUtAKB5FTACMNOpEVVQVPoJFTky4w7Iv8gLXyGqMYK
         Q/0ujPs/2680Ek8ZGtBOPyWcR7bebX5FsmtsOci8gvqpZ/U9G0N8wpsJ2+8XFvLUQO3v
         veIoX9tTHdMgkZlbKjzzFWUve+3EtvoVT86npKzd41F++nlQTV5UY72F1tcQqGDJeeIX
         Ex1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827110; x=1785431910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKYiYC0rCiJb7QH4dTCNiWIbkF1YTyo2tbQ4SRrmFHM=;
        b=MKMnn6Bi/xGaMOdT+w4I7rtKkJUmTN/NP6bGzkwl90k/iVMWoZaoX4b1lxjwNDqutk
         rzgDZQGiVZ17h47ayzF2rJPmcNt6CAXFmuTdNPE9GTiEjQZ30dR5K/P+qSNXg6JCZr8k
         fojiOrl/2huy9vw1ZXLXcb4DG9FJZckErAQvRlhkqXfcx3cEBZL/UGlXpQPVOlspJqXR
         RT3pLxfe0y04/jxLpZQhHjsnD0AfDnCMTbNxCADul6sI2I90SItiK0INPDwv3yh9fbGb
         u0SUqWcRluJI8TAciEJYjafhvueYVbK2VmeE40WJeeufBGEao7UuFdWNZQPSbw5J/OUr
         rmOw==
X-Gm-Message-State: AOJu0Yyrrj4UadEYpP2LdqZDFgPSnc1ADkPp9JMBZSUglqyTXnc6zEfi
	RoPxd9LgbAphre7h0ekDuKsnBN/oiTonMPe+l40NgApA638m5xwZwJvO
X-Gm-Gg: AR+sD10kClZKTadzbjhd/17uwg0v7hal3IbfrmuOJDEKNLwFQaKE/jY9nxsSOb7u7Um
	go0B/6wqoUL6gguO6b5nM2BR0qcj2zofsGQARx9kUZSBtfR6dm8kG8SvZG4w8Oht+u/CzS/pjmA
	E9p18xwfbIkCcPg14z93EcrDpTp7eual7BwdX0m7ia5NJ35IE1w1Rw4FrbdGbcHDxldJgswR9jO
	eBmR8ikLlY5uZHYPy/j7X2is5M0OrhZY+W4XUtIuPcPZIV1PnJhtPUJw8AjY6yjJrYB0h8I0bfs
	nSh7SqgpFaxxc8Xgg76lwarWK+Hzi28G5FZFgqJUtiMU9SPMXpRiWUNKFybExptbMDcyKERHGgB
	H1MU2BaBOa4epAeBZNczL0Vc+gWc3G2/Y0NfWx5BHrwJkp0q5amvLTHN3v4vNvUWga4r/9b67Ef
	RFuo+IzftVWrH02ew=
X-Received: by 2002:a05:6a20:734a:b0:3c4:2cd3:f0ba with SMTP id adf61e73a8af0-3c44cb902f5mr3756644637.31.1784827110288;
        Thu, 23 Jul 2026 10:18:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1b6a45sm21544589eec.28.2026.07.23.10.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:18:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 23 Jul 2026 10:18:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/core) notify on the hwmon device, not the
 i2c client
Message-ID: <bb3dcc2d-1751-48b9-b9d9-2bc04137a5d3@roeck-us.net>
References: <20260723-fix_hwmon_notify_v1-v1-1-5a24c528686d@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-fix_hwmon_notify_v1-v1-1-5a24c528686d@free.fr>

On Thu, Jul 23, 2026 at 05:44:56PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> pmbus_notify() calls sysfs_notify() and kobject_uevent() on the i2c
> client's kobject, but the alarm attributes live on the hwmon class
> device registered by pmbus_do_probe(). Notifying the parent i2c device
> is a no-op for both poll(POLLPRI) waiters and udev listeners: the named
> attribute does not exist on that kobject.
> 
> Notify the hwmon device instead, so poll() wakes up and "change"
> uevents fire on the inX_alarm/tempX_alarm attributes when SMBALERT#
> reports a fault.
> 
> Fixes: f469bde9afd1 ("hwmon: (pmbus/core) Notify hwmon events")
> Cc: stable@vger.kernel.org # v6.4+
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied.

Thanks,
Guenter
