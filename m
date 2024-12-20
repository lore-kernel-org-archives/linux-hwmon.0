Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8691A3BC8;
	Fri, 20 Dec 2024 22:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734732695; cv=none; b=jcoa90V06eDMJR55AF29XNctHFknIjEw9NzlZURGPMIRDL7kq3DxJZrkc5d50wA81AIQ9WZLozOB7loHipL9qi9hCWI0aTiETEZ6n2R7qf0pe6NNQBAIX657IBGzR/upmaznHE80TyGTPxgdiQOooj/THXvbp8ZqPrgj9IEWHWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734732695; c=relaxed/simple;
	bh=bsmF+JTHmLWXkKfYzaHTlBonTwzmQ+SZv76jO5Vj4vg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Epeqi8OFlv/l8fObm//s9JO+O+4+boO7l1gaL3c3ZpVXYyg4jBwIk+IA7AH6PeW9Km8VsVElYsKVy6Bmg0SMWz46O0k0B1UwDler8SL/aRSHX044Dp0clTMu1xGu4aRCc5ouf5bNttt2PXulwSEKjzw8p0uG5MctcwuVryyDwes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uzI3Oew/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uzI3Oew/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEC1C4CECD;
	Fri, 20 Dec 2024 22:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734732695;
	bh=bsmF+JTHmLWXkKfYzaHTlBonTwzmQ+SZv76jO5Vj4vg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=uzI3Oew/+vKaulVV5lszSRD1VcKon35/9TklY/Fx0Cd1gDf7LddNrRruBWDgIUH+w
	 X2bow2up8vOMF7fhamHgACXAlv63XNNrDZOQR+zicfGUj7QHgZN2WmHZfK1k5aErot
	 Pc4H1lkJzLspjjT7afqeVcYlLq+LgJSc/pW1TU8c3YJDEK+GELiR/cDf6XOA1AmJt1
	 6fqaT+tghX3U6gaDPU/NCd8xCBD6sQznw/UbihLJJWd0bzWV9P7PIvzn0lznnQeU8o
	 iAOEXlxhlQTE+oJ6tWuCGxzA3mgn96uIlfhd4gIcG7ybLVEHifcxIZd2yz4u3ORwbC
	 gFD7DdyTOSCmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE04C3806656;
	Fri, 20 Dec 2024 22:11:54 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v6.13-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241220172027.1001380-1-linux@roeck-us.net>
References: <20241220172027.1001380-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241220172027.1001380-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.13-rc4
X-PR-Tracked-Commit-Id: dd471e25770e7e632f736b90db1e2080b2171668
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d74276290cf92bc16d129fc38883ab448128048c
Message-Id: <173473271324.3035596.2228010339589624374.pr-tracker-bot@kernel.org>
Date: Fri, 20 Dec 2024 22:11:53 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 20 Dec 2024 09:20:27 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.13-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d74276290cf92bc16d129fc38883ab448128048c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
