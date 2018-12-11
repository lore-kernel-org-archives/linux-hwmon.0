Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt1-f182.google.com ([209.85.160.182]:33015 "EHLO
        mail-qt1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbeLKUbL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Dec 2018 15:31:11 -0500
Received: by mail-qt1-f182.google.com with SMTP id l11so18052256qtp.0
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Dec 2018 12:31:10 -0800 (PST)
MIME-Version: 1.0
From: Ranran <ranshalit@gmail.com>
Date: Tue, 11 Dec 2018 22:30:58 +0200
Message-ID: <CAJ2oMhJgfNZbfsnnyUdRQLUdt9xiE4++_C7R8a_sFsyy7PxWPg@mail.gmail.com>
Subject: How to detect which device is mapped to hwmonX ?
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello,

I have several nodes /sys/class/hwmon/hwmonX ,
but checking the fields I could not find yet a way how to identify a
device (for example i2c address) to the given mapping of hwmonX.

Is there a way to find out which device is mapped to which hwmonX ?

Thanks,
ran
