Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B297C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Nov 2021 02:20:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4897A60EE3
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Nov 2021 02:20:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbhKBCWl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Nov 2021 22:22:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:37794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229769AbhKBCWi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 1 Nov 2021 22:22:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 51F6F60EE5;
        Tue,  2 Nov 2021 02:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635819604;
        bh=tUTvoINMek9phvM610fKTX93Qb0ClWcSz+L5uUy8KEI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=CGTezrEvQYm0Da9F/34YcBWlcFzMZSLZTqHeWAgpbG2ylIt+PWIA/yqfBZMS3r36v
         2JmW/wl+NbJloeCQl2y8RyqQMuvZ/HUP5KuALDXAKMrBYExOGwq1iZWP354JUyNaBB
         Jpf4LIpmLNIkJtjCbB/JTIi0Di/+kmGNfx2qChL95WuRYTuwDN+hByjyK/ife9PWj5
         D9cTcIP+eXq7r+AS7Ji4/L/PAD1WWPCjh9V9yNqnDzL5VfBk0I16zc+muE3QaopNvE
         EVVcvnvfAmTG19qQDCrUNenyuMT2oh8hO6WY0UYp/UdthD4EjiuBOWJicApVpitnKC
         GrCKg8CHtnO/Q==
Subject: Re: [GIT PULL] hwmon updates for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211101154445.591872-1-linux@roeck-us.net>
References: <20211101154445.591872-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211101154445.591872-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.16
X-PR-Tracked-Commit-Id: 10f0d2ab9aa672707559d46601fd35544759ff70
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d54f486035fd89f14845a7f34a97a3f5da4e70f2
Message-Id: <163581960429.22843.9048761620393121821.pr-tracker-bot@kernel.org>
Date:   Tue, 02 Nov 2021 02:20:04 +0000
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The pull request you sent on Mon,  1 Nov 2021 08:44:45 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d54f486035fd89f14845a7f34a97a3f5da4e70f2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
