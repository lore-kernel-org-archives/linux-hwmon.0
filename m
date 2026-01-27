Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B57B4414
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 00:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769472734; cv=none; b=b9eCTxEZ4mF3tBELD0f5E8kZlqSZXmYTR3pWUHFW6OJ37QZNEUDNpOZJFuIgU//oUPVTarioyA2ickWE//esIqoYItMd9VQ8WYWRdPsQunGTK8uuH27hqm/0PlgZ+UJ/a0fDUSD4N3XjP5UfkOkxrCQGE9yeFvJNUGiidYU27Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769472734; c=relaxed/simple;
	bh=fUnA8QeJNxiXGLmBnqtbom0ribI0bLlL9/EJmzuvgb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQidCnC77rMkn9uPbqdbO2/K6w8hisBoSWYX5gll7xJPGsEmaH9Z/WUc/vu5fGgACGdxnQkv8r2lS74wlhWZMFCGdUce0tqUVmLMGcLkT/T8eCVo53A3FdJMeg6/2qD2wEEEWMntBkffRAj03Ku7roOWoGOfTI1ThzAREuwqK18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpWJy5uO; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpWJy5uO"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82311f4070cso2311024b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 16:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769472732; x=1770077532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdeNfj03OLOeVZiroH+KebZgYfGGMy+Kndtkeom9LnI=;
        b=WpWJy5uOtQkeu9j6x+4L5B4fGDDBiXQi/rl7vpOGPLdeE7ktbHKTvFKrwypQWBQneg
         BJle8K/HhLm3QGizhzbaAYPMLCLWIlAOBuCgcP4A5giJYhSpy0VnCIH9FNjdfjS91fYC
         lqclt7pk9anl3CgKLar+BnTqcHqOQyh74Gt11fd0GEPkWa4DhusALovD6gcquAKyBb8/
         hjiZhP9+6htGiTmsL+jCIs4Fl2OeETHlzoO5/9H7R65GIz7A1vpgwGPWQPuS6FHMk4z3
         91Q1MQ8rHsPLnX24XjK+0J28uSrZj6GhmcqkU8TgL+GmmPeCamyoAsaMKGBwXPxUxYhK
         5jOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769472732; x=1770077532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tdeNfj03OLOeVZiroH+KebZgYfGGMy+Kndtkeom9LnI=;
        b=S4nTWLCmMFPP6jLqRoVQR+RlBzAJXI+JqZFB99FL/jbfZNQqZpLtyHvX6IWo7/R0ZU
         jspBJCY18mVilvDYQOppURr3ObWcm5ej6e0Rqktu8QqMQtwTbjkruUj0PqOHvyCLyPEr
         XvXHBt9jcYFIhDgWGvO7t42tKaCPIjWItWiuHuZ0z0UFv7A90VkW+b0PtWV9/itKvLNS
         mj2ck/I1ZsTetyAG9WZFY3ng/Q00mTK0oh0TySy2SjCa4uZz6CmEB174FT6Y0iw/aKss
         v46nOADHsSPNOyhih5/qcDyWPKRa1a33zme4eEGrLZeXZc9+jsdKQV9Kar8tjK4yH9PD
         Nhdg==
X-Forwarded-Encrypted: i=1; AJvYcCW3k6IwWYPjlRzG+6bUCYhXs9rCPMlKHj7YOmZmOHzBOifBGZXd5lFDpTWARraAoWMMaxzCW4zTbHfTUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YztdpCmI9LQlo5mZNa4PC0PkCfm97m8qH5/95t40gP6PCrf8eBP
	X9eut3nDJIVhO1E1pIyP/2/e8f4HWVqmt0jQGrwI76C4u0EyAWkUEP5fqQLKqz5q
X-Gm-Gg: AZuq6aKd23nYeeExtCPW+FX4w6afPS3AMk/f4si9F1++0AzpIZFNS7JXBlbwV6LQT8r
	Bdzj1XcdihxErVusegFepu4P24I3rz/8b3Xeg4xT+dg71Wk84DU6z8w3/YeTIe/lmS4SrcMc3Tu
	1VvIleOC4ZQCEERREZ1Xw/uNOolK38IQvNIEfwWF5NSRdKgoK9tSZi6bFdJu/iLtmSrk4u9u0/3
	biMeLDonUbbW911PwhCyY0eT6pGbPN5Zn3AUFyVJaj0VdAFRtJ+LdhoI6CmOgaBcF+ls2NGTREb
	V2tmqXXwXpLfGADbIr85pfkT6fcQeyNY9DGIJo7OQARI+2qS9cp2/YofgWQ/pm/S9zTb3GWwOn1
	5yLvJIM52TbjeMCPDxHOUTA2utWqaeJa/VV1mguZfmsBdQeIjKrtBNPImuQQNlo6TIFp0BY+pLJ
	ZeRSNVh41q+cVkhBlgLS7r3xVw+x8gQbAAUO8=
X-Received: by 2002:a05:6a00:1250:b0:7e8:3fcb:9b05 with SMTP id d2e1a72fcca58-8234129e15fmr4907235b3a.27.1769472732308;
        Mon, 26 Jan 2026 16:12:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a16a106sm9216220a12.15.2026.01.26.16.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:12:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:12:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Charles Hsu <hsu.yungteng@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: hwmon: add STEF48H28
Message-ID: <a5694aae-0740-4336-8980-5699d367c9be@roeck-us.net>
References: <20260126063712.1049025-1-hsu.yungteng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126063712.1049025-1-hsu.yungteng@gmail.com>

On Mon, Jan 26, 2026 at 02:37:11PM +0800, Charles Hsu wrote:
> Add device tree bindings for the hot-swap controller STEF48H28.
> 
> Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
