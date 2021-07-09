Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91828C07E9C
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jul 2021 18:45:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B5C760238
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jul 2021 18:45:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbhGISsM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Jul 2021 14:48:12 -0400
Received: from mout.gmx.net ([212.227.17.20]:50219 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230159AbhGISsL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 9 Jul 2021 14:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1625856313;
        bh=SON6P2jr3N2fLyEKawyr6K9gWqOtqMhQ01M/cfXjUxw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=XhDpSUPG+MYbAElRphNVNBQ401tE2UvHc4N7qpFA827+T/KCy/pMa0Gw9Ml1N9gVT
         vUEXENG2fMTuF9S/2MVckP/hy04OLD8ym4pxFpaSfW1HrnecpDo2nB7QhE3I0IsCAH
         Z8hoClhqewW2J3y0C7wDuix0pbqU4hLPwk0HKGHA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.181.110]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MGyxX-1lyMyw0gR1-00E3lw; Fri, 09 Jul 2021 20:45:13 +0200
From:   W_Armin@gmx.de
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 0/3] hwmon: (w83627ehf) Cleanups
Date:   Fri,  9 Jul 2021 20:44:58 +0200
Message-Id: <20210709184501.6546-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cCZjeLUJIE3wAZaO0J/8Sz0VHvBgqkFoNnWwVIetPQ8pkLJpk58
 5KnCv/5cFDJnUUMX5uxR29V7CHfYZxrNIzORQshZMtLAxQCX8UTpl+do17mkUVm4CFfDqF0
 aILOqJXw39g3fzJnnMI4DECRpM2AgS4P+O1m2Ty9zUiF5TTXskav0qC5ct4bRPoV6Gmirmc
 LoCS0iVaDJtiKE4kx+Z0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5V1GUurnPFg=:bz3ktislPiMOwWa5+X+wjC
 YqWsialwQCpTBH9dUPxMw/nEVmW11Ys1+1NrX/0ToP6PO4TkgVPopfo+2vcl/CJ3GArUdAyaW
 8Rayw2Wc4duKLs98JflVN+EkseEJkGG8fOtWDpZZz7UVUboZQeW2RLOoZu2uUA/zRA5U5Z7bz
 oXWhX3cs7JrkcUGI3l/AFT/UWlfnSa7F+eg1MyOWaslW9fBHKbtCDYmP5wcNgUu/Ehib7jq1X
 oNmjL2lwixA5FUz0BvLbBb9QRhNgcmxedm2Zsau8X2EC8vwbI2Nl4uam7GW/K4u+AWhg9TpnS
 0Lci4g+3qJAK4Y1k6e9mG+Uf+HaVJ7j1fEzSYQzLz7wsWdnsjKzJGxiXr0TAWVcgZUFDRLIyo
 c2oBsFfxefTuCSjjbhwTk+l5pH4q8hMGEzwOMLOb9FCwJV0wRla+O3xKdGxi/UU8Rfcy0OSV3
 jxtD/xKAA71DuVBfM9LLT5pVx6uvbA1oZHGjOgI9po6utctW8R8rxtCExgLOdCtIORC4wXl1e
 FbUJ2Iu2TNS3MK9Jr62whcwhlfMQuoRf6i3oHwuo4f9Eio1t/ar54IxzqM863nLHpIH25SDkJ
 eOqxkS71SjXOZL6c55LhBH+h/TqPhWQlFLgoC2kkd2CzMqvmfdwBd33SGTyLRDf9jJUQ5QoZK
 gDZozpDzaHWZxMvTTYhoWb2iza7ZgniKOwz/CI5IPFdcfRgZ8XLI/uKpX01f1p+d8ZUfWtTp0
 qJaDrYaJCyblCV4Ew8UuDNwOyYQQFgjSxo+HI740BMIwQ1CsBBiqHoIBJpkR6IzrFpErKx1Nn
 bm5MFlZrhWzKOfcUa1y+8WceTVn7PQbKovFG+I4Ptm70E6Br6l28GMRn+nJqKXKCyWgZrfrA6
 GtjQILtxHp8a5wJI/EqUO6HdCxTv72MgQukRrbgU6G2cgGc9kmrV4NkHuBhCDL5bj577FcKiP
 PbeKdZ9+sj1wUu/dPPbguj2g8tM8Oh7m/jZVQLeZlyu+RSMdBHGzeDGyXIpVnauBsFZSRxNNP
 MmzMFQOEdwUyB84nmwwt2UQ834RTxz17/JGkrII4JlkdAT7l429YbD+PSb49bH6dIrkawk2Eu
 ZfwV9dFa5+rkG6IGnLvSSZAhYmpFSaMOn5d
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

This patch series is cleaning up the pm, init and exits
paths of the w83627ehf driver.
This mainly makes the code more readable.


Armin Wolf (3):
  hwmon: (w83627ehf) Use platform_create_bundle
  hwmon: (w83627ehf) Remove w83627ehf_remove()
  hwmon: (w83627ehf) Switch to SIMPLE_DEV_PM_OPS

 drivers/hwmon/w83627ehf.c | 118 +++++++-------------------------------
 1 file changed, 21 insertions(+), 97 deletions(-)

=2D-
2.20.1

