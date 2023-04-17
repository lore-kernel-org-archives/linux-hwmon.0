Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024EDC77B72
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 Apr 2023 11:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjDQL2b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 Apr 2023 07:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjDQL2a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Apr 2023 07:28:30 -0400
X-Greylist: delayed 3389 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 17 Apr 2023 04:27:39 PDT
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CB4BB
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Apr 2023 04:27:38 -0700 (PDT)
Received: by shakotay.alphanet.ch (Postfix, from userid 33)
        id 2CB5E1240A19; Mon, 17 Apr 2023 12:29:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
        t=1681727381; bh=tGVabKiTyLNLcpqRbvLRD8w8Mz8MUvsELSvZxVBR3ag=;
        h=Subject:From:Reply-To:In-Reply-To:References:CC:Date:From;
        b=Q4JhiZxYOQKE7ORfd1XUmu7U8rz2uOUu9Tp0r5ttXN/QfWtiF9Q6pOfqNka0kcx2S
         s7+JkF/obGUI5A3jAUgFihZuZzU9dEGf2SgTFYVeAsOz0ddFj0/coGG8ZK6QAmF4af
         urvxS9J/IVsl1y0X8oJDzyoR3+qn464xX9hWL1jyXKPLXAlOzqlFKcrSKFlNudWEwU
         SPZdgYNKjI1qGNtWhwdoMgPoxc21gMPmECGHMkZC3ePTFux/fN6BoVPu+Td9dHfTO3
         CzV1BUttvr3Kbuu+1QgX+5l6UXaFLfwm47vbig70aHgDJhD5WI0pSdRGdM9zEDvr4L
         mJzgTAaBkENXw==
Subject: [rt.alphanet.ch #1198] bullseye apu2 sensor fail power (FIXED)
From:   "Marc SCHAEFER via RT" <rt@alphanet.ch>
Reply-To: rt@alphanet.ch
In-Reply-To: <rt-4.4.3-2+deb10u2-22784-1666105012-1929.1198-6-0@alphanet.ch>
References: <RT-Ticket-1198@alphanet.ch>
 <20221018145600.GA7483@alphanet.ch>
 <rt-4.4.3-2+deb10u2-22784-1666105012-1929.1198-6-0@alphanet.ch>
Message-ID: <rt-4.4.3-2+deb10u2-8364-1681727380-114.1198-6-0@alphanet.ch>
X-RT-Loop-Prevention: rt.alphanet.ch
X-RT-Ticket: rt.alphanet.ch #1198
X-Managed-BY: RT 4.4.3-2+deb10u2 (http://www.bestpractical.com/rt/)
X-RT-Originator: schaefer@alphanet.ch
CC:     adomjan@horus.ch, aurel32@debian.org, support@pcengines.ch,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-RT-Original-Encoding: utf-8
Date:   Mon, 17 Apr 2023 12:29:41 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Aurelien,

Remember this bug with bullseye and power sensors on the apu2 platform on
idle?

It is fixed with the latest firmware from pcengines.ch (apu2_v4.17.0.3.rom). 
Funnily it never appeared on Debian buster nor older releases, only on Debian
bullseye (actually it happened with kernel 5 only).

The good news it is fixed.

root@fake-router:~# while :; do sleep 5; sensors | grep power1; done
power1:        1.63 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.36 W  (interval =   0.01 s, crit =   6.00 W)
power1:        1.76 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.19 W  (interval =   0.01 s, crit =   6.00 W)
power1:        1.81 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.24 W  (interval =   0.01 s, crit =   6.00 W)
power1:        1.86 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.67 W  (interval =   0.01 s, crit =   6.00 W)
power1:        1.41 W  (interval =   0.01 s, crit =   6.00 W)
power1:      932.00 uW (interval =   0.01 s, crit =   6.00 W)
power1:      687.00 uW (interval =   0.01 s, crit =   6.00 W)
power1:        2.32 W  (interval =   0.01 s, crit =   6.00 W)
power1:        1.86 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.28 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.04 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.08 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.24 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.48 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.43 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.54 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.92 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.50 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.47 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.54 W  (interval =   0.01 s, crit =   6.00 W)
power1:        2.67 W  (interval =   0.01 s, crit =   6.00 W)


Have a nice day.

For reference, my complete old mail:
On Tue Oct 18 16:56:52 2022, schaefer wrote:

    Salut Aurélien,
    Hi Aurelien,

    I am writing to you directly instead of creating a bug report, to have
    an idea where to look, first.

    The problem

    On an apu2 platform, buster:

       schaefer@apu2-ds-01:~$ uname -a
      Linux apu2-ds-01 4.19.0-22-amd64 #1 SMP Debian 4.19.260-1 (2022-09-29) x86_64 GNU/Linux

       schaefer@apu2-ds-01:~$ sensors
       fam15h_power-pci-00c4
       Adapter: PCI adapter
       power1:        6.40 W  (interval =   0.01 s, crit =   6.00 W)

       k10temp-pci-00c3
       Adapter: PCI adapter
       temp1:        +51.8 C  (high = +70.0 C)
                              (crit = +105.0 C, hyst = +104.0 C)

    Those two above values are coherent with direct measurements.

    On bullseye:

       Linux apu2-test 5.10.0-18-amd64 #1 SMP Debian 5.10.140-1 (2022-09-02) x86_64 GNU/Linux

       fam15h_power-pci-00c4
       Adapter: PCI adapter
       power1:       97.78 W  (interval =   0.01 s, crit =   6.00 W)

       k10temp-pci-00c3
       Adapter: PCI adapter
       temp1:        +54.6 C  (high = +70.0 C)
                              (crit = +105.0 C, hyst = +104.0 C)

    Temperature looks ok, wattage is wrong.

    I did not see much in the Debian changelog nor upstream changelog for
    lm-sensors (added additional versions of the AMD chips). Also, I diffed
    the kernel source for fam15h_power (without Debian patches!) between
    those two kernel releases and I saw nothing (except a few defines,
    kept their values but were migrated to include files).

    Do you have any idea where to look (kernel or lm-sensors)?

    Thank you for any pointer.


