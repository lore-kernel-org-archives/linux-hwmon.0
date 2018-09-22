Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-vs1-f46.google.com ([209.85.217.46]:44427 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728614AbeIVUc3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Sep 2018 16:32:29 -0400
Received: by mail-vs1-f46.google.com with SMTP id v18-v6so6156791vsl.11
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Sep 2018 07:38:41 -0700 (PDT)
MIME-Version: 1.0
From: Aleksandr Mezin <mezin.alexander@gmail.com>
Date: Sat, 22 Sep 2018 20:38:29 +0600
Message-ID: <CADnvcfKW_YCUNz_+42c5XApFUqYdij2qQ-cjBR_gHRjq4=aK4g@mail.gmail.com>
Subject: NCT7802Y on Asus Fan Extension Card
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello.

I'm trying to get monitoring working for Asus Fan Extension Card. The
card has NCT7802Y on it. "modprobe nct7802" doesn't fail, the module
loads, no errors in dmesg, but hwmon device doesn't show up too. What
am I missing?

The motherboard is Asus Prime X299-A, with NCT6796D on it (mostly working).
