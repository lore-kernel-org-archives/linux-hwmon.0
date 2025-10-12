Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403F418FC80
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 18:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760293273; cv=none; b=O784Q/rOfH08zEvAGpjc/Mdms8rZlp1eHpR4gduhTSFaNUlV89aiGeU4liHHts6jLVRaxJTtlpep92ZVSJPkEJYnJ0/ZcxJMSWB8VetgnBOi2yDFDdaQhif+zT//NZ7dH/YG1LUjDjWEe7Dl1FMqPHGoSxPT2X4j+TyI3pBkPv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760293273; c=relaxed/simple;
	bh=VzQQ8lwm0Lk05lofP0JJWoxbz2rX9HlWG3n01ju/+S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjTAcA7IVbHiLdjCxG2i6MfwsTvAZ9po8rgLwAhaaF1SYUiQTT1ZyQ5zIsuvtjAxQ2yBUiaO2fASLetAmMYEEK8HFyyNlpd280dof3c/GcHPtXgaU0bW9mPIRvL04Igvf6nQ3vh9M+exmjz+tVZfiLKzFJOXoIabEK+qKWHRQlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MinxL1VP; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MinxL1VP"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-77f1f29a551so4561278b3a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 11:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760293271; x=1760898071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lc2pFYPu/FDbU7u3HBa68TtCrp3O8IJos6ZWXp+PENk=;
        b=MinxL1VPOqX1V6yOJcchAFLom5ZcUPItqjGbyfkq2M04v5prr0hN9VaWN4dwCtsTUU
         kvixi4fxnelwSXyO23Ysv1Stfl8fD9uhdNVjZ+ZXdYnbbioEdNGyvrS2Oj4bBVmOs223
         d4C3AHL+8YxUx9U3jfWOtPdoJDdFtNrsL2ebQZGDbyMvhn3UZWg8ijLf5CpBNQg0dcRi
         LP80XEw/N098tTOXW4BhZhiJ/7ghX8zEFK7q2yBqnvGaopach7XVfG6wC2aP7hUkG1Cx
         l5fgX3YmbPOkPDJFDh4T+/TuuLZ8JDvhJD7GcHEz6ZGwZIXgs/Kb7eO0IppJiPvoTIvT
         qDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760293271; x=1760898071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lc2pFYPu/FDbU7u3HBa68TtCrp3O8IJos6ZWXp+PENk=;
        b=Jz1/KC/NO1T36uKtLc8rq7FtY//NwdMo1oyCWTEOJSrJ77UAVaoiFMZ5yBb18d9RE+
         PJXVlFyOLyLqkLhMxnl9dXG72hohSR4ZwAbchPdCwm3T34DkJkmSsEFlx/LS8Dt2FegF
         qHbHijddHV7c3XHp7sh6H8XruAbVPg6xb+uH3DcD2MoHfBRDbdAQFUWdkkUCqu+3JT+1
         kR/OU3s/8iSxVskGL7fv0g36nkOaoiKGXwNZmUaUyAfyVU0CHYXJPv2DURl5NUSxXUp+
         AfzV21c7CMeKkJSYwmAGJajELMYXeS5t2ZfscgsITWmJELUQbilTUh+om0RO92DNAiqk
         RGDg==
X-Forwarded-Encrypted: i=1; AJvYcCXgSm/5gWPRP4YlzMmTHFFJJOohGb1lgLod8kLLStsFq5WchoNcCNS6EZbLnEZc6M7vF9bRa7tW+0jwKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEkLfjkcpKssUr+hbAcvH9wtUFla82GWyx9LGCrmrLRAHUUsnx
	KsM8QzknnU3yMd49/BfJmlFDoyGncU2177c4XM7+BWH2PzlvfZmyonOqktpVZA==
X-Gm-Gg: ASbGncsBf9uZXtZQlcma0ETQEa6yxBfltaqmyF/vDMehNGmcxEIJx5YgasTQyz/8Ygt
	LmRzlExScvQRSv/0zAPUYYMblnqIU8r/OTT+AMIloC8JKV57tqA1DYwuYM80ULWkb49WAJzJfZ/
	jiYcJzGRkUxy+avrdgC2BzubczeCjOqoZ0xB3BufkAq0Epn+cPjU9JzQLKBMFtWaUF67ToktQin
	U6g5ygNqPVIva7ZI+g7cy+57GfEXjV2Z+zb5WbXPXSuf77h+q50mwlYS2rmfs5AmObs/eP0YGxm
	EnjDZqQuL2vx5EqcKwx+jAeMUYwa3UMrW/knhTOo6WGbjEzZ32K0CUDyDYVkaSY8N0BGpviukFd
	eWjqLNqiPiD8LLrOccEFHOCNowYXrlKa1IjPsQEgi0+/aAxDT30MAfJZ/Jf09hvVs
X-Google-Smtp-Source: AGHT+IHkk2i5DXG4OnAiCP67L8ZhLd7RY2HgyjdnlHmDsHdgBJ/DoJ1fgGFW7r0einETEXYUTTYkzQ==
X-Received: by 2002:a05:6a00:179a:b0:77f:11bd:749a with SMTP id d2e1a72fcca58-7938723b2acmr18715348b3a.20.1760293271463;
        Sun, 12 Oct 2025 11:21:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0c349csm9070219b3a.50.2025.10.12.11.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:21:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 11:21:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: grantpeltier93@gmail.com, chiang.brian@inventec.com,
	gregkh@linuxfoundation.org, peterz@infradead.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus) Fix child node reference leak on early
 return
Message-ID: <7ed7d257-4744-47a6-a86a-4da8c54e38db@roeck-us.net>
References: <20251012181249.359401-1-karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251012181249.359401-1-karanja99erick@gmail.com>

On Sun, Oct 12, 2025 at 09:12:49PM +0300, Erick Karanja wrote:
> In the case of an  early return, the reference to the
> child node needs to be release.
> 
> Use for_each_child_of_node_scoped to fix the issue.
> 
> Fixes: 3996187f80a0e ("hwmon: (pmbus/isl68137) add support for voltage divider on Vout")
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>

Applied.

Thanks,
Guenter
