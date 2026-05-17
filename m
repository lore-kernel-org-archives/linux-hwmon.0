Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E22D30C154;
	Sun, 17 May 2026 19:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779046087; cv=none; b=VNXYD4Uoyddt5Vt6558pzGOQ+KkzJEppoPv6Kpmi4xN3QXZm3zSWPSbosmi+MRvg5x1zJ0eDe9l6JvngM7Sz/aPxu4HlZWDtH3xQM3eWTxC7zjmZ5ujOELzPcsEcpv0JiJIYCspieRW0rZkzAASRzbeK3y1l2T8BqjRvLpophCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779046087; c=relaxed/simple;
	bh=ruFR9MHhnuuFkzPtLCX9x9rW6+rzdFYGK7+Wv4lvnug=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=U0/eBRAuP6n15MaAXAKYu0YzyRgxqNu0Q3a5dwAQ1XSvT/35Q3EwUEq/cj9VTUBYzaKSHo+H+hFs/Q7ExJg1+18ElkZcK1eATurO4/32EE0LI9LT1cdayZPFGW1WzOEUFI+t3vhmmsP7xCtcy37NBu4VLUm+833+R0uvij+1kUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgXxAAoj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgXxAAoj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04679C2BCB0;
	Sun, 17 May 2026 19:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779046087;
	bh=ruFR9MHhnuuFkzPtLCX9x9rW6+rzdFYGK7+Wv4lvnug=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PgXxAAojwSssm11qfpkAxrGK4f754DZubPIcYGN7+j1KSEXofEJZ5U26mOaqEIhix
	 sKtpDHT+PfKn6GWQPPlE7gCiMh3Xs6hZwq3K5gzF50Rzfc33owyAbGWO53mMteTj3i
	 vRy1PCixn/z/mwoH3/wM8nY0+DnwQXnQOOem+ZVkutJRsHQPBfb6QvIsnNVD8NKsai
	 YIq4Zbd/5pCeKEPOhy5qqUtf6XJJrrEFCjL8f3xPS/Y1udAXxoZWrSF+Bg1pv+QAWk
	 LUQAaw+6U9R26pZaJERXCoFThEtjA9Op7PTFoPRzLNVOHn4CGUHLSzPbtM8Fo6z5oY
	 2X9rBkeByvG4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56AAA3930B89;
	Sun, 17 May 2026 19:28:20 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v7.1-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260516224338.1750738-1-linux@roeck-us.net>
References: <20260516224338.1750738-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260516224338.1750738-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.1-rc4
X-PR-Tracked-Commit-Id: 873e919e3101063a7a75989510ccfc125a4391cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1405a07192a3c5420c5fd7437f7945ebe1e71ad7
Message-Id: <177904609891.673362.10827758563321387302.pr-tracker-bot@kernel.org>
Date: Sun, 17 May 2026 19:28:18 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 16 May 2026 15:43:38 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.1-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1405a07192a3c5420c5fd7437f7945ebe1e71ad7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
