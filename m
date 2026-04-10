Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EFB3D9DDE
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 15:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835078; cv=none; b=MB2bmk+DNFwX1vbC0olixaF7PjZLs4fKNhuQJB66j1Nl9kbWm+7pDV+QixWcNXujh8ZsAChxtMxZ+Hq1vRfRMxlpkD5iAmrIHx8Gx9X0fr71fUxVjAvIZ+i+KWFuMsyorLnbophW4jJwvp4NzAxRpA3lSPr92gKmuYvPkMD5MYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835078; c=relaxed/simple;
	bh=ymqpIN1RZy9bvrx0CZk4ryXQZ43lJJxuI2y3U442FRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJOwmiV27oEsK7NnqpQK6yeGPr4YHhc4Nx1XTjGFKFIGyGIHUy28vSARlrcV6q6uWw/nWtU4NgJPBo+qI/n6BNC9D8ex4dzNer3CDe4169v+i7LLvtkQYf9ShoUVf1qAhBb++I4nANCLSthJWzIUH52dRmlJhFj0Iv2IT8fltrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPWiWOoi; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPWiWOoi"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c25b90264so190411c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 08:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775835076; x=1776439876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLrdRwNV2I6dqfO4+G4/OGLFyZBRBOJlZXwsNZ6t6Js=;
        b=cPWiWOoiaTNlwtNENoxrH28nV//kgJx18yX6aq3GNoBNd7KQ845fkt9DjLGgQadXCv
         6S2lygDPM6LBU2v9pZji7pA4pl0DAehUnewvtRC4qZ/N4C+EGJBzYFZzhrC+Qwt2dto1
         QQqH5HxbHWlljtXa0ePCQC3V18sgsgWSuQwUao+x4ZTMCHC4W7v0D5A4Q7vj+ehRZh66
         8RsRttOeEHWdDLoK3wTejRajYfENqi1tsrCoelT+rIVsiSoDRXBc2dWZkf+vvukhIW1X
         hEkSEmKEZlmRD18w0EuDAavCXHOFYp+JJF/kVfw+TOBa3kcqPV5S/wPMUZouWrDW7tJR
         E9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775835076; x=1776439876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aLrdRwNV2I6dqfO4+G4/OGLFyZBRBOJlZXwsNZ6t6Js=;
        b=bEQWpbsnyyzZY/jwRW+pO4JtOh8CaeQqE+4J/kUV/CJzlsWTBLoH7lVPTkCSnJ9K3z
         53WbJvCri4u+46xjV7eCj7yA/Alj1gTAZza5SR4KXAc6DXv55ry3ZipPOElWhMwkvn6c
         cw4qzNTeAUPvZE2Cemw7vsIAbnfuAmcUflAjXuWKmi8i+9Qpwn6QFB9fx4cNE/SFz0UW
         SUrPrPYmPRPffHU14zZoRIvFtlzogn5VfTlsn2fKKISPNK3tyrFG4p+bv+TrzmKdtd92
         Uac+RtC2/lvcV+iYCPEis+gHbsitkTgRr7dDsM51KEwoOh5P7g3JUR0H6aiP2QfLR1oZ
         hveA==
X-Gm-Message-State: AOJu0YzTaNZl8KU4g86F/0nf9Ud5VWujGTqpSTbvPKiv+TtGGitHQwP9
	TTeOXVbEXLYiATI0z/y1Ep2mnwvSN5UwWxJpqW/iT5DMK7x9tARV8uZD
X-Gm-Gg: AeBDieuOJ2XcgNjyZihvtXTJa41Ia9xJ5h+g1oEj5WDq1b8sGsGwlby6QO5mY4mKdsP
	ns7GNO6pIZIDVAMMtEfvyV9Agc2bRzlab98k9aNvg8ngfpgm0LjqUoOneCYNg8If330lGyDOrPs
	+drexy5yh8oeDAKuq7QhtzXaB2KQHAyLV/j5i3p5zhdN0v4/4TkHA+De/w+9SfitcCnorobOHmJ
	RE3mz21Npo8tGJe9lch5+eJom9iwpOSX/y2ynn5SSxm37KKjC/lo86euF35yBmqJhoE5qdX4pbU
	eXt3KUXqZTfb2TBeEtQ5A/fXKIXTYySQXgDFMbftLuJZSMKprG3iOdVuvR7hvyL9YhJzNmowzO4
	6Tf+a6au8ukJXZdLQG0mr1OPXumOpqfr8Ie67gG6x83ZEJizAflvhrr3jCYcbmnTzBeWlnYWsoB
	gj/lw9N6IjzwLrj43mPQPmvFyaaotIaRrLBvpl
X-Received: by 2002:a05:7022:112:b0:128:ca6f:adf2 with SMTP id a92af1059eb24-12c34ef263bmr2427626c88.32.1775835076339;
        Fri, 10 Apr 2026 08:31:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c34352490sm3690760c88.0.2026.04.10.08.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:31:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 08:31:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"cosmo.chou@quantatw.com" <cosmo.chou@quantatw.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v4] hwmon: (pt5161l) Fix bugs in pt5161l_read_block_data()
Message-ID: <3dc5812c-1ced-4fad-82e8-ece32a30b9bb@roeck-us.net>
References: <20260410002549.424162-1-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410002549.424162-1-sanman.pradhan@hpe.com>

On Fri, Apr 10, 2026 at 12:25:55AM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> Fix two bugs in pt5161l_read_block_data():
> 
> 1. Buffer overrun: The local buffer rbuf is declared as u8 rbuf[24],
>    but i2c_smbus_read_block_data() can return up to
>    I2C_SMBUS_BLOCK_MAX (32) bytes. The i2c-core copies the data into
>    the caller's buffer before the return value can be checked, so
>    the post-read length validation does not prevent a stack overrun
>    if a device returns more than 24 bytes. Resize the buffer to
>    I2C_SMBUS_BLOCK_MAX.
> 
> 2. Unexpected positive return on length mismatch: When all three
>    retries are exhausted because the device returns data with an
>    unexpected length, i2c_smbus_read_block_data() returns a positive
>    byte count. The function returns this directly, and callers treat
>    any non-negative return as success, processing stale or incomplete
>    buffer contents. Return -EIO when retries are exhausted with a
>    positive return value, preserving the negative error code on I2C
>    failure.
> 
> Fixes: 1b2ca93cd0592 ("hwmon: Add driver for Astera Labs PT5161L retimer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
