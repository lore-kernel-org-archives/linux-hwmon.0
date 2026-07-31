Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C4C47989B;
	Fri, 31 Jul 2026 18:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523137; cv=none; b=NrGVDiGYyJaWOV6vS28SGYYG16Jc8hL3Ls2ZyfUie0H4jwaUcNIS/zIqrG4qFNz1gCKqsx+yfYNjhnuFf3GmIcqW5/qPYfvBlA0dqkL9/DPf+86sET+1eAuIjlZ8kKVXiiZFnJBdYKOl/va3oXQETB6b3/7N/ByjDDfZmQPUOOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523137; c=relaxed/simple;
	bh=3/H8LuzZS4BVkGEmbGQ5sYlMHX/dK5pdE3NklOdZ6no=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qAJE57AHX81YiGzAz8/5u0l8rTGSlM6/PpRgQXmP70EGGEIj/2oGML/vupzHeBwma0OrP1NdoACOHh7J8dSuiOai8GneyOdf5QeKcrriU4Us3tDbb1OWpHINzin6tfSGVaRSrly2M/JNvNxCfVnjocm3YW7cgnS0BubvQUyCNEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SS7Z5dLU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SS7Z5dLU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432F61F00ACF;
	Fri, 31 Jul 2026 18:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785523134;
	bh=P2S+S4M+t04xMDnMNDUs9SCQrhEE0RAqeXPG7UGteNU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=SS7Z5dLUxe1rJ3aIoaEK7TcpEXvOCRoaltsgzaRKmUe37D3AgwrJLk8dhD6Hkcsrz
	 zaAxyoXhrhjvuaMg/gLSEkDqa6fvI9lsJvVkAFljSucZ8duijXzh0HMrR8xGqulOkU
	 XqnRrZZ3TZYVKSaCMlGBiqwzscYUrYMRZ76qCfrTO2nzD0kNxUaFNurpwlqUINKdlP
	 N2aytYwZ+Sx7QE47VlS+mKmuxSWB3z8Ftf+2RN8wh2lLoErHp+mHstLajaL2QXLqV7
	 VSXr+ZYT+ZfYDdel66QPmnGSqjqlPVOz3ENb+qNhsu9UgBQ6j1pBxs56w+Yv1OTKLo
	 7YO0VusC7nBgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5695739263B9;
	Fri, 31 Jul 2026 18:38:18 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v7.2-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260731144613.340698-1-linux@roeck-us.net>
References: <20260731144613.340698-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260731144613.340698-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2-rc6
X-PR-Tracked-Commit-Id: f27f6976ea269219c1259a7c2f8c6dfe782540a3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5f5d80d3b7536b11ddf64be1a80b5500b70afa0c
Message-Id: <178552309682.857209.16940638642209364893.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jul 2026 18:38:16 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 31 Jul 2026 07:46:13 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5f5d80d3b7536b11ddf64be1a80b5500b70afa0c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
