Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3029C38142
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Jan 2023 06:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbjA1GEJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Jan 2023 01:04:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjA1GEH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Jan 2023 01:04:07 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3EC577C321
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Jan 2023 22:04:02 -0800 (PST)
IronPort-SDR: 52Y0XfOo5RHsVxazjXy3q8wwQJTwE+ux64TV304HwrpcM/Sjy9z74e9d9kJtmhU93c5V/rh3Ux
 C9xcjDoeRFe/LCq5PW1tuYJd4Hkhe94HOH74KRLWP7hfu1wU9TrgzTgdbORtsuflyaOsYoS90F
 m6CRpmGtUxJpvGP3DVs2BrG/rF+UVueMrmdDDPMRYNeeN13nHhAwqFFt7PAAjcBAEPf+sFovHG
 o2wrCiUYgypzZTT25c50mE1UCa/rhwMM0mmEFFmRoKhCzk2JgEVgxNOnoCJDCnMeMmZj9uThTC
 J47YbAo3bS+6hjE7XeBbLr7E
X-SMTP-MATCH: 0
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 28 Jan 2023 16:33:31 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30S63Ch82973396
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 28 Jan 2023 17:03:22 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30S63Ch82973396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674885803; bh=nc7AyFHXG2PGI/0dHa/FrmGKhTNpiwYijiW34AzVX9c=;
        h=From:To:Cc:Subject:Date:From;
        b=DtPEHcOdWZpmb/8rp0sVqIzD4O5x7WPfqNqPRmUQT4LC8FxFWgbx+YlZ9fMtH35gq
         Ol71wGyFh9An3RvF336vCohB15e+qrYIDi4F2jFD/xG8jQk2RAHNBBtX4s4TZ/1Ews
         4s7Bo2z9qRK8OjwgH+g6xL1mtHdyuUXpKY4YENiz5YrEIQnnXQw+WYosVVZ+yVR3wA
         LcCBKdfoELEbdRWLV2M08kn4bGH1z9yegNrBd6m6u6cgNNxo1sGMQ8JeQjBBKECOfG
         1ZyNKzToulTQ7WUyN2OmAelJ4kxr+QM9iMN8ApBXjUbbDlGvYlagk/D4U/DRI2DmE0
         NRoJvV4fgPa/g==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v3 0/7] hwmon: (it87) Complete handling multi-chip configuration
Date:   Sat, 28 Jan 2023 17:03:01 +1100
Message-Id: <20230128060308.1549707-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 28 Jan 2023 17:03:23 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Further support of multiple chips on a motherboard to disable
exiting configuration mode, including updating existing chips and adding
new chips that match.

Allow setting multiple chip IDs for testing, and correct listed chip
names and IDs, when required.

Update the system documentation.

---

Changes since v2:
 * Correct possible uninitialised pointer issue.

Changes since v1:
 * Convert to use feature flag and related macros rather than a separate
   field, as suggested in review.
 * Reverse sense of flag in superio_exit to simplify feature macro.
 * Improved chip description following review.

Frank Crawford (7):
  hwmon: (it87) Allow disabling exiting of configuration mode
  hwmon: (it87) Disable configuration exit for certain chips
  hwmon: (it87) List full chip model name
  hwmon: (it87) Add chip_id in some info message
  hwmon: (it87) Allow multiple chip IDs for force_id
  hwmon: (it87) Add new chipset IT87952E
  hwmon: (it87) Updated documentation for recent updates to it87

 Documentation/hwmon/it87.rst |  47 ++++++++++++--
 drivers/hwmon/it87.c         | 119 ++++++++++++++++++++++-------------
 2 files changed, 117 insertions(+), 49 deletions(-)

-- 
2.39.1

