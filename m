Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56AC51C35A;
	Fri, 18 Sep 2026 18:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755123; cv=none; b=btI6w6jaXkkHQdd0vohv9p7x3KvTjA6CMNYce1AXxuTOuJ3bEEB5G48/p7Y+O+YOCkfZsY63Ei3KxOCx5cicz3t/itwNVQkbhj+6aEc7ONEsP+kvHX/fq4QGLqZc4J8dEf0ydathpW9/++DogL5JxhzLs6YXK1tCehTXtLUfHXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755123; c=relaxed/simple;
	bh=N/x7OTMMXiE8oQA0Z4Vy4W7FRRmHBeYvf5bGjZsKs7E=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BGM/Pa2oB7chhNpAEDo6Jcg7pvfrhklfrL57siYpGvuhaiLcpA08WIdOh1e9AUjXPQRjjpovDe3BzawRaCq/nTfGbPnYT/ByjL1IND2q/tM6YshAWw46vB9MoPW6tWWXZiG2zTqmqOS1CyFC4Is37vAbjVR/yW5wiB7jsQg0yQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShZpp1jA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShZpp1jA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BE41F000FF;
	Fri, 18 Sep 2026 18:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789755120;
	bh=GFp21rIRbn2RHPu872owFROEdK+sAToL4GxqGmv0i+A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ShZpp1jAPjgR00iWn+WC+/QuXAkLwUup9KSVS9H+VMR3od738QnOBjscfclIV4Fna
	 4E4HuXd1CO1oU9Zv8f+peS9cV6WJNILE+sWOomXMLDyIOJqGe0uckFVTrIVOmd8d3F
	 wVPihbRlcWZoC5A3aqd1e9b8zUWJ7D5GFlB4ZQwSyZPPcjCtfcKB9SUp/iERdheBk9
	 sSRJZLZrLieMTWapNUonNW7Pz9P9SaU1+++v4X1kCZa02qRQt0lvVt69tRbpILZYa8
	 QqKaMvMma0I2IgYIrumvBKyFBY90E2w/Mz9HRo6qcrgRzOaUuf80vwVKvD5YM2TSlD
	 7krMkJanDQhgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56949380DBEC;
	Fri, 18 Sep 2026 18:10:54 +0000 (UTC)
Subject: Re: [GIT PULL] watchdog fixes for v7.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260918162041.18444-1-linux@roeck-us.net>
References: <20260918162041.18444-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260918162041.18444-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-fixes-for-v7.3-rc4
X-PR-Tracked-Commit-Id: 7cb575b71ab98194d2e040bded3a7281e089c5ed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 928ba50514ac0a7b20ac83e6681583c2584c528d
Message-Id: <178975505323.1083250.14397347354672913078.pr-tracker-bot@kernel.org>
Date: Fri, 18 Sep 2026 18:10:53 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Sep 2026 09:20:41 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-fixes-for-v7.3-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/928ba50514ac0a7b20ac83e6681583c2584c528d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
