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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B958DC433B4
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 May 2021 13:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 975B761040
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 May 2021 13:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353726AbhESNbE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 May 2021 09:31:04 -0400
Received: from mout.gmx.net ([212.227.17.22]:46975 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353710AbhESNbB (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 May 2021 09:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1621430963;
        bh=8THuDwvKXfvpBYyzmBE08VaMV/aSnP/Qf3dWHo6/jis=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=W0tGR6TkvDL96dKn4Fr1sNk3tJZgq1iSA1RtGhA9BRGjDkluMrUOyCu8/NAs1OlYS
         Bqc0zcr0E3r3wQeHnKj0eNtGGoC9/GxoMU+Cx4uBxgrFZtnKN7NbkNxhjO/1EY8vTr
         zmJw3IwJM7TYrvcJaQGeoZnouwjTxw1yGNvdIte0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.184.149]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N1fii-1lLPNz1pbk-011zVF; Wed, 19 May 2021 15:29:23 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 0/5] hwmon: (dell-smm-hwmon) Convert to new hwmon
Date:   Wed, 19 May 2021 15:29:05 +0200
Message-Id: <20210519132910.14453-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ta8pMTY3DQUmffJc6rXWG8yQXEzQTedbisNS2KoOpJSeBcvbjui
 V0HY2s5eA60FSv5bY9fUPkkn08gQv+05DNJVrScstY6G3oiG44Bb3pKOqnaRTH+WVrH+dgC
 NGiO4XT7t+djknaa/xR823CF4lLl1bJd3d6l2EmnyIJ7+Yvo24JLBprAGBWq3ilFIZ6xuhC
 OEl1J0ezwMDPdkv9PLgrw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EKLcjSOtMrQ=:e4cKJguWcXjXeRN3ptLCOA
 uyUc0qOGKJcNs4Uec8SBkEoxdChQ6jHoiQ+G3sOvR/E8wsEbzqRpBgjrGTb1gGYamJ3eBlJ/A
 9Cd1+nH/yYIzkE73VETvAhEtwVWF+vm6AeYa9q2eR8dccMJ7SYkVZbQ8nrEN/ynCbPLVObWqT
 x36Os3YKDlmE+SUETzj0YhJjWHBN4oqb8EGPM/eGQ7cQ3Gg+xFvcsN4+LEYJiVDvC1+6lJszk
 XqNAA/1bAFK1nhY8tdtANfvI7/3SNMHsfXt79nBAIpwq9qY6iJOkTEaCKvfwhHw7Y5p8LDd3D
 fWT1hjHyhr0akRPpkOP7vxqSlJcK2NV2BCH7jr31Fjt5n0riHTjhElSDOG+i86riORnTAHHQm
 Z3pZUanPNvfPt7PdfbGy0/TsqSX9mib2+HSpXX4D33UfsNlQ3yDqPrkJKtU+sKcAd1fcuGtBe
 YIHF5dcZvqVMs8Xrd3xOz6EojjNgCWIRUSx7GirJIKmFJjV9M/1dSnUCjB0giPx21TU9b9fjS
 B0a9SxComONTNpid0fwMtVVZvOkWRfv+gx7RtcWShYMyiEZUS+B9dloxd/j5W53r49arY3Xcq
 jh/qnCA/dpsiOmdsgWH6bZpOBCii+7IdXwAWVDJjSn7j7in06xbIhudLNuv0A/SkcmfzXUSj5
 Xqi9e/0/YKvbYCt136zIeR3hf0zfFtzRO2HVhq2YI3w6bIdVDqKQqkk2JDo4qAZwJNRCxIvsc
 KvL2qeWG/BjNlPLi2VJD2Lf8IlI2r82rDa9YObfDszs/0o3Hxu6IRnQHJ46NC/JCdQGKpIdi7
 5jo0Nbe5x4f4jg11PYdnCVxtTC+azwFbpK57rgOOHjoyLkKKOYCv6E0MJClMTmjzNhr7Q+vh1
 Jgz/8I+iaGS5ugFTmk8HcmXpJFTq5AxPCe6Hl2J+ySSR1FlN7oTB7kCAPGYLxdMyas65bOLMp
 HBKeu1qulQSg4kjbpptJ4ZpRgp+3rhZeFuU/kLu9o4GfP+D+kv0PcH0nhI15DhgMkb91EeGZx
 LpnRk8yIfSlRIH88f3AfTdlrp8Cjpa91GPzbCQSM41uOWi7ZB8LpbH6GZUBO3afEcPnBm9sLN
 VwvbtAgiSMhO2gXkUXMof8h5rgY8Idtbdd2pa3jMNbY7S+cqiBNRYUv9SFOGD7mY8xtLRyEjh
 if5i/Zve2dOYNMVg2QBrlzaxmuPq5bUdt7V7nhd7ht93FnzHNww4ZFoujSKbNETDlW9uc=
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

Armin Wolf (5):
  hwmon: (dell-smm-hwmon) Use platform device
  hwmon: (dell-smm-hwmon) Mark functions as __init
  hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
  hwmon: (dell-smm-hwmon) Move variables into a driver private data
    structure
  hwmon: (dell-smm-hwmon) Convert to
    devm_hwmon_device_register_with_info()

 drivers/hwmon/dell-smm-hwmon.c | 860 ++++++++++++++++-----------------
 1 file changed, 425 insertions(+), 435 deletions(-)

=2D-
2.20.1

