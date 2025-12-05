Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D549828750A
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Dec 2025 04:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764907628; cv=none; b=WOe1GxXGRSpF5KuOJD97sP3IDGCetsr5x383IFO5Rc2RWk2pThOomk7w51VmfeALiHITZdg1Po6KGS0XWXm50UZGb0yUhcX1jdMjGSlKHETFypdbipCllY6LefAtTO3pLd/TFVtVnhopXPQANQphvsp8AxwE3v6Tf/1xdR+T3/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764907628; c=relaxed/simple;
	bh=uZzRlSYITWySPsnRg2mCXKvqiYVFonwKawBlmcPInro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohEPh9H1/M5MkmT8xh3ssf4W2S8CFHKKJGimTp+XkBekjKf0ELGJmXOzkzgHcutQTqMGOUCG9JVtJrEZklyzrebv3Apw39G1BIDCDAC1+lJSKopeb1YPjohHrCl+ncRAxgwjGmF+pcInE5tNlRsD6JAsHbTUlit8QWOfE3c7hF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OA2lLju7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OA2lLju7"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7ba92341f83so2095311b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Dec 2025 20:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764907626; x=1765512426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/5nLnbLICA56GijMR5y6f075+Sy97q/jLJ3HqMoK4c=;
        b=OA2lLju7L3pT5rta1XoEbHUFoMJJtiJyXQKSlc84WTtuaQtYo63fdTjoF7wt0oXLK7
         mXwP2bY5gDSkzF+Xnkoaks+GE4RhLu9L+8SsyeuOqC7gUnogYH+ESu5KL3isDGsS5jsa
         BbBgOOfrnGLir0Jk3x7rMxKSXKb2Kcd13B6fSKNmjN1cXmu5/P3KQdcw/oy1ezCQOW+Q
         ULzHq5WBx3bCUbvAA+kCen2qIPmy0ydTBody68K3pcf1W++EZfbWaC2/XkXXkr/VYSrh
         dJCluuPARjwarqe9bSeYp/xwu+YuqVV0NC7cYY8LjYFmGPK4rNjhDSrDvf1BPyUGyPId
         fOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764907626; x=1765512426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+/5nLnbLICA56GijMR5y6f075+Sy97q/jLJ3HqMoK4c=;
        b=SuJVTrtI1x25z82wkUq9y2JAYtf4IXwSp8ER102dHnYjmijPe5v00X+atv7I3Ipp16
         mqPyDSgnbkR5XApF8e4OquvI8TNIQvsPcZiTpn49oHx1QqvvwYGs0qsZiaGSp36nHOfH
         aykNGtfCAUgDcMWy91ExO9jLXN6yglgq1Eq8VQZ+mGk5sm8a0jYi9khp9xl2bNfIuDY0
         OmTJ+0pLZlnsoXja4UZ+7d976I0uT62ky1d4F2tNSMf1lZeB+1H0FrGpxFZxzEjXytnW
         KVWefsMZ64jFTP2QiK8JHI6E9CRZF/Hl4vRRXDvFoPFYWjJB6/3JqxIyvqJOo7bvx17b
         1IMQ==
X-Gm-Message-State: AOJu0YyGNzD9JVD9ZQ9X7s20jGRP9KgcosEtaqfEdFS82Bnr1zV5d3/p
	iQeNCvIcWxukC4eivrcMfx0fT8jNbd3XBsGosm5FYtCnW5wJa2nRlVDy
X-Gm-Gg: ASbGncsR98rDIgrKfkoV2YA5EJkitDfCUPNmgZGBNNlDCywgkrkNA5SVVt0Ae9wRygD
	mhivJ25WFpl6xtkMGvIiLirOkAay6rJRr4wFFL2iSNHcVU0q8+3ELYjcuszTpNclCNXEFiDYegA
	Z6ceXjRc+YnyGJu7MQv8QovqGuA/w+APFMB+3pobXeGxcorAMTbBxiS38jIHVD/+m6x+bqBMeOK
	s2E9lCGX969yIN66lwEacLR+HmQRwx7qH1Oi8tTRO1/Xp+dAK5lvxQslwRK4qzWp4XcFHWU+K1I
	poPPwW9duBXtQ8K0mCJPai91rJND+zLW3p+x5wm2uV1Auw0Nxuwjr1nZjt0uzCABk17vyLHVM3b
	OLnrt8phCjMPaXe4ebxDkuXFRSC2bgy8GN36h8LWlQbAc0JQ0DyWrqbaXaJussjbeIxsdlO1zoA
	iNGvAlsXmd/8l9HwONma5kASE=
X-Google-Smtp-Source: AGHT+IHJqzC4m6FT/INShuEwt2jhWtAfioT2svDXf4LE0pAMFL5k/76SSfYenbrRzcEQy0bSt4HPHA==
X-Received: by 2002:a05:6a00:1990:b0:7b9:420:cc0f with SMTP id d2e1a72fcca58-7e227500b2fmr6287170b3a.14.1764907626124;
        Thu, 04 Dec 2025 20:07:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2adc5c355sm3565109b3a.33.2025.12.04.20.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 20:07:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 4 Dec 2025 20:07:04 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH] hwmon: (emc2305): fix double put in
 emc2305_probe_childs_from_dt
Message-ID: <d292b259-f76d-4e43-9d82-72f4f3c39e5e@roeck-us.net>
References: <tencent_CD373F952BE48697C949E39CB5EB77841D06@qq.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_CD373F952BE48697C949E39CB5EB77841D06@qq.com>

On Fri, Dec 05, 2025 at 10:02:41AM +0800, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> ./drivers/hwmon/emc2305.c:597:4-15: ERROR: probable double put
> 
> Device node iterators put the previous value of the index variable, so an
> explicit put causes a double put.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Applied.

Thanks,
Guenter
