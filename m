Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2672341AAE
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 21:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768253366; cv=none; b=XXAiQy4wnI8apj0W1x/MkNLpNp5iFD3Jkir3w6yX8A7baVrowxOKtc+TOJ1MTsvvMqAwIjJLNuSI34vPLCzsLK0lrEa5bY2ShQ5nVuq4EpFK3QQPk3Jod3/4BhwP36ri6tzW0uZBwjGRjhhIFWHnrWwyn1IFq0AzJRJx2XGayXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768253366; c=relaxed/simple;
	bh=yEiPh96Ylaz27aKOvDrJVbUbaTUGlCOL16OXVdHsfu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3Q3oY8G48AIeEeYnU3PWddvvPmcwSItq7ybJbzAxyS+ipyydc4kP2rNlUfoIG9VRlu380fp3cXi7bDOIbdzJDo9a93N+HfYgtjjfbEszYC5DUPkeyilSFQ9MVTln5F0pY2UC2C5q88ISi4x4gTizMg5IoyqXCFcGh8KTydU0dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmzjcRDr; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmzjcRDr"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-11f3e3f0cacso8629828c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 13:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768253364; x=1768858164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDKRM2Jj8tzQiskK0Iu71mKzxpKe5PXSshmxSSVrvoY=;
        b=TmzjcRDroD19PrM8RshowBjtC4k/vSfcv62MUoS0CyE/InEjwaY5/UxRnXEcIYmRCb
         Xk4+8K+5raRH0fA1kd90tph7VBzH1PVtTNJKsetobMZlPnva6wH+Zn6BW9OKBRND9NGi
         KQjOIWDKuCWf39eU2G0Ner6waDQrkiOYONVJRATFvv8ExyKRn/Y+TXttLgXidPodEGeW
         KF4kvOylgz0a7THHM8DsvGAi6CHSwGz2CSjXtGvdOqOSEiLmhVy813k9ZHACsIaURT+N
         o3DqztAuUmYqG706iwPlApvKDlNfGijt8jrx7hp+3Jvy6iMK94XuzAzt0jga7GM7S2we
         G42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768253364; x=1768858164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KDKRM2Jj8tzQiskK0Iu71mKzxpKe5PXSshmxSSVrvoY=;
        b=pzHJVGntmUF4RsJ3HUibRFNTqdFLzAu1aMrJuKm6Xbax5Zmk4gLRGTQtGlG2BapFKY
         M8eBpgMLxrzjHnL1rwWI2h9y3a6NK2ALF9i784eeDkXCByy9bn767BLLmUyWoHDA5JVy
         2fP4Fhsq0kiQ9Uv7iKPqVzXKGzqyd10b21igGTZQphKgnZgA1KGpz0nxS4q8XFDLnjFF
         qWlgHcX7SvUJnza20Ma6uszzCaSzhc+kO3u5JqkOe9zyjPcB5YHRsg2ZNcv1RFx6I3VD
         R1VdnHBH/szljU9AfIIR1m1WBm0p+Y0jpeXmk3aNB07LHE0WR/JvAlmMEFGv6XXKidZw
         oi+w==
X-Forwarded-Encrypted: i=1; AJvYcCXnBmLwbG7Wr9iuRchW/4vBz4tjfRadmc47pMu2wcyURd76EdPSGcW4opeDD2r19AqfS0iSk3YQE52alg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsfljuTesl4w/ARzzt13IDRTUu4d+2i+QDWruF6hR80X3N/b9Y
	oWCE6JxdCWWOxuSTLyTvzpoOEqz7yJutI6QfEnh3pLRLhGKqoHgYrEll3mOpow==
X-Gm-Gg: AY/fxX5yqCl28ZaSfPI7A8Wgf80KPa2iCV36N93dmg3pwc5f/6TjeYsA2bPKBEdYbXi
	EbSMB5LKWfkHSHNb26bX4fgP8rbxpTWnN8Eysc+FSQSZkDVNxYVLOd7qFRabHhLI2SmdW8jqE9o
	oRGrPKa/HDlVwfw77P+DC69AdjyKCyaotikCXZUTQirRhA6jCS3Cu9ivo5W/gXP77oXNowl+vUh
	d9CLJweTe6gxFR+Bv1r1ZnPvIbq/G3fYbMIziyKd7ciZA3LkGE8v24FuZV1UR70i1/si2XA4134
	9i1+um783GtDFglD/3YAzYPsZUzlGQeWsSOvnVYceIBl9jAdCs6pyE6pw0NLP/fGfJ9aeAQleSS
	bhoC+vUb/e1XpPWq9rLd3/B7iTd6x2pwOkg/1J+i1h58Y0SWLJsMsyMpgf9nCy4L7yOnFbchyzD
	K3MeSczks/aJAM23O8UbsTT28x
X-Google-Smtp-Source: AGHT+IEe2qPn9E71JZ6870MOkW13o09L4U6WZMiRP3FnK/qAfbv5dfHSDbi9fDY4ONJHcb30AS/xog==
X-Received: by 2002:a05:7301:90a:b0:2a4:3593:dde0 with SMTP id 5a478bee46e88-2b17d259764mr12418326eec.13.1768253363986;
        Mon, 12 Jan 2026 13:29:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078dd84sm16226858eec.17.2026.01.12.13.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 13:29:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 13:29:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ban Feng <kcfeng0@nuvoton.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (nct7363) Simplify with scoped for each OF
 child loop
Message-ID: <2e2dea8d-03c2-4295-b151-4680cd7daf07@roeck-us.net>
References: <20251224110702.61746-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224110702.61746-6-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224110702.61746-6-krzysztof.kozlowski@oss.qualcomm.com>

On Wed, Dec 24, 2025 at 12:07:05PM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
