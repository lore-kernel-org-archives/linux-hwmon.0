Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D434C636CC
	for <linux-hwmon@archiver.kernel.org>; Sun, 19 Feb 2023 23:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbjBSXaE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 19 Feb 2023 18:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjBSXaB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 19 Feb 2023 18:30:01 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DCF1ABC6
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Feb 2023 15:30:00 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3091C2C0480;
        Mon, 20 Feb 2023 12:29:56 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1676849396;
        bh=rDK3BBebyu46Dmg/VQZoG+lmTflAkmcVCbipL9rUPLY=;
        h=From:To:Cc:Subject:Date:From;
        b=V+JLnslL1dlFBDIblTOOIYWBh9iwstfbfx54TAqi6Y/lF+h7hbx/3H1x3eIDIunQt
         BeoD9QhOA8sJE8Yg50kOwYwaw7IlCJkNGWmHprtd7CgwGl62oR6uqfnt9bFP787R+g
         5AvSWJQ/qORNhDkDZU4i60ipLe6BCkTB2Jh40GVJmvzb8+DBge/AeEMtcEdtbe4rcq
         kS1adbyUWuyC3zm0dBTskjGUgFYaH1aJ+Y9BI8PKtsxIdeeaN4UNCS7GqzAspaS3X4
         viJqdQddjpAcA+rGEJP9iwTtHPRb701nQ34/rTkHvf/yTFAsdvMTYMxjzzOgZut++Q
         CmQQrmOb/oKiA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B63f2b0f40000>; Mon, 20 Feb 2023 12:29:56 +1300
Received: from tonyo-dl.ws.atlnz.lc (tonyo-dl.ws.atlnz.lc [10.33.12.31])
        by pat.atlnz.lc (Postfix) with ESMTP id 108AE13ED0C;
        Mon, 20 Feb 2023 12:29:56 +1300 (NZDT)
Received: by tonyo-dl.ws.atlnz.lc (Postfix, from userid 1161)
        id 0DF7BA0083; Mon, 20 Feb 2023 12:29:56 +1300 (NZDT)
From:   Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc:     chris.packham@alliedtelesis.co.nz, hdegoede@redhat.com,
        jordan.crouse@amd.com, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (adt7475) Fixes for acoustics and hysteresis
Date:   Mon, 20 Feb 2023 12:29:54 +1300
Message-Id: <20230219232956.23784-1-tony.obrien@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GdlpYjfL c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=m04uMKEZRckA:10 a=lM6UcDNat5HMF8i9s88A:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The patches contained herein fix the ADT7475 driver.  The first fixes
the reading of the Enhanced Acoustics Register 2, and the second fixes th=
e
setting of the hysteresis registers.

Tony O'Brien (2):
  hwmon: (adt7475) Display smoothing attributes in correct order
  hwmon: (adt7475) Fix setting of hysteresis registers

 drivers/hwmon/adt7475.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--=20
2.39.2

