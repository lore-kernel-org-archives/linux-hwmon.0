Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE09033ADA3
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322254; cv=none; b=oNGTa5Ag7ovhqN9WVxuJ0ntDO8Lua/vG2IuGka2XMySM997dj427g1XhNGcDdJc3ODWzNVZlyaEy5dRwLYUgV8CRknCF0+9Jk6C77XDGIgunzicqG3LLOYtT4jsRfsCDWmXosfnKvWqo3elzFkKQ8YtlKR94Jw5FopY4dfIQRlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322254; c=relaxed/simple;
	bh=d3ZkeUBmac2rpLVbSRlJ1gTZf+/s/8vrJnAFibaqmi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4L9naBIH04xW+luVku7t3MtlMMzTsvAVG9LNOpFXo6EA51+bC5Y4AYKipxxmfOZ7nbT8t0UF4sZF3EhX1jTHMTRaB8PAxP/LvT0xrA1dhB5hbsPw2dbUq3OXeMk2/+8oisOTie/2gwVCm/n1TKSCoTv1nyNQ2a6jypkSeaOGrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEKvJybs; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEKvJybs"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e507b079dso571956b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 07:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787322252; x=1787927052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i/OWuLQDA7uepMGSJQ93mLb5XbQygrn0gFLyLTACvDc=;
        b=MEKvJybsYca8AxlMb/u14yiDES0YQZRhJ3AXf5xDRYe73bhUDtZEvNxr0I8+Jhyhbt
         ReMIB2enKqgiUQcopE+rUv/nyRLBBpTNYjQNtgb1D/zm8/uqSt3pK3Gz8iri2efrxAuM
         7aOPm7yAhIxw9AUlci2jbgGxCf4I0AKWOmOS4zM/+hElZiqHzvK2A9nsJPjn/uTya7gr
         jM5UbNekqMU+YJWAMN0JrU73loxTS2GdHHqkfXVM70YWimkthLzea7ILGzwCYd+3EpQf
         i2qLkzP5yszUxyBVn2BKZfMHQOrej3mwo8ogxH4S9sqdW9BRLnp1IMIyM+vIUGgfwUCG
         m9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787322252; x=1787927052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/OWuLQDA7uepMGSJQ93mLb5XbQygrn0gFLyLTACvDc=;
        b=G2RkNyaOVRwr/zhKebUYpYYUFvgtSlNO374ofLIepumN0xULGCAFsxQD5nFDmvLr37
         Rlz6pCAwU96rBAHWsurh/pzuCOY8zDKo9yiEDoEl4KcvJ2ExmuKqPjswB8wgdhk0A1mG
         IqjLqIgY7/dSBdonqpo/AWqPOvkrPwrY03V/4eYY04JkAbtIljFQGBY70BZKgnTsP4uK
         O2CQeh9eiZ6QOSgZ+gdXHpcitu8xha6BYIRcxJV02M5c3HS7Zskskz1Xo49YcA8054n1
         s5flKO/g8dhI9nLfB4DVjkXXbsPxefi2V/bLyrZIJoCWh2ozsdq39t0JMyTAQXV3N/UC
         8lIw==
X-Gm-Message-State: AOJu0YwGqKb2oSgkoWvHejyH8Z+hJUy804CxIpXyRdRguuKFpn0c/cTx
	Lehrm9dttosrrMUt8/ykQgbk9ZfmLBQMlhTkUdjB8pMFRQ7nJp/WE7mFjCMtXw==
X-Gm-Gg: AR+sD12oB1LYw8dgrSq8cqGhUBEcExBOopixWVdVukaxXHP/IIXlnr303BZmGVBawtv
	yFi9VPrwISSChfL5LYPquSqNkw9TgiVKJShSRY1vo9Y6BbBquaW8/PqujbOXZMpemw98yMhtA3T
	DslVmHCoeStTKSrKd57qznmYKps8hpPqP097jvsIh6SBAMLNN0wtpPXe+35RUobfbdqwK3yBL+1
	JsG564kPlQYjWEQu3Nr+PLq2biGDAKrIojTei/tSBIXvWbBOF0YeG2efLdUVKueaqfLhLJBrRMY
	64q6i91RtqYE1j3lSR4iasXBMG6Gmcur0lH/1YuRrG30U8Jf4w/hhtTO+1k1DssLzutZyXmuUI5
	/YeIVvbSN2Z9HHJj+6w5Z/q9oX/eLG9oOjshxaoGB8Q8/eoPqUwiXNI+16uSxDfvdLagXaBtW6P
	FbMTaszmSEzui36flbr4k1i0tvTatC3tV86Ovc/Jl9dywKCoCLV8x7O0OcLC1ivOj5Io8677F3l
	PG9y3efcxed
X-Received: by 2002:a05:6a21:6f0e:b0:3b4:6026:6c5d with SMTP id adf61e73a8af0-3cd2fe3c156mr14154072637.5.1787322251807;
        Fri, 21 Aug 2026 07:24:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm47116866eec.26.2026.08.21.07.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:24:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Aug 2026 07:24:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) fix non-kernel-doc comment
Message-ID: <ecc9246e-603b-48ee-90c2-e5834c363c56@roeck-us.net>
References: <20260821115720.2017516-1-hanzhijian1991@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821115720.2017516-1-hanzhijian1991@gmail.com>

On Fri, Aug 21, 2026 at 07:57:20PM +0800, hanzhijian wrote:
> The file description comment starts with "/**" which is reserved for
> kernel-doc comments, triggering a kernel-doc checker warning.  Change
> it to a plain "/*" comment since it does not document any function or
> struct.
> 
> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/yogafan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 48fa5148d..278cb089b 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
>   *
>   * Provides fan speed monitoring for Lenovo Yoga, Legion, and IdeaPad
