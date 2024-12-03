Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F9D5336E
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Dec 2024 06:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733205959; cv=none; b=XebrMd1aDZF0swvFfSL/Y/Jp+ELHfOXWr//zhh4tBYHGcRK8lhBz7BFmeahV8X8RiemCo6aP1MGedtKQNxfkmJ4f//E0imlHsKNYzxQzyfdqmTy3T20l9jIn8VU3SiSgt8ZyBN87ohNbdJ6CbRdwhGUsx3MhQnXJby6lKk3xnaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733205959; c=relaxed/simple;
	bh=gSUjkB5Oqh2low0jD4KY1QSz/NKESySJYA/Ai/HR/Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOe5MMVdoTuMFE1tgPZdtWVcIqG0cUdSSo1Ym6qDNXqOjQRWcTf8h/6E98bGGNFqD3nT96WuJzK8VIs/EMOp6PsJossoYIxU1utcGMfuUKF/uUUjX/bbmGSTaKelZjIn7uKr3/nB40/f87mLIKIuVCjVlROtBA/AuYxYCPDGLKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSbmzri0; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSbmzri0"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fcc00285a9so2075413a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Dec 2024 22:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733205956; x=1733810756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYWKIfWb1Oh9hH2xa1Jzv242zTS0KfP+l9376f6PgRw=;
        b=JSbmzri0L7Erg9JoniQXJUwhxgJTxWi1U+C/AhiZb7hxe8JWZICvsVI0jAMkA6k9jt
         BcnB1a36u5ZNBbmMmrkfYmGZkssOtu/5iaoDdNC1OsY7lLZHAaC3IF9d1ZxC9LuEZTIH
         NJGn9iGPNS/tRBlbINCAV7mFNgIJaHSilDpjrzLlxAOEzSwogMc7HsdNFDdeamk6EYBO
         iAVRmwVou7qnSDl84AHb78yt6byas5H0MTTLtOm4cHEe/p8FUU2kONj2GvmmzPtYU3X7
         tFCgMXexuzulSsDdVCuD9VynF18j/ZzXOQgdV2n9RJ8kBWHDozOxjHE2E3vtvat27BtP
         hSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733205956; x=1733810756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYWKIfWb1Oh9hH2xa1Jzv242zTS0KfP+l9376f6PgRw=;
        b=ovoe5ksZfXBUm59GFFIZvOELgIBwYl+StotTk1VSMXyDpoKSN4/CUzqE6bG7KDmX0X
         uFPTIqIgLln+Z+eWu47GVTeSWyRwzNvH7UD2wZ6wWqoYbgBgSKFrNDYzszeL/bgjs+Jg
         el52kCY/Eg5iAyVakq4vZH+Kb6ohfEqRKq/gjMCUMoTyf5vhBrKs5ZFIHccQLgTrmzLv
         5tubyTPyMhDRqKg3/slTzQLzrf3uhqdc/ApKc4UIVgMQkFQHRWl68lvtTA6fZ3kyAjUi
         uCqdkezuX8c0FzSPxBU20Hi9g/VuFEeTN7vVJPxaU66+te9CM5JW4CT+9haSLH2UzX3z
         ipow==
X-Forwarded-Encrypted: i=1; AJvYcCXqvugc09iOOYiWyAjsVjRJPRwJeGKUDhoN92dWP8bEckUdysgIAm8+cs7ZTQAwPf2rzkVns0bfuEnPCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyITK81WePt0pXyVUuKPZoHlKemml/lg9ReeJfrknqYApFvwTwH
	IHfXJhTprJq9GgHVM5AjmGDKOcqOcJFiKWzOJWHout1rEo9SgxBX
X-Gm-Gg: ASbGncsguvTcc3tIt6YzE6rEd1gMICjQygvkYkrQO5+FGKTgsl1JNhO53psHQYdqme9
	XJLWrRIdPOJv//naJuESd7c7wNEyFCb/oUQIKkqNsB1IFKj9xTlh6bScyyEUr0bbPTxVxK3yw34
	A7Lcq2enbdN5UvI7iPNNFqpi2KV/sXpNVzo4/KTyv9rxaTXIJW/nnf1Hh25ZFWtG8ezo3Z22Em3
	6wSbXtiNJNRUAI6YREoER1oji8qfIRK2attNA1mLLHsJVQU+dx4liCQsTqlwxo=
X-Google-Smtp-Source: AGHT+IHcmh2F5HDLnP6nkQKwmpu0nLpnPf0VsF9bhL439vY2tRKe7YOR+h+IHQai0+2B9Qf1bFRhLA==
X-Received: by 2002:a05:6a21:9d83:b0:1e0:d36b:ef5e with SMTP id adf61e73a8af0-1e165433801mr2009283637.46.1733205956586;
        Mon, 02 Dec 2024 22:05:56 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2155f0a648esm52001085ad.183.2024.12.02.22.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 22:05:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 2 Dec 2024 22:05:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: raspberrypi: add PM suspend/resume support
Message-ID: <bea80f92-11b6-4373-bb90-48c5a22a30a9@roeck-us.net>
References: <20241202115832.33628-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202115832.33628-1-wahrenst@gmx.net>

On Mon, Dec 02, 2024 at 12:58:32PM +0100, Stefan Wahren wrote:
> Add suspend/resume handler in order to stop firmware polling
> during s2idle. This was just waking-up the system without a real
> benefit.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied.

Thanks,
Guenter
