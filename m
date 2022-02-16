Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EF9C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Feb 2022 17:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236999AbiBPRV3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 16 Feb 2022 12:21:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbiBPRV2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Feb 2022 12:21:28 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D72EC8F97;
        Wed, 16 Feb 2022 09:21:16 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id e79so467233iof.13;
        Wed, 16 Feb 2022 09:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UJaHZHc1xHM/A3qYVIZJ6dTkPAa44xPWy6lI41Jb8zc=;
        b=PIH0lWe+MqF7fiEZDQHvADbr032rjI9xdWz8egY9lEtTimTMsk2OzQRP52b2V1vVWg
         RlaWGXDc4GhRTJn2btKgVtH7v79zFWdbETdoreI9o2DQhAvXg6tdUdV9eKO4JQkLbHjF
         iAzBNcVXWWL5P4kLBLbZ2/qWnG2DYj6KS0DDTgJ0xCPUDX2+HW/OuWJ1Gh9ZCh9wga/k
         5niNqKsr0+MTcgVRZbzF7gncNnZ49YhnowangdFozEp0a1ALairKFS2k8ZNfOkZL2gVx
         nDRhdfruTLoUHOYfJgur/mpBt84BipU9CwFIbsTsQWKI4snaUUFUKW1UlXIaDEajmqCI
         vOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UJaHZHc1xHM/A3qYVIZJ6dTkPAa44xPWy6lI41Jb8zc=;
        b=LMaY7DXGNVU4cUiZzPZTQx3eftfZKnIfHL3qYLB7M0UY86F1TvdetMcUJpCxQYdH8n
         +Gn0x8Y18EU4PC9HHJkJ08OJ1ktQjJ4cSiX4ovUAKtlWltHxxPaTzoj8eVMbl9W4XDlE
         AWfoH2Pk0iPsFXo42sECesVgSRrJrWvRiRiGmpBcIidxeuLeSWnz6Zgf9MMA8rFykYN+
         mDUjzSQjfxhHn/3893xk7No24YDYCcxOqgplJeTFjGp/+XWnrE10YezKIYV/LctsWv/T
         9faMom58LjvCAzJJmdXW3SfsTaZXhRPW4NW5eWwh5dAk60LsNJyvrg14wP+zwgpSiQXc
         IKFg==
X-Gm-Message-State: AOAM533o7W3rb+b588jfTy/f+fjzojHVkp2hWLaBmoXtWflpmdYl2RuC
        cFJnsKBDTeb3Pk26sj7c9sOPQaQilIPDAMEt6qmzqnvIMaQ=
X-Google-Smtp-Source: ABdhPJzhBoDQFjt4dfGT/hRoS0OdJLflAt6LRozpHdnLXVj5E2rU4KBgHW8mhYVoAUn2rpii9YyOm9AxoDE8WFIMXqg=
X-Received: by 2002:a5d:83c8:0:b0:604:c09b:259c with SMTP id
 u8-20020a5d83c8000000b00604c09b259cmr2605022ior.106.1645032075897; Wed, 16
 Feb 2022 09:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20220216153407.2412409-1-eugene.shalygin@gmail.com>
 <20220216160128.2418025-1-eugene.shalygin@gmail.com> <01c6bafe-4e6e-98ff-fa4c-01060f251049@roeck-us.net>
In-Reply-To: <01c6bafe-4e6e-98ff-fa4c-01060f251049@roeck-us.net>
From:   Eugene Shalygin <eugene.shalygin@gmail.com>
Date:   Wed, 16 Feb 2022 18:21:04 +0100
Message-ID: <CAB95QAQSRS5KfuZZCPqm2xjeZZFojn0fsYi=X9t1ZBDYxMqn-w@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (asus-ec-sensors) merge setup functions
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> Please use checkpatch and fix what it reports,, and please
> do not send patches as reply to previous versions of a patch
> or patch series.

Sorry, I don't really understand what are the preferences for the case
when some of the local variables are declared with initializers, and
yes, I was told once to use the reverse christmas tree arrangement.
Hope this time it's OK.

Regards,
Eugene
