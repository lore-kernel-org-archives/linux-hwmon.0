Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15341C83F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Aug 2023 18:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238284AbjH2SIj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Aug 2023 14:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238756AbjH2SIJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Aug 2023 14:08:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50894110;
        Tue, 29 Aug 2023 11:08:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 32EEB65795;
        Tue, 29 Aug 2023 18:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97F19C433C7;
        Tue, 29 Aug 2023 18:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693332486;
        bh=6OPpwXzT87t+eVbGtU4JuzHsPld7nNM9Yy6K+qD2grk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Xfj/9pZMqOWQK9qG+ei7bljoc/iETXXG+3YppODz+Cky4AYbeaWw3YXreN1bpZOS8
         +V40/CVXbxhwB8EExSNrZnlJm6ebAaSLdFEZkvVL+H1uLzVymfBWME7Q+c+iesNOtq
         n9ESdxmonXoq0pSagT27kaZEViO2YGNIDFACVw09IUoclh6mOcLXO3Ruzxj0nY2pa2
         VDIdVtDGLv/1edT7kjPaLxJLNagebI/kGKWK0yl9kqmI+3aWXgrXaQYL6Cch/dGjhT
         n9LhMX/9VGr8e53N3vgWMZBuAOogLbzEsQXyzoDLHWNpgBJDx3IYicBGQ4Ct+d0JOg
         qMn1LfRtYcTJw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 85E50C595D2;
        Tue, 29 Aug 2023 18:08:06 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updates for v6.6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230828163239.2945690-1-linux@roeck-us.net>
References: <20230828163239.2945690-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230828163239.2945690-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.6
X-PR-Tracked-Commit-Id: 919a83d020a8dfa1411c1dc1cff23a833f0f5268
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 41e97d7acf5a45f19ade9139ca178bf9e8e236bb
Message-Id: <169333248654.16601.6469382555645400634.pr-tracker-bot@kernel.org>
Date:   Tue, 29 Aug 2023 18:08:06 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Mon, 28 Aug 2023 09:32:39 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/41e97d7acf5a45f19ade9139ca178bf9e8e236bb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
