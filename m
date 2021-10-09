Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E392CC433FE
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Oct 2021 12:03:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD5D460F5D
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Oct 2021 12:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbhJIME5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 9 Oct 2021 08:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232889AbhJIME4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 9 Oct 2021 08:04:56 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75DF9C061762
        for <linux-hwmon@vger.kernel.org>; Sat,  9 Oct 2021 05:02:59 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y15so50452341lfk.7
        for <linux-hwmon@vger.kernel.org>; Sat, 09 Oct 2021 05:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=2SmIeY3RvR+sxAopTjlz48utuRp0cXC6WogM9AzM3+w=;
        b=RWuIhFX2NytzmMPip7mieWDbvO63CsBh8wu43qcuEZDcqeFhoXbloJnejuZc5os9rZ
         F/8It8F/SFyRKKUZuCki1R9oqceGh9Kqk8k4zPO3G8XPV8XYV4q4bzRT43hcotE887ls
         nAKjUEEEH/lUxdwN6ysim2SX17Mu0EBkR1MwXNpz4gWXnkVca4V41mtYYs/t3VwtZJmV
         hl/fT7vGyDxv3NLIMIckD3BXb63r9t0Cm4he8McbyGes5iDc2TAwoEYYsMPL8n0lfkvn
         vFzq6c12JIwSY7vvCrNle+kbeugP2CSV4MUOyzyNHTsHQ2Wvju8E1xiHoSN+LgEGXDZM
         kjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=2SmIeY3RvR+sxAopTjlz48utuRp0cXC6WogM9AzM3+w=;
        b=TCeS0RlDaxRJ42mVOMNOZXvk850rk8F/ychYGeZT0nhMZS9z+Uk5xNpojFWjGqdFNd
         UuKm4KNwAfkhuPZAqgj2uUR+DXTQtTKd5kn/NVS6LuT4U36cBH/wpEa5tA38pPKAK0HA
         DY7l1o9/ENb1kTcvDnQgWbQ5TZ4zJZw4calaLLw2IUiHca/LvvgIWuLPqgvR5RR4ZSMC
         FsgRYk97v9+7V7LmBQY0/4zdgxIwLQ+7fOayIZbKzGEZzr+Tk8flvrGTi9BZswiSilcH
         6x/cK/A9m9ytuowwG6p2Op1ncOsRKIc30AeI9Btme34Z3PXQxxJze6aJgvP1KlzsxtVg
         MGNg==
X-Gm-Message-State: AOAM532IMj1gDwN5gXPK2zUpSy+GOE7HWOpjB23WWn95/48UpXCMcuZ4
        jPvVjUn2AnDbTjrcHQP90Md5Xz0caHaO3iGGtY5lVA==
X-Google-Smtp-Source: ABdhPJyTTVUNOFh0n7PTuZupjbgEZGP7eVl+eNzFcqCcRU0Ygs5MfN4sxLUcyaVQNsM7nVXVXgKtwfpd2fwma75r664=
X-Received: by 2002:a05:6512:3e03:: with SMTP id i3mr5268396lfv.273.1633780977440;
 Sat, 09 Oct 2021 05:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211009025858.3326725-1-osk@google.com> <20211009025858.3326725-2-osk@google.com>
In-Reply-To: <20211009025858.3326725-2-osk@google.com>
From:   Oskar Senft <osk@google.com>
Date:   Sat, 9 Oct 2021 08:02:41 -0400
Message-ID: <CABoTLcR6GM9ynHfyzBF75hVVa_OWja6ibK_37Lx08Lz=Mr9i7A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hwmon: (nct7802) Make temperature sensors configurable.
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Changes from "PATCH v2 2/2" to "PATCH v4 2/2" (v3 was sent with a typo
by accident):
- Added "RTD_MODE_*" #defines for readability.
- Improved readability in "nct7802_temp_is_visible" and fixed error
due to missing parentheses
- Refactored "nct7802_configure_temperature_sensors_from_device_tree"
into "nct7802_get_input_config" and "nct7802_configure_inputs" for
readability
- Restructured "nct7802_get_input_config" for v4 dt-bindings.

Thanks
Oskar.
