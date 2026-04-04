Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC7E21CC58;
	Sat,  4 Apr 2026 04:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775278489; cv=none; b=JsKEf+J/pSizezG4XNBWebbPQXEhKvov5cynJRTxnWDqI928ijfpeCJA86l5cbyqBPxS5S6uftfGz97ItQ4MbFKSISWmQYfxsZxuhWgSwDpDL7BaU0l7DSLNDGK8vOrIUHO0KP8XcEsP2XhAd52YNTH35c1TkfUBeBhB5pOOzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775278489; c=relaxed/simple;
	bh=wRt4hSBG5lisx8P8YOg6Zg5NxEi35WTeRYe4inrjvuc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VMkcbCP0A27mooz7+652bPsOuZtq7RIPTr4OryHYETKBbnCPfAJCeZImokhVWr/AIO0r6lAla1TPe23SAungnK+sMIouVSgUNmEnFdmV7+1kYjgvRtlHZ9Se4AOcjtautYszcJfZdj7ir2HCly/KY4n6FOFWyR7uRxsqNDQYVuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LM0C7q2U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LM0C7q2U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3D4C19423;
	Sat,  4 Apr 2026 04:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775278488;
	bh=wRt4hSBG5lisx8P8YOg6Zg5NxEi35WTeRYe4inrjvuc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LM0C7q2U2RRwdP7SfpKJivrK/T4MGgLCkwq9vKkbwEj+bDfeoVOPbMt5BDOI0Jf3W
	 9st8LbTiRH+pPVDs0WCkS0Pl0jrNgAuoWwU9kb8xduvxBntj88YdQWJk3AszJp6LhS
	 1Stfsybxt/SwBeZCVfVnBzG/k9bJXq+W7tuTJQZh7WKm29DB1jjIRT5VUz0EJmtBXG
	 J6/cW9tWgwXkq+ZLj+g4toNqhJBrUk61bGHxIhe241EmFej8N3BD81Qsxea3j3T12a
	 OZXrXSzJ4MR/8CCqxga/vV/328VP8FOzdCe6oDz7mrmUsQe9+9HwqYcPZ9sHkgdrKH
	 DwMteZdVhNYCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02EDB3809A18;
	Sat,  4 Apr 2026 04:54:31 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for hwmon-for-v7.0-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260404000627.3649092-1-linux@roeck-us.net>
References: <20260404000627.3649092-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260404000627.3649092-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc7
X-PR-Tracked-Commit-Id: cffff6df669a438ecac506dadd49a53d4475a796
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1523e4d567f119ad859783b314b5d1312ebf8281
Message-Id: <177527846949.1572522.7037766884958714769.pr-tracker-bot@kernel.org>
Date: Sat, 04 Apr 2026 04:54:29 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  3 Apr 2026 17:06:27 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1523e4d567f119ad859783b314b5d1312ebf8281

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
