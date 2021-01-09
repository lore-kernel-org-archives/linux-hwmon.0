Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9321C433E0
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Jan 2021 19:52:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92EF523A7F
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Jan 2021 19:52:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbhAITv4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 9 Jan 2021 14:51:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:52154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726281AbhAITv4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 9 Jan 2021 14:51:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1221823A9C;
        Sat,  9 Jan 2021 19:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610221876;
        bh=ckA9Tc5B0Triy8FRcAYqWNWwkXVzkpkmp3avIB4gV4I=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ZW90txely72jWZdjtapnK1EqlfLPgojp7zZ70rHCxuk00OSkI33SLWkjyoU4okCg/
         BnW1xvE9lU7IpsGTygszqdqX+EANzJiKqbjWJceyG9XxmtE/qVLfXO2zkEdx2aAYYg
         gV9mjbKPpeJZBAMBqEVMAZHZZWtIJcFzLwyhBuuaVKGd4dQYNOdME5Kp7WEgQSoh7H
         Gm9jwRFIQFFsOE0PxrtrfBMe3VYYhkarFt66yRmjX6itTHkUirf4/HRaPzmZsah5pX
         GD6ZJHcgxfttLdbWrjHksQ7/Wj+BLa4Lzkn0NRStt/M58jrMAPqOdz6w81lAARG7o0
         SXHRn6AE0/0hA==
Subject: Re: [GIT PULL] hwmon fixes for v5.11-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210109182241.179998-1-linux@roeck-us.net>
References: <20210109182241.179998-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210109182241.179998-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.11-rc3
X-PR-Tracked-Commit-Id: 84e261553e6f919bf0b4d65244599ab2b41f1da5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2ff90100ace886895e4fbb2850b8d5e49d931ed6
Message-Id: <161022187605.8002.8826109552221406606.pr-tracker-bot@kernel.org>
Date:   Sat, 09 Jan 2021 19:51:16 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Sat,  9 Jan 2021 10:22:41 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.11-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2ff90100ace886895e4fbb2850b8d5e49d931ed6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
