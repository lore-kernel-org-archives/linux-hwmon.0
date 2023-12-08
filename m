Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B45751C27
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Dec 2023 20:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvE7dYcg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED643C433CA;
	Fri,  8 Dec 2023 20:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702065609;
	bh=ccVyJywDtakW5RRvzMvP5y8hniWjIRmmn42GDLPIj5k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dvE7dYcgjNe94aEVgcygBzvp/qB8BWPMqEMo85kAigt0WVM3Y145/S7qx3rSwu0cd
	 2nHU0XAi061gFDQxqYbiYTdKRBi3T6GedlJHS5YsexmxYjSYN63x/dCoj9X6tzko3y
	 rN0WO0SJVtFnja6Sg6od/LmY4s6doJuGnibSS5xfE4PWlqoz3ItQsYAjl4DJWeCTo9
	 2u+4WytxKQ6RkD2C0RV++kf2Cq7ePLlNrYN5wOBnQ5/SKkVKCaXwarWvKb99das71e
	 MG6B3iV8Bwfqtt5oPeIk/SLV3w+/aahX2rXMyQx7boN1yHsnUZA8ox8v0KvffBT9/V
	 KcgbGw7XjhtLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB480C04E24;
	Fri,  8 Dec 2023 20:00:08 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v6.7-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231208185147.1252216-1-linux@roeck-us.net>
References: <20231208185147.1252216-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231208185147.1252216-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.7-rc5
X-PR-Tracked-Commit-Id: 307004e8b254ad28e150b63f299ab9caa4bc7c3e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0dfe14fca933dc729fd7671c7b8fa616d74856b7
Message-Id: <170206560882.12654.8670040269857932970.pr-tracker-bot@kernel.org>
Date: Fri, 08 Dec 2023 20:00:08 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  8 Dec 2023 10:51:47 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.7-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0dfe14fca933dc729fd7671c7b8fa616d74856b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
