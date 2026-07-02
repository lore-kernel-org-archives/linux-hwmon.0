Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A162318ED7;
	Thu,  2 Jul 2026 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008461; cv=none; b=GLQu1UYCkB76HuUOjdKENle5WurOePwERCTxJtMRtUcUMDJbuLEOby99LbbwYIDWYd7uFLAHGQMSyKBzQYqMecDKFXvOfzHi0NJw3enX2j0P+gpczL619Ns1ju8DMooToEZHoO2EfiLkKReJpgMd0c1Tz6nKWEWvGjmoGm6HChA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008461; c=relaxed/simple;
	bh=X/7FR213B8kRKboSZvu22q38Di3GLh3FQYNGg7sfn4s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Rqk1VpFz/REra4kT5djOM20WdVRMY34G2z1qNYj8Gdt25ZGfg5u0/HQTRYqVVAUugCu4DauvqQc7YNRihfDKRYQ/W2Y364zBf02eHlJKOoz7FyIuLfXtDkG7ZvoUgP710mdS3sCojkFo0hu/uSFPgc8RM2/AzZXUIRhGv1RgKaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2S0Wujm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2S0Wujm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4C41F00ADB;
	Thu,  2 Jul 2026 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008459;
	bh=fKh0xD+z8vtnjbU3zg/c/V4NoHTztZBt//Up5DYOqeA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Q2S0Wujm0nEYg/ngZeySBmpoT5jYR0KWvbuMsmUyb9TawYJiuk+ya5Ao5bm4w5Cvm
	 Z7kmpib/fcq7fxDdigMw5Uj9JX5qDCt21lbNGRAHt0zbhfYpM5lKatP6J6LWQLoxQN
	 IxB5RULdNN7lsx0TzbZbk+9i/h+EvsXeKEf4Ob0BMLLtgu2NSnwCr+jeDTNwaJpY2U
	 uo3G5UhLFw773A/7dLOLPykMJ5mtuRAKad0r7u1SCc0QOvjvpI6KQLRX0UPCYTN8Tw
	 7+3PcDehaQ+t88zUK+gKQzeIBlBvp4fiYC7crV17eR7oB+eNhhLzp1+lACsKghX632
	 K9eIdMH3MAETQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56AAA3930934;
	Thu,  2 Jul 2026 16:07:23 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v7.2-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260702133927.1489938-1-linux@roeck-us.net>
References: <20260702133927.1489938-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260702133927.1489938-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2-rc2
X-PR-Tracked-Commit-Id: fe87b8dc67f1b2c64e76a66e78468c533d3c44ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a9d4dd742466cab468a950441447c614a3920aad
Message-Id: <178300844199.1754005.14630022596529532613.pr-tracker-bot@kernel.org>
Date: Thu, 02 Jul 2026 16:07:21 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Thu,  2 Jul 2026 06:39:27 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a9d4dd742466cab468a950441447c614a3920aad

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
