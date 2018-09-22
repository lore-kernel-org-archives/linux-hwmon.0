Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f173.google.com ([209.85.215.173]:43161 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727993AbeIVWOs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Sep 2018 18:14:48 -0400
Received: by mail-pg1-f173.google.com with SMTP id q19-v6so6507136pgn.10
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Sep 2018 09:20:42 -0700 (PDT)
Subject: Re: NCT7802Y on Asus Fan Extension Card
To: Aleksandr Mezin <mezin.alexander@gmail.com>,
        linux-hwmon@vger.kernel.org
References: <CADnvcfKW_YCUNz_+42c5XApFUqYdij2qQ-cjBR_gHRjq4=aK4g@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ef58b84e-4926-cd6f-4f4a-6d8b31e2e465@roeck-us.net>
Date: Sat, 22 Sep 2018 09:20:38 -0700
MIME-Version: 1.0
In-Reply-To: <CADnvcfKW_YCUNz_+42c5XApFUqYdij2qQ-cjBR_gHRjq4=aK4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/22/2018 07:38 AM, Aleksandr Mezin wrote:
> Hello.
> 
> I'm trying to get monitoring working for Asus Fan Extension Card. The
> card has NCT7802Y on it. "modprobe nct7802" doesn't fail, the module
> loads, no errors in dmesg, but hwmon device doesn't show up too. What
> am I missing?
> 
> The motherboard is Asus Prime X299-A, with NCT6796D on it (mostly working).
> 
modprobe doesn't guarantee that the device is instantiated due to chip
limitations (its device ID register is not always accessible). We also
don't know if the chip is directly connected to an i2c bus visible to
the CPU, or to an embedded controller.

You could try to run i2cdetect to see if the chip is visible. If it is, you may
have to instantiate it manually. If it isn't, the chip is not visible to the CPU,
and you are out of luck.

What is wrong with the NCT6796D ?

Thanks,
Guenter
