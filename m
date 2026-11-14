Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682998;
	b=YZALnXRwsC0K8lJKBmxOB52jaz1RefRtvjoml2D5xUodl5WSHjayK4sJgua+O4nRrQli
	 GZh70jpazNjBo80I+dkl1/KLppOWucXb0H6BAWWL/udVUbUEuEVIDc77DZn53yZSW+43r
	 D0cpRsXcswuNaM79yDmH6ii6PzCEm1OgV0QpXWG4hKhcspnDTmiAKgNQRRN11ZDank8uV
	 xEU7uG+Y9wwcbpiW3tDF4l3Tna0zKKg3msgSPyj4//ViTewmMSQtjm17GCmGXD2bJVnrq
	 EDNpO/4p3cCx9Wj91fMAD7CgRUPxb7mkvJf/hNrNlDJlpObK/nTM03QDM/NKIZYARQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682998;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=qC8u2xcEgpKPqC7YVan+vdhdVjbElknLCGgXvvJ3h4I=;
	b=oFZpUE5KkJnb7XwOVEyYhHu4J4GEYjlMDAevd84l0BAkSnqWZlo0sr6BP0H33+ppV2Qi
	 zPp7S9pQ90tLAI0XO1Ra77XdPLBBapaeWLwqeHBWcbFUfSNhFgDDmexV/1F8AFlEu3hkt
	 eIg93olPdUvDnxllP3mFb8FU7/Jl8P8YjKQvUi9UwIPHGOKNZZwuVllkjiKXjSSPAubDo
	 Edo9tT2OovAae+wWLlgTPI3SuhRUIgL/yaFhRvI6hYDDYtr/R3pGipuip/OqAZLmEJQ9i
	 qIq7pztExZArnjcPJsUapvNXBv6jnajdmeLYl2HwIj9spsOth1MAWTfZEgqjQOMOEAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROxTJPK3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856B7606A329;
	Sat, 14 Nov 2026 19:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROxTJPK3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1376E1F000C4;
	Sat, 14 Nov 2026 19:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794682998;
	bh=qC8u2xcEgpKPqC7YVan+vdhdVjbElknLCGgXvvJ3h4I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ROxTJPK3LMyvT6WSPEkzca2KR/XbJGm2CP9FDmxdlGbVNzeihdqqxaLLYjeNZr34n
	 WjAE7q3Fd9uFQP2kvQaTy3pcPASbqrWY40CjyCSSnVHA6Z7NL4YNNyJhIywgbkYEgD
	 Por1XIwZHSAc2QExEjhj/aLReROKd9A03/PKatBEbRdtKSdt3jBCZdqAt1URhheL17
	 WPDpREqWbtwHspKVh7PZWNuzNScKgJD20Fo1GkUA3MiIXZCDBEYNqdkMS823/hFLu0
	 WvUAZf84wD4+hJA/rkcgsQiLcWAiUuvKv0YvJspVh+6RGhMHIyVH1BCXVdENWGW7Xc
	 Uc0glZlSgWatw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F165D380821F;
	Sat, 14 Nov 2026 19:03:17 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261114064430.2779677-1-linux@roeck-us.net>
References: <20261114064430.2779677-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261114064430.2779677-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc3
X-PR-Tracked-Commit-Id: b5c5b67e02406fb48acf57cf2c30a570230fd6aa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 54975c6523dc77862c25deeb5fa395990b8d3fc4
Message-Id: <179468299642.2342540.9465160150152633879.pr-tracker-bot@kernel.org>
Date: Sat, 14 Nov 2026 19:03:16 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 13 Nov 2026 22:44:29 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/54975c6523dc77862c25deeb5fa395990b8d3fc4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
