Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144A0C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 17:00:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E777261241
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Sep 2021 17:00:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237367AbhIWRBe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Sep 2021 13:01:34 -0400
Received: from mout.gmx.net ([212.227.15.15]:45707 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235437AbhIWRBd (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Sep 2021 13:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1632416386;
        bh=X0GOCxNL/dxvrYRztRXEeRjdd3ukZjcsQQYnYGFmEP4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=gqcs9k3/jIp+pRSwC4NdXZFCUUrMsJn2vyUlpkneMWMmOiecZHXyr4LuwjvG5jBYG
         id6j/HA5+aYGc3RBhdHEw6rIqrgwJ8O58+h82TXZi5ZAVTN5E7hGibIaauhodmBtny
         eXuYvizWbVTGQj39wusKiaABDxcUQ/oekYFPIMZ8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MYvcA-1mP4Nt3F9U-00Uq9n; Thu, 23 Sep 2021 18:59:45 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (dell-smm) Remove unnecessary includes
Date:   Thu, 23 Sep 2021 18:59:33 +0200
Message-Id: <20210923165933.24132-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923165933.24132-1-W_Armin@gmx.de>
References: <20210923165933.24132-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lGj77XpWIYniCWRmyhpRWNk9tJLcYdRPVaP4MQa6qV61SOsXFu/
 yD546At+cweqQaFP3E5Ypb+jMjYTuln1bkbuxwRJwDSVb9dhzOBUFKDIsZtM8e+RaTnonc0
 VoB6E23Kh6bE8UTKdvbu/IXT0mZvsEtAG6cBoi025t7jKzRBupOU2rkdWpzpxJijcgEYTHL
 JODy5LKq4szdNKKN2QMoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:irOJPdME1ro=:5bFGVqmJPy5foQCExjXJvt
 BRdgv56/FahcL1WW7RNPAqHcQJps2ZiIKtY7CzTRSHfbN+0b1AR8puuPr+JEHAebUZzIFmFep
 RWU6d7E6IxZQ3LNd8Wx21HkBAUPAi8IaLgzA5TzriQAaFFpRSWdwLRZ5hexgSyRi+RNKcJ214
 U4SN4ilznsdoa2eQMtynQk+Sowe+CJmNgKXLdZl1yKthlE+ax30gq0Ysfv1E0/3mMvurHMmae
 TW33yU+xiaC3W0D8OYo9zhczUS9npEnMOA3lDSowJh/gAtnjydyfBg985ZwDrkYAvN7F/AmNV
 qXAOXcGcV52OMlcFJR0UiRngmD9rL589YSVP7ZYrea3OgF2dfhDX30cp6D+3OZfOQwRlx6od9
 NdGTt6Zo95B6QDmhkH+GYPbCrXip1ZSI08rvAXbgmHdDvWEmUomomn8OyAGhWZkL0lIY3/lxb
 2NlYGtbiaD2ski4Ot+gWjFY+v6Znd+6uXtxo0o9VTrOla0NPTswFrAXf3Y6y+6wLNIyJIYOCZ
 mm1IupyhrxDfxtdxaoK46T73Q1WyNP7h4ZTXxHg6CLJ7lxoODz58MdAPU98MCtdqqFPTRHSTt
 GN6kKF7nj7pQt7SEGEj6gtpkFps1VIZmtr3S0Nknym7RnwBMI1gloRzAG8ApSfnCwlTca7hO9
 5aOcCdQoxusgcDinhXOP/d2d1H+RIYPMtAha/d/pPNJbMeZwusrFkYLE70f9YpoIE0E7DcIYR
 AjJAsVv02AoHsCtqRd2NSD1HVMwzn/DoVo8nj9yGs0ZA1Va18WY9W//47GIvaPhnYkOfi33dY
 V0Vevwh8+LPZDEMy+O+u12EiG7mjN4cwHleRzkU9uQcDVnePiQpJoURQXuvnh0ZiRC5TSMcde
 ys8GiYHJZrBjg/AscgrpMBO6dseNNTUpGfR8vW3dyhfwUj9Usg2dvMEjGQ5CfOImoKucOvIai
 IcjmrsCIFnlQ2RFuXthRdo/6mRsNUr6ZSAD3PdO2VTuo+W6OS+bqQ1Y1vy7Z6ugfVoQQgFEAK
 ZndGxhWsYtjiBE/TyXc6l+wfV6bw4XdJhF1ZeKnrlGUOZjOCNXrG9/IJ8kW6gjrfQ+RqjYBEh
 upMKwuiUT7dF10=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

sched.h and io.h are not used anywhere in dell-smm-hwmon.c.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index a10503a9f80a..cb21fe30e1de 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -26,8 +26,6 @@
 #include <linux/mutex.h>
 #include <linux/hwmon.h>
 #include <linux/uaccess.h>
-#include <linux/io.h>
-#include <linux/sched.h>
 #include <linux/ctype.h>
 #include <linux/smp.h>

=2D-
2.20.1

