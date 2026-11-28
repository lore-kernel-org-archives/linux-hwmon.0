Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795835752;
	b=mq++ugRnG7Pw0w9+beHPoO0oOqfAritvSM4+Mbn3WwYuE+JKmFl+XLNhmpo1j6Ms9uEG
	 Zn9tkyCeojtEHp/GwYuIy89ZuI7IWmGrpAfc0h3TLkYZ7reH1wUvLQ99IOlvPV7A0SesX
	 yoh5Q3TCj5hSKhyfwNGxF9L2KCxlMTCriBOV3jtilGJOCMOTvrda19YdJbIpou0XQI8t+
	 jSYTJ84PYJaNeUVjbsc90erzx7eCyahHNirn3G4TkzTgWbbemMuwu2iWBnGvgTXbC+CWs
	 wNfXYUc/BHDNKaCXs7BJh/GhxOvdxuhbtw8LKX+l5q5nYyvgOZM9eIHK5cr5y6eNNtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795835752;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Nl8BT/kD2nUt2uE0PJ96k3hEDqUo1RU0MLOGAcQmfWw=;
	b=3Xgp6aadUeoxDsRiQm8728wvXqmtT/giTzjbC9EO7cdMzHCg+Hi3NFcbEljYUYtSeuZS
	 nrYS43XnWWXuT4CRGcFtU11PuD6szL0W/8gXtG4kwvkXWuzgkaqmY+nMRa9QyQz8JsDtr
	 YdoAXhNWfoivAWjR83v4Eii9mXzLuTohkz9QTh043NHrQd7fWz0aJa9AKVT2AxN5yV9hg
	 sQ42CumyFMWeg4GojtSuDAZkFDeYu9149HM+Zpl/MX1WDqsxJnfLuK0BH834EGgNbwZco
	 v5gFMlUF2GufmZMZcGkRDmrQ+3fzPK+JjRj16N3bzIHE+Je8lsK4idJwST9VeqR+sSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nthpV3w8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9064606A31C;
	Sat, 28 Nov 2026 03:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nthpV3w8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58181F000C1;
	Sat, 28 Nov 2026 03:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795835752;
	bh=Nl8BT/kD2nUt2uE0PJ96k3hEDqUo1RU0MLOGAcQmfWw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nthpV3w80hS53P6+KJZXFuzfPauttHH79OX/j8E7T5r8iThD3XAIDu7VqytYSy0mm
	 cdkiZTKklTrgR0Iyy7e1Ddzvgoph0bOc9b/KhNv5uVrpf3XU16oW8psiVhQ5NacNZ8
	 JViDN4PPO1+4adUspFlOX7WNGXratTpRa7WB6NuSfMe4j8rOsQvlwLp0I1V+F4nyJA
	 cadPSK/F7tPfTB1ZUIqQfVc4VHWgXQO8LPKu2aKJGTXRjTeZ2Rf2O1ZLfY7ffu8ly9
	 1Kr0QLsS510/SvScvafVzNhHyjxHHM9GOMZXN2/qLALtLdy7JnYdOoUEvBsNlHhw8t
	 PsmKRxwuWBozA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE89F392706C;
	Sat, 28 Nov 2026 03:15:52 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261128015038.3132946-1-linux@roeck-us.net>
References: <20261128015038.3132946-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261128015038.3132946-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc5
X-PR-Tracked-Commit-Id: ab8ea038584868fbcc91878a6caccf6404582fce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ad5b48d7188721ba3a7a351d06a78f8030148e61
Message-Id: <179583575133.1782009.5829322448829743758.pr-tracker-bot@kernel.org>
Date: Sat, 28 Nov 2026 03:15:51 +0000
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

The pull request you sent on Fri, 27 Nov 2026 17:50:38 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ad5b48d7188721ba3a7a351d06a78f8030148e61

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
