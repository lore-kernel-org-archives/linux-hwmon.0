Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E828C48F823;
	Wed, 19 Aug 2026 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787160088; cv=none; b=pRHeRFVypjd9YsMZqgx//FS+Eksfh1J2HzGmJy6u64scZlvTV5Ur5L/D8EqwPzWXiMIrOJNPsquCRJOy9HSkIOyPUEyIMb9hSSsjTJ9oMXCi8MtkcHLXnEnqfmyv7wjk+MjnWrnzU7B6oAf2RUYUv5CEzwz2KozK78XI6N2xZnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787160088; c=relaxed/simple;
	bh=/QGi8HLs7huN3mWKhs3mWH3IxJvUd8Pp49XVinICtNc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=evWMVdaTRvJCcFjMuJoNUdVRPji6DWYtLPq42//txFv15tZEPp2nOA3aLoYj7yNXEBu8O53Cp8lhnYy1QaOa2TfmkNa31s9CaPCcTXH85zhyxl/tLSX2DEyhl3C3a7gdo+um87Vg8Y/udCuztB9fiKtI0EMypHpF+tnR0InwdX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otLN4PKn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otLN4PKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57BF1F32F1B;
	Wed, 19 Aug 2026 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787160066;
	bh=QV65BpyNVyA7n4Z9Tg8XlGv8CepSZigWdQP87qJvyg0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=otLN4PKnh3OokxUNV30wQowVLShCRPiU9F1NRvc/01sl2nx4KWDpvJprMrphQsRvm
	 nmUqjTY6GAa/PVi7UAafhrkfs7AUGLOefixODC2am6qcZ+Yf0nEI6sUdo4+HirXgzn
	 VcZEBsohQ9DgnU/ea1vxnx2dGktuRTAQotQM+8BsxARbTgz0dkxM+rofwbbmNl1Z2P
	 UfGpKKep4fAuV0GiTR05YDSNjjtny7IN4qtTb8gJ+jfZts5McxnjdFmtcgr5NfKE9z
	 Hv8TGGijZx4/ycMvB39Ou3RgOmntZ8pAH7/Vpeu8tAHS7rvaEuusaVNp/92BTsVSJ5
	 aSIlaC0WSjSWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1FB5438119E7;
	Wed, 19 Aug 2026 17:20:19 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updates for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260818031647.984209-1-linux@roeck-us.net>
References: <20260818031647.984209-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260818031647.984209-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.3
X-PR-Tracked-Commit-Id: 75f2c0b3690702c90863c2e138cb5520670845ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7acf90feab8b009fde7def08ff2c622d0f10e99f
Message-Id: <178716001806.3599392.4258904935969993078.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 17:20:18 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 17 Aug 2026 20:16:46 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7acf90feab8b009fde7def08ff2c622d0f10e99f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
