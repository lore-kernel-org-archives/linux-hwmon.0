Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA372EA151;
	Sat,  9 May 2026 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778341273; cv=none; b=TmF0fvYBEHs0yixTiid1JsKA/cI5HzIAL7DfoPii1q9Li11LeI2Bb/c+etNPKXQiL6wKarUABvc/pZobKTo64mksDpbRDKcYpQ26NpwPbwWEIpbH11z7LQ0UhTD+XVvsQLdjaUEwpUW6dA+W+XwI4SMyf/kKobE0GLk+/qrgF1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778341273; c=relaxed/simple;
	bh=gj2bUYzpmljT6npKjlpPlu1YknJpdQaidXcdjsIjTWk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=RSbZyBzOeQpH4YifsELtyfAtrWCXTqhMFSY8qywhzW14StFM3hqMwkMZgu7PzaehlkJ1wfBct23LQkhp6QRp9DMklZnM3mVvcpuyO1HIB++ACRqZno+qsoONqSpbbLzQOXqdlTb97eZ9tHfRDidA7ZeqlLo3YmrD04seD9G3gGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6Sev1uf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6Sev1uf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B83C4AF09;
	Sat,  9 May 2026 15:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778341273;
	bh=gj2bUYzpmljT6npKjlpPlu1YknJpdQaidXcdjsIjTWk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=T6Sev1ufaeN1tea6m/o9wfyL5C3GGA3BMqeGfnJc7PNOTE0Xw+or8TneHAdDq++du
	 nSphVjn+aN/cwabU99ITj2ZEk0n2KP708YgH3LnQpIkcXRiQjIit8dJhXLlBX/hxTI
	 eu/mdWbRDu2K/P0k7d7A1POtpqGnB+3Bby1wEVSFlU0qJppFNbF8kLRIQiUjKlNBvO
	 EMMyKpDzv9dVXKvFU1Vm0QJGUMyUTSrSbVxJFqxRpVdIvsCdf19mkfeN4Gr/hCU+mq
	 DPe251r7KnLlABQ+/2hrnbPWCCDBQBE51VpB/v72LtnXLvVkL5ET2dUy0rGu2w6rlg
	 yZZAhx8e7y2Sg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 429DC3811A55;
	Sat,  9 May 2026 15:40:22 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v7.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260509142855.1456995-1-linux@roeck-us.net>
References: <20260509142855.1456995-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260509142855.1456995-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.1-rc3
X-PR-Tracked-Commit-Id: 99076a17a112ac43cbd37f6883898ae649166303
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec89572766744e844df24c27d31c97b4c00f4e07
Message-Id: <177834122121.1109995.4394799295821407573.pr-tracker-bot@kernel.org>
Date: Sat, 09 May 2026 15:40:21 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Sat,  9 May 2026 07:28:55 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.1-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ec89572766744e844df24c27d31c97b4c00f4e07

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
