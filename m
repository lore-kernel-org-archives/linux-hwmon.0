Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC49AC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Mar 2022 23:41:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349101AbiCPXnF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 16 Mar 2022 19:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351439AbiCPXnD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Mar 2022 19:43:03 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61A71A832
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Mar 2022 16:41:46 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id EC0252C082B;
        Wed, 16 Mar 2022 23:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1647474103;
        bh=q1zQy4dxcm7f5Y+SuIYAFb4zrm2UtZwA5QnElXfnssg=;
        h=From:To:Cc:Subject:Date:From;
        b=lwCfTRJVGRYQ4N5kgwDk4maKz/MRd9eR++E8TYa+XPlhA8PATYKtZ+qYFpsFiymrN
         qjq3/tHCgoLFnPqW8rlyYm68COcbwDs8si/Y3WeZlqac4RHfJA8SV52GGapz0FGEe5
         QqOAcpBee8VgYqbXCmFzVV77uyYD0FTfdVeZFUSYTImOrIr2y2UbWhP4uhvXK2h6vQ
         Pm0gbFeNl76wVUgUl1OsaJxXTi1A7pNEaQAwsRx1Zj1yUlom/lBJcuQ6g2J4kPu065
         jVK6jFUYCAYe6x9VdwBvsfC/7luOy98X67HtimZ9EBMv0NZ9LHqN6JMroBVYcdHjIK
         tnumnhCFufnfg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B623275b70000>; Thu, 17 Mar 2022 12:41:43 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id BA03E13EE36;
        Thu, 17 Mar 2022 12:41:43 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 452AA2A2679; Thu, 17 Mar 2022 12:41:41 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] hwmon: (adt7475) pin configuration
Date:   Thu, 17 Mar 2022 12:41:32 +1300
Message-Id: <20220316234134.290492-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=Cfh2G4jl c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=o8Y5sQTvuykA:10 a=_3ioNcgKDktiekeMNxwA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series adds support for configuring the ADT7475 based on the
hardware description provided. The ADT7475 driver has always supported
detecting the configuration. This adds support for configuring the chip
based on the hardware design.

Chris Packham (2):
  dt-bindings: hwmon: Document adt7475 pin-function properties
  hwmon: (adt7475) Add support for pin configuration

 .../devicetree/bindings/hwmon/adt7475.yaml    | 22 +++++
 drivers/hwmon/adt7475.c                       | 95 +++++++++++++++++++
 2 files changed, 117 insertions(+)

--=20
2.35.1

