Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795230679;
	b=OvGlaUe7JazbbznICtMLaODbNWO8oUTPyQ/W5fsSP153lB6QoNiYO4u5gGm1W2cJdpQz
	 J+xz4EKQi51awX25XHD5EEBL+mUwmAdRyjAAFBeYIn5mte71DVc21xx5R5tcTCKe7yPk8
	 j5ebWiL6s4I2uy9KoOSpZ5TKAgtWLhWFdeD/67HW6tUzOHiCvQjeS47f5W4XZstJ737cy
	 jmGfqtUrquRxatbMa1JhJyXsSmAeFIua8W6FjEGXmB6CymuuNF++R8SC8gSywf8aoHkN+
	 07DmfGGPtd8M0/mdsPLDJHelertp3C3uPAdkcwJWiP3LsTahjB65KZOx8L9I7S9p1uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795230679;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=FeTqLdiLIzDxQ9/o71sjkRXwJD9uCCzhdD57Bw6P+J8=;
	b=HMH+6yPfQLpp9WrngtvJbkZiH8SJAOTEh6640CVXJCIooj2TLKSRsc3HoK6XNUOLT8XR
	 +TUePbkmP2j9P3vfp7lU7yemsw7xfkBB6Tl5ujvtsKBPqyhUF3fkvE1w0qrQ2MCgJax9P
	 PYN9pMvpaSR9dG4iO2tV3tJt2h6D0bLyCdcnOPm7K7nW6bofyYZrr1j7NpBudB+q7lOM4
	 EUTq9wugO1FS5zHoX6VbaPmHrCpnbqu81MvW8mN6B4hAdIxHXjHRamkKKCv8liM9q8yXF
	 EMmnFA4XAuZA+UhErYxe+ED4arRCrCe3GVV5A6yJq9Kq8Lo8fwyajVUjuhZ7FJ36fIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=owQfWt8K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF13E606A6A0;
	Sat, 21 Nov 2026 03:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=owQfWt8K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD32B1F000C4;
	Sat, 21 Nov 2026 03:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795230679;
	bh=FeTqLdiLIzDxQ9/o71sjkRXwJD9uCCzhdD57Bw6P+J8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=owQfWt8KoPVQ/lX44sj3cyhUCNuPgvn5cToYmInXhdW93rJ/KiBjvhB34VARgCf4l
	 ErsRfGPbQ8rR2LMv+r1FEzxrYLwLB5fUjMIOZa2121VbobM1sa8ZvwBUBwx2NUfKPQ
	 VkThpJmC3kxLXsmK0XUyrmN+Rzo5WIoYVw/d/aOZbQWTAxnOYFRkBSAvNXso2MPrTX
	 472+vBBZpTm65WmX38e4UM1gs+Tz5qPkfhjYA9eoN4rLmnVN3Q68F2g/HYe/f1rgJa
	 ijY0rzUv8mMLBiQYkqbLjPoyfFg6kuAFPie1pnR5VQsgoTLZbMCNsB/3fmOkH6cmSo
	 bMm1P12KVwv3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4715380AAFE;
	Sat, 21 Nov 2026 03:11:19 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261120205946.799247-1-linux@roeck-us.net>
References: <20261120205946.799247-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261120205946.799247-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc4
X-PR-Tracked-Commit-Id: 449cdc5e29c63aa66b41ce8c2783f6b0d84c62b0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 06ef54bf3ab7ab8531e8f9c197d189f44b8bd925
Message-Id: <179523067833.902445.15765998578586576191.pr-tracker-bot@kernel.org>
Date: Sat, 21 Nov 2026 03:11:18 +0000
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

The pull request you sent on Fri, 20 Nov 2026 12:59:44 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/06ef54bf3ab7ab8531e8f9c197d189f44b8bd925

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
