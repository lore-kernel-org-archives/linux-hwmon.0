Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83764279798;
	Sat, 20 Dec 2025 21:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766265009; cv=none; b=SjgBIkAqU9gRLudTTvL3wOElr3vao54xEZIP/9Pl3j1/shSiplCOvvTo6o/WsCQKlYUTQ/BchjKT1XIeY6v1oI3tO0BeJfFxGlDwkjFTQdb8n0pywI19e6difL67Py62N8glzgM+UlwPSvD4BROr6xpjd2UiZWKMCxlKzUVgDwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766265009; c=relaxed/simple;
	bh=CpvkEUwNWFZKn4meOvvaH/E0Vc+MSxKpWYq/fJhrzV0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Q2Gcu9ywzA989iG8DbmlyspUSV0pXdnwJXqn+t4tVkc0LB0/NQttb2rev46byFU/Vz01tz8oLNf9Hm7TlekNFcNz93bzVedOlyeoE+ZpWlatDRbs029fLd+RFFpFO4jMWSyRNlFJZoj2bcIRKET1UY+Eu+yX94wkFt71Fsz5hKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lb0C8TSW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lb0C8TSW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C30C4CEF5;
	Sat, 20 Dec 2025 21:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766265009;
	bh=CpvkEUwNWFZKn4meOvvaH/E0Vc+MSxKpWYq/fJhrzV0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lb0C8TSWsLkM+xn2rMcfO0h/oa8kr3BhdKxae4ziOJhJvTCmPg5xTqYIoHuaSsiw3
	 jcfJb4JKDVzBhi3q4tvZfROW+3sS+RpI63bQCOebyCk2E4p5WJbRlEQb7uxHMcvXTr
	 r4nPD0G+2/i9ZCxAGUvceQdk2OAjUnFht0zZoQlmAwL1tdEpNc+d2fx0xG3kMkqbiS
	 qxQu5hl7SjACa5+UKlo0G8pPkeOQqPyF5+Gh0S/Nx2CIjMjEZZeA9XRtW+KdOU+R0C
	 5qIy6OaceyDp78qUe03gtA1is673JYOyxiA1DcmCygjRSILYOht10WilBRgSaH+awV
	 whutCEGPj256g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B9623809A05;
	Sat, 20 Dec 2025 21:06:58 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v6.19-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251220134933.4070599-1-linux@roeck-us.net>
References: <20251220134933.4070599-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251220134933.4070599-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.19-rc2
X-PR-Tracked-Commit-Id: b3db91c3bfea69a6c6258fea508f25a59c0feb1a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f0ae3a50624b39f9c5a235ee6caa2566118a1740
Message-Id: <176626481685.137737.1300953970696592039.pr-tracker-bot@kernel.org>
Date: Sat, 20 Dec 2025 21:06:56 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 20 Dec 2025 05:49:32 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.19-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f0ae3a50624b39f9c5a235ee6caa2566118a1740

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
