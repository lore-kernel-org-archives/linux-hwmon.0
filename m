Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793926691;
	b=o+iMYSK9WpUViTOpQA5YD9OoslkKctgT7uUuJ24dqWtYQNMeQlWlth5jkWqPpPR9RI1m
	 QlxzsS5adYHlqvwelQT1q5x/ApIT4w5Xl0cCKQBNzIDXoAMX4BcDe7aO0orQFJssNaoop
	 N9kkmHYCndyRnWFknApi+Z7gJ2wHAuTEfJ69hVrDVcchPSVahcPGa+JBC6MwZIAGkgR68
	 pm0KcLjS6dStgOIIKrClmau+ExjIA9JWgvcxDU+jqEBWKU7rsah0jiwiATjWcJTTr8EHw
	 anX704Uo2ge4Iz2RbldX2rOoEWH+fUmQkHdID5i3WX6jE3R6PKXLWPSuzbNWQKCdgCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926691;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=UXoY+F3SsvFAd2zjwkFfZ2t9ltzlt+k4Gc/Cjjr6yOo=;
	b=Nz1J/nsbdcWk3+mf1EWRFPF5oqcyitS+EbPTt8XJbZzvUjx5fbJeTc77iIklYccGXp+9
	 DPHAdvABRIySw6v4Hf7A6+5rgiQcBcQPX22QMw0r5tUNe+5pfWXuA0H7e2YnLzbCoBiXK
	 7NwmtUnjDaz8XOuDJpVvd8SgQzBkwyhRHyg5yBgRTRQSuD30Zr9TNS9C18/4i3jwnyJ9O
	 pNdh/RCYjLyYLh5rUclhJrYeagknO0bH6GSNaJdt5WUXXIO2428M1blUfPNNdJWJthsJS
	 sDq6ZQCFhXUVdV1FVB7h3c7oVnohlbKgQ7V+++jeBgWWC5yhFaCdf+tFKxhlhR2P/3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWUf0+EP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1C5606A32E;
	Fri,  6 Nov 2026 00:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWUf0+EP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04631F0089F;
	Fri,  6 Nov 2026 00:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793926690;
	bh=UXoY+F3SsvFAd2zjwkFfZ2t9ltzlt+k4Gc/Cjjr6yOo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=iWUf0+EP2eYzLYExMJFpQoG7U7BMsEuqtCBdQVb7gzrSijYhVe9/z3BJg/9KQteKv
	 Yx62aijC+PGUp5wzVAKR758UIu6SMdMF+dlJEom3ZLspyZCryrLSb7dxND8IWreBcK
	 Vv91ST2Y+OUKwbAstklVHeT29f/2N9IF/MYUti2ckwoUFvHF5kCl+EDdIR/v/sEwP7
	 1wu21MDdLu9lGbLTmhm8vYrVsXErpjWyGEQksOA3lyGzrSJRe6PQGty/XN+MaiSWE2
	 QEqLzawT9fJVLZosELmDimg2SU8xluR0UIK58BvanJqmmhkCJUlvLqZY4fToHDTVS7
	 xCVzrAgDAGRog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D83F6391B1B3;
	Fri,  6 Nov 2026 00:58:10 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261105041558.3259881-1-linux@roeck-us.net>
References: <20261105041558.3259881-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261105041558.3259881-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc2
X-PR-Tracked-Commit-Id: e395bbf3ddf1b3175fd3bddaead63a2909b33694
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3e516eae690b3f24c19168cc0fe605e1c610eb21
Message-Id: <179392668937.268614.6405564038710984492.pr-tracker-bot@kernel.org>
Date: Fri, 06 Nov 2026 00:58:09 +0000
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

The pull request you sent on Wed,  4 Nov 2026 20:15:58 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3e516eae690b3f24c19168cc0fe605e1c610eb21

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
