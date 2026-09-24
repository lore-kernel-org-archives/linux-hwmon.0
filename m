Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24D941F37F
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 23:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790292261; cv=none; b=VJLUgE/BRbk/cxQSVHvf7mcd/6aiP2MbDm5KDbKBAQZgdfCuxzkGgGMIDIIq/7Xgb0xdhUNzAvaJKvfbyUq1mafESXJr3LDHPZdbQt8WcVzAH1nU1Lc74HiOXp3uGQ352uaJq0ccGs9fnQMOwj+a6bCqCF0TXiabI/dUlO5K6DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790292261; c=relaxed/simple;
	bh=ANWbgstbKgAnuoPyayvM9wa2364fXfZxo85nyhIjrUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdQWFuOuZ2519M0eTNJtjluJndvHeE9nFI9O21uhcGiib8G6ITozR/Np0EruJGhcJFzT1R3mg7ym3/iwvAwAPxGwhpDSlEnSzCNOb64ai60p0SupUwrpJIv/7dedZ+0FBVtbP5IdGnEjZcV4NRTUqqjnUEhvzmEz9rQoCbEVkRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSYkqYc0; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSYkqYc0"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0b6200eb0so194811a91.2
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 16:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790292259; x=1790897059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gLPcQvE2dfwkDZEgsOlXfyVstlU3w3zVvbEySQw3EHk=;
        b=nSYkqYc0mM990bxq/cixK0rAoB5xPPgPRavZoNjMnxCRi+PI3auOs3sSuIqGX6m1pr
         8zMwyILbxRkibS3csuHIE1JrvSy2AGovkNiVd4QIMuJkdh8HW+A9UIUAv0RMovSJWsx1
         ouA0wj0LblSkBa/8s7NxuiIkKFCW2QsQ1NabKqoFYcb2iMQ4kFbJhHPw1Bz9TuYozAeN
         b5kGdXEfs2RW7JlClqEAI7SSppU5dURhFDRvHuEHbppry2QOEvu0xWuQoajvcoeDg7PC
         AHCaqfZj/X+yMY0Q7NmYTH91vW0Qp2iW08b+zgCsceQ32LJxkCRySxZpi22jkUWzSv6j
         i3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790292259; x=1790897059;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLPcQvE2dfwkDZEgsOlXfyVstlU3w3zVvbEySQw3EHk=;
        b=0I+IVwHnfgOnFumxPAWbO3nsmPw870RN0oOK92OeiLp1OkYjcn2Hm93HpB9yIzDfCt
         ZiRK0rrSQuuhtceGBiXE2QMMWw3IYYVyn4xNnWKUVI5b8WaLXwqOXHRqhYhUPdWM2XGV
         m09b2LmbZlfriQJVeBaGDvfCWTJcPAPDomTfGYgzJx6Xrn/E8pO/Q6iYTsPPjg2ulyGY
         brR2wqAAIZBHEGI+N2N4KHYJ7t1LPwEhIgApSt2+V94FPKRxGtVirw7BKwc1RWtP/HRB
         AFIry8EL5ay1ljSOkBeVjyKVHYJVTdXBFKAxaofHgQudJGNEK3MHOvRg58zfDhyTnOnG
         sZcQ==
X-Gm-Message-State: AFuF++n4nxWOsQB5DrG+5fppVU9QpM2X/jXTSPUVNtx/wbxyQBrv2xDi
	nCeMJGrlzz5XPH/Dc7zJX2JJRdVyMkjrjhdWuUTpfJ4bSrqsUEaHgUHZ
X-Gm-Gg: AYBFou1BzQuQwqKOcCqq0JHynI3kCADBpL7Yb0ix+AF+08cM7F5s42lQ4MmaXY0mxsJ
	hhXn1Nz5aFqsuYlGtZ7hDBuzwKiWNYGVE+fZBwZqOGt5wY+EdGRVRdYITCW6C9JUCm4z2W0isdp
	7Ga+SyuMZRItJ4ueSE0CEJiiCRcOmQdbVr1pg8fN60r3SauScDs1RoN0QtT5lYESGgY30dKoS/7
	/HvnCtSTU0LtAFk8ttSErMX5NBmmAAlAMf+RrFOgpEIrFNnEtjg2gDQL79fkW5Sc82dcVPlg+vb
	wDgC0mrOwxbP6b4HZ6Zt5PGVn3UOgTmt9z9e43LgP7mFqmGlPOWh0ngWmlwFDvZtfGIK3VNZ4NN
	vskJLKLG0XHuqRmfd/WdV7QTtuCo41O6+V68Z5J3lSJwdmiOX20aYBFfiSkuimJaM6yu57/orAy
	h5+lD6DgwgG8ZhiNPFEdqkba+W8Ohr+ELOCR92BVcyb+kzwzXLph3U9LgpQjjaKNJuB+187mIIQ
	wTohQZU7vMDQYGDsDxyL9Y=
X-Received: by 2002:a17:90b:4a01:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-3a0bb552fdemr350944a91.14.1790292258956;
        Thu, 24 Sep 2026 16:24:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b2235811sm1694959a91.7.2026.09.24.16.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:24:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 16:24:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ridham Khurana <khurana.ridham222@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christian Lamparter <chunkeey@googlemail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
Message-ID: <0f077b82-5e81-4c43-8008-8baa3f6df9ed@roeck-us.net>
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924205326.1739229-1-khurana.ridham222@gmail.com>

On Thu, Sep 24, 2026 at 08:53:23PM +0000, Ridham Khurana wrote:
> temp1_input_show() drops the low bits of the temperature register by
> dividing the raw value (raw / 32 on the LM70). These bits are not part
> of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
> return some of them as 1, and the TMP125 fills them with copies of the
> temperature LSB. Division rounds toward zero, so a negative temperature
> with any of these bits set is reported one LSB too high.
> 
> For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
> driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
> the driver reports as -24750.
> 
> Use an arithmetic right shift instead, which drops the low bits and
> rounds down. tmp421 had a similar problem with negative values, fixed
> by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
> values").

Please stop providing those "had a similar problem" messages (or tell your
AI to do it). This is irrelevant for this fix.

> 
> Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
> Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
> Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>

Applied.

Thanks,
Guenter
