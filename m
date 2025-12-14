Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1207125F984
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Dec 2025 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765734831; cv=none; b=X/S32Nk+y25Mdzz+j4m/36c7iVUNUcooH4QYoDlTlNXpSl5tExCQRG8CQ5+DoEAame1vk9rK2WGfxBXmG3smp7Piw8ewk5ZkWxnJPPO9SPHTZgkk/kBuQLtTtm7vNLfCMTBEzMjYTavT+q6WEBiwHstgr966zwQHB9LoIZgGANA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765734831; c=relaxed/simple;
	bh=c50Gd8v5QKCleNqJ7l+SThxze1JZQeMJtMpn2/iBFfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9Zv6xbhjWhGN6LdTay1ycwlEvGRhciGCP2wINUzWSnkr0bUEStBMsleWA03cBbEAqZq2uTI3ZVZ2Eo2XZEePI/nfs7xwFeg5Z3FgFEQ5vDkIRkv0mGefdJEgDgPqAa4EIlO+7s/33c4elYaKW7y3FhQ5yFecHmLxRaIWmjb85k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VU9xvOb2; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VU9xvOb2"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so2534761b3a.1
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Dec 2025 09:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765734829; x=1766339629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KGukLpWYjLHBHtod0Ho5IwZFfjbtDeXI6ktOuv10K4=;
        b=VU9xvOb2CqVxrGKZPcf8v7hGBmKafq4lBH/3HCTtE4MMv7UoVrBN7vq/HtUN1ZAUMQ
         4KDfvqOS+HHj0GyGMS7qE68y932MUwZIByJNB1cJLZTShYLj4cBfwlEssKNk7e9D27kk
         PNZC3owTBXkzi3iJC564D0twl1J6JKWLpumatUEpKwDiR2vFmnmlO8qzvRNcw5cJ7faH
         khl3ZM21k2OsH6jygZ7p/xRgTfF7n1DmjxvKGvc6wyJK1QdaYCR0EOLG0W+DT/m42wuO
         NaZImg8UpOw2MWwbupfx4YdL/AShS0BRB+0LxF2H4XglkF2aCMcYeFXzs7j4jueT8oE4
         zEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765734829; x=1766339629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8KGukLpWYjLHBHtod0Ho5IwZFfjbtDeXI6ktOuv10K4=;
        b=uKdo/Rr5eTHdZCnl3bfWk2u/1yZjS3m7EYDd+iRUdvZfVj1NtV0b+3lkH+sCuaVMCV
         xzC57miYZo6WE4u558M693KZueVBzER09M2MBEvt1l645VA94oplPKyqNhK+yl4evSuY
         S/lyOVmWuiYbxJpuwJUijGQYmUVrqTOw17GmnmTy2ajFQCql2J9B9EvgJ3pJJ44jgJaO
         UbgpmPYTMMclMpgmulYsPNAkgpUOxSyWrfJwc0DAtKSyPB2Y22lgwtEWc7e5cYENmqMZ
         CVpvOQuoM+a4lWPK+x/F3RU5WXAiM+MVSHo9ZQvkQAk9BZ0rQ5zDZe4LUqPY93aB8SVc
         293g==
X-Forwarded-Encrypted: i=1; AJvYcCUqGvoP/vAcSOFjXy8PQBBAll66oaJppULFfs1G2/J7ej538CW+5RmJORhU2Vm3+Vh4n1JrveS5uplSag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0tFk3It1klkuNCnSro732rldit0OT0qGHsoCiOD10FGU57+rm
	G0EYcGwzHLmN+tPe95WE8T/JyAYUKnHBOGxq/WCp0+wt8kGJ/qvSzdeZR6lxHg==
X-Gm-Gg: AY/fxX7hy0XZ82GKbXiGqqy1a20M0hs7t3dJJR2Q+bVq/bjhvT2+l6S+52jNWVMP5nX
	ipT0BcW0d559hrR/wKF6/t4jdOwVQBgiIdf0uGlVjzzPHUQ9KMrAiQEiblEws6yyKKRDtAqiwwC
	CldxDB46QeCBID0TpbjxyoUw9VZk36oCPlbh5pZErX/S3KfbBJ1TkYyliJAgP1OC5SYy54o3FtA
	SF8MNulmEPwfp0h3uKbEb3bYrale9LEbVh7maZue3aCCMe7zdnVhFdE7ogKR4nGbUVBxDcfwVhr
	IoEdtxxKxE+mKnogae+j2tkd1tq8snFkkjDC4mFCP9VbnRIS05BB2KhTCfYfts/9t2g+aGwDU52
	6wPsr6BqwSYUL2BoO6LyTw6LWDQInkTcLjN/0p2DIUbCeP1DUUnjU9tkqvOtron594pPdw9dL/T
	grj7IIxsqIBhFP0iWxbUIhjRuTtaqrtio3MA==
X-Google-Smtp-Source: AGHT+IHAviQf4ia0p6NyC3wVjqMp7nMUItVjAglj8tQZv6P9vbwiRKK9MnU1FsFZkb9HCmdBsCIiKQ==
X-Received: by 2002:a05:7022:e997:b0:11a:3a1c:6c5c with SMTP id a92af1059eb24-11f349a48c3mr7341124c88.3.1765734829334;
        Sun, 14 Dec 2025 09:53:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b46f5sm36744795c88.5.2025.12.14.09.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 09:53:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 14 Dec 2025 09:53:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Reis Holmes <reisholmes@pm.me>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors) add ROG MAXIMUS X HERO
Message-ID: <e739db0f-1de2-427d-b719-73b5efd57f71@roeck-us.net>
References: <20251213200531.259435-1-eugene.shalygin@gmail.com>
 <20251213200531.259435-3-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213200531.259435-3-eugene.shalygin@gmail.com>

On Sat, Dec 13, 2025 at 09:03:42PM +0100, Eugene Shalygin wrote:
> From: Reis Holmes <reisholmes@pm.me>
> 
> Add support for ROG MAXIMUS X HERO. The support is incomplete because
> the second EC, which provides part of the data, is inaccessible via the
> kernel ec module.
> 
> Signed-off-by: Reis Holmes <reisholmes@pm.me>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
