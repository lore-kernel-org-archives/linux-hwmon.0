Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030BD2163A0;
	Wed, 22 Jan 2025 19:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737572799; cv=none; b=ZfIeT5Nzcgo3UDShOd5floYhKi2rB8MA+i9Rg1hwlAkOXLneg/bZhhTwLL4cowBE/Tn1Z5xGLDvnn7iiIn+tsIloIP8IpS0VGVmK0FZbAZHldoOGBD8M692AlEg7VXQhY7ZTqaYeqZCqKqwJyLzk+ErC6cWy1p+sFL4vIlE/9sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737572799; c=relaxed/simple;
	bh=D+98O+sopHDIMBeRGJUE40wfW4PUpk0W4dq9tUSB4PQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=R8F85R2up7n5/i5iXv+YGbtSz7QtCW9pbjZIkC3xeDS0FLUkRe4ufgy2PlU0BWQ5N2gF7HdtyLTezLI5wJVoik2WqmBlhq3EJyMNt+9iB5uE4XkjKGR/I1JGovU77MmGuO/nS+v6EuS1HbVLsQ5zaW+c4bVhZGB+XwMl06u1msg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJTR/V44; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJTR/V44"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D08FC4CED3;
	Wed, 22 Jan 2025 19:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737572798;
	bh=D+98O+sopHDIMBeRGJUE40wfW4PUpk0W4dq9tUSB4PQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nJTR/V44F16pLbr8ljKmN00xhEkkFLITLWmmpQlF8s4Jku/IZ0tIMY7tCNNspXUrv
	 E4elb8ok8JuuVKDwl8kWbklxOjkygZLTQh9UaUyMapWReO0OjeW+jUNNiEnDhiByXF
	 pIz3aFHqrL2MO1oLFq/GVLHFWhhlotDUsLLbOqbp4tt3HVyy5otyfH3+cSlY/cwme3
	 iNV4Qkb8j5fyylIGZhfKCy+OozsNux3EB5Z/56zQ0nebJMFIxKF+5KypVao3Ej2UXG
	 q1o+IkRDYFzGOC/zUa4Ia2BJ6BXRstDPyK3XYtGSGi2Dxqe0/fWD/gbMIfU33DJk6K
	 V170UEeb4UFkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34074380AA62;
	Wed, 22 Jan 2025 19:07:04 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updates for v6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250120144007.2576007-1-linux@roeck-us.net>
References: <20250120144007.2576007-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250120144007.2576007-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.14-rc1
X-PR-Tracked-Commit-Id: a76539b293677c5c163b9285b0cd8dd420d33989
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a4910ed25d48eb06b81fe6beca7d4f31e6275be0
Message-Id: <173757282276.783272.13440903351465700190.pr-tracker-bot@kernel.org>
Date: Wed, 22 Jan 2025 19:07:02 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 20 Jan 2025 06:40:05 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a4910ed25d48eb06b81fe6beca7d4f31e6275be0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
