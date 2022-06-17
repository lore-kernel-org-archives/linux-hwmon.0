Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03448CCA479
	for <linux-hwmon@archiver.kernel.org>; Fri, 17 Jun 2022 17:07:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383029AbiFQRH3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Jun 2022 13:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383102AbiFQRHZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Jun 2022 13:07:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3840931936;
        Fri, 17 Jun 2022 10:07:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C907461E91;
        Fri, 17 Jun 2022 17:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D145C3411B;
        Fri, 17 Jun 2022 17:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655485643;
        bh=R0vR2sJbeY8/piKRV5zzEsxR8Dq7/HTyKeFY3qF0Tyc=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=gvJYkxeW7LFXxoDNBd0UJed6DIvGJMAJdItSqEDBMer2lbYoNX0BTCgnk6XG5eE/w
         UDT66i19SQyXFb+3REz5G95lTN5nTiF9FyNvjaPeyLXZVhCF5jbhaWMarWNqYyeQ1f
         za3FzesEXBmUdCqnWvHKjPDPkS50N6zgQkiN48u3RPRoshlsTAKUZz3hgtFa7CFeQE
         z0W0ZHP+pYGdfb1pGRSCv7amjET/yRcr4HGX3aX6xSsiF0wa2869agNexNoOjulRhP
         YlvdeDxG3xTdugRL6S0y4YhVaexJl8Wp0s0XLDvM+IOwG3I19nGsbcj//F98H3RS7s
         m5Uk3Wm6UQoyg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2AAABE56ADF;
        Fri, 17 Jun 2022 17:07:23 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v5.19-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20220617135525.616752-1-linux@roeck-us.net>
References: <20220617135525.616752-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220617135525.616752-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.19-rc3
X-PR-Tracked-Commit-Id: ec41c6d82056cbbd7ec8f44eed6d86fea50acf4e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a96e902ba9ab88f4beb8302c9ade1d53b826a602
Message-Id: <165548564317.14433.2803970109105797740.pr-tracker-bot@kernel.org>
Date:   Fri, 17 Jun 2022 17:07:23 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Fri, 17 Jun 2022 06:55:25 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.19-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a96e902ba9ab88f4beb8302c9ade1d53b826a602

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
