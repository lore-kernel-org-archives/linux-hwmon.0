Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5C9C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Nov 2021 23:48:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7196F611F0
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Nov 2021 23:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhKIXvI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Nov 2021 18:51:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhKIXvH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Nov 2021 18:51:07 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3D1C061764
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Nov 2021 15:48:19 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id o4so1732634oia.10
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Nov 2021 15:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kaDbipLq2ogi1GhMQ/TWRnTf3Fkbigm7FdczyFKaLUM=;
        b=PadLehfl30/Pbn8m7n1zC3IoljlfHeX5KW/MhtCOiYXmhL8BUOLx0WmWYyuViO55Df
         wbSlNI+IWi77+eYgyGPEhq6oAysEVZsm51KONwi9avXFtIqH/NaKW81nY4QzxtcgBHT0
         mEE+h7SEZ9ElYQCLOzK0xjSK+bWTmGSlRVQsQM4PLyawKPFirqq0W8xyUHKwW+/ulq2H
         MWiXbdpl6bAsjjRHEoXWyzVKxP97bgew+nVjeKILhDHk6gTUdf4RxoCkp00Ggp9Smpr3
         Ju8+aIgeAZM6402wYhaYFMJnhgnxXNAYdUURpWR/sFftoxEv58J4nUec6Ok2hp7anpnX
         CNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=kaDbipLq2ogi1GhMQ/TWRnTf3Fkbigm7FdczyFKaLUM=;
        b=D2oQZmZXAmuKJxz63LAthA6GMPSXUvvlcWs60lzr41o9sfXbC18GEOU0j+lHQvX66N
         4VM0zkG6GNHdDLlNRwFBQvKe1jW/iwSV3KifII/nreubBvH+XJyMtSv1PuqMUGrByh5G
         PImJlxMCFNJdzxzonx9sIbtj2HaG9uuteJYGLdwWdbj0ii+cdTeP2vJ4mBV6BMEa2xUz
         JbrnG3t76dcPNO1xTTuiRsxn8q0OrjAway39dXad9HWBwVuQuLIJ6VF45/9R0wlCPG7l
         3oDrxVwWpI3O7XANl6U8J8w3nbLKcjw1H8QBIem/KLGliH2EMB5HYy0oUa9LJSvYtIHh
         PCow==
X-Gm-Message-State: AOAM533z2wXgoZKJB5D6IyQ5BD9R0j3J3e8Uq9XrnN/EY5m0d64UwuhJ
        DXbhNUjs/7l6AaJR1xnn6TcGpqH6llY=
X-Google-Smtp-Source: ABdhPJz/i7UhGVBtwuQ81dRo/U/x0gyVpJBksSgpmyyBq6UNUjC8kATpAzMPHyAO0ImFTcTFhH6DCg==
X-Received: by 2002:a05:6808:1491:: with SMTP id e17mr9281382oiw.153.1636501699123;
        Tue, 09 Nov 2021 15:48:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s9sm2408065otg.42.2021.11.09.15.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 15:48:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/4] hwmon: (tmp401) Various improvements
Date:   Tue,  9 Nov 2021 15:48:10 -0800
Message-Id: <20211109234814.3724798-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series converts the tmp401 driver to use
devm_hwmon_device_register_with_info(), and it converts the driver
to use regmap. This results in a code size reduction by approximately
20% and data size reduction by approximately 50% when building the
driver for x86_64.

----------------------------------------------------------------
Guenter Roeck (4):
      hwmon: (tmp401) Simplify temperature register arrays
      hwmon: (tmp401) Convert to _info API
      hwmon: (tmp401) Use regmap
      hwmon: (tmp401) Hide register write address differences in regmap code

 drivers/hwmon/Kconfig  |   1 +
 drivers/hwmon/tmp401.c | 862 ++++++++++++++++++++++++-------------------------
 2 files changed, 431 insertions(+), 432 deletions(-)
