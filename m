Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EC1C5AC81
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 16B3620850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3S2ka1M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbfARRPr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:47 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38719 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbfARRPr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:47 -0500
Received: by mail-pg1-f195.google.com with SMTP id g189so6340857pgc.5
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=l2q+yuVpFq8JGCKSJaygia6XKz2chtMO+kr+kgPss3k=;
        b=G3S2ka1M3SuIAgJgWhtDyHhuc6P6627kbmaGkYbc7jgG54PT38TzjE9GUm9p7FbtZS
         L4N/lCSbfp8UwO55qy+o9wGFhLLTd2W/gCBaUYnwZSt2Yf+TvbgkUxabYLhMDIJTJoJX
         fhGkVsFU6IDkYUq5a2ucWnHCi38QoBoNhEUaiZsL9i30bTgRtsiwUlO2Xm3yn8WBSBzz
         Ev9GF0YV/Uo+jVe91/I4kwLecESxxQnouvgAE5d07kO75zWpF+zBnUrVWXeumNHDK0DU
         VmmHPEpdJZubiQc6SrSVDYUrKCFIfYi/hJ+xeEYlP1zcWEA3V5xst+U6Ud+NcjcTeCq6
         qIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=l2q+yuVpFq8JGCKSJaygia6XKz2chtMO+kr+kgPss3k=;
        b=Zj1cmN5KnCImL5+Qmd0n8YQ8uPtC71GbSG2DC43uK0Ipw+AgRn7ipMmfxlfffNsDKC
         0gfqYkECpTJpAfOD8SbYAjIhfW8HIqZGH3fqPLXeu6NixghQDPOtxzaOdJWSzFDr4H/0
         VXtHQdzCGIr3cKz8C2MkBnvRhhVz1an4z4PUDSTbO8JVZGsZyvDlk8P1IexSH6aK5ukM
         IvA1C8Mqp9rKfeZMvA7TqREDRjXoYZtFJXpVHxMvtvOwJ+eqjaMaHyuiIOUKjBnLghZR
         apxk0zsYxPmxRqJlKL+FxEbZy2ofNsgKtmT0Ug+mrO5IhigKzxbghSieRrG15YJa9x+i
         xVjw==
X-Gm-Message-State: AJcUukdMpGtO1YqMCyPluQ06OUnuruZgCOMBQW8ARVNV1oto1BMyN78L
        pK1pliE+rNo7z1eOFlYNcUMWtbLg
X-Google-Smtp-Source: ALg8bN7qTesrHaQJYhnHwVJbmM8S4KpSGqYgm92dNZT1kUfVz0BmRi4rDXEejoNYMreeM96QAaG5Zg==
X-Received: by 2002:a65:5286:: with SMTP id y6mr18395929pgp.439.1547831746546;
        Fri, 18 Jan 2019 09:15:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a18sm5447385pgj.30.2019.01.18.09.15.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:46 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 26/30] hwmon: (tmp102) Replace S_<PERMS> with octal values
Date:   Fri, 18 Jan 2019 09:14:56 -0800
Message-Id: <1547831700-15865-27-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Replace S_<PERMS> with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp102.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 6778283e36f9..35523d315f25 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -141,10 +141,10 @@ static umode_t tmp102_is_visible(const void *data, enum hwmon_sensor_types type,
 
 	switch (attr) {
 	case hwmon_temp_input:
-		return S_IRUGO;
+		return 0444;
 	case hwmon_temp_max_hyst:
 	case hwmon_temp_max:
-		return S_IRUGO | S_IWUSR;
+		return 0644;
 	default:
 		return 0;
 	}
-- 
2.7.4

