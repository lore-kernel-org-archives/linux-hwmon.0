Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BA71FE46D;
	Tue,  9 Dec 2025 00:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765239322; cv=none; b=lI7aHJ7c5kKxcZoeIVgHdKCdWLF2+2nfhcmMtHbpwFwUNvpA3K6Y1HlJEz8yy/gudbkgIrMfFa5Da12W12NEKskBeu1QrEZy4ljbF4KTEUAkAeJ7uOkXJyB+f7gHjKbIqj46uGvoHAI9LjT2tS1PZ0URzVuW9IlGivF3zrZSDLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765239322; c=relaxed/simple;
	bh=2fWBU0C+h/xPwSd2wzfO+/5y/LW7PrNayVXAQeI5Q4w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=B5OvTPRZqi+9+pfTXaVgp6NAblPN8IpfWGRu6rZd0rLdHtZk+oXyJTW6ukVhAQJHUVW3LChirdz7H96JKEneSe8RRdtek1wegCB+MUacGnY6N2fhla5r00ToS6VbUaXpllZqRyE8TCa9lDO8DMFAf9mqo0mOerYq7CRqCFsmHAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQ24vrXY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQ24vrXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A19C4CEF1;
	Tue,  9 Dec 2025 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765239322;
	bh=2fWBU0C+h/xPwSd2wzfO+/5y/LW7PrNayVXAQeI5Q4w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KQ24vrXYXU130ThK2La0ck9haosqmG39X/0kB3QWSInFkCu2kOHt1k8KOPbHC4QsI
	 jgfMZ7nFwIeB1cMATTRqdlisK8vVkOuW6Bz0Fts8f6lM0jqpqhSPkvyA6TZ8NBvbYV
	 /2R5AKoV+6NWFl2hl3ePy+57kj832UaMZpdM7F9BGkKKAZ8orLmZjM5XhsrY+5SINx
	 B1WtNyzoWD315uDKVPIYRmGwTYTdzxB/JKRA6Etb793ZPQ1yix7CJtRSb9yXrKnP/T
	 bXla+H2z1nUYOBuwX7PONiU0FTCzgMPTg6CAQWP0P/obtFVR11QN8Av8vTX2KOmOfT
	 4p3LCiyxoxoYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2DEF3808200;
	Tue,  9 Dec 2025 00:12:18 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updates for v6.19 (take 2)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251208145655.1868400-1-linux@roeck-us.net>
References: <20251208145655.1868400-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251208145655.1868400-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.19-take-2
X-PR-Tracked-Commit-Id: 08bfcf4ff9d39228150a757803fc02dffce84ab0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b88b2f82fab45521cb32c0b737266d90a66a748f
Message-Id: <176523913747.3343091.5384030246645486248.pr-tracker-bot@kernel.org>
Date: Tue, 09 Dec 2025 00:12:17 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Mon,  8 Dec 2025 06:56:55 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.19-take-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b88b2f82fab45521cb32c0b737266d90a66a748f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
