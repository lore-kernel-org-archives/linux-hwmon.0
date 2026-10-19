Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440848;
	b=tvyv3mbHSFhHHPtIraA7jbvu5FOQfFDSPoAQtawzE8+23Qt7QBJz/yOSKIH3jKjHW2if
	 1Oqem/o+PfFhEBhApnmYxunjf9ck/rGZe4ALrslWcVqnZih4soVgKXwkrUvJOEGDnT146
	 lnu0iIZynpAdGUvPctO+kG2SzyPgYWIE6FBtIsznLYWKzcXkmj6ZLskrTW4zU5CiI7HFS
	 skatBXP14c/NKYNjFcN/FPnBOuJRn6DUfPEPltPAncTulJY0X+0Lmic0YGPybjdoZ+Yh+
	 sbQ/Lzb6b7K7KQo001DZfWJ2J9LlSWzuYax7vrhE6eGtpyW1Wd3+WwNFkZelqHV2+qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tQ/Eevs1qc0B1ETH+DkpySLtNug9OnFGZO2K4RbuMeA=;
	b=GVyCfMhM8Jv6acPjOozAJRp4OcBFXGY/yIWqOshX/q9UJGjD3MJKVLf6q7xbvv1OGuim
	 0P9PX4ZDUb/fpb31w86AaXHsf9NShAOxMIVaSfjyLOiKScUHFuHSAro92x8IPumarHxQ3
	 tGa5FivvPvqfgwhybwpGaNNeJGbGovi6VtRowqG25RQ9hPJDUJo34qmNIU1BLgEZh3sjU
	 aFScuSatOlHMmkTzDBy/cw0gp7eIhaiA0Ar6UagGiVvJ2dJfomYsofZsi4FGQk6jzjHfl
	 +428Nc0/XglcFkbN1fLw4+ut8TN2n9j6/05XMk0ous6eUDa2KirHAM8VkOKIV8yR5gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OZYO12Yc;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4F2606A325
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 20:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC4F2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OZYO12Yc
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35d7fa491deso53512eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 13:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440847; x=1793045647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tQ/Eevs1qc0B1ETH+DkpySLtNug9OnFGZO2K4RbuMeA=;
        b=OZYO12Ycc3vPEovHCGXwJhPLH9PH1fd2AujveGshzfQ/Rw01uCafBZwim39ej9ASUV
         guuW5V3SZKVydXR3ZUZ3yc+h4hzTZnrhqEjXvUfAwTEVNzimmHXJ6YonKewbdT7NYMMI
         sCdoYjFsEZRpPhoWMm7NR7i3X5bSZBN4Jn7DddiWfMht8mDIlh++A3O/oWjzMnO69m6q
         akoA4GmY3x69dOsI4+Fj+SvP1If6MACbhHl5VntKUqx9Vc/4UR2+wG4w/CqMvYCq7QdP
         dTUayBZFnj9XoMar36s5CCfHb0JWa3u1lAmA/F1eQ7vtmdlVcj6lyOWCLJmEdAFisgUz
         Xi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440847; x=1793045647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQ/Eevs1qc0B1ETH+DkpySLtNug9OnFGZO2K4RbuMeA=;
        b=K5tLRvMBdaXElOfTAQwuLLw9ys3khW79oXgeLgViHoNdQ7+cjw62lQD1huS3Jb5JqP
         mrvoQx5rglqUw5vu0hf2NFPpCu+POcvSv/099zv8RUjzPZX1jIXf2+gSEAgjQSoUYm0Y
         3MirMs9At1lz7MOdInzr5ibZXdOXaCU6zvjD4Yz8qV4tbyexqTzuRR23VSqINZ+ysn+C
         e91R9H2sdsH4PjcG/NTJsXTgk/2xGku15YLXv0+JWzq768tpwZzQSFlib2zqAC2F2jEh
         UoWMzPy8RThoW1r6kz5Z7d1mLXEgGW851jnouLvajFiMKsV3jq+3tKzIdmtHZXGM5+Qo
         +f4Q==
X-Forwarded-Encrypted: i=1; AKwUvByaKr59pFD2w6iCKPi5SMd2QmeOuzSZL7OM5vdhGzgR35cRBl6E+M86jb7oHmjx0Y8NFyNg8E1IIFIaiw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLwfJasWb3yFBL2kFguDq/0yoNIyejPDlTQ345Vj1kWXZuA2Vcu
	nYgO7jL+0CrxPllBdDUhryTYpavfRcivz6YA3ZZRyFsslIAmyxAtn12g
X-Gm-Gg: AYBFou387qMoMCZxGfXwwW+PhHgzZmcSN7iDrl3BRZ/Idm9xFiEoFPmygbrLJoG5fYi
	HyayxUqNmj8y2amBK0g8hU9aCI1CWkqWWfSrZYxMeoWwdIph/B1dX4GGB8XGX4cDMCzRNr1mYcx
	lmBMZfNd+AAXE69OO0BtQPwODDKlv2smXZltjlAiXW8M9hL6r7Dhk5MfmMksaTgeLAQ0q2SiZyG
	z04YUpU7uFtivsjyysWJ8ypSV2h8TvZL8FCc62x9yjhLvA9qWFpkRdMpqdJpv/VjByM5x0ZFchz
	seg+dq+WqgvimqKDDH0Yp0iUUiVKcgGZA5qbNtSDCrgu3INe+XlO351x7p5XfH4tNpI77I/VjzF
	2PpocO/US5qoj7BymulHucCxNj2ivqtY0TlmU8A20M04Ir+txxCw4V/aRZEWdV6uoebxF6u8FVR
	VtOcH/biYCqmQ4U92PwWSxrSw7QKqzjK9BRnEfL8Kq8aSLBnymqBBkpPw/W9SbOgPp6PbZB3lQb
	wKyC9QWYO36Sg==
X-Received: by 2002:a05:693c:20cf:20b0:363:a45d:10b1 with SMTP id 5a478bee46e88-365fa49061dmr230217eec.5.1792440846820;
        Mon, 19 Oct 2026 13:14:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm63348675eec.24.2026.10.19.13.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:14:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 13:14:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: victor.duicu@microchip.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (mcp9982) Update the interval cache only after
 successful writes
Message-ID: <1b0a818b-55ea-4f7a-92a7-721e1f78a0fe@roeck-us.net>
References: <20261018055750.1318723-1-pocj8ur4in@gmail.com>
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
In-Reply-To: <20261018055750.1318723-1-pocj8ur4in@gmail.com>

On Sun, Oct 18, 2026 at 02:57:50PM +0900, Baek Kyu, Kim wrote:
> mcp9982_write() updates interval_idx before writing the conversion-rate
> register. If the write fails without changing the register, subsequent
> update_interval reads report the requested interval instead of the
> previous setting.
> 
> Update interval_idx only after regmap_write() succeeds, leaving the
> previous cached interval in place on error.
> 
> Fixes: e2fe950f34e5 ("hwmon: add support for MCP998X")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
> Acked-by: Duicu Victor <victor.duicu@microchip.com>

Applied.

Thanks,
Guenter
