Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C473FC433FE
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Oct 2022 02:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbiJECom (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Oct 2022 22:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiJECoP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Oct 2022 22:44:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1E572EFA;
        Tue,  4 Oct 2022 19:42:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9512161579;
        Wed,  5 Oct 2022 02:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0645FC433C1;
        Wed,  5 Oct 2022 02:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664937709;
        bh=oeovTsm/guc2kNTJ0YkdMT/U8+MHTPtjnnJUIJqMxeU=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=mCPq4audAVsAuHa1DNZfggh3QQJ0tWtD9TNp5njBiBwXUe3Wnd6F+yn3iz09pq9w8
         E8cMO2rkIzX8tD28cEX5RFEVSwZpEDfL72gtbzb01a+7vghmVtebSer16+SWbeUwG4
         FdWXirdJNHWR0uVMtVCMmM4ej0NKBuzAPZYXqujHGG1V5Oyw4djdz8r/ybhgASPazY
         ExB1LVPD3IMTxTmjHjlkAAbrvrjS/gzweQERjW822V7dW/xYMIV59MPPQLbxLIICr9
         TYgwWlC6W9ySj65MHcgp3eKgjO5/FiJo3XoH1Mcq/BbfaoLdWeBbzkK128mvMMCK91
         l++Tq8i0BisCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E845CE21ED6;
        Wed,  5 Oct 2022 02:41:48 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updates for v6.1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20221003000230.1008396-1-linux@roeck-us.net>
References: <20221003000230.1008396-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221003000230.1008396-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.1
X-PR-Tracked-Commit-Id: 0cf46a653bdae56683fece68dc50340f7520e6c4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0baf6dcc02c130a69fb21088ec31a0ba7a896f22
Message-Id: <166493770894.5416.14072982689521411991.pr-tracker-bot@kernel.org>
Date:   Wed, 05 Oct 2022 02:41:48 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Sun,  2 Oct 2022 17:02:30 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0baf6dcc02c130a69fb21088ec31a0ba7a896f22

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
