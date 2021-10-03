Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9CFC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun,  3 Oct 2021 00:52:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2181661AF9
	for <linux-hwmon@archiver.kernel.org>; Sun,  3 Oct 2021 00:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234347AbhJCAyd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 2 Oct 2021 20:54:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:37362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234329AbhJCAyd (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 2 Oct 2021 20:54:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E67C761AF7;
        Sun,  3 Oct 2021 00:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633222366;
        bh=wy8+yXrFKFZA6EzKmUFybyAfO5+P3eIVjoyLXj50VmA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=VkEQro566HoYpDRtcBLo7uf0pzwOC5a8hXsuMo6I5ix19tdOtuPc+iY5KJbgiUY3P
         sJ3P86wdGl+0/9kyIXtKcb+9jzTl12vVGVL0/GqVn/S/RZ7eLrhoGOmPcg5T8/v4L0
         su39FBr50CBx/U/EfdEHjVjE7/ICIMjzuBP9JMp0GzajCDmeW4AszOBUwuW1wXMPZV
         wmbuG8Jb1652sWy8Mn20dnGGswfgD1/wB2fkHhtjGgZ43Cd/lhokbmAFXoHujqNdMq
         aCMlMB1qk2OjcUCjdxoWXMGZdVaPfHsE0RP3hq+7zisW5m9393kDPM2daijy6juesJ
         fDPYVpK3E0eAg==
Subject: Re: [GIT PULL] hwmon fixes for v5.15-rc4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211002161353.37484-1-linux@roeck-us.net>
References: <20211002161353.37484-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211002161353.37484-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.15-rc4
X-PR-Tracked-Commit-Id: dd4d747ef05addab887dc8ff0d6ab9860bbcd783
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b66f4393ad421e425ba643fde0493fa64346a43
Message-Id: <163322236689.17155.15161063289065771969.pr-tracker-bot@kernel.org>
Date:   Sun, 03 Oct 2021 00:52:46 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Sat,  2 Oct 2021 09:13:53 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.15-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b66f4393ad421e425ba643fde0493fa64346a43

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
