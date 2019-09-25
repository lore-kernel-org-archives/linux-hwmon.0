Return-Path: <SRS0=acw2=XU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12617C432C2
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Sep 2019 13:17:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0C6020673
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Sep 2019 13:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOxJq79H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406302AbfIYNRW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Sep 2019 09:17:22 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45256 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406080AbfIYNRW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Sep 2019 09:17:22 -0400
Received: by mail-pg1-f195.google.com with SMTP id 4so3196884pgm.12;
        Wed, 25 Sep 2019 06:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=xAVB6ja1X8JqD5ZaEueQZH1jErZvtWZdS0+BsZ6pfGU=;
        b=pOxJq79HmmxVQVgte4gifBE4yukt2hYlpd14dtCJFSTYV6eMdfEHWUAmz3EeQsvp/o
         2HGF4X2CGLZW6V/rVA9CBNL/0FQzRh7fzSA0ravm9RbZU/jytHONtjSuTGmK+vlhOROx
         wTbQCaWxOZUp/kG3KJiMFBDphAhkgPn4Y/0zDi8+6tU7EqtD/Ilj6UmwnZg7wj5j4IoU
         KywqyQ1o6fEF0LVgEWDDuuPZn7+26i3SAP370BYOb5sReYKQOkyih3Ho2799X0YgA7Tz
         hpFY5k5Q5Q4AQ/eKkdA5ex1lc4vvA7qJg/I267kJnKazTY8Rv8iWnGY7pUUxYfOkh2AW
         C+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=xAVB6ja1X8JqD5ZaEueQZH1jErZvtWZdS0+BsZ6pfGU=;
        b=JTFmw3WY3sFe4aCl+MeBkq8YPeDqinjbCbwBSLc0RuaVH4q7CMR66myXCMR2urXyz0
         I2qR4W/6auUW78dU4JVhRJdRPp22QlIrjqICaV5buB0Nykooi66WafeGYUfCcOWukWy2
         lbL3zmvmt0V4cIzC7JnIguxBBwNJ4WqcdCXB/3PcS/k7AG1iBs9230kgofPDyTOssoZg
         tAuN/wKoT4wAnWEUzpGXe8PqTX9g5M0bMfjqL8U1q8vRB4Hpq7/ScDNtpMoIHV3Vacy5
         IslGF3IEV/HgAfvnmcJQD7Qb6XKoFgB6uOzxoWMitHpT38fRHUTZ+KEI7mQxxj/knecb
         yXHQ==
X-Gm-Message-State: APjAAAUvC4Dbr+7tZC4KTxQbxYT+pVtA7VgQBh4rlRbBD07ZTMPkuwE7
        HKD8W1udpqsfjXprUlNBSf58s86BfHM=
X-Google-Smtp-Source: APXvYqx7QGB9CTMVPpaRAvN+Hm9hhKU+BlUWtrEwt9hHQs0YFDXDTwzoaBNwrhSCa9UWN9y4XRs6fw==
X-Received: by 2002:a17:90a:fe04:: with SMTP id ck4mr6599493pjb.74.1569417441428;
        Wed, 25 Sep 2019 06:17:21 -0700 (PDT)
Received: from gmail.com (ip-103-85-37-119.syd.xi.com.au. [103.85.37.119])
        by smtp.gmail.com with ESMTPSA id h6sm6580991pfg.123.2019.09.25.06.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 06:17:20 -0700 (PDT)
Date:   Wed, 25 Sep 2019 23:17:15 +1000
From:   Adam Zerella <adam.zerella@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
        adam.zerella@gmail.com
Subject: [PATCH] docs: hwmon: Include 'inspur-ipsps1.rst' into docs
Message-ID: <20190925131715.GB19073@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When generating documentation output Sphinx
outputs a warning for not including
the page 'inspur-ipsps1.rst' in 'index.rst'.

Assuming this documentation is useful it
should be included in the index.

Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
---
 Documentation/hwmon/index.rst | 1 +
 1 file changed, 1 insertion(+)
 
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8147c3f218bf..230ad59b462b 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -7,6 +7,7 @@ Linux Hardware Monitoring
 
    hwmon-kernel-api
    pmbus-core
+   inspur-ipsps1
    submitting-patches
    sysfs-interface
    userspace-tools
-- 
2.21.0

