Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18593C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jun 2022 06:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbiFGGfa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jun 2022 02:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbiFGGf1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jun 2022 02:35:27 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDD933A16
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Jun 2022 23:35:24 -0700 (PDT)
Received: from fmi6.pf.interia.pl (fmi6.pf.interia.pl [127.0.0.1])
        by poczta.interia.pl (INTERIA.PL) with ESMTP id 8A17FE02EC;
        Tue,  7 Jun 2022 08:35:20 +0200 (CEST)
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Tue,  7 Jun 2022 08:35:19 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        przemyslaw.cencner@nokia.com, krzysztof.adamski@nokia.com,
        alexander.sverdlin@nokia.com, sst@poczta.fm,
        slawomir.stepien@nokia.com
Subject: [PATCH v2 0/2] Extend the device-tree binding for lm90
Date:   Tue,  7 Jun 2022 08:35:02 +0200
Message-Id: <20220607063504.1287855-1-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1654583721;
        bh=kM2QFFkUki9VpAjiEW9TaYSm6Lecy8hjKfz8+lFbeR0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=h0LLpbFjPLL6v+hmgpFGwndCepx7SSd2IskRJoNPqBv/fK8lvx4/m3hfnQrY+rtW9
         cxP4Tr+CCrXo+Wkg9CdN2JvpPymGkDcCtDfYhfUhiwnyuxyMFEtvAhllJwERmad9nb
         YXlCFL6HGVFkSSGxTZBwk/6LJvlLrbesCA7cQ62s=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

This series extends the device-tree binding for lm90.
Support for channel's temperature offset has been added.

In lm90.c support for 2nd remote channel's temperature offset has been added (it is useful for
ADT7481 device) along side the needed changes for new bindings.

Note: this series has been rebased on hwmon/hwmon-next.

Version 2:
* Only patches that were not applied from v1 are here.
* PATCH 1/2 - updated, changelog in patch.
* PATCH 2/2 - updated, changelog in patch.

Slawomir Stepien (2):
      hwmon: (lm90) Add support for 2nd remote channel's offset register
      hwmon: (lm90) Read the channel's temperature offset from device-tree

 drivers/hwmon/lm90.c       | 74 ++++++++++++++++++++++++++++++++++++++++------
 drivers/hwmon/occ/p9_sbe.c |  6 ++--
 2 files changed, 67 insertions(+), 13 deletions(-)


