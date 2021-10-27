Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F81CC433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Oct 2021 07:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87BDC60C51
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Oct 2021 07:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240531AbhJ0How (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Oct 2021 03:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240581AbhJ0Hov (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Oct 2021 03:44:51 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93B8C061348
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Oct 2021 00:42:26 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id u6-20020a17090a3fc600b001a00250584aso4403202pjm.4
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Oct 2021 00:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:in-reply-to:references:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=EvWO9/aP2UYkWDRoMSk+UDHZ7nRats7jMQJQZIEXWAU=;
        b=k0uypuoa/tSMIoB+UArjlA7+U5joF88Bjt7a/jjC+VozJJHJorpHFAPYgUAv3TcPb5
         IooaM7AQRTLfNG1fcIu0e+jKw6OYKnqD2klEG0e6Y1J8UI+NZQso5uCGvvRU8KbsenWu
         sWpWZzr69WDdZI5fvIKdRC3bBZ0E2mpKmANl1KUdnqgL64Yv6QZM14xXeJVHhpdiR5Ix
         A92BxQ8OL9PrwpFB2L9HX6x75a1aDw89wSHnH4B4awmYMA58jqXMF8NHXvL3BFfIDd8S
         11hgRoSD//YWuA8GCLsggL0PkUXx92NPm1AstguVi9m8fPjndlhC6XLGETnX+bzlKyGH
         BFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
         :cc:subject:content-transfer-encoding:mime-version;
        bh=EvWO9/aP2UYkWDRoMSk+UDHZ7nRats7jMQJQZIEXWAU=;
        b=g548HQE9whGTH5wkt5DEdRsTsdI3Y+a9CLdxSP4yV5BUA28FDqurDAUJJGiY2IZQif
         TvHDFnh81XCsvQik+7vZ/C+HxAvUhUatnsb07EvcB76OsBP1CW8q1S3yppqUDZpo5lpc
         VB4bEMBejgDl8iXQDohg/tcnUtEO6aynbih9DunLoS+gf7pBESl9FTVSwU6RxbLWOW4C
         t96v+hYHzbBi1YpZWOevw5AyeIzNvnNkx0AIct4w668NsI3Ut32ZwxMZdYiykWK5BxE6
         GhDlNsjuhhJB1XrRs6/39xtF6aLxf/OYlJ8iry5S6VUxEtPU9FwqO7yviWXt9KH2M+fG
         KtAg==
X-Gm-Message-State: AOAM530GrVHRid/5oC5Eo6qs7sauD6ciLBFmUWel7jM+HxdVvtwmloqP
        si8pHEK0iR3fm/Ap9rtbXPrlErw3jE2GcgBr
X-Google-Smtp-Source: ABdhPJyf8nYG8qW81/yolRdeZUerGGa9z3mseuZofnD2TXanUqJezx9SKGVMO/KNngkgyBfXtZQpCA==
X-Received: by 2002:a17:90a:cc05:: with SMTP id b5mr4099506pju.71.1635320546280;
        Wed, 27 Oct 2021 00:42:26 -0700 (PDT)
Received: from [127.0.1.1] (117-20-69-24.751445.bne.nbn.aussiebb.net. [117.20.69.24])
        by smtp.gmail.com with UTF8SMTPSA id c85sm10272618pfc.146.2021.10.27.00.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 00:42:25 -0700 (PDT)
Date:   Wed, 27 Oct 2021 07:42:12 +0000
Message-Id: <20211027074212.690611-0-nathan@nathanrossi.com>
In-Reply-To: <20211025025805.618566-0-nathan@nathanrossi.com>
References: <20211025025805.618566-0-nathan@nathanrossi.com>
From:   Nathan Rossi <nathan@nathanrossi.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Nathan Rossi <nathan@nathanrossi.com>,
        Nathan Rossi <nathan.rossi@digi.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 0/3] Driver for TI INA238 I2C Power Monitor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Nathan Rossi <nathan.rossi@digi.com>

Changes in v2:
- Added device tree binding for ti,shunt-gain to specify the target
  ADCRANGE for the ina238
- Reworked ina238 driver to use hwmon_chip_info API, and addressed
  various review comments

Nathan Rossi (3):
  dt-bindings: hwmon: ti,ina2xx: Document ti,ina238 compatible string
  dt-bindings: hwmon: ti,ina2xx: Add ti,shunt-gain property
  hwmon: Driver for Texas Instruments INA238

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |   7 +
 Documentation/hwmon/ina238.rst                |  56 ++
 Documentation/hwmon/index.rst                 |   1 +
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/ina238.c                        | 672 ++++++++++++++++++
 6 files changed, 749 insertions(+)
 create mode 100644 Documentation/hwmon/ina238.rst
 create mode 100644 drivers/hwmon/ina238.c
---
2.33.0
