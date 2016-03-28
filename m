Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from fallback2.mail.ru ([94.100.179.22]:54379 "EHLO
	fallback2.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755441AbcC1WBf (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 28 Mar 2016 18:01:35 -0400
Received: from smtp41.i.mail.ru (smtp41.i.mail.ru [94.100.177.101])
	by fallback2.mail.ru (mPOP.Fallback_MX) with ESMTP id 269366DD73CB
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Mar 2016 00:05:44 +0300 (MSK)
Date: Mon, 28 Mar 2016 23:04:55 +0200
From: Trek <trek00@inbox.ru>
To: Huang Rui <ray.huang@amd.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: fam15h_power on a4-4000?
Message-ID: <20160328230455.3f7878ba@enterprise>
In-Reply-To: <20160328021922.GA11559@hr-amur2>
References: <20160327201340.152ff142@enterprise>
	<20160327185131.GA32631@roeck-us.net>
	<20160328021922.GA11559@hr-amur2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, 28 Mar 2016 10:19:23 +0800
Huang Rui <ray.huang@amd.com> wrote:

> Trek, have you tested it on Fam15h Models 10h-1fh platforms? I seem to
> remember I tried it on that type of platforms, but the test data was
> not right. So I didn't expose it at that time.

thanks for your replies, I have just compiled the module for my kernel
version (3.16) with the patch applied and it returns these values:

fam15h_power-pci-00c4
Adapter: PCI adapter
power1:       10.56 W  (crit =  65.18 W)

the crit value is correct (the TDP of the a4-4000 is 65W) but the
actual usage is "fixed", always the same even at 100% usage of all cpu
cores and the integrated gpu

so the readings are incorrect and the patch is useless


I have strange readings also for the other drivers concerned with
monitoring my cpu/gpu:

k10temp-pci-00c3
Adapter: PCI adapter
temp1:         +0.0 C  (high = +70.0 C)
                       (crit = +70.0 C, hyst = +69.0 C)

radeon-pci-0008
Adapter: PCI adapter
temp1:         -1.0 C  (crit = +120.0 C, hyst = +90.0 C)

but at least they are incremented under full load and, reading the docs,
they are not really physical degrees, but some other measuring unit

thanks & c-ya!
