Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA00309DDD
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Dec 2025 18:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766083557; cv=none; b=MJ6vEGN9Afq9jPrrrhBUKImEbWnd2lBN6DIMJ+uQPFIVB9RLBOUfnuTE9jXgd61Doe3GwzrdSwf1J5pZIwALkbKMD7DHzhkNPeSAWE3be6AaGP4MlprE3JII/p06u+kfId8z78jhwEIBQbZD4A5GrZsG6D29E0XKu8udAD2GeRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766083557; c=relaxed/simple;
	bh=p5Bqvhm9Uz0EgW1eYEfaPx46PU7qQJ+ok3VbEbVuFx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aesOp9+c9+1Ssf2C6OSUvkp49OEh+aQowgxh53M2mwkN1x4Z4a6d6q87EYbnI1wFg3Nzv0/yOXc1UpCbL5K3+Xa6pNT/TmDQ8jrET7NkqyBD6CJ+GWC086FrRwNFCEy83eo4zGlfrt/QtSY2XYzyCalDABQ3Iufo8LJQv1xxhv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGDzobD7; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGDzobD7"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so808304a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Dec 2025 10:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766083555; x=1766688355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wmfBWSlqxmnAhnZcKZtlMX7MY1IBPsWKTf/0ApjpNo=;
        b=GGDzobD73ofylEzayBLTEXASfKtHrZzs1lD/x0vCtSTTKL3UbZ2OmVBjrhI+W4HQHs
         1yQzA/tQQfyWPFxPfAbe+NVQx7bN4e2X5BewQL5Jku1G862fJ+IKgXzKeIx+3YmDinQy
         9bW+ktiSuCjkhcEo/VmIRIVmm0za5ytdn6JKC4R7hg+ZPpyMi4KEXwzqr+Ive1WIHFqd
         571NBTUc5v4ezRhILgHIO2RAOU//eOfNGuDMfxnPqqCh3Uk/xo+jHC2eVG3ZHqlrQ0fk
         3aFXU+LuHhLgxyZreMRlGY2zm1l64grkhINUNYaRa+wF1l5HiZ1VuDaHowagOhbLxS9E
         kZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766083555; x=1766688355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1wmfBWSlqxmnAhnZcKZtlMX7MY1IBPsWKTf/0ApjpNo=;
        b=DvtO3VIWKZGRrVbVMoD9eO4OiVhqKfjPoPa4A6Firys2LwCrOW45hTKHGIaSIMt2m9
         rLqocfvnr02X8J9vATWR7ST0sbLwAvFqPQy73/rbbfYkufBjEx6bLGaxjawI5I02R1ab
         ZgjbS71rfUsAqeSslHWWhfhTU4lrbeZeiq2QDx6/jl+mL9uN5t5d4q5Nya0Didc+5dTq
         gz1HbP5ibAJucNxBHiwiAPOz/+TIx3AmoM3sh7r3hq73obl0apBm1lwhKRNheOpkTI9p
         8joYdS+zyx2RjKUXnX1hC4eL0E8O6lIMqcILhHtWpCKrkiSv8om6ZN9yZtzgYmc2VDlp
         xWZA==
X-Forwarded-Encrypted: i=1; AJvYcCVntl2nOP4GVExBtO8E+ysXkahCVwhdxTkj/6U56DelsfKd8lCHU4mwn86Pqb3vLBBRQSSgEzumFRJ8HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqhVL0rWA7ituBt9Vr1jYS7Y95fcJDVaItoeA1jHM1NxHlTRCv
	TcEsOvu6qXs0IZYLyODG+4Iz6Reb7HRS4xk4lhHdG79WXmSPbEaBU7s4
X-Gm-Gg: AY/fxX6Hk6CJ1FixwjUaHBt00LMl4IHBkkm2KdpVFVySi1iRRd45iucAA5ZcyI/pXO3
	quRREkWJkn9GXwVFpGEg6y7d+HqWo0GkZzvQa+mRwppUGZODNJA+uV8zVikzNdLU/mQ53m2J2rf
	hYWVvDnd6n6gw6JlIqx1heL+x4rsAzX3Vdr3uKSHBa4i6a6Ab7EzpbDxcazStlBQ2X4JVxetJ+f
	qzwcoWuFi9a066YdjCXqff48RPo1p1wUusKOKwWgD8kN73lYo2qLIZd9MrBiZI1buJP+1lrvYH5
	e00HWxf8d4/luL2OwyAliFU/+xM1L0C92TT2uyETHhArUEgDZYiXiBham8DtDSRkejYQYXAG8Hz
	Dr6YyRB0h7FZOyNIcXWN3e7+MEXsw2srd5Hjxv2/JR5Wq166ZVf2wxEbbw+xipRZ3pi44qCIRph
	jIdb+TJSfvof0e+23SW5ff2J7mtvJoGRd8v3s=
X-Google-Smtp-Source: AGHT+IFdn/tpF3WuizfJoWgd3nZLjSK0zE/rTug/rj8Eg7nFBBgTG33eu0obLAmnDYOdFkpi3DHT6Q==
X-Received: by 2002:a05:7301:2103:b0:2af:9a4a:da8b with SMTP id 5a478bee46e88-2b05ec85686mr411609eec.20.1766083555339;
        Thu, 18 Dec 2025 10:45:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm32748eec.2.2025.12.18.10.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 10:45:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Dec 2025 10:45:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: "Darrick J. Wong" <djwong@us.ibm.com>,
	"Mark M. Hoffman" <mhoffman@lightlink.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ibmpex) Fix use-after-free in sysfs removal
Message-ID: <2827458c-af0f-4533-9136-1fd66223b77a@roeck-us.net>
References: <SYBPR01MB7881BB1354955C1608A16502AFA8A@SYBPR01MB7881.ausprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SYBPR01MB7881BB1354955C1608A16502AFA8A@SYBPR01MB7881.ausprd01.prod.outlook.com>

On Thu, Dec 18, 2025 at 03:56:47PM +0800, Junrui Luo wrote:
> There is a use-after-free vulnerability in the ibmpex driver where
> the driver frees the sensors array while sysfs read operations
> via ibmpex_show_sensor() are still in progress.
> 
> Fix this by reordering cleanup operations in ibmpex_bmc_delete().
> 
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Reported-by: Junrui Luo <moonafterrain@outlook.com>
> Fixes: 57c7c3a0fdea ("hwmon: IBM power meter driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>

A more complete fix is already queued in the hwmon branch as commit
6946c726c3f4 ("hwmon: (ibmpex) fix use-after-free in high/low store").

Thanks,
Guenter
