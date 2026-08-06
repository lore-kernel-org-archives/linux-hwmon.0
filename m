Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA2E3A1D14
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 19:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044048; cv=none; b=OQrEmHVHPupl++7VGp/F4YjlK/ruJNpGYDXQJwvIMgMeEDqpzVQgf10DQsOzIwQ+v3r7w7ESoVJyRrsAz4Ia0c03JsDNjZ4Q5eqeW5v7zO+tMaCTFcgWk0yPLzwnpi4HnYa7Pn76lFjq+37MXcJYRxNNBUnFsB2ExR0b/LL6iVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044048; c=relaxed/simple;
	bh=rnA5M8iQlWgWCmD3upvlp/v7NS8XUgdI7pwMpWc05HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luN76WSr1i4XWEluqEml1BsBh3c8qBySQwC1dI0JdOUp/VDPtDbDFBO6aK7PYkgWBaIcOY1oyh/MUZvRjBkXtmzXev3qxgGQyeJrI4F3imrmm2YJ3JTN5Yi7oXRo0ZPFdF7wBWwWvLf2X6zzIOnWrbWUvcdF3Ysuw4ecSWwgj2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3E3pH2Y; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3E3pH2Y"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848479c9bd5so2409506b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786044047; x=1786648847; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gImCZlwcjVqsfcKM8VnpH7M8XkjfUYPV25dOjHFQv0=;
        b=E3E3pH2YskUprC3uuZiC0dlHfpAlLo1XjAebxQte8xfpsepB3s93nG1ik+VVgddgJD
         r9ugA2rtnYxNUIPr2JDmqxd0hxqe0vShKg2VL2vr0sRdaHfcPGlrMrQZrKP92o2Y2j0b
         shkZS/OvljtlPFfK2Ngma7lTMsbUWQGAqQrzL7JXYRcFnJPcEolFSShqYZl4Xhl63HXO
         sQzEbGojd5CEXVdAQUvahrKVuwDkyJBq1R/1PMLVB1RRCO2cRQFSMgq+Cl3uIm8+Iwzf
         YjIpm3+uLyLQzxPgxZ+s5X6HVE7uduGnvua/UMuZN5lmEgVKCLUrmoF2yIhJ8L76lkDq
         q5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786044047; x=1786648847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gImCZlwcjVqsfcKM8VnpH7M8XkjfUYPV25dOjHFQv0=;
        b=emin7mPQtqRz/8spygc+51SP4QtHJPSHQUBknX2SqFwFpltWMR8zwCrQDVS7YtXopV
         Rlw0IU30yePAX5DTtaXcRVxBgXDs53MY06J6U/D3Icd5xE7yVZQqK9DmSKGwitCu0ItK
         B1aJ8ZlRv3NyjUOVfDPIGZSbD+pKkyZK8V4HEwLvo1r7UBtDn3AHkDWF9J/isHMxJx+Y
         /95RaHvuDpQ+kW0pa6UiPPCkUj0RFonwCBvubkoJMsx4OfvmRlQrzyfNaakvPbtOD9aP
         HQsTP1Jmi4wdZtiwNa45Wx7e7QJZIF4lXfGEUaERvAfytRzwkjY9NmR8BfLPPVcaGCCJ
         24+A==
X-Gm-Message-State: AOJu0Ywd8zO4UVQU/CSgKJWCFbpHhCmdUOqZdYbKQfPK8lautBnbkc1w
	EGSclL+wTnWuQUBVuV1WvBwatomlRLbcXSBXuvN5RfGReI93gA9thIPc
X-Gm-Gg: AR+sD13WuBeZ6CgFxL324x0/sRiSqkLRb2+Wl9Bj9kVS7VtJc0/W6c4wJApOAf2B0uZ
	1W234aAv45XEcsfzFkhnWAK7VjqbgMYPi01VbA8yQUJZO4A27O0gvYeZEfH+sInsjhQCJdZuHUC
	6B8pDCWwp+6Qf+7Xiw8wZ0JNrLv3yDRq6rKoBk4HOU970AldAzuNmvlbyXAb7BAvkKuZGmpgUR3
	staMZl+6+qe7c0QAaGJN23XsAmHoWuK65ik8TkRazLOUyMEXGXiKK651bpZpJCcbVem23rNlqNu
	tEI1arD/hYNyIhHF6GcC/9BqRBQoW/qKaJdNvUEdh10l5XyuZXq0LAO5y9T8yXFBdJ92xlOTK95
	ppHtF7otvxNkYBdTIpgy5K8yXmXtuWeVcgsZ/jsLehkjCJyjP354BTrmKBuImrHfYb3oD9of4PI
	2zCCwwriFddCQDdsKbLqDJ5GoJq/3DxqZMZtEs2hBZyx9SNN9WIOt52u0eiwVkfK60jejmsz8zR
	A==
X-Received: by 2002:a05:6a00:44ce:b0:848:32f5:4999 with SMTP id d2e1a72fcca58-84f2e08e3d6mr20278783b3a.30.1786044046643;
        Thu, 06 Aug 2026 12:20:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9c6bsm1949845b3a.56.2026.08.06.12.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 12:20:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Aug 2026 12:20:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (sysfs) Allow drivers to register const
 attributes
Message-ID: <06620036-63c0-4f5a-a47c-7bf2caaad922@roeck-us.net>
References: <20260806-sysfs-const-attr-hwmon-v2-0-22fee8b85509@weissschuh.net>
 <20260806-sysfs-const-attr-hwmon-v2-3-22fee8b85509@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806-sysfs-const-attr-hwmon-v2-3-22fee8b85509@weissschuh.net>

On Thu, Aug 06, 2026 at 08:09:13AM +0200, Thomas Weiﬂschuh wrote:
> Switch to the __DEVICE_ATTR() macro which can handle callbacks taking
> both const and non-const attribute structure arguments.
> Allow the step-wise migration of the drivers.
> 
> Also use container_of_const() over container_of() to avoid casting away
> the constness accidentally.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
