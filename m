Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B67930EF91
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163340; cv=none; b=U44caOs9sbhmTx/y3wxZEPV9O6WoxQJ/dl1SUxxDrhfg4ma1gULjNKmbWi44n5MKz3aVPjMZPZIJv+FrVqzRHU38jT26ZHGpDnwzuh7W9JfzSGSA1NfZKjnv/kZrA1BwBVVFG7RdS8ze4CVHjr8p5q+nqUZzsz41i7geasM/pHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163340; c=relaxed/simple;
	bh=YD0UymCDWvCVhyHZgVslw0dtDn3zgJ0QSsp7pv1B+5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azSw7MYD3ZKYabv75PNB9S0RgYZQs4OGJsGO3Du66yLHn5svBllPhwx87lEvcEAnlO58ucHe8hm2NSlm+OIS8HFCXBc7y22asvlEBvNKr2T1NmUOPsRWcHAFMQlFeUIyiO9diLiW0FbukZ0Fd0kpoPD0vKWlhkn2zkw5lGN3nko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMrmNSxs; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMrmNSxs"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e08baf860so2884938a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163339; x=1785768139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dQ8QD5HYV7j6QVAlE7qJa2eaoG8v8Hk5kMhrUWBN7qA=;
        b=dMrmNSxskvii+Xc1E2DKltI1lQlCGqzxeT9bRwN4VZdv5Ywv89QTg1FrQkwAbS+12i
         WzHa2+HSEW/9p81lr0FPgK3dImQvb5TOOMzPiU7ZF93MO13NOMqKVrX/cUsB8cIzTGkK
         a2V6WN8nUZUbczURXKw6gAOVtPp5Lc4GxwkEf8KbtXM8gKstTVbVOeLwMGnyQ5RHjBe7
         gt78jYhmJ3NY2/tBdb+Jf+Gz6W0a//M9dhTtZSWnHdfwV66TyJVMVu32kJ+VtlMR8l1Y
         CxADjHmcStU5oxtJPbOYr/FacNhoboVAbew/UfcEG1CVvFYqxq5tLYkH2AxeMucse0q4
         dx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163339; x=1785768139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQ8QD5HYV7j6QVAlE7qJa2eaoG8v8Hk5kMhrUWBN7qA=;
        b=hBHYL3Vgm1myRv79TU8MoOD9+u7lKTGRbOVZbKVcLfxJ7jiScV/Ifg0MldpdPZ2UH0
         +R6tKt+FmsgqkU2HkWMVlmXbKe9UQ2+kSKXSFPn+NO3GuQQ0xkX7g5hfyjQ+b1fZxwLX
         MsT0Il3ZGSWEXtTIizNnVbDQ5YUyBYDEgz2SMCQuoOM2RWA1OJ9h5DEts/qAJ6eN7TYt
         cvxO8i3l65yv09FQjIejQ9MHr6LjLgvBmlsu0RxiY9VZchA2rtMnHd3jh1zwoEsDRxYc
         ony6wYWWD6xMzKY2eo1epSFRoV0xoGasXKVxe/vJVYpATdaAidEW8UFceAM89X6M/KfI
         Pzng==
X-Forwarded-Encrypted: i=1; AHgh+Rp+CZd7opttOzLHTLdiagKvZmFpJn2Xobrp3LOK/GaLME7LR8Z+ieJoAdThvXV/bVT4naFCoTM6qDAhxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXePqXzyJGXH5IMefUCqSTOATD+9LNLoQ+UJ7/4OTcBVaOxrss
	hY7cWbNpbqN+uUQ5gPkCWVEqKOrQoCNqMMi3fdZIrh+tb1/gGMPlZ+AH
X-Gm-Gg: AR+sD12VS+mG2xlYKKbG3qZP9qAObJoixRccaKFyKPjQlXHpzLaTNRV1OsKaNormDIa
	PgMMuASaP+jR1/o+YnEoppwItm4FBLRWLWKAUTn+imeQBmoy4/vnK0mg4IIGbllAhO81ltZT1h5
	sV/XcsFUxb7bceW2Pr91rnRhqNbFELLLUotKltCArVsCbzAZlnvvi9vMEE9J3r+geEYXbIoNB1H
	KJIhpnzX9h6nC8tm688uaYinzQ4jwhK3aAYwPB8AtLfruKUBOwt/gwdeRdFBV5fur1VCD3jkoA8
	ppm9JAjFHrNnAvnJG6pUV7XUlH7/cMxCBUAZnC+zGMENwBlRaWtsMvHm2W8glGYK5Uk8xNJ1uyW
	H0J5Pr+alyHslQJtgRtdrlSxcALpd7UdWN8coW6h589JKwe23aQTZeWMwt/Gip4ESG5dN2LoJ/5
	MUQYBJMQzdbnKHlpg=
X-Received: by 2002:a17:90b:48cf:b0:381:85c0:1d9d with SMTP id 98e67ed59e1d1-38f2960eb33mr8297161a91.27.1785163338620;
        Mon, 27 Jul 2026 07:42:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e52f0c6f2sm27211956c88.11.2026.07.27.07.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:42:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:42:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 4/4] hwmon: (kb9002) Add documentation
Message-ID: <6d235e17-c067-4cf1-ace6-dbce05280d8c@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:40PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> Document the sysfs and debugfs interfaces of the Kandou KB9002 hwmon
> driver.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Applied.

Thanks,
Guenter
