Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B563E49F0;
	Tue, 21 Jul 2026 17:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653614; cv=none; b=eDhm5DpAxV/vuxcTylul9YhEcUT0M7yrGIsht4C6IF9vJDkbnvHNcD8xFhg8hahkAtcKtYInjVgnzEgRaGblzCX8q2Fs0iR86p8E3zj3R56/zYWWkywGk0ea/6xeeVSUn2UIyeqoWVD+J8VzrF21rwxKy9hFmgukixCxfLVk8U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653614; c=relaxed/simple;
	bh=h39IbdQWo29o3QJgJ5FIAH/CYrmiTWL8Xaxj/nX3CtY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WjvJuV3ds65Tw+zQrcwGWX2mTIvZfk0D85ZNy7UiAg2CTUNWIcZwq+Z3jkQMbAOV2wFi+VeobeDqtVw0GDYzGD7nErWReB5jhMQRA5ad1U/E0cwnvA5OpZO4Efu3bl7EUdU73emf7ItE2SwcGIbuPUG7ni0Si1WYrkPzSqtoZT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lY0PGifQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lY0PGifQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1981F00A3A;
	Tue, 21 Jul 2026 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784653613;
	bh=8Vq4YtrV08jpw0mHclEzK+3rqvwEDaEMOCI2BNY3yso=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=lY0PGifQUuihJFRKkIADvVkKQpOiYZt9WmbwxIRRYGOC5XtCRRR66LlmzCXDpJhtl
	 4/SzuBFobk8RUSoENsQb76+DDcfQzYUPKmZukpv1Z+9ezWfCWXZFyjpukmwWYgVKar
	 m+k7/Iwetk5ug6Wl514Dbv9ZSu7Hnq+1NZkYX2xK7zP7wjoEHQ1jURnaltTq3CU7yv
	 iyERlWD7t11APQYtuXC4vI1FJiFq9CnXJNamQEvqojVRMD9W6t4r5PAEb6lr4JQ58m
	 mdTPT6He02rCNrFitxTwkEKaJpyPjcraGmLuU+84nTQpz868Gs0pMIaGnPRFJPpzyG
	 W49YyFof64Mnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C2339253C4;
	Tue, 21 Jul 2026 17:06:23 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v7.2-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260721145115.1658672-1-linux@roeck-us.net>
References: <20260721145115.1658672-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260721145115.1658672-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2-rc5
X-PR-Tracked-Commit-Id: 70e76e700fc6c46afb4e17aec099a1ea089b4a22
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 248951ddc14de84de3910f9b13f51491a8cd91df
Message-Id: <178465358237.846420.2601380788246641721.pr-tracker-bot@kernel.org>
Date: Tue, 21 Jul 2026 17:06:22 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 21 Jul 2026 07:51:15 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/248951ddc14de84de3910f9b13f51491a8cd91df

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
