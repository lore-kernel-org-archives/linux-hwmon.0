Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4448C7618B
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Mar 2023 19:01:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjCRTBk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 18 Mar 2023 15:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjCRTBi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 18 Mar 2023 15:01:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFAB2BF1E;
        Sat, 18 Mar 2023 12:01:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 55086B80A1F;
        Sat, 18 Mar 2023 19:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1129C4339B;
        Sat, 18 Mar 2023 19:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679166095;
        bh=+rin3pJfGKxc+3STaIiDpT5KlJmTm9GzbasBy9EXZZk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Jm4jpnvTX68bFXI+sLZoe5MhlDRMjaND5A0zWfyWG0MVkivW5bNrJeKieO9Mp4VsL
         7BQvogXt29m+od70+jwajwqhfm3EuAbWmE+D44F9LF/cbQ7yx/6eafOIh9z5ZH5XMP
         1NkluSPEYNf8phJXRYH03S+Y64/kcRoyKFNJVZcG7s08aOkVZ0GlmCACgkn6YxDcq/
         ofyrYKuUuP7txfPoNuM6y+6QE81bG0cx5Ns4jas6uJ0AhS0FrtrQr8JEs8lnujiAzH
         FASc6qn/p0VFhoQvkbdyE+vbfmEfKZg/1C8617GVaqx5bvh8Figoq5ijTAynGrTxyT
         E3Mbdb9UDMmnQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DEF54C395F4;
        Sat, 18 Mar 2023 19:01:34 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v6.3-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230318122758.2140868-1-linux@roeck-us.net>
References: <20230318122758.2140868-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230318122758.2140868-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.3-rc3
X-PR-Tracked-Commit-Id: ab00709310eedcd8dae0df1f66d332f9bc64c99e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a3e75a7ab1590fdc015ed40ebeb074ffd092186
Message-Id: <167916609490.11643.12446115790453635338.pr-tracker-bot@kernel.org>
Date:   Sat, 18 Mar 2023 19:01:34 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Sat, 18 Mar 2023 05:27:58 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.3-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a3e75a7ab1590fdc015ed40ebeb074ffd092186

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
