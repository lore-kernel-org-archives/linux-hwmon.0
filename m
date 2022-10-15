Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F045EC433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Oct 2022 12:07:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiJOMHl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Oct 2022 08:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiJOMHk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Oct 2022 08:07:40 -0400
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 15 Oct 2022 05:07:36 PDT
Received: from ipmail04.adl3.internode.on.net (ipmail04.adl3.internode.on.net [150.101.137.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D08144D4C5
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Oct 2022 05:07:36 -0700 (PDT)
X-SMTP-MATCH: 0
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail04.adl3.internode.on.net with ESMTP; 15 Oct 2022 22:32:04 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 29FC1eWF2725736
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 15 Oct 2022 23:01:59 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 29FC1eWF2725736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1665835320; bh=0VIr4jEG8ZIw/tXyHUVeLftyAMv/mm1yVWW1367ezUY=;
        h=From:To:Cc:Subject:Date:From;
        b=vE2X92KkRgscx0nHTVJfG75TcZwcp82yEQ+jqHmZnGPTgIGp9MprvrkekZD0Ia7d0
         9auTG52ba853i3DRyaf2k19DsHGbc/9mFQMBL/hTKtVyMMXHMSakhgp6I7zhIEjKYV
         ckQggpitAvABXzqiJSc7SkTtpZtqubMygWWX8IefVV0gm6iQ9ehkoUTOGwBu1svvNT
         LR3xBrv2MXWN0g43ppAV/Om4sI53tAJlG+pR1hflwTnoMo9UoRVueU5bcrPr6an4yk
         Hj1CHBpduxXw+jNyWBCUPIqPBbWIEgfH1dLNIPzvOKMtqcRtsV1rFlQtmzO54x8xC0
         Ia6Uk6QUSknsg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH 0/1] hwmon: (it87) Add DMI table
Date:   Sat, 15 Oct 2022 23:01:09 +1100
Message-Id: <20221015120110.1472074-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 15 Oct 2022 23:02:00 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add in DMI matching table to match various board quirks and settings.
This will be useful for future extentions, but will start with the
existing definition of the Shuttle SN68PT.

Frank Crawford (1):
  Create DMI matching table for various board quirks, starting with the
    existing definition for the Shuttle SN68PT.

 drivers/hwmon/it87.c | 57 ++++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 20 deletions(-)

-- 
2.37.3

