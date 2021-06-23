Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD74C2B9F4
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 00:21:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 715D4600CD
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 00:21:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhFWAXX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Jun 2021 20:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbhFWAXW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Jun 2021 20:23:22 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71EFDC061574
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Jun 2021 17:21:06 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4DE13891B0;
        Wed, 23 Jun 2021 12:21:01 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1624407661;
        bh=FtxX17e9/52rfQNOmEuTSm7vQJjFtGwG5oLmILrvfWw=;
        h=From:To:Cc:Subject:Date;
        b=iO6Ux74zv5dT3YRhDeWDDBcyh98lILw87kxLedmSnY+3Yjb0whJ3/l1q1UR+n2fe+
         QfUwyu3UhcDZqlwzyP7gESGNPu9YyypkWtHINvFX8wY/DmTeAPCr2ZmVSnpgSejQQs
         Fjy06S9uGyc2yb20SDPpL5/RLtY/sA/dqi6IlPB1D5B525+ZJC6W7E8l3M/pi4E7Xn
         tHx+gJr7sJiuBAf4+tgUfb4yYsvWtqO3QpvMTznR0ieENJdmXn8KhXmt/LCeUFoLfJ
         fO072D8cKVmfGVEyrhNNYULxsIZHTPamGqzJI9BxLkiHFoi4xOpGgiqbvpvGFFjVdt
         9TPvzqBjeROkg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60d27e6d0000>; Wed, 23 Jun 2021 12:21:01 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id 2F79F13EE59;
        Wed, 23 Jun 2021 12:21:01 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 2B5CC28397C; Wed, 23 Jun 2021 12:21:01 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] hwmon: (adt7470) Clean up
Date:   Wed, 23 Jun 2021 12:20:56 +1200
Message-Id: <20210623002058.3133-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=IOh89TnG c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=r6YtysWOX24A:10 a=eydtoQEJPQk_bK1cFrsA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This does some cleanup of the adt7470. The major benefit is the added err=
or
handling. The volume of code decreases a little but it's kind of a wash b=
etween
the removal of attribute handling code vs the addition of code to drive t=
he
hwmon core.

Chris Packham (2):
  hwmon: (adt7470) Convert to devm_hwmon_device_register_with_info API
  hwmon: (adt7470) Use standard update_interval property

 drivers/hwmon/adt7470.c | 1146 +++++++++++++++++++--------------------
 1 file changed, 550 insertions(+), 596 deletions(-)

--=20
2.32.0

