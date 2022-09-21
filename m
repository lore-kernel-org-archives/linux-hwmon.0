Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4274EECAAD8
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Sep 2022 23:31:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiIUXbX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 19:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiIUXbW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 19:31:22 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075CEA3D2F
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 16:31:21 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id go6so8059128pjb.2
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 16:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=luiMGxsfgB3h36BHz6RaC81HTsy0Zd76rtNZImfgb1E=;
        b=HHpoBm/N6imOJmZaoDOZKEMk87FHsy3zHq0PngPGhSNc4YspFzVVBv+tmofzOlaM0Y
         uFojohtTZZqQR3XvpPvwaq4vl1HOD+YSA7rS5I9dQybDkUTxep6JsXmED3XEhrTtj0l/
         FD87nlgplAl3//DavsRMux2ZI83Se2XI5ozHsYgpD+nAdnHuGD3CA/ijmTyyy/dmmRCW
         RHVSwxaUMRTJiHYwue1iQ0Gat9LFib4el+75wge5+NtX68XS9Dq2AzoswlQbfgMqlHzo
         +38m2V2PQICfs+vWDNabD7FYgg45fiOFaDor2VIGk2k9vhSp/900AQYuPclYEEqEwVNA
         GNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=luiMGxsfgB3h36BHz6RaC81HTsy0Zd76rtNZImfgb1E=;
        b=GITcm+YHmR6pxv7jhvgk5lm5CnbFk57NycsvAMK716zH8wgGysoPzFNE6sdy0Ur983
         2Vk1jZdKOkuwFGugyJ0rgb+Uc0ugwywz3bNHKReLUz3B/vOZUXMuM9XhtS957Bc1SfEg
         KkcyHyB+8TSUozARgdtAYP4DwBd6Ya+AQzE7KQqC1hnrJpe4sQfa1JsPfMiKWYc2guyv
         UO/osutUX1O+QIihn68DmQ85XvV9u0G+hmwSwdMLkXDY3FshA1OOcmUu8yzfc+rXruML
         LMbIKEnrvLT8b4YdvZqZ2GFbpapVp8YB+eRGtCubgnO/p0dfP2O2KKWK66ugmotu6kj3
         k/Zg==
X-Gm-Message-State: ACrzQf27vArEz810CI7UsOPJbV6kEP63ySAbXqkivTXIhv6L6YM52jT+
        oJRMQTkmiQoxN7nNfFo+jIHu5mYrqNjOaA==
X-Google-Smtp-Source: AMsMyM7ls7fP9EdiOMmVStoYBvSDe4LaeL/XvvoFFD/o0pnfqR/7IpvMlvNOQju1ILiYL+cRcFwKgQ==
X-Received: by 2002:a17:90b:48ce:b0:202:61d0:323 with SMTP id li14-20020a17090b48ce00b0020261d00323mr583310pjb.157.1663803079963;
        Wed, 21 Sep 2022 16:31:19 -0700 (PDT)
Received: from localhost.localdomain (lily-optiplex-3070.dynamic.ucsd.edu. [2607:f720:1300:3033::1:4dd])
        by smtp.googlemail.com with ESMTPSA id g8-20020a170902934800b00177f8f234cesm2508074plp.258.2022.09.21.16.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 16:31:19 -0700 (PDT)
From:   Li Zhong <floridsleeves@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com,
        Li Zhong <floridsleeves@gmail.com>
Subject: [BUG] drivers: adm9240: possible data race bug in adm9240_fan_read()
Date:   Wed, 21 Sep 2022 16:31:09 -0700
Message-Id: <20220921233109.1672345-1-floridsleeves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

My static analysis tool reports a possible bug in the adm9240 driver in Linux
v6.0:

drivers/hwmon/adm9240.c:

adm9240_read()
    adm9240_fan_read() --> Line 509
        adm9240_write_fan_div()

adm9240_write_fan_div() says 'callers must hold
data->update_lock'. However, it seems like the context does
not hold the lock it requires. So it may cause data race when
setting new fan div.

I am not quite sure whether this is a real bug. Any feedback would be
appreciated!

Thanks,
Li Zhong
