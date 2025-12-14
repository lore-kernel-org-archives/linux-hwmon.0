Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB4E2F3C13
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Dec 2025 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765734916; cv=none; b=hJUdnuVLbNnjXf8h8LYkKocIM8n7fA8Rc01Z+nzH4rNaLNkag8USUt1wPllImOT+U4iUQFSefkipj6pWChc7/glcaMRSDbDOUeBhRcA8L1W9na5dpBwJgLUeMKHaV4T3wmuGlvldEOsAXaAhXAzJVyL9jhpxd6vQ8iaIcfnBUc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765734916; c=relaxed/simple;
	bh=83zse538fD8u03mzTPAEQCydwR/D/5YHsoWIx4X+It4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oleHKrW4KRZLl3ZxM+5hJSbVELLgsg1SkTT0G3snr121k6AoNoT0HLBA0MZvmAAuQAlwXW3D5DjVTv/nLqD/A+UB7J3HpqnlJOUBQ1j/4rblAkqcx1YM2QmijycFgK15XkfCz5oUIkwMsgwK3OcKCqapD7paTib47SBYrB9Tq/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NR+6Oj1/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NR+6Oj1/"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29f1bc40b35so38116055ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Dec 2025 09:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765734914; x=1766339714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLDlN6OqM1rrufBfPttMo4blrCkCx8Wc1Mra3LYz6sA=;
        b=NR+6Oj1/8mlLD2Q0ZY9oTG1IDsLiBiLl2Er41jeTwrCIYqTNZQw0zM7UTxWHcuUuhp
         ZFk9t3jKycUHFtqpoBKXHowIgNrQXZy74oZD/mKLROALYKSNB7xcenz3KcI9cCSXTqQ9
         jX+ySk2GAZW4u0plFiOJHSi7FtvSAhakFaDiG+RKLrXcKZvViCBOVDoFVjkydx3mbvUv
         vtQAihXaPmadV6P15QzrqiPel3zl2VZ/ybab/tfUdGmkHXo2BLtZ7dLMF2wyhH1Nn0aZ
         T8jCBU/WMiKl8hJt6x8hXsY2y0KdNyrljwX7BBMe5gxEpc9+n+8U0x+m8a7JgwLt1Zkn
         QjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765734914; x=1766339714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CLDlN6OqM1rrufBfPttMo4blrCkCx8Wc1Mra3LYz6sA=;
        b=p4K7sNTNkNIGBPbsgbBYYPzLJV2B3DK9yLttsYft0KlttkLCytcgTdow9LI98C/fFD
         Gd1dXqJNxFDr6p7lisqzyFrzEe1NVFGaqeQIEOImXcL1mAwPJN5lEzIwBCSXcpPvVqXW
         GICYWfGTQnfc4NSJmBZlyqlJ7og5VxR/pwJHkMLfYuLvM8n/R6pwWIjB5AvZ5y1qQIp8
         AS8ayYjj3wUs/pCarD6IAc68w7Iat75+cMtykFxld2/06xUDLFl+ZF+IM671/LEOZVUD
         xfbrTNGV0FdaG/Bs4Ka2SI3OOHvY8Wk9JaQfSJ8kSslW8AK2RlWaYZH5l2KDmdj5rmbn
         g9pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSRXAvdkStgBlTCBjKT1oiT+i9V8f4wOJuy1au1hgSiQXuz6pkB0fjQT7t2Vqp5aFO+pAsYdEA62CYTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuSa0N9cLPjExbjJU0E0ZJbpIwCKLO6W/f+BvbxRbGpXci11iw
	prL6/aHD55cTms0G08xqImtAW+86HFd+efV3DxWPILVq2w2HustAXom+
X-Gm-Gg: AY/fxX5tKU98I2voJTMVgnJ4ereVkkKrxtACcsiWUGlAAt5CWZnaIx7IbkUTuHyFDeH
	fAtYVTzH5r8A1894iPQkLrfpncXP/Hj44ZYrru8tr/r4F9kub4VcT6fqJ7gpW/S+07FHfJPLmeK
	Z7QyWoQpT8MCNxFfOo8EOgOvDZ7PllnJwqRrLb7VBM/I9shjF5qbApaxWA1J+HNGI7/ZfAj6f1A
	s8D53SmJiTCE1HR8qrQw1kXSJaK/qfTuI/kTscST3TZTj9supYXSFr/tb7yssFnM8+ay2JWrNdP
	asI3ANjTwIcy9sbVjLm2+NEfadnfzwX5/TSl5wspeFMOXl0UdA9bFENFvJxTM66EkG/KMObCuUb
	zVkwOdS2enIrDhO6PXJ5DSC/wRnaH3r5s3YQA8shh2lDPUn3MBfW/++sdhDOsOHiQA/+qrf5Nsh
	Ntx+OXI51kufDnxxY1gIk8NyA=
X-Google-Smtp-Source: AGHT+IFZwI5FLozBbnp1DSYRjP3PIPgTxtIX/z2f0jfZMZB9XghTtVjggLeWnozUACDLZM/xGv4O9Q==
X-Received: by 2002:a05:701b:2309:b0:11b:8278:9f3a with SMTP id a92af1059eb24-11f34ac5418mr6270136c88.8.1765734914531;
        Sun, 14 Dec 2025 09:55:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f43288340sm3220338c88.6.2025.12.14.09.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 09:55:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 14 Dec 2025 09:55:13 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Antoni Pokusinski <apokusinski01@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (sht3x) add support for SHT85
Message-ID: <736f83e3-2578-44fb-95aa-fe7ed520a627@roeck-us.net>
References: <20251211185842.66084-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211185842.66084-1-apokusinski01@gmail.com>

On Thu, Dec 11, 2025 at 07:58:42PM +0100, Antoni Pokusinski wrote:
> SHT85 is a temperature and humidity sensor with the same interface
> as SHT3x.
> 
> Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>

Applied.

Thanks,
Guenter
