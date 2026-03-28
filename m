Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564B12AD37;
	Sat, 28 Mar 2026 03:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774667938; cv=none; b=sm7+gxL1Y1+Lur+zoklUJt8Y47ZHWrhTSlCHkI3K802hCMOW7ZqYtt8J2UFhMMIu3m5bQCW0n/FGCVLQO340G61Pk7Gzv6OE0evEcWP7fcthHN2dIwhs5UgEfCswbRSHRb4UVh22nEF/wd8bUTGQDgHjQz/JUAKSpBrH+Db8hw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774667938; c=relaxed/simple;
	bh=Xq9cmvzHqqiCYvp8OtMefGOhffdqgoTPvahjDDhW24E=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FJ5L295JV1c5E9AraDRfIzb0/fPQ6U8/jj2IcXaIHpXD0jJhkl8ML7ubosZmKwg3DUoerYxvQSXRGNa0B4fOS8QKgtp/Vl7s7E5+5rpPyp7tF97eA3K6ls2enTCJUd/RFbIRti+omGgbtlOquWKvu2lFlkDavPvZ2vyyX+UkUyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsJgzZa/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsJgzZa/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE3EC19423;
	Sat, 28 Mar 2026 03:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774667937;
	bh=Xq9cmvzHqqiCYvp8OtMefGOhffdqgoTPvahjDDhW24E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WsJgzZa/KYEt2J7OLyIrSDzOA9PMGO14Dt5kzpP0+f1scpusTaoTa+Q2iJvd4hS6d
	 JlL0yuZX3Aw/in4GBMB4vymRZpLebUOX0uKY18PXeYyEfnAXEbZ/wPJ0yfEvZnklE1
	 mEfoXbjNNKeUGinBccfgvWPQtJtTfTIYb47tV5YoJv+p2WZK2+WaJBiBkFj/T0GpHR
	 VglU/o+EkayTVR0gOWzQy1iLjRb3Arx+Eu0TGvcFH1JUN/uuCoI1OFdIMl1XeNhBa8
	 mv/5HYlYvftw1ZNBTjg4Q6DHCQvmb1PanS47nPhGblwHekLLMs/xYx0Rui03fwZR1g
	 HpOVT4JvGpJTg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F113930181;
	Sat, 28 Mar 2026 03:18:44 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for hwmon-for-v7.0-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260327233634.4183849-1-linux@roeck-us.net>
References: <20260327233634.4183849-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260327233634.4183849-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc6
X-PR-Tracked-Commit-Id: 754bd2b4a084b90b5e7b630e1f423061a9b9b761
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: be762d8b6dd7efacb61937d20f8475db8f207655
Message-Id: <177466792335.4164734.13470309787668459619.pr-tracker-bot@kernel.org>
Date: Sat, 28 Mar 2026 03:18:43 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 27 Mar 2026 16:36:34 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/be762d8b6dd7efacb61937d20f8475db8f207655

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
