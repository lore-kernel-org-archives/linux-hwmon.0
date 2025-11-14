Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2AD35957;
	Fri, 14 Nov 2025 01:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763082339; cv=none; b=oLnZwKghnA/NuF32nqriMommkswoMYE2ppMKe8s3301J+XE0oZWKo6rtdZc73Gb17AqQwwq3oD5OCOL+rtslUaD9mmplaIPI/awJWDSqm5ouTFdmcuGNa3U2hhOcDh6hL/jj7O+IJB8H2z3fasLxeG2qJZTihJdMPbwfpOci7f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763082339; c=relaxed/simple;
	bh=wNLz1eakH2oF2+xYjCNogNHbx8GQh2lvVwhLNb3wsA8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZJikjNkXxQXUbHg8jCn9sep/QG/cZrtoqLQTZtgKLSqIQSaQ2Vd+2cTxa5ti/CAeH4NAJgFozoJez3L9Jh0uaaOLtQ2dlLItvhNbpOQ7D4KhMwkMqfvpUiRf+4qZfsMI6CVmznTa2qjQvba4NBqpMEGLGY+2xvCwESX6sRcYKXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kdii8+7q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kdii8+7q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483E4C4CEF8;
	Fri, 14 Nov 2025 01:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763082339;
	bh=wNLz1eakH2oF2+xYjCNogNHbx8GQh2lvVwhLNb3wsA8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Kdii8+7qDbObbXA2PTRHS9jaqLiX1zP40vsE444af+h32gSUEyWfaGuDRY//b6BS4
	 WeAqHMuPG3DUU92T790f/h0jidJAvV+emqc2Ex2XG+aG4IOp982q9mQQAFK9c21J89
	 ynzWv+M4o2ovnccnqPP+joz7OJO2xKvEwly0qKt1lleOERTvwXU985siZ9L6UQy+gw
	 IQH0yAlJskYe+9Qq8MFIzPAN9MkMPHIXhVO+6SEitPjnwuWK+rlgOg1b0O5ZqC7kQq
	 +FK9Ehym0bYbRM9KAVfvwFs2+TIUsxcEf/Guldkk+NqAwuYrbIK4PicB2BWJbu24jQ
	 4WzJx9rGVijFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 711CA3A55F83;
	Fri, 14 Nov 2025 01:05:09 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v6.18-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251113201616.1579169-1-linux@roeck-us.net>
References: <20251113201616.1579169-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251113201616.1579169-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.18-rc6
X-PR-Tracked-Commit-Id: c55a8e24cd129b6d8fed20e3d63c10c2263e2fc8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 01814e11e5e9878f26cfeb4ad4be791525757e30
Message-Id: <176308230810.1071348.13756451010437708334.pr-tracker-bot@kernel.org>
Date: Fri, 14 Nov 2025 01:05:08 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 13 Nov 2025 12:16:16 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.18-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/01814e11e5e9878f26cfeb4ad4be791525757e30

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
