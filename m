Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B872FFDF8;
	Sat, 21 Mar 2026 17:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774115151; cv=none; b=tXWmNc4PtnzRNfM48MC7Fx01/vmPYi9oo33Bhq0Q0+IBU+xdrgFQDpwcND8V4Aq5VKOWUsbCcOI5JBMC3TrGzMdx6Nu8ajtlEfhNGBtt9WGc7bCVi8wIjorQmZoJs0n8wa6b9zLKUX9OnzkncMOs1u0LlwuZu0USlz8KDXk6jTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774115151; c=relaxed/simple;
	bh=ezeyCkVSLtoowd1tIG9KvcdMxqJMUvSZNDMoDp3Jmgw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CHoIw9Ci7wG3/8Jp1rjQzawMb5SCcX5+K2U09TA5tyISG2iAbsu1BHK85/0gex4sZesxsYBu6OIqTlPsPNRtBfz/9enx8E0ML2gZdnoqXgtQFiO8qO3r0fGgk7VR+WKCAQuLqPwvtf7cKAujCj5IiAPJTgfq58p8J3wFyjt6NPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZACY42g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZACY42g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4FEC19421;
	Sat, 21 Mar 2026 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774115151;
	bh=ezeyCkVSLtoowd1tIG9KvcdMxqJMUvSZNDMoDp3Jmgw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iZACY42gPVBdRbA7mlOgpuIrc9zZ3bqH6rBYxFIiotWjQht+5ck0i6iFhA4owW/xf
	 W25dyylXPwW6nf1FuTQd1Rx/wxNh2fu4p8QZE1lFR/KtgbGwToPurpac/pPyzmiZ/F
	 ylhj3Z/ziXjWSx1AKO3QaKhYHXGkgeHObQlmZMgtZzIlECL+V1DnJOgS3mhsl9vPDe
	 elwTcWtcV24xrUDxotsmSxMpMWM0f5aE250COXlGg68h+PTAAR+p2tMc2IG8sTsqgO
	 svhHgaYEpvOmSytFVXEPvvyy972HiL6QGtP9aeMz97XknpS6CptQ8RMQZKv8KauU47
	 ctNWOCUA6uU7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D03A3808200;
	Sat, 21 Mar 2026 17:45:42 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for hwmon-for-v7.0-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260321150037.1451623-1-linux@roeck-us.net>
References: <20260321150037.1451623-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260321150037.1451623-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc5
X-PR-Tracked-Commit-Id: e7bae9a7a5e1251ab414291f4e9304d702bb9221
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 113ae7b4decc6c2d95bdbbe52e615a0137ef7f9f
Message-Id: <177411514122.2921174.14915789037109320779.pr-tracker-bot@kernel.org>
Date: Sat, 21 Mar 2026 17:45:41 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 21 Mar 2026 08:00:37 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/113ae7b4decc6c2d95bdbbe52e615a0137ef7f9f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
