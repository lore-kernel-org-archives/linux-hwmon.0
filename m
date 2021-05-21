Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4183C47076
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 May 2021 17:22:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93A1961183
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 May 2021 17:22:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhEURXz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 May 2021 13:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbhEURXy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 May 2021 13:23:54 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7B3C061574;
        Fri, 21 May 2021 10:22:31 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id a10so9019872qtp.7;
        Fri, 21 May 2021 10:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8zHLe+hYnfbSHBoRoQDl6/jVNwQIgXk3wS2s3Csz4cs=;
        b=RNUtyBe3LTv/7mGY5oZl7M7QehTvR+OAachtbBVg+zd3jKxq17vlrAbxWtzMl+xaJ5
         MgRnkZ2FmqYRPXKAHdSA9hI/RJ8kkEsk8uJktIXSqoabZfZPvwuklw7LEaECbzMvTcV0
         D0KVF8Sj5/zGJWj+Opw4XSDcxYzUeGkL9ZDK20O6zbRd2pVtWOC4iDic+VpyK0YT8ssf
         xTgIY5xOPF4Bs458I894+gxPwcMBFhGpo9nNM0wK5zwFX0kcxpy82Nn3FCYlBYKCyIoO
         ZcPnk16uLGtomm1gffXgUEh1MZdmEsw3cTyFtxuluJjK/sn4lL0qJMU4CURSWiBM1G5S
         IMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8zHLe+hYnfbSHBoRoQDl6/jVNwQIgXk3wS2s3Csz4cs=;
        b=VIgZYg7JU/i44aaQxt3kTtH8QHaiI8LCeOJBkzyyqw/2tMXHIZcpVdnzC5G+l4NxiF
         64Vv5xqjm6X7GIGXawn3TL3q2Jinr0yYhU+tqcZGgT2w7MSz2J/CogWCfmZtb3a548HC
         NamO7XFfmvJWa/V30oWBs9g4wdb2vuI171gHE6+Iv/pUV+xtfrxejlzgjbPrkFXb5Nje
         iEAszHJf6tj+Oew4JKKUHdEHUzNQSlGzFqnC9MFPgnxHsSjkrKN8jJztk5VmcOXCRIbt
         KbFvt5bN7ROqQmi+4/cB4TCWXUAJx6yLpwxitru8nT1EQyPN3OE86YKQxkS1Nt6rE3CH
         cdog==
X-Gm-Message-State: AOAM533ZvQXRnqrZUJ2nn682zXUI3fjryrYi3KOR/YD8sPoz3sP9E624
        /xyprow7ali0U4pAylLhNlR2hVYMZ3+bcQ==
X-Google-Smtp-Source: ABdhPJyNoUFTD4eI3Lr1DKdTvLxF0eCBLVka2RWB9om5jv/SeHS5dYal8cXsnG/LfVqxVs3tXjT8IA==
X-Received: by 2002:ac8:7d02:: with SMTP id g2mr12630991qtb.208.1621617750629;
        Fri, 21 May 2021 10:22:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:21c2:ce5:d6c8:5ba1])
        by smtp.gmail.com with ESMTPSA id a63sm5155334qkf.132.2021.05.21.10.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 10:22:30 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linux@roeck-us.net
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] docs: hwmon: Add an entry for mp2888
Date:   Fri, 21 May 2021 14:22:18 -0300
Message-Id: <20210521172218.37592-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The entry for mp2888 is missing and it causes the following
'make htmldocs' build warning:

Documentation/hwmon/mp2888.rst: WARNING: document isn't included in any toctree

Add the mp2888 entry.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/hwmon/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 9ed60fa84cbe..6925a8a70511 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -137,6 +137,7 @@ Hardware Monitoring Kernel Drivers
    mcp3021
    menf21bmc
    mlxreg-fan
+   mp2888
    mp2975
    nct6683
    nct6775
-- 
2.25.1

