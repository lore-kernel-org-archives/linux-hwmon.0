Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA9FC77B7C
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Apr 2023 23:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbjDRXkP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Apr 2023 19:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbjDRXj6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Apr 2023 19:39:58 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C4D13843
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Apr 2023 16:37:11 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 342D42C053A;
        Wed, 19 Apr 2023 11:37:08 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1681861028;
        bh=SzQiiHYPUR+RgZsSBcwi55KAk1olWQNToXXLoUY6B/M=;
        h=From:To:Cc:Subject:Date:From;
        b=N5RNNuqb7JjdrYoDbCmTRNYj53mwMxwB0SKAI6PxioR9rto0uT+6A8k27zvQEPbxM
         C3cmbhQRLJyJj4t5exRPMsrqhDFqeu7JqcW4LD8syK86o3WRadz6jmdtvbO9Ixh08O
         fykWANBOH3/EsGkZCeCbUbSnGxUq9CjxvxRfrgAEc2O7idO+0CvXaEGxeBnAUi0/Hn
         E5x63FR8Vbe06KZLHbqTJ8OC2U8drEVGpl0Qe6ea8XlpdaRRzhRZnB2YPYwtLTpVc7
         Iugf5wXgwxeJkpIAvlNy94tzZV8L40PNrLKTo3g0g4e98S1Q6cII6mhyJmrWiw/Tdd
         LFjiOA5v1bZKA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B643f29a40000>; Wed, 19 Apr 2023 11:37:08 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id 0246313EDC3;
        Wed, 19 Apr 2023 11:37:08 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 05C29283BBF; Wed, 19 Apr 2023 11:37:08 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net, manio@skyboo.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/2] hwmon: (adt7475) Handle DT unaware platforms
Date:   Wed, 19 Apr 2023 11:36:54 +1200
Message-Id: <20230418233656.869055-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=VfuJw2h9 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=dKHAf1wccvYA:10 a=ncuk2GtSjpeHEJ13v3AA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series addresses an issue reported by Mariusz and has an additional
cleanup for master. The changes are all updating of_property_read* ->
device_property_read* so it should be a noop for DT aware platforms.

Chris Packham (2):
  hwmon: (adt7475) Use device_property APIs when configuring polarity
  hwmon: (adt7475) Convert to use device_property APIs

 drivers/hwmon/adt7475.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

--=20
2.40.0

