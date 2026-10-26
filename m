Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793035485;
	b=dZGZ6ApwKpAlbHemrWpsnIlNGCeAxoEnRisiLB8I5ISyOm2dyR+NIj4JvpsPB3ZHPOME
	 3J7/UTxfkUh8mxcTJAi2YJ5EF5eYcENq64irsgn2hTyg2T7CY9eeYJxAR224DLstKEqAh
	 UvdWYdED3cGlzOyGhRi98RzEoaLiHpmB12iurSRS+py6/1oUBusa1oLQmafGWC3YfA2YS
	 6bdgPj8Aa48dtxrrBzK0wdgKBd8u5mIEIzGSykDxqwu28YSSv+7FjmqBYOByMn1lHl349
	 xgmqDAu2elKC/Km1aKRRvYmDfd35uoSCSHZHqJVUiNsLMVWdNI/OzEw1gl8JCCCFcdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793035485;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=6ubqhcFCacE+Avzz0yUZ8wkSpaP+sDvk2YKEl0NBok8=;
	b=XdPUksieUzBlZHohIlozFDonk65ZZFLZxlC5uKEzKXaeTeO/xCKvqWluUwfd0MIN/YOy
	 SAAr4ZBB0Nb7RDIgVp6m6VTbhH4aKrCgMGob/ODmejJ+2yjuiMydoUzwOZHTTFhVDhrSv
	 mtfyxWWGJRRFC9lpME+UMJw53n9wcRPx8XdB0udfHBpbIRQhzACGw71JWYNWMc4iSA9aB
	 A1/q2CZVodxOP3WmFiYnYTuiQUBWjvu8s2G1vYzbUiGQRYeJSKQYNRfTV1lw4LmVLRxwD
	 dZMqB8m9lc6R5GMlVJAH7scoqm0unEMoVrGJ9Rsw1x/3ZCADTz3YBSikySB7v0mOlSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eZMweUvz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887AC606A323;
	Mon, 26 Oct 2026 17:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eZMweUvz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E151F01825;
	Mon, 26 Oct 2026 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793035485;
	bh=6ubqhcFCacE+Avzz0yUZ8wkSpaP+sDvk2YKEl0NBok8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=eZMweUvzP+7vkUhc8ykHS7K5C+ElbbCN47wNuQJMUJUnOPX63U+TTXgB0QPSIu5pG
	 /MEXmsyLnnCL3VmvKH4ZDNVmKiU+71RlEO/fTgs87udn/qInuS8LhMUs1BWwdqZwMp
	 VPOjvvm91ZVD2A2dnShnWMdDxdW13D5P317zpJYN9YzKVqtey2aI4MG3g9OZahYL83
	 YYgt8RZAs/W8Ald7f30DJyNOI5i5eUHvRszj+Xfq55AwS4nLmlBuqwnybR5LAXetTC
	 5kG4dECM1cRJw/hmrblXwpwBbMkL9g9h+K0zssKVHsZDwt5qH8AyAtcnGB2dPUdo61
	 hPucUnqOJio0A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5AAEF3AA58BF;
	Mon, 26 Oct 2026 17:24:45 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261025145958.3032379-1-linux@roeck-us.net>
References: <20261025145958.3032379-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261025145958.3032379-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4
X-PR-Tracked-Commit-Id: e1b3c2630d5b8bc755fe4ba86d20d08c734eb504
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7313d94c67daf04bc1b6ee39b492d2795fe2f3da
Message-Id: <179303548401.3291751.11190416643249075464.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 17:24:44 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 25 Oct 2026 07:59:57 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7313d94c67daf04bc1b6ee39b492d2795fe2f3da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
