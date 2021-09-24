Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43C5C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 11:45:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DE6661211
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 11:45:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343557AbhIXLrB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 07:47:01 -0400
Received: from mout.gmx.net ([212.227.15.18]:59503 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245352AbhIXLrB (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 07:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
        s=badeba3b8450; t=1632483911;
        bh=YLHlfzh1DOLDaQCUqr4v0OoCAf+jPzyFkOBt46fUqC8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Fr/+5iCIE3VPza4votZ8T9HPRetm4ebGZGfh0mq1FtPtiz2zrEcDaE7bcnUETorpV
         M9tiTw3nJ08jE6EwaIhtM7AQ9CcDHhbSjIO21i1DtCqR+Xci29xoYUauXnENYCYMSZ
         rh/LWUFb9y4/mNe+CssQ+O4B1m6zcHJ1XlH1EThw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MhlKs-1n7B830Cp6-00doTO; Fri, 24 Sep 2021 13:45:11 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 0/2] hwmon: (dell-smm) Support additional attributes
Date:   Fri, 24 Sep 2021 13:45:03 +0200
Message-Id: <20210924114505.20416-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Gxil3sMGyDBvVBpg5vXahSgBoDI2yOrbDqTnqeauhKmSL5Lb6gw
 gz1rz0iifDasG3WKCasd0+5eMcG9CjuNjp/mrTQOO5WLoEJD6mhc7F0iUJuDb+nTMZOdIzz
 b2myZy+5EuwNWprmPJK6QdUb4N34G/p7/D2yUWQ7MtPCZ0fC7L0AwgWVhRkRHhNA+lde4Oc
 cNQrIyfDDHVz59iADVF3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hIPwf+7faPA=:9W436oz1t52voRGvW5CprB
 km7WSGyzlzOziIzriPnlEqxSJZhvw/VO5/kzLIqnMtFuwVKMbYkRoEFvcmdnOfw6HHMyWkAvt
 XxZD6UTqZVm7SJ11XFwIansk53APOBmQbDmmaw1uIicO24bhcrkXqyLlRdt1iaaIARl2UF7fR
 i/MBkJ5DRd1aheQ8q9oLUJvX95QwdAdN3S7i1Q8CbGFBEiVpLSaoz/XTtMbsbwNH30KY/2HIp
 sn9WfOg8GmDoZ19Kx90OgHlFTY61rpZ2OggmYFwsbElmUnd/Qt1EINnjEr+lPGzCJHyBnq/jq
 AOp+r4M67LeEjotNrYtYbe8jenZ7GrUKc2Y6KUTZjQtGzSJbpI2RzWp/xpPjrY80bS+OuOAON
 xZZIg5p0kV3W8N+M0yAXmvglFHIWCcC3yf1Qff+qqhcDPPESPZ0tPrYwYvNksVPAbVYa5VoRA
 FDEml5HGPxn91FpWvHI6S6pryDM+71SzdCQ32q51p45hEeVwbnLoTdHzS4jb34YBPZxXhA330
 FDbShom+Hj/3MVslblhqBxPseAww+txKHIVhovlIaf6gAAuTT5uJoh59AH9QL3hZdnOu1bPg4
 WWBAgFQ+YmdlCwpK5ba752Dn1XT1Omb7hvCXPaQN6dLBeQ93ItL/aIoxT54T72S4TOkJPt2J+
 kOg21vSKNpCVj4VgPypsQiOk5hd1+8kTOi7FB58UFPOC7jxgi1AzS2owbiBxypQINrC1JMPiY
 SpwVI/5wGL6ExOBVkPu1jQE8EtkMJ5FeKkDQDlxnE3KzgedU4PYKZ14HVzB3heKxLzDKW23DH
 HET4k92OaflaGUbhvEsjN5tgjJKXp6GruJ41VTlCLNIxKVGCLe7k6psqQlnKjf6Y0uew6npVC
 oqTmIONs3WYv+lrkTO1C5tQismQe9hLCIUUHz4tC4RsV8E4z6s0bOq0WwhBkQmSG2P0m1W5jY
 BSMWfCFb/f8WE2a1XEkL+XcTlBJOnkwR2goDFCVT4FpQoRV9AXE6V6+2rtCqjynR3471q4LmO
 qBXdM0Pzr/fU7SScoUnhYQHonXnoPNdnvZMV6sRg13HcJAZQzm0AdpgH3+BgcpS7gR6e6a+Mb
 9FSeWM0fNPiKw0=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

This patch series adds support for fanX_min, fanX_max and fanX_target.
A second patch also removes some unnecessary includes.

Both patches where tested on a Dell Inspiron 3505 and
a Dell Latitude C600.

Changes in v2:
- update documentation
- prevent out-of-bounds read/write when module is loaded with
  custom fan_max value

Armin Wolf (2):
  hwmon: (dell-smm) Add support for fanX_min, fanX_max and fanX_target
  hwmon: (dell-smm) Remove unnecessary includes

 Documentation/hwmon/dell-smm-hwmon.rst |  3 ++
 drivers/hwmon/dell-smm-hwmon.c         | 65 ++++++++++++++++++++++----
 2 files changed, 60 insertions(+), 8 deletions(-)

=2D-
2.20.1

