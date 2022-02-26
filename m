Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BF5C433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 26 Feb 2022 10:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbiBZKsT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 26 Feb 2022 05:48:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiBZKsS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Feb 2022 05:48:18 -0500
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 877A55B888
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Feb 2022 02:47:42 -0800 (PST)
X-SMTP-MATCH: 0
IronPort-Data: =?us-ascii?q?A9a23=3Apx1Zbqn0MpDJPvstfshef1Lo5gxIJERdPkR7X?=
 =?us-ascii?q?Q2eYbSJt1+Wr1GztxIZD2qCPPaPMDP8KI8jbY21ox4DsMeBxoVjGVNpry89Q?=
 =?us-ascii?q?i8a+ZaUVIiQJU6uYHmbdMGaEU5u5JVDOtKQds1uEXWEjxr8abKJQVtUjPHQH?=
 =?us-ascii?q?OCgYALn1oGdfeLXIcsYoUoLd9MR2+aEv/DpW2thhvuqyyHvEAfNNw9cagr42?=
 =?us-ascii?q?YrawP9clKyaVAcjg7ALTasjUGkyNpUiJMl3yamZdxMUS2TPdwKwb76rILqRp?=
 =?us-ascii?q?gs18/qxY+5JnIoXcmVSKlLTFQKPlmEQULKrnRZFvCB036MmcvsQL05K49mLt?=
 =?us-ascii?q?44pjo8R79rqGUFzYvGkdOc1CnG0FwlwJ6RA+5fMO3Ggv8uJwwvLdmaqwvkoB?=
 =?us-ascii?q?Vxe0YgwoLYoWT8XpKZGQNwKRkvb3LLsmuPTpvNXrsAiKtT7eYMAv3Zm5S/WA?=
 =?us-ascii?q?OxgQp3ZRajOo9hC018NampmdRrFT5RBLGAzNlGaM1gVZgtRE443gOajwGXnf?=
 =?us-ascii?q?Dweo1WQ46Mqi1U/BTdZiNDFWOc5sPTTLSmNonulmw=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AsFDf9qqEhHsOKyEfSWef0yoaV5oWeYIsim?=
 =?us-ascii?q?QD101hICG9Ffbo9fxG/c576faaslgssR0b9exoW5PwIk80l6Qe3WB5B97LNz?=
 =?us-ascii?q?UO01HEEGgN1+TfKnHbexEXeYNmpMIQF5SWEOeAdWSSk/yKmTVQzOxQp+VuIc?=
 =?us-ascii?q?iT9IHj80s=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DABACtBBpi//Qc8jxagQkJhHeGKa9?=
 =?us-ascii?q?xCwFCEAQBAYkaJjgTAQIEFQEBBgEBAQEBBgSBHIVoDYZscRoCJgKDd4Mlr0G?=
 =?us-ascii?q?BMYEBg08BgRyDK4FeBoEQLIczh1Q/gU6EDzA+gQWBXgKCLYJLgmUElWCBECK?=
 =?us-ascii?q?CG6FjnnGDUoE/iUiVFIFCgh+DI6EhhxePO4pGgkyUS4cQgX5NHxk7gmpQGQ+?=
 =?us-ascii?q?ON4NbinKBGQIGCwEBAwmTDQEB?=
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 26 Feb 2022 21:17:42 +1030
Received: from sac.crawford.emu.id.au (sac.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc02])
        by bits.crawford.emu.id.au (8.17.1/8.16.1) with ESMTP id 21QAlPOh036177;
        Sat, 26 Feb 2022 21:47:25 +1100
Message-ID: <8a3732f6e76dc3abf9fc90b36cb847794d03d653.camel@crawford.emu.id.au>
Subject: Re: New hardware support - ITE IT8689
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     linux-hwmon@vger.kernel.org
Date:   Sat, 26 Feb 2022 21:47:25 +1100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Greylist: inspected by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 26 Feb 2022 21:47:25 +1100 (AEDT) for IP:'fdd2:7aad:d478:1::cb10:cc02' DOMAIN:'sac.crawford.emu.id.au' HELO:'sac.crawford.emu.id.au' FROM:'frank@crawford.emu.id.au' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 26 Feb 2022 21:47:25 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Pozdrawiam,

I've only just joined this list, so didn't see your request previously,
but contact me about monitoring an IT8689, as I have that in the set I'm
trying to get into the kernel, or you can test yourself if you grab it
from my git repo https://github.com/frankcrawford/it87

Note that as Guenter says, this is all from testing and guessing, and
there is the possibility that it may cause stability issues, although I
haven't seen any in my use.

Regards
Frank
