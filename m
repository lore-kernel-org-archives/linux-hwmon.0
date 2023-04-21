Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489FEC77B75
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Apr 2023 10:45:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjDUKpl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Apr 2023 06:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjDUKpj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Apr 2023 06:45:39 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5A683D7
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Apr 2023 03:45:38 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f177cb2c6cso10467825e9.2
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Apr 2023 03:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682073937; x=1684665937;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XGLmrMK5hsFt7MA5b3W8QYIlMFhbrcD7TuHUS1xnhIQ=;
        b=X8DROEXFxyZ07cP94UtuVZq8wSUIvv+PnECEGV7tBz5+h5ovQDIJi9bYTAF+LVBXRq
         WeXh81F961KSQ7tzFVVnRHl5RwCCS+ADpY2mY/TG+TOA/CRLSV6AAIH6eUy+TNqp+ugW
         gDNAOPbtUDimFdW4YpprBPOH3HzX6foxPX8VjZx6bapCCqGayuEJYhFT9Z4cfG3o+BAi
         GkctPgswnJ+gq/LyxVjTWaDR1BvVsjSx1RSDUZXMpFON4f++ad+nVc+1A67U6n12mzKH
         jYegIkhJFjuVY5zzk88oJsVNpa7iW5dCa+3HV6KdxcSKtmVSiHARRJkpPJ8nxK3E84OT
         0/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682073937; x=1684665937;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XGLmrMK5hsFt7MA5b3W8QYIlMFhbrcD7TuHUS1xnhIQ=;
        b=AqEKvlUXXfywk7CaXaiirxoPLmw41tDDhNPPuU0WffyCQLE/p+mfCOeBNLzUEjyl9D
         bm8cJ7rPixr4yIbKU+IiQ9Ssvl2rxN8wB7DGfj0bwOZqhxLAJLqhhha5wPomc8QqX9XL
         IfghcRj9o7ILJlekY02cU+m4gpF0S88AarhMVAAqzI4dLDO3XlpKth17eT5PX+5Qp6UB
         zpOnl0IY83YbAYtu//2/1GUXUzlU6GIgzVCce0iOU2Q88MIKXhowkQniiRDQyn6JCXCO
         ZW+9cPsL5+C4IN6ejMwsDkFGtekgYFiN3oelnouvovLYMRVwEO48AaMl8ZJrnKqjQNGl
         JvDA==
X-Gm-Message-State: AAQBX9eNwll7IqUhYr23zf41r/JF7TwoqVsq5b/Ij8q8QjZJA7r4AYYW
        1zX03NfUciZRKRlqnz3suSPIDg==
X-Google-Smtp-Source: AKy350b4srZl/XudFA4rBIoycHDM7OBO5cvvyp95edDz5txCJsTlxFz5U5Qi3sX/aSnb6BIJGo908A==
X-Received: by 2002:a05:600c:244:b0:3f1:954f:82e3 with SMTP id 4-20020a05600c024400b003f1954f82e3mr516147wmj.24.1682073937022;
        Fri, 21 Apr 2023 03:45:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003f191c9c4b0sm1488547wmc.11.2023.04.21.03.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 03:45:36 -0700 (PDT)
Date:   Fri, 21 Apr 2023 13:45:34 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     frank@crawford.emu.id.au
Cc:     linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: (it87) Test for error in it87_update_device
Message-ID: <112b38d0-54b5-435d-9ce6-250b8b0e78fb@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Frank Crawford,

The patch 27302e7a46f5: "hwmon: (it87) Test for error in
it87_update_device" from Apr 16, 2023, leads to the following Smatch
static checker warning:

	drivers/hwmon/it87.c:1147 show_temp_type()
	error: 'data' dereferencing possible ERR_PTR()

drivers/hwmon/it87.c
    1141 static ssize_t show_temp_type(struct device *dev, struct device_attribute *attr,
    1142                               char *buf)
    1143 {
    1144         struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
    1145         int nr = sensor_attr->index;
    1146         struct it87_data *data = it87_update_device(dev);
--> 1147         u8 reg = data->sensor;            /* In case value is updated while used */
                          ^^^^^^^^^^^^
    1148         u8 extra = data->extra;
                            ^^^^^^^^^^^

    1149 
    1150         if (IS_ERR(data))

This new check happens too late.

    1151                 return PTR_ERR(data);
    1152 

regards,
dan carpenter
