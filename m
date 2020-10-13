Return-Path: <SRS0=maGh=DU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CD2C433E7
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Oct 2020 18:24:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94E7D20BED
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Oct 2020 18:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602613458;
	bh=zTQs/kU15PVnwUBZMwfjB8m5ncJJOGKc7JuFuUT33O8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=R3hCT7XurSTY7B3xuYcuW5xPGVIH9NqYKrdV11B8dseny30GNMU2qfoGepUhALOiU
	 APNz23ZLj9yZlzeyG83GX11LC2bumbLdQ4d7wA5C2VrvNMybiPmZH+PxrM1pTlQ566
	 i5QXwTFVKpmx8eKk4KWeYao40cOxzodXi0SkZHN0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbgJMSYH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Oct 2020 14:24:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:42820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728371AbgJMSYH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Oct 2020 14:24:07 -0400
Subject: Re: [GIT PULL] hwmon updates for v5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602613446;
        bh=zTQs/kU15PVnwUBZMwfjB8m5ncJJOGKc7JuFuUT33O8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=l/DtZzDMqe01qcL6xqbSYBXJ4MJzI0SJ7Gntzg4lKHwrOihVs0tjJbz5c7hJTCTL/
         M/zrGT5tOk2z92Jwzoc2AkT+ZbeU6BXW3W3ZDweS3p2BCgjSn3aSdzEKVgiE2r3eHQ
         wvnBWonRVKGgE3xxj0naqgoggCI66B/RL8WzDnSc=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201012142832.222386-1-linux@roeck-us.net>
References: <20201012142832.222386-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201012142832.222386-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.10
X-PR-Tracked-Commit-Id: 9b20aec24b8ab2860ea41182ba554dfcc444c0c8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c4439713e82a0d746e533ae5ddd7dfa832e2a486
Message-Id: <160261344685.11865.16896436340927461835.pr-tracker-bot@kernel.org>
Date:   Tue, 13 Oct 2020 18:24:06 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Mon, 12 Oct 2020 07:28:32 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c4439713e82a0d746e533ae5ddd7dfa832e2a486

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
