Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B61C432BE
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Aug 2021 21:48:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB10160200
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Aug 2021 21:48:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241392AbhHaVtf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Aug 2021 17:49:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:52604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240867AbhHaVte (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Aug 2021 17:49:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2DCA76103D;
        Tue, 31 Aug 2021 21:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630446518;
        bh=ROGyCSEnS0EwPih0AVc0zvSTxAsHupBcnNjAxTQi3F0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Acz8bj3/P21NE0E3EescdwpZXiToPKLNZv+kYUBEGyyJeIwuefjMFZPE1N/DFYt20
         SO14zdMaLFHOGOQZbZHD1WOd8z87zxTHS0zrOJ6p6ioA+cE7dDMXy0nzoTviJrW3zw
         fIhh6pkBkU5e1EGXYYCl2qxkHpNcQoOy837rd1VastP/tStsF8dTR9kQqRyDWMGULI
         VUetgGtRaGJVxPs3vaIfUMwAgvLpzRNutfXvru3L7VhwHKC9LVy1VOnicNIo3E3dWK
         qQhTYFoTl4HoZGCenK7yIMDtMIpSrjJiW8NylcHRaswZ9SkxohBVabkav3ch6B1mUw
         DAkYv9YWLyfSQ==
Subject: Re: [GIT PULL] hwmon updates for v5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210830212608.2704628-1-linux@roeck-us.net>
References: <20210830212608.2704628-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210830212608.2704628-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.15
X-PR-Tracked-Commit-Id: 0e35f63f7f4eebd268ec236fd1bbf4e561ce8de5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e7c1bbcf0c315c56cd970642214aa1df3d8cf61d
Message-Id: <163044651816.1462.15402559517805456286.pr-tracker-bot@kernel.org>
Date:   Tue, 31 Aug 2021 21:48:38 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Mon, 30 Aug 2021 14:26:08 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e7c1bbcf0c315c56cd970642214aa1df3d8cf61d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
