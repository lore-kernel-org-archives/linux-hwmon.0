Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D88C433ED
	for <linux-hwmon@archiver.kernel.org>; Sun, 11 Apr 2021 16:42:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D12B610A6
	for <linux-hwmon@archiver.kernel.org>; Sun, 11 Apr 2021 16:42:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235670AbhDKQmt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 11 Apr 2021 12:42:49 -0400
Received: from mout.gmx.net ([212.227.17.21]:49489 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235640AbhDKQmt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 11 Apr 2021 12:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1618159350;
        bh=PnAjq1W1whR+50hAyyZcgPmJ+1Vs6dZhlAmdWmMWLf8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=kMc5GleHd+yx5yUqZ9z21KUIZAPewPrNnmwQcpqjT2vmr0auaG0/jPFpCIqOD6u+g
         e65eCBZYFMX//F/628Jz+cueF3SIkgSayKulwILN2X/0PxzFgV5dsqliELw/o4p77a
         duavUou8DMy32Yz2Vd6XOkcoHAs8m+4vnfpfCr5s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.99.26]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsUp-1lKtNh0Oit-00HRba; Sun, 11
 Apr 2021 18:42:30 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH 0/2] hwmon: (sch5627) Replace hwmon_device_register()
Date:   Sun, 11 Apr 2021 18:42:23 +0200
Message-Id: <20210411164225.11967-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CNlF/MorlkqTqkgZCBUv8lsI6T5Jfa/QkikeihZtMpfiwaQdChN
 lNxtKL2OM5/VaolpA6Tv56uKxqPHdl5MY+05MRJqPbegYKSCfpPdO6f7qzAFJtF6TGc9514
 vCXpoDswhAoMm7KcHjoLNM/pPw3GgTVin9dzbqayQYvamfr7EKYTMbBPmQTsPY5GrK+BKjG
 wLVqz39JrHwbHuRFA90LA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AVS1n2B074w=:YCv/DQJb39/vaaQKRUwlap
 EDI42bwLf8dOKcdoq9Lf+UlSlAQtzLycPVPkNrYvqWAHW+qGF+Qqn2x9cIuE4ntdtZE4HZ6bY
 uNBkY5kfHqpZdUswAAfg4ao0yy5AVMd+f+J1iNllzAdoqIc9FcEM5zTu8vaco4CERecbLQzUI
 SIyqLdZh50S0yt1cPYxjewmvrTIZKvRcYx3Pvd9rQDBc2Tn3HReTscOmEBVN5cmRxRrkIOJjx
 rkd9TPomRanBYGgAzHsnAUWteMj5CxOKgD3gHOVNEnrOzDrHRpXKLohzoZjvFCcwsZvIIRMdr
 B6nwFsbWR8DRl9G1XgMhY9ML2KEqwW0Ymfu2zWrWZRtwCn/yF+DyKfbDhwk6zJ97OVC53x3Sa
 WaMW4TbPXBHUm6U4yhijUVyD97tDPXfgg7Hsp+6Ia3xKYSPmy9zXPi3lhre4jMHti4H33sn4D
 /FGE66I6kkWpLxPbEimUTwDGxQN43Ru3KM2w2pv6Foe2di16WQbMadxv6aeFOI525vWFdluAA
 qWQ4kwiBhiupBCWi2nY5tmpoNDWK7DchH3tjXfu/20EZfQOKaWXIcp1kLsigIwEDAE4JBJ77o
 A/hwEHOjY1WsKYQIg01nCC19SEysIdhrQ2F4cHqlBnZrjK5q/bzkHytcUkfemmmilx0ltMQy/
 eO8uIo6PQavEBRZVJlp0WdnjUiO0vA11V6/qw49lr0ZUttpSMxkB+tCtlBFjDlpHWpnj3QGkq
 VCtbqzNfRKTTiCb5KLhYm1cg4G3KjCF2CWpo1GbOA6bf7wEARoj5zYj4xqtWNmYjONCB7B5aa
 CDW2G/ygEA5YOvLprNSyK1nY2b6Mz/VDrIy3dPQL5/SvvFbPImvkHUjC8JipbLzCjHhtshCsO
 rS0nAT048BJEiv0CyIKb2FD0SpYomjlorPVxwGdTrXBCObzz+miIMXtFL8SBUqHNlDtsO4fAI
 wAocPEcfatxt0R6RKvsoC7AxRXVwg+MI4hye+YJ5UoWPgPkaXl1sIEg4fj4I0d85lzlIwSEJC
 sjReUuax61MxOqNyi9wNi1R4h1jJy24gWLSFPR+C/+4thNz+hYeFC+ZqAPs8IaSv1hN2nt9IQ
 TPnsGtkb+JsyYR2Z0cF9w4Fs+dKfxUjSi4ND/EjGG2hTIJN2uODfq5jx8K33WroY/R0s3maRx
 bw86GjGgoDcz7CRIFyXPo8l4EIBw51Cl+vsk++EmN4i2xlu2eqecqvYhcpFAYwNARquD0=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

When the sch5627 driver is loaded, a warning is displayed during
bootup about hwmon_device_register() being deprecated.

The first patch solves that issue, and the second patch adds
a minor optimization when reading sensor data.

Both patches have been tested on a Fujitsu Esprimo P720
and appear to work without issues.

Armin Wolf (2):
  hwmon: (sch5627) Convert to hwmon_device_register_with_info()
  hwmon: (sch5627) Split sch5627_update_device()

 drivers/hwmon/sch5627.c | 445 ++++++++++++++++------------------------
 1 file changed, 180 insertions(+), 265 deletions(-)

=2D-
2.20.1

