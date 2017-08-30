Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34057 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750780AbdH3I2r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2017 04:28:47 -0400
Received: by mail-wm0-f67.google.com with SMTP id l19so990595wmi.1
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2017 01:28:47 -0700 (PDT)
Date: Wed, 30 Aug 2017 10:28:45 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: Re: [patch v1 1/2] hwmon: Driver for Maxim MAX6621 temperature sensor
Message-ID: <20170830082845.GD1903@nanopsycho>
References: <1504039609-152485-1-git-send-email-vadimp@mellanox.com>
 <1504039609-152485-2-git-send-email-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504039609-152485-2-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Tue, Aug 29, 2017 at 10:46:48PM CEST, vadimp@mellanox.com wrote:
>MAX6621 is a PECI-to-I2C translator provides an efficient, low-cost
>solution for PECI-to-SMBus/I2C protocol conversion. It allows reading the
>temperature from the PECI-compliant host directly from up to four
>PECI-enabled CPUs.
>
>Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

[...]


>+++ b/drivers/hwmon/max6621.c
>@@ -0,0 +1,531 @@
>+/*
>+ * Hardware monitoring driver for Naxim MAX6621

s/Naxim/Maxim/

