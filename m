Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DDFECAAD4
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Sep 2022 09:33:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbiIDJd3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 4 Sep 2022 05:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiIDJd1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 4 Sep 2022 05:33:27 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0CD3FA38
        for <linux-hwmon@vger.kernel.org>; Sun,  4 Sep 2022 02:33:26 -0700 (PDT)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1oUm0L-0008Nv-3P; Sun, 04 Sep 2022 11:33:25 +0200
Message-ID: <413fa1b3-4243-aee6-da65-d7a0d0aaa6c5@leemhuis.info>
Date:   Sun, 4 Sep 2022 11:33:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US, de-DE
To:     regressions@lists.linux.dev
Cc:     linux-hwmon@vger.kernel.org
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other
 distributions #forregzbot
In-Reply-To: <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1662284006;76e20a27;
X-HE-SMSGID: 1oUm0L-0008Nv-3P
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 03.09.22 13:00, Christopher Klooz wrote:
> Hi Eugene,
> 
> Currently, we have user reports of at least 4 Fedora installations that
> have issues with asus_ec_sensors since 5.19.4. They remain in 5.19.6.
> 
> All issues can be solved by blacklisting asus_ec_sensors.
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2121844
> 
> The bugzilla report contains kernel logs of two machines, one with
> nvidia-driver and one without a tainted kernel.
> 
> The report and the contained ask.fedora link contain some elaborations
> of how the issue manifests at the users' machines. The major issue is a
> wrong output of battery power percentage (in one case it gets stuck, in
> the other cases is becomes erratic). Also, in one case it has effects on
> suspending (see the report).
> 
> On the Internet, there are already reports from other Linux
> distributions noting the issue and the same solution (blacklisting).
> 
> Thanks for maintaining & regards,

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot introduced 5cd29012028d ^
https://bugzilla.redhat.com/show_bug.cgi?id=2121844
#regzbot title asus_ec_sensors: causes misbehaviour; likely dup of
https://bugzilla.kernel.org/show_bug.cgi?id=216412
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
