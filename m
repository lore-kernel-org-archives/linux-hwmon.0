Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE15ECAAD5
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Sep 2022 11:09:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiICLJd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 3 Sep 2022 07:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbiICLJb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Sep 2022 07:09:31 -0400
X-Greylist: delayed 532 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 03 Sep 2022 04:09:30 PDT
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCAF64CF
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Sep 2022 04:09:29 -0700 (PDT)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
        by shout01.mail.de (Postfix) with ESMTP id 91C01A05D8;
        Sat,  3 Sep 2022 13:00:34 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
        by postfix02.mail.de (Postfix) with ESMTP id 742DCA03C1;
        Sat,  3 Sep 2022 13:00:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.de;
        s=mailde202009; t=1662202834;
        bh=vjc28tT2au2gcsuOe39PxWXvDyeVq/2VpAwMeLHUCps=;
        h=Message-ID:Date:Subject:To:Cc:From:From:To:CC:Subject:Reply-To;
        b=bWeYVeCUJS5LrgBnXky3o4ulGNjvzHm272LKtDdtHyxadrsrz8gWCJ4vDKv5vXetB
         zm72cOuzRl6k+06S9Rye5ZHwD8FVBUDhmXNidw9vtU3Vc1SBBMJ9gv7LlimYw7kxSk
         gMmpqiOI36xFB0jAuo3T6m9q9c86jifNfb8g2JuUsAjZUoeuYcaxQXe9MZhhVggGoj
         uWckBiTDrLCdbYPJfLWjgqhtWGe0R86VoGZ7FEvaFwbNnmuw5ZJcXXfsealmbhfbju
         AKXwVNkhJ5TtVlc4aGIKJ5VpDd1jCyl0lEx+7tw26Sl6sm1/D6EDnJU/lbUWB+EFkr
         8hdAJpSOitnwQ==
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp03.mail.de (Postfix) with ESMTPSA id DD181A0321;
        Sat,  3 Sep 2022 13:00:33 +0200 (CEST)
Message-ID: <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
Date:   Sat, 3 Sep 2022 13:00:33 +0200
MIME-Version: 1.0
Subject: Issue in asus_ec_sensors in Fedora installations and other
 distributions
Content-Language: en-US
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
To:     eugene.shalygin@gmail.com
Cc:     linux-hwmon@vger.kernel.org, regressions@lists.linux.dev
From:   Christopher Klooz <py0xc3@my.mail.de>
In-Reply-To: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
X-Forwarded-Message-Id: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 905
X-purgate-ID: 154282::1662202834-3DFFF25E-6A252C7C/0/0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Eugene,

Currently, we have user reports of at least 4 Fedora installations that 
have issues with asus_ec_sensors since 5.19.4. They remain in 5.19.6.

All issues can be solved by blacklisting asus_ec_sensors.

https://bugzilla.redhat.com/show_bug.cgi?id=2121844

The bugzilla report contains kernel logs of two machines, one with 
nvidia-driver and one without a tainted kernel.

The report and the contained ask.fedora link contain some elaborations 
of how the issue manifests at the users' machines. The major issue is a 
wrong output of battery power percentage (in one case it gets stuck, in 
the other cases is becomes erratic). Also, in one case it has effects on 
suspending (see the report).

On the Internet, there are already reports from other Linux 
distributions noting the issue and the same solution (blacklisting).

Thanks for maintaining & regards,

Chris

