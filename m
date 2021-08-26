Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1130CC432BE
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 02:41:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBAB56109F
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 02:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237387AbhHZCmb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Aug 2021 22:42:31 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:38950 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236087AbhHZCm0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Aug 2021 22:42:26 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1F3BF806A8;
        Thu, 26 Aug 2021 14:41:24 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1629945684;
        bh=fOmf7CJXiXYD7EDNm12Rq3UkJz4Ppfnqu5WYJLZyT1k=;
        h=From:To:Cc:Subject:Date;
        b=GzOh802nOTYT6GlwMTt32xDK90DTbfuC+LgATGeg0EqZb/yM8z+RPVp7XcjA3FFi1
         lDWQHveEZNBtZBswoEGkyCsltOi1XpciL/epFZ3BWwFvYxk9f4mpOmZPGTzBctyRWF
         LL5RKKL+RzBlFf7sOGYIcM/vEX9l4GqNnNbjBiYja44o4GyuJuh6jZefndniSG6Vka
         vSbPOs4cw936BBAVOe67sIDqx7xHkOiUUfqcmYAUeiWfHaCfFpQ3LO6IfliJTvsbiJ
         umoclaJf2Sze7noUvx+DxTXTHBTaMKLI6H4/698NqSgbEPurc4XBPa8+zHZF+NyhZ4
         cl1TAbla1/h/w==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6126ff530000>; Thu, 26 Aug 2021 14:41:23 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id ED7BC13ED4A;
        Thu, 26 Aug 2021 14:41:23 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id E9032284585; Thu, 26 Aug 2021 14:41:23 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/4] hwmon: (adt7470) Clean up
Date:   Thu, 26 Aug 2021 14:41:17 +1200
Message-Id: <20210826024121.15665-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=aqTM9hRV c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=MhDmnRu9jo8A:10 a=eydtoQEJPQk_bK1cFrsA:9
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

Chris Packham (4):
  hwmon: (adt7470) Fix some style issues
  hwmon: (adt7470) Convert to use regmap
  hwmon: (adt7470) Convert to devm_hwmon_device_register_with_info API
  hwmon: (adt7470) Use standard update_interval property

 drivers/hwmon/adt7470.c | 1133 +++++++++++++++++++--------------------
 1 file changed, 552 insertions(+), 581 deletions(-)

--=20
2.32.0

