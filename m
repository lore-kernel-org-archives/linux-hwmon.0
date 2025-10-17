Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EF632ABCB
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760704955; cv=none; b=Y7IFI2rMH2hlF8KW2nvIuYKBNgbYLPN1d1ySr9eYefBjw7Q84cmx1kLY+r0alv0rOUWufv+4o23pNFU4Tu/F54PgdgQ2bZBXyJ14IYLmQUg2ijYeByyxujaXXIb8VeXEwRsE//HS4DJHE57hKndDXEUmknyJN4T8qjWrjdYe1zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760704955; c=relaxed/simple;
	bh=POU5j+tvDqO8/nO9ZiDq3h6zTPVpd+d9v/uR7WHAxWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVLp+bqADFNtbjsYepSbGxAkgjRUXiqKCATI8ZSpFqaxxWrOvpWsjfYx6lIYCHsBfqQpX6Z0SRb0Fe5jM+UPkGLoWBd3skQjbFjFh6e63/5rYynqXcjuDtmSwmNsaIXC9zCZK6QCpeacDAw6NTdMc1TTfQ+M4iD697D1a7apXcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwAnounj; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwAnounj"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7930132f59aso2600795b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760704953; x=1761309753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lgf/jis+kn3VwQ0hzMf+yQz2Z7yEVW6ZUVMe2PEq2tA=;
        b=LwAnounjX9q4ZMAwqGZDDiZn7UPHg3zS+vmxVciNMPdxZLjcS7wiEm6EU8x5LP1RzD
         s4f8FgYuD/9RnNLjNzJ9bUdqe8PKg0XqLgBGkWbFiKJMItXJYMZ0x7LVKwoNg1YnG9+k
         UiAyuv8UL8PVu56ZLjNzXb8df9XP3Z33NGU452iCqUxyXPjCXXpPr6t22qTEPSh10MYs
         xoNQcYgtkaWGD6wEhx77fcQbzfK7xtnfC46rDp6Ijo5t+4HciYLwYgF91y8KGn95Fpmr
         cgg3VbRLRD6dhk5Ze35eSmobaJTkCf9RkV88xSsattJUCUuuLw+eOgsSkC60RpbeJL66
         0XpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760704953; x=1761309753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lgf/jis+kn3VwQ0hzMf+yQz2Z7yEVW6ZUVMe2PEq2tA=;
        b=cLZL7ZZAmqqwdJDQBev+yClA8gL7RhcaZeO+BBYmCi+YEdnh6n4tktcOxuafnquYjU
         Vlxje1EWVfn4vj65/I4GRMmMGRb5pPNwRnOb9BZY7MBrvBkj1FZqvjIwp7orwUnfwAKR
         XnsZpbOq9+1paop4n95P9WJY7FQ8R37DG7GtBbjHIUx0SZZR4tcuq9zkXoLeKt9WITOu
         ShnxigEg6ThXRcKxor+anTrPDcXfCF8cxbNZJmzRBY1D2c5p3eQoJXemr/wlz+5s78Qy
         uZP916+au+LY6Aauv77/KF6znEcXE40H1Z71GAWLn5woDobc0sf7gM7FDu485oOZUE1t
         euGw==
X-Forwarded-Encrypted: i=1; AJvYcCUXyv3nMVJFjJaGD++Av/UhL3ZeY4FCGfjFBH7KUu9litnbuC42kjAB6jaJuTBuq6kfUpvTEzPHmruKjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymlWKTJUfa63lLDLFuxj38pq89gopKBy5yDXyjcAvpzGk4iVvZ
	07a6H3COT+kKfGLs8hJzRvaHBpobin+KfojAAVc8R9rSl8FHcrxUFzsk
X-Gm-Gg: ASbGncskASOCKUyy+iTFiq5/MoPxBNBU4ebeGx3XcI4zfciD6g0s7CFSC37iHKSnrAH
	Wt5qn9tu6mg+pSzLCK1xghK2bE6yzrWqnMo8Jz9OmNush+fVC42TFh8pZrb31yyWc6gyzuW1STI
	eiYPbRQgTbrnDXTxizsm8h9Twsae880FWaezSSsHQP07AsB5teOeSQ/d5dQEVx46/XdC38g84Mv
	2LS4LyzCn+m1Xf/eZHnKneS3T1DcWH1FHqDTRXrZqz0wSNLH3dSMgH9fMzwKAp96TFWfeWgS/73
	Ox6O1p6ugIsgMnIp8TGBoJTtZt0nfYXH6A1gkpj9FPIw9EzV/qlJjmuy9YDbaLgAplAV0qES6VW
	3Up4qeYR74/XzSSJK9yfsBGTonFrikxulAgP+RfiHXvMyhbqRIF0Q68PCgU5zq3ieHlUD1lUuYG
	AH4brBPsZ5T1hNxOx+o3M1Z3E=
X-Google-Smtp-Source: AGHT+IFqIQl4xcuNro/f+18JqdeaKcp7B+ZvBEPtCwyqAzWqU1DOxii4XUib0aXOYR697MrcKnLO8Q==
X-Received: by 2002:a05:6a00:1a87:b0:781:2401:74f5 with SMTP id d2e1a72fcca58-7a220d56e59mr4076476b3a.29.1760704953019;
        Fri, 17 Oct 2025 05:42:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b8672sm25561467b3a.69.2025.10.17.05.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:42:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 17 Oct 2025 05:42:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Li Qiang <liqiang01@kylinos.cn>
Cc: thomas.richard@bootlin.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: cgbc-hwmon: Add missing NULL check after
 devm_kzalloc()
Message-ID: <fd8d7d4c-adcf-4703-9804-09a35aefc24f@roeck-us.net>
References: <20251017063414.1557447-1-liqiang01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017063414.1557447-1-liqiang01@kylinos.cn>

On Fri, Oct 17, 2025 at 02:34:14PM +0800, Li Qiang wrote:
> The driver allocates memory for sensor data using devm_kzalloc(), but
> did not check if the allocation succeeded. In case of memory allocation
> failure, dereferencing the NULL pointer would lead to a kernel crash.
> 
> Add a NULL pointer check and return -ENOMEM to handle allocation failure
> properly.
> 
> Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
> Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>

Applied.

Guenter
