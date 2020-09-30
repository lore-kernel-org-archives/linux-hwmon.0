Return-Path: <SRS0=ye16=DH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8149AC4727F
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Sep 2020 09:26:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E29E20739
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Sep 2020 09:26:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="SE54HyHR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgI3J0C (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Sep 2020 05:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgI3J0B (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Sep 2020 05:26:01 -0400
X-Greylist: delayed 1871 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 30 Sep 2020 02:26:01 PDT
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B3AC061755
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Sep 2020 02:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=09/eolyAro4rdE4w1vE9Z4d+w7d4QeJChX/e6QTQN2Q=; b=SE54HyHRrki3D14lwgVXAreWdq
        00MOP0L6sN3SwciG0hsRFK4LQaofndq1CvwhTQg+OCQiuMP7soljPHjmued98c237nRTu1LxLqaPj
        WvX/+Zx2XWhekQ1g8NWC7rSscZJmrI0gDzXyhnEkG5gKEJh4UIulTBBWHSsm+CqYJglw=;
Received: from p200300ccff0790001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff07:9000:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1kNXsp-0005gH-GT; Wed, 30 Sep 2020 10:54:43 +0200
Date:   Wed, 30 Sep 2020 10:54:42 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     rydberg@bitmath.org, jdelvare@suse.com, linux@roeck-us.net,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [REGRESSION] hwmon: (applesmc) avoid overlong udelay()
Message-ID: <20200930105442.3f642f6c@aktux>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

after the $subject patch I get lots of errors like this:
[  120.378614] applesmc: send_byte(0x00, 0x0300) fail: 0x40
[  120.378621] applesmc: LKSB: write data fail
[  120.512782] applesmc: send_byte(0x00, 0x0300) fail: 0x40
[  120.512787] applesmc: LKSB: write data fail

CPU sticks at low speed and no fan is turning on.
Reverting this patch on top of 5.9-rc6 solves this problem.

Some information from dmidecode:

Base Board Information
        Manufacturer: Apple Inc.
        Product Name: Mac-7DF21CB3ED6977E5
        Version: MacBookAir6,2
=20
Handle 0x0020, DMI type 11, 5 bytes OEM Strings         String 1: Apple ROM=
 Version.  Model:       =E2=80=A6,=20
Handle 0x0020, DMI type 11, 5 bytes
OEM Strings
        String 1: Apple ROM Version.  Model:        MBA61.  EFI Version:  1=
22.0.0
        String 2: .0.0.  Built by:     root@saumon.  Date:         Wed Jun =
10 18:
        String 3: 10:36 PDT 2020.  Revision:     122 (B&I).  ROM Version:  =
F000_B
        String 4: 00.  Build Type:   Official Build, Release.  Compiler:   =
  Appl
        String 5: e clang version 3.0 (tags/Apple/clang-211.10.1) (based on=
 LLVM
        String 6: 3.0svn).
=20
Writing to things in /sys/devices/platform/applesmc.768 gives also the
said errors.
But writing 1 to fan1_maunal and 5000 to fan1_output turns the fan on
despite error messages.

Config used is: https://misc.andi.de1.cc/mac-config.gz

Regards,
Andreas
