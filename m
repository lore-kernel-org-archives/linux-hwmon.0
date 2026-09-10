Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8B33BBFBB;
	Thu, 10 Sep 2026 21:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077227; cv=none; b=fuwtHgBeEYjQbirv+M3tO/ilX5sW1mHDrb4HtvNC+31Kj0dAtOf/5dkQFyqMcOwK+Xm6HeTCiethFXIHnkpblkSCMcvTcxU0ajPpddXCh+Ucx8elwpl9jO/yfXOv1KDnDF/r/RETmo250tx4VFgNFqQO1vxEYe/v2VsqeyyQLtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077227; c=relaxed/simple;
	bh=eXqfgfSC7r3Q4xmSbbAJtc0d2P40Lqah80uxmyIjhOA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M5tpNrPKPKn6btuimoDTp5uBv23kcpu0GRUZ3k1HSsKCa2L4hxBtE9FYpmzuwmtsjJUhg8+BYfcu5BkKFeJIUvE9nEKpCaU9ju5Mxu+iTBJz7y0xO9Xh/udZK8THPWAcuKkYoP4oIAqE/BwWQlAoHzj6p64KyiVSDp2b528kbR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsXhcSQ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsXhcSQ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD031F000FF;
	Thu, 10 Sep 2026 21:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789077223;
	bh=3MV79wLOHE6cjr+GzzRGapcmKG0lOndporDobM0Mkuc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fsXhcSQ4Pl/pbwb5iyuFxj/6s5/iuVFQuJnQGvKv3Uuq2K+3DIOLJeXMWnartXKKa
	 23rIiJV6siUMckpIRJlUCzHvq8qbuQcfuE1RW+sXvJBb1lT6CLyzb7vSyfFqeiVRKR
	 F3z/QygLqC8xrPcpR/2h01iciw1cGhN+YVAcQ7KIfseE65X6j/esDrgppUJz6BVBHk
	 eVXTypEarXtEIP5Wpu9GRIMTWHt1BVelzmVgQ4WuSmO5Q448RYSEeSUX42xIqNshSN
	 gXhsuQXAFAvqGlZw8pw7VXx+VUPJord8fpHAJePsABQeREhY/5QG9zX2x6+1pgmKkc
	 x0esUHkWJICXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5682E380DBDD;
	Thu, 10 Sep 2026 21:52:42 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v7.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260910182930.1739489-1-linux@roeck-us.net>
References: <20260910182930.1739489-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260910182930.1739489-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.3-rc3
X-PR-Tracked-Commit-Id: c88a6338ae485e4d6210cc74cdb7664d6476c925
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aa416593f363f9b290e21cdbb98e90a0d8c513e1
Message-Id: <178907716093.2100681.15494251750885758404.pr-tracker-bot@kernel.org>
Date: Thu, 10 Sep 2026 21:52:40 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 10 Sep 2026 11:29:30 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.3-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aa416593f363f9b290e21cdbb98e90a0d8c513e1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
