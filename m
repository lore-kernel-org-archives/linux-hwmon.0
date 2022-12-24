Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7005C10F1B
	for <linux-hwmon@archiver.kernel.org>; Sat, 24 Dec 2022 04:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbiLXETY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 23 Dec 2022 23:19:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbiLXETT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Dec 2022 23:19:19 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF401C934;
        Fri, 23 Dec 2022 20:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1671855539; bh=ADj8j6/BUuQBYyxAwlKsfqY5hsrX2k4RAQgZk47ua6c=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=CJv8nXZXasufGfn3c4aQ5hO79VmhuF+CJe04esSkKbLPUS7k3zVdKzGB18gxnEc5X
         3LrJJQyKflmaKyG+QKmWjO+Ip2sR6QmEqM6Z03QHMCiv+qe/woQt1ug6JXhPfk6PqN
         WqqyT0/yYI+CJDDfH3PB17klEhu/CJeozkfE/EdtjB5K9JSb4sLPFzJS1jTXAOeNa6
         gTFHdRPXMN+i6rUBhTTb2jw+vvw0n0VauPbgBgNDFILXHplpukKvl401wm/sS5FvJa
         G51viqrXih4iSqKNIt33dX80ex43EkjTV7lFoGxfdmsurh4S0+mDN30/dbqFH78Bib
         N6wIRtEGGQPFg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from esprimo-mx.users.agdsn.de ([141.30.226.129]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MzQg6-1ovmpH01aK-00vMnc; Sat, 24 Dec 2022 05:18:59 +0100
From:   Armin Wolf <W_Armin@gmx.de>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] hwmon: (ftsteutates) Various fixes
Date:   Sat, 24 Dec 2022 05:18:52 +0100
Message-Id: <20221224041855.83981-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eExvhEnXCe011nUidf8E87CZzTm1rlfwWya2IayXQ4mWGaBuZ6q
 TD0WbIe8IWmICQrZUGCbcNDemQMXqniUicgIREHrONngr9mi2+kfVIyHG1/s9vFRTzr5vNr
 6cVS8PlmZteWLPV6ruy6qtl8c6DwE/0qnCjShZIK2Ds3jeMZ5li6hz65iu7OhhDuahyMa2m
 BmOICj+lQX/5MdXvMgjDQ==
UI-OutboundReport: notjunk:1;M01:P0:gh/w4R16Ex0=;N2JX/2s4GWqIcKfpwSkazey5Nlo
 5XIhUOdPYTHIcAMBK2oXcw88YEpp6Cfdr3lQtlA+fimAv+rCV6dSqQraIux1phTrfx9FcYlh8
 wkARo3BGPj51Muu4nMeUJoy92sPmNctkcBCdIjd4+2XLv136HtMRNYEJ0cYvHitP7e6phetzC
 jOkfljJp+p+uliXnqXMRSjKfOAtPmVhG0tA9dX2piyz5wsrbesPr6855xvEOX07W7zZ3Qfgep
 kn7HVNtz3G6ETEFpJgvm3LVE2VzHSd3w8Wwg8coQIpUuDuBnLrRs41f/KC/UaZACr65dWKl7x
 /hat6UN1IpDsA2u6jmTOFZbXLAMvQ1zcKP4UFv02pXYislSyWv14MSC6WB++IUW1lRLKjqCPl
 oEr6WM6YJeK8c1cXfAp2IKBdlXFPNesO3WoSUJdsNX4WJrzYqGyJESCAoGxeAVpFwpkcU2I/q
 s1kXDcBVnTM7mm2yoBtQx80YS9cbHzsP0fkqRJEOipaarTB3ptZuSAe5zt0yCiuysQuq0MoAt
 0LEgVxfDK88gGde25WOm9nIh26PCEg9430bVx3EINthH036+JptFnNP4Zxi4rOBu6nqhfbhGK
 UQ1nBMlykAgunSldCy6CR0J8pxUwZd5OeZDMLbfSdx60ZmQA9JZ5PIdN/yWeqL2ZmNuFcntve
 YIxECZxr3J+zsgx6rin0pBOdf17TNv5eSkJUoT1P1H8kTXtB6SsGGVroG3/GUv3id9yo3Y7zJ
 zwRC4vIWXBL+xdU5Ul9cap0nCkcOASSeErS/NFuhNV7KiF6rN+s6t0NUUpEwALHa+ezYVEFRU
 HVW+8EmuY5FWNF55lI+2avggQzchP0jXVgJP7cBlxeu0gBi8FP7cTOSl8BWAeUe4anCyJl49Y
 WHkel6SLCmJ/SV/21gqmQgwLNXG4Jin/MlxDaXi16U2JfBdSkn6UiVwS1/9hlzzgHWVph0MXo
 zPhTkXrk/AdOetkZmjw0V4v/N7g=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Merry Christmas,

a user reported strange sensors values when using the ftsteutates driver
on kernel 6.1. A bit of research revealed that the drivers was omiting
any scaling of the measurements, causing strange sensor values being
reported with the sensors command. This was likely done since when the
ftsteutates driver was still out-of-tree, all scaling was done by
libsensors with an custom config file provided by Fujitsu.
The first patch fixes this issue.

The seconds patch converts the driver to use the modern *_with_info() API
and also adds support for fanX_fault and pwmX_auto_channels_temp attribute=
s.
Since the behaviour of the pwmX_auto_channels_temp attributes is a bit
special with the teutates BMC, it is added to the drivers documentation.

The last patch is a minor improvement regarding the watchdog registration.

All changes where tested on a Fujitsu DS3401-B1 and apppear to work.

Armin Wolf (3):
  hwmon: (ftsteutates) Fix scaling of measurements
  hwmon: (ftsteutates) Convert to devm_hwmon_device_register_with_info()
  hwmon: (ftsteutates) Use devm_watchdog_register_device()

 Documentation/hwmon/ftsteutates.rst |   9 +
 drivers/hwmon/ftsteutates.c         | 551 ++++++++++------------------
 2 files changed, 213 insertions(+), 347 deletions(-)

=2D-
2.30.2

