Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3BF51C050;
	Fri, 18 Sep 2026 18:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755125; cv=none; b=i3uThAizN2mUU9YQbgO5osh6CL/YnSjF0+ZDnop4U+9BhRacmIvE9yhNgMROjn8eh9y1RjQDZA9c3ggv6chJGQc1NNfxtIDLhieTOWjy7pM/bF8Yqub8QwZWW5KVkMAER6eKizWNHzgqDeNoG+ki0Ebny8UlEleX5GTnnv3yf00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755125; c=relaxed/simple;
	bh=TSYUpOwY5nNpcAM5Qra6e8HOTekJ01lzBDvgiv2/LHU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fFp414KgGtxmEYnL2EHKNbiU1Yh9OO4qmpZWAcFzhpLCKYg1ReqDEThSEMPqGhFrCM/NGZJ4Rwb73DXQifEL2W0tkpIkF39/r1ZUBhvpa63qHTcAX01EkprLmbXHLF1QcEjY3OoJgZJbl2iCzKtF8RVvAYBbPHeqAHVaDFrTUts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGffwslD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGffwslD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9241F00898;
	Fri, 18 Sep 2026 18:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789755121;
	bh=m06leT2YdDHTHY3ZhJvEOUZDcOSRldgEr9FPXjuq5rs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=aGffwslDnKhfFnnZq+mcmuc+zSPrc7APlOlJ/EKSoGC/9mkQJh3JUFQjyiEKIKd+9
	 d+gEysdNYPBTJZeBPZpURANsRRN1MN++1PHjoPw/0oCo+LtQ74RV9FJGun67BfedK5
	 DTi8vJ4hGtPSZSwrlAZZYEc2uHBdoZHZ67XuYgxJlUPsBKR+fC4GlNDaqX44VRU+Pl
	 qkEMDqYoA25OTI71gy9tAcbZwj07IlcDG+2Cs3V9MgMV8Foqr1rVjGNe82YEJBmnLO
	 8XEy7B6Kev+1CtRc0ggoeEr71URUssVFo6pHqUTsg53iO8HxW2EFwX0YqcgNoj7vVH
	 kp96w8tt//pjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0BDE380DBEC;
	Fri, 18 Sep 2026 18:10:55 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v7.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260918162118.18615-1-linux@roeck-us.net>
References: <20260918162118.18615-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260918162118.18615-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.3-rc4
X-PR-Tracked-Commit-Id: 92b68492eae701e5b0e9d142ffe229921af7b1fa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d24e3bf4c5484b29432837269ded253480fa8928
Message-Id: <178975505449.1083250.4039558173054214350.pr-tracker-bot@kernel.org>
Date: Fri, 18 Sep 2026 18:10:54 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Sep 2026 09:21:15 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.3-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d24e3bf4c5484b29432837269ded253480fa8928

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
