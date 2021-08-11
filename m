Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3292FC4320A
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Aug 2021 04:18:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B1F360F11
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Aug 2021 04:18:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233436AbhHKESK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Aug 2021 00:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233351AbhHKESK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Aug 2021 00:18:10 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F815C0613D3
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Aug 2021 21:17:47 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A0DA8806AC;
        Wed, 11 Aug 2021 16:17:42 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1628655462;
        bh=bFIwFgPZTWno3sKE4bEbi+ZnJW3J5TE+GC1coFxyLYI=;
        h=From:To:Cc:Subject:Date;
        b=roP1rB7uTaabgCkGNpNseCUAV+1oF02ShWYT+EJfD9h8CZ1E1ATgqCATn3I7GBTUM
         5rrT91W2KJeu5bL8Xj0+J5TRIgqvyJo/MYaOcJMmud2DL3T13vYPpQDagX8UqM8Dzp
         evC9iB9R/Y/a/iEp3oikdO9BDbKpn5rUt9qzvN48yd7pYJii/BSI5bglVwdTCazZKu
         WYcURZ7AlOOzCKHhMCKttQXY8GhCpe0Pk3gmpRNYsqPUo6G8YBVxGEAGUUGipwqdHa
         9WL92rm8TIZjaQso+LhC9r1xcrV6P0ninNk4dbsmDmd+zZlEb1u4KoO5A2HuoOEX8I
         r8MRPKZ9QAIzw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B61134f660000>; Wed, 11 Aug 2021 16:17:42 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id 6332C13EEBA;
        Wed, 11 Aug 2021 16:17:42 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 5F6AD280E9D; Wed, 11 Aug 2021 16:17:42 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] hwmon: (pmbus/bpa-rs600) cleanup and workaround
Date:   Wed, 11 Aug 2021 16:17:36 +1200
Message-Id: <20210811041738.15061-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=aqTM9hRV c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=MhDmnRu9jo8A:10 a=VwQbUJbxAAAA:8 a=rgRPi9HOQUPSZn2HmNcA:9 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series builds on top of the BPD-RS600 support[1] which is in Guenter=
's
tree by hasn't made it to Linus' yet. They might actually cleanly apply w=
ithout
it since they touch different parts of the file.

[1] - https://lore.kernel.org/linux-hwmon/20210708220618.23576-1-chris.pa=
ckham@alliedtelesis.co.nz/

Chris Packham (2):
  hwmon: (pmbus/bpa-rs600) Remove duplicate defininitions
  hwmon: (pmbus/bpa-rs600) Add workaround for incorrect Pin max

 drivers/hwmon/pmbus/bpa-rs600.c | 44 ++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 17 deletions(-)

--=20
2.32.0

