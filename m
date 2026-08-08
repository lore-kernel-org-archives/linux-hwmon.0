Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBDE223DE7;
	Sat,  8 Aug 2026 00:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786149844; cv=none; b=g3fJNcqHGLEPQohj2j1Vyw8jmyBUjBMNWEJDqgZ9gdy3ii7n5I/NuYN4D0p/fB0fAHsPuzZdLeepuByA5Hni378e0W4WO/NF/V77PBKoJmhpoTClbcbvlxlB01f2CZbmudqWWIFToHHxblSjpCTFCnyccCTtHF1VOtss1WciQEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786149844; c=relaxed/simple;
	bh=mb0Ch5DMViUxQuTjkB1xfrJpLMi5DmcPcZVlGNFVgwE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AXk8GF9LW0m735FRE6Uti1JXbU2gCnv0/EH59IKIlPYQ7hRl2EPICjLR6ov+kTC9GlEiXFfR2+Ut6UFWKQMvGXCt+20ZMdTrduhpsSQEWQ5jAaGTGvMET6G7fxbNpQ5UHwiRUxaTxuPogHto7yV6laQuQneEVd1x0tal2ITPq5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjRWfGjD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjRWfGjD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318EA1F00A3A;
	Sat,  8 Aug 2026 00:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786149843;
	bh=Rr/YtMw0o0B5ir6bnB7bfrQ0gnBfoUty1jmedv66a3o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=XjRWfGjDYji7mQYIr21CpmcLnQlVI5rJP04ktkN8TFklgt2bsjeHrk50ErJ/mkQPI
	 tiF8sa5ngGQMSraDy6Ph0cdaulrjCCZe92I7uy9iW270F7v2lPOmiRPskUOFvKeShm
	 bhC9PTdehnen31Par/eaZyHyZzBRZev4yYnIeuSOx8dntowdRTWsH7Co2ItN08o8uH
	 JGsTpepqrm8+AMkfcIC0PaTfgh8KW1szrkE21gUdz5Ook2vwCgZjfTxTIS+lJc7Se/
	 m2BG1WyWOVXpZGaoye6eHvggWQb3sgDkR58FpAoQvwsldwBQgku2ibM77gGYXxOqi+
	 OfANwI1mVm82A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B0D380CEF9;
	Sat,  8 Aug 2026 00:43:22 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v7.2-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260808001201.2405051-1-linux@roeck-us.net>
References: <20260808001201.2405051-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260808001201.2405051-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2-rc7
X-PR-Tracked-Commit-Id: c6c4234928d2eb4f61fecb61067e612d9bdbd2ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5d78d199bec44519a7d63c7485d44243498744bf
Message-Id: <178614980143.2480932.15699033306301210985.pr-tracker-bot@kernel.org>
Date: Sat, 08 Aug 2026 00:43:21 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  7 Aug 2026 17:12:01 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5d78d199bec44519a7d63c7485d44243498744bf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
