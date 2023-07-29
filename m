Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947C0C00528
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Jul 2023 00:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235982AbjG2A1Q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 Jul 2023 20:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236157AbjG2A1N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Jul 2023 20:27:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C05D2D61;
        Fri, 28 Jul 2023 17:27:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 135EC62220;
        Sat, 29 Jul 2023 00:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CBE2C433C7;
        Sat, 29 Jul 2023 00:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690590431;
        bh=RpY+2EEJvHm1/Z1xR2Z3I7RBDch/iGy7zj22x4Nl7UY=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=sSZqSogw9lmQB6cWQdDZKc+3AMlG+y7I+3bP0q0OhyP8fGniiDp/9rk9Go6H336jS
         xASS33i6gR+i1amB3e8/cqwGGvjgFcm2QaVieDXVjOh90pP+4C5t9N4mqQvpcafnm+
         F2KBCRDT7s4XUF0a6Xd3U+KuSFcP+XEs1C+eNR8l7IQmqOEwJBS9ohvpGJePg6A6Q1
         onvR3DpfAfNs27a1IYXaB5eCPV3EZZ5L4N0EubkR3x4xX/EQghcbGybAnZeZLnCQV2
         R46hpNoaFeqMGk3hmOJWkxZCSyrVsxLZXVtME98EHAvQkgyluSIyeo2208o4e30G1O
         ACOA6v57LTmhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67262E1CF31;
        Sat, 29 Jul 2023 00:27:11 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v6.5-rc4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230728195101.3112946-1-linux@roeck-us.net>
References: <20230728195101.3112946-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230728195101.3112946-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.5-rc4
X-PR-Tracked-Commit-Id: e146503ac68418859fb063a3a0cd9ec93bc52238
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2f4effd85fe9228a21bdfd037be006aa9bd7a617
Message-Id: <169059043141.2110.4340521749430053827.pr-tracker-bot@kernel.org>
Date:   Sat, 29 Jul 2023 00:27:11 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Fri, 28 Jul 2023 12:51:01 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.5-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2f4effd85fe9228a21bdfd037be006aa9bd7a617

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
