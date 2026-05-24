Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F13C30149F;
	Sun, 24 May 2026 20:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779653516; cv=none; b=trr1zhVSWphH+krNo8GZJCv3YuoWyAhFC2mxaBJp9KTav8TN6RwH9D09qDp65kE3kaKm5XJmyiVjXKl+hJUDY7RCM7ttEDkzXUBwRUXg+NO6u/XWSZV/trWu/m5TC4dya1LLTkSGPNUkx8b99K25/BQ6IUs84M8xZXYhUQCdEzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779653516; c=relaxed/simple;
	bh=0NoBUAtxe4fkisxrpFbaGVRrDcC8blrZUZ/5CwWYOzA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=g0rmFPv9Uvb3L/J0dYtMch5VN3L+DTx8ViLYgU3ahrDKzYkT3CEb1RHl5uq5s/wSoEZuE8LJlMdCqL3Nx9BnV+RFv+40yrscpSEqwykP5SKpdsBEkCMFabM6jEstA3dRyxKJlNB2M8elgyQE9X4hnUCZ0IczPRMofHsgZP/Zqa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LeRfk0n8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeRfk0n8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E781F000E9;
	Sun, 24 May 2026 20:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779653515;
	bh=XPdwjYQ3q8tcGNX04t+Vp2k3Xw4y84+gGBV2PdMknGQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=LeRfk0n8uHXdJqtPBO6gGcJIxEeDgpXOdZ4KOXNws/IX4tkHRROUjkcfiyjfrDQEL
	 z6nhthVxCVy37zS2jckMF0UDrb/lULJxI5Ld3kykB86XU2OjSF9KVckN8bc7IAG64h
	 AWTX6RaJwuQlgez5DXys4xGoDsugxnoe4umaPG7TtJ6R33uBW/TOzqcwNViCkqG+We
	 zTsoJKuEBoIwIfUBsX7wMDXxevMiaDsthCrCLw6qstueb1aywqwX1+5S6LKUn8r5p3
	 0SgmmR63382S61/t8lPvqbUoCaZKkgfmEanCvmh3odi1kb3GL88JW3wgWc3hsg9423
	 5OJsUxXrWofFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1996B3809A83;
	Sun, 24 May 2026 20:12:04 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v7.1-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260523170651.3331559-1-linux@roeck-us.net>
References: <20260523170651.3331559-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260523170651.3331559-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.1-rc5
X-PR-Tracked-Commit-Id: 4e4af55aaca7f6d7673d5f9889ad0529db86a048
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2be86a8c57773bce1b5c845c49e0bfa3caac838c
Message-Id: <177965352256.1864217.11625247703925965534.pr-tracker-bot@kernel.org>
Date: Sun, 24 May 2026 20:12:02 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 23 May 2026 10:06:51 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.1-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2be86a8c57773bce1b5c845c49e0bfa3caac838c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
