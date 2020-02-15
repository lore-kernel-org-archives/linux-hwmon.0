Return-Path: <SRS0=9cdn=4D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9434C7114E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 21:25:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DEDC2187F
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 21:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581801938;
	bh=E77Oal04jCQqH5ixAF7Ku9QKVf+7CEAujcJtJjmajI8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=RM4ACQBPuEmYtJxyZZ8lXs3fuVnTxez2CVhsRUV5U3q+D2yDsWa+nZPKObJqBn7VD
	 yTx+HryCDROW1id9Qq2MeFIQOP7zqHdkSKtjukPgCpqqBycBWqQ8mlFY8VomKy8G19
	 XVFsEgjcX6pPaOTygAZfJLSdDOzpdjnA2fqsmoow=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgBOVZe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Feb 2020 16:25:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:60698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727896AbgBOVZW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Feb 2020 16:25:22 -0500
Subject: Re: [GIT PULL] hwmon fixes for v5.6-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581801921;
        bh=E77Oal04jCQqH5ixAF7Ku9QKVf+7CEAujcJtJjmajI8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=BKj5ISqwpqdzW8yYZbn3X3kPy1TVIKz4R2VnhzUgQvm6a5ENqQw6v6kBZLvZ63ElX
         kJTtZ1ohkjBSl7nB1mv9zmqS0IjZRP9Eav6efTHzglzShNu/rLJoqRxrcb1sea309D
         dZSeZM8a/8e9B4hGRnwNCggqJZKcjnHbMhKiasWE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200215174832.26950-1-linux@roeck-us.net>
References: <20200215174832.26950-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200215174832.26950-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
 hwmon-for-v5.6-rc2
X-PR-Tracked-Commit-Id: 205447fa9e0a44cc42a74788eb2f6c96f91d5cd6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd516133cc9067ef52518e1c9497c46cb8424ea9
Message-Id: <158180192167.10388.11124359806666435874.pr-tracker-bot@kernel.org>
Date:   Sat, 15 Feb 2020 21:25:21 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Sat, 15 Feb 2020 09:48:32 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.6-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd516133cc9067ef52518e1c9497c46cb8424ea9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
