Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D63C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Nov 2022 17:49:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbiKYRtX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Nov 2022 12:49:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiKYRtW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Nov 2022 12:49:22 -0500
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1BC23153
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Nov 2022 09:49:22 -0800 (PST)
Received: by mail-io1-f72.google.com with SMTP id q197-20020a6b8ece000000b006de79f67604so2344708iod.13
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Nov 2022 09:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9uBU8s5VCIdHByMxtUe+OwrIeZYs1TZi9TU9WQnEtM=;
        b=usFoqAFLYxDoh0DFbWfBsLOruq0/td9nmOl3bdANrBqEbm7RXLVF6LIAWzCOLO0mI4
         aE+VwBJqz+CPMkd5DthYWrJ2GLx4f6O67ZBa4gzjSiO63kNGzdpc8/+OL6gS1OdcGkcX
         O+3ozZ0wq83kaNPOTmCgdV9DYVq/FgxKOj5c9J9ilVJ2rodc6DSxv0zdf6mx7lsjoMSq
         +AVTxuLyhZgQ086EcrSqNNI3G1Zc+SmQPv8DG7uGqdx5bzp5wXRmaCtcE0CLhBBiFK9w
         MMJCULwngAjNHH6zpVRriyp5M0FGBgn+DZVweo8VWLq+jg377elaw5AWgU4+CvpMvGxW
         Gw2Q==
X-Gm-Message-State: ANoB5pk6YlGLRmYB4zhoG5U9Ow4uqRmvzaELhYribyOQ3KQ+YdK/r6F6
        cOqHq6cgffEty0oX6ns6Poql9QCdXjG69fYbxFMdqBhzXDuo
X-Google-Smtp-Source: AA0mqf5879qp50T0kHMWEYv22lu2q7SWnZD7I/9CRQlfvrei278pacvgl2mxtV/M2hSYf76qTZpZHfEh4L/Sbgr2P9/WkQ2+cwh3
MIME-Version: 1.0
X-Received: by 2002:a02:7122:0:b0:375:d16a:c9e9 with SMTP id
 n34-20020a027122000000b00375d16ac9e9mr18131069jac.75.1669398561510; Fri, 25
 Nov 2022 09:49:21 -0800 (PST)
Date:   Fri, 25 Nov 2022 09:49:21 -0800
In-Reply-To: <000000000000a9ccd705ee4865be@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003f5a8205ee4f2429@google.com>
Subject: Re: [syzbot] kernel BUG in clear_state_bit
From:   syzbot <syzbot+78dbea1c214b5413bdd3@syzkaller.appspotmail.com>
To:     clm@fb.com, dsterba@suse.com, jdelvare@suse.com,
        jiapeng.chong@linux.alibaba.com, josef@toxicpanda.com,
        linux-btrfs@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@roeck-us.net,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

syzbot has bisected this issue to:

commit 4444a06981af66a49cf0cd08fec9759e8dd0a0fc
Author: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Date:   Thu Sep 1 02:23:32 2022 +0000

    hwmon: (emc2305) Remove unused including <linux/version.h>

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=161ba58d880000
start commit:   c3eb11fbb826 Merge tag 'pci-v6.1-fixes-3' of git://git.ker..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=151ba58d880000
console output: https://syzkaller.appspot.com/x/log.txt?x=111ba58d880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8d01b6e3197974dd
dashboard link: https://syzkaller.appspot.com/bug?extid=78dbea1c214b5413bdd3
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=149d9403880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14a0d8e3880000

Reported-by: syzbot+78dbea1c214b5413bdd3@syzkaller.appspotmail.com
Fixes: 4444a06981af ("hwmon: (emc2305) Remove unused including <linux/version.h>")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
