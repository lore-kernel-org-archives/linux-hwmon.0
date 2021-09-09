Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC7FC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Sep 2021 00:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CC96610E9
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Sep 2021 00:39:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348694AbhIIAku (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Sep 2021 20:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348667AbhIIAku (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Sep 2021 20:40:50 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDE8C061575
        for <linux-hwmon@vger.kernel.org>; Wed,  8 Sep 2021 17:39:41 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id j12so114952ljg.10
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Sep 2021 17:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=UjvvEx6yF1AQxTQG4EMxzKpe7NmWg9PIFU25rfEWiic=;
        b=QuESLzBkI0I7W+bXx20ppjzWBMBzIkBkzdq1nJsR8lKX8RijFBcpSXfKCZh+b0kufk
         2grHI3rf5Tr5NM4FDoWI8hTCBRJjTMgNtp/JoF010f+p5SFuAYmSPaEYEneZZ6hkMd3S
         2EOljyb2MlViWjxzUkJcFiJO+33tZIMwXju4o19Qvt0W2LbLD/0kBaf7V/9ex2WbAf6/
         FZ2Rmqozv1+x+Y8nzGHAN0AG2DNKiYisaMPCprwUrup/QHiI/M+bzGmn5cxgz9l+nr6U
         lApoZl30Hfn1dL90wfbn7qs4la0hyTbf8l7TMTIHdcmDkNw/UmqDo+7moUfv2TbHQJDs
         H1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=UjvvEx6yF1AQxTQG4EMxzKpe7NmWg9PIFU25rfEWiic=;
        b=HAEHS9C5gCSYZlxttdYMh1Hw5F9n4ewlXgW+f1cQYtelGBZYNsPl3S7qBLozZEf12d
         vdCOWWmbp04FPBmMUBNzfhm8c/Ndn6AUxoWZFARwcDXiVryBQE6hWskQjvFWXOAGIdC6
         owgvFPWG5Pc5mkc2C8Gzot9mUTX1igU6awkXjfwK9x2JQoXrU1e606HpnMXMdoZyhfpN
         cs/niQhFWbJEsqUaIlnky4457Ys8+X/3LBXOLmOSp4k/S5ccNAyVSaGJskfaI1w9lE/0
         t4oiEVZ52bfSNx0b+K+X8oornd5EEcEieHGx+C9H1vG2wB8gwx38Lb6oQg2nOPDT+GeO
         GEkA==
X-Gm-Message-State: AOAM533Ajlmh9UjAZMVkJHJlhd/XraGMsrJ1/d25Xqq8sagR9nRVeu4R
        Utxv826ueBQOly5TyCc5sKWMQ6FsVT0JVboWQp7pnCjKR3vqayMh
X-Google-Smtp-Source: ABdhPJzSXE9JReraPdAybDs8Ylf69v0UDsHDuZ4mssnuBVEmzI1XNnLWHMYfLZkGZvfEBx45pCUvO+cSwFAxBTCMvDY=
X-Received: by 2002:a05:651c:1209:: with SMTP id i9mr124299lja.85.1631147978924;
 Wed, 08 Sep 2021 17:39:38 -0700 (PDT)
MIME-Version: 1.0
From:   Oskar Senft <osk@google.com>
Date:   Wed, 8 Sep 2021 20:39:23 -0400
Message-ID: <CABoTLcTEjKYwnFS1dB+-rGCM9BYvFBY1T1_M0OpdjqAy+M8SCQ@mail.gmail.com>
Subject: nct7802 mode selection for RTD1,2,3 via device tree?
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi everyone

We're successfully using the nct7802 driver on a TYAN S7106 mainboard
connected to an Aspeed AST2500 BMC running OpenBMC. However, on this
board the NCT7802Y has 3 thermistors connected. For that to work, we
reconfigured the "Mode Selection Register" (0x22) to have RTD1_MD,
RTD2_MD and RTD3_MD set as 0x2 (Thermistor mode). So far we simply had
a one line patch in our internal kernel repo, but we'd like to
upstream it and make it configurable.

We explicitly reference the nct7802 in our device tree. Example:

&i2c0 {
    status = "okay";

    /* Hardware monitor with temperature sensors */
    nct7802@28 {
        compatible = "nuvoton,nct7802";
        reg = <0x28>;
    };
};

Note that the DTS validator complains about not knowing about
"nuvoton,nct7802". Is that because the driver doesn't specify a
MODULE_DEVICE_TABLE of type "struct of_device_id"? I'd be happy to fix
that, too!

Anyway, I was wondering if there would be a nice way to set the
configuration for RTD1,2,3 from the device tree. I'll be happy to make
the necessary changes (there are plenty of examples), but I wanted to
check with the community and maintainers before going down any such
road.

Thanks
Oskar.
