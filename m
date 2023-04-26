Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BBAC77B7F
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Apr 2023 00:50:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238990AbjDZAuP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Apr 2023 20:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239025AbjDZAuA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Apr 2023 20:50:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D364193ED;
        Tue, 25 Apr 2023 17:49:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C52D63241;
        Wed, 26 Apr 2023 00:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E82F7C433AA;
        Wed, 26 Apr 2023 00:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682470179;
        bh=DLvGRa8jJkYQFMo6jH03wsw8rfT+N16U/Auo8b7ckas=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=rvGtDT+K2XQatCyp9Z0TLMj/iem7paEeky2fj1OJXa1Hb4ieWZhnjoKN1fMHw+OXe
         6sEwuLgKBQFyYoVh7aVFqnvP+ax9ujsLpgPnh9PqSsvQXz7tiK82Lnpq4STSI6Z7J4
         SwGNEiLs8ewDbYsdrswh99hm0EjgFaD+JoJszNArc7gbN8LP9oVHVHdw6Trwr1onN7
         bnwMDeGeNrZfTYv3p40Fh66yaM+r/dKrMnJddZ0vfkra39UuuENjABQHHsslxVKF1J
         44GS5WnpMaft/DzhnXAjLaqA9LiGTa/O0d9Asow5WeieqPqXvoLM1pu8gJ3XrbAEln
         GZP+1AGZ46afw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8223E5FFC5;
        Wed, 26 Apr 2023 00:49:39 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updates for v6.4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230424133601.567008-1-linux@roeck-us.net>
References: <20230424133601.567008-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230424133601.567008-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.4
X-PR-Tracked-Commit-Id: 1c19ac768b8eeb0304c4ed7db66c2bb89c6ad226
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4173cf6fb6b7d1b4569cca08af318c4561356fb5
Message-Id: <168247017988.10866.8283880248832418384.pr-tracker-bot@kernel.org>
Date:   Wed, 26 Apr 2023 00:49:39 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Mon, 24 Apr 2023 06:36:01 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4173cf6fb6b7d1b4569cca08af318c4561356fb5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
