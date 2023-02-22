Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888D3C636D6
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Feb 2023 19:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233022AbjBVTxv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Feb 2023 14:53:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233006AbjBVTxv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Feb 2023 14:53:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD241DC;
        Wed, 22 Feb 2023 11:53:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6CCECB81708;
        Wed, 22 Feb 2023 19:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 129C6C433D2;
        Wed, 22 Feb 2023 19:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677095624;
        bh=P85c6YSf7/fev7yUkwadoI7oQG2bF/G8aZ2y8YofYL8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=HPRsgX0I0wBGXtWvxvgKEkEPCrbwmlxTjehR5qrIa4eUAkCmUC9iMiArj/6mNadzr
         b8ke6nosUt5VhHmyUVytuZwn7OlW/by964m9ozA5So5rRVvmlkmOJeYq2DL8SXf8nu
         uXGL9PU0Wix6KxJ105rTAiS99FoO+vSiIwRRmJSroonn+/ier0Re0Bd3T3nrjkMN6R
         Phdb8UnoZPSbTm/wUxSuMqg+5koaKCWtszOeaB84brtXLb1AE9x2NRJ6tslS72xBeg
         URTlLA9t1D6Y+QB7BMdcFYprVIBBVu8Jyz+F/Ejnsz6wHYCDXxK8OA43ZT7hGgbUx4
         iBjGZSbxb4ucQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 01378C43151;
        Wed, 22 Feb 2023 19:53:44 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updates for v6.2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230221164510.1589058-1-linux@roeck-us.net>
References: <20230221164510.1589058-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230221164510.1589058-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.2
X-PR-Tracked-Commit-Id: 5720a18baa4686d56d0a235e6ecbcc55f8d716d7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 241ed6ab74f94eb3d64ee6b950cd8091b1213225
Message-Id: <167709562398.30115.225348828025744412.pr-tracker-bot@kernel.org>
Date:   Wed, 22 Feb 2023 19:53:43 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Tue, 21 Feb 2023 08:45:10 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/241ed6ab74f94eb3d64ee6b950cd8091b1213225

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
