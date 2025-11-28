Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618162DC791
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 22:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764367907; cv=none; b=P6WSOhYhOcnLHKb0ikcBrxmJtGYQoPcjUmhNRZTMzvL38isg5n82zAAN1H711Y5UpOTvn68BAliFYNPnoty0xEzFtU0U7A4k7ayWor1edaWiU5DJc3XL9DrG1sKXylp6/HqXTacTC1qjD0AyUENgiQJXJ42Wtlqqo23lX5edaMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764367907; c=relaxed/simple;
	bh=fV/POjrihOxiepllmcTh2r+up2AEnY5AcR6Zyo+VyWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0+VxdA28OUYqXVuflwrh64Rf57NpNImtjRNV5snKqZzQnmaEpFqKOax0nN+Bnqys4CbPvtUmnweznMJII2gRag/p85+Jq6Ed9dAIJ1JgfnuGjMmmwZHtjwulVtodYcYa38z/RGbJr4a9DSRRdhONQh9D5D2e7MwH1l7OEcAPdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EahLKcwn; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EahLKcwn"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2984dfae043so20067645ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 14:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764367906; x=1764972706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8W5fIpcW6K56yXlowZ5Boeq0PbdsTAeZm7nguD8644=;
        b=EahLKcwnR6OK0aCWXBNI2wYRURP6i+Cie7IV5cAyE4cRMW5Pp01Z+EhtgnpAztHBMg
         5GB7rcKWfsUJWKc0i8Lhmn4vmAuHSQDt4DcRh9O7/JWLLyRwH20Z3/H9XBYa1MYTMYj8
         9yxNX8Z06ycj+g+axC87JEWKkiHQ0GdMy/WgOz4V/MiyknLTt+Utit/chn3t/bgoRegG
         zroSOQtFCQGsxtpSW3Ixuo2vAV1NwyGlc0nGNHr1XZ428myPtuHrVw4ytIhvFlYCZhwA
         FFYuQCy5JVV0vj57q0+/sEFavg/aVK55AQGFth+foAkBgg3CMGxGwi+lkQyj7SmFBczd
         kA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764367906; x=1764972706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P8W5fIpcW6K56yXlowZ5Boeq0PbdsTAeZm7nguD8644=;
        b=IFad34vaasPmiv8zLoK6R6yUpCvLDYPjppNJTfzNVYW2os7/xYk8cydB+u1Q2HRMzY
         oUi/lEmZ19I/WCQp1xysKTsO8nxVBFCHUAFNmeBz2QQgmzfFAJo+PWFChaMeUuWg70mL
         xtAuTnN9Ow6tbD7kF8he0HwAfFYTfnwtVByyWnfxx0oSt/bAwjQKYuWQMm856tN3OwiS
         vkvZnFxP6tHH5saQdUehDWk6uNHGqSG1mW2CtjDlvknOWbf5llJWALoqzuqRPXg1g16s
         9SKu3Opgw9ncHSyVeuL1p3lpsh+ca/RfYqrWNuT4Yfq93e7BgXPN0QeEBXR7XLB0Mt1f
         9NMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNUufILWcxJgD6DwnNy8huzWrVbCWU4KHLifd5ioDZBDKK2nVLNfbxw98cd5Lag2PQIRrtM2VYp3Ws9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6FNeovJs1k1Q9i0tehuGRQ26oqPHI7EdQe158mO7/FCZO95wt
	FlefDd5EnDKVpT9iQFpiMuudgxQIu+K20tnh0TOrrvkw6AfG9gJDponf
X-Gm-Gg: ASbGncsW0qVMHDobK6Bp2ANTIOja1gVZBaiPjQSXwSYwbeESR23J0yWmgnSbakJypRa
	W7GpV4wimftttX9I7KRpaUy/vI7ICd87O6X7KcC7zmzBdwktneRy9oBFHdT5RaW0mRgHSZXL7q7
	+aUw2VfEfjUbo+QFDman2d1vh+iq4RM0EJUjmLbHpWN3PcygboPJXa4sAC8kTUjhtkRkMQR1s6e
	rtCCTsbreAEM6dZk1+vBcrMhuVT+P6Yj0B1a3VJ42vDHavCeUjg+/NukcFQh9jYkIIJZtwhb3SH
	c9n97tv8/NJaIN0KdF+7cgJff4Y00GPezMQ9EP9x9qgep50xlpofuGE0lqIELizMaZts9miNN0P
	cipccX1uLAkMu3RZZIg03bTdkIpizv0jYGsaPDh6ida5BPt+nbCGvzid0IY8ysImXUDzRSOjsQM
	rKuiAeB9k3Neg1b1mUzfDucxBJ7Zvi4aINTw==
X-Google-Smtp-Source: AGHT+IHZku7KTRc9YozRT0XigqnM/VcOTV4dVsDEq6CYmcvQp2DXXjYnxuC+4LCiVlg0q2vsOD6XSg==
X-Received: by 2002:a05:693c:8016:b0:2a4:3593:ddd3 with SMTP id 5a478bee46e88-2a7193c9fd0mr10724282eec.0.1764367905511;
        Fri, 28 Nov 2025 14:11:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965b1ceeesm19087909eec.5.2025.11.28.14.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 14:11:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 28 Nov 2025 14:11:43 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gabriel Marcano <gabemarcano@yahoo.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell G5 5505 to fan control
 whitelist
Message-ID: <db5375b4-cf48-4b3f-8269-8ac437e84766@roeck-us.net>
References: <20251128191650.6191-1-gabemarcano.ref@yahoo.com>
 <20251128191650.6191-1-gabemarcano@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128191650.6191-1-gabemarcano@yahoo.com>

On Fri, Nov 28, 2025 at 11:16:44AM -0800, Gabriel Marcano wrote:
> Allow manual PWM control on Dell G5 5505 (and SE).
> 
> Signed-off-by: Gabriel Marcano <gabemarcano@yahoo.com>
> ---

Applied.

Thanks,
Guenter
