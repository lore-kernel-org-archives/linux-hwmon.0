Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF93C00140
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Aug 2022 18:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237498AbiHBSeM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Aug 2022 14:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237524AbiHBSeL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Aug 2022 14:34:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB4B13F19;
        Tue,  2 Aug 2022 11:34:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7AF13612E9;
        Tue,  2 Aug 2022 18:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D89F2C433D6;
        Tue,  2 Aug 2022 18:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659465248;
        bh=GBtM0DehaPq1tJtLXq1OKEu7O8SXdKoqI0E26yme45U=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Rw2fHt75wEDfYXAD+SeZDm0ZPiE3jfj0C1YQKUBMViCp41vayXDoGJYlJCkref90/
         0844ixLz4DtNqohQrBh6PE+PZceyjkCSjqgqC2TNiXIuDkbVIylfuLXkneXaSjvSaC
         zzJ5Wp3ivaH7ZOStfWsBR7GDsVY72qC/nw4mr3/3qmByCRbiRrxOyDXcY/TFqFOBBw
         6Ic6++PKlOQaWOYj87ydbpjtZikSKuuvP5yHT4ffe2PZ4iAYZjws9a6JHFAtvojcbb
         ZzRqc6e+BdhbM6lmhDemjcqn41YBzfUutJtEd/R4GssREvSHe3p8mUYGYqBaOvJUlq
         N5Yub0OwoSfbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C8019C43140;
        Tue,  2 Aug 2022 18:34:08 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updates for v5.20
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20220730022529.497941-1-linux@roeck-us.net>
References: <20220730022529.497941-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220730022529.497941-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.20
X-PR-Tracked-Commit-Id: cdbe34da01e32024e56fff5c6854a263a012d7ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 64ae88ff48cb5b3cc7b7aea97241a3e940085bf7
Message-Id: <165946524881.2519.15892404700380969906.pr-tracker-bot@kernel.org>
Date:   Tue, 02 Aug 2022 18:34:08 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Fri, 29 Jul 2022 19:25:29 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/64ae88ff48cb5b3cc7b7aea97241a3e940085bf7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
