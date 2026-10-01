Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF08530567B
	for <linux-hwmon@vger.kernel.org>; Thu,  1 Oct 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853924; cv=none; b=hPZwCdaZtGQybBs/9Cs4OUYrKPK1WPHG9h+mY6xoZiNUJ/IWLV3dtwDfx1PLGU4bqZ008nTwe5Bh6pqbUUSrJy24qeuEJ51MOtRvjgajaIo5QWJrqJlVV+9QT/OSe9E5P9pz2/l///z+2hcTHZtXFn9w7dOAo41y0mlbNBd3Kug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853924; c=relaxed/simple;
	bh=vdk16+JiM+pun0h+NLwCZ9YhRB7PrCKjaNjUHkG8fsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7Hyaf+2HgFfLLP1kUrY6F5dEYGgWEfSgWcOxgl9SA94VH0aB07jnLTwuZ6gdpprugtZApalnXmscbjrzqMOdVx3H86YZ5vEPK/X4tsp79dp34uh4a5NhD/Tu9wfGbYXMgY+GcsUspcNcK+cqJ1zC1bgmUS905El1ZWGivureEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOfezKpn; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOfezKpn"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so3338967a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Oct 2026 04:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790853922; x=1791458722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qc8LVRsblFiIidnFYchNDrmFBxE22bEZYeYNxnC3+cw=;
        b=BOfezKpn142TrzJAJ4Jc0lqdbYF90I5pHxF33DF7tW5K52boBgzv0Omwq16oQ5pCB5
         FYg5LX1b7umFC3OI2XbIK5S4/ef0N90w7Q3skvTmByROFW4MiBikxvxOcUT5IzRwuOi6
         584TL8rI0unFru/aLFGRzeG+PO0ytelEmE/kBYA9h5Tkal1BQy4Q30bJ7o3mIdi9XZKc
         a1HQhcUoYVC705cnBamNkxqGs9slRUHbjqsoKzxlOdLf58uPDwpqYw6PpF9flufqOiRi
         ocWpuRPiiQ2ybQ/bnG6WOSZojxKA5SDaMpxk0NPO9EHtxaJegVrAXt7yL0nG5ZaWzB9i
         hbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853922; x=1791458722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qc8LVRsblFiIidnFYchNDrmFBxE22bEZYeYNxnC3+cw=;
        b=LPyBh6bnkaL1vIILdx8sWZQ7zgp+SBoiNRS5+89ny8fofVqpJBFnqK61g5ua92sj1J
         foCqOGLVnRrL64FfgufX82NCQPX9LjOiQ/k6LXE+IYvK/ao4jUbjdugCwPu+CCLbjU0L
         WgqiIvU9soNOMEpbLwNTL1wiLkYWuAnS2uAN98tuvUdUV5Ajq4mP6GhHwOAifM+YUQ19
         Hax80bOm8M97YDpdbn5BtFpsFzbcBHIjZ86f8GvnkUGkGRU+ysuMYaO0QBF0OROYbdfl
         ilY8j1UYsC1Hh0Apao3vNLJyqT+tw4+v1/zp+tMVFQdxaUtC51aaghIjzXYi8tvAUcjP
         bFMg==
X-Forwarded-Encrypted: i=1; AKwUvBzqM4JrNeH0BTL13YTmhDr4e8/CzJJMLHKMKfYh/ngoZr+F2hf5MQsP/0OJupMEG4O+rOagCzQYWOaiTw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJz851H67A0MdkF15mCNto3XELwHH5erF6slU1EGDAx2iqRoSj+
	6StRgqKwgYSyjARZIDsspFI+XgMSGuTPz9sKoV6aoXzNrMBWVrIPz/6a
X-Gm-Gg: AYBFou3dlhXz6E6u/GgbbRov7iGclz/GvcJvjTMSlVcIBit213JvocIZ09iynDTu5H7
	qcP93tljbLgNTsp+At/IjrDvLxsklmeOo1lFZ3Hqi1Hk2yfEIBhd5+/3mJ8YCjUlNYpTtInhAT1
	kD8Xb38hJ+UWEuFBI6FzM7H2UeWpc8BooQpM23Fml9Uf5zKK8ZhWcy9gHOVGbcy9ALSf8NWbJQM
	DWnaKqdV9Fy+yUN+nwzYKymSLVKDpyRLg046h3rA7KY1Ye/zIF1Ul7lVoB8OV7rflbflxze79ju
	o9Ieoq/QtrAuLRniUdPs9MB6oTIIunFnmpS4K/sxKY0MdOvrpVawB2+tnfaqCtrkHbi6XzNsgA2
	LlHFhshXUr+ZayrumdDdI/FKpSWK/AagaX+Cn0NLa1D0plN7RMZtoa/ZZU2yhua0NsLOrzf/Puf
	oEouxlo/vzaiMF3yDck5tMjn1FuEX7eCtCj7vzjr16BB+qiZuiJlypGfl7/PTK3aTjESV7MNnnU
	fX6R8sSMbT52iFvWrcqQ0u0uL68lrQ35FEWvpDkCajRF0JqDQp4j5df2mMlM84kmDD30Wc+t2vC
	tEJsNni3ap07XT05ybst954JyRVmH3G1yvifsw34XRjpsnHiMVJioElsvNY=
X-Received: by 2002:a17:90b:2dc1:b0:3a4:cbc4:4a98 with SMTP id 98e67ed59e1d1-3a4d19143cdmr3582710a91.64.1790853922034;
        Thu, 01 Oct 2026 04:25:22 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300a90dc9sm9326275ad.18.2026.10.01.04.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:25:21 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: name the hwmon-next and watchdog-next branches
Date: Thu,  1 Oct 2026 19:25:18 +0800
Message-ID: <20261001112518.3822560-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <d40a607c-af12-4e56-89e9-de2544b07143@roeck-us.net>
References: <20260928105944.2186541-1-matthias.goergens@gmail.com> <d40a607c-af12-4e56-89e9-de2544b07143@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guenter,

> If you want to be that explicit, shouldn't that also include the fixes branches
> for both subsystems ?

It should, and a T: line can only name one branch, so the patch cannot
describe your trees correctly.  Please drop it.

The motivation was Sashiko, which used to review against the default
branch of the tree in T:.  Since 28 September it skips a default branch
that mainline already contains and uses linux-next instead, which
carries both your -fixes and -next branches.  So the problem the patch
was meant to solve is now handled on the tool's side.

Thanks,
Matthias
