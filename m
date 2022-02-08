Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7471AC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Feb 2022 09:31:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354771AbiBHJa7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Feb 2022 04:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237653AbiBHJa7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Feb 2022 04:30:59 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B88C03FEC0
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Feb 2022 01:30:58 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id f17so29589637wrx.1
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Feb 2022 01:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tjiJ/tFjTa3PfaScydFCb7D+sU8sg55vw7smaikiD6o=;
        b=HxW49INp/nml/mkNGyGhLCMkCiQU8Wpv70w8rkDCjXfh/gKTpuOJ7WEiy4JLynBitO
         drRAoz+4aaSgSFSFthohmr3sGnwVCHbQYejpqUoc8jz1LXLOhASbK38WJrbBJRknTat9
         skzO5SsTlLXZEH+hfGjbA5AUd6K1cF0XjzP5zhopgDwkUISCXZ08YgUNVpIUGJHtkQpo
         8ST7fgBerm5Xps0FIIctxpsrCncN7OL++/hdUipNJIgqfsgX8OgRRHzhnObJd70CEGuz
         MPgEvM71ykbNSre0pOgUcS73+Qo+qdQlasToGxaP3oGJ4r+lGaLKh7itAtXyutHOBxNC
         s8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tjiJ/tFjTa3PfaScydFCb7D+sU8sg55vw7smaikiD6o=;
        b=7/Tz1xxjbCpLxUeesUhW/3dcdz2OKCmW6ZtyCjM11Hy+CYWfZ8F0sDkROghM9ywhHn
         lT+tHKbK0FeYqRuehxgnLSAZmtw6YiW6HFE0WEsorFZnGytGPkPhM5+xtZjK/1QDDTe0
         NfFIVK8eDty5LgIFJhI4sw4O4/drLDO5nYTBV4xiKK5Pv7245Fnu59C1zls102Od/U94
         9m+AzvZYpJbC4y95kHQjlncpoXzp0rh/4ctUveUQX/5UAcQuEFf2NX3NOXcSSEsdD86d
         U4iv59D/9bj17sUFmE6CzSBmJ+tbtZ785Z2XSLcwzmGy71Uh2rOn+ERcg7ektodOGm6o
         TOIg==
X-Gm-Message-State: AOAM530bgBMN2N/tDkwXhmtWVa0KLp29Dx30bi/WUKAhS0fiZw+JpnUh
        yDVyw3/UnK3YNwIdD2fLm0Y3xA==
X-Google-Smtp-Source: ABdhPJxqrqO9SsB/BuD4bnHMYYfhif+nR7D2J0XTHgePIIWU5cfCw+50GtLNm0TkhR2QVjCGo2nd/w==
X-Received: by 2002:a05:6000:170c:: with SMTP id n12mr2838251wrc.380.1644312657227;
        Tue, 08 Feb 2022 01:30:57 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id l40sm1609872wms.0.2022.02.08.01.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 01:30:56 -0800 (PST)
Date:   Tue, 8 Feb 2022 09:30:51 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     broonie@kernel.org, robh+dt@kernel.org, kernel@pengutronix.de,
        lgirdwood@gmail.com, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, rui.zhang@intel.com, alistair23@gmail.com,
        amitk@kernel.org, linux-arm-kernel@lists.infradead.org,
        andreas@kemnade.info, s.hauer@pengutronix.de,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org
Subject: [GIT PULL] Immutable branch between MFD, HWMON and Regulator due for
 the v5.18 merge window
Message-ID: <YgI4S6vX9FrCb9/j@google.com>
References: <20220124121009.108649-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124121009.108649-1-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Enjoy!

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-hwmon-regulator-v5.18

for you to fetch changes up to de34a4053250781404779b567b58dd97af689ce0:

  hwmon: sy7636a: Add temperature driver for sy7636a (2022-02-08 09:27:33 +0000)

----------------------------------------------------------------
Immutable branch between MFD, HWMON and Regulator due for the v5.18 merge window
----------------------------------------------------------------

Alistair Francis (5):
      dt-bindings: mfd: Initial commit of silergy,sy7636a.yaml
      mfd: simple-mfd-i2c: Add a Kconfig name
      mfd: simple-mfd-i2c: Enable support for the silergy,sy7636a
      regulator: sy7636a: Remove requirement on sy7636a mfd
      hwmon: sy7636a: Add temperature driver for sy7636a
 .../devicetree/bindings/mfd/silergy,sy7636a.yaml   |  82 ++++++++++++++++
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/sy7636a-hwmon.rst              |  26 +++++
 drivers/hwmon/Kconfig                              |   9 ++
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/sy7636a-hwmon.c                      | 106 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |   2 +-
 drivers/mfd/simple-mfd-i2c.c                       |  11 +++
 drivers/regulator/Kconfig                          |   1 -
 drivers/regulator/sy7636a-regulator.c              |   7 +-
 include/linux/mfd/sy7636a.h                        |  34 +++++++
 11 files changed, 276 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
 create mode 100644 Documentation/hwmon/sy7636a-hwmon.rst
 create mode 100644 drivers/hwmon/sy7636a-hwmon.c
 create mode 100644 include/linux/mfd/sy7636a.h

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
