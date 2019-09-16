Return-Path: <SRS0=NwsX=XL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FC4C4CECD
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Sep 2019 21:35:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9791B214D9
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 Sep 2019 21:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568669732;
	bh=3xVE3rXuiKCmRPLRFYOZWzFfnk3d3+JYNP3qnJCmJBw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=L+3mmkX58Y+AYdR/VkeZ7z/uG/KRWT9v9HWZMKMqJrDOobkv2bDPJsHaM5VvJrPTI
	 XWvh1hn4EdhixY479WT6oLhCUPvn1ZgguYNSz0Lw6MAt08cKsJPS/avPgDE9x4htsR
	 IGVJLaiJAMIVJbkBGBzDw5tnJQAlXpTxskg7FPM4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389381AbfIPVfM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 Sep 2019 17:35:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:42082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729965AbfIPVfL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Sep 2019 17:35:11 -0400
Subject: Re: [GIT PULL] hwmon updates for v5.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568669710;
        bh=3xVE3rXuiKCmRPLRFYOZWzFfnk3d3+JYNP3qnJCmJBw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=UBx2co4sk9Lj2bFiofZCxG+Yk2ubqAjaHzkOOYdu4nh3Lq0wdh0SjwFWHyDE4ALTt
         zQ9081Q28B+70N3afuwvjkuYIeGi4QenkLQ3GUuRTaf4Q8/+vDvNTaFyTuM5wkGfyP
         B96MCU9ZyBA+xOOpOhI62JV/hfaeYtPKJ84Npq0U=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190915221702.28480-1-linux@roeck-us.net>
References: <20190915221702.28480-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190915221702.28480-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
 hwmon-for-v5.4
X-PR-Tracked-Commit-Id: 4e19e72f45d360975c59df8272f98bff59f6b748
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6729fb666a3b5a9a5ffa1bb6589127f7e4d35c38
Message-Id: <156866971044.13102.2758613399864026595.pr-tracker-bot@kernel.org>
Date:   Mon, 16 Sep 2019 21:35:10 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Sun, 15 Sep 2019 15:17:02 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6729fb666a3b5a9a5ffa1bb6589127f7e4d35c38

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
