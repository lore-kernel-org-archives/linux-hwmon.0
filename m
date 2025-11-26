Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9263131D364
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 17:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176704; cv=none; b=Pn5jkXjiFYf01BIOeiveCvBh/uq5iZBPLtey/oW75058dDwuzzs1Tnk33ns2HWI5g5HAR1KsJSkqskISOAHXD2Id/96GqgnaWkzDol6kb++KcO0pKdyEF8a3mVlz/9wHXiktW9avpyxgMMH6R6O75gWHdGdWdCz7Eao+2uHjgQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176704; c=relaxed/simple;
	bh=6BrcYEwotbBTIBpyoVs9BumKrnAM9ncrnViqA2gL2Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvLglYi2YPLJDt5L+4odQD++3I2JcbxaddO/uAZy/aeQl+ejJC+klJWaUaOeSH1Sh27bL2BuDGfNDY8yPFxitjkxjraTNksMp2Ifi26GUOz5+5KEqCIw4gGzubOpHzHPWEj2JEUr4oTM2mBAXsZXbxdkIO9Bn/7G9s0KV1d0Mkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIn+Zlj4; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIn+Zlj4"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-11beb0a7bd6so1223920c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 09:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764176702; x=1764781502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/Qzihu5Nx11LiuqzLb4w5zDya9OGA3ToMWpM/oj+tY=;
        b=IIn+Zlj4Rjqke7D4OMrF0Oc1fgfPAmgPlv8oEMxtGyKd+XC7YjbztFdymL2Qg2dYp/
         6pY0T708ZzZISHl2F2UbqnygnpBg6imlnnZ/Vn8TKBT1Bts3q2ovdXwB/i8Mgq77exr3
         thQJv3u2gYgKUU8zFXoARgjfhpwh4Xa1lfIWjDNQpGuRYXnCBbBwl0QJligjxHRopSKE
         bNGnw4oc6TJD6CsAx5VRe87GJJTpAk1jE+4x3B7qrivEqGwXqA6BaMnCVrKIlWIH/EKy
         6gKOgL2gwidQ71qdhOsaWIz0zXCBTcTelKCvM5qRMgTl3mvm0UTB6uW1MHCctE3zFE4e
         fThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176702; x=1764781502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I/Qzihu5Nx11LiuqzLb4w5zDya9OGA3ToMWpM/oj+tY=;
        b=Cn9UwAH41VWkqlGBI6hLs6aljIzNp2Im8sMtYNjFWTDWlIUEBuIBGX8COPlDv0spwj
         iqPltm4/RPnheq18/fEjHpk1UUBpBtuRmzQX65ZsFlA3pFFiw5DehvNYwbSqM/WS27e2
         Fu4hXdHxH1M0hmVR9mXGg8xfZ8qQO0RyySyUcEl9ITWWgtWNQFaXDi3NVx1u6mGftJYE
         bKnUEIk3UjjRqEpZ3UbxDVvnRZHbNmak3sTA5GMuu2gFr/pWxhtYdT4kjz1+Lr9I8YMl
         GYhw6m+SEn+7+1rsiaRjR6aLhZUk/QRml0W73W/4eihyKHB3Mxiln5nd4sr2nwBkYEl7
         Cp0A==
X-Forwarded-Encrypted: i=1; AJvYcCUAtCEHctjQyGKCSGVyPH83QXrMvfSv1gQPEAegDmpqYIzqiQk9BrC9PL2Hdw7NvEr1rh5PtSvGqyphEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwKWPsmFyH0Az5e4T3zdrqy/SrkPbHe0rW7+qFvSY1HA2QPHo4
	DzHSdyBRkjz3XzT/Ps9MTPIC8yNSFHlS/74SPeeF9Ilg0CNctO2Y3bhahkcnVQ==
X-Gm-Gg: ASbGncsZkj+TeQvc26b5MjckSuJp5N76hjRIE+CmEUhUmxVo/lGbCh3IgthbKS8etD5
	ChnwmS7oRPUVe4rNsbiqns4bh7f6fBkiRk8UbTtaP42iMmv1+ipKVtsvl1hYELL+qBvRKpdl+7/
	wS1NJQW7hg02Xw0OxmAcGKM967naj3GUOFP0qe9V1iBpuGvJIqgXG/TIM9rswAnSMHko1WZUATo
	qw+ddPeaXFbKh6CgTBQFzZeNp9xPAEuGKSwNmv4CdkAY1cDCF0PN5ixPvVlo/P5AU/T80Vh4EZX
	n6e7NyNnNInbjlP+vy3ujaNEc7IF707grtvHpCejfyrORcjo9xiXSNdo6YYjFI8E1JkOc5Cn0Ud
	cfQyNMDoWWsdwBedNJs5bYCbkyIastAobnQx+tepj+/AIvxmp7XJ4ufuV+aKX4cjEG59Xy3hrVB
	OTJmQhqWUjiVHM8TRDW+bTA+M1wn3gn4YqIw==
X-Google-Smtp-Source: AGHT+IFeB46uwWevevODtos0y3iiYHxPnOt+2xhzrgsruQBUUbuFbzYv1KEoqrXKhKyNomSAA6CKIg==
X-Received: by 2002:a05:7022:ef01:b0:119:e569:f873 with SMTP id a92af1059eb24-11c9caae7c9mr13387855c88.16.1764176701435;
        Wed, 26 Nov 2025 09:05:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93db556csm96612852c88.1.2025.11.26.09.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:05:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 26 Nov 2025 09:05:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 3/5] hwmon/w83781d: Drop REALLY_SLOW_IO setting
Message-ID: <1b94c998-2a51-4e27-80a7-7a1906b648cb@roeck-us.net>
References: <20251126162018.5676-1-jgross@suse.com>
 <20251126162018.5676-4-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126162018.5676-4-jgross@suse.com>

On Wed, Nov 26, 2025 at 05:20:16PM +0100, Juergen Gross wrote:
> In w83781d_isa_found() there is REALLY_SLOW_IO defined around some port
> accesses, probably in order to wait between multiple accesses.
> 
> Unfortunately this isn't making any difference compared to not having
> this define since more than a decade, as REALLY_SLOW_IO needs to be
> defined while "#include <asm/io.h>" is called to have an effect.
> 
> As there seem not to be any outstanding issues in spite of this having
> no effect, just drop the "#define" and add a remark to the related
> comment.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Applied.

Thanks,
Guenter
