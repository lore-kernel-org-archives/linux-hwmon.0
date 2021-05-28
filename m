Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23826C2B9F7
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 17:37:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECC3F613F1
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 17:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229467AbhE1RjR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 13:39:17 -0400
Received: from mout.gmx.net ([212.227.17.21]:35133 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229450AbhE1RjR (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 13:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622223445;
        bh=C13khoicbmPnSCv5GxXGFgKJnKo3IG99zOeQWLCiafg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=VuFh+5XiUcwdB2cmKFQq2NyGU6QPezpyjBUQG7HVeX6gCpb/pBs5E5pwx5+bRRBKr
         Grrj61ZOoapokqF7L63ydoDsLVcYAn3qixXmLLv0A79N3mcjNNPySI37dgzUIxPSG+
         x6Kvp2nMrxKPvKaxzvQujFSGHJh07gTr4STKpue8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.180.99]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Md6Mt-1lDthe0ADr-00aB67; Fri, 28 May 2021 19:37:25 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 0/6] Convert to new hwmon registration api
Date:   Fri, 28 May 2021 19:37:10 +0200
Message-Id: <20210528173716.10975-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AD38ClvXeTxigXyP5xM0/M80vpBwoLAgo6rU7mVC85ntE1PesEv
 IA8Ilv94o3hdExocnb2s829jYORVTlVt9fNx42AQSkpo/SMU7e7lxsF1irtLy+VNosQefLp
 +iiNb4FH7QP0tb4HQsEPBSaaT+5pZ/Lge+Nmhb1ZpQqqj/4phg8fC/ibaVJYYmXfZ5iQmBy
 GMeVPksk3QQXhe2McqqUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s2c6q2PgDQ8=:ZjFaE/CquXrXEX3MH8kDPq
 JyEoe0Er/3TZN1Us3OZuM9SH3QPtmj/h/nerulnekOnQsOymlw+hp7htsoBeEFf94/+mr8ojT
 q84d2cS+YPotIhm7bG1Yu5HruSqM5DYcuEoRRfVxL7hpyU2qCl3gRsfMYj7rkvCORjYeG8bis
 l9rErbPwr5loZNxrEMjOEqC4gJ1eIJw69XdgwUhkk+FjTuS1duW2EbByblBvmMFcclCiyUxcn
 A/ZTauoqi5g9vaDtr13xaQmtvcop6WW+n2ZK0AdmhW5RkaoPMX0x1uOSGoAN97TPHknmkkvlZ
 wUZAeXclpE3p4UY/+rmNnewa2ZjORIsyCk+HxqGj4+JguAq/st7xDJpyiAWMHYsDPfYlgKIZa
 sQu1xg7vfV3/2gmlI8XZrwvBL0cMAVyTigpVuXo3hmRH5g845//6rIeGSwMkDxNItdkt1eIdd
 +uxFP4tR1s7GIWJIuzbojcWEIZCsrmdfTl+Q+5IkYrHV33+zTiuW/7f9fLXMHgsxGYc1+8nhW
 izJ+ManT+qSPD7hq8Geb+kOAuHmWyUn/358x7+AbPcQLOsajSs7arBKN13vQvHS4rKV51l+k2
 cPQ/o9CF1n+pMpk3mM1EQG8AzPkFGr62BRC6mRwWLZqAkreLqT7+OEmh/HrxoWZBDtdPmAerq
 WWBXSh79c4hsja6Cis+b9tSVZs9Evu8miwtdFKt8KLrIVQlI7tIsDLyXO472OoMoi58NjBpXt
 OjW0vRQauT4HbNLWbGCKxEK2zmY/EzpQ8P00YCbC0i1L15ykPV48SeJ8tXA3oLeFW7kqAwIZT
 EDtP9Z6Mokt3MTbSa5+SGgFzkHj085YwcZlGoB+3bvIu0uNP1hiBRcRNSPxIEg8CRsIvC6v5p
 nVTSrdG2EVNjoMNGh3evi9kSOHLakgWP9b+wqOmj0gxNsqOv59mBjKI0Pb/cVx+DSPjSfLE0e
 VIR1h1DoJBpOooL7dARWTBfEEpYUXdfL0/bGxI1a6WdQa7ZarLQD2jy3s2MwSQnvzZ4i1u9mB
 GcKNeKfe23urOu3NQzwnlY06uh7b8UKM83Ib9VPNDJZF6aQ0h9cbic5Z8Ip5Vku6uJIqJFW5s
 czeMBoPHqTE0fwZQY/nl3Y5IbKnScsxPURx34O0gsmbYzA5XnsvqbFn0fQJAkecRibm3kejFG
 4FIt4D6cQ2ucvMICFnFIeIeEyrAdg7m1zKpcYoj/2rx2CXhv553UW9wp0LTgv1rtoAju4=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

This patch series is converting the dell-smm-hwmon driver
to the new hwmon registration API. In order to do so,
it introduces a platform device in the first patch, and
applies some optimisations in the next three patches.
The switch to the new hwmon registration API is done in
the last patch.

The caching of the fan/temp values was modified to better fit
the new hwmon API.

The patches work fine for my Dell Latitude C600, but i whould
appreciate someone testing the code on another model too.

Changes in v2:
- Fix coverletter title
- Update docs regarding pwm1_enable

Armin Wolf (6):
  hwmon: (dell-smm-hwmon) Use platform device
  hwmon: (dell-smm-hwmon) Mark functions as __init
  hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
  hwmon: (dell-smm-hwmon) Move variables into a driver private data
    structure
  hwmon: (dell-smm-hwmon) Convert to
    devm_hwmon_device_register_with_info()
  hwmon: (dell-smm-hwmon) Update docs

 Documentation/hwmon/dell-smm-hwmon.rst |   2 +-
 drivers/hwmon/dell-smm-hwmon.c         | 860 ++++++++++++-------------
 2 files changed, 426 insertions(+), 436 deletions(-)

=2D-
2.20.1

