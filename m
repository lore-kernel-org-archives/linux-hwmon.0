Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7203938E8BD
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470290; cv=none; b=lIkXdM8jom0YrxgFGnhOWhHG+EL2GRNTbGRc+v2VKYQ+EXpexI3HYk/4pQQ+sBgPuZe14jT/XRjMDJFAWVgLhLk0hCItWeVbJa/mg7Im7zdNtFk9Lk2lYp1j8dI4Rfz/bAyuQ2YQBc5P/POmiwpbiEK+Q/GH/2or/IK2gQclDq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470290; c=relaxed/simple;
	bh=YqBMvUvYZhQ3NPOJguFmztV4GF1KKUJx+moNpJ5Deoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neZmZQK0nLUq+7eVnj3hijM3oz8fwrwuVpG4FRlDn5bfmLXXRTgUHQ0dvSicE950OwqSqFB88/ESToe3c7UPYORbgt4dmnGBeoyQGay3uZGXGN7dNOOgPBv17vmUfOb8Eb6HaSLmwt9fXStSANB0o4QTxC5EzaS1thRB3OP+uyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZ7rfbl1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZ7rfbl1"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so52481975ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470289; x=1785075089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ER7MU1Xm3uk4NJiQYLOny67TNxmcxCnLBrGW/DksReo=;
        b=KZ7rfbl1seCthBxFfbWpGesQHtR4wHLmUdbhnB+Nlfc7T9OVejEUho3Qh+quWzQw6x
         byVzdITlGkKrPPU2LQTKBlpA+05aI3+N2l2ntxCJkJbgUeLKzDy/ZjgS37M3GzvqsBNC
         ESAbIXfn9KpB8N+GiyOoGriO4xaEEUkY3+FVJ2BfTeFXcq3uJHGWKeMhhn/07HIirj8/
         xFF8Kevz+Wu8tyESn7n1O/p352fOg4QLr33mnHMi6kwjiKr4P44GVzTMiJPKx9gWOghf
         VbB9SvxgUk+pJkxWxgCBMgCbshd3nUOKQOwgd4kvG9Fj4Pp0At9TBzCCTcZhe2315neI
         DsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470289; x=1785075089;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ER7MU1Xm3uk4NJiQYLOny67TNxmcxCnLBrGW/DksReo=;
        b=NxAxKRZfSnP2GT0+u/XsKHjrRRG6bXAaAbcLt1wNOC6ZGOcwjifrDEEvz7mqeLyhZf
         OQ4x4Vu+vcxJwrJzQuTw/ghUKD8cOv0LIHcIOehSeNhye7E6HuydI20jlF6ewGxFT6yJ
         vHGXZMsBe1u9kReS+lPzOPBL4MkLEkXnNW3t75cCE3SD9qYjxctn4zurkSWBRaUV+4Tj
         mAyNpDDxwOBkvwourAuUkqzc4yQiFN1d9nVF58cMfevje/7H+6/Qpr7OYvZ2+7AlICY4
         x956qzc/+OdTp8J+NWJ+csGK0w7hV5RDvlz9FIsD+5Te1UXVN5ZQJJ6vMQlvUmUf+UOE
         AyDQ==
X-Gm-Message-State: AOJu0Yx3fH1JqysStHic0qsRbmbPvUoAs9Aq79Eq8zKIYhBc2MPK1Ncn
	VakLJOTw8CAV6iwsv5X1JbeC9RGs8M1xVcLiNVWfThGiVqnTzaacIexCNdXB1w==
X-Gm-Gg: AfdE7cm0gtov2eCI8hhpEkHRBFCj9rKMH/P6h0PbpgCmWtfmfCi5W6AcraVx0Hjpu5y
	mi2q/ZQ5EwGbF+jFFu5NRyT+m5wpoNYGg0gYsNgMWyW7nUcKc8HDVD7AK2dnveQYCguPyV5dQ7Y
	Jtp7q3HmG+QprL+0+4+GR9CPEFfqiJLKbyHO/+8AHfQ7/IOOVvEZg6KpwH2glKir53TVrX+0KnF
	hZFPSrB1MxU96lkKvhgtXnqMRlPtjdJbNlRBhVtxVLG+pBejULdhV9BKAQdOgbXl+tm9OVhRvBJ
	PeCADYqIwsSOtVmjweHxeN8CwGqy2f8vw5gUtcLkl/R0zxOV1lH7LI9QTpGXHUoTmJ6Ll/wBPej
	/urPHxYpAtDVT9vjQRbGqYOaWiw3DLEXEiS78WXfsgGn06MvoKj1EuElmmaoD1Z4n5PANOmtulp
	FikOfoZU32FKJyi/o=
X-Received: by 2002:a05:6300:228a:b0:3bf:6c07:b2f0 with SMTP id adf61e73a8af0-3c3ad9de8c2mr11439508637.51.1784470288798;
        Sun, 19 Jul 2026 07:11:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519de26a5sm3229342a12.22.2026.07.19.07.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:11:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:11:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: "open list:ASUS EC HARDWARE MONITOR DRIVER" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) fix looping over banks while
 reading from EC
Message-ID: <d314c9b5-ca47-4c17-af15-6ffae1f8a44a@roeck-us.net>
References: <20260711074217.554656-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711074217.554656-1-eugene.shalygin@gmail.com>

On Sat, Jul 11, 2026 at 09:42:07AM +0200, Eugene Shalygin wrote:
> Do not assume there are only bank 0 and bank 1 available, just use '!='
> for bank comparison.
> 
> Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
