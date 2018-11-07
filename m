Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46118 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbeKHFMR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Nov 2018 00:12:17 -0500
Received: by mail-lj1-f194.google.com with SMTP id v15-v6so7194082ljh.13
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Nov 2018 11:40:29 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id o3-v6sm285097lfe.22.2018.11.07.11.40.27
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Nov 2018 11:40:27 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id k19-v6so15820521lji.11
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Nov 2018 11:40:27 -0800 (PST)
MIME-Version: 1.0
References: <1541616529-6076-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1541616529-6076-1-git-send-email-linux@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 7 Nov 2018 11:40:10 -0800
Message-ID: <CAHk-=wjz-QUo1h=PW5DuNaRoatUrvrCX0Qc5=7rtro1VXzkDvw@mail.gmail.com>
Subject: Re: [GIT PULL] hwmon fixes for v4.20-rc2
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Nov 7, 2018 at 10:48 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> - Remove bogus __init annotations in ibmpowernv driver
> - Fix double-free in error handling of __hwmon_device_register()

Pulled,

             Linus
