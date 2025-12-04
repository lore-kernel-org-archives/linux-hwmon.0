Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8300E3090C9;
	Thu,  4 Dec 2025 20:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764881081; cv=none; b=CTh4/jpdekPEB/T3xeVggUf6VTgAC0oa0za8SmgU/98s7hEEl/zznDRvVFkKirPbxjx/Kqd1OVMjOaYdEllJc/aw4OXIDB5Sp+CrlQCUoj/c4k2iC8MyUdO+jFxB7PUuYNVskedCeRlW7ezI01HeagzSigUFpPBpTXniEQXsQMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764881081; c=relaxed/simple;
	bh=qbIohXKS51PqC9OPKxDmF3aYzitgpSVcUEfTdREvOUE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SIu9s7LBCNcCO+oD6w84TkGn21wD6y2mI2ohD8PAk7m9bcS9tnOvqvXWXhzrlzSno3yJBZiXRKzxQ4qY8DpjJZzZrKTTQ+tA7g8TIwRlpPTXs5RlkbwPbsIk66QfM9pWGs7dZcSVgargoOocbosoSt9BRDqiur6GoSw1txoQty0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQhWn5H7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQhWn5H7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526E3C113D0;
	Thu,  4 Dec 2025 20:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764881081;
	bh=qbIohXKS51PqC9OPKxDmF3aYzitgpSVcUEfTdREvOUE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZQhWn5H7WpEt4klY2wW4PxQ8FAZYuOZf7hhVjIFxtbmeeyFSsYBpnr8l+snqQjXYq
	 7YxACi4o3ktNxqWVp+H3qeWCwhDD5FQSkmFxsKkF/ojiU7D/hUENpwSyEDht+sdc2A
	 J6pIdbYOnWREapTN6r8Mgrc62lIuux9rDntSMFuZ7yTAIZ3hWuniZFOgHAOV/KtmuN
	 lDAS8bQ4V8pDNeWov6ZHGGcjMH+NKvuhINP+DDUxb7/iq7j40IeFWVHASXityFm4VI
	 pRJ+ZJhpwDN4IhlAsLjLv+yOoKkXykztxvkHpYHvU4XTAaB4ZEo0Baord9d2wIISP+
	 gmayzzqL3lJAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B59B2380049B;
	Thu,  4 Dec 2025 20:41:40 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updates for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251201200628.2203308-1-linux@roeck-us.net>
References: <20251201200628.2203308-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251201200628.2203308-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.19
X-PR-Tracked-Commit-Id: 30ca0e049f507001c6377e28482a636689351f64
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 02892f90a9851f508e557b3c75e93fc178310d5f
Message-Id: <176488089924.968054.10363194033387087301.pr-tracker-bot@kernel.org>
Date: Thu, 04 Dec 2025 20:41:39 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Mon,  1 Dec 2025 12:06:27 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/02892f90a9851f508e557b3c75e93fc178310d5f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
