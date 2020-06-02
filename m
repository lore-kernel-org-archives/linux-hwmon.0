Return-Path: <SRS0=V20P=7P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376B6C433DF
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Jun 2020 11:13:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15260206E2
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Jun 2020 11:13:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FAeuagD/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgFBLNd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Jun 2020 07:13:33 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23547 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725919AbgFBLNd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 2 Jun 2020 07:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591096412;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=mcGdkq8ccdORDcTXBpKNpsu+Jhtx9060LrIuVw/kpqE=;
        b=FAeuagD/SoYtyolaoZnVBeJFV9FMuiad1vHlWVSxbHf24vP899c2TXvT/EuYH/2FWtDafY
        yqogjrh2Qqgb4E8+f2pVUmRnrCKP8+4PINVANaZnLl/CE3AT2SAvDIYAwrpxW+GsGNnzBa
        iRLKO6Swm7gBBkVxJbPFFQgVhr1Rrgs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-RHRLySLzMNqVwLeoxSOJMw-1; Tue, 02 Jun 2020 07:13:30 -0400
X-MC-Unique: RHRLySLzMNqVwLeoxSOJMw-1
Received: by mail-ed1-f71.google.com with SMTP id i93so6468632edi.4
        for <linux-hwmon@vger.kernel.org>; Tue, 02 Jun 2020 04:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=mcGdkq8ccdORDcTXBpKNpsu+Jhtx9060LrIuVw/kpqE=;
        b=nAb9YzxIOXEbXo6T4ykB75maZ3N8NvWJOvrtw7bklT4wVVQls03HTxeafvj9WctmOS
         PCc00k3fa3hLVZGfT/60CuSWsMg6viuNW2RCUTqae2a3pUjxFNBdKXCga+ZGL2OTwQae
         yQbd/RNP+P7SjE8zo9otGpb6hEab4wqO9JcOJ2mRsosXHFk3nxX25XIG02Ix1EFUJzk3
         dPJeVU+2QfOvcEYsSEt0x606Qpoo0vSUbX2hdPwUYEStV2jU7WZKc/9AYBbvS+i6cvez
         H1m4IJgu9GqcTJQQGdsgX7gzQT+SQ4XyzEjcnWw3pCR8wcR0SQFxJuSzkcMTegrdC9ZD
         +kLw==
X-Gm-Message-State: AOAM530yu4X5lZofj7RIdQD26Hr2L7/XkxQFT43lB+WMOhVNlw65qT1O
        mVa0F9JKgq5MwHk2ELqtOOWxzIYpIHJZYAyagkT+II6YkKbpXmSvhHLkKTI68g+sQdDnwJWIMew
        MuRZZ1Gb1Fn6KLxO79/Mu5RE=
X-Received: by 2002:a17:906:2e55:: with SMTP id r21mr22505491eji.338.1591096408977;
        Tue, 02 Jun 2020 04:13:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9aUdItLHvjAGqk/HKw4j0VB0tvMsfY3zMxv2DWihZe5mGBiU9xAECc1qiW7tSoxMN0whHxA==
X-Received: by 2002:a17:906:2e55:: with SMTP id r21mr22505473eji.338.1591096408665;
        Tue, 02 Jun 2020 04:13:28 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id w28sm1487875ejk.75.2020.06.02.04.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 04:13:28 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org
From:   Hans de Goede <hdegoede@redhat.com>
Subject: RFC: Writing a small superio kernel driver to allow superio probing
 on locked down systems?
Message-ID: <0d7e97e0-fe78-163a-cdaf-825b9d0b50ee@redhat.com>
Date:   Tue, 2 Jun 2020 13:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi All,

Yesterday Fedora received this bug report:

https://bugzilla.redhat.com/show_bug.cgi?id=1842611

The problem reported here is that sensors-detect is denied
/dev/ports access when run on systems booted with secure-boot
enabled (and thus kernel-lockdown mode activated).

I've been thinking a bit about this issue and I was thinking
that maybe we could do a very small kernel driver to help
sensors-detect here (and which might also be useful for
other diagnostic purposes) ?

The idea would be to take the superio probe code from
sensors-detect and put it in a kernel module under
drivers/platform/x86.

This module will never autoload (sensors-detect will
need to modprobe it); and this module will offer a couple
of sysfs attributes, all of which will only be readable
by root (to avoid a regular user being able to trigger
the probe if the module does somehow end up being loaded
through some other mechanism).

When the first sysfs attr is read then the module will
do the probe and export the results through sysfs
attr. With the results being the super-io base address
(0x2e or 0x4e IIRC) and the device-id of the super-io
chip; and maybe some other info.

The above proposal is a bit fuzy wrt what info will be
exported through sysfs attributes because I've not looked
at super-io probing for ages, details to be filled in later.

The main purpose of this email is to test the waters
for the concept of such a module, so some questions:

1. Do you (hwmon and platform/x86 maintainers) think
that the proposed security comprise is ok?

IOW is it ok to allow root to trigger a super-io probe,
which involves poking some io-ports. Note this will
only allow root to cause the kernel to do the probe,
the probe itself and thus the exact io-port reads / writes
are fully under the kernel's control.

2. Do you think that the concept of having a little
helper module for this, with a simple sysfs interface
is ok?

Regards,

Hans

