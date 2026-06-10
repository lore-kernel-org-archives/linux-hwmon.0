Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953793C553B
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 13:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097152; cv=none; b=AVg0UdRviqiJS4tJU5WudrW5SNFW+y2/TPGp2+aFIuThGo6xKUY+1fc5lqylL5aDlRrTVQjfWKpr4sz0c5n6Hr6myuf9ZuAcpX/bA2drNygzUIKNiW+jiHVbnkdXrJOe8xmnnNKXPFGPDabdy7t9vU0UKmLDYSfz1qHsJHY7cT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097152; c=relaxed/simple;
	bh=ujnuTbuIA+/VMzsIw8mIg7lRwtphwwsiuTKrr7QIULQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBF2LhvzvmRY+3cWLOh1N7vhTh+OJKf0D4oYtD/dCOE0GN13hICCuGjJTNQs4436Yk7aZ8Hbbfst7cEeDoRen6/B4CWHTUSaJDaV9BnxSsdP1p/pQs0MfO5yIRcl2m7CF5YJwgu48BPP+lkUk1VBvsx58GrNiOkURmIIVEp7Ysc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUE/wG40; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUE/wG40"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso64929245ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781097151; x=1781701951; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQ8w1vFi6aBokKM82WvjsJebJ9j4q6ueeVSB/POf8JY=;
        b=qUE/wG40ru7ijpez3HL7ZLwhesVv1pDXuWXV4NR4Npnmb+DitMeSBXW+h4JXXLpogH
         HyVcfb0NFEYLMX+/I8LSP9IN/JMUAP0GIMG5Wykc3SfXsjREAwKw+maH97fdgBlefMZo
         rQWxr6BzoqQ9KApVUL61Ncb5CD/bkrMY1pngZk70HatIh4PgyhJ9NDRVGWp2U5tQEN22
         lKjZNI4n7/wQKsswo5rtxmgpqBWahQGGPcfUY9DmCwWziAf3LhDyMDYcNJNlpa6FTsix
         IesOBZeArFyOa4X04boQYMRYwEE8R5qD/P2mErHMT5wJ6SfXYkpDz2YqRR7NDq2HxtrK
         xtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097151; x=1781701951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQ8w1vFi6aBokKM82WvjsJebJ9j4q6ueeVSB/POf8JY=;
        b=Lg2F53M8gv5Tcq0V/1d25a/2+WmRd1hmfvXMBbA5nVtzFb8VLhLJtKKvryhn5P+Feq
         hCPRD+7njTHGU5+LS6Ln74sGAKzENY0plmhBtMuc/M1L4jlvzwsxUU7zlSiTfOD+aYpC
         qu2/3KJBRd0pkYAYZTgXIizpj1pQC03LnGbwYhoexk7BP47PiTpc47KdM/NdI+jRoIgS
         R8y5qdPzjhPHSs6IIHJZSARIzvsHpbGk9QOa+jNu5hssyJ03tsyeSR2IYVYqGD4m8Skf
         GlE3Bt78oUQTl7A6U0Q561IZ9xzVMIHYPIrwt2LI9gL0o/SYp/VeCSRTCUACAFb+fM4p
         l3vw==
X-Forwarded-Encrypted: i=1; AFNElJ/1hOTvZDD6HJyIYGRopttRQEbqZe76VyV7G9Jgxtjvzhl2wmpOxhQo+H9hr4EEGxezFzaUtndqtgtajw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbxbF8QzVNiXgHpUSV3AyNGI+ZkvrpuFmHs0nxHS1eqnZjAeeT
	Ir6IjC1c2Zxj7S6wOnUhOc7VdrfeKA7GkZfhEvFrYTAzGKxkWzbxWe0e
X-Gm-Gg: Acq92OHi+JSfy6+YVqo6Ti5eq/d/TY8/xoip9/BStaOUE0BCjxgDAkSVMjuHwRjFjrO
	57nGJ2zBrH6+nwOhNn9lF+OOy2KSxNHuzfyc3dGfDAvTBvCSI3X6deVPuVKcZmRfHHQ1HN7JEmH
	bIONGuJFoWNMOzAj1E2+gBOp/Oq4Ug5TTodKzzWEOaFZhVezv7NdGIU3IEbYma+xCrgmdo6isiE
	ng+FhUP+zJ1ZmRQCY6Mo9EC6JxLs1iwubQGczT/fPR2VLQka8G+2BWzTKyKanHq06iG6iX8zpdM
	bL/xYK+uYZ1u3u1Hn/ihvy/abFk6xqUH/PoCjHELqTjFKiVsSk0sLo7ZFTYrSRE0M2RyvHB9mW8
	W2bYirzNaeEJDpWX2/GO56yKApkWtFJtpt9TEd5IP8h8ohYh1PXurNP92p44esxrDrcKcLq1Vhe
	r2tEZyRyKapNf1PaeKq8RSC+NiNKUaa3w+ym85pdCScxZmSP4=
X-Received: by 2002:a17:903:90c:b0:2c0:b7e1:7f08 with SMTP id d9443c01a7336-2c1e859fc13mr303390475ad.28.1781097151017;
        Wed, 10 Jun 2026 06:12:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f87920sm251348465ad.24.2026.06.10.06.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:12:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 06:12:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): add support adpm12250
Message-ID: <3ea8d261-ccc5-4b33-8ee4-55c5e4b31670@roeck-us.net>
References: <20260610-dev-adpm12250-v1-1-422760bb80da@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610-dev-adpm12250-v1-1-422760bb80da@analog.com>

On Wed, Jun 10, 2026 at 09:12:10AM +0800, Alexis Czezar Torreno wrote:
> ADPM12250 is a quarter brick DC/DC Power Module. It is a high power
> non-isolated converter capable of delivering regulated 12V with
> continuous power level of 2500W. Uses PMBus.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Reviewed-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
