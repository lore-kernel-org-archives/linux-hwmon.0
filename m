Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.fuzziesquirrel.com ([173.167.31.197]:35032 "EHLO
        bajor.fuzziesquirrel.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752474AbcL2NKG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Dec 2016 08:10:06 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: software emulated thresholds?
Message-Id: <63B6B20E-D32F-4A9B-8633-F3A20B3B45D5@fuzziesquirrel.com>
Date: Thu, 29 Dec 2016 08:02:11 -0500
To: linux-hwmon@vger.kernel.org
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Has anyone ever asked about software emulation of threshold limits and alarms?  I’m writing a dbus application that bridges libsensors to dbus but I’d like to provide thresholds whether or not they are implemented in hardware.

I have two main tripping points:

1 - not all chips implement limits and alarms
2 - alarms can either be global or channel specific

Any thoughts on how to tackle this?  Or is it just a bad idea in the first place?

thx - brad