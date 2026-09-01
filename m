Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882E74746BC
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 18:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286667; cv=none; b=eovXebzTY6eAeJ7/0iGaPDDcXwOtjxFi23MjkZUaqplut8hhobK8RJ0VcI7ZqTfXDNrSGsAve8tykOo4w1F7PHink3FjiiGzjg3aW5KQpfc6VBhwYO6BwfSzqCnOcXdorM7mQPYpqkCtpIsuz40NrsN7UnKR6/38FosYrOpdReU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286667; c=relaxed/simple;
	bh=QAlVz1big6/0SHd02D8Am44I432cOSKgP8fiVVEJtxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADo3lgNHkZIU1i3+etEwji7ymNVwm4b9REYj7uvCTVhJ0O4kf3zVXdmJsIWkJYzxcjkMQnRAkr9zHXV5Gjrg9BClNTDIk8Eime4Q8pNhdvif6B3usLEXnfYjkEu2eHp4naozqpvYbEcEJ5s+bOCVbturA8f/HyLWwYS6ymt1evw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZ3vD23Z; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZ3vD23Z"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8fd3b729dso752875ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 11:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788286666; x=1788891466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FvngFuXh4SNdJdga8wwv6o+vzwXABOb9ybeVY4QhSBU=;
        b=qZ3vD23Z+3Q06lfYre1JmctN1nCg1W9fdoPlnPurAxo/umwB0KK8BcWA9V9cfs3gKS
         pbyCm4NtLRx27B+lDsuYPVI+14UR9mj+Sst88gDzPMd9tjD/UYKHa1PhVHviibGqXzSd
         LIbbMCSoWhkMX92y1BvdTiVm7i1aejFoqbygCQ27XVn8PgsyoHJwylZtMPKG1s4Xt+Nm
         CsOCQk+MXuYvdlOnyVWgWztm6yCmVWXowTIgWJce215WqKJa8tcCGpnD+KiyyAV4LsLK
         Sm8i+ghdQKoHfi0ULxysyJPZ39nQ/DcgISw1IZ/UmBP5WMXN1wDybPXFka3hswT7vInF
         U5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286666; x=1788891466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvngFuXh4SNdJdga8wwv6o+vzwXABOb9ybeVY4QhSBU=;
        b=eAZFRCjkr+TwJOdu7SiD16gJn6upw6GX9jsAxHbF6dwhs/mO1G3+juFBVeGErFmxdk
         I9dg6Vt1MzwGpkOjrUnpbZ1mipGlYI94ci0AlK9TMCBYOR7TiSsN/2HG9K3h547Ha0SS
         LWF+gnbUFCmBmxaBz7OhmKB/pzHAN0zk/yfwEoRKkLA0y3BmhNsXESlgCb4h2QIKLftO
         2FkVDkl768FwRx3vBLyMb+Yqt3Di4AxTVGNvb/ZuxKXXdYSUlTVli8mQcrwiY4oyg5So
         FwpDU0WTGcGXMwirzVBI8kB4tDCFH6ZTmSehDzxw/j84vY54F+++5ccHfZb8sV1rVwml
         XWpA==
X-Forwarded-Encrypted: i=1; AKwUvBw6jLClR8sBadmUK+C/a/llBSVGS63AUs8Gy2LykOmIIDRZk9u+mvUAh6gxDyewEYKe67opyZ3i60DQhA==@vger.kernel.org
X-Gm-Message-State: AFuF++lr2XsjwrYb827Dy0vTP9pML1jzCC3PCWY0wWSNb7S42y9vp3XL
	QYOtN+LSr2a9ZQ/25JbDX3K+6r1uHV2j8lXcJJZQzEhqz+sqNggpR2nO
X-Gm-Gg: AYBFou2W/mH6v88ZjkM2D99LIuO/Tm3XeJDGPP57pzwXsHdUsc3u0PVzRFHRsp+FUhs
	eu7YN/hOhihANNfGmPhXXr91BfbywmEy9rp7zwnB1EaUXA5r6BCjtESJ3RU86CcjsZOel/9JrF6
	UPIzfv47lnaJ5fpx2QnZRiklZqyBYcXpFz/T8pzp6Fy7TRQI1uBs17cq7iaBfdKuuGuZ7JQ667m
	KaL/uRSVTrNn+f5FTm4f7PJwCFoYzIcT9TR1PoRHn5HIN98cATrxkrM0/SP5QDHBh/0PDhhQqHU
	YGYON/cPoqSSzmy9PYVQsTIH9SjZ9E5a+57CNTYH8BqAHenVY1fIakAXvFS8TJD+iYzFJvD9DfF
	dhs/3SFWUCvj4ln8MdOL/5nGCgMYFtUf8ttFnO0YxClIZhp/yPZyzzvaBfaUchMBTBbGP3uS294
	7vaCrJVqdxpAwO6o3KqOJtkcrvea9RPoqczSxwtEoY1TbI9K3joZIkbXjJez1OWhP8a9D4eQDal
	Q==
X-Received: by 2002:a17:90b:54d0:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39907ab0ec5mr16512440a91.3.1788286665840;
        Tue, 01 Sep 2026 11:17:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae380d726sm783720a91.9.2026.09.01.11.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:17:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 11:17:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-pm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: tmp102: Fix up TMP103 bindings
Message-ID: <0a4ed80d-a5c0-4b5b-b41d-76c37adb99bd@roeck-us.net>
References: <20260901174847.97261-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901174847.97261-1-marex@nabladev.com>

On Tue, Sep 01, 2026 at 07:47:54PM +0200, Marek Vasut wrote:
> The TMP102 and TMP110 are backward compatible, therefore the valid
> compatible strings are "ti,tmp110", "ti,tmp102" and "ti,tmp102" .
> 
> The TMP103 is not backward compatible with TMP102, but it does share a
> schema now, therefore the only valid compatible string for the TMP103
> should be "ti,tmp103" .
> 
> Make exactly those three compatible strings valid and everything else
> rejected.
> 
> Fixes: d67ec24d3f07 ("dt-bindings: hwmon: tmp102: move ti,tmp103 out of trivial-devices.yaml")
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied (I'll squash it with d67ec24d3f07).

Thanks,
Guenter
