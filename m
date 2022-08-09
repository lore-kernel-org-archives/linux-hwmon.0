Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2957C19F2D
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Aug 2022 21:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbiHIVDv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Aug 2022 17:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbiHIVCT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 17:02:19 -0400
X-Greylist: delayed 346 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 09 Aug 2022 14:02:15 PDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551BD31236
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 14:02:14 -0700 (PDT)
Received: from hatter.bewilderbeest.net (97-113-235-229.tukw.qwest.net [97.113.235.229])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id E93D12D8;
        Tue,  9 Aug 2022 13:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1660078583;
        bh=Ul9Yh/Gcz4f8/vpWEFg+TKpRidrUtsJn1ufJOS5iBsw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OoqMYsBr3ydOEkUSnjr0XGTXJ2TcOGgM+i7mrNsR7tp9Rf+MUdAjRYh1k/uh0EYKd
         5ApcxjHVJ1bDOPaLKD2eZG1LC1suFeY6TiL+hjj0o5Zu1mK06ROI3EZ83MI6CbaFd7
         7NDrpa7pJ3qVjFctbc8PpE6Vmb+AVYpfYdN1hg8g=
Date:   Tue, 9 Aug 2022 13:56:21 -0700
From:   Zev Weiss <zev@bewilderbeest.net>
To:     =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: PROBLEM: NCT6775: suspend doesn't work after updating to Linux
 5.19
Message-ID: <YvLJ9TQeXP/miUgT@hatter.bewilderbeest.net>
References: <f5990ef1-4efe-d2b1-8e50-c6890526c054@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5990ef1-4efe-d2b1-8e50-c6890526c054@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Aug 09, 2022 at 01:27:48PM PDT, Zoltán Kővágó wrote:
>Hi,
>
>[1.] One line summary of the problem:
>NCT6775: suspend doesn't work after updating to Linux 5.19
>
>[2.] Full description of the problem/report:
>After updating my kernel from 5.18.11 to 5.19, I've noticed that 
>resuming after suspend no longer works: fans start up, then about a 
>second later, the computer just shuts down, leaving the USB ports 
>powered up (normally it turns them off on shutdown). The screens don't 
>turn on during this timeframe, so I can't see any useful log messages.
>
>Bisecting between 5.18 (where it still worked) and 5.19 lead me to 
>commit c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd "hwmon: (nct6775) 
>Split core and platform driver" which looks like a refactor commit, 
>but apparently it broke something.
>

Hi Zoltán,

Thanks for the thorough bug report.  You're right that that commit was 
essentially just a refactor, though there was one slight change to the 
nct6775_suspend() function introduced during the review process that 
may perhaps have had some subtle unintended side-effects.

Can you test the following patch and report if it resolves the problem?


Thanks,
Zev

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 446964cbae4c..da9ec6983e13 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -1480,7 +1480,7 @@ static int nct6775_update_pwm_limits(struct device *dev)
  	return 0;
  }
  
-static struct nct6775_data *nct6775_update_device(struct device *dev)
+struct nct6775_data *nct6775_update_device(struct device *dev)
  {
  	struct nct6775_data *data = dev_get_drvdata(dev);
  	int i, j, err = 0;
@@ -1615,6 +1615,7 @@ static struct nct6775_data *nct6775_update_device(struct device *dev)
  	mutex_unlock(&data->update_lock);
  	return err ? ERR_PTR(err) : data;
  }
+EXPORT_SYMBOL_GPL(nct6775_update_device);
  
  /*
   * Sysfs callback functions
diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index ab30437221ce..41c97cfacfb8 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -359,7 +359,7 @@ static int __maybe_unused nct6775_suspend(struct device *dev)
  {
  	int err;
  	u16 tmp;
-	struct nct6775_data *data = dev_get_drvdata(dev);
+	struct nct6775_data *data = nct6775_update_device(dev);
  
  	if (IS_ERR(data))
  		return PTR_ERR(data);
diff --git a/drivers/hwmon/nct6775.h b/drivers/hwmon/nct6775.h
index 93f708148e65..be41848c3cd2 100644
--- a/drivers/hwmon/nct6775.h
+++ b/drivers/hwmon/nct6775.h
@@ -196,6 +196,8 @@ static inline int nct6775_write_value(struct nct6775_data *data, u16 reg, u16 va
  	return regmap_write(data->regmap, reg, value);
  }
  
+struct nct6775_data *nct6775_update_device(struct device *dev);
+
  bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg);
  int nct6775_probe(struct device *dev, struct nct6775_data *data,
  		  const struct regmap_config *regmapcfg);

