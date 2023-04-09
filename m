Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2453DC761A6
	for <linux-hwmon@archiver.kernel.org>; Sun,  9 Apr 2023 03:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjDIDrn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 Apr 2023 23:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjDIDrl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 Apr 2023 23:47:41 -0400
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net [150.101.137.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4345F59EE
        for <linux-hwmon@vger.kernel.org>; Sat,  8 Apr 2023 20:47:39 -0700 (PDT)
IronPort-SDR: 64323557_ut5d/dw8VhBIoCgodl4Y62PAWYlmAUleiyjZMNkGqTSSFDd
 TzgvzACud5L4Yugj9/VJ/oRWvs7DrljCoB3Bg2Q==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2C4AABgNDJkjPQc8jxaHQEBAQEJARIBBQUBSYE1BQELA?=
 =?us-ascii?q?YItgk+Vf59eDwEPAQFEBAEBhQaFPyY3Bg4BAgQBAQEBAwIDAQEBAQEBAwEBB?=
 =?us-ascii?q?gEBAQEBAQYEFAEBAQFARYVoDYYGNgENAQE3ASiBFQGDEIJdrSaBAYIIAQEGg?=
 =?us-ascii?q?mKaaoFeCYFBAYtzgRaDNoE8P4FOhH2LBol5kDYKgTR2gSAOSnOBBAIJAhFrg?=
 =?us-ascii?q?RAIZ4F5QAINZAsOb4FKgyoEAhRkAwkDBwVJQAMLGA0WOhMsNRQgXmwtEhIFA?=
 =?us-ascii?q?wsVKkcECDgGUBECCA8SDyxEDkI3MxMGXAEpCw4RA05BGWwEggcKByYknmBZI?=
 =?us-ascii?q?hOBcT85OsM9hAeBWZ8UTYFGp3yXcyCiEoEYhCwCCgcWgXmBf00fGYMiTwMZD?=
 =?us-ascii?q?4EbjQUZghORUWM9AgcLAQEDCYtFAQE?=
IronPort-PHdr: A9a23:YtkY1xLSAMDXXyB6IdmcuVEyDhhOgF28FgQU9oFhgKhHbaqk5ZikM
 UnCo/RhylbUDs3S8fkRje3Qvuj7XHAYp4yMtXcefdlNT0oLhclMzVMpCcLXBRGkfKyzPX4xF
 p0aBlRupy7TDA==
IronPort-Data: A9a23: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
 psLzxUc5PRqLk1BHo7/PsCGvNo=
IronPort-HdrOrdr: A9a23:tu3rs66bQvvtH56f0gPXwObXdLJyesId70hD6qkQc3ZomwKj9v
 xG+85rsiMd6l4qNU3I/OrtBEDuewK+yXcY2+Ys1NSZLW3bURWTXeNfBOLZqlWKJ8SUzI5gPM
 lbHZSXh7DLfD5HZL7BkWyF+s4bsaO6Gb6T9JzjJqhWPHhXg3AJ1XYANjqm
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl2.internode.on.net with ESMTP; 09 Apr 2023 13:17:36 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 3393lL5B3520033
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 9 Apr 2023 13:47:29 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 3393lL5B3520033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1681012050; bh=P+6kTSSmHbaS7LfTHOXc2+3LYmGxjfPgrusdBr0dbzI=;
        h=From:To:Cc:Subject:Date:From;
        b=TE/AcTX++EASBUpqD0t7c8pVgAFkQRghCog4IluXW9ujjBy35JEgKQnsZs1GXf9k0
         eA4WhIJxW2SZ8AxBxLpw3btiepFDo8D7IJfXYS1owEIlZzcJW0Oz3Ug2+xm9+uGXTh
         Ad/AUBJTOogGcJi141/lhw2WEM92N2NYW7MlvTozuIX4p6SvkgdmY8zk8tZd/6maIC
         84I34wNcGifDvrtVXlRyIKs/uj8nYx+qEoqCj3iDnRAK7e+pKBkhTnwJ710V339lhN
         tJm2oguvTquRPk6QVVlfGgwVWNlOgnkENdrqvs/ldk2TtlEKhDpzVE45CYUj+uUMiy
         z1HnvaBUT1TMw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 0/4] hwmon: (it87) Add access control for SMBus
Date:   Sun,  9 Apr 2023 13:47:14 +1000
Message-Id: <20230409034718.1938695-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 09 Apr 2023 13:47:30 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some chips support Environmental Controller access through SMBus.
On those chips, it is possible that an Embedded Controller accesses
Environmental Controller chip registers at any time. There is no real
means for synchronization. On banked chips, this can and will result in
access errors with unpredictable result.

Disable SMBus access while reading or writing environmental controller
registers to work around the problem.

---
Frank Crawford (4):
  Some chips support Environmental Controller access through SMBus.
    Disable SMBus access while reading or writing environmental
    controller registers.
  Add calls to smbus_enable/smbus_disable as required.
  Test for error in call to it87_update_device and return error.
  Disable/enable SMBus access for IT8622E chipset.

 drivers/hwmon/it87.c | 288 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 240 insertions(+), 48 deletions(-)

-- 
2.39.2

