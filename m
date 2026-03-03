Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE95351C21
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 17:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557599; cv=none; b=FrkUzD7572FRyrXLsyql3AdodiYmzcxlxsj3tsfhoBrOHvTsVMm7GDDoKpgZgS23Aatl0zMJDLze0gSraTZvWyTGvBdgScsKz9+vv6i05iUTM4Y3wRZImwkndqgyIu1OLBUyoAx5RDQVFMWRJjjTjqDM5uvXaau9dulgZ1evKv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557599; c=relaxed/simple;
	bh=zr4j0pX0xJIJYqkcZcB+njWoNKFLG1CXmv9udPZcEpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyajM899nKD/tKukYzoTonfM30KO3klqg1Gd71w4Nldgwx0UPO77j0f7YX1p2uBC4eNt4gG75qQ6J+7r71jg9WRu55hcPS9RQtlaSBnmqGhbu9JuQb3U8GBgPBdqmFlMAqAwiCYYEIQhxCLL3h11bHPYHoYA8ukM8FVjtACyD9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB+ntgEA; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB+ntgEA"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8273eb7798eso2620178b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Mar 2026 09:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772557598; x=1773162398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrw7V2Kqp1JpwDYnbVkT392EhBN/UA8T32/Q8X1++as=;
        b=dB+ntgEACBq5r+rWaDHcjEcexxZdpu3g+Ha3ywscYo5jH66rHzgN9W9LtFcw7DoMK8
         cVvAYsIfkgp7T9e2SAWyaInVA4NkpTHL9h6mms5NxPiquwEK1srUsOMbiEA15mSYWBmj
         IAFzsPw0tl6Zel+BSgIHHWtP54vAruaTl6MnIjWC9SNAYrb/0EfYdLWaQwNHPUBH0PdW
         Q/bT/snk0WEDPZRQiL2IJlT1wF2FhrRL5GM7T9ZB7kKpIF9dte48QDIa3hajXuNHyfc/
         18gb5YcKjAHFHFoxnzRDz8yOSa+lVxcsEiA7B8xe7Xyjk40zZHIgdpJWLUAPArTbuFbm
         yYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772557598; x=1773162398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vrw7V2Kqp1JpwDYnbVkT392EhBN/UA8T32/Q8X1++as=;
        b=p7xtAID5aPRKnEjA/HAyuiQLjtbABdpv5okmVDDR25PPtTo4UgedVQMwYpEy/pWfbz
         lJ5jrG7oRmdzxAxqNhLRrSIAEoS9os0RINjofFPcBQrR6K46aSsbfYwnomirU8U/J7o/
         wwpPtDsl80BvZ7YMTMg6edtkc9Gd8haQuT3oO9G97y02Pk7ErDqn/tWkJiuYazt6pbQk
         HA2Prf9LxPDeAtpxmIVdKlTAD4Jf3c1gpv6PTRw9dVoW5vC9nGgIvN9ky6kLB9RtD+xd
         Hqx8FlFvcIBoaz9JoaeqbOHRQSKPCi5snstfsdxj9QjzX81godPkLOmPRiF5lDwCl/YE
         /4tw==
X-Gm-Message-State: AOJu0YzYBh7KWApEpPvr8zxVPduS14b0+jd8UFki3XlF1Y7OV78RlVST
	EvqH5fx0HEzkPBxniw0FJdK/38nJ2aEnRygIxiQBkUZ1n49n6+HtZEtAfV/Hztdo
X-Gm-Gg: ATEYQzzwiFGcGz/gZCiWcWO47Nh9a87iDG+G6F9ojccz4Al0RZ4ibEwRWgfIvWQdUU6
	vU25nPtsUFXxY+J8Nolw1TyO6GFAQrSSrwh2265/foUtELYuXpE1I2I4m0FMAUlNmxYxlqy3Exo
	wzxozH0oVPG5Hg6OQK3Djxy5AHf4Tv0EMuQGAdJ0YOyffyXLEq8jYW01LwFqgj9/ZxZPdSPBKVv
	EXQ9sYuCDIcXIsfuvTCUdcw4Dx1dpfjSEaeDZJq9XGQfUDIVyDZ31ZCwcpgBR2+1mZxfPS9iJZj
	RqQ/b59xg45WWDTL3QZUZ1yovNV1gGRDCSN3H6OC907Hkui7/Gpgzn5aQkH2NbEzJSGnTnOYtft
	5w5P4Yn+dfKDMi4pqueIOiArKLP4m36Jl5mwO9c8OAKdFbsxmEmU5wwWTYic6BoJOl3mRSQCedB
	8m3dLAFR3LHbuxy/WG9Pl4hPTRsN4P6sTo5JtK
X-Received: by 2002:a05:6a00:4404:b0:81f:99cd:faf8 with SMTP id d2e1a72fcca58-8274d93b37amr15362146b3a.8.1772557597853;
        Tue, 03 Mar 2026 09:06:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a060331sm15928119b3a.62.2026.03.03.09.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:06:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Mar 2026 09:06:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Amay Agarwal <tt@turingtested.xyz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] hwmon: (max6650) Replace sprintf() with
 sysfs_emit()
Message-ID: <27dcb758-6f58-46f4-ab2c-68b876ef8ba4@roeck-us.net>
References: <20260303152456.35763-1-tt@turingtested.xyz>
 <20260303152456.35763-5-tt@turingtested.xyz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303152456.35763-5-tt@turingtested.xyz>

On Tue, Mar 03, 2026 at 08:54:55PM +0530, Amay Agarwal wrote:
> Replace sprintf() with sysfs_emit() when writing to sysfs buffers.
> 
> sysfs_emit() performs proper bounds checking and is the preferred
> helper for sysfs output.
> 
> No functional change intended.
> 
> Signed-off-by: Amay Agarwal <tt@turingtested.xyz>

Applied.

Thanks,
Guenter
