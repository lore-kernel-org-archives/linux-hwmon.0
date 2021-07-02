Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1784BC11F68
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Jul 2021 07:32:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E255B6137D
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Jul 2021 07:32:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhGBHeb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Jul 2021 03:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhGBHea (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Jul 2021 03:34:30 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A268AC061762;
        Fri,  2 Jul 2021 00:31:57 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id x16so8191132pfa.13;
        Fri, 02 Jul 2021 00:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=AWy2ULHtKivhRnatjDUZ5UFHdaa2YLZ6JkF418XGs5s=;
        b=ummSLf+E8+itKHjkDPqlECn2HgGvQnW8aqFVlTc6KW+jTYBkGJsFWZMXYe9iourS33
         Ix3y4JPYnbVoNBQW4hUQQQojy9HWkZ701TIkZEoG/XSkT8AssHIhIWE80UCvfkSf0d6q
         /urOUInC9fTh+qmoglS/e5vnyz7g/PUuTYvQdHwJzqvfd10fEyQqQ/8mF3zgER47pHMA
         mqsLYJYIwKh9IDnjaaLgzIicfoK9Aymzz1OTasjFc6abNYFlzhxLWqiTEt8gcPlgS7n+
         pHsjv+Ib/lHiSj1Jv3s2U6WOCD52/ScIHl82PElX8/H9WKxt3SFAR3GzUXZrB4zsHmPE
         Q12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AWy2ULHtKivhRnatjDUZ5UFHdaa2YLZ6JkF418XGs5s=;
        b=My6YfNlflQSVgCmYOYocF0w+C1aqSzjAxU0sbRvFE1qQ/z8qdVqv+8Ja+yGBfuR77o
         B7f+9MHKH9ISEPyPndluj5bgjgbmKLppvQ4dMeM19tR+d/yfbHAFho4clLifZbtmvKz3
         RUuDpsrO1R3aanUFTJ8y/FfUr45L1fPVRxfFfNw/c/3+jeAk/ra9rAsT5U1EaJ2P2TEi
         oPIUj7u/WNUniVqQmCPyHTg+WzPI3F4svQjGUm5uTxvcpeTr8LG/0WGaxmSqv+rEOHtc
         4mhKFD1X8FH+/QDCyBURuqivGe0l1p3NBjKVjQyns/MWhjUG28VmtfYdAHK3KIQJQ7YR
         MHsA==
X-Gm-Message-State: AOAM53222rKrPkyJwCY8BAIpEwgXEAKlDhTp0eyY+nUqtbORpp6NAkgR
        CpHOhux5XMrQmmeOUE1G1r0=
X-Google-Smtp-Source: ABdhPJzT35znkDsYPpNwzbl2gwRkfoNOIleofGLEyIPe6UU9aPqaeBzWfZgXMXlXt0oNFczDXycuLQ==
X-Received: by 2002:a63:2446:: with SMTP id k67mr3836750pgk.360.1625211116192;
        Fri, 02 Jul 2021 00:31:56 -0700 (PDT)
Received: from localhost.localdomain ([40.83.88.183])
        by smtp.gmail.com with ESMTPSA id bx12sm1775080pjb.22.2021.07.02.00.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 00:31:55 -0700 (PDT)
From:   ainux.wang@gmail.com
To:     jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        ainux.wang@gmail.com
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        sterlingteng@gmail.com, chenhuacai@kernel.org,
        chenhuacai@loongson.cn
Subject: [PATCH v6 0/2] hwmon: (pmbus) Add support for MPS MP2949A
Date:   Fri,  2 Jul 2021 15:31:40 +0800
Message-Id: <20210702073142.15166-1-ainux.wang@gmail.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: "Ainux.Wang" <ainux.wang@gmail.com>

PART 1 (The chip driver):
Add support for MP2949A device from Monolithic Power Systems, Inc. (MPS).
This is a triple-loop, digital, multi-phase controller.
This device:
- Supports up to three power rail.
- Provides 6 pulse-width modulations (PWMs), and can be configured up
  to 6-phase operation for Rail A , up to 2-phase operation for Rail B
  and up to 1-phase operation for Rail C.
- The PMBus registers are distributed into three pages: Page 0, Page 1,
  Page 2. Page 0 contains the registers for Rail A and most of the common
  settings for all of the rails. Page 1 contains register information for
  Rail B. Page 2 contains register information for Rail C.
- The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
  IMVP9.

v6:
- Add mp2949a_read_byte_data(), mp2949a_read_word_data(), and the mp2949a
  do not support STATUS_BYTE, STATUS_WORD, and VOUT_MODE ,but return some
  random data when reading them.

v5:
- Moved change log to right here.

v4:
- Removed mp2949a_read_byte_data().
- Added space before and after '-' and fixed a bug that is '~' on line 35.

v3:
- Added change log here.
- Errors in the document have been modified.
- Fixed PMBUS_VOUT_MODE to MP2949A_MFR_VR_CONFIG.
- Removed unnecessary vout_params and empty line.

v2:
- Reference has been added to Documentation/hwmon/index.rst.
- Droped 'vendor'.
- Removed change codes of the PMBus core and added mp2949a_identify()
  and mp2949a_read_byte_data() to this driver.

v1:
- Add support for MPS MP2949A.

PART 2(PMbus Core):
There is a case(like MP2949A) that the chip do not support STATUS_WORD
and STATUS_BYTE command, but return some random data when reading.

So we should call read_status() instead of i2c_smbus_read_word_data()
and i2c_smbus_read_byte_data(), and the chip driver should implement a
read_word_data() function and a read_byte_data() function to return
-ENXIO.

Ainux.Wang (2):
  hwmon: (pmbus) Add support for MPS MP2949A
  hwmon: (pmbus) Try use read_status() to read status register

 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/mp2949a.rst  |  44 ++++++++++
 drivers/hwmon/pmbus/Kconfig      |   9 ++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/mp2949a.c    | 136 +++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus_core.c |  20 +++--
 6 files changed, 206 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/hwmon/mp2949a.rst
 create mode 100644 drivers/hwmon/pmbus/mp2949a.c

-- 
2.18.1

