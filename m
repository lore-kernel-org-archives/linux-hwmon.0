Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738741DF250;
	Fri, 17 Jan 2025 23:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157519; cv=none; b=SE563TV0u5YWIjUY2n90UTrgxcrTBlv3Gh0MUMZ8oliFF4BrgayWdZ6pV2k0ZZ9VLgHSg85nvmSEK5frm2XVwWOy4VDQysw92rIU3Pt8gVp15bJVvqj09ph9steyaOi+Cf/nnyLMeAea+I7KF1AhhodRP0vfbVUfvw4mkIJ4zd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157519; c=relaxed/simple;
	bh=QtNKkUCSKRL6HnuMA1mhhEEb3GV7JgngDJxpERkxAOI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Nb7m6Vb7reLZB83I6gPS/YAFKmI8hz5RI00YpB8yDTjmstviAd583BHnf+keTMHzvwB5FI2/0+bFHmrFX2JTd0OM+khtMh17sM3pgPs8AB8R4t1G3lBIcdrC5KYICqoCugToK3P0e+q64ZcwDLiGAU98z1eCf1AwTLzXm6Wp4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEPAp5zo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEPAp5zo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D851C4CEE1;
	Fri, 17 Jan 2025 23:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737157519;
	bh=QtNKkUCSKRL6HnuMA1mhhEEb3GV7JgngDJxpERkxAOI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FEPAp5zo1xj+42RFbEkLsEizAv+jtI4EXmbA4sOuHCAZPTN3H29vfOhdQ7kI29CtP
	 8EZYxtYa79dHoQs5aeZ/u7tbe3MeifqVk5vJI/3GLme27ZqPU5KKUnaTW+IjBFI6NX
	 ZVS1wzRkNFrWliMnxjB62W+r/OFNCKs7KRR2vSjCuUTEBeZ9vk3OTzUYgFPEinEP6l
	 Jw5on05crBerKPEl3WCdKprqFs6P3MA1AB/mybCFCLbZJAGJxxWBzxS60DpVBAfpig
	 7chvoWWZr+cwnapO9CmqDSV3TFFpINmvjCCJtoBnBwy5N5NUSoMUZAFJPoOuTbwXY1
	 S/5u4n6intCng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE83380AA62;
	Fri, 17 Jan 2025 23:45:43 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250117164317.2710233-1-linux@roeck-us.net>
References: <20250117164317.2710233-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250117164317.2710233-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.13-rc8
X-PR-Tracked-Commit-Id: e9b24deb84863c5a77dda5be57b6cb5bf4127b85
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 07757eeb9657e6939475b3eac8b3936e7a72ba5f
Message-Id: <173715754241.2291664.16349416883508996558.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jan 2025 23:45:42 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 17 Jan 2025 08:43:17 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.13-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/07757eeb9657e6939475b3eac8b3936e7a72ba5f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
