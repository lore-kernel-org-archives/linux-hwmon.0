Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35604C352A1
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Dec 2022 12:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235317AbiLFMFP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Dec 2022 07:05:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235313AbiLFMEn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Dec 2022 07:04:43 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C86728E02
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Dec 2022 04:02:03 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id t18so3984001pfq.13
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Dec 2022 04:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUoakayqhFKDKE4DaNdlFCE2+L8ZIJYRgf5IW1pz5X8=;
        b=W9m/Uy4KJ/Re3ir1JS2F85EUSV0+y6F5l+lTOsLBV6DVCvwszUnYmaJKpYagi4Bldw
         xEEvmZZs8OUIj7bkULWxPgNtwdEMD5eSf4rwlvIg2oIQr0kYpHHYsZOlaSPx5x+Hpp96
         ALbbLegI/65/K5H7ELSPWmUyd5nWkBXt/MXbaQoJGcl+WRUjLmnAQcLWb1hgoW/5n2kc
         4IyYZoIATqcDN3trZ2APFP/aj85hFp0kk1K/oSm8Do5TAP0g+IVMxz783FvH6a8iGs65
         YW+OUd/ph3gbvliYwWx3uTOVUvjoopdR0VzbxrmKw/C3NXF7Y9IKSUFjPzBC9h4m8DHK
         N4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUoakayqhFKDKE4DaNdlFCE2+L8ZIJYRgf5IW1pz5X8=;
        b=MvB+V/GWdsyp3oB+BdqMws8tNLZ5hKWfBFGU8B3NX/7vNXaz2+rQGRlX9UGd9iyt/y
         VaIAiH6/XzYlaVNPrqd5emRpSK41/+rhaasmbx2rWu9ukAjEMDitXtDChghz6ENNpao4
         Rt/w1n/OseVEpFLERt038Ke0BAVWjNIjYhb8aXbNVsmblwigSlymF2RC8sUAlaNHKrpi
         29l8cSkUn33swWAR/LqHQTfog8GDac7hH2CuBL4OkjbLT/3aRewaO1UdCZV5tfLnITFq
         0nAl+IjIlqc1S7Xtta2m83lBjHAcxz+FJJRAQfE5dzD4TjaMXGz4RuCE33+/y4dG8jxz
         m4Tw==
X-Gm-Message-State: ANoB5pk89vJnmQC2xrYb9xqdkXwkeojDeBS6sLHcfH1mJoxZOocOHaIk
        xwb4zTiqZCJRZTu32AMVFH8=
X-Google-Smtp-Source: AA0mqf48tPPb6q5sAKo/3k5i0qCdV00M4VVrB74tcUjzLr8zSBtEO7xcSKjqRsEAEidNsdhv8cKLTw==
X-Received: by 2002:a63:2251:0:b0:476:cb2a:b99b with SMTP id t17-20020a632251000000b00476cb2ab99bmr78744813pgm.436.1670328122675;
        Tue, 06 Dec 2022 04:02:02 -0800 (PST)
Received: from localhost.localdomain ([193.122.98.110])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709027e4a00b0018912c37c8fsm12376560pln.129.2022.12.06.04.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 04:02:02 -0800 (PST)
From:   Xingjiang Qiao <nanpuyue@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Michael Shych <michaelsh@nvidia.com>,
        Xingjiang Qiao <nanpuyue@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (emc2305) fix unable to probe emc2301/2/3
Date:   Tue,  6 Dec 2022 20:01:49 +0800
Message-Id: <20221206120149.176298-1-nanpuyue@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <eeb76b93-53d5-bc5b-b132-475c11f8ce1b@roeck-us.net>
References: <eeb76b93-53d5-bc5b-b132-475c11f8ce1b@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> Please stop sending new versions of your patches as reply to previous versions,
> and please provide change logs. I have no idea what is different between
> versions 2 and 3 of this patch, and v2 as well as v3 almost got lost.
> 
> Guenter

Sorry about that.

And the changlogs of the patch 1/2 is:

- V1 -> V2: Just remove the check for 'EMC2305_REG_DEVICE' instead of
  moving the functionality of 'emc2305_identify'
- V2 -> V3: Reword the commit as there is no emc2304

changlogs of the patch 2/2 is:

- V1 -> V2: No substantive changes, was going to send later, but v3 has
  being sent before that (sorry about that again)
- V1 -> V3: Add 'emc2305_set_cur_state_shim' to avoid updating
  'last_thermal_state' when cooling state is set by 'hwmon' subsystem

The v3 patch 2/2 can be found at:
https://lore.kernel.org/all/20221206055331.170459-2-nanpuyue@gmail.com/

Should I resend them?

One more question about 'EMC2305_FAN_MAX_STATE':
https://lore.kernel.org/all/20221206053029.169506-1-nanpuyue@gmail.com/

> The value range of the chip's 'FAN DRIVE SETTING' register is 0-255.
> But currently, the driver can only set up to 10 values at most (even via
> the 'hwmon' subsystem) when the 'thermal' subsystem is reachable, and
> there is no way to increase this limit via "emc2305_platform_data".
> 
> Should the "pdata->max_state > EMC2305_FAN_MAX_STATE" check be removed?
> Or 'EMC2305_FAN_MAX_STATE' should be defined as '0xff'?
> 
> This should be the third patch?
> 
> 
> > 	pdata = dev_get_platdata(&client->dev);
> > 	if (pdata) {
> > 		if (!pdata->max_state || pdata->max_state > EMC2305_FAN_MAX_STATE)
> > 			return -EINVAL;
> > 		data->max_state = pdata->max_state;
