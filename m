Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474CAC25B04
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Dec 2022 21:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236292AbiLMV4F (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Dec 2022 16:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237649AbiLMVze (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Dec 2022 16:55:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB9025C59;
        Tue, 13 Dec 2022 13:53:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 13D2EB81239;
        Tue, 13 Dec 2022 21:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD973C433EF;
        Tue, 13 Dec 2022 21:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670968430;
        bh=RFSyUOwwODKbTMLmiV+ry0vRDIZ9880E3mYzJ3VXSjE=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=T0IzCt1QknYcHdxsl5inTCf+bpmgae1+Bo+BEMmqGE7i5SBtB6/4sO/Abuk6qT/4b
         F/cnzLhbn9wehPSiRZu38jOHKMp5WzE0g+xf9Z+QFpzk8KI7Hq80vyE+vngXvayVqk
         yy8nbtcW8HKRCO2IfhKRDQuavdwocizhCEGGBHr+WdqhwCc5A42MzMwQ0qKB4V+ZxU
         fQm/NfjfQ2oXagw+rVUtfpyR9o5hitVLpjADp9B4ufFv90sT3CJoIQRQkU6lS5Hcl6
         dQpSIiOg529us3nkFBYACoSoQO3E2/ykRDfvx/ZwynodRSEghIPuV7divdLsuHXPFA
         Ftpj88DSOiuTg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AC7BDC00445;
        Tue, 13 Dec 2022 21:53:50 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v6.2-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20221212132813.3627306-1-linux@roeck-us.net>
References: <20221212132813.3627306-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221212132813.3627306-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.2-rc1
X-PR-Tracked-Commit-Id: 364ffd2537c44cb6914ff5669153f4a86fffad29
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4d03390b5cb97ea8562fcf324106c4735805d558
Message-Id: <167096843070.13204.5378650532017426147.pr-tracker-bot@kernel.org>
Date:   Tue, 13 Dec 2022 21:53:50 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Mon, 12 Dec 2022 05:28:13 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4d03390b5cb97ea8562fcf324106c4735805d558

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
