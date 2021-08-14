Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AD4C4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:39:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FB1260F4B
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:39:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238636AbhHNOje (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 10:39:34 -0400
Received: from mout.gmx.net ([212.227.17.21]:57725 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238512AbhHNOje (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 10:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628951928;
        bh=0hAgUrrIhLwmu5grPy0VZ03MBr2LW8otmlv5TNZqkX0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=kZdMU9Ri6nGvoE8tgxaOvrFc6s1uw8TORL2GoyfIAGdu/ptJoK1M0zZNi4ygObqzA
         2L/Zk22KrhU22blNpH67GzIFhztdl2/93xVM1R0W8xeBRzwyYqhCNwuTBoS7IyTYSU
         KO29tmflhps4goKw8xqE/xVgEaP8u5krj+AmAD3s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.96.234]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4JmT-1mEdh32Me9-000ISv; Sat, 14
 Aug 2021 16:38:48 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 0/4] hwmon: (dell-smm) Misc cleanups
Date:   Sat, 14 Aug 2021 16:36:33 +0200
Message-Id: <20210814143637.11922-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xELrVyzjDhjYNa7PC98LrUdTQZGr3t0gnQVVBeo9mEPP792k5Xv
 Rc0y4H949K+61AAFy9HLvghN/bFmhHgr0KpPBzEfJj0xFuus5QDgeB+J4Q6TeVdhrFBETOw
 OQ5uEf/G1pP5qrwo8GgPaxA804kZCVPAkZvcZ5B0rcofA/YifayZ8eioNnKtU6MaSoMD4SQ
 ISS7jLb3+I24v9hhHSXnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:e5Y+FLyQtZU=:9P83siCiHWHW69urEw3BtY
 hc+pZ7jlaltfgUnHyJLdiq+z+NZB0f5e7qXXmTsd0S6sA889Wj3BczXkSjL0aARq8YoiuO1La
 /Yn79lc/tvvemYeHy9M6GFzO91WDufzloxyc8+h1j8kMVjt3AQ6DkKpWe7DdzI6QqIshxNgUu
 4CbZNBWxSW5rfMkMVFUCkaIfImsFUM5YKPTglcxNaqwKHm6xPcLOEFIkJY3nT9SmTmsSPr/RI
 LccQZYGc/LtkldGQax/aULvEEt8dpheDvPIDvqvdfuTMN359LEChHIpqExqvu31KDoxi1X1re
 FDNXv237yaqI5PpRKfDVHdYj+1B+fP/EFxsSvozGaYJ9XkwLeDju1wfW+NkL5oc89VNgBWafd
 SprJk9AdTEeA00zjVL/4io9K/dcBAcrBYVQ9dyjg2UhWcHCWndkvv3VN45ZWcJQq0kwuaj6XN
 bSijKxMF/N0tFNzEXvxvUvb3PMrx1Ikyp1LSPJYY3J942BgE7mNvGnqyT/ntWk1CCILmACbSR
 wF5/xzKf5h7kvM3g30f4ZiVbou5TF6YegBcev+gfhLmgfK+H0scezm0eUi4q8bqV+wafCn2n5
 QupCRq8XbU2vH71AWGZzCArnzpYaKN8ZhpFKb41WXpr0Tb90PSNGZ/U9gq15pZJtzgiCJpkWe
 Vdf1iq6xvMA72gzAbrprkd/MiB5NU28+EVeL7XZpIRabKjP5ClXYeBE00d5vYqrUVAb13E9Rj
 38fLc2HLlA+fEYI/e3I29YekrMdbFIICEMJoK5lhxsrzqsCm73jmoN21I83xIZzawLzWd98MO
 fIicveXrGA/V9s8xa73Nsr+D6JxuRJ8BuJJND++3GtgiqdMP2j6EZzzGzKzqOmQTFoPNsqXIP
 MnowDn/agpmZdo21+MkrREBha25C0kgMCRi6N9cKQ0BHvWcBILJ/wTWI5qHARzU58UbChUT32
 S3XW86/6k5P6YBarFuc9hPBlSJT+PgiAbQCSCm2zrI0R7Ywd4HLcJXVFw9gA+atbExxzEC/LH
 ahV4GvfgfozqHICR/rqp9nww2EcASc2RxXihxQrayVikmYLV6SevTbm3f1whhsePdHtXtYbyO
 W+p97HL7Sgflvie68ilpQ470LFcBqrgwmbK
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

This patch series contains several small cleanups
for the dell-smm-hwmon driver.

While also improving the smm function debugging,
the only change noticable to userspace is
the 3rd patch.

All patches have been tested on a Dell Latitude C600.

Armin Wolf (4):
  hwmon: (dell-smm) Mark tables as __initconst
  hwmon: (dell-smm) Rework SMM function debugging
  hwmon: (dell-smm) Enable automatic fan speed control for all channels
  hwmon: (dell-smm) Mark i8k_get_fan_nominal_speed as __init

 Documentation/hwmon/dell-smm-hwmon.rst | 14 ++++-----
 drivers/hwmon/dell-smm-hwmon.c         | 40 +++++++++++---------------
 2 files changed, 24 insertions(+), 30 deletions(-)

=2D-
2.20.1

