Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9162345CDA
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 04:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786596716; cv=none; b=tXUtTW72VcON8crVLGpiR3kRS48qV1HtFliWZgjk1fOb4pP5j81J8X0IEcTVpCuC2MMwI6N5m/7BcVXVGRxugja5TVM9C4JQmYBJY6m8wAaqzLrVCWm/sF1Ew2yNQv4TppJ4RaF3o2u7U9oeZmYTq4dFVwhjI1eXl5mwcYxLKAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786596716; c=relaxed/simple;
	bh=uKUK1gxkl6uJbUz0Xhrvk0SBk14n4u6sepfNf6fVdGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQJv4aNQUKcJBmdK0seaOeEmmOzMq/zJn7loOXgWw60ugzAaJe3VNgiTP7sdWGv0v8RSyK6fxvAhlzJ6KuZjcgBkklhcFb/+BHRfqIOM0VCimfFgIgTFp0B9p4n1IwQbGW4pX5QFDgdkszZnWm0GSQwu3Rv0OjUnDvS2Fk0J8Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vh00akK1; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vh00akK1"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e7109321dso1502106a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 21:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786596714; x=1787201514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DduBe0z2YUFzR/A1UM6Cy/sXyURXYl8CxNoLveWxT18=;
        b=Vh00akK1wJZ3CSobH0Y9i7BOeiapUGxskHBv8dyUYPfJIfNjDnCGqWSxPSZsyf3pBn
         YDp+kBXjLU0DUh9KnOZhbrfaCCndSFOCPMsYJh5HlUBgk0nK0CAXikQKQ9a10r5RF/ro
         l6QY28bjh8XHBHFUgXGq2FUK5tOdKMmnmKIRG0q3fNpguSBTkKfUewaEBDVeJ/h61/Xp
         TZOkflv6Q+j198kuNue9wC4uYreKdgxHLudDiR78MqDWpxvu2qpsnIJdY72gcsJJbhHg
         XpobhJGoB5MHrFgTEB8Kn/Dz6UVv22AQIjqho5iG2G8+Mwg7+DKEDeC0e4bdQx85Nxlq
         p/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786596714; x=1787201514;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DduBe0z2YUFzR/A1UM6Cy/sXyURXYl8CxNoLveWxT18=;
        b=Oj4yzEKAQwR9J65obH/WmqfXQu1L9YYNwuF9p4GvBlOeyS6jlHY2QKHfG1BzWIQTgF
         FdN6pq2KRwxn3qm0BNfPyp7O2OAUR1kW+5nzy3Yps7zcXkpZZMtrdcBahV+c5KFTTwNi
         KOVfqtQbbJSP0SlzSlciyghFKWg3+uVl++1+yCqiJnQIdfGqP8k9kbN3PZUY3A8tuJDm
         Z7hAZrIwhrmD6wj6psd+fumAPUqYqm97Ei+T0pIgInRmgFVAHtRwJ0H6tVKHh07YAA9v
         1amyC78qkOD+f9GsQUJ+4Nzi8QmU5YA/ot7ggKteHLX6IbM7PR9CHBPgraDxynp8QFUq
         a3Og==
X-Gm-Message-State: AOJu0YyXQ+484kS/fGqWMvXl8lIDl9VQCi+t7Lg6Qbv4xZ2vQrX3acKK
	mNEu3BOMRFRGSyaCebO9aXIJYWgQqsfDxUkgbzdaS9jw4ZdEtOFchhDi
X-Gm-Gg: AR+sD13os8ECc8P9YB4XlamAePsskbkQIwuyOPQFDIhf65bMJD7XQOtX6wpgh1isQ4n
	cLz8Kh49u/lekC/5KYI0Woa8ejJFQsqrTsLgppOMEWgPqAf9YVkhK7Qvgyyzx1vfyF/Ra1vjWps
	l89IRJFUMWTkWXELScBYDx2ys1Sz4meifwwPr560uwQ8ClNbX3YSfz6mGbZfweY3fHRAHYegeo9
	wqgNHH6xlsRvDaPWtpKsneqSv76blDGF9kL0QS//AwjMTl3DGwa+pgZ+EzHfuPVYp80gWSGti10
	GBvFJqrnJu4QetziXfJu+JxAlVbgqwFkhGruzDJ2jNGLBZoBu1P+Zm7gPHMiWnNf7oVN81WS+ps
	TlGYB9/T8NF58EoicELLgfY2vbfbKRPBYJb72DBX9L0+4NkdYt9TwMWFT+JvGtsQmMBT+shrP9O
	19oudR3eluGB6xrbqeXtUTbwSVA4iWbzAIQSisRdFAXxAEEl9gpJfslQm+4iclnkIu2Bd7uvhIs
	g==
X-Received: by 2002:a17:90b:35c4:b0:38e:6dd:a9ad with SMTP id 98e67ed59e1d1-3931de34a43mr4190232a91.0.1786596713959;
        Wed, 12 Aug 2026 21:51:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cefea07sm1803421a91.14.2026.08.12.21.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 21:51:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Aug 2026 21:51:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (tmp102) Add TMP110 device ID
Message-ID: <277a7da4-7201-46f6-98ef-b394f18973d2@roeck-us.net>
References: <20260812191021.65304-1-marex@nabladev.com>
 <20260812191021.65304-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812191021.65304-2-marex@nabladev.com>

On Wed, Aug 12, 2026 at 09:09:45PM +0200, Marek Vasut wrote:
> The TMP110 is register compatible with TMP102, add non-DT I2C device ID.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Applied.

Thanks,
Guenter
