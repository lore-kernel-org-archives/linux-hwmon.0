Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B3CC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 16:59:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BB29610C8
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 16:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235165AbhIWRB3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Sep 2021 13:01:29 -0400
Received: from mout.gmx.net ([212.227.15.18]:48649 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233396AbhIWRB3 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Sep 2021 13:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
        s=badeba3b8450; t=1632416380;
        bh=wl4ZRzJP3ywC6eUIcw1x1zMTCyFXx48n3CbhakLGXR0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=YNxHZtvrd2bEausoFNCY7Vb/7jO1sd6iB6hY0vK02Kw+fi+/2flWCgPlb2rtX6U13
         WFQ902UK4rwCFyJ6Adv/IRsL5Nn/fCE7DRAoUlQl9llkru0/S16OW/jj2tLHT+yn3P
         rlgL4ac72MSncdLNle/rkB9/JeXmL2mpiyy/6kUs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M59C2-1mSM8m2PZs-0017Op; Thu, 23 Sep 2021 18:59:40 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (dell-smm) Support additional attributes
Date:   Thu, 23 Sep 2021 18:59:31 +0200
Message-Id: <20210923165933.24132-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zjs/ZGbJas5t75j83ldBeqm+DrXeqMJHzhQY3rpFhAG4wThaAzc
 NjOA5DB8NW64pZglTnJIikRsGTfIbqhtPQT3oHk2KtV7jpTPHR2hslf7TE6JtmS5vIG2+HE
 7/yVGajFlsDmzCTMQu10PT2aSVdSi74ydnUYjb9E+xlz+nRXT1osOO0xgTX90ZveHtjUaua
 bJANm5fl1dZcyc3J/Oh/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7B3azGf/Nkg=:LFHJ0Lg1ugomEuk5cfn6a1
 6RkQFR5xCP5+YlkZYX+Z06Jc34YgCiOtIZ6Z66lj3QHxxwlCJgt0zZxBcalGb84ErhwiEE5k4
 qLU8RWrpclJntvW7qQxGIepd7w7jxp2CSjApEITrehS7cDV71AaopHeJ6asCU0r2PboZsP2DL
 ZgMhpRd9KaZlAXrYh7MErSBPmSblLAPslNvyAx7hZAOwLBm3LFM1gMa7ng8jGkJkkSJhMIV36
 jHtUIFG/CqtBX6je3L6Fu1FSFR1NUT7yTjRhbzvi1dol2xvznDsOQGYxpWQdDpdurn5CXyDh/
 KbFjWONBfSIU46l86aX5/b4vtI59yBl/iKg+B+lXflTa8F3vOHWp1Ul7k5L4napck4d41RKfe
 Zbpoe3t9exbUN+IfD0mj5NIKENkHp+4g1Eq+08cVUa8TMRbtuPQQTM5kb1qbbX6nkVDkX1eZn
 GZtAweiCFtQx5pNxlA8tfm30Vp7Dt4qS3zCArS4STvq+YnSSlw7KyFbzZ1PyJWJcGbWBTm+Au
 NHbbIQywFqv6zlU6dpcphehmQ3qMOFfD2VSeUzO+oAt2eq4QPScmTwhoJhXmsNiE6zINKILq6
 d3kPkXDVut/CPl8eTz1krXHSICje/8o0xBJ0eTAMOqNMjzSnsHXUNOLVLJxChy2beXSaTYf1g
 PzrQWcrlUhji8md9kzwIDuvwBOin8CkmDsTsrn6PRmDyDYoR38EBplLFnGShruhlZbHnIaJt/
 NhRgKJqm0eyk1P/t/ay0rc8gh/gP49a6WSYVcBqYPCbVmofgqdNFqFnpgBh16i43nI9gpS29E
 +o7aqye80RwNk8hsihkjSHd4yYQje5iW0RhIoIkhPGmLrya4vbociHK3wPSBUvi6/mcRFbSl8
 5e5ftDY/v7YnGwmm5hfsj05iEGSUcO8F2ZO3BmqCoT5WTiGxrSEZGm44E1ZXolxN9RKDGqmCw
 3wJONRnXTMqfc6gAlZ7VyfBTEIpZZgZRUILZJild5qFuhWIUvQeD2pmAjtutNl7ezbDeUYxRh
 pZo/YUQkflBqZddUWD0SSOivlyB07eVHNJV+W131+iLUsDQQnibwFWcPcwd0QxhelF5WJabAx
 3mz+CCE9jR7Cz8=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

This patch series adds support for fanX_min, fanX_max and fanX_target.
A second patch also removes some unnecessary includes.

Both patches where tested on a Dell Inspiron 3505 and
a Dell Latitude C600.

Armin Wolf (2):
  hwmon: (dell-smm) Add support for fanX_max and fanX_target
  hwmon: (dell-smm) Remove unnecessary includes

 drivers/hwmon/dell-smm-hwmon.c | 54 +++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 7 deletions(-)

=2D-
2.20.1

