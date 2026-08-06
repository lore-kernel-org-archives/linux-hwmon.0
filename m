Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B6B38B157
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 01:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979212; cv=none; b=EtNPpTBzN7zn+zio/2PEoQileEfXdAnvqc0hmoqgwbdOAhVGgY/mmHtVZzt4W4qrVT5B338mwBxip7rdc2SMdIYN2ARv8038GZGJ1av7NCWgi60ipC3E6907ZMddFUVbNFTDgtt+Swyjc+2F6bmzo5BTgDglnmm0vVybdDd7JcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979212; c=relaxed/simple;
	bh=JbSIdz1Hs55nv8CvNDLovF4817NCnAQbvjf8YGcyOWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnTw8P7vn0hgWPocAvZNpk8perZfa+luQDOiuMSSxZx38CwVr2ADAG8xR6jH6/1wYzxJPJ5ZstSjB7cAEu/zG155k09GPrOSZG18zh1qHq50EFAsRb1D0X9oKmf8BjX/prmlAH+WEy0yjyoEXRqdZ3lc48180p0qXn6LcLyKwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERNhPKsM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERNhPKsM"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caea3f742bso23994245ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 18:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785979210; x=1786584010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbSIdz1Hs55nv8CvNDLovF4817NCnAQbvjf8YGcyOWw=;
        b=ERNhPKsM5cbPnWf1n7YOUog8IWSkEA+lRvj3GFrIsvk2geT+nDQwbF21eOe6cbsore
         pybM/AQeseqXp7jZarspP3IETMKDZvLPtYU8ZgULDrEKiPL9tjfuthSmx6qyBnc7N3Bc
         +0QRAj8uQmZ4eWqFcsajqqIJNWJtACj46EHDOe2+gP/981YNz3nIu/jBgKw1rIdaQ0M+
         1hknf1Zz/ArOYOB+Ww8at2eGwalPpXvCz+fQ1qItVniQ/rbqi7EwXX3WJCrsEuObr/sB
         xa7kFJ3XgxshwQ+sDlVUvF5L/ri9ivbgALbBPF+g3J3Pqx4ZTueVPF2xgc1MzgHmVetN
         mMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785979210; x=1786584010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JbSIdz1Hs55nv8CvNDLovF4817NCnAQbvjf8YGcyOWw=;
        b=XvW+pJCRtdlEP9bhlcjzMxRI7hJD1i8HlGsENqeGNcTLPbRL9jbO4QA9AEcncjmNWX
         j6rhLxspKMCZvfGWMWiTvMrASSIPtCcr+xFLj6OUQDATlat8QtUepuKCZ4bKZp9S2tGk
         aKwenjq3sfhzjLFEGBkfLcDtf4kmc/747hdqP2YZ42SE0kbM0Tn7HJdQaxKqrglszj6q
         0mf5VtRhuxx+xl/l7QKO0lsJVevtiWL05dBEvSI1Wq5D1poabF/JB8dyqG5I0tLrE+We
         o2DPufUksLZdNNkhvVBZ0lwGjEZc6AEzEs7/h4d7DiaE4jueo+hkxkGgnCslTyoUDw6h
         TJLg==
X-Forwarded-Encrypted: i=1; AHgh+RoaMtoNPgTKEJziO9pNTovVU/UnvFRn8OcFAfxyG/e3Y33N8GjouLRayHhUoe+fcdE60C9Q5V+VGYcRVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0l3g5K+u2RfmGg1Lz/H98ZuRe4g9ppyrQHA01LeWCPR853RQF
	l6WZKEa2EzD9Cc8Ux5tWnHNglY/qsXOPlzZwHAmnZxe4IFnWYedCxWPq
X-Gm-Gg: AR+sD12F0fvNia1XjcA2lOB9JDh6fc1y+WcFEcA7D6Ro9CBUZg1/WkoH67xx0rOyMr3
	ywwKnL4wPYyk4rNDWpSorfUcX0WvIRUUWuwHxC8GOfMwTyfxJxPjtP0ouuJgGmGpcyciPdpxW3t
	Yb+0WNcDKpRXji1dAHEJNRx0CMqo3ZHWY1PtxRRpfn98pAKHJ6GeIT6Is8crMM773YluiLiElg3
	1HOiGVjp7gPmrm/jVz7aYxvIyGkz9KpK9G/gB7MZj9pEhjjH9BYTxvSxDegb4DVFPqioMDP9k1x
	IcdO+o7A/yQj09tFR2PdMO6Rs47a5jqMethVcmgXLmHCajLc7y9bHJJdmCy21ITiTGdZjxKmy/W
	7kLzISsqndfCp+jnopbYZYTjWDD+uw/aEvD4MOvyxe+WS3Rh/i1+EIQkvjIYXQ/ALsWcpE0lOQU
	Epz2JMooe1IPJbr2RKaAU17a0Y5cVsCobHr03uvAhqg45s5PMqeU6S5pMez7/ohRlZTCnnlsPFp
	wSV/bbLI9AG5a8OYn1rA8j45kvJSE7zA9ScPqGlI2xzkVsgGIJHnQHqyzk4
X-Received: by 2002:a17:903:1a10:b0:2cc:f5b8:4c2e with SMTP id d9443c01a7336-2d0ca767b88mr146173255ad.9.1785979210494;
        Wed, 05 Aug 2026 18:20:10 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa0268b3sm22350915ad.37.2026.08.05.18.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 18:20:09 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: linux@roeck-us.net
Cc: lee@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	patches@opensource.cirrus.com,
	sre@kernel.org
Subject: Re: [PATCH] mfd: wm8350: propagate ADC read timeout instead of returning 0
Date: Wed,  5 Aug 2026 19:19:50 -0600
Message-ID: <20260806011950.27428-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <04a58bd8-df9e-4c66-ae19-8473d6ab9c41@roeck-us.net>
References: <04a58bd8-df9e-4c66-ae19-8473d6ab9c41@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 8/5/26, Guenter Roeck wrote:
> I am not sure if this warrants fixing in a 17+ year old driver,
> unless it is observed to be a real problem. It appears to me that the
> error handling was likely not implemented on purpose.
>
> On top of that, as is seen a lot lately, this fixes a rare issue
> that is likely never going to be seen in the real world while not
> addressing the many real problems in the driver (as reported by Sashiko).

That's fair, sure. The automated review also caught a real regression
in this patch itself: reusing `ret` for the voltage value in the
power_supply get_property callbacks means a successful read returns
a nonzero value instead of 0, which breaks the normal
if (power_supply_get_property(...)) error-checking convention for
callers which is on my end.. I'll drop this patch rather than resubmit a v2 for an issue
you've said isn't worth fixing here.

Thanks,
ivy
