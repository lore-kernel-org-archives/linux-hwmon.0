Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DC2C6FD18
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 Mar 2023 04:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjC2Efo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 29 Mar 2023 00:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjC2Efo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Mar 2023 00:35:44 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1ED2D43
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Mar 2023 21:35:43 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so8746647wmq.3
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Mar 2023 21:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680064541;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wr0bq+uvtz3WY73dyJJXEkaMSmh6molCh5CbkTFcLXA=;
        b=BtBzio9naC/nfmNMAqee8BJWbUXZbHmqvxH4FXsGk+ECb+b1zQ6OJQen5NB/C83IMq
         2uWfVFIYgBsEY09PCRVs3LL3yfPhpqWGRBgEWW8KcF61RsTrLwvWZWy5LshZV/00wbhD
         faZ5KMM9htgW7UZqUe0um6yAewbr7hhVPj9shJqdp6vrYwQV4+lm0R+EgRbWCUU7innh
         zrSSO/mtD3NFymYx6uXcrkzK6gXuP4zMNVPmOmdoqw7r2JPWs35cHhZ66XlRDRoyVFqX
         FlywqUAefarWnQTuFUoV9j7iu2+SsEk4D1nUHBpMMjAFmE9kgGQoEpTNThoeFals6wTg
         gMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680064541;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wr0bq+uvtz3WY73dyJJXEkaMSmh6molCh5CbkTFcLXA=;
        b=HKBz97GetRhL7JcXsdMaeiO/QRYbD3zfQSgdLgcekfsxS9xyxT0NfV8luAVLkgLNfE
         xpAlthJfnKBaoMw0o7/I69bXc3MMDGMbA03Uz8qFkYa47XBPs+agA2Z0cLFtmEm067P0
         gGiXMkZrD/nD4KC6KYQTEcAjS/lzULLFPzb/MVfQLeXDNx5YHCa8iuqS3y1mpN+wEZi9
         RjeV3Lw1Qz7NLbLY6kqtY91SgW0xBOHABBgvevfvyOLkT2i+R5VwxGMtYRGngAa8yBMy
         W9oIGa+LAcwb4FUktwzropYx1lsF5B/nPQNOxMp1AwbzuS8qbhC7vAdtM3dc5nRl9mz9
         gRxA==
X-Gm-Message-State: AAQBX9eosH4N2ohqOnh81h0oa6CfqPVXiSK/ZY7x4EEBeAYiXa675tcO
        dQjpVKwNIvt2yXI0HxQMhvTJkTk0ReqN8w==
X-Google-Smtp-Source: AKy350bpYZLhWavHnWho3YjOU3I/sXujNBbVXFM5s4gktFaUbn4XmVm/lKefxXdAjlhZ0wcI42Ct9w==
X-Received: by 2002:a05:600c:358c:b0:3ee:f91:19aa with SMTP id p12-20020a05600c358c00b003ee0f9119aamr686471wmq.0.1680064541427;
        Tue, 28 Mar 2023 21:35:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bd6-20020a05600c1f0600b003ef36ef3833sm778738wmb.8.2023.03.28.21.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:35:41 -0700 (PDT)
Date:   Mon, 27 Mar 2023 09:04:40 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     daniel.lezcano@linaro.org
Cc:     linux-hwmon@vger.kernel.org
Subject: [bug report] thermal: Don't use 'device' internal thermal zone
 structure field
Message-ID: <072b9155-6671-4f7a-981b-d466ac222f27@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Daniel Lezcano,

This is a semi-automatic email about new static checker warnings.

The patch dec07d399cc8: "thermal: Don't use 'device' internal thermal 
zone structure field" from Mar 1, 2023, leads to the following Smatch 
complaint:

    drivers/thermal/thermal_hwmon.c:232 thermal_remove_hwmon_sysfs()
    error: we previously assumed 'hwmon' could be null (see line 230)

drivers/thermal/thermal_hwmon.c
   229		hwmon = thermal_hwmon_lookup_by_type(tz);
   230		if (unlikely(!hwmon)) {
                             ^^^^^^
   231			/* Should never happen... */
   232			dev_dbg(hwmon->device, "hwmon device lookup failed!\n");
                                ^^^^^^^^^^^^^
hwmon is NULL.

   233			return;
   234		}

regards,
dan carpenter
