Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8BBC433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 26 Feb 2022 10:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbiBZKon (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 26 Feb 2022 05:44:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbiBZKon (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Feb 2022 05:44:43 -0500
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 26 Feb 2022 02:44:07 PST
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3333029752F
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Feb 2022 02:44:05 -0800 (PST)
X-SMTP-MATCH: 0
IronPort-Data: =?us-ascii?q?A9a23=3AoHlSn6zfuS+sAItPbgZ6t+f+xCrEfRIJ4+Muj?=
 =?us-ascii?q?C+fZmUNrF6WrkVTxzBKWzyGOf6CYDDyL4hzaYrjpEMH6p7XxtZmTAQ4/iExE?=
 =?us-ascii?q?CIQopTMVY+TdheuZC3OIJSbR0lrv51FMNXJfc5pZ3KN/R3F3prJ9Ckkj/vUL?=
 =?us-ascii?q?lbf5E8oAs3CLONdYH9JZS9LwobVvKY42bBVPCvV0T/Ci5W31G6Ng1aYAEpNg?=
 =?us-ascii?q?06wgEsHUMDJhd8tlgdWicanHbPpvyJ94Jo3fcldJpZjK2VeNrbSq+3rlNlV8?=
 =?us-ascii?q?o5FlirBBO9Jkp6jGqELarTTIRPIgWBfRKalmBQEqykvlKc3cvMBAatVo2vR2?=
 =?us-ascii?q?YotkpMX5drqFVtB0q7kwYzxVzFWCSh4PoVN4rbYL3+lvYqeylCAcneqyugG4?=
 =?us-ascii?q?EQeZ91HorguXj8fnRAfAGtVNUDZ3bPeLKiAYu1tgNkzacn0OYQZkm9vwCufD?=
 =?us-ascii?q?vs8R53HBaLQ6rdlMJ0Y7ixVNaiGIpBFM381PFGaP0EJIUseFJM12vuwiXi5e?=
 =?us-ascii?q?Dpd7luIzZfbKlP7lGRZuIUB+vKMEjBSefhoow=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A7+dsUa85GXzbysLo93puk+DlI+orL9Y04l?=
 =?us-ascii?q?Q7vn2ZLiYlEPBw9vrOoB1173HJYVoqNE3I+urwW5VoI0m3yXcd2+B4VotKNz?=
 =?us-ascii?q?OKhILHFu5fBMfZowEJlEDFh4stsZuIa5IOcOEYE2IK9PoSPzPIdOrJEbG8gc?=
 =?us-ascii?q?aVuds=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CxAwA4Ahpi//Qc8jxagQkJgVGBeod?=
 =?us-ascii?q?VrXWBfAsBUgQBAYR9hB0mNQgOAQIEFQEBBgEBAQEBBgSBHIV1hmyBCwImArZ?=
 =?us-ascii?q?qgTGBAYRsgyuBZIEQLIczh1Q/gU6EP4VQgkuCZQSUPoM3B4ExoWOecYNSgT+?=
 =?us-ascii?q?eXIFCgh8BEaQyllKCSaAJhgUBghNNHxmDJVAZD50EgRkCBgsBAQMJkw0BAQ?=
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 26 Feb 2022 21:09:01 +1030
Received: from sac.crawford.emu.id.au (sac.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc02])
        by bits.crawford.emu.id.au (8.17.1/8.16.1) with ESMTP id 21QAcod9034648;
        Sat, 26 Feb 2022 21:38:52 +1100
Message-ID: <6c8b5fbd514df708af84630544eca6ee12766bbd.camel@crawford.emu.id.au>
Subject: Reviving Support for it87.c
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     linux-hwmon@vger.kernel.org
Date:   Sat, 26 Feb 2022 21:38:50 +1100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Greylist: inspected by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 26 Feb 2022 21:38:52 +1100 (AEDT) for IP:'fdd2:7aad:d478:1::cb10:cc02' DOMAIN:'sac.crawford.emu.id.au' HELO:'sac.crawford.emu.id.au' FROM:'frank@crawford.emu.id.au' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 26 Feb 2022 21:38:52 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Folks,

For sometime there has been no activity to update the it87 module, but
for I've been collecting the various suggested patches and I've tested a
number of them and am keen get these into the official kernel.

In fact the biggest set of patches are the set that seems to have come
from here in late 2016 but never seems to have made it into the official
kernel.

How can I go about getting this moving again?

Regards
Frank
