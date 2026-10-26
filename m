Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975971;
	b=Kzk+VI2bH9T1VeRK//GSYTVLgfZRP0gsgmynx0ctXx1YPCRit9XU6GixqdrQ9mhb5Dj1
	 wHb527/T6KKorSGeilm506S4aSle0FWtsegt/33Tn1yHq7cT99IndAi2MhtcmkUTi/LLy
	 CNXHAtn7xsD8auUyZfDA+JrVpHdDTPTSKWN1KuljmtTiX3yK4kUUYxgFabixMUdWlrvFR
	 qr/DuE7G/WvOkPMg3oP5J9X85O7IxMlcfVTZ2WIoMe283wpdLgzilvF0q+BAqBorYucU/
	 S54qQPhoAwM1LjTb02KZXWPs0hEnunnA6aS+hCFNTkTsHNdotFaU3odh4zf3FghyBWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=glkk7tgvazLr/tUU7eD0+4ZS7tPlrvqsxMIspd2af9k=;
	b=bqUFubl2nOJ131cD4fXEbZ1cgoQADDtrsqkCssXB9Q+Gz+pcQKfBsrQTBsLN7Ywi27WJ
	 TBNySpcGVeuIGricOXg40E+zmbCcn/K9H41ZigQGN17TenRErDT25WtvA3HUWwu+IqLV7
	 +fdbokfZjyE1te5iJ+mubYcxNXOsQRw0ckcjUgtfg4gkSe1/hnmt4EkU11/ki4fUEig9h
	 KZcDA9o4OwpxNhlk7MZVRyS8iN5WXFzPmIn2zUPYK6TQmZ14j24vdtRdqiJM6zomxLEr1
	 KMasgkaGu/9HlKn2RBkrJxogvQAO55c6MtwuFPyAcrlIbuiKrMT8HWD+riCIIuvfOGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MkHbqy8s;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DF1606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1DF1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MkHbqy8s
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so795443a12.2
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975968; x=1793580768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=glkk7tgvazLr/tUU7eD0+4ZS7tPlrvqsxMIspd2af9k=;
        b=MkHbqy8ssdThe7DKCoLn8P6lc91zHrZsr7Ge3O/vM8SeToRJST/JRbW6gnKpe6LceB
         GCUXA/TVzSJh27cXkQgF15GpWuDi9CKve51wh2agtFAywfYLHaCB9BFeNJrTd1u5In3r
         nqhp3TlNticI2uUUAR27O1Qqza41/2dA9fd/Tf0frtDPBMgs0wehFbyrpqt3LroeCm1G
         Q9vT7A8j636uFAfD31LXGwnD2GrmDUpw24+3mMCz95WayN167qlag7ijmKn2unuaeouw
         80472E7c5kQJXb2yw9lcr/f7pJR+gqM9FJG433rlBpwzHf3IDVeOBRzo7+5ERQnfZ4OQ
         z5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975968; x=1793580768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glkk7tgvazLr/tUU7eD0+4ZS7tPlrvqsxMIspd2af9k=;
        b=Ezo6XNCZQMbkG5++td36/s0yc31+CbHJCl8aMfNlwbi5mBbEHPpJMvEtt/ZaOYHt0x
         s9FLzrETrQKDjY1GzylDvGBnEdvpNGSLyQtoEvIunhNharTFEaDPEqjshiL91x/FZaM/
         vIP4KwELmA4MfmcCGdsxUJAcSxYbkyiBJpxKJYp9hrgfEZKrv7rBq3oiUUgr8qc8Yt3K
         TdL1huhtEEqq+rf+XqutlJN/fXoA7HW/jVdJC6fUVf9P70wmsQsZfq5I0tpC9+zKHvtp
         HP6+THEXwvk1mwbbGcqvjv8B7CxTZHccMKaGKdZMsfVrj6TiZORmSWYrRyUNju6+xgCY
         OkAw==
X-Forwarded-Encrypted: i=1; AKwUvBzEX0/rWp0/pwDNkzXhxyqN9KV/nDZLJVTm8S8MZhxGKuRYnQq17t8EwePk++DO4MT5b6kGp8fnZVv7DA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLRAsG9xOWZkel6Dse/H0lw5iQsEK+U38tv84Xl7ZJ1doHMZO3P
	EquajWeU1xZwoushOa9oaJzi0PQfsiXlFxVdkxobhizhk2kWr15/ARtwGuvReA==
X-Gm-Gg: AYBFou02UNN32RJt5u/m6jnPgxUU6I3SdEEGHwJt8GjKW0J0n8X/JIEMqD3BsSqHnYa
	RJy9ijK0BBdWBCcobi8+SRDrp8LZVY5tqfl/694dQzLAUl7G6ypHKDNQUNEQOf1iQzwmUdO32RC
	KzHwFk4tAdRF696/V7QUM+Re3q0V9WlaPFBIPLBVKh2GVvSUWuZwtZa1U4pU8RQhON9c7ahC7Nz
	me5TNXhKkVMsKQoI/OVKPGY1voM9Gpv12ayTWywesWu09fCKzL8BK/2fj05WpGNwma4xkKc/aGV
	EVJqZXmYOcOpbKAzzjG+hDwUV8kRP8BCSXNDT6D+AgyA6yk3ZZUFUcUtguD2mqF88o6L3nYKvdy
	gTebVRY5ouhsJUtfsIcLUkTVIWgfScqXOZ9dG2ti7/pEVbhIVlGujtR780lKV5yMcV2g2XqeDfH
	Cunb7ZP+rAGvd865x8jpTKamDZOaYXg8g0wvOdiHVtVcGWy+OpQ6pVcCX1zkk7c+z24V6ilqK6K
	ahbAL4tOt5UasCXodx2/EWC/hpnlsUj5Z0tSHP+HZIqmbfNmOa6w761MxGdsE1EnVZW9g==
X-Received: by 2002:a17:90b:3141:b0:3ac:9a54:e3ce with SMTP id 98e67ed59e1d1-3adeafb073fmr4419328a91.63.1792975967971;
        Sun, 25 Oct 2026 17:52:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb29031sm4738469a91.4.2026.10.25.17.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:52:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:52:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zain Aboobacker <zainaboobacker33@gmail.com>
Cc: Wensheng Wang <wenswang@yeah.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/mp2985) fix typos in comments
Message-ID: <334aa1bb-649b-49e8-9e60-c43de836b096@roeck-us.net>
References: <20260926162539.25432-1-zainaboobacker33@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926162539.25432-1-zainaboobacker33@gmail.com>

On Sat, Sep 26, 2026 at 12:25:39PM -0400, Zain Aboobacker wrote:
> Fix various spelling mistakes in comments found by codespell.
> 
> Assisted-by: Claude:claude-opus-5-5 codespell
> Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>

Applied.

Thanks,
Guenter
