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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EDEC4708E
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 May 2021 06:39:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C950613F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 May 2021 06:39:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhE2GlI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 May 2021 02:41:08 -0400
Received: from mout.gmx.net ([212.227.15.18]:40773 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhE2GlH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 May 2021 02:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622270353;
        bh=INpHqgX2JonQKgMv87KLFO86vy29HSZQtf+OY3ZbEAQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=TIS9klpNLItVw+FT/V8nKClEXOC7Z+KG/PFauRGtz9APSeQzmZGOsME3534rng9CN
         AL86/v6K2zEOdlwAgz3/4Njl3hfTpOzEVPwZOig9jGmvdzKsMXvmprvvwpFzwOvJMH
         MXVOEqX6XONHZqZOBJibbA4GC8vUjGIyA/UvGfls=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.109.106]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHXFr-1lZO6K2o65-00Dbu0; Sat, 29
 May 2021 08:39:13 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 0/6] Convert to new hwmon registration api
Date:   Sat, 29 May 2021 08:38:51 +0200
Message-Id: <20210529063857.10177-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mm1gcpB3Ef2WN/qBQHQN8tKtp8JXaWn8Wnbyn4j6btYmWRxYUYe
 pQY/Em1d4Ptv0BV31suHH6DPG7H3paqgqc/9bWZYFOrYCgU2dVRL34xzg5TdkLyoyEl9VnR
 O2tssmbR+yNe2uChZvmDZ6XooguMmYpMzu02TwNfqbGBJJcyKd9nt1t5HFlHvI8yH+xjIAC
 jTB9h4ulMRnOExQXNT7wg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ej/wH2X/HpY=:Uerokfi6AvJEZPw1iri2mF
 NWKFZ/VXFmnE3xbSNaDdRYydFC0ai2WogA0wHFa4Db1qP9lnV8dBn66sjmeVaxkWaLqZzg+jZ
 LNqWyyEX/hUTwfcheIOEa2Wx1fWWaNxd2qUaXIWND23VIhez/MxViy+K3fL1EY9pwTFO6qzUM
 mVaaC+9NEgq8J29biNSLjSDJuuPEsqtvX+R8S0V6+kqy123T5LjDqds9qUNq1XkfUj6jZOBB3
 /17pGnQCOC9cVNIPYrAKsCT0aKXHgJaej6wFkq7xSEsvDLW6S3TSAaljFNQoAzseA1u5FKQ6r
 XVjPtUT5kjH4v17wShGKc6MhhjENgzLqsil3vBQWsHGYWfMLfldKFInVkw9WuhmZ6rULc34Ji
 7VyHzAlHADePNR8DAD4/UJPszsy7s/VvEurCGNk7LxcTxJPPUi8TCy8AntOXjA7oGU8qBsE75
 SWDVFoxOafG/LAYd18/Fu+D8QtoMlPt+18eWAC4ejYnj8Cruax5io0xjtmkgAfeabrWoLbyk/
 SjxobsnQD8Gg8iUCyqBajpnwqAOYpJ6ptiF1QDTw8mE9roLLNgBO2dUkKx4JKceQkBXwYEX6B
 HH1foOKtrJjrbwLkqgaK6VClO9+tfbchyUpXRfn7Al72B8GGQE5kihZD8ObiV/CRwU7ptOWf+
 IdizSb44/T+yqKeEM/ghFlDqzr22q58NPF8YJW16dgP/W6bdD9aKZYE8XKc6OliQZujm4xFaN
 MJzc/3DqiRVZ+yaFu/MkE7b3I26m6xaq1cgdPK8UHphKyXwTPDwYHxcJoO1nPXVi3gnekV/62
 EnDeT+MEvBFbZDQ0sIqnzxDvEUWN4FVhHcisDBgmF+D1bs/mTZacwTGa7s7ZxkNHCKDB86tyc
 0Je0vPv/X4S7S1zmDOkB/ksbcW5U73Za4jxdVHA4Ypv1lATBzZFGYJX685SvyhgHHzGtiQo6C
 QIrZBxqSjy41WBNQixLQjhE0tRwYfVC4VHGISBtDVHTunmNTiJZn8Y5owNwKQU6O0xeI4OEvt
 vkMG5iOrbrNM4Q0NHqFYEtFGokYqch3TBzwoiFBaPBzeVXvdeImuYvw/rJB6PW47FKs0PK/Uy
 YF3+rt82Ye/6JzEwDDdrd8ger0fwHEtEFr5
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

This patch series is converting the dell-smm-hwmon driver
to the new hwmon registration API. In order to do so,
it introduces a platform device in the first patch, and
applies some optimisations in the next three patches.
The switch to the new hwmon registration API is done in
the next patch. The last patch is fixing a small bug.

The caching of the fan/temp values was modified to better fit
the new hwmon API.

The patches work fine for my Dell Latitude C600, but i whould
appreciate someone testing the code on another model too.

Changes in v3:
- Update description of patch 1/6 and remove empty change
- Let pwm1_enable remain write-only
- Include a small bugfix
- Hopefully fix transfer encoding

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
  hwmon: (dell-smm-hwmon) Fix fan mutliplier detection for 3rd fan

 drivers/hwmon/dell-smm-hwmon.c | 854 ++++++++++++++++-----------------
 1 file changed, 418 insertions(+), 436 deletions(-)

=2D-
2.20.1

